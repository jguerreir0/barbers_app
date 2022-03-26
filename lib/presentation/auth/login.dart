import 'package:barberz/controllers/auth_controller.dart';
import 'package:barberz/presentation/auth/components/app_scaffold.dart';
import 'package:barberz/presentation/auth/components/signup_button.dart';
import 'package:barberz/routes.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import 'components/auth_components.dart';

class LoginPage extends GetWidget<AuthController> {
  final _formKey = GlobalKey<FormState>();
  final Map<String, String> _mapParams = {};

  _validateFields() {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    _formKey.currentState!.save();

    controller.login(_mapParams['email']!, _mapParams['password']!);

    _mapParams.clear();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
        body: Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
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
          ActionButton(text: 'Entrar', onTap: _validateFields),
          const SizedBox(height: 12),
          InkWell(
            onTap: () => Get.toNamed(Routes.signup),
            child: Text('Se ainda não tem conta, clique aqui para se registar'),
          ),
          const SizedBox(height: 30),
          SignInButton(
              color: Colors.white,
              loginType: LoginType.Google,
              onTap: () {},
              faIcon: FaIcon(
                FontAwesomeIcons.google,
                size: 23.45,
              )),
          const SizedBox(height: 12),
          SignInButton(
              color: Color.fromRGBO(66, 73, 168, 1),
              onTap: () => controller.signInWithFacebook(),
              loginType: LoginType.Facebook,
              faIcon: FaIcon(FontAwesomeIcons.facebook,
                  color: Colors.white, size: 25)),
        ],
      ),
    ));
  }
}
