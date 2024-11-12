/*import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: CounterWidget(),
  ));
}


class CounterWidget extends StatefulWidget{

  const CounterWidget({super.key});

  @override
  State<CounterWidget> createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget>{
  int _counter = 0;

  /*void _increaseCounter(){
    setState(() {
      _counter++;
    });
    print(_counter);
  }

  void _decreaseCounter(){
    setState(() {
      _counter--;
    });
    print(_counter);
  }*/

  void _changeCounter(bool increase){
    setState(() {
      if(increase == true){
        _counter++;
      }
      else{
        _counter--;
      }
    });
    print(_counter);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Counter App",style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),backgroundColor: Colors.red,),
      body: Container(
        padding: EdgeInsets.all(20),
        width: double.infinity,
        child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
        const Text("Ha oprimido el boton",
        style: TextStyle(color: Colors.blue, 
        fontWeight: FontWeight.bold,
        fontSize: 18),),
        Text("$_counter veces")
      ],),
      ), 
      persistentFooterButtons: [
        FloatingActionButton( onPressed: () => _changeCounter(true), 
        child: const Icon(Icons.add)),
        FloatingActionButton(onPressed: () => _changeCounter(false), 
        child: const Icon(Icons.remove)),
      ],
      
    );
  }
}*/

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:myappflutter/guessgame.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => MyState(),
    child: const MaterialApp(
      title: "GuessGameApp",
      home: GuessGame(),
      debugShowCheckedModeBanner: false,
    ),
  ));
}