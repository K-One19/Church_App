import 'package:cloud_firestore/cloud_firestore.dart';

class CrudMethods{
  Future<void> addData(blogData) async{
    FirebaseFirestore.instance.collection("path").add(blogData).catchError((e){
      print(e);
    });
  }
  getData() async{
    return await FirebaseFirestore.instance.collection("blogs").get();
  }
}