import 'dart:math';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GuessGame extends StatefulWidget {
  const GuessGame({super.key});

  @override
  State<GuessGame> createState() => _GuessState();
}

class _GuessState extends State<GuessGame> {
  final _controller = TextEditingController();
  void _play(){

    var state = context.read<MyState>();
    
    
    print(state.random);
    var numero = int.tryParse(_controller.text);
    if (numero != null){
      
        if(numero>=0 && numero<=50){
        state.counterPlus();
        if(numero>state.random){
          state.message = "El numero $numero es mayor al numero secreto";
        }
        else if(numero<state.random){
          state.message = "El numero $numero es menor al numero secreto";
        }
        else{
          state.message = "El $numero es el correcto";
          state.finished = true;
        }
      }else{
        state.message = "El numero $numero esta fuera de limites";
      }
      
      
    }
  }
  void _newGame(){

    var state = context.read<MyState>();

    setState(() {
      state.counter = 0;
      state.finished = false;
      state._random = Random().nextInt(51);
      state.message = "";
    });
  }
  @override
  Widget build(BuildContext context) {
    var state = context.watch<MyState>();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Guess Game",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "Ingrese un número entre 0 y 50",
              style: TextStyle(
                  fontSize: 18),
            ),
            const SizedBox(height: 20),
            TextField(
                keyboardType: TextInputType.number, 
                  style: const TextStyle(color: Colors.black),
                controller:  _controller),
            const SizedBox(height: 20),
            SizedBox(
                width: double.infinity,
                child: ElevatedButton(onPressed: state.finished ? null : _play , child: const Text("Jugar"))),
            const SizedBox(height: 20),
            Text(
              "Mensaje: ${state.message}",
              style: TextStyle(color: state.finished ? Colors.green : Colors.black),
            ),
            const SizedBox(height: 20),
            Text(
              "Intentos: ${state.counter}",
              style: const TextStyle(color: Colors.blue),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: state.finished ? _newGame : null,
        child: const Icon(Icons.refresh),
      ),
    );
  }
}

class MyState extends ChangeNotifier{
  var _counter = 0;
  var _message = "";
  int _random = Random().nextInt(51);
  var _finished = false;

  int get counter => _counter;
  set counter(int value){
     _counter = value;
     notifyListeners();
     }
  void counterPlus (){
    _counter++;
    notifyListeners();
  }

  String get message => _message;
  set message(String value){
    _message = value;
    notifyListeners();
  }

  int get random => _random;
  void newRandom(){
    _random = Random().nextInt(51);
    notifyListeners();
  }

  set finished(bool value){
    _finished = value;
    notifyListeners();
  }

  bool get finished => _finished;
}