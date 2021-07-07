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
      home: listView(),
    );
  }
}

class listView extends StatefulWidget {
  @override
  _listViewState createState() => _listViewState();
}

class _listViewState extends State<listView> {
  final List<String> entries = [];
  final textControler = TextEditingController();

  @override
  Widget build(BuildContext context) {
    entries.sort();
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          decoration: InputDecoration(hintText: "=> Enter Grocerys "),
          controller: textControler,
        ),
      ),
      body: entries.length > 0
          ? ListView.separated(
              itemCount: entries.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    leading: Icon(Icons.local_grocery_store),
                    trailing: Icon(Icons.delete_outline_rounded),
                    title: Text('${entries[index]}'),
                    onLongPress: () {
                      setState(() {
                        entries.removeAt(index);
                      });
                    },
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) =>
                  const Divider(),
            )
          : Center(
              child: Text("No Grocery in your List !"),
            ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.save),
        onPressed: () {
          setState(() {
            entries.add(textControler.text);
            textControler.clear();
          });
        },
      ),
    );
  }
}
