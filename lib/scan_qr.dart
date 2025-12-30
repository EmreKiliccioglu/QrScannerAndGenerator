import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class ScanQrCode extends StatefulWidget {
  const ScanQrCode({super.key});

  @override
  State<ScanQrCode> createState() => _ScanQrCodeState();
}

class _ScanQrCodeState extends State<ScanQrCode> {
  String qrCodeResult = "Not Yet Scanned";
  bool _isScanned = false;

  Future<void> scanQR() async {
    _isScanned = false;

    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => Scaffold(
          appBar: AppBar(
              title: const Text('Scan QR Code'),
              backgroundColor: Colors.lime[300],
              centerTitle: true
          ),
          body: MobileScanner(
            onDetect: (barcodeCapture) {
              if (_isScanned) return;

              final String? code =
                  barcodeCapture.barcodes.first.rawValue;

              if (code != null) {
                _isScanned = true;
                Navigator.pop(context, code);
              }
            },
          ),
        ),
      ),
    ).then((result) {
      if (!mounted) return;
      if (result != null) {
        setState(() {
          qrCodeResult = result.toString();
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Scan QR Code'),
          backgroundColor: Colors.lime[300],
          centerTitle: true
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 30),
            Text(qrCodeResult, style: const TextStyle(color: Colors.black)),
            const SizedBox(height: 30),
            OutlinedButton.icon(
              onPressed: () {
                scanQR();
              },
              icon: const Icon(Icons.camera, color: Colors.lime),
              label: const Text(
                'Scan QR Code',
                style: TextStyle(color: Colors.black),
              ),
              style: OutlinedButton.styleFrom(
                side: const BorderSide(color: Colors.lime, width: 2),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 14,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
