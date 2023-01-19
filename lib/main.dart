import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp_clone/views/callpage.dart';
import 'package:whatsapp_clone/views/chatpage.dart';
import 'package:whatsapp_clone/views/drawerpage.dart';
import 'package:whatsapp_clone/views/screens/global.dart';
import 'package:whatsapp_clone/views/statuspage.dart';
import 'package:whatsapp_clone/views/stepper_componet.dart';


void main() {
  runApp(
    Myapp(),
  );
}

class Myapp extends StatefulWidget {
  const Myapp({Key? key}) : super(key: key);

  @override
  State<Myapp> createState() => _MyappState();
}

class _MyappState extends State<Myapp> with SingleTickerProviderStateMixin {
  // late TabController tabController;
  // PageController pageController = PageController();

  // int currentItem = 0;

  List<String> tabname = [
    "CHATS",
    "CALLS",
    "SETTING",
  ];

  @override
  void initState() {
    Global.tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  int currentCupertinoIndex = 0;

  @override
  Widget build(BuildContext context) {
    return (Global.isIOS == false)
        ? MaterialApp(
            debugShowCheckedModeBanner: false,
            home: Scaffold(
              drawer: Drawer(
                child: DrawerPage(),
              ),
              appBar: AppBar(
                backgroundColor: Colors.teal,
                title: Text(
                  "WhatsApp",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.w700),
                ),
                actions: [
                  Switch(
                      activeTrackColor: Colors.green,
                      activeColor: Colors.white,
                      value: Global.isIOS,
                      inactiveTrackColor: Colors.white60,
                      onChanged: (val) {
                        setState(() {
                          Global.isIOS = val;
                          // Global.swval = val;
                          // if(Global.swval == false){
                          //   Platform.isAndroid;
                          // }else if(Global.swval == true){
                          //   Platform.isIOS;
                          // }
                        });
                      }),
                ],
                bottom: TabBar(
                  controller: Global.tabController,
                  indicatorColor: Colors.white,
                  indicatorWeight: 4,
                  indicatorSize: TabBarIndicatorSize.tab,
                  onTap: (val) {
                    setState(() {
                      Global.currentItem = val;
                    });
                    Global.pageController.animateToPage(val,
                        duration: Duration(milliseconds: 200),
                        curve: Curves.easeInOut);
                  },
                  tabs: tabname
                      .map((e) => Tab(
                            text: e,
                          ))
                      .toList(),
                ),
              ),
              body: PageView(
                onPageChanged: (val) {
                  setState(() {
                    Global.currentItem = val;
                  });
                  Global.tabController.animateTo(val);
                },
                controller: Global.pageController,
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                pageSnapping: true,
                children: [
                  ChatPage(),
                  StatusPage(),
                  CallPage(),
                ],
              ),
              floatingActionButton: Builder(builder: (context) {
                return FloatingActionButton(
                  onPressed: () async {
                    await showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          scrollable: true,
                          content: Container(
                            // width: MediaQuery.of(context).size.width / 3,
                            // height: MediaQuery.of(context).size.height / 1.8,
                            width: 390,
                            height: 500,
                            child: StepperComponent(),
                          ),
                        );
                      },
                    );
                    setState(() {});
                  },
                  child: Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                );
              }),
              // bottomNavigationBar: BottomNavigationBar(
              //   backgroundColor: Colors.purpleAccent[100],
              //   iconSize: 30,
              //   currentIndex: currentItem,
              //   fixedColor: Colors.white,
              //   onTap: (val) {
              //     setState(() {
              //       currentItem = val;
              //     });
              //     tabController.animateTo(val);
              //     pageController.animateToPage(val, duration: Duration(milliseconds: 200), curve: Curves.easeInOut);
              //   },
              //   items: <BottomNavigationBarItem>[
              //     BottomNavigationBarItem(icon: Icon(Icons.home,size: 30,),label: ""),
              //     BottomNavigationBarItem(icon: Icon(Icons.call),label: ""),
              //     BottomNavigationBarItem(icon: Icon(Icons.settings),label: ""),
              //   ],
              // ),
            ),
          )
        : CupertinoApp(
            debugShowCheckedModeBanner: false,
            home: CupertinoPageScaffold(
              navigationBar: CupertinoNavigationBar(
                leading: Container(),
                middle: Text(
                  "WhatsApp",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.w700),
                ),
                backgroundColor: Colors.teal,
                trailing: CupertinoSwitch(
                    value: Global.isIOS,
                    onChanged: (val) {
                      setState(() {
                        Global.isIOS = val;

                        // Global.swval = val;
                        // if(Global.swval == false){
                        //   Platform.isAndroid;
                        // }else if(Global.swval == true){
                        //   Platform.isIOS;
                        // }
                      });
                    }),
              ),
              child: Container(
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    IndexedStack(
                      index: Global.currentItem,
                      children: [
                        ChatPage(),
                        CallPage(),
                        StatusPage(),
                      ],
                    ),
                    CupertinoTabBar(
                      // currentIndex: currentCupertinoIndex,
                      // onTap: (val) {
                      //   setState(() {
                      //     currentCupertinoIndex = val;
                      //   });
                      // },
                      backgroundColor: Colors.purpleAccent[100],
                      iconSize: 30,
                      currentIndex: Global.currentItem,
                      activeColor: Colors.white,
                      onTap: (val) {
                        setState(() {
                          Global.currentItem = val;
                          // currentCupertinoIndex = val;
                        });
                        Global.tabController.animateTo(val);
                        Global.pageController.animateToPage(val,
                            duration: Duration(milliseconds: 200),
                            curve: Curves.easeInOut);
                      },
                      items: [
                        BottomNavigationBarItem(
                            icon: Icon(Icons.home), label: "Home"),
                        BottomNavigationBarItem(
                            icon: Icon(Icons.phone), label: "Calls"),
                        BottomNavigationBarItem(
                            icon: Icon(Icons.settings), label: "Settings"),
                      ],
                    ),
                    // Padding(
                    //   padding: const EdgeInsets.only(bottom: 65, right: 15),
                    //      child: Align(
                    //         alignment: Alignment.bottomRight,
                    //           child: Builder(
                    //             builder: (context) {
                    //               return GestureDetector(
                    //                 onTap: ()  {
                    //                   setState(() async {
                    //                     await showCupertinoDialog(context: context, builder: (context) {
                    //                       return CupertinoAlertDialog(
                    //                         content: Container(
                    //                           width: 390,
                    //                           height: 500,
                    //                           child: StepperComponent(),
                    //                         ),
                    //                       );
                    //                     });
                    //                     // StepperComponent();
                    //                     // showModalBottomSheet(context: context, builder: (context) {
                    //                     //   return Column(
                    //                     //     children: [
                    //                     //       Expanded(
                    //                     //         flex: 3,
                    //                     //         child: Container(color: Colors.blue,),),
                    //                     //       Expanded(
                    //                     //         flex: 7,
                    //                     //         child: Container(color: Colors.deepOrange,),),
                    //                     //     ],
                    //                     //   );
                    //                     // },);
                    //                   });
                    //                 },
                    //                 child: Container(
                    //                   height: 60,
                    //                   width: 60,
                    //                   decoration: BoxDecoration(
                    //                     color: Colors.blue,
                    //                     borderRadius: BorderRadius.circular(100),
                    //                   ),
                    //                 ),
                    //               );
                    //             }
                    //           ),
                    //       ),
                    //
                    // ),
                    // Padding(
                    //   padding: const EdgeInsets.only(bottom: 80, right: 32),
                    //   child: Align(
                    //     alignment: Alignment.bottomRight,
                    //     child: Icon(
                    //       Icons.add,
                    //       color: Colors.white,
                    //       size: 25,
                    //     ),
                    //   ),
                    // ),
                    // // PageView(
                    // //   onPageChanged: (val) {
                    // //     setState(() {
                    // //       Global.currentItem = val;
                    // //     });
                    // //     Global.tabController.animateTo(val);
                    // //   },
                    // //   controller: Global.pageController,
                    // //   physics: BouncingScrollPhysics(),
                    // //   scrollDirection: Axis.horizontal,
                    // //   pageSnapping: true,
                    // //   children: [
                    // //     ChatPage(),
                    // //     CallPage(),
                    // //     SettingPage(),
                    // //   ],
                    // // ),
                  ],
                ),
              ),
            ),
          );
  }
}
