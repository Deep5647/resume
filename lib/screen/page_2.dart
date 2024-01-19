import 'package:flutter/material.dart';
import 'package:resumes_1/screen/util.dart';

class Page_2 extends StatefulWidget {
  const Page_2({super.key});

  @override
  State<Page_2> createState() => _Page_2State();
}

class _Page_2State extends State<Page_2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [ Container(
            height: 150,
            width: double.infinity,
            color: Colors.green,
            child: Expanded(
              flex: 3,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 100,
                        child: IconButton(onPressed: (){
                          Navigator.of(context).pop('Homepage');
                        }, icon: Icon(Icons.arrow_back_ios_new_outlined)),
                      ),
                      Container(
                        height: 100,
                        child: Center(child: Text("Resume Workspace",style: TextStyle(fontSize: 30),)),
                      ),
                      SizedBox(width: 50,),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        child: Center(child: Text("Build Options",style: TextStyle(fontSize: 30),)),
                      ),
                      IconButton(onPressed: (){
                        Navigator.of(context).pushNamed('Resume');
                      }, icon: Icon(Icons.add)),
                    ],
                  ),
                ],
              ),
            ),
          ),

            ...categoryName.map((e) {
              return Container(
                height: 65,
                width: double.infinity,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 1)),
                child: Row(
                  children: [
                    SizedBox(
                      width: 20,
                    ),
                    Image.asset(
                      'img/${e['img']}',
                      height: 40,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      '${e['name']}',
                      style: TextStyle(
                        fontSize: 30,
                      ),
                    ),
                    Spacer(),
                    IconButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed('${e['page']}');
                      },
                      icon: const Icon(Icons.navigate_next),
                      splashRadius: 20,
                    ),
                    SizedBox(
                      width: 25,
                    ),
                  ],
                ),
              );

            }).toList(),

          ],
        ),
      ),
    );
  }
}




/*


import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const HomePage(),
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
  bool isTrue = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text("IndexedStack"),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              color: Colors.blue,
              child: Row(
                children: [
                  Column(
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
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                      ),
                      const SizedBox(height: 20),
                      (isTrue == true)
                          ? Container(
                              height: 10,
                              width: 205,
                              color: Colors.black,
                            )
                          : Container(),
                    ],
                  ),
                  Column(
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
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                      ),
                      const SizedBox(height: 20),
                      (isTrue == false)
                          ? Container(
                              height: 10,
                              width: 205,
                              color: Colors.black,
                            )
                          : Container(),
                    ],
                  ),
                ],
              ),
              // child: IndexedStack(
              //   index: 3,
              //   children: [
              //     Container(
              //       color: Colors.red,
              //       height: 50,
              //       width: 50,
              //     ),
              //     Container(
              //       color: Colors.orange,
              //       height: 80,
              //       width: 80,
              //     ),
              //     Container(
              //       color: Colors.pinkAccent,
              //       height: 110,
              //       width: 110,
              //     ),
              //     Container(
              //       color: Colors.green,
              //       height: 140,
              //       width: 140,
              //     ),
              //   ],
              // ),
            ),
          ),
          Expanded(
            flex: 9,
            child: (isTrue == true)
                ? Container(
                    padding: EdgeInsets.all(20),
                    alignment: Alignment.topCenter,
                    child: Container(
                      height: 400,
                      color: Colors.grey,
                      child: Row(
                        children: [
                          Expanded(flex: 1, child: Icon(Icons.person)),
                          Expanded(
                            flex: 5,
                            child: TextField(
                              obscureText: true,
                              keyboardType: TextInputType.emailAddress,
                              decoration:
                                  InputDecoration(hintText: "Enter Name"),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                : Container(
                    padding: EdgeInsets.all(20),
                    alignment: Alignment.topCenter,
                    child: Container(
                      height: 250,
                      color: Colors.green,
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}

 */