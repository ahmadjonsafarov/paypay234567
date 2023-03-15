import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:paypay/presentation/pages/boarding/pageview.dart';
import 'package:paypay/presentation/style/style.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    Future.delayed(Duration(milliseconds: 700),(){
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_)=>pageWiev()), (route) => false);
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.blueDark,
      body: Center(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Spacer(),
            Image.asset('assets/logo/logo.png',height: 35.r,width: 35.r,fit: BoxFit.cover,),
            Text('Paypay',style: GoogleFonts.rubik(fontSize: 35.r,fontWeight: FontWeight.w600,color: Styles.white),),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
