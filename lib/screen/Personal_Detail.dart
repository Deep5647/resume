import 'package:flutter/material.dart';

import 'global.dart';

class Personal_Detail extends StatefulWidget {
  const Personal_Detail({super.key});

  @override
  State<Personal_Detail> createState() => _Personal_DetailState();
}

class _Personal_DetailState extends State<Personal_Detail> {

  TextEditingController dobController = TextEditingController();
  TextEditingController nationalityController = TextEditingController();


  GlobalKey<FormState> globalKey = GlobalKey<FormState>();

  String genderVal = '';

  List<Map<String, dynamic>> lang = [
    {
      'isSelect': false,
      'langName': 'English',
    },
    {
      'isSelect': false,
      'langName': 'Hindi',
    },
    {
      'isSelect': false,
      'langName': 'Gujarati',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return  Scaffold(

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
                        Navigator.of(context).pop('Personal_Detail');
                      }, icon: Icon(Icons.arrow_back_ios_new_outlined)),
                    ),
                    Container(
                      height: 100,
                      child: Center(child: Text("Personal_Detail",style: TextStyle(fontSize: 30),)),
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
                          height: 650,
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
                                  "D.O.B",
                                  style: TextStyle(color: Colors.black,fontSize: 20),
                                ),
                                TextFormField(
                                  validator: (val) {
                                    if (val!.isEmpty) {
                                      return 'Enter your dob first...';
                                    }
                                    return null;
                                  },
                                  onSaved: (val) {
                                    Global.dob = val!;
                                  },
                                  controller: dobController,

                                  maxLines: 1,
                                  decoration: InputDecoration(
                                    hintText: "DD/MM/YY",
                                    border: OutlineInputBorder(),

                                  ),
                                ),
                                Padding(
                                  padding:  EdgeInsets.only(top: 10),
                                  child: Text("Marital status",style: TextStyle(fontSize: 20),),
                                ),
                                RadioListTile(
                                  title:  Text('Single'),
                                  value: 'Single',
                                  groupValue: genderVal,
                                  onChanged: (val) {
                                    setState(() {
                                      genderVal = val!;
                                    });
                                  },
                                ),
                                RadioListTile(
                                  title:  Text('Marride'),
                                  value: 'Marride',
                                  groupValue: genderVal,
                                  onChanged: (val) {
                                    setState(() {
                                      genderVal = val!;
                                    });
                                  },
                                ),

                                Padding(
                                  padding:  EdgeInsets.only(top: 10),
                                  child: Text("Languages known ",style: TextStyle(fontSize: 20),),
                                ),
                                ...lang.map((e) {
                                  return CheckboxListTile(
                                    title: Text('${e['langName']}'),
                                    value: e['isSelect'],
                                    onChanged: (val) {
                                      setState(() {
                                        e['isSelect'] = val!;
                                      });
                                    },
                                  );
                                }),
                                ElevatedButton(
                                  onPressed: () {},
                                  child: const Text('Save'),
                                ),
                                ...lang.map((e) {
                                  if (e['isSelect'] == true) {
                                    return Text('${e['langName']}');
                                  } else {
                                    return Container();
                                  }
                                }),




