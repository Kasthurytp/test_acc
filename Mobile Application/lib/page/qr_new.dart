import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class QRNew extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _QRNewState();
}

String scannedQrCode = '';

class _QRNewState extends State<QRNew> {
  @override
  Widget build(BuildContext context) {
    scanQR();
    return ElevatedButton(
      onPressed: () async {
        await scanQR();
      },
      child: Text('Scan QR'),
    );
  }

  @override
  Future<void> scanQR() async {
    try {
      scannedQrCode = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.QR);
      print('this is it: ' + scannedQrCode);
    } on PlatformException {}
  }
}
