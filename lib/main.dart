import 'package:flutter/material.dart';
import 'package:taller_sqlite_flutter/model/diary.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CRUD Sqlite',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const MyHomePage(title: 'CRUD Sqlite'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String diaries = '';

  @override
  void initState() {
    // TODO: implement initState
    getDiaries();
    super.initState();
  }

  getDiaries() async {
    List diaries = await DIARY().getDiaries();
    setState(() {
      this.diaries = diaries.toString();
    });
  }

  void _incrementCounter() async {
    // Insertar registro
    // DIARY diary = DIARY(type: 'Trabajo', enterCode: 'qwerty');
    // int id = await diary.save();
    // print('Id del diario: $id');

    // setState(() {
    //   diaries;
    // });

    // Actualizar registro con id
    DIARY diary = DIARY(id: 3, type: 'Escuela', enterCode: 'qwerty');
    int id = await diary.save();
    print('Id del diario: $id');

    setState(() {
      diaries;
    });

    // Eliminar registro con id
    // DIARY diary = DIARY(id: 1, type: 'Escuela', enterCode: 'qwerty');
    // await diary.remove();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CRUD Sqlite'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              diaries,
              style: Theme.of(context).textTheme.headlineMedium,
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
