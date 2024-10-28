import 'package:flutter/material.dart';
import 'sign_in_form.dart'; // Asegúrate de que este archivo exista y esté definido correctamente
import 'package:flutter_svg/flutter_svg.dart';

// Custom Sign In Dialog
Future<Object?> customSigninDialog(BuildContext context, {required ValueChanged onClosed}) {
  return showGeneralDialog(
    barrierDismissible: true,
    barrierLabel: "Inicia Sesion",
    context: context,
    transitionDuration: const Duration(milliseconds: 400),
    transitionBuilder: (context, animation, secondaryAnimation, child) {
      Tween<Offset> tween = Tween(begin: const Offset(0, -1), end: Offset.zero);
      return SlideTransition(
        position: tween.animate(CurvedAnimation(parent: animation, curve: Curves.easeInOut)),
        child: child,
      );
    },
    pageBuilder: (context, _, __) {
      final screenHeight = MediaQuery.of(context).size.height;
      final screenWidth = MediaQuery.of(context).size.width;

      return Center(
        child: Container(
          height: screenHeight * 0.8, // Ajusta el tamaño según la altura de la pantalla
          width: screenWidth * 0.9, // Ajusta el tamaño según el ancho de la pantalla
          margin: const EdgeInsets.symmetric(horizontal: 16),
          padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 16),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.95),
            borderRadius: const BorderRadius.all(Radius.circular(40)),
          ),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            resizeToAvoidBottomInset: false, // evita errores de desbordamiento cuando aparece el teclado
            body: Stack(
              clipBehavior: Clip.none,
              children: [
                Column(children: [
                  const Text(
                    "Inicia Sesion",
                    style: TextStyle(fontSize: 30, fontFamily: "Poppins"),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 16),
                    child: Text(
                      " ",
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SignInForm(),
                  const Row(
                    children: [
                      Expanded(
                        child: Divider(),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: Text(
                          "OR",
                          style: TextStyle(color: Colors.black26),
                        ),
                      ),
                      Expanded(
                        child: Divider(),
                      ),
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 20.0),
                    child: Text("Sign up with Email, Apple or Google",
                        style: TextStyle(color: Colors.black54)),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                          padding: EdgeInsets.zero,
                          onPressed: () {},
                          icon: SvgPicture.asset(
                            "assets/icons/google.svg",
                            height: 64,
                            width: 64,
                          )),
                      IconButton(
                          padding: EdgeInsets.zero,
                          onPressed: () {},
                          icon: SvgPicture.asset(
                            "assets/icons/facebook.svg",
                            height: 64,
                            width: 64,
                          )),
                      IconButton(
                          padding: EdgeInsets.zero,
                          onPressed: () {},
                          icon: SvgPicture.asset(
                            "assets/icons/mail.svg",
                            height: 64,
                            width: 64,
                          ))
                    ],
                  )
                ]),
                const Positioned(
                  left: 0,
                  right: 0,
                  bottom: -48,
                  child: CircleAvatar(
                    radius: 16,
                    backgroundColor: Colors.white,
                    child: Icon(Icons.close, color: Colors.black),
                  ),
                )
              ],
            ),
          ),
        ),
      );
    },
  ).then(onClosed);
}
