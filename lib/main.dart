import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';

void main() {
  runApp(XylophoneApp());
}

class XylophoneApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    int init = 1;

    void playSound(int soundNumber) {
      final player = AudioCache();
      player.play('note$soundNumber.wav');
    }

    Expanded buildKey(int i) {
      final List<MaterialColor> colors = [
        Colors.red,
        Colors.orange,
        Colors.yellow,
        Colors.green,
        Colors.teal,
        Colors.blue,
        Colors.purple,
      ];
      return Expanded(
        child: FlatButton(
          onPressed: () {
            playSound(i);
          },
          color: colors[i - 1],
        ),
      );
    }

    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              for (var i = init; i <= 7; i++) buildKey(i),
            ],
          ),
        ),
      ),
    );
  }
}
