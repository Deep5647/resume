import 'package:flutter/material.dart';

class Declaration extends StatefulWidget {
  const Declaration({super.key});

  @override
  State<Declaration> createState() => _DeclarationState();
}

class _DeclarationState extends State<Declaration> {

  GlobalKey<FormState> globalKey = GlobalKey<FormState>();

  bool switchVal = false;

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
                      child: IconButton(
                          onPressed: () {
                            Navigator.of(context).pop('Declaration');
                          },
                          icon: Icon(Icons.arrow_back_ios_new_outlined)),
                    ),
                    Container(
                      height: 100,
                      child: Center(
                          child: Text(
                        "Declaration",
                        style: TextStyle(fontSize: 30),
                      )),
                    ),
                    SizedBox(
                      width: 50,
                    ),
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
                      Row(
                        children: [
                          Text(
                            "Declaration",
                            style: TextStyle(fontSize: 30),
                          ),
                          Spacer(
                            flex: 10,
                          ),
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
                      (switchVal)
                          ? Container(
                              height: 400,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                color: Colors.white,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(20),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Carrier Objective",
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 20),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Icon(
                                        Icons.tab_rounded,
                                        size: 40,
                                      ),
                                    ),
                                    TextFormField(
                                      maxLines: 1,
                                      decoration: InputDecoration(
                                        hintText: "Descripations",
                                        border: OutlineInputBorder(),
                                      ),
                                    ),
                                    TextFormField(),
                                    Row(
                                      children: [
                                        Column(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Text(
                                                "Date",
                                                style: TextStyle(fontSize: 20),
                                              ),
                                            ),
                                            Container(
                                              height: 30,
                                              width: 110,
                                              child: TextFormField(
                                                decoration: InputDecoration(
                                                  hintText: "DD/MM/YY",
                                                  border: OutlineInputBorder(),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),

                                        Column(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Text(
                                                "Place(Interview/venus/city)",
                                                style: TextStyle(fontSize: 20),
                                              ),
                                            ),
                                            Container(
                                              height: 30,
                                              width: 110,
                                              child: TextFormField(
                                                decoration: InputDecoration(
                                                  hintText: "Eg.surat",
                                                  border: OutlineInputBorder(),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),


                                    Spacer(),
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
                            )
                          : Container(),

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
