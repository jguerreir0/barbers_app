import 'package:flutter/material.dart';

class TextFieldLabeled extends StatelessWidget {
  final String label;
  final Icon? prefixIcon;
  final bool obscureText;
  final FormFieldValidator<String>? validator;
  final FormFieldSetter<String>? onSaved;

  const TextFieldLabeled(
      {Key? key,
      required this.label,
      this.prefixIcon,
      this.obscureText = false,
      this.validator,
      this.onSaved})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(label,
              style: TextStyle(
                  fontSize: 15,
                  color: Colors.white,
                  fontWeight: FontWeight.w700)),
        ),
        TextFormField(
          obscureText: obscureText,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: validator,
          onSaved: onSaved,
          decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              prefixIcon: prefixIcon,
              enabledBorder: OutlineInputBorder(
                  gapPadding: 2,
                  borderSide: BorderSide(color: Colors.grey.shade300),
                  borderRadius: BorderRadius.circular(5)),
              focusedBorder: OutlineInputBorder(
                  gapPadding: 2,
                  borderSide: BorderSide(color: Colors.black),
                  borderRadius: BorderRadius.circular(5)),
              border: OutlineInputBorder(
                  gapPadding: 2,
                  borderSide: BorderSide(color: Colors.grey.shade300),
                  borderRadius: BorderRadius.circular(5))),
        ),
      ],
    );
  }
}
