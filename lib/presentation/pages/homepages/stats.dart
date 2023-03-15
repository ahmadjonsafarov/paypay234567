import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

import '../../style/style.dart';

class Stats extends StatefulWidget {
  const Stats({Key? key}) : super(key: key);

  @override
  State<Stats> createState() => _StatsState();
}

class _StatsState extends State<Stats> {
  @override
  Widget build(BuildContext context) {
    FirebaseFirestore firestore=FirebaseFirestore.instance;
    return Scaffold(
      body: StreamBuilder(
          stream: firestore.collection("payment").snapshots(),
          builder: (context, snapshot) {
            if(snapshot.hasData){
              return ListView.builder(
                  itemCount: snapshot.data?.docs.length ?? 0,
                  itemBuilder: (context,index){
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 15),
                      child: Container(
                        width: double.infinity,
                        height: 80.h,
                        decoration: BoxDecoration(
                          color: Styles.stroke,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(snapshot.data!.docs[index]['name'],style: TextStyle(fontSize: 20),),
                                Text("raqam: ${snapshot.data!.docs[index]['number']}",style: TextStyle(fontSize: 15),),
                              ],
                            ),
                            Text("tolov: ${snapshot.data!.docs[index]['money'].toString()} sum",style: TextStyle(fontSize: 17),),
                          ],
                        ),
                      ),
                    );
                  });
            }else if(snapshot.hasError){
              return Center(
                child: Text("Error: ${snapshot.hasError.toString()}"),
              );
            }else{
              return Center(
                child: Lottie.asset('assets/lottiefiles/loading1.json'),
              );
            }
          }
      ),
    );
  }
}
