import 'package:flutter/material.dart';
import 'package:flutter_shape_image/flutter_shape_image.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleImage(
              imageUrl:
                  'https://avatars2.githubusercontent.com/u/4323410?s=460&v=4',
              radius: 100.0,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: DiamondImage(
              imageUrl:
                  'https://avatars2.githubusercontent.com/u/4323410?s=460&v=4',
              width: 200.0,
              height: 220.0,
            ),
          )
        ],
      ),
    );
  }
}
