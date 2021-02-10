import 'package:edit_builder/edit_builder.dart';
import 'package:flutter/material.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'example',
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('EditBuilder'),
      ),
      body: EditBuilder<String>(
        initialValue: 'C++',
        builder: (value, setValue) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(value),
              FlatButton(
                child: Text('INCREASE'),
                onPressed: () => setValue(value += '+'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
