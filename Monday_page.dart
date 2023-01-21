import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  home: MondayPage(),
));

class MondayPage extends StatelessWidget {
  const MondayPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Monday word'),
      ),
    );
  }
}
