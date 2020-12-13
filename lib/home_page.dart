import 'package:flutter/material.dart';

import 'dsi_page.dart';

class HomePage extends StatefulWidget {
  int clicks;

  HomePage({Key key, this.clicks}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void Back() async {
    //função pra buscar o valor dos clicks na segunda tela mandado pelo pop
    final value = await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DSIPage(
            clicks: widget.clicks ?? 0,
          ),
        ));
    setState(() {
      widget.clicks = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Home'),
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Clicks Atuais: ${widget.clicks ?? 0}'),
              RaisedButton(
                onPressed: () {
                  Back();
                },
                child: Text(
                  'DSI',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                color: Colors.grey[700],
              )
            ],
          )
        ],
      ),
    );
  }
}
