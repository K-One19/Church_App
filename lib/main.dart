import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:new_church_app/Member.dart';
import 'package:new_church_app/Announcement.dart';
import 'package:new_church_app/RollCall_page.dart';
import 'package:new_church_app/crud.dart';
import 'package:firebase_core/firebase_core.dart';
import 'Create_blog_page.dart';
import 'package:share/share.dart';
import 'Monday_page.dart';


Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  await Firebase.initializeApp();

  print("Handling a background message: ${message.messageId}");
}




void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  runApp(MaterialApp(home: Splash(),));
}



class Splash extends StatefulWidget {


  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 3),() {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context)=> Home_page()));    });
  }


  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red[900],
      body: Center(
        child: Container(
          child: Icon(Icons.church, size: 90,
            color: Colors.white,),

        ),
      ),
    );
  }
}



class Home_page extends StatefulWidget {
  @override
  State<Home_page> createState() => _Home_pageState();
}





class _Home_pageState extends State<Home_page> {
  CrudMethods crudMethods = CrudMethods();

  QuerySnapshot? blogsSnapshot;

  Widget blogList() {
    return Container(
      child:blogsSnapshot != null
          ? Column(
    children: [
      ListView.builder(
          itemCount: blogsSnapshot!.docs.length,
          shrinkWrap: true,
          itemBuilder: (context, index){
            return BlogsTile(
                authorName: blogsSnapshot!.docs[index]['authorName'],
                desc: blogsSnapshot!.docs[index]['desc'],
                imgUrl: blogsSnapshot!.docs[index]['imgUrl'],
                title: blogsSnapshot!.docs[index]['title']);
          }
      )
      ]
    ): Container(
    alignment: Alignment.center,
    child: CircularProgressIndicator(),
      ));
  }

  @override
  void initState(){
    super.initState();

    crudMethods.getData().then((result){
      blogsSnapshot = result;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title:const Text('Church App'),
          centerTitle: true,
          backgroundColor: Colors.red[900],
          elevation: 0,

        ),
        drawer: Drawer(
          child: SingleChildScrollView(
            child: Container(
              child: Column(
                children: [
                  DrawerHeader(),
                  MenuItems(),

                ],
              ),
            ),
          ),
        ),

        body: SingleChildScrollView(
          child: Column(
              children: [
              SizedBox(height: 20),
          Text('THE DAILY WORD',
            style: TextStyle(
                fontSize: 20,
                color: Colors.red[900]
            ),
          ),
          Divider(height: 20,color: Colors.red[900],),
          SizedBox(height: 30),
          Row( children:[
            SizedBox(width: 10),
            Text('Monday',
              style: TextStyle(color: Colors.red[900]),),
            SizedBox(width: 285),
            InkWell(child: Icon(Icons.favorite_outline, color: Colors.red[900]),
              onTap: () { print('clicked');},),
            SizedBox(width: 10,),
            InkWell(child: Icon(Icons.share,color: Colors.red[900],
                size: 20),
              onTap: (){
                Share.share("https://play.google.com/store/apps/details?id=com.Favorites_Page");
              },)
          ]),
          InkWell(onTap: (){Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context)=> MondayPage()));},
            child: Container(
              padding: EdgeInsets.fromLTRB(10, 10, 150, 150),
              margin: EdgeInsets.fromLTRB(10, 0, 10, 10),
              width: MediaQuery.of(context).size.width,
              height: 350,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage("assets/pic_6.jpg"),
                ),
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
            ),
          ),
          Divider(height: 10,color: Colors.grey[400],),
          SizedBox(height: 10),
          Row(children:[
            SizedBox(width: 10),
            Text('Tuesday',
              style: TextStyle(color: Colors.red[900]),),
            SizedBox(width: 280,),
            InkWell(child: Icon(Icons.favorite_outline, color: Colors.red[900]),
              onTap: () { print('clicked');},),
            SizedBox(width: 10,),
            InkWell(child: Icon(Icons.share,color: Colors.red[900],
                size: 20),
              onTap: (){
                Share.share("https://play.google.com/store/apps/details?id=com");
              },)
          ]),
          InkWell(onTap: (){Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> Tuesday_page()));},
            child: Container(
              padding: EdgeInsets.fromLTRB(10, 10, 150, 150),
              margin: EdgeInsets.fromLTRB(10, 0, 10, 10),
              width: MediaQuery.of(context).size.width,
              height: 350,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage("assets/pic_7.jpg"),
                ),
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
            ),
          ),
          Divider(height: 10,color: Colors.grey[400],),
          SizedBox(height: 10),
          Row(children:[
            SizedBox(width: 10),
            Text('Wednesday',
              style: TextStyle(color: Colors.red[900]),),
            SizedBox(width: 260,),
            InkWell(child: Icon(Icons.favorite_outline, color: Colors.red[900]),
              onTap: () { print('clicked');},),
            SizedBox(width: 10,),
            InkWell(child: Icon(Icons.share,color: Colors.red[900],
                size: 20),
              onTap: (){
                Share.share("https://play.google.com/store/apps/details?id=com");
              },)
          ]),
          InkWell(onTap: (){Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> Wednesday_Page()));},
            child: Container(
              padding: EdgeInsets.fromLTRB(10, 10, 150, 150),
              margin: EdgeInsets.fromLTRB(10, 0, 10, 10),
              width: MediaQuery.of(context).size.width,
              height: 350,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage("assets/pic_8.jpg"),
                ),
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
            ),
          ),
          Divider(height: 10,color: Colors.grey[400],),
          SizedBox(height: 10),
          Row(children:[
            SizedBox(width: 10),
            Text('Thursday',
              style: TextStyle(color: Colors.red[900]),),
            SizedBox(width: 276,),
            InkWell(child: Icon(Icons.favorite_outline, color: Colors.red[900]),
              onTap: () { print('clicked');},),
            SizedBox(width: 10,),
            InkWell(child: Icon(Icons.share,color: Colors.red[900],
                size: 20),
              onTap: (){
                Share.share("https://play.google.com/store/apps/details?id=com");
              },)
          ]),
          InkWell(onTap: (){Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> Thursday_page()));},
            child: Container(
              padding: EdgeInsets.fromLTRB(10, 10, 150, 150),
              margin: EdgeInsets.fromLTRB(10, 0, 10, 10),
              width: MediaQuery.of(context).size.width,
              height: 350,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage("assets/pic_11.jpg"),
                ),
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
            ),
          ),
          SizedBox(height: 10),
          Divider(height: 10,color: Colors.grey[400],),
          SizedBox(height: 10),
          Row(children:[
            SizedBox(width: 10),
            Text('Friday',
              style: TextStyle(color: Colors.red[900]),),
            SizedBox(width: 295,),
            InkWell(child: Icon(Icons.favorite_outline, color: Colors.red[900]),
              onTap: () { print('clicked');},),
            SizedBox(width: 10,),
            InkWell(child: Icon(Icons.share,color: Colors.red[900],
                size: 20),
              onTap: (){
                Share.share("https://www.youtube.com/watch?v=ZIixCOhHQB8");
              },)
          ]),
          InkWell(onTap: (){Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> Friday_page()));},
            child: Container(
              padding: EdgeInsets.fromLTRB(10, 10, 150, 150),
              margin: EdgeInsets.fromLTRB(10, 0, 10, 10),
              width: MediaQuery.of(context).size.width,
              height: 350,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage("assets/pic_10.jpg"),
                ),
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
            ),
          ),
          SizedBox(height: 30,),
                blogList()
  ]),
        ),
      floatingActionButton: Container(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FloatingActionButton(backgroundColor: Colors.red[900], onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder:
              (context)=> CreateBlog()));
            }, child: const Icon(Icons.add),
            )
          ],
        ),
      ),
    );
  }
}


