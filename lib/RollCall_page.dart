import 'package:flutter/material.dart';
import 'package:new_church_app/main.dart';

class RollCall extends StatefulWidget {


  @override
  State<RollCall> createState() => _RollCallState();
}

class _RollCallState extends State<RollCall> {
int? selectedValue = 4;
String? Name;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('RollCall'),
        leading: BackButton(onPressed: (){Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> Home_page()));},),
        backgroundColor: Colors.red[900],
      ),
      body: SingleChildScrollView(
        child: Column(mainAxisAlignment: MainAxisAlignment.center,
          children: [Divider(height: 50,),
            Container(
              margin: EdgeInsets.all(10),
              child: TextField(
                decoration: InputDecoration(hintText: "Type Your name here",),
                onChanged: (val) {
                  Name = val;
                },
              ),
            ),
        SizedBox(height: 20,),
        Container(
          margin: EdgeInsets.all(10),
          decoration:  BoxDecoration(color: Color(0XFFD6D6D6),
              borderRadius: BorderRadius.circular(7)
          ),
          child: RadioListTile(
            value: 0,
            groupValue: selectedValue,
            title: Text(
              'Present',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text('Choose this if you were present'),

            onChanged: (int? value) {
              setState(() {
                selectedValue = value!;
              });
            },
          ),
        ),
        const SizedBox(height: 20),

        //2ND
        Container(
          margin: EdgeInsets.all(10),
          decoration:  BoxDecoration(color: Color(0XFFD6D6D6),
          borderRadius: BorderRadius.circular(7)),
          child: RadioListTile(
            value: 1,
            groupValue: selectedValue,
            title: Text(
              'Absent',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text('Select this if you were absent'),
            onChanged: (int? value) {
              setState(() {
                selectedValue = value!;
              });
            },
          ),
        ),
            SizedBox(height: 100,),

        ElevatedButton(
          child: Text('Submit'),
          onPressed: () {
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>SuccessPage()));
          },
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red[900],
              textStyle: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold)),)
          ],
        ),
      ),
    );
  }
}

// TODO Implement this library.

class SuccessPage extends StatelessWidget {
  const SuccessPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF6F6F6),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 200),
              Image.asset(
                'assets/thumbs.png',
              ),
              SizedBox(height: 20),
              Text(
                'Your response has been recorded',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 120),
              Row(
                children: [
                  SizedBox(width: 110),
                  ElevatedButton(
                    child: Text('Go Home'),
                    onPressed: () {
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Home_page()));
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red[900],
                    ),
                  ),
                  SizedBox(width: 10),
                  ElevatedButton(
                    child: Text('About Us'),
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (ctx) => AlertDialog(
                          title: const Text("About Us"),
                          content: Text(
                              'This app is developed by Frimpong Evans Boateng'),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red[900],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}