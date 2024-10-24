import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class AnimatedBtn extends StatelessWidget {
  const AnimatedBtn({
    super.key,
    required RiveAnimationController btnAnimationController,
    required this.press,
  }) : _btnAnimationController = btnAnimationController;

  final RiveAnimationController _btnAnimationController;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    // Obtén el tema actual
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return GestureDetector(
      onTap: press,
      child: SizedBox(
        height: 64,
        width: 260,
        child: Stack(children: [
          // Aquí puedes cambiar el color del fondo según el modo
          RiveAnimation.asset(
            "assets/RiveAssets/button.riv",
            controllers: [_btnAnimationController],
          ),
          Positioned.fill(
            top: 8,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  CupertinoIcons.arrow_right,
                  color: isDarkMode ? Colors.grey : Colors.black, // Cambia el color del icono
                ),
                SizedBox(
                  width: 8,
                ),
                Text(
                  "Inicia sesion",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: isDarkMode ? Colors.grey : Colors.black, // Cambia el color del texto
                  ),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
