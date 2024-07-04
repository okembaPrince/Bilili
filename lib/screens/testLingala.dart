import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;



class SpeechToTextExample extends StatefulWidget {
  @override
  _SpeechToTextExampleState createState() => _SpeechToTextExampleState();
}

class _SpeechToTextExampleState extends State<SpeechToTextExample> {
  late stt.SpeechToText _speech;
  bool _isListening = false;
  String _text = "Appuyez sur le bouton pour commencer à parler";

  @override
  void initState() {
    super.initState();
    _speech = stt.SpeechToText();
  }

  void _listen() async {
    if (!_isListening) {
      bool available = await _speech.initialize(
        onStatus: (val) => print('onStatus: $val'),
        onError: (val) => print('onError: $val'),
      );
      if (available) {
        setState(() => _isListening = true);
        _speech.listen(
          onResult: (val) => setState(() {
            _text = val.recognizedWords;
          }),
          localeId: 'ln', // Code de langue pour le Lingala
        );
      }
    } else {
      setState(() => _isListening = false);
      _speech.stop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Speech to Text en Lingala'),
      ),
      body: Center(
        child: Text(
          _text,
          style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.w400),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _listen,
        tooltip: 'Ecouter',
        child: Icon(_isListening ? Icons.mic : Icons.mic_none),
      ),
    );
  }
}
