import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class CounterCubit extends Cubit<int> {
  int initialData;

  CounterCubit({this.initialData = 0}) : super(initialData);

  void addData() {
    emit(state + 1);
  }

  void minusData() {
    emit(state - 1);
  }
}

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final CounterCubit myCounter = CounterCubit(initialData: 99);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cubit Apps"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          StreamBuilder(
            initialData: myCounter.initialData,
            stream: myCounter.stream,
            builder: (context, snapshot) {
              // if (snapshot.connectionState == ConnectionState.waiting) {
              //   return const Center(
              //     child: Text(
              //       "Loading..",
              //       style: TextStyle(fontSize: 50),
              //     ),
              //   );
              // } else {
              //   return Center(
              //     child: Text(
              //       "${snapshot.data}",
              //       style: const TextStyle(fontSize: 50),
              //     ),
              //   );
              // }

              return Center(
                child: Text(
                  "${snapshot.data}",
                  style: const TextStyle(fontSize: 50),
                ),
              );
            },
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                  onPressed: () {
                    myCounter.minusData();
                  },
                  icon: const Icon(Icons.remove)),
              IconButton(
                  onPressed: () {
                    myCounter.addData();
                  },
                  icon: const Icon(Icons.add))
            ],
          )
        ],
      ),
    );
  }
}
