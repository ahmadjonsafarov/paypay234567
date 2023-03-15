import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:paypay/aplication/card/card_cubit.dart';
import 'package:paypay/aplication/tolov/tolov_cubit.dart';
import 'package:paypay/presentation/pages/tolov/card_tolov.dart';

class PhoneNumber extends StatefulWidget {
  const PhoneNumber({Key? key}) : super(key: key);

  @override
  State<PhoneNumber> createState() => _PhoneNumberState();
}

class _PhoneNumberState extends State<PhoneNumber> {
  final number = new MaskedTextController(mask: '+998 ** *** ** **');
  late TextEditingController money;
  @override
  void initState() {
    money=TextEditingController();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Lottie.asset("assets/lottiefiles/aa.json"),
                20.verticalSpace,
                Text("Telefon raqam",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600),),
                5.verticalSpace,
                TextFormField(
                  controller: number,
                  style: TextStyle(
                    fontSize: 21
                  ),
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(),
                    enabledBorder: OutlineInputBorder(),
                  ),
                ),
                20.verticalSpace,
                Text("To'lov summasi",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600),),
                5.verticalSpace,
                TextFormField(
                  controller: money,
                  style: TextStyle(
                      fontSize: 21
                  ),
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(),
                    enabledBorder: OutlineInputBorder(),
                  ),
                ),
                100.verticalSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(onPressed: () {
                      context.read<TolovCubit>().addTolov("Phone Number", number.text, int.parse(money.text));
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (_)=>MultiBlocProvider(
                            providers: [
                              BlocProvider(
                                create: (context) => CardCubit(),
                              ),
                              BlocProvider.value(value:  BlocProvider.of<TolovCubit>(context),)
                            ],
                            child: CardTolov())),
                      );
                    }, child: Text("Davom etish"),

                    ),
                  ],
                ),
                15.verticalSpace,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
