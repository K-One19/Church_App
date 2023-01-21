import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:new_church_app/main.dart';

class Members extends StatelessWidget {
  final firestoreInstance = FirebaseFirestore.instance;


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=> FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Church Members'),
          backgroundColor: Colors.red[900],
          leading: BackButton(onPressed: (){Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Home_page()));},),
          elevation: 0,

        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(mainAxisAlignment: MainAxisAlignment.center,
              children: [SizedBox(height: 30,),
                StreamBuilder(
                    stream: FirebaseFirestore.instance.collection("Members").snapshots(),
                    builder: (BuildContext context, AsyncSnapshot<QuerySnapshot>snapshot){
                      if(!snapshot.hasData){
                        return Center(
                            child: CircularProgressIndicator()
                        );
                      }
                      return Container(
                        height: MediaQuery.of(context).size.height,
                        width: MediaQuery.of(context).size.width,
                        child: ListView(
                            children: snapshot.data!.docs.map((snap) {
                              return Card(
                                child: ListTile(
                                  leading: Text(snap['number']),
                                    title: Text(snap['name']),
                                    subtitle: Text(snap['email']),
                                    trailing: Text(snap['ministry']),

                              ));
                            }).toList()
                        ),
                      );
                    }
                )
              ],
            ),
          ),
        ),


      ),
    );
  }
}


// TODO Implement this library.



