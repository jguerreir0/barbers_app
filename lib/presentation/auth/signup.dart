import 'package:barberz/controllers/auth_controller.dart';
import 'package:barberz/presentation/auth/components/app_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'components/auth_components.dart';

class SignUpPage extends GetWidget<AuthController> {
  final _formKey = GlobalKey<FormState>();
  final Map<String, String> _mapParams = {};

  _validateFields() {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    _formKey.currentState!.save();

    controller.signUp(_mapParams['email']!, _mapParams['password']!);

    _mapParams.clear();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
        body: Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextFieldLabeled(
            label: 'Email',
            prefixIcon: Icon(Icons.email),
            onSaved: (value) => _mapParams.putIfAbsent('email', () => value!),
            validator: (value) {
              if (value!.isEmpty) {
                return "Email não pode ser vazio";
              }
              if (!GetUtils.isEmail(value)) {
                return "Email is not valid";
              }

              return null;
            },
          ),
          const SizedBox(height: 8),
          TextFieldLabeled(
              label: 'Password',
              onSaved: (value) =>
                  _mapParams.putIfAbsent('password', () => value!),
              validator: (value) {
                if (value!.isEmpty) {
                  return "Password não pode ser vazia";
                }

                return null;
              },
              prefixIcon: Icon(Icons.vpn_key),
              obscureText: true),
          const SizedBox(height: 30),
          ActionButton(text: 'Registar', onTap: _validateFields),
        ],
      ),
    ));
  }
}
