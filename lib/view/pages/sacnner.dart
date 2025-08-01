import 'dart:io';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:permission_handler/permission_handler.dart';

class CardScannerPage extends StatefulWidget {
  @override
  _CardScannerPageState createState() => _CardScannerPageState();
}

class _CardScannerPageState extends State<CardScannerPage> {
  late CameraController _cameraController;
  bool _isCameraInitialized = false;
  String scannedText = "";

  @override
  void initState() {
    super.initState();
    _initCamera();
  }

  Future<void> _initCamera() async {
    // Kamera permission so‘ralmoqda
    var status = await Permission.camera.request();

    if (status.isGranted) {
      final cameras = await availableCameras();
      _cameraController = CameraController(
        cameras.first,
        ResolutionPreset.high,
      );
      await _cameraController.initialize();
      setState(() {
        _isCameraInitialized = true;
      });
    } else {
      // Agar permission rad etilsa
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Kameraga ruxsat berilmadi")),
      );
    }
  }

  Future<void> _captureAndRecognize() async {
    final image = await _cameraController.takePicture();

    final inputImage = InputImage.fromFilePath(image.path);
    final textRecognizer = TextRecognizer(script: TextRecognitionScript.latin);
    final recognizedText = await textRecognizer.processImage(inputImage);

    String result = "";
    for (TextBlock block in recognizedText.blocks) {
      for (TextLine line in block.lines) {
        result += "${line.text}\n";
      }
    }

    setState(() {
      scannedText = result;
    });

    textRecognizer.close();
  }

  @override
  void dispose() {
    if (_isCameraInitialized) {
      _cameraController.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Card Scanner")),
      body: Column(
        children: [
          _isCameraInitialized
              ? AspectRatio(
            aspectRatio: _cameraController.value.aspectRatio,
            child: CameraPreview(_cameraController),
          )
              : Center(child: CircularProgressIndicator()),
          ElevatedButton(
            onPressed: _isCameraInitialized ? _captureAndRecognize : null,
            child: Text("Rasmga olish va o'qish"),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Text(scannedText),
            ),
          ),
        ],
      ),
    );
  }
}
