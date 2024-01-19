import 'package:flutter/material.dart';

class Technical_Skills extends StatefulWidget {
  const Technical_Skills({super.key});

  @override
  State<Technical_Skills> createState() => _Technical_SkillsState();
}

class _Technical_SkillsState extends State<Technical_Skills> {


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
              color: Colors.blue,
              child: Expanded(
                flex: 3,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 100,
                      child: IconButton(onPressed: (){
                        Navigator.of(context).pop('Technical_Skills');
                      }, icon: Icon(Icons.arrow_back_ios_new_outlined)),
                    ),
                    Container(
                      height: 100,
                      child: Center(child: Text("Technical_Skills",style: TextStyle(fontSize: 30),)),
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
                          height: 250,
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
                                Center(
                                  child: Text(
                                    "Enter Yours skills",
                                    style: TextStyle(color: Colors.black,fontSize: 20),
                                  ),
                                ),
                                TextFormField(
                                  maxLines: 1,
                                  decoration: InputDecoration(

                                    hintText: "C Programming, Web Technical",
                                    icon: Icon(Icons.cleaning_services_outlined),

                                  ),
                                ),
                                TextFormField(
                                  maxLines: 1,
                                  decoration: InputDecoration(
                                    hintText: "C Programming, Web Technical",
                                    icon: Icon(Icons.cleaning_services_outlined),

                                  ),
                                ),
                                TextFormField(
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontSize:20 ),
                                  maxLines: 1,
                                  decoration: InputDecoration(
                                    hintText: "+",border: OutlineInputBorder(),


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
