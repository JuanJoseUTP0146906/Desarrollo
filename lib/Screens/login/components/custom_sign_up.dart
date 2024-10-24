import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'sign_up_form.dart'; // Asegúrate de que este archivo exista y esté definido correctamente

// Custom Sign Up Dialog
Future<Object?> customSignupDialog(BuildContext context, {required ValueChanged onClosed}) {
  return showGeneralDialog(
    barrierDismissible: true,
    barrierLabel: "Sign up",
    context: context,
    transitionDuration: const Duration(milliseconds: 400),
    transitionBuilder: (context, animation, secondaryAnimation, child) {
      final tween = Tween<Offset>(begin: const Offset(0, -1), end: Offset.zero);
      return SlideTransition(
        position: tween.animate(
          CurvedAnimation(parent: animation, curve: Curves.easeInOut),
        ),
        child: child,
      );
    },
    pageBuilder: (context, _, __) => Center(
      child: Container(
        height: 620,
        margin: const EdgeInsets.symmetric(horizontal: 16),
        padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 16),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.95),
          borderRadius: const BorderRadius.all(Radius.circular(40)),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          resizeToAvoidBottomInset: false,
          body: Stack(
            clipBehavior: Clip.none,
            children: [
              Column(
                children: [
                  const Text(
                    "Sign Up",
                    style: TextStyle(fontSize: 34, fontFamily: "Poppins"),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 16),
                    child: Text(
                      "Create your account",
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SignUpForm(), // Asegúrate de que esta clase esté correctamente definida
                  const Row(
                    children: [
                      Expanded(child: Divider()),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: Text(
                          "OR",
                          style: TextStyle(color: Colors.black26),
                        ),
                      ),
                      Expanded(child: Divider()),
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 20.0),
                    child: Text(
                      "Sign up with Email, Apple or Google",
                      style: TextStyle(color: Colors.black54),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                        padding: EdgeInsets.zero,
                        onPressed: () {
                          // Implementar el inicio de sesión con email
                        },
                        icon: SvgPicture.asset(
                          "assets/icons/mail.svg",
                          height: 54,
                          width: 54,
                        ),
                      ),
                      IconButton(
                        padding: EdgeInsets.zero,
                        onPressed: () {
                          // Implementar el inicio de sesión con Apple
                        },
                        icon: SvgPicture.asset(
                          "assets/icons/apple.svg",
                          height: 54,
                          width: 54,
                        ),
                      ),
                      IconButton(
                        padding: EdgeInsets.zero,
                        onPressed: () {
                          // Implementar el inicio de sesión con Google
                        },
                        icon: SvgPicture.asset(
                          "assets/icons/google.svg",
                          height: 54,
                          width: 54,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const Positioned(
                left: 0,
                right: 0,
                bottom: -48,
                child: CircleAvatar(
                  radius: 16,
                  backgroundColor: Colors.white,
                  child: Icon(Icons.close, color: Colors.black),
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  ).then(onClosed);
}
