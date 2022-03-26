import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

enum LoginType {
  Google,
  Facebook,
}

class SignInButton extends StatefulWidget {
  final FaIcon faIcon;
  final LoginType loginType;
  final Color color;
  final VoidCallback onTap;

  SignInButton(
      {Key? key,
      required this.faIcon,
      required this.loginType,
      required this.color,
      required this.onTap})
      : super(key: key);

  @override
  _SignInButtonState createState() => _SignInButtonState();
}

getTextColor(LoginType type) {
  switch (type) {
    case LoginType.Google:
      return Colors.black;

    case LoginType.Facebook:
      return Colors.white;
  }
}

class _SignInButtonState extends State<SignInButton> {
  bool isLoading = false;
  //FirebaseService service = new FirebaseService();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width * 0.8,
      child: OutlinedButton.icon(
        icon: this.widget.faIcon,
        onPressed: () async {
          setState(() {
            isLoading = true;
          });
          this.widget.onTap();
          setState(() {
            isLoading = false;
          });
        },
        label: !isLoading
            ? Text(
                this.widget.loginType == LoginType.Google
                    ? 'Google'
                    : 'Facebook',
                style: TextStyle(
                    color: getTextColor(this.widget.loginType),
                    fontWeight: FontWeight.bold),
              )
            : Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  child: CircularProgressIndicator(
                    strokeWidth: 1.4,
                  ),
                  height: 20,
                  width: 20,
                ),
              ),
        style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.all<Color>(this.widget.color),
            side: MaterialStateProperty.all<BorderSide>(BorderSide.none)),
      ),
    );
  }
}
