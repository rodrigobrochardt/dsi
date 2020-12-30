import 'package:flutter/material.dart';

import 'app_widget.dart';
import 'dsi_page.dart';

class HomePage extends StatefulWidget {
  int clicks;

  HomePage({Key key, this.clicks}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DropdownItem selected_item = choices[0]; // padrão
  void _selectDropdownItem(DropdownItem item) {
    // função para selecionar opção no botão dropdown no appbar

    setState(() {
      selected_item = item;
    });
    if (selected_item.title == "Créditos") {
      isAlertDialogIncorrectFields(context, "Feito por \nRodrigo Brochardt");
    }
    if (selected_item.title == "Conta") {
      isAlertDialogIncorrectFields(context, "Novidades em breve");
    }
  }

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
      drawer: menu_bar(context),
      appBar: AppBar(
        actions: [
          PopupMenuButton(
            elevation: 3.2,
            onSelected: _selectDropdownItem,
            itemBuilder: (BuildContext context) {
              return choices.map((DropdownItem choice) {
                return PopupMenuItem<DropdownItem>(
                  value: choice,
                  child: Text(choice.title),
                );
              }).toList();
            },
          )
        ],
        automaticallyImplyLeading: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Home'),
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                Navigator.pushNamed(context, "PersonalData");
              },
            ),
          ],
        ),
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

class DropdownItem {
  //propriedade dos items que irão ficar no botão dropDown
  DropdownItem({this.title});
  String title;
}

List<DropdownItem> choices = <DropdownItem>[
  //itens criados
  DropdownItem(title: 'Conta'),
  DropdownItem(title: 'Créditos'),
];
