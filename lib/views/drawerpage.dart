import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class DrawerPage extends StatefulWidget {
  const DrawerPage({Key? key}) : super(key: key);

  @override
  State<DrawerPage> createState() => _DrawerPageState();
}

class _DrawerPageState extends State<DrawerPage> {

  File? _image1;
  ImagePicker pick1 = ImagePicker();

  getImageFromGallary1() async{
    XFile? xfile1 = await pick1.pickImage(source: ImageSource.camera);
    String path = xfile1!.path;
    setState(() {
      _image1 = File(path);
    });
  }


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              Expanded(
                flex: 3,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  color: Colors.pink,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 30,right: 30,bottom: 15,top: 72),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        (_image1 != null)
                            ? GestureDetector(
                          onTap: () {
                            setState(() {
                              getImageFromGallary1();
                            });
                          },
                              child: CircleAvatar(
                          radius: 50,
                          backgroundColor: Colors.grey[300],
                          backgroundImage: (_image1 != null)
                                ? FileImage(_image1!)
                                : null,
                        ),
                            ): GestureDetector(
                          onTap: () {
                            setState(() {
                              getImageFromGallary1();
                            });
                          },
                          child: CircleAvatar(
                            radius: 50,
                            child: Text("ADD",style: TextStyle(fontWeight: FontWeight.w700,color: Colors.purpleAccent[300]),),
                            backgroundColor: Colors.grey[300],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 16.0),
                          child: Text(
                            "Zeel Bharodiya",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 20),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 7.0),
                          child: Text(
                            "+91 76218 39795",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 7,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20,left: 30),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Icon(Icons.people_alt_outlined),
                            SizedBox(width: 22,),
                            Text("New Group",style: TextStyle(fontSize: 18),),
                          ],
                        ),
                        SizedBox(height: 22,),
                        Row(
                          children: [
                            Icon(Icons.person_outline),
                            SizedBox(width: 22,),
                            Text("New Contact",style: TextStyle(fontSize: 18),),
                          ],
                        ),
                        SizedBox(height: 22,),
                        Row(
                          children: [
                            Icon(Icons.call_outlined),
                            SizedBox(width: 22,),
                            Text("Calls",style: TextStyle(fontSize: 18),),
                          ],
                        ),
                        SizedBox(height: 22,),
                        Row(
                          children: [
                            Icon(Icons.call),
                            SizedBox(width: 22,),
                            Text("Saved Messages",style: TextStyle(fontSize: 18),),
                          ],
                        ),
                        SizedBox(height: 22,),
                        Row(
                          children: [
                            Icon(Icons.settings_outlined),
                            SizedBox(width: 22,),
                            Text("Settings",style: TextStyle(fontSize: 18),),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
