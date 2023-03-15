import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class Boarding1 extends StatefulWidget {
  const Boarding1({Key? key}) : super(key: key);

  @override
  State<Boarding1> createState() => _Boarding1State();
}

class _Boarding1State extends State<Boarding1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          60.verticalSpace,
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Spacer(),
              Image.asset('assets/logo/logo.png'),
              Text('Paypay',style: GoogleFonts.rubik(fontSize: 25,fontWeight: FontWeight.w600),),
              const Spacer(),
            ],
          ),
          85.verticalSpace,
          Lottie.asset('assets/lottiefiles/payment.json'),
          42.verticalSpace,
          Text("Spend your money smarter",textAlign: TextAlign.center,style: GoogleFonts.mukta(fontSize: 35,fontWeight: FontWeight.w700),),
          8.verticalSpace,
          Text("Never overspend your money again with smart budgeting feature.",textAlign: TextAlign.center,style: GoogleFonts.josefinSans(fontWeight: FontWeight.w400,fontSize: 16),),
        ],
      ),
    );
  }
}
