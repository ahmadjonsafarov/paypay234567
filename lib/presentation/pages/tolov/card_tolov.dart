import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:paypay/aplication/tolov/tolov_cubit.dart';

import '../../../aplication/controller/tolov_controller.dart';
import '../../style/style.dart';
import '../homepages/home.dart';

class CardTolov extends StatefulWidget {
  const CardTolov({Key? key}) : super(key: key);

  @override
  State<CardTolov> createState() => _CardTolovState();
}

class _CardTolovState extends State<CardTolov> {
  bool isSnack=false;
  String doc='';
  int sum=0;
  int a=0;
  FirebaseFirestore firestore=FirebaseFirestore.instance;
  bool isLoading=true;
  @override
  void initState() {
    isLoading=true;
    Future.delayed(Duration(seconds: 2),(){
      isLoading=false;
      setState(() { });
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: isLoading?
      Center(child: Lottie.asset("assets/lottiefiles/paymentphone.json")):
      BlocBuilder<TolovCubit, TolovState>(
        builder: (context, state) {
          return SingleChildScrollView(
            child: Column(
              children: [

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: double.infinity,
                    height: 450,
                    decoration: BoxDecoration(
                      color: Styles.stroke,
                      borderRadius: BorderRadius.circular(35),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text("To'lov turi",style: TextStyle(fontSize: 17,fontWeight: FontWeight.w600),),
                              Text('${state.name} uchun',style: TextStyle(fontSize: 17,fontWeight: FontWeight.w600),),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text("Qabul quluvchi raqam",style: TextStyle(fontSize: 17,fontWeight: FontWeight.w600),),
                              Text(state.number,style: TextStyle(fontSize: 17,fontWeight: FontWeight.w600),),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("To'lov summasi",style: TextStyle(fontSize: 17,fontWeight: FontWeight.w600),),
                              Text("${state.money} so'm",style: TextStyle(fontSize: 17,fontWeight: FontWeight.w600),),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Text("To'lov kartasini tanlang",style: TextStyle(color: Styles.blueDark,fontSize: 25,fontWeight: FontWeight.w600),),
                SizedBox(
                  height: 250,
                  child: StreamBuilder(
                      stream: firestore.collection("card").snapshots(),
                      builder: (context, snapshot) {
                        if(snapshot.hasData){
                          return ListView.builder(
                            scrollDirection: Axis.vertical,
                              itemCount: snapshot.data?.docs.length ?? 0,
                              itemBuilder: (context,index){
                                return GestureDetector(
                                  onTap: (){
                                    doc=(snapshot.data?.docs[index].id).toString();
                                    sum=snapshot.data?.docs[index]['money'];
                                    a=index;
                                    setState(() {});
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 15),
                                    child: Container(
                                      width: double.infinity,
                                      height: 180.h,
                                      decoration: BoxDecoration(
                                          color: Color(snapshot.data!.docs[index]['color']),
                                          borderRadius: BorderRadius.circular(16),
                                          border: Border.all(color:index==a? Styles.black:Styles.white,width: 3)
                                      ),
                                      child: Stack(
                                        children: [
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
                ),
                ElevatedButton(onPressed: () async {
                  if(sum>=state.money){
                    await firestore.collection('card').doc(doc).update(
                      {
                        'money':sum-state.money,
                      }
                    );
                    context.read<TolovController>().tolov(name: state.name, number:state.number, money: state.money);
                    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_)=>home()), (route) => false);
                  }else{
                    AnimatedSnackBar.material('Kartada pul yetarli mas',
                        type: AnimatedSnackBarType.info,
                        mobileSnackBarPosition: MobileSnackBarPosition.bottom,
                        desktopSnackBarPosition:
                        DesktopSnackBarPosition.bottomLeft)
                        .show(context);
                  }
                }, child:Text("To'lovni tasdiqlash") ),
                30.verticalSpace,
              ],
            ),
          );
        },
      ),
    );
  }
}
