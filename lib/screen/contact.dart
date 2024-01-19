
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'global.dart';

class Contact_Info extends StatefulWidget {
  const Contact_Info({super.key});

  @override
  State<Contact_Info> createState() => _Contact_InfoState();
}

class _Contact_InfoState extends State<Contact_Info> {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController  = TextEditingController();
  TextEditingController add1Controller = TextEditingController();
  TextEditingController emailController = TextEditingController();


  bool isTrue=true;
  GlobalKey<FormState> globalKey = GlobalKey<FormState>();

  File? file;


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
                        Navigator.of(context).pop('Contact_Info');
                      }, icon: Icon(Icons.arrow_back_ios_new_outlined)),
                    ),
                    Container(
                      height: 100,
                      child: Center(child: Text("Contact_Info",style: TextStyle(fontSize: 30),)),
                    ),
                    SizedBox(width: 50,),
                  ],
                ),
              ),
            ),
       //    Row(
       //    children: [
       //      Expanded(
       //        child: Column(
       //          crossAxisAlignment: CrossAxisAlignment.center,
       //          mainAxisAlignment: MainAxisAlignment.end,
       //          children: [
       //            GestureDetector(
       //              onTap: () {
       //                setState(() {
       //                  isTrue = true;
       //                });
       //              },
       //              child: Text(
       //                "Contact",
       //                style: TextStyle(
       //                    fontSize: 18, color: Colors.black),
       //              ),
       //            ),
       //            const SizedBox(height: 20),
       //            Container(
       //              height: 2,
       //              width: double.infinity,
       //              color: (isTrue == true)
       //                  ? Colors.yellow
       //                  : Colors.blue,
       //            ),
       //          ],
       //        ),
       //      ),
       //      Expanded(
       //        child: Column(
       //          crossAxisAlignment: CrossAxisAlignment.center,
       //          mainAxisAlignment: MainAxisAlignment.end,
       //          children: [
       //            GestureDetector(
       //  ),

            Expanded(
              flex: 12,
              child: Container(
                height: double.infinity,
                width: double.infinity,
                color: Colors.grey,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      (file != null)
                          ? CircleAvatar(
                        radius: 70,
                        backgroundColor: Colors.grey,
                        backgroundImage: FileImage(file!),
                      )
                       :  CircleAvatar(
                        radius: 70,
                        backgroundColor: Colors.grey,
                        backgroundImage: NetworkImage(
                            'https://static.vecteezy.com/system/resources/previews/003/773/576/non_2x/business-man-icon-free-vector.jpg'),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          FloatingActionButton(
                            onPressed: () async {
                              final ImagePicker picker = ImagePicker();

                              XFile? res = await picker.pickImage(
                                  source: ImageSource.camera);

                              String? path = res!.path;
                              setState(() {
                                file = File(path);
                              });
                            },
                            mini: true,
                            child: const Icon(Icons.camera),
                          ),
                          FloatingActionButton(
                            onPressed: () async {
                              final ImagePicker picker = ImagePicker();

                              XFile? res = await picker.pickImage(
                                  source: ImageSource.gallery);

                              String? path = res!.path;
                              setState(() {
                                file = File(path);
                              });
                            },
                            mini: true,
                            child: const Icon(Icons.photo),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: Container(
                          height: 500,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            color: Colors.white,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(20),
                            child: SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding:  EdgeInsets.all(10),
                                    child: TextFormField(
                                      validator: (val) {
                                        if (val!.isEmpty) {
                                          return 'Enter your name first...';
                                        }
                                        return null;
                                      },
                                      onSaved: (val) {
                                        Global.name = val!;
                                      },
                                      controller: nameController,
                                      onFieldSubmitted: (val){},
                                      maxLines: 1,
                                      decoration: const InputDecoration(
                                        icon: Icon(Icons.account_circle_rounded),
                                        hintText: "Name",
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding:  EdgeInsets.all(10),
                                    child: TextFormField(
                                      validator: (val) {
                                        if (val!.isEmpty) {
                                          return 'Enter your Email first...';
                                        }
                                        return null;
                                      },
                                      onSaved: (val) {
                                        Global.email = val!;
                                      },
                                      controller: emailController,
                                      maxLines: 1,
                                      decoration: InputDecoration(
                                        icon: Icon(Icons.email_outlined),
                                        hintText: "Email",

                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding:  EdgeInsets.all(10),
                                    child: TextFormField(
                                      validator: (val) {
                                        if (val!.isEmpty) {
                                          return 'Enter your contact first...';
                                        }
                                        return null;
                                      },
                                      onSaved: (val) {
                                        Global.phone = val!;
                                      },
                                      controller: phoneController,
                                      maxLines: 1,
                                      decoration: InputDecoration(
                                        icon: Icon(Icons.phone_android),
                                        hintText: "Phone",

                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding:  EdgeInsets.all(10),
                                    child: TextFormField(
                                      validator: (val) {
                                        if (val!.isEmpty) {
                                          return 'Enter your contact first...';
                                        }
                                        return null;
                                      },
                                      onSaved: (val) {
                                        Global.add1 = val!;
                                      },
                                      controller: add1Controller,
                                      maxLines: 1,
                                      decoration: InputDecoration(
                                        icon: Icon(Icons.location_on_outlined),
                                        hintText: "Address (Street,Building No)",

                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding:  EdgeInsets.all(10),
                                    child: TextFormField(
                                      maxLines: 1,
                                      decoration: InputDecoration(
                                        hintText: "Address (Street,Building No)",

                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding:  EdgeInsets.all(10),
                                    child: TextFormField(
                                      maxLines: 1,
                                      decoration: InputDecoration(
                                        hintText: "Address (Street,Building No)",

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

/*
import 'package:core_flutter_5pm/detail.dart';
import 'package:core_flutter_5pm/global.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const HomePage(),
        'detail': (context) => const DetailPage(),
      },
    ),
  );
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController contactController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  GlobalKey<FormState> globalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Page"),
      ),
      body: Container(
        padding: const EdgeInsets.all(25),
        alignment: Alignment.center,
        child: Form(
          key: globalKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                validator: (val) {
                  if (val!.isEmpty) {
                    return 'Enter your name first...';
                  }
                  return null;
                },
                onSaved: (val) {
                  Global.name = val!;
                },
                controller: nameController,
                maxLines: 5,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Name",
                ),
              ),
              const SizedBox(height: 20),
              TextFormField(
                validator: (val) {
                  if (val!.isEmpty) {
                    return 'Enter your contact first...';
                  }
                  return null;
                },
                onSaved: (val) {
                  Global.contact = val!;
                },
                controller: contactController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Contact",
                ),
              ),
              const SizedBox(height: 20),
              TextFormField(
                validator: (val) {
                  if (val!.isEmpty) {
                    return 'Enter your age first...';
                  }
                  return null;
                },
                onSaved: (val) {
                  Global.age = int.parse(val!);
                },
                controller: ageController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Age",
                ),
              ),
              const SizedBox(height: 20),
              TextFormField(
                validator: (val) {
                  if (val!.isEmpty) {
                    return 'Enter your email first...';
                  }
                  return null;
                },
                onSaved: (val) {
                  Global.email = val!;
                },
                controller: emailController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Email",
                ),
              ),
              const SizedBox(height: 50),
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        mini: true,
        child: Icon(Icons.add),
      ),
    );
  }
}

 */
/*
// ignore_for_file: prefer_const_constructors, camel_case_types, sort_child_properties_last, prefer_const_literals_to_create_immutables

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'util.dart';

class Contact_Info extends StatefulWidget {
  const Contact_Info({super.key});

  @override
  State<Contact_Info> createState() => _Contact_InfoState();
}

class _Contact_InfoState extends State<Contact_Info> {
  bool isTrue = true;

  TextEditingController picController = TextEditingController();

  GlobalKey<FormState> globalKey = GlobalKey<FormState>();

  File? file;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        elevation: 0,
        title: Text("Resume WorkSpace"),
        centerTitle: true,
      ),
      body: Form(
        child: Column(
          children: [
            Container(
              height: 70,
              width: double.infinity,
              child: Expanded(
                flex: 1,
                child: Container(
                  color: Colors.blue,
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  isTrue = true;
                                });
                              },
                              child: Text(
                                "Contact",
                                style: TextStyle(
                                    fontSize: 18, color: Colors.white),
                              ),
                            ),
                            const SizedBox(height: 20),
                            Container(
                              height: 2,
                              width: double.infinity,
                              color: (isTrue == true)
                                  ? Colors.yellow
                                  : Colors.blue,
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  isTrue = false;
                                });
                              },
                              child: Text(
                                "Photo",
                                style: TextStyle(
                                    fontSize: 18, color: Colors.white),
                              ),
                            ),
                            const SizedBox(height: 20),
                            Container(
                              height: 2,
                              width: double.infinity,
                              color: (isTrue == false)
                                  ? Colors.yellow
                                  : Colors.blue,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 10,
              child: (isTrue == true)
                  ? Container(
                      padding: EdgeInsets.all(20),
                      alignment: Alignment.topCenter,
                      child: SingleChildScrollView(
                        child: Container(
                          height: 500,
                          color: Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.all(20),
                            child: Column(
                              children: [
                                // Contact
                                Row(
                                  children: [
                                    Expanded(
                                        flex: 1,
                                        child: Icon(
                                          Icons.person,
                                          size: 40,
                                        )),
                                    SizedBox(width: 10),
                                    Expanded(
                                      flex: 5,
                                      child: TextFormField(
                                        obscureText: true,
                                        keyboardType:
                                            TextInputType.emailAddress,
                                        decoration:
                                            InputDecoration(hintText: "Name"),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 20),
                                Row(
                                  children: [
                                    Expanded(
                                        flex: 1,
                                        child: Icon(
                                          Icons.mail,
                                          size: 40,
                                        )),
                                    SizedBox(width: 10),
                                    Expanded(
                                      flex: 5,
                                      child: TextFormField(
                                        obscureText: true,
                                        keyboardType:
                                            TextInputType.emailAddress,
                                        decoration:
                                            InputDecoration(hintText: "Email"),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 20),
                                Row(
                                  children: [
                                    Expanded(
                                        flex: 1,
                                        child: Icon(
                                          Icons.phone_android,
                                          size: 40,
                                        )),
                                    SizedBox(width: 10),
                                    Expanded(
                                      flex: 5,
                                      child: TextFormField(
                                        obscureText: true,
                                        keyboardType:
                                            TextInputType.emailAddress,
                                        decoration:
                                            InputDecoration(hintText: "Phone"),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 20),
                                Row(
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: Icon(
                                        Icons.location_on,
                                        size: 40,
                                      ),
                                    ),
                                    SizedBox(width: 10),
                                    Expanded(
                                      flex: 5,
                                      child: TextFormField(
                                        obscureText: true,
                                        keyboardType:
                                            TextInputType.emailAddress,
                                        decoration: InputDecoration(
                                            hintText:
                                                "Address (Street, Building No)"),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 20),
                                Row(
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: Icon(
                                        Icons.location_on,
                                        size: 40,
                                        color: Colors.transparent,
                                      ),
                                    ),
                                    Expanded(
                                      flex: 5,
                                      child: TextFormField(
                                        obscureText: true,
                                        keyboardType:
                                            TextInputType.emailAddress,
                                        decoration: InputDecoration(
                                            hintText: "Address Line 2"),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 20),
                                Row(
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: Icon(
                                        Icons.location_on,
                                        size: 40,
                                        color: Colors.transparent,
                                      ),
                                    ),
                                    Expanded(
                                      flex: 5,
                                      child: TextFormField(
                                        obscureText: true,
                                        keyboardType:
                                            TextInputType.emailAddress,
                                        decoration: InputDecoration(
                                            hintText: "Address Line 3"),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 20),
                                ElevatedButton(
                                  onPressed: () {
                                    var globalKey;
                                    if (globalKey.currentState!.validate()) {
                                      globalKey.currentState!.save();
                                      Navigator.of(context)
                                          .pushNamed('Carrier');
                                    }
                                  },
                                  child: const Text("Save"),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    )
                  : Container(
                      padding: EdgeInsets.all(20),
                      alignment: Alignment.topCenter,
                      child: Column(
                        children: [
                          Form(
                            key: globalKey,
                            child: Container(
                              height: 280,
                              color: Colors.white,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  (Global.imgPic != null)
                                      ? CircleAvatar(
                                          radius: 70,
                                          backgroundColor: Colors.grey,
                                          backgroundImage:
                                              FileImage(Global.imgPic!),
                                        )
                                      : CircleAvatar(
                                          radius: 70,
                                          backgroundColor: Colors.blueGrey,
                                          backgroundImage:
                                              AssetImage('img/pic2.png')),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      FloatingActionButton(
                                        onPressed: () async {
                                          final ImagePicker picker =
                                              ImagePicker();

                                          XFile? res = await picker.pickImage(
                                              source: ImageSource.camera);

                                          String? path = res!.path;
                                          // file = File(path);
                                          Global.imgPic = File(path);

                                          setState(() {
                                            print(Global.imgPic);
                                          });
                                        },
                                        mini: true,
                                        child: Icon(Icons.camera),
                                      ),
                                      SizedBox(
                                        width: 60,
                                      ),
                                      FloatingActionButton(
                                        onPressed: () async {
                                          final ImagePicker picker =
                                              ImagePicker();

                                          XFile? res = await picker.pickImage(
                                              source: ImageSource.gallery);

                                          String? path = res!.path;
                                          Global.imgPic = File(path);
                                          setState(() {});
                                        },
                                        mini: true,
                                        child: const Icon(Icons.photo),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}

 */