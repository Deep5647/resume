import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'screen/Achievements.dart';
import 'screen/Carrier.dart';
import 'screen/Declaration.dart';
import 'screen/Eduction.dart';
import 'screen/Experience.dart';
import 'screen/Personal_Detail.dart';
import 'screen/Projects.dart';
import 'screen/References.dart';
import 'screen/Technical skills.dart';
import 'screen/contact.dart';
import 'screen/detailpage.dart';
import 'screen/page_2.dart';
import 'screen/resume.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        'Homepage': (context) => Homepage(),
        'Page_2':(context) => Page_2(),
        'contact':(context) => Contact_Info(),
        'detailpage':(context) => detailpage(),
        'Carrier':(context) => Carrier(),
        'Personal_Detail':(context) => Personal_Detail(),
        'Eduction':(context) => Eduction(),
        'Experiences':(context) => Experiences(),
        'Technical_Skills':(context) => Technical_Skills(),
        'Projects':(context) => Projects(),
        'Achievements':(context) => Achievements(),
        'References':(context) => References(),
        'Declaration':(context) => Declaration(),
        'Resume' :(context) => Resume(),









      },
      home: Homepage(),
    );
  }
}

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                height: 200,
                width: double.infinity,
                color: Colors.green,
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: 50, left: 120),
            child: Container(
              height: 40,
              width: 150,
              color: Colors.green,
              child: Center(
                  child: Text(
                "Resume Builder",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              )),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 120, left: 120),
            child: Container(
              height: 40,
              width: 150,
              color: Colors.green,
              child: Center(
                  child: Text(
                " Resumes ",
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              )),
            ),
          ),
          Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 300, left: 70),
                child: Container(
                  child: Image.asset(
                    "img/open-cardboard-box.png",
                  ),
                  height: 50,
                  width: 100,
                  color: Colors.white10,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 90),
                child: Container(
                    height: 20,
                    width: 250,
                    color: Colors.white,
                    child: Text("No Resumes + Create new Resume.")),
              ),
            ],
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed('Page_2');
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
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
  void initState() {
    super.initState();

    nameController.text = 'demo';
    contactController.text = '1234567890';
    ageController.text = '0';
    emailController.text = 'demo@gmail.com';
  }

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