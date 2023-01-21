import 'package:flutter/material.dart';
import 'package:new_church_app/main.dart';

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
        leading: BackButton(
          onPressed: (){Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context)=> Home_page()));},
        ),
      ),
    );
  }

}// TODO Implement this library.

class Tuesday_page extends StatelessWidget {
  const Tuesday_page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tuesday\'s word'),
        leading: BackButton(onPressed: (){Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> Home_page()));},),
      ),
    );
  }
}

class Wednesday_Page extends StatelessWidget {
  const Wednesday_Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Wednesday\'s word'),
        leading: BackButton(onPressed: (){Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> Home_page()));},),
      ),
    );
  }
}

class Thursday_page extends StatelessWidget {
  const Thursday_page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Thursday\'s word'),
        leading: BackButton(onPressed: (){Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> Home_page()));},),
      ),
    );
  }
}

class Friday_page extends StatelessWidget {
  const Friday_page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Friday\'s word'),
        leading: BackButton(onPressed: (){Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> Home_page()));},),
      ),
    );
  }
}