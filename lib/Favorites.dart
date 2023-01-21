import 'package:flutter/material.dart';
import 'package:new_church_app/main.dart';
import 'package:new_church_app/Create_blog_page.dart';

class Favorites extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Image'),
        centerTitle: true,
        leading: BackButton(onPressed: (){Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> Home_page()));},),
        backgroundColor: Colors.red[900],
        elevation: 0,
      ),
      body: Container(),
      floatingActionButton: Container(
        padding: EdgeInsets.all(60),
        child: Row(mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FloatingActionButton(onPressed: (){Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> CreateBlog()));},
            child: Icon(Icons.add_a_photo),backgroundColor: Colors.red[900],elevation: 0,)
          ],
        ),

      ),
    );
  }
}

// TODO Implement this library.