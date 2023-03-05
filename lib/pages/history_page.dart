import 'package:codigo6_qr/db/db_admin.dart';
import 'package:codigo6_qr/models/qr_model.dart';
import 'package:codigo6_qr/ui/widgets/item_widget.dart';
import 'package:flutter/material.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 20.0),
            const Text(
              "Historial general",
              style: TextStyle(
                color: Colors.white,
                fontSize: 22.0,
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10.0),
            const Text(
              "Listado general de tus QR registrados.",
              style: TextStyle(
                color: Colors.white70,
                fontSize: 16.0,
                fontWeight: FontWeight.w400,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20.0),
            Expanded(
              child: _buildFutureBuilder(),
            )
          ],
        ),
      ),
    );
  }

  _buildFutureBuilder() {
    return FutureBuilder(
      future: DBAdmin().getQRList(),
      builder: (BuildContext context, AsyncSnapshot snap) {
        if (snap.hasData) {
          List<QRModel> qrList = snap.data;
          return qrList.isEmpty ? _buildEmptyList() : _buildList(qrList);
        }
        return _buildWhiteLoader();
      },
    );
  }

  _buildWhiteLoader() {
    return const Center(
      child: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(
          Colors.white,
        ),
      ),
    );
  }

  _buildEmptyList() {
    return const Center(
      child: Text(
        "No tienes QR Registrados",
        style: TextStyle(
          color: Colors.white54,
          fontSize: 14.0,
        ),
      ),
    );
  }

  _buildList(List<QRModel> qrList) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: qrList.length,
            itemBuilder: (BuildContext context, int index) {
              QRModel item = qrList[index];
              bool isUrl = qrList[index].url.contains("http");

              return ItemWidget(
                item: item,
                isUrl: isUrl,
              );
            },
          ),
        ],
      ),
    );
  }
}
