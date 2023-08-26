import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';

void main() => runApp(const XylophoneApp());

class XylophoneApp extends StatefulWidget {
  const XylophoneApp({super.key});

  @override
  State<XylophoneApp> createState() => _XylophoneAppState();
}

class _XylophoneAppState extends State<XylophoneApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              getView(1, Colors.red),
              getView(2, Colors.yellow),
              getView(3, Colors.green),
              getView(4, Colors.lime),
              getView(5, Colors.brown),
              getView(6, Colors.blueAccent),
              getView(7, Colors.purpleAccent),
            ],
          ),
        ),
      ),
    );
  }
}

Widget getView(int pos, Color color) {
  return Expanded(
      child: TextButton(
    style: TextButton.styleFrom(
      backgroundColor: color, // Background Color
    ),
    onPressed: () {
      playSound(pos);
    },
    child: const Text(''),
  ));
}

void playSound(int pos) async {
  final player = AudioPlayer();
  String audioasset = "assets/note$pos.mp3";
  ByteData bytes = await rootBundle.load(audioasset); //load sound from assets
  Uint8List soundbytes =
      bytes.buffer.asUint8List(bytes.offsetInBytes, bytes.lengthInBytes);
  player.play(BytesSource(soundbytes));
}
