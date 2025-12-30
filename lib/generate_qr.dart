import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class GenerateQrCode extends StatefulWidget {
  const GenerateQrCode({super.key});

  @override
  State<GenerateQrCode> createState() => _GenerateQrCodeState();
}

class _GenerateQrCodeState extends State<GenerateQrCode> {

  TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Generate QR Code'),
        backgroundColor: Colors.lime[300],
        centerTitle: true
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if(textEditingController.text.isNotEmpty)
                QrImageView(
                    data: textEditingController.text,
                    size:200),
              SizedBox(height: 18),
              Container(
                padding: EdgeInsets.only(left: 10,right: 10),
                child: TextField(
                  controller: textEditingController,
                  decoration: InputDecoration(
                    hintText: 'Enter Your Data',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),),
                    labelText: 'Enter Your Data'
                  ),
                ),
              ),
              SizedBox(height: 18),
              OutlinedButton.icon(
                onPressed: () {
                  setState(() {

                  });
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
      ),
    );
  }
}