class DrawerHeader extends StatelessWidget {
  const DrawerHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      child: Image.asset('assets/josh-eckstein-nkUioaswtvM-unsplash.jpg'),
    );
  }
}

class MenuItems extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: const Icon(Icons.home_outlined),
          title: const Text('Members',
          style: TextStyle(
            fontSize: 16
          ),),
          onTap: () {Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> Members()));},
        ),
        ListTile(
          leading: const Icon(Icons.message_outlined),
          title: const Text('Announcement',
          style: TextStyle(
            fontSize: 16,
          ),),
          onTap: () {Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> Announcement_page()));},
        ),
        ListTile(
          leading: const Icon(Icons.contacts_outlined),
          title: const Text('Roll Call',
          style: TextStyle(
            fontSize: 16
          ),),
          onTap: () {Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> RollCall()));},
        ),
        ListTile(
          leading: Icon(Icons.info_outline),
          title: Text('About Us',
          style: TextStyle(fontSize: 16),),
          onTap: () {
            showAboutDialog(
                context: context,
                applicationIcon: Icon(Icons.church,size: 40,color: Colors.red[900],),
                applicationLegalese: 'This app is a church app created by Frimpong Evans Boateng',);
          },
        ),

      ],
    );
  }
}

class BlogsTile extends StatelessWidget{

  late String authorName,desc, imgUrl, title ;
  BlogsTile({required this.authorName,required this.desc,required this.imgUrl, required this.title});

  @override
  Widget build(BuildContext context) => Container( height: 150,
      child: Stack(children: [
        ClipRRect(borderRadius: BorderRadius.circular(6),
            child: Image.network(imgUrl)),
        Container(
          height: 150,
          decoration: BoxDecoration(
              color: Colors.grey[400]?.withOpacity(0.3),
          borderRadius: BorderRadius.circular(6)),
          
        ),
        Container(child: Column( children: [
          Text(title),
          Text(authorName),
        ],),)

      ],),
    );
}
