import 'package:flutter/material.dart';

import 'global.dart';

class Carrier extends StatefulWidget {
  const Carrier({super.key});

  @override
  State<Carrier> createState() => _CarrierState();
}

class _CarrierState extends State<Carrier> {
  TextEditingController careerObjController = TextEditingController();
  TextEditingController currentDesignationController = TextEditingController();



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
                        Navigator.of(context).pop('Carrier');
                      }, icon: Icon(Icons.arrow_back_ios_new_outlined)),
                    ),
                    Container(
                      height: 100,
                      child: Center(child: Text("Carrier Objective",style: TextStyle(fontSize: 30),)),
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
                          height: 300,
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
                                  "Carrier Objective",
                                  style: TextStyle(color: Colors.black,fontSize: 20),
                                ),
                                TextFormField(
                                  validator: (val) {
                                    if (val!.isEmpty) {
                                      return 'Enter your career first...';
                                    }
                                    return null;
                                  },
                                  onSaved: (val) {
                                    Global.careerObj = val!;
                                  },
                                  controller: careerObjController,
                                  onFieldSubmitted: (val){},

                                  maxLines: 7,
                                  decoration: InputDecoration(
                                    hintText: "Descripations",
                                    border: OutlineInputBorder(),

                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: Container(
                          height: 200,
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
                                  "Current Designation (Experienced Candidate)",
                                  style: TextStyle(color: Colors.black,fontSize: 15),
                                ),
                                TextFormField(
                                  validator: (val) {
                                    if (val!.isEmpty) {
                                      return 'Enter your empty first...';
                                    }
                                    return null;
                                  },
                                  onSaved: (val) {
                                    Global.currentDesignation = val!;
                                  },
                                  controller: currentDesignationController,
                                  maxLines: 4,
                                  decoration: InputDecoration(
                                    hintText: "Software Engineer",
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



/*

import 'dart:io';

import 'package:core_flutter_5pm/detail.dart';
import 'package:core_flutter_5pm/global.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

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

  File? file;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus!.unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Home Page"),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(25),
            alignment: Alignment.center,
            child: Form(
              key: globalKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  (file != null)
                      ? CircleAvatar(
                          radius: 70,
                          backgroundColor: Colors.grey,
                          backgroundImage: FileImage(file!),
                        )
                      : CircleAvatar(
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
                  const SizedBox(height: 40),
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
                    onFieldSubmitted: (val) {},
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
                        onPressed: () {
                          globalKey.currentState!.reset();

                          nameController.clear();
                          contactController.clear();
                          ageController.clear();
                          emailController.clear();

                          setState(() {
                            Global.name = '';
                            Global.contact = '';
                            Global.age = 0;
                            Global.email = '';
                          });
                        },
                        child: const Text("Clear"),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          if (globalKey.currentState!.validate()) {
                            globalKey.currentState!.save();

                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                behavior: SnackBarBehavior.floating,
                                content: Text('Saves done....'),
                                backgroundColor: Colors.green,
                              ),
                            );

                            Navigator.of(context).pushNamed('detail');
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                behavior: SnackBarBehavior.floating,
                                content: Text('Error....'),
                                backgroundColor: Colors.red,
                              ),
                            );
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
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          mini: true,
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}

 */
