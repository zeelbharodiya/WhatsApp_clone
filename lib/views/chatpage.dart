import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp_clone/views/screens/global.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return (Global.isIOS == false)
        ? SingleChildScrollView(
            child: Column(
              children: [
                ...allContacts
                    .map(
                      (e) => GestureDetector(
                        onTap: () {
                          setState(() {
                            showModalBottomSheet(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.vertical(
                                        top: Radius.circular(30))),
                                context: context,
                                builder: (context) => Container(
                                      height: 400,
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        // borderRadius: BorderRadius.horizontal(left: Radius.circular(30),),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(25),
                                        child: Column(
                                          children: [
                                            SizedBox(
                                              height: 15,
                                            ),
                                            (e['image'] != null)
                                                ? (e['image'].runtimeType ==
                                                        String)
                                                    ? CircleAvatar(
                                                        radius: 60,
                                                        backgroundImage:
                                                            AssetImage(
                                                                '${e['image']}'),
                                                      )
                                                    : CircleAvatar(
                                                        radius: 60,
                                                        backgroundImage:
                                                            FileImage(
                                                                e['image']),
                                                      )
                                                : CircleAvatar(
                                                    radius: 60,
                                                    backgroundColor:
                                                        Colors.deepOrange[300],
                                                  ),
                                            SizedBox(
                                              height: 20,
                                            ),
                                            Text(
                                              "${e['name']}",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 25),
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Text(
                                              "+91 ${e['num']}",
                                              style: TextStyle(
                                                  color: Colors.grey[600],
                                                  fontSize: 18),
                                            ),
                                            SizedBox(
                                              height: 20,
                                            ),
                                            Container(
                                              width: double.infinity,
                                              height: 50,
                                              child: ElevatedButton(
                                                onPressed: () {},
                                                style: ButtonStyle(
                                                    shape: MaterialStateProperty
                                                        .all(RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        15)))),
                                                child: Text(
                                                  "Send Message",
                                                  style:
                                                      TextStyle(fontSize: 19),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 16,
                                            ),
                                            Container(
                                              width: double.infinity,
                                              height: 50,
                                              child: ElevatedButton(
                                                onPressed: () {
                                                  Navigator.of(context).pop();
                                                },
                                                style: ButtonStyle(
                                                    shape: MaterialStateProperty
                                                        .all(RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        15)))),
                                                child: Text(
                                                  "Cancel",
                                                  style:
                                                      TextStyle(fontSize: 19),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ));
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Container(
                            child: Row(
                              children: [
                                (e['image'] != null)
                                    ? (e['image'].runtimeType == String)
                                        ? CircleAvatar(
                                            radius: 30,
                                            backgroundImage:
                                                AssetImage('${e['image']}'),
                                          )
                                        : CircleAvatar(
                                            radius: 30,
                                            backgroundImage:
                                                FileImage(e['image']),
                                          )
                                    : CircleAvatar(
                                        radius: 30,
                                        backgroundColor: Colors.deepOrange[300],
                                      ),
                                SizedBox(
                                  width: 15,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "${e['name']}",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 17),
                                    ),
                                    SizedBox(
                                      height: 18,
                                    ),
                                    Text(
                                      "${e['desc']}",
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                  ],
                                ),
                                Spacer(),
                                Column(
                                  children: [
                                    Text("12:26 PM"),
                                    SizedBox(
                                      height: 35,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ],
            ),
          )
        :
       CupertinoPageScaffold(
        child: Column(
          children: [
            ...allContacts
                .map(
                  (e) => GestureDetector(
                    onTap: () {
                      setState(() {
                        CupertinoActionSheet(
                          actions: [

                          ],
                          title: Text("ZEEL"),
                        );
                      });
                    },
                // onTap: () {
                //   setState(() {
                //     CupertinoDialogAction(
                //       child:  Builder(
                //         builder: (context) {
                //           return Container(
                //             height: 400,
                //             width: double.infinity,
                //             decoration: BoxDecoration(
                //               color: Colors.white,
                //               // borderRadius: BorderRadius.horizontal(left: Radius.circular(30),),
                //             ),
                //             child: Padding(
                //               padding: const EdgeInsets.all(25),
                //               child: Column(
                //                 children: [
                //                   SizedBox(
                //                     height: 15,
                //                   ),
                //                   (e['image'] != null)
                //                       ? (e['image'].runtimeType ==
                //                       String)
                //                       ? CircleAvatar(
                //                     radius: 60,
                //                     backgroundImage:
                //                     AssetImage(
                //                         '${e['image']}'),
                //                   )
                //                       : CircleAvatar(
                //                     radius: 60,
                //                     backgroundImage:
                //                     FileImage(
                //                         e['image']),
                //                   )
                //                       : CircleAvatar(
                //                     radius: 60,
                //                     backgroundColor:
                //                     Colors.deepOrange[300],
                //                   ),
                //                   SizedBox(
                //                     height: 20,
                //                   ),
                //                   Text(
                //                     "${e['name']}",
                //                     style: TextStyle(
                //                         color: Colors.black,
                //                         fontWeight: FontWeight.w500,
                //                         fontSize: 25),
                //                   ),
                //                   SizedBox(
                //                     height: 5,
                //                   ),
                //                   Text(
                //                     "+91 ${e['num']}",
                //                     style: TextStyle(
                //                         color: Colors.grey[600],
                //                         fontSize: 18),
                //                   ),
                //                   SizedBox(
                //                     height: 20,
                //                   ),
                //                   Container(
                //                     width: double.infinity,
                //                     height: 50,
                //                     child: ElevatedButton(
                //                       onPressed: () {},
                //                       style: ButtonStyle(
                //                           shape: MaterialStateProperty
                //                               .all(RoundedRectangleBorder(
                //                               borderRadius:
                //                               BorderRadius
                //                                   .circular(
                //                                   15)))),
                //                       child: Text(
                //                         "Send Message",
                //                         style:
                //                         TextStyle(fontSize: 19),
                //                       ),
                //                     ),
                //                   ),
                //                   SizedBox(
                //                     height: 16,
                //                   ),
                //                   Container(
                //                     width: double.infinity,
                //                     height: 50,
                //                     child: ElevatedButton(
                //                       onPressed: () {
                //                         Navigator.of(context).pop();
                //                       },
                //                       style: ButtonStyle(
                //                           shape: MaterialStateProperty
                //                               .all(RoundedRectangleBorder(
                //                               borderRadius:
                //                               BorderRadius
                //                                   .circular(
                //                                   15)))),
                //                       child: Text(
                //                         "Cancel",
                //                         style:
                //                         TextStyle(fontSize: 19),
                //                       ),
                //                     ),
                //                   ),
                //                 ],
                //               ),
                //              ),
                //           );
                //         }
                //       ),
                //      );
                //   });
                // },
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Container(
                    child: Row(
                      children: [
                        (e['image'] != null)
                            ? (e['image'].runtimeType == String)
                            ? CircleAvatar(
                          radius: 30,
                          backgroundImage:
                          AssetImage('${e['image']}'),
                        )
                            : CircleAvatar(
                          radius: 30,
                          backgroundImage:
                          FileImage(e['image']),
                        )
                            : CircleAvatar(
                          radius: 30,
                          backgroundColor: Colors.deepOrange[300],
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "${e['name']}",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 17),
                            ),
                            SizedBox(
                              height: 18,
                            ),
                            Text(
                              "${e['desc']}",
                              style: TextStyle(color: Colors.grey),
                            ),
                          ],
                        ),
                        Spacer(),
                        Column(
                          children: [
                            Text("12:26 PM"),
                            SizedBox(
                              height: 35,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
                .toList(),
          ],
        ),
      );


    // return ListView.builder(
    //   itemCount: Global.ind.length,
    //     itemBuilder: (context, i) =>
    //     ListTile(
    //       leading: CircleAvatar(
    //         backgroundColor: Colors.grey[300],
    //         backgroundImage: (Global.ind[i].image != null)
    //         ? FileImage(Global.ind[i].image!)
    //         : null,
    //       ),
    //       title: Text("${Global.ind[i].name}"),
    //       subtitle: Text("${Global.ind[i].discription}"),
    //       trailing: Column(
    //         mainAxisAlignment: MainAxisAlignment.start,
    //         children: [
    //           Padding(
    //             padding: const EdgeInsets.only(top: 8.0),
    //             child: Text("12:28 PM"),
    //           ),
    //         ],
    //       ),
    //     ),
    // );
  }
}
