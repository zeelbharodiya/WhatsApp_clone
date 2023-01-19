import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp_clone/views/screens/global.dart';

class StatusPage extends StatefulWidget {
  const StatusPage({Key? key}) : super(key: key);

  @override
  State<StatusPage> createState() => _StatusPageState();
}

class _StatusPageState extends State<StatusPage> {


  DateTime currentDateTime = DateTime.now();
  TimeOfDay currentTime = TimeOfDay.now();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10,right: 10,bottom: 10),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 15.0),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                (Global.isIOS == false)
                    ? SizedBox(
                  height: 1,
                )
                    : SizedBox(
                  height: 100,
                ),
                Container(
                  padding: EdgeInsets.all(5),
                  child: Row(children: [
                    Stack(
                      alignment: Alignment(1.4,1.5),
                      children: [
                        CircleAvatar(
                          radius: 40,
                          child: Icon(Icons.person_outline,size: 60,),
                          backgroundColor: Colors.grey[300],
                        ),
                        FloatingActionButton(onPressed: (){},child: Icon(Icons.add,),mini: true,backgroundColor: Color(0xff075e55),)
                      ],
                    ),
                    SizedBox(width: 10,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("My status",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 19),),
                        SizedBox(height: 3,),
                        Text("Tap to add for status",style: TextStyle(color: Colors.grey[600]),)
                      ],)
                  ],
                  ),
                ),
                Divider(thickness: 2,),
                Text("Recent updates",style: TextStyle(color: Colors.grey),),
                Divider(),
                ...allContacts.map((e) =>
                    Container(
                        margin: EdgeInsets.only(top: 2,bottom: 2),
                        child:Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Stack(
                                alignment: Alignment.center,
                                children:[
                                  CircleAvatar(
                                    backgroundColor: Colors.green,
                                    radius: 39,
                                  ),
                                  CircleAvatar(
                                    radius: 35,
                                    backgroundColor: Colors.black,
                                    backgroundImage: AssetImage("${e["image"]}"),
                                  ),
                                ],
                              ),
                              SizedBox(width: 20,),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text("${e["name"]}",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600),),
                                  SizedBox(height: 8,),
                                  Text("${e["desc"]}")
                                ],)
                            ],),
                        )
                    ) ).toList(),
                // FloatingActionButton(onPressed: (){},child: Icon(Icons.edit),)
              ]),
        ),
      ),

    );
  }
}
