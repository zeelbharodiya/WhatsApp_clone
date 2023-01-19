import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


import '../callpage.dart';
import '../chatpage.dart';
import '../drawerpage.dart';
import '../statuspage.dart';
import '../stepper_componet.dart';
import 'global.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {

  // late TabController tabController;
  // PageController pageController = PageController();

  // int currentItem = 0;

  List<String> tabname = [
    "CHATS",
    "STATUS",
    "CALLS",
  ];

  @override
  void initState() {
    Global.tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.teal,
          title: Text(
            "WhatsApp",
            style: TextStyle(
                color: Colors.white, fontSize: 22, fontWeight: FontWeight.w700),
          ),
          actions: [
            Switch(
              activeTrackColor: Colors.green,
                activeColor: Colors.white,
                value: Global.swval,
                inactiveTrackColor: Colors.white60,
                onChanged: (val) {
                     setState(() {
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
                  duration: Duration(milliseconds: 200), curve: Curves.easeInOut);
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
            CallPage(),
            StatusPage(),
          ],
        ),
        floatingActionButton: Builder(
          builder: (context) {
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
          }
        ),

      ),
    );
  }
}
