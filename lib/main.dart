import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: XyloPhone(),
        ),
      ),
    );
  }
}

class XyloPhone extends StatefulWidget {
  @override
  State<XyloPhone> createState() => _XyloPhoneState();
}

class _XyloPhoneState extends State<XyloPhone> {
  Future<void> playSound(int number) async {
    final player = AudioPlayer();
    await player.play(AssetSource('note$number.wav'));
  }

  Widget buildKey({int soundNumber, Color color}) {
    return Expanded(
      child: TextButton(
        style: TextButton.styleFrom(backgroundColor: color),
        onPressed: () async {
          playSound(soundNumber);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        buildKey(soundNumber: 1, color: Colors.red),
        buildKey(soundNumber: 2, color: Colors.orange),
        buildKey(soundNumber: 3, color: Colors.green),
        buildKey(soundNumber: 4, color: Colors.teal),
        buildKey(soundNumber: 5, color: Colors.blue),
        buildKey(soundNumber: 6, color: Colors.yellow),
        buildKey(soundNumber: 7, color: Colors.purple),
      ],
    );
  }
}
