import 'package:flutter/material.dart';
import 'package:nfc_manager/nfc_manager.dart';
import 'package:toastification/toastification.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('NFC Reader'),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                _startNFCReading(context);
              },
              child: const Text('Check In'),
            ),
          ],
        ),
      ),
    );
  }

  void _startNFCReading(context) async {
    try {
      bool isAvailable = await NfcManager.instance.isAvailable();

      //We first check if NFC is available on the device.
      if (isAvailable) {
        //If NFC is available, start an NFC session and listen for NFC tags to be discovered.
        NfcManager.instance.startSession(
          onDiscovered: (NfcTag tag) async {
            showToast("NFC Tag Detected: ${tag.data}", context);
            // Process NFC tag, When an NFC tag is discovered, print its data to the console.
            debugPrint('NFC Tag Detected: ${tag.data}');
          },
        );
      } else {
        showToast("NFC not available", context);
        debugPrint('NFC not available.');
      }
    } catch (e) {
      showToast("Error reading NFC: $e", context);
      debugPrint('Error reading NFC: $e');
    }
  }
}

void showToast(String text, context) => toastification.show(
      context: context,
      title: Text(text),
      alignment: Alignment.bottomCenter,
      primaryColor: Colors.blue,
      dragToClose: true,
      showProgressBar: true,
      icon: const Icon(Icons.info_outlined),
      autoCloseDuration: const Duration(seconds: 10),
    );
