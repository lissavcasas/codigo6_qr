import 'package:codigo6_qr/ui/general/colors.dart';
import 'package:flutter/material.dart';

class CommonButtonWidget extends StatelessWidget {
  final Function? onPressed;
  final String text;

  const CommonButtonWidget({
    Key? key,
    required this.onPressed,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 48.0,
      child: ElevatedButton(
        onPressed: onPressed != null
            ? () {
                onPressed!();
              }
            : null,
        style: ElevatedButton.styleFrom(
          backgroundColor: kBrandPrimaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14.0),
          ),
        ),
        child: Text(
          text,
          style: const TextStyle(
            color: kBrandSecondaryColor,
            fontSize: 16.0,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}
