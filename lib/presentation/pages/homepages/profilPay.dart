import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:paypay/presentation/pages/homepages/setting.dart';

import '../../style/style.dart';

class ProfilPay extends StatefulWidget {
  const ProfilPay({Key? key}) : super(key: key);

  @override
  State<ProfilPay> createState() => _ProfilPayState();
}

class _ProfilPayState extends State<ProfilPay> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              Text("Profil",style: GoogleFonts.abel(fontSize: 30,fontWeight: FontWeight.w600,),),
              10.verticalSpace,
              Container(
                width: double.infinity,
                height: 90,
                child: Row(
                  children: [
                    Container(
                      height: 90,
                      width: 90,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: AssetImage('assets/images/person.png'),
                        )
                      ),
                    ),
                    Column(
                      children: [
                        5.verticalSpace,
                        Text("Ahmadjon Safarov",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 25),),
                        5.verticalSpace,
                        Text("+998959473430",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 25),),
                      ],
                    ),
                  ],
                ),
              ),
              75.verticalSpace,
              Container(
                height: 60,
                decoration: BoxDecoration(
                  color: Styles.stroke,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  children: [
                    15.horizontalSpace,
                    Icon(Icons.person,size: 35,),
                    15.horizontalSpace,
                    Text("My account",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600),),
                    Spacer(),
                    Icon(Icons.arrow_forward_ios_outlined),
                    15.horizontalSpace,
                  ],
                ),
              ),
              15.verticalSpace,
              Container(
                height: 60,
                decoration: BoxDecoration(
                  color: Styles.stroke,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  children: [
                    15.horizontalSpace,
                    Icon(Icons.location_pin,size: 35,),
                    15.horizontalSpace,
                    Text("Address",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600),),
                    Spacer(),
                    Icon(Icons.arrow_forward_ios_outlined),
                    15.horizontalSpace,
                  ],
                ),
              ),
              15.verticalSpace,
              GestureDetector(
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (_)=>Setting()));
                },
                child: Container(
                  height: 60,
                  decoration: BoxDecoration(
                    color: Styles.stroke,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Row(
                    children: [
                      15.horizontalSpace,
                      Icon(Icons.settings,size: 35,),
                      15.horizontalSpace,
                      Text("Setting",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600),),
                      Spacer(),
                      Icon(Icons.arrow_forward_ios_outlined),
                      15.horizontalSpace,
                    ],
                  ),
                ),
              ),
              15.verticalSpace,
              Container(
                height: 60,
                decoration: BoxDecoration(
                  color: Styles.stroke,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  children: [
                    15.horizontalSpace,
                    Icon(Icons.help,size: 35,),
                    15.horizontalSpace,
                    Text("Help Center",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600),),
                    Spacer(),
                    Icon(Icons.arrow_forward_ios_outlined),
                    15.horizontalSpace,
                  ],
                ),
              ),
              15.verticalSpace,
              Container(
                height: 60,
                decoration: BoxDecoration(
                  color: Styles.stroke,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  children: [
                    15.horizontalSpace,
                    Icon(Icons.phone,size: 35,),
                    15.horizontalSpace,
                    Text("Contact",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600),),
                    Spacer(),
                    Icon(Icons.arrow_forward_ios_outlined),
                    15.horizontalSpace,
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
