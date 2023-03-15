import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:paypay/aplication/controller/card_controller.dart';
import 'package:paypay/presentation/pages/homepages/home.dart';
import 'package:paypay/presentation/style/style.dart';
import '../../../aplication/card/card_cubit.dart';

class Cardd extends StatefulWidget {
  const Cardd({Key? key}) : super(key: key);

  @override
  State<Cardd> createState() => _CarddState();
}

class _CarddState extends State<Cardd> {
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
      Center(child: Lottie.asset("assets/lottiefiles/inspection.json")):
      BlocBuilder<CardCubit, CardState>(
              builder: (context, state) {
               return Column(
                 children: [
                   Spacer(),
                   Padding(
                     padding:  EdgeInsets.symmetric(horizontal: 24),
                     child: Container(
                         width: double.infinity,
                          height: 180.h,
                            decoration: BoxDecoration(
                          color: Color(int.parse('${state.color}')),
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
                      bottom: 30,
                      left: 25,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                      Text(state.cardnumber, style: TextStyle(fontSize: 25,color: Styles.white,fontWeight: FontWeight.w600),),
                      5.verticalSpace,
                      Row(
                        children: [
                          Text(state.name,style: TextStyle(fontSize: 18,fontWeight: FontWeight.normal,color: Styles.white),),
                          3.horizontalSpace,
                          Text(state.surname,style: TextStyle(fontSize: 18,fontWeight: FontWeight.normal,color: Styles.white),),
                          25.horizontalSpace,
                          Text(state.date,style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.normal),),
                        ],
                      ),
                        ],
                      ))
          ],
        ),
      ),
                   ),
                   ElevatedButton(onPressed: (){
                     context.read<CardController>().createCard(name: state.name, surname: state.surname, cardnumber: state.cardnumber, date: state.date, color: num.parse(state.color), money: state.money);
                     Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_)=>home()), (route) => false);
                   }, child:Text("Kartani tasdiqlash") ),
                   Spacer(),
                 ],
               );
  },
),
    );
  }
}
