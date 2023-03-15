import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:paypay/aplication/tolov/tolov_cubit.dart';
import 'package:paypay/presentation/pages/homepages/card.dart';
import 'package:paypay/presentation/pages/homepages/cardPay.dart';
import 'package:paypay/presentation/pages/homepages/stats.dart';
import 'package:paypay/presentation/pages/tolov/phoneNumber.dart';
import 'package:paypay/presentation/style/style.dart';

class HomePay extends StatefulWidget {
  const HomePay({Key? key}) : super(key: key);

  @override
  State<HomePay> createState() => _HomePayState();
}

class _HomePayState extends State<HomePay> {
  FirebaseFirestore firestore=FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: SingleChildScrollView(
            child: Column(
              children: [
                10.verticalSpace,
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Good morning",style: TextStyle(color: Styles.blueDark,fontSize: 20,fontWeight: FontWeight.w600),),
                        Text("Ahmadjon Safarov",style: TextStyle(color: Styles.blueDark,fontSize: 20,fontWeight: FontWeight.w600),),
                      ],
                    ),
                    Spacer(),
                    IconButton(icon: Icon(Icons.access_time_outlined,size: 32,), onPressed: () { Navigator.of(context).push(MaterialPageRoute(builder: (_)=>Stats())); },),
                  ],
                ),
                25.verticalSpace,
                StreamBuilder(
                  stream: firestore.collection("card").snapshots(),
                  builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                   if(snapshot.hasData){
                    return Container(
                       width: double.infinity,
                       height: 180.h,
                       decoration: BoxDecoration(
                           color: Color(snapshot.data!.docs[0]['color']),
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
                               child: Text("${snapshot.data?.docs[0]['money']} so'm",style: TextStyle(fontSize: 20,color: Styles.white),)),
                           Positioned(
                               bottom: 30,
                               left: 25,
                               child: Column(
                                 crossAxisAlignment: CrossAxisAlignment.start,
                                 children: [
                                   Text(snapshot.data!.docs[0]['cardnumber'], style: TextStyle(fontSize: 25,color: Styles.white,fontWeight: FontWeight.w600),),
                                   5.verticalSpace,
                                   Row(
                                     children: [
                                       Text(snapshot.data!.docs[0]['name'].toUpperCase(),style: TextStyle(fontSize: 18,fontWeight: FontWeight.normal,color: Styles.white),),
                                       3.horizontalSpace,
                                       Text(snapshot.data!.docs[0]['surname'].toUpperCase(),style: TextStyle(fontSize: 18,fontWeight: FontWeight.normal,color: Styles.white),),
                                       25.horizontalSpace,
                                       Text(snapshot.data!.docs[0]['date'],style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.normal),),
                                     ],
                                   ),
                                 ],
                               )),
                         ],
                       ),
                     );
                   }else if(snapshot.hasError){
                     return Center(
                       child: Text("Error: ${snapshot.hasError.toString()}"),
                     );
                   }else{
                     return  CupertinoActivityIndicator();
                   }
                  },

                ),
                35.verticalSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                      onTap: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (_)=>BlocProvider(
                        create: (context) => TolovCubit(),
                            child: PhoneNumber(),
                              )));
                      },
                      child: Column(
                        children: [
                          Container(
                            width: 80,
                            height: 80,
                            decoration: BoxDecoration(
                              color: Styles.stroke,
                              shape: BoxShape.circle,
                            ),
                            child: Center(
                              child: Icon(Icons.phone,size: 30,),
                            ),
                          ),
                          5.verticalSpace,
                          Text("Phone Number"),
                        ],
                      ),
                    ),
                    10.horizontalSpace,
                    Column(
                      children: [
                        Container(
                          width: 80,
                          height: 80,
                          decoration: BoxDecoration(
                            color: Styles.stroke,
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: Icon(Icons.credit_card_sharp,size: 30,),
                          ),
                        ),
                        5.verticalSpace,
                        Text("Karta Pul O'tkazish"),
                      ],
                    ),
                    10.horizontalSpace,
                    GestureDetector(
                      onTap: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (_)=>CardPay()));
                      },
                      child: Column(
                        children: [
                          Container(
                            width: 80,
                            height: 80,
                            decoration: BoxDecoration(
                              color: Styles.stroke,
                              shape: BoxShape.circle,
                            ),
                            child: Center(
                              child: Icon(Icons.credit_card_sharp,size: 30,),
                            ),
                          ),
                          5.verticalSpace,
                          Text("Mening kartalarim"),
                        ],
                      ),
                    ),
                  ],
                ),
                35.verticalSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        Container(
                          width: 80,
                          height: 80,
                          decoration: BoxDecoration(
                            color: Styles.stroke,
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: Icon(Icons.emoji_food_beverage_outlined,size: 30,),
                          ),
                        ),
                        5.verticalSpace,
                        Text("Foode"),
                      ],
                    ),
                    10.horizontalSpace,
                    Column(
                      children: [
                        Container(
                          width: 80,
                          height: 80,
                          decoration: BoxDecoration(
                            color: Styles.stroke,
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: Icon(Icons.local_taxi_rounded,size: 30,),
                          ),
                        ),
                        5.verticalSpace,
                        Text("Taksi"),
                      ],
                    ),
                    10.horizontalSpace,
                    Column(
                      children: [
                        Container(
                          width: 80,
                          height: 80,
                          decoration: BoxDecoration(
                            color: Styles.stroke,
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: Icon(Icons.photo_camera,size: 30,),
                          ),
                        ),
                        5.verticalSpace,
                        Text("Photo"),
                      ],
                    ),
                  ],
                ),
                35.verticalSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        Container(
                          width: 80,
                          height: 80,
                          decoration: BoxDecoration(
                            color: Styles.stroke,
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: Icon(Icons.car_rental,size: 30,),
                          ),
                        ),
                        5.verticalSpace,
                        Text("Mashina tamirlash"),
                      ],
                    ),
                    10.horizontalSpace,
                    Column(
                      children: [
                        Container(
                          width: 80,
                          height: 80,
                          decoration: BoxDecoration(
                            color: Styles.stroke,
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: Icon(Icons.shopping_basket,size: 30,),
                          ),
                        ),
                        5.verticalSpace,
                        Text("Korzinka"),
                      ],
                    ),
                    10.horizontalSpace,
                    Column(
                      children: [
                        Container(
                          width: 80,
                          height: 80,
                          decoration: BoxDecoration(
                            color: Styles.stroke,
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: Icon(Icons.local_pizza,size: 30,),
                          ),
                        ),
                        5.verticalSpace,
                        Text("Pizza"),
                      ],
                    ),
                  ],
                ),
                35.verticalSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Recent Transactions",style: TextStyle(color: Colors.black,fontSize: 23,fontWeight: FontWeight.w600),),
                    TextButton(onPressed: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (_)=>Stats()));
                    }, child: Text("View all")),
                  ],
                ),
                20.verticalSpace,
                StreamBuilder(
                  stream: firestore.collection("payment").snapshots(),
                  builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                    if(snapshot.hasData){
                      return SizedBox(
                        height: 400,
                        child: ListView.builder(
                            itemCount: 4,
                            itemBuilder: (context,index){
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8),
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
                                      Text(snapshot.data!.docs[index]['name'],style: TextStyle(fontSize: 25),),
                                      Text("raqam: ${snapshot.data!.docs[index]['number'].toString()}",style: TextStyle(fontSize: 15),),
                                    ],
                                  ),
                                  Text("tolov: ${snapshot.data!.docs[index]['money'].toString()} sum",style: TextStyle(fontSize: 17),),
                                ],
                              ),
                            ),
                        );
                        }),
                      );
                    }else if(snapshot.hasError){
                      return Center(
                        child: Text("Error: ${snapshot.hasError.toString()}"),
                      );
                    }else{
                      return  CupertinoActivityIndicator();
                    }
                  },

                ),
              ],
            ),
          ),
        ),
      )
    );
  }
}
