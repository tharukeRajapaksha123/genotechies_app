// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:genotechies_app/theme/constants.dart';

class MainButton extends StatelessWidget {
  final Color color;
  final String text;
  final Icon? icon;
  final Color textColor;
  final bool border;
  final VoidCallback onPressed;
  const MainButton({
    Key? key,
    this.border = false,
    this.color = primaryColor,
    required this.text,
    this.textColor = Colors.white,
    required this.onPressed,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      minWidth: MediaQuery.of(context).size.width,
      height: kToolbarHeight,
      color: color,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: border
            ? const BorderSide(width: 1.0, color: primaryColor)
            : BorderSide.none,
      ),
      onPressed: onPressed,
      child: icon != null
          ? Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                icon!,
                const SizedBox(
                  width: defaultHeight,
                ),
                Text(
                  text,
                  style: TextStyle(
                    color: textColor,
                    fontSize: mediumFontSize,
                  ),
                ),
              ],
            )
          : Text(
              text,
              style: TextStyle(
                color: textColor,
                fontSize: mediumFontSize,
              ),
            ),
    );
  }
}
