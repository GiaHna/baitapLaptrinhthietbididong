import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextButtonExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('TextButton Example'),
        ),
        body: Center(
          child: TextButton(
            onPressed: () {
              print('TextButton pressed');
            },
            child: Text('Click Me'),
          ),
        ),
      ),

    );
  }
}


class ElevatedButtonExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('ElevatedButton Example'),
        ),
        body: Center(
          child: ElevatedButton(
            onPressed: () {
              print('ElevatedButton pressed');
            },
            child: Text('Click Me'),
          ),
        ),
      ),

    );
  }
}

class OutlinedButtonExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('OutlinedButton Example'),
        ),
        body: Center(
          child: OutlinedButton(
            onPressed: () {
              print('OutlinedButton pressed');
            },
            child: Text('Click Me'),
          ),
        ),
      ),

    );
  }
}


class GesturesButtonExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('GesturesButton Example'),
        ),
        body: Center(
          child: GestureDetector(
            onTap: () {
              print('Container tapped');
            },
            onDoubleTap: (){
              print('Container double-tapped');
            },
            onLongPress: (){
              print('Container long-pressed');
            },
            child: Container(
              width: 100,
              height: 100,
              color: Colors.blue,
              child: Center(child: Text('Tap me')),
            ),
          ),
        ),
      ),

    );
  }
}

class TextFieldButtonExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('TextFieldButton Example'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
            TextField(
              decoration: InputDecoration(
              labelText: 'Enter your name',
              border: OutlineInputBorder(),
            ),
      ),
        SizedBox(height: 16),
        TextField(
          decoration: InputDecoration(
            labelText: 'Enter your email',
            border: OutlineInputBorder(),
        ),
        keyboardType: TextInputType.emailAddress,
        ),
        ],
        ),

      ),

    ),
    );
  }
}


class TextFormFieldButtonExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('OutlinedButton Example'),
        ),
        body: Center(
          child: OutlinedButton(
            onPressed: () {
              print('OutlinedButton pressed');
            },
            child: Text('Click Me'),
          ),
        ),
      ),

    );
  }
}