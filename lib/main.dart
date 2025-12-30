import 'package:flutter/material.dart';
import 'package:scanner/scan_qr.dart';
import 'generate_qr.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'QR Code Scanner and Generator',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: Colors.lime),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('QR Code Scanner And Generator'),
        backgroundColor: Colors.lime[300],
        centerTitle: true
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            OutlinedButton.icon(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) => const ScanQrCode()),
                );
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

            SizedBox(height: 40),

            OutlinedButton.icon(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) => const GenerateQrCode()),
                );
              },
              icon: const Icon(Icons.qr_code_scanner, color: Colors.lime),
              label: const Text(
                'Generate QR Code',
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