                                Padding(
                                  padding:  EdgeInsets.only(top: 10),
                                  child: Text("Nationality ",style: TextStyle(fontSize: 20),),
                                ),
                                TextFormField(
                                  validator: (val) {
                                    if (val!.isEmpty) {
                                      return 'Enter your empty first...';
                                    }
                                    return null;
                                  },
                                  onSaved: (val) {
                                    Global.nationality = val!;
                                  },
                                  controller: nationalityController,
                                  maxLines: 1,
                                  decoration: InputDecoration(
                                    hintText: "Indian",
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
/*
import 'dart:io';

import 'package:flutter/material.dart';

class Global {
  static String name = '';
  static String email = '';
  static String phone = '';
  static String add1 = '';
  static String add2 = '';
  static String add3 = '';
  static File? imgPic;
  static String careerObj = '';
  static String currentDesignation = '';
  static String dob = '';
  static String maritalStatus = '';
  static List<String> langKnown = [];
  static String nationality = '';
  static String comName = '';
  static String schoolColIns = '';
  static String roles = '';
  static bool EmployedStatus = false;
  static String joinDate = '';
  static String exitDate = '';
  static List<TextEditingController> Skills = [TextEditingController()];
  static String proTitle = '';
  static List<String> technologiesList = [];
  static String proRoles = '';
  static String technologiesEx = '';
  static String proDesc = '';
  static List<String> Achivements = [];
  static String refName = '';
  static String designation = '';
  static String orgInstName = '';
  static String DeclarationDesc = '';
  static String date_decl = '';
  static String placeIntCity = '';
}

List<Map<String, dynamic>> lang = [
  {
    'isSelect': false,
    'langName': 'English',
  },
  {
    'isSelect': false,
    'langName': 'Hindi',
  },
  {
    'isSelect': false,
    'langName': 'Gujarati',
  },
];
 */


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

/*

// 10/10/2023    -- Button radio , CheckBox , Switch Button


import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';

import '../utils/global.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController contactController = TextEditingController();

  String genderVal = '';
  bool switchVal = false;

  List<Map<String, dynamic>> hobby = [
    {
      'isSelect': false,
      'hobbyName': 'Reading',
    },
    {
      'isSelect': false,
      'hobbyName': 'Singing',
    },
    {
      'isSelect': false,
      'hobbyName': 'Dancing',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Page"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed('contact');
            },
            icon: const Icon(Icons.contact_page),
          ),
          IconButton(
            onPressed: () async {
              final LocalAuthentication localAuth = LocalAuthentication();

              if (await localAuth.isDeviceSupported() == true ||
                  await localAuth.canCheckBiometrics == true) {
                localAuth
                    .authenticate(
                        localizedReason: 'Authenticate for hidden contact')
                    .then((value) {
                  Navigator.of(context).pushNamed('hidden');
                });
              }
            },
            icon: const Icon(Icons.unarchive),
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(12),
        alignment: Alignment.topCenter,
        child: SizedBox(
          height: 480,
          child: Column(
            children: [
              Expanded(
                flex: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Declaration"),
                    Switch(
                      value: switchVal,
                      onChanged: (val) {
                        setState(() {
                          switchVal = val;
                        });
                      },
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 4,
                child: (switchVal)
                    ? Container(
                        color: Colors.red,
                      )
                    : Container(),
              ),
            ],
          ),
        ),
      ),
       body: Container(
         alignment: Alignment.center,
         child: Column(
           mainAxisAlignment: MainAxisAlignment.center,
           children: [
             RadioListTile(
               title: const Text('Male'),
               subtitle: const Text('Gender'),
               value: 'Male',
               groupValue: genderVal,
               onChanged: (val) {
                 setState(() {
                   genderVal = val!;
                 });
               },
             ),
             RadioListTile(
               title: const Text('Female'),
               subtitle: const Text('Gender'),
               value: 'Female',
               groupValue: genderVal,
               onChanged: (val) {
                 setState(() {
                   genderVal = val!;
                 });
               },
             ),
             RadioListTile(
               title: const Text('Others'),
               subtitle: const Text('Gender'),
               value: 'Other',
               groupValue: genderVal,
               onChanged: (val) {
                 setState(() {
                   genderVal = val!;
                 });
               },
             ),
             const SizedBox(height: 30),
             ...hobby.map((e) {
               return CheckboxListTile(
                 title: Text('${e['hobbyName']}'),
                 value: e['isSelect'],
                 onChanged: (val) {
                   setState(() {
                     e['isSelect'] = val!;
                   });
                 },
               );
             }),
             const SizedBox(height: 30),
             ElevatedButton(
               onPressed: () {},
               child: const Text('Save'),
             ),
             const SizedBox(height: 30),
             ...hobby.map((e) {
               if (e['isSelect'] == true) {
                 return Text('${e['hobbyName']}');
               } else {
                 return Container();
               }
             }),
             Switch(
               value: switchVal,
               onChanged: (val) {
                 setState(() {
                   switchVal = val;
                 });
               },
             ),
           ],
         ),
       ),

);
}
}
 */