import 'package:codigo6_qr/models/qr_model.dart';
import 'package:codigo6_qr/ui/widgets/qr_detail_modal.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ItemWidget extends StatelessWidget {
  final QRModel item;
  final bool isUrl;

  const ItemWidget({
    Key? key,
    required this.item,
    required this.isUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void showFormQR(QRModel item) {
      showModalBottomSheet(
        context: context,
        backgroundColor: Colors.transparent,
        isScrollControlled: true,
        builder: (BuildContext context) {
          return Padding(
            padding: MediaQuery.of(context).viewInsets,
            child: QrDetailModal(item: item),
          );
        },
      );
    }

    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 10.0,
        horizontal: 20.0,
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 12.0,
        vertical: 14.0,
      ),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.09),
        borderRadius: BorderRadius.circular(14.0),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Icon(
                      Icons.calendar_month,
                      size: 14.0,
                      color: Colors.white54,
                    ),
                    Text(
                      " ${item.datetime}",
                      style: const TextStyle(
                        color: Colors.white54,
                        fontSize: 14.0,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 3),
                Text(
                  item.title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  item.observation,
                  style: const TextStyle(
                    color: Colors.white54,
                    fontSize: 14.0,
                  ),
                ),
              ],
            ),
          ),
          isUrl
              ? IconButton(
                  onPressed: () {
                    Uri uri = Uri.parse(item.url);
                    launchUrl(uri, mode: LaunchMode.externalApplication);
                  },
                  icon: const Icon(
                    Icons.link,
                    color: Colors.white,
                  ),
                )
              : const SizedBox(),
          IconButton(
            onPressed: () => showFormQR(item),
            icon: const Icon(
              Icons.qr_code,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
