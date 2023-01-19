import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:whatsapp_clone/views/screens/global.dart';

class CallPage extends StatefulWidget {
  const CallPage({Key? key}) : super(key: key);

  @override
  State<CallPage> createState() => _CallPageState();
}

class _CallPageState extends State<CallPage> {

  makeCall({String? number}) async {
    final Uri call = Uri(scheme: 'tel',path: number);
    await launchUrl(call);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ...allContacts.map((e) =>
              GestureDetector(
                onTap: () {
                  setState(() {

                  });
                },
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Container(
                    child: Row(
                      children: [
                        (e['image'] != null)
                            ?(e['image'].runtimeType == String)?
                        CircleAvatar(
                          radius: 30,
                          backgroundImage: AssetImage('${e['image']}'),
                        ) :  CircleAvatar(
                          radius: 30,
                          backgroundImage: FileImage(e['image']),
                        ): CircleAvatar(
                          radius: 30,
                          backgroundColor: Colors.grey[300],
                        ),
                        SizedBox(width: 15,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("${e['name']}", style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                                fontSize: 17),),
                            SizedBox(height: 18,),
                            Text("${e['time']}",
                              style: TextStyle(color: Colors.grey),),
                          ],
                        ),
                        Spacer(),
                        Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  makeCall(number: e['num']);
                                });
                              },
                                  child: Icon(Icons.call,color: Colors.green[800],)),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
          ).toList(),
        ],
      ),
    );
  }
}
