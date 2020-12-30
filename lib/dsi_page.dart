import 'dart:math';
import 'dart:ui';
import 'package:flutter/material.dart';

class DSIPage extends StatefulWidget {
  final String title = 'My First App - DSI/BSI/UFRPE';
  int clicks;
  DSIPage({Key key, title, this.clicks}) : super(key: key);

  @override
  _DSIPageState createState() => _DSIPageState();
}

class _DSIPageState extends State<DSIPage> {
  final _warnings = [
    'JÁ DEU BENÇA!',
    'VAI QUEBRAR O CELULAR!',
    'PARA VÉI!',
    'QUE DEDO NERVOSO!',
    'PRA QUE ISSO?!',
  ];

  void _incrementCounter() {
    setState(() {
      widget.clicks++;
    });
  }

  void _resetCounter() {
    setState(() {
      widget.clicks = 0;
    });
  }

  String _getCountText() {
    return 'Você clicou ${widget.clicks} vezes no botão.';
  }

  String _getWarningText() {
    String result = '';
    if (widget.clicks > 5) {
      var idx = Random().nextInt(_warnings.length);
      result = _warnings[idx];
    }
    return result;
  }

  String _getImageName() {
    String result;
    if (widget.clicks == 0) {
      result = '';
    } else if (widget.clicks > 5) {
      result = 'images/jadeu.png';
    } else if (widget.clicks > 2) {
      result = 'images/thug2.gif';
    } else {
      result = 'images/thug1.jpg';
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context, widget.clicks);
          },
        ),
        title: Row(
          children: <Widget>[
            Text(widget.title, style: TextStyle(fontSize: 16)),
            Spacer(),
            Image(image: AssetImage('images/logo/bsi-white.png'), height: 25),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            children: <Widget>[
              DSIMainBodyWidget(
                  _getCountText(), _getWarningText(), _getImageName()),
              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    width: 30,
                  ),
                  FlatButton(
                    onPressed: _resetCounter,
                    color: Colors.grey[700],
                    child: Text(
                      'Reset',
                      style: TextStyle(color: Colors.white, fontSize: 16.0),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
        backgroundColor: Colors.grey[700],
      ),
    );
  }
}

class DSIMainBodyWidget extends StatelessWidget {
  final String _countText;
  final String _warningText;
  final String _image;
  DSIMainBodyWidget(this._countText, this._warningText, this._image);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          _countText,
          style: TextStyle(color: Colors.black, fontSize: 16.0),
        ),
        SizedBox(height: 8.0),
        if (_warningText.isNotEmpty)
          Text(
            _warningText,
            style: TextStyle(color: Colors.red, fontSize: 24.0),
          ),
        SizedBox(height: 8.0),
        if (_image.isNotEmpty)
          Image(
            image: AssetImage(_image),
            height: 240,
          ),
      ],
    );
  }
}
