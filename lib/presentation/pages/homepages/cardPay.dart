import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:paypay/presentation/style/style.dart';

class CardPay extends StatefulWidget {
  const CardPay({Key? key}) : super(key: key);

  @override
  State<CardPay> createState() => _CardPayState();
}

class _CardPayState extends State<CardPay> {
  FirebaseFirestore firestore=FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.stroke,
      body: StreamBuilder(
        stream: firestore.collection("card").snapshots(),
        builder: (context, snapshot) {
          if(snapshot.hasData){
            return ListView.builder(
                itemCount: snapshot.data?.docs.length ?? 0,
                itemBuilder: (context,index){
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 15),
                    child: Container(
                      width: double.infinity,
                      height: 180.h,
                      decoration: BoxDecoration(
                          color: Color(snapshot.data!.docs[index]['color']),
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [
                            BoxShadow(
                              color: Styles.black.withOpacity(0.2),
                              blurRadius: 5,
                              spreadRadius: 5,
                            ),
                          ]
                      ),
                      child: Stack(
                        children: [
                          Positioned(
                              top: 5,
                              right: 5,
                              child: IconButton(onPressed: () async {
                                await firestore.collection('card').doc(snapshot.data!.docs[index].id).delete();
                              }, icon: Icon(Icons.delete,size: 32,),)
                          ),
                          Positioned(
                            child: Container(
                              width: 50.r,
                              height: 50.r,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  image: DecorationImage(
                                    image: AssetImage('assets/images/img.png'),
                                  )
                              ),
                            ),
                            top: 35,
                            left: 25,),
                          Positioned(
                              top: 20.h,
                              left: 120.w,
                              child: Text("Cretid Card",style: TextStyle(fontSize: 40,color: Styles.white),)),
                          Positioned(
                              top: 65.h,
                              left: 120.w,
                              child: Text("${snapshot.data?.docs[index]['money']} so'm",style: TextStyle(fontSize: 20,color: Styles.white),)),
                          Positioned(
                              bottom: 30,
                              left: 25,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(snapshot.data!.docs[index]['cardnumber'], style: TextStyle(fontSize: 25,color: Styles.white,fontWeight: FontWeight.w600),),
                                  5.verticalSpace,
                                  Row(
                                    children: [
                                      Text(snapshot.data!.docs[index]['name'].toUpperCase(),style: TextStyle(fontSize: 18,fontWeight: FontWeight.normal,color: Styles.white),),
                                      3.horizontalSpace,
                                      Text(snapshot.data!.docs[index]['surname'].toUpperCase(),style: TextStyle(fontSize: 18,fontWeight: FontWeight.normal,color: Styles.white),),
                                      25.horizontalSpace,
                                      Text(snapshot.data!.docs[index]['date'],style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.normal),),
                                    ],
                                  ),
                                ],
                              )),
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
              child: Lottie.asset('assets/lottiefiles/loading.json'),
            );
          }
        }
      ),
    );
  }
}
