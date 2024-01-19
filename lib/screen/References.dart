import 'package:flutter/material.dart';

import 'global.dart';

class References extends StatefulWidget {
  const References({super.key});

  @override
  State<References> createState() => _ReferencesState();
}

class _ReferencesState extends State<References> {
  TextEditingController refNameController = TextEditingController();
  TextEditingController designationController = TextEditingController();
  TextEditingController orgInstNameController = TextEditingController();


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
                        Navigator.of(context).pop('References');
                      }, icon: Icon(Icons.arrow_back_ios_new_outlined)),
                    ),
                    Container(
                      height: 100,
                      child: Center(child: Text("References",style: TextStyle(fontSize: 30),)),
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
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: Container(
                          height: 370,
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
                                  "Reference Name",
                                  style: TextStyle(color: Colors.black,fontSize: 20),
                                ),
                                TextFormField(
                                  validator: (val) {
                                    if (val!.isEmpty) {
                                      return 'Enter your refName first...';
                                    }
                                    return null;
                                  },
                                  onSaved: (val) {
                                    Global.refName = val!;
                                  },
                                  controller: refNameController,
                                  maxLines: 1,
                                  decoration: InputDecoration(
                                    hintText: "Suresh shah",
                                    border: OutlineInputBorder(),

                                  ),
                                ),
                                Text(
                                  "Designation",
                                  style: TextStyle(color: Colors.black,fontSize: 20),
                                ),
                                TextFormField(
                                  validator: (val) {
                                    if (val!.isEmpty) {
                                      return 'Enter your designation first...';
                                    }
                                    return null;
                                  },
                                  onSaved: (val) {
                                    Global.designation = val!;
                                  },
                                  controller: designationController,
                                  maxLines: 1,
                                  decoration: InputDecoration(
                                    hintText: "Marketing Manager,ID: 200000",
                                    border: OutlineInputBorder(),

                                  ),
                                ),
                                Text(
                                  "Oraganization/Institute",
                                  style: TextStyle(color: Colors.black,fontSize: 20),
                                ),
                                TextFormField(
                                  validator: (val) {
                                    if (val!.isEmpty) {
                                      return 'Enter your orgInstName first...';
                                    }
                                    return null;
                                  },
                                  onSaved: (val) {
                                    Global.orgInstName = val!;
                                  },
                                  controller: orgInstNameController,
                                  maxLines: 1,
                                  decoration: InputDecoration(
                                    hintText: "Green Energy Pvt. Ltd",
                                    border: OutlineInputBorder(),

                                  ),
                                ),

                              ],
                            ),
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          OutlinedButton(
                            onPressed: () {},
                            child: const Text("Clear"),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              if (globalKey.currentState!.validate()) {
                                globalKey.currentState!.save();
                                Navigator.of(context).pushNamed('detail');
                              }
                            },
                            child: const Text("Save"),
                          ),
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
    );
  }
}
