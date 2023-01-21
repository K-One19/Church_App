import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:new_church_app/crud.dart';
import 'package:new_church_app/main.dart';
import 'package:random_string/random_string.dart';

class CreateBlog extends StatefulWidget {
  @override
  _CreateBlogState createState() => _CreateBlogState();
}

class _CreateBlogState extends State<CreateBlog> {
  late String authorName, title, desc, imgUrl;

CrudMethods crudMethods = new CrudMethods();
  File? selectedImage;
  bool _isloading = false;
  Future getImage() async {
    var image = await ImagePicker().pickImage(source: ImageSource.gallery);

    setState(() {
      selectedImage = File(image!.path); // won't have any error now
    });
  }

 Future uploadBlog() async {
    if (selectedImage != null) {
      setState(() {
        _isloading = true;
      });

      /// uploading image to firebase storage
      FirebaseStorage storage = FirebaseStorage.instance;
      Reference ref = storage.ref().child("blogImages").child("${randomAlphaNumeric(9)}.jpg");
      UploadTask uploadTask = ref.putFile(selectedImage!);
      var downloadUrl = await (await uploadTask).ref.getDownloadURL();
      print(downloadUrl);


      Map<String, String> blogMap = {

        "authorName": authorName,
        "title": title,
        "desc": desc,
        "imgUrl": downloadUrl
      };
      crudMethods.addData(blogMap).then((result) {
        Navigator.pop(context);
      });
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Flutter",
              style: TextStyle(fontSize: 22),
            ),
            Text(
              "Blog",
              style: TextStyle(fontSize: 22, color: Colors.blue),
            )
          ],
        ),
        leading: BackButton(onPressed: (){
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Home_page()));
        },),
        backgroundColor: Colors.red[900],
        elevation: 0.0,
        actions: <Widget>[
          GestureDetector(
            onTap: () {
              uploadBlog();
            },
            child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Icon(Icons.file_upload)),
          )
        ],
      ),
      body: _isloading
          ? Container(
        alignment: Alignment.center,
        child: CircularProgressIndicator(),
      )
          : Container(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 10,
              ),
              GestureDetector(
                  onTap: () {
                    getImage();
                  },
                  child: selectedImage != null
                      ? Container(
                    margin: EdgeInsets.symmetric(horizontal: 16),
                    height: 170,
                    width: MediaQuery.of(context).size.width,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(6),
                      child: Image.file(
                        selectedImage!,
                        fit: BoxFit.cover,
                      ),
                    ),
                  )
                      : Container(
                    margin: EdgeInsets.symmetric(horizontal: 16),
                    height: 170,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(6)),
                    width: MediaQuery.of(context).size.width,
                    child: Icon(
                      Icons.add_a_photo,
                      color: Colors.black45,
                    ),
                  )),
              SizedBox(
                height: 8,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: <Widget>[
                    TextField(
                      decoration: InputDecoration(hintText: "Author Name"),
                      onChanged: (val) {
                        authorName = val;
                      },
                    ),
                    TextField(
                      decoration: InputDecoration(hintText: "Title"),
                      onChanged: (val) {
                        title = val;
                      },
                    ),
                    TextField(
                      decoration: InputDecoration(hintText: "Desc"),
                      onChanged: (val) {
                        desc = val;
                      },
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
