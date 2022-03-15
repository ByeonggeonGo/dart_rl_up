import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(Myapp());
}

class Myapp extends StatefulWidget {
  const Myapp({Key? key}) : super(key: key);

  @override
  State<Myapp> createState() => _MyappState();
}

class _MyappState extends State<Myapp> {
  String _text = 'test';
  final String _url = "http://192.168.0.108:9000/data";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'test',
      home: Scaffold(
        appBar: AppBar(
          title: Text('ehrnc playground demo'),
          centerTitle: true,
          foregroundColor: Colors.white54,
          backgroundColor: Colors.blueGrey,
        ),
        body: Container(
          child: Center(
            child: Column(
              children: <Widget>[
                Text(_text),
                IconButton(
                  onPressed: () async {
                    var url2 = Uri.parse("$_url");
                    var _res = await http.get(url2);
                    print(_res.body);
                    setState(() {
                      _text = _res.body;
                    });
                  },
                  icon: Icon(Icons.print),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
