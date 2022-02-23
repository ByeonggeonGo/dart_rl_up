import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_application_1/load_data.dart';
import 'dart:convert' as convert;
import 'package:carousel_slider/carousel_slider.dart';

void main() async {
  DataLoader loader = DataLoader();
  List lis = await loader.get_coin_list();
  List<Widget> liswid = lis.map((e) => Text('$e')).toList();

  print(lis.map((e) => print('$e')));
  print(liswid);

  var demo = ComplicatedImageDemo();
  demo.data_get(liswid);
  runApp(MaterialApp(
    title: "test",
    home: demo,
  ));
}

class ComplicatedImageDemo extends StatelessWidget {
  List<Widget> llst = [];
  void data_get(List<Widget> list_1) {
    llst = list_1;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Complicated image slider demo')),
      body: Container(
        child: CarouselSlider(
          options: CarouselOptions(
            autoPlay: true,
            aspectRatio: 2.0,
            enlargeCenterPage: true,
          ),
          items: llst,
        ),
      ),
    );
  }
}
