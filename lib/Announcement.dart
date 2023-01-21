import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:new_church_app/main.dart';




class Announcement_page extends StatefulWidget {

  Announcement_page() : super();
  final String title = 'Firebase Messaging';

  @override
  State<Announcement_page> createState() => _Announcement_pageState();
}

class _Announcement_pageState extends State<Announcement_page> {

  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  late List<Message>  _messages;

  void initState(){
    super.initState();
    _messages = <Message>[];
    getToken();
    _configureFirebaseListeners();
  }


  getToken(){
    _firebaseMessaging.getToken().then((deviceToken) =>
        print('Device Token: $deviceToken'));

  }

  _configureFirebaseListeners(){
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print('Got a message whilst in the foreground!');
      print('Message data: ${message.data}');
      _setMessage(message as Map<String, dynamic>);

      if (message.notification != null) {
        print('Message also contained a notification: ${message.notification}');
      }
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print('A new onMessageOpenedApp event was published!');
      _setMessage(message as Map<String, dynamic>);
    });



      }

      _setMessage(Map<String, dynamic> message){
    final notification = message ['notification'];
    final data = message['data'];
    final String title = notification['title'];
    final String body = notification['body'];
    final String mMessage = data['message'];
    setState(() {
      Message m = Message(title, body, mMessage);
      _messages.add(m);
    });
      }







  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Announcement'),
          leading: BackButton(onPressed: () {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => Home_page()));
          }
          ),
        ),
      body: ListView.builder(
          itemCount: null == _messages ? 0: _messages.length,
          itemBuilder: (context, index){
            return Card(
              child: Padding(
                padding: EdgeInsets.all(15.0),
                child: Text(
                  _messages[index].message,
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.black
                  ),
                ),
              ),
            );
          }),
    );
  }


}
//TODO Implement this library.

class Message{
  late String title;
  late String body;
  late String message;
  Message(title, body, message){
    this.title = title;
    this.body = body;
    this.message = message;
  }
}