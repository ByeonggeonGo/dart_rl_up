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
  final String _url = "http://192.168.0.108:9000/modelfit";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'test',
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          color: Colors.black26,
        ),
        textTheme: TextTheme(
          displayMedium: TextStyle(
            fontSize: 15,
            color: Colors.white,
          ),
        ),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'ehrnc playground demo', 
            ),
          centerTitle: true,
          foregroundColor: Colors.white54,
          backgroundColor: Color.fromARGB(255, 109, 111, 112),
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
                    
                    setState(() {
                      // _text = _res.body;
                    });
                  },
                  icon: Icon(Icons.print),
                ),
                Flexible(
                  flex: 1,
                  child: Container(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: <Widget>[
                          Flexible(child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(color: Colors.blue,),
                          ), flex: 1,),
                          Flexible(child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(color: Color.fromARGB(255, 34, 133, 42),),
                          ), flex: 1,),
                        ],
                      ),
                    ),
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: Container(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: <Widget>[
                          Flexible(child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(color: Colors.blue,),
                          ), flex: 1,),
                          Flexible(child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(color: Color.fromARGB(255, 34, 133, 42),),
                          ), flex: 1,),
                        ],
                      ),
                    ),
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: Container(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: <Widget>[
                          Flexible(child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(color: Colors.blue,),
                          ), flex: 1,),
                          Flexible(child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(color: Color.fromARGB(255, 34, 133, 42),),
                          ), flex: 1,),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
