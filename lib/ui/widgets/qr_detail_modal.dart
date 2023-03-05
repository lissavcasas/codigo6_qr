import 'package:codigo6_qr/models/qr_model.dart';
import 'package:flutter/material.dart';

class QrDetailModal extends StatelessWidget {
  final QRModel item;

  const QrDetailModal({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double separation = 12.0;

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 12.0,
      ),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(36.0),
          topRight: Radius.circular(36.0),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            item.title,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 24.0,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(height: separation),
          Text(
            item.observation,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 16.0,
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(height: separation),
          Image.asset(
            "assets/images/qr.png",
            width: width * 0.40,
            color: Colors.black,
          ),
          SizedBox(height: separation),
          Text(
            " ${item.datetime}",
            style: const TextStyle(
              color: Colors.black,
              fontSize: 14.0,
            ),
          ),
          SizedBox(height: separation),
        ],
      ),
    );
  }
}
