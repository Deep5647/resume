
import 'package:flutter/material.dart';

import 'global.dart';

class Projects extends StatefulWidget {
  const Projects({super.key});

  @override
  State<Projects> createState() => _ProjectsState();
}

class _ProjectsState extends State<Projects> {

  TextEditingController proTitleController = TextEditingController();
  TextEditingController proRolesController = TextEditingController();
  TextEditingController technologiesExController = TextEditingController();
  TextEditingController proDescController = TextEditingController();

  GlobalKey<FormState> globalKey =  GlobalKey<FormState>();

  List<Map<String, dynamic>> tech =[
    {
      'isSelect': false,
      'techName' : 'C Programming'
    },
    {
      'isSelect': false,
      'techName' : 'C++'
    },
    {
      'isSelect': false,
      'techName' : 'Flutter'
    },
  ];
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
                        Navigator.of(context).pop('Projects');
                      }, icon: Icon(Icons.arrow_back_ios_new_outlined)),
                    ),
                    Container(
                      height: 100,
                      child: Center(child: Text("Projects",style: TextStyle(fontSize: 30),)),
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
                        padding:  EdgeInsets.all(20),
                        child: Container(
                          height: 800,
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
                                  "Project Title",
                                  style: TextStyle(color: Colors.black,fontSize: 20),
                                ),
                                TextFormField(
                                  validator: (val) {
                                    if (val!.isEmpty) {
                                      return 'Enter your proTitle first...';
                                    }
                                    return null;
                                  },
                                  onSaved: (val) {
                                    Global.proTitle = val!;
                                  },
                                  controller: proTitleController,
                                  maxLines: 1,
                                  decoration: InputDecoration(
                                    hintText: "Resume Bulider App",
                                    border: OutlineInputBorder(),

                                  ),
                                ),
                                Text(
                                  "Technologies",
                                  style: TextStyle(color: Colors.black,fontSize: 20),
                                ),
                                ...tech.map((e) {
                                  return CheckboxListTile(
                                    title: Text('${e['techName']}'),
                                    value: e['isSelect'],
                                    onChanged: (val) {
                                      setState(() {
                                        e['isSelect'] = val!;
                                      });
                                    },
                                  );
                                }),
                             //ElevatedButton(
                             //  onPressed: () {},
                             //  child: const Text('Save'),
                             //),
                             //...tech.map((e) {
                             //  if (e['isSelect'] == true) {
                             //    return Text('${e['techName']}');
                             //  } else {
                             //    return Container();
                             //  }
                             //}),

                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "Roles",
                                    style: TextStyle(color: Colors.black,fontSize: 20),
                                  ),
                                ),
                                TextFormField(
                                  validator: (val) {
                                    if (val!.isEmpty) {
                                      return 'Enter your proRoles first...';
                                    }
                                    return null;
                                  },
                                  onSaved: (val) {
                                    Global.proRoles = val!;
                                  },
                                  controller: proRolesController,
                                  maxLines: 1,
                                  decoration: InputDecoration(
                                    hintText: "Organize team members",
                                    border: OutlineInputBorder(),

                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "Technologies",
                                    style: TextStyle(color: Colors.black,fontSize: 20),
                                  ),
                                ),
                                TextFormField(
                                  validator: (val) {
                                    if (val!.isEmpty) {
                                      return 'Enter your technologiesEx first...';
                                    }
                                    return null;
                                  },
                                  onSaved: (val) {
                                    Global.technologiesEx = val!;
                                  },
                                  controller: technologiesExController,
                                  maxLines: 1,
                                  decoration: InputDecoration(
                                    hintText: "5 - Programmers",
                                    border: OutlineInputBorder(),

                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "Project Descripation",
                                    style: TextStyle(color: Colors.black,fontSize: 20),
                                  ),
                                ),
                                TextFormField(
                                  validator: (val) {
                                    if (val!.isEmpty) {
                                      return 'Enter your proDesc first...';
                                    }
                                    return null;
                                  },
                                  onSaved: (val) {
                                    Global.proDesc = val!;
                                  },
                                  controller: proDescController,
                                  maxLines: 1,
                                  decoration: InputDecoration(
                                    hintText: "Enter Your Project Descripation",
                                    border: OutlineInputBorder(),

                                  ),
                                ),
                                Padding(
                                  padding:  EdgeInsets.only(top: 10,left: 130),
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
