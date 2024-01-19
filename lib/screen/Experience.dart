import 'package:flutter/material.dart';

import 'global.dart';

class Experiences extends StatefulWidget {
  const Experiences({super.key});

  @override
  State<Experiences> createState() => _ExperiencesState();
}

class _ExperiencesState extends State<Experiences> {
  TextEditingController comNameController = TextEditingController();
  TextEditingController schoolColInsController = TextEditingController();
  TextEditingController rolesController = TextEditingController();



  GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Form(
        key: globalKey,
        child: Column(
          children: [
            Container(
              height: 150,
              width: double.infinity,
              color: Colors.green,
              child: Expanded(
                flex: 3,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 100,
                      child: IconButton(onPressed: (){
                        Navigator.of(context).pop('Experiences');
                      }, icon: Icon(Icons.arrow_back_ios_new_outlined)),
                    ),
                    Container(
                      height: 100,
                      child: Center(child: Text("Experiences",style: TextStyle(fontSize: 30),)),
                    ),
                    SizedBox(width: 50,),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 12,
              child: Container(
                height: double.infinity,
                width: double.infinity,
                color: Colors.grey,
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: Container(
                          height: 700,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            color: Colors.white,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Company Name",
                                  style: TextStyle(color: Colors.black,fontSize: 20),
                                ),
                                TextFormField(
                                  validator: (val) {
                                    if (val!.isEmpty) {
                                      return 'Enter your comName first...';
                                    }
                                    return null;
                                  },
                                  onSaved: (val) {
                                    Global.comName = val!;
                                  },
                                  controller: comNameController,
                                  maxLines: 1,
                                  decoration: InputDecoration(
                                    hintText: "New Enterprice",
                                    border: OutlineInputBorder(),

                                  ),
                                ),
                                Text(
                                  "School/collage/institute",
                                  style: TextStyle(color: Colors.black,fontSize: 20),
                                ),
                                TextFormField(
                                  validator: (val) {
                                    if (val!.isEmpty) {
                                      return 'Enter your schoolColIns first...';
                                    }
                                    return null;
                                  },
                                  onSaved: (val) {
                                    Global.schoolColIns = val!;
                                  },
                                  controller: schoolColInsController,
                                  maxLines: 1,
                                  decoration: InputDecoration(
                                    hintText: "Quality Test Engineer",
                                    border: OutlineInputBorder(),

                                  ),
                                ),
                                Text(
                                  "Roles(optional)",
                                  style: TextStyle(color: Colors.black,fontSize: 20),
                                ),
                                TextFormField(
                                  validator: (val) {
                                    if (val!.isEmpty) {
                                      return 'Enter your roles first...';
                                    }
                                    return null;
                                  },
                                  onSaved: (val) {
                                    Global.roles = val!;
                                  },
                                  controller: rolesController,
                                  maxLines: 3,
                                  decoration: InputDecoration(
                                    hintText: "Working with team members",
                                    border: OutlineInputBorder(),

                                  ),
                                ),
                                Text(
                                  "Employed Status",
                                  style: TextStyle(color: Colors.black,fontSize: 20),
                                ),
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Icon(
                                        Icons.radio_button_off,
                                        size: 10,
                                      ),
                                    ),
                                    SizedBox(width: 10),
                                    Text("Previously Employed"),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Icon(
                                        Icons.radio_button_off,
                                        size: 10,
                                      ),
                                    ),
                                    SizedBox(width: 10),
                                    Text("Previously Employed"),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    height: 1,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      border: Border.all(width: 1,color: Colors.black),
                                    ),
                                  ),
                                ),
                                Row(
                                  children: [
                                    Text("Date Joined",style: TextStyle(fontSize: 20),)
                                  ],
                                ),
                                
                                Padding(
                                  padding:  EdgeInsets.only(top: 150,left: 130),
                                  child: ElevatedButton(
                                    onPressed: () {
                                      if (globalKey.currentState!.validate()) {
                                        globalKey.currentState!.save();

                                      }
                                    },
                                    child: const Text("Save"),
                                  ),
                                ),


                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
