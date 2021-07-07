import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: listview(),
    );
  }
}

class listview extends StatefulWidget {
  @override
  _listviewState createState() => _listviewState();
}

class _listviewState extends State<listview> {
  final List<String> entries = [];

  final textcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: textcontroller,
        ),
      ),
      body: entries.length > 0
          ? ListView.builder(
              itemCount: entries.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text('${entries[index]}'),
                  onLongPress: () {
                    setState(() {
                      entries.removeAt(index);
                    });
                  },
                );
              },
            )
          : Center(
              child: Text("NO groceryes in the list !"),
            ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.save),
        onPressed: () {
          setState(() {
            entries.add(textcontroller.text);
            textcontroller.clear();
          });
        },
      ),
    );
  }
}
