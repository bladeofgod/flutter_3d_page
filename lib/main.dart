import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: NicePage(),
    );
  }
}

class NicePage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {

    return NicePageState();
  }

}

class NicePageState extends State<NicePage> {

  Offset _offset = new Offset(0.4,0.7);

  @override
  Widget build(BuildContext context) {

    return Transform(
      transform: Matrix4.identity()
                  ..setEntry(3, 2, 0.001)
                  ..rotateX(_offset.dx)
                  ..rotateY(_offset.dy),
        alignment: FractionalOffset.center,
      child: GestureDetector(
        onPanUpdate: (details) => setState(()=>_offset += details.delta),//delta 手指触摸坐标
        onDoubleTap: ()=>setState(()=> _offset = Offset.zero),
        child: _defaultApp(context),
      ),
    );
  }

  _defaultApp(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("the martix 3d"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'blah...blah...blah.....bbbbbbbb'
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        child: Icon(Icons.category,color: Colors.red,),
      ),
    );
  }


}


class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);


  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {

      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
