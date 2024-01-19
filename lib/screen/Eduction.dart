import 'package:flutter/material.dart';

import 'global.dart';

class Eduction extends StatefulWidget {
  const Eduction({super.key});

  @override
  State<Eduction> createState() => _EductionState();
}

class _EductionState extends State<Eduction> {

  TextEditingController courseController = TextEditingController();
  TextEditingController sCIController = TextEditingController();
  TextEditingController cgpaController = TextEditingController();
  TextEditingController passingYearController = TextEditingController();


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
                          height: 500,
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
                                  "Course/Degree",
                                  style: TextStyle(color: Colors.black,fontSize: 20),
                                ),
                                TextFormField(
                                  validator: (val) {
                                    if (val!.isEmpty) {
                                      return 'Enter your courseDegree first...';
                                    }
                                    return null;
                                  },
                                  onSaved: (val) {
                                    Global.courseDegree = val!;
                                  },
                                  controller: courseController,
                                  maxLines: 1,
                                  decoration: InputDecoration(
                                    hintText: "B.Tech Information Technology",
                                    border: OutlineInputBorder(),

                                  ),
                                ),
                                Text(
                                  "School/collage/Institute",
                                  style: TextStyle(color: Colors.black,fontSize: 20),
                                ),
                                TextFormField(
                                  validator: (val) {
                                    if (val!.isEmpty) {
                                      return 'Enter your sCI first...';
                                    }
                                    return null;
                                  },
                                  onSaved: (val) {
                                    Global.sCI = val!;
                                  },
                                  controller: sCIController,
                                  maxLines: 1,
                                  decoration: InputDecoration(
                                    hintText: "Marwadi University",
                                    border: OutlineInputBorder(),

                                  ),
                                ),
                                Text(
                                  "School/collage/Institute",
                                  style: TextStyle(color: Colors.black,fontSize: 20),
                                ),
                                TextFormField(
                                  validator: (val) {
                                    if (val!.isEmpty) {
                                      return 'Enter your cgpa first...';
                                    }
                                    return null;
                                  },
                                  onSaved: (val) {
                                    Global.cgpa = val!;
                                  },
                                  controller: cgpaController,
                                  maxLines: 1,
                                  decoration: InputDecoration(
                                    hintText: "70% (or) 7.0 CGPA",
                                    border: OutlineInputBorder(),

                                  ),
                                ),
                                Text(
                                  "Year of Pass",
                                  style: TextStyle(color: Colors.black,fontSize: 20),
                                ),
                                TextFormField(
                                  validator: (val) {
                                    if (val!.isEmpty) {
                                      return 'Enter your passingYear first...';
                                    }
                                    return null;
                                  },
                                  onSaved: (val) {
                                    Global.passingYear = val!;
                                  },
                                  controller: passingYearController,
                                  maxLines: 1,
                                  decoration: InputDecoration(
                                    hintText: "2019",
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

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class PDF extends StatefulWidget {
  const PDF({super.key});

  @override
  State<PDF> createState() => _PDFState();
}

class _PDFState extends State<PDF> {
  final pdf = pw.Document();

  @override
  void initState() {
    super.initState();

    pdf.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (context) {
          return pw.Center(
            child: pw.Text(
              "Hello world",
              style: const pw.TextStyle(fontSize: 25),
            ),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(
        child: Text("Hello world"),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              setState(() async {
                Directory? res = await getExternalStorageDirectory();

                String path = res!.path;

                File file = File('$path/resume.pdf');

                await file.writeAsBytes(await pdf.save()).then((value) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      backgroundColor: Colors.green,
                      behavior: SnackBarBehavior.floating,
                      content: Text("Saved successfully"),
                    ),
                  );
                });
              });
            },
            child: const Icon(Icons.download),
          ),
          FloatingActionButton(
            onPressed: () async {
              Printing.layoutPdf(onLayout: (format) {
                return pdf.save();
              });
            },
            child: const Icon(Icons.print),
          ),
        ],
      ),
    );
  }
}

*/