import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class ScannQrCode extends StatefulWidget {
  const ScannQrCode({super.key});

  @override
  State<ScannQrCode> createState() => _ScannQrCodeState();
}

class _ScannQrCodeState extends State<ScannQrCode> {
  String qrResult="Scanned Data will appear here";

  Future<void> scanQR() async{
    try {
      final qrCode = await FlutterBarcodeScanner.scanBarcode("#ff6666", "Cancel", true, ScanMode.QR);
      if(!mounted)return;
      setState(() {
        this.qrResult=qrCode.toString();
      });
    }on PlatformException {
      qrResult = "Fail to read QR Code";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("QR Code Scanner"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
              Text("$qrResult",style: TextStyle(color: Colors.black),),
              ElevatedButton(onPressed: (){}, child: Text("Scan Code"))
          ],
        ),
      ),
    );
  }
}