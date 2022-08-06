//import 'dart:html';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/page/detailEntryCheck_in.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';


class QRScanPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _QRScanPageState();
}

class _QRScanPageState extends State<QRScanPage> {
  final qrKey = GlobalKey(debugLabel: 'QR');

  Barcode? barcode;
  QRViewController? controller;



  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  void reassemble() async {
    super.reassemble();

    if (Platform.isAndroid) {
      await controller!.pauseCamera();
    }
    await controller!.resumeCamera();
  }

  @override
  Widget build(BuildContext context) {
    // SchedulerBinding.instance!
    //     .addPostFrameCallback((_) => showMyDialog(context));
    return SafeArea(
      child: Scaffold(
        body: Builder(
          builder: (context) {
            return Stack(
              alignment: Alignment.center,
              children: [
                buildScanPage(),
                SizedBox(
                  height: 80,
                ),
                SizedBox(
                    //kh did to bring qr view to center sized box 1:1
                    height: MediaQuery.of(context).size.width * 1,
                    child: buildQrView(context)),
                Positioned(
                    bottom: 10, child: buildResult()), //scanned qr details
                Positioned(
                    bottom: 60, child: buildControlButtons()), //alert message
              ],
            );
          },
        ),
      ),
    );
  }

  // Future<void> showMyDialog(BuildContext context) async {
  //   //This showDialog() will create  an overlay top of the HomePage() screen
  //   return showDialog<void>(
  //     context: context,
  //     barrierDismissible: false, // user must tap button!
  //     builder: (BuildContext context) {
  //       return AlertDialog(
  //         content: const Text(
  //             "COVID Safe Check-in will only use\nyour device camera to scan QR\ncodes for contact tracing purposes.\nNo images will be collected or\nshared as part of your check-in. On\nthis basis, we will now ask for access\nto your camera."),
  //         actions: [
  //           TextButton(
  //             child: const Text('OK'),
  //             onPressed: () => Navigator.pop(context, true),
  //           ),
  //         ],
  //       );
  //     },
  //   );
  // }

  Widget buildScanPage() => Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 8),
            Container(
                padding: EdgeInsets.only(top: 0),
                child: Column(
                  children: [
                    Text(
                      'Scan COVID Safe code',
                      style: TextStyle(
                          color: Color(0xFF2689FB),
                          fontSize: 20,
                          height: 1.5,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      "Put your camera up to the venue's COVID\n Safe Check-in QR code.",
                      style: TextStyle(
                          color: Color(0xFF2689FB), fontSize: 14, height: 1.5),
                      textAlign: TextAlign.center,
                    ),
                  ],
                )),
            const SizedBox(height: 18),
          ],
        ),
      );

  Widget buildControlButtons() => Container(
        padding: EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.white24,
        ),
        child: Row(
          //mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            IconButton(
              icon: FutureBuilder<bool?>(
                future: controller?.getFlashStatus(),
                builder: (context, snapshot) {
                  if (snapshot.data != null) {
                    return Icon(
                        snapshot.data! ? Icons.flash_on : Icons.flash_off);
                  } else {
                    return Container();
                  }
                },
              ),
              onPressed: () async {
                await controller?.toggleFlash();
                setState(() {});
              },
            )
          ],
        ),
      );

  Widget buildResult() {
    return Container(
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.white24,
        ),
        child: getWidget()
        // Text(
        //   barcode != null ? '${barcode!.code}' : 'Scan a code!',
        //   maxLines: 3,
        // )

        );
  }

  Widget buildQrView(BuildContext context) => QRView(
        key: qrKey,
        onQRViewCreated: onQRViewCreated,
        overlay: QrScannerOverlayShape(
            // borderColor: ,
            borderRadius: 10,
            borderLength: 20,
            borderWidth: 10,
            cutOutSize: MediaQuery.of(context).size.width * 0.8),
      );
  void onQRViewCreated(QRViewController controller) {
    setState(() => this.controller = controller);

    controller.scannedDataStream
        .listen((barcode) => setState(() => this.barcode = barcode));
  }

  Widget getWidget() {
    if (barcode != null) {
      //SchedulerBinding.instance!.addPostFrameCallback((_) {
      Future.delayed(Duration.zero, () async {
        Navigator.pushReplacement(
            context,
            new MaterialPageRoute(
                builder: (context) =>
                    detail_entry_continue(qrCode: '${barcode!.code}')));
      });
      //});
      // add your code here.

      //   Navigator.pushReplacement(
      //       context,
      //       new MaterialPageRoute(
      //           builder: (context) => detail_entry_continue()));
      // });
      // Navigator.pushReplacement(
      //     context,
      //     MaterialPageRoute(
      //         builder: (context) =>
      //             detail_entry_continue(/*qrCode: '${barcode!.code}'*/)));
      return Column();
    } else {
      return Text(
        'Scan a code!',
        maxLines: 3,
      );
    }
  }
}
