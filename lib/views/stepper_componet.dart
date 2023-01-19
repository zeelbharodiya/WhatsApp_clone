import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:whatsapp_clone/views/screens/global.dart';


class StepperComponent extends StatefulWidget {
  const StepperComponent({Key? key}) : super(key: key);

  @override
  State<StepperComponent> createState() => _StepperComponentState();
}

class _StepperComponentState extends State<StepperComponent> {

  int initialstep = 0;

  File? _image;
  ImagePicker pick = ImagePicker();

  String? na;
  String? des;
  String? numbers;

  getImageFromGallary() async{
    XFile? xfile = await pick.pickImage(source: ImageSource.camera);
    String path = xfile!.path;
    setState(() {
      _image = File(path);
    });
  }

  GlobalKey<FormState> formKey =  GlobalKey<FormState>();
  GlobalKey<FormState> formKey1 =  GlobalKey<FormState>();
  GlobalKey<FormState> formKey2 =  GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Stepper(
      currentStep: initialstep,
        onStepContinue: () {
         setState(() {
           if(initialstep < 3){
             ++initialstep;
           }
         });
        },
        onStepCancel: () {
          setState(() {
            if(initialstep > 0){
              --initialstep;
            }
          });
        },
        onStepTapped: (val) {
        setState(() {
          initialstep = val;
        });
        },
       controlsBuilder: (context , controlDetails){
         controlDetails.stepIndex;
         return Row(
           children: [
             (controlDetails.stepIndex == 0)? Padding(
               padding: const EdgeInsets.only(top: 10),
               child: Row(
                 children: [
                   ElevatedButton(
                     onPressed: controlDetails.onStepContinue,
                     child: Text("CONTINUE"),),
                   SizedBox(width: 13,),
                   OutlinedButton(onPressed: controlDetails.onStepCancel, child: Text("CANCEL"),),
                 ],
               ),
             ):(controlDetails.stepIndex==1)?Padding(
               padding: const EdgeInsets.only(top: 10),
               child: Row(
                 children: [
                   ElevatedButton(
                     onPressed: () {
                           if(formKey.currentState!.validate()){
                             formKey.currentState!.save();
                             setState(() {
                               // controlDetails.onStepContinue;
                               if(initialstep < 2){
                                 ++initialstep;
                               }
                             });
                           }
                     },
                     child: Text("CONTINUE"),),
                   SizedBox(width: 13,),
                   OutlinedButton(onPressed: controlDetails.onStepCancel, child: Text("CANCEL"),),
                 ],
               ),
             ):(controlDetails.stepIndex == 2)?Padding(
               padding: const EdgeInsets.only(top: 10),
               child: Row(
                 children: [
                   ElevatedButton(
                     onPressed: () {
                       if(formKey1.currentState!.validate()){
                           formKey1.currentState!.save();
                           setState(() {
                             // controlDetails.onStepContinue;
                             if(initialstep < 3){
                             ++initialstep;
                          }
                         });
                       }
                     },
                     // controlDetails.onStepContinue,
                     child: Text("CONTINUE"),),
                   SizedBox(width: 13,),
                   OutlinedButton(onPressed: controlDetails.onStepCancel, child: Text("CANCEL"),),
                 ],
               ),
             )  : Padding(
                   padding: const EdgeInsets.only(top: 10),
                   child: Row(
               children: [
                   ElevatedButton(
                     onPressed: () {
                       setState(() {
                         // detail c = detail (
                         //   image: _image,
                         //   name: na,
                         //   discription: des,
                         // );

                         if(formKey2.currentState!.validate()){
                           formKey2.currentState!.save();
                           setState(() {
                             // controlDetails.onStepContinue;
                             if(initialstep < 4){
                               Map<String , dynamic> lol = {
                                 'image' : _image,
                                 'name' : na,
                                 'desc' : des,
                                 'num' : numbers,
                                 'time': 'Now',
                               };

                               allContacts.addAll([lol]);

                               Navigator.of(context).pop();
                             }
                           });
                         }


                       });

                   }, child: Text("ADD"),),
                           SizedBox(width: 13,),
                           OutlinedButton(onPressed: controlDetails.onStepCancel, child: Text("CANCEL"),),
                        ],
                     ),
                 ) ,

           ],
         );
       },
      steps: [
        Step(
          isActive: (initialstep >= 0) ? true : false,
          state: StepState.indexed,
          title: Text("PROFILE PHOTO"),
          subtitle: Text("Add profile photo"),
          content: Stack(
            alignment: Alignment.bottomRight,
            children: [
              (_image != null)
              ? CircleAvatar(
                radius: 55,
                // backgroundColor: Colors.grey[300],
                backgroundImage: (_image != null)
                ? FileImage(_image!)
                : null,
             ): CircleAvatar(
                radius: 55,
                backgroundColor: Colors.grey[300],
              ),
              FloatingActionButton(
                onPressed: () {
                  setState(() {
                    getImageFromGallary();
                  });
                },
                mini: true,
                child: Icon(Icons.add),
              ),
            ],
          ),
        ),
        Step(
          isActive: (initialstep >= 1) ? true : false,
          title: Text("NAME"),
          subtitle: Text("Enter name"),
          content: Form(
            key: formKey,
            child: TextFormField(
              validator: (val) {
                if(val!.isEmpty){
                  return "Please enter name...";
                }
              },
              onSaved: (val) {
                setState(() {
                  na = val;
                });
              },
              decoration: InputDecoration(
                hintText: "Suresh Shah",
                border: OutlineInputBorder(),
              ),
            ),
          ),
        ),
        Step(
          isActive: (initialstep >= 2) ? true : false,
          title: Text("DISCRIPATION"),
          subtitle: Text("Enter discripation"),
          content: Form(
            key: formKey1,
            child: TextFormField(
              validator: (val) {
                if(val!.isEmpty){
                  return "Please enter desc...";
                }
              },
              onSaved: (val) {
                setState(() {
                  des = val;
                });
              },
              decoration: InputDecoration(
                hintText: "Welcome to PcApp",
                border: OutlineInputBorder(),
              ),
            ),
          ),
        ),
        Step(
          isActive: (initialstep >= 3) ? true : false,
          title: Text("NUMBER"),
          subtitle: Text("Enter Number"),
          content: Form(
            key: formKey2,
            child: TextFormField(
              validator: (val) {
                if(val!.isEmpty){
                  return "Please enter num...";
                }
              },
              keyboardType: TextInputType.number,
              onSaved: (val) {
                setState(() {
                  numbers = val;
                });
              },
              decoration: InputDecoration(
                hintText: "Number",
                border: OutlineInputBorder(),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
