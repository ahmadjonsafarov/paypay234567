import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:paypay/presentation/pages/homepages/card.dart';
import 'package:paypay/presentation/style/style.dart';
import '../../../aplication/card/card_cubit.dart';

class AddCard extends StatefulWidget {
  const AddCard({Key? key}) : super(key: key);

  @override
  State<AddCard> createState() => _AddCardState();
}

class _AddCardState extends State<AddCard> {
  FirebaseFirestore firestore=FirebaseFirestore.instance;
  int son=0;
  bool isCard1=true;
  bool isCard=true;
  bool isDate=true;
  int a=0;
  GlobalKey<FormState> validateKey=GlobalKey<FormState>();
 final controller = new MaskedTextController(mask: '0000 0000 0000 0000');
 late TextEditingController name;
 late TextEditingController surname;
 final date = new MaskedTextController(mask: '**/**');
 List colors=["022964","04D440","FBAE05","FF2E2E","8CA6B7","9B6922","113D94",'006E21',"00AEEF","3B556E","F3B493","4FC1DB","4FC1DB","ECA11F"];
 @override
  void initState() {
   surname=TextEditingController();
   name=TextEditingController();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.stroke,
      body: SafeArea(
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 24.r),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: [
                    IconButton(onPressed: (){
                      Navigator.pop(context);
                    }, icon: Icon(Icons.arrow_back_ios)),
                    Spacer(),
                    Text("Add Card",style: TextStyle(color: Styles.black,fontSize: 20.r,fontWeight: FontWeight.w700),),
                    Spacer(),
                    Icon(Icons.more_vert_sharp),
                  ],
                ),
                35.verticalSpace,
                Container(
                  width: double.infinity,
                  height: 450.h,
                  decoration: BoxDecoration(
                    color: Styles.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Styles.black.withOpacity(0.05),
                        blurRadius: 5,
                        spreadRadius: 5,
                      ),
                    ]
                  ),
                  child: Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 24.r),
                    child: Form(
                      key: validateKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          25.verticalSpace,
                          Text("Card number",style: TextStyle(color: Styles.greyDark,fontSize: 20,fontWeight: FontWeight.w600),),
                          TextFormField(
                            controller: controller,
                            keyboardType: TextInputType.number,
                            validator: (s){
                              if(s?.isEmpty ?? true){
                                return "Qiymat kirilitmadi";
                              }else{
                                return null;
                              }
                            },
                          ),
                          isCard
                              ?SizedBox.shrink()
                              :Text("karta raqami noto'g'ri kiritildi",style: TextStyle(color: Colors.red),),
                          isCard1
                              ?SizedBox.shrink()
                              :Text("Bunday karta mavjud",style: TextStyle(color: Colors.red),),
                          15.verticalSpace,
                          Text("Name on card",style: TextStyle(color: Styles.greyDark,fontSize: 20,fontWeight: FontWeight.w600),),
                          TextFormField(
                            maxLength: 12,
                            controller: name,
                            keyboardType: TextInputType.text,
                            validator: (s){
                              if(s?.isEmpty ?? true){
                                return "Qiymat kirilitmadi";
                              }else{
                                return null;
                              }
                            },
                          ),
                          15.verticalSpace,
                          Text("Surname on card",style: TextStyle(color: Styles.greyDark,fontSize: 20,fontWeight: FontWeight.w600),),
                          TextFormField(
                            maxLength: 13,
                            controller: surname,
                            keyboardType: TextInputType.text,
                            validator: (s){
                              if(s?.isEmpty ?? true){
                                return "Qiymat kirilitmadi";
                              }else{
                                return null;
                              }
                            },
                          ),
                          15.verticalSpace,
                          Text("Expiration date",style: TextStyle(color: Styles.greyDark,fontSize: 20,fontWeight: FontWeight.w600),),
                          TextFormField(
                            controller: date,
                            keyboardType: TextInputType.number,
                            validator: (s){
                              if(s?.isEmpty ?? true){
                                return "Qiymat kirilitmadi";
                              }else{
                                return null;
                              }
                            },
                          ),
                          isDate
                              ?SizedBox.shrink()
                              :Text("sana natog'ri kiritildi",style: TextStyle(color: Colors.red),),
                        ],
                      ),
                    ),
                  ),
                ),
                15.verticalSpace,
                SizedBox(
                  height: 100.r,
                  child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: colors.length,
                  itemBuilder: (context,index){
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: (){
                            a=index;
                            setState(() {});
                        },
                        child: Container(
                          width: 75.r,
                          height: 75.r,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(int.parse("0xff${colors[index]}")),
                            border: Border.all(color:a==index? Colors.blue:Styles.stroke,width: 3),
                          ),
                        ),
                      ),
                    );
                  }),
                ),
                30.verticalSpace,
                StreamBuilder(
                  stream: firestore.collection("card").snapshots(),
                  builder: ( context,  snapshot) {
                    return ElevatedButton(onPressed: (){
                      if(validateKey.currentState?.validate() ?? false){
                        if((int.parse(date.text.substring(0,2))<=12) && (int.parse(date.text.substring(0,2))>=01) && (int.parse(date.text.substring(3))>=(int.parse(DateTime.now().year.toString().substring(2)))) && (int.parse(date.text.substring(0,2))>=01) ){
                          if(23==int.parse(date.text.substring(3))){
                            if((int.parse(date.text.substring(0,2))>=(DateTime.now().month))){
                              if(controller.text.length!=19){ isCard=false; setState(() {}); }
                              else{
                                son=snapshot.data?.docs.length ?? 0;
                                snapshot.data?.docs.forEach((element) {
                                if(element['cardnumber']!=controller.text){
                                  son-=1;
                                  if(son==0){
                                    context.read<CardCubit>().addCard(name.text, surname.text, controller.text, date.text, "0xff${colors[a]}");
                                    Navigator.of(context).push(
                                      MaterialPageRoute(builder: (_)=>BlocProvider.value(
                                        value:  BlocProvider.of<CardCubit>(context),
                                        child: Cardd(),
                                      )),
                                    );
                                  }
                                  else{
                                    isCard1=false;
                                    setState(() {  });
                                  }
                                }

                              });
                              }
                            }
                                else{ isDate=false; setState(() {}); }
                          }
                          else{
                            if(controller.text.length!=19){ isCard=false; setState(() {}); }
                            else{
                              son=snapshot.data?.docs.length ?? 0;
                              snapshot.data?.docs.forEach((element) {
                                if(element['cardnumber']!=controller.text){
                                  son-=1;
                                  if(son==0){
                                    context.read<CardCubit>().addCard(name.text, surname.text, controller.text, date.text, "0xff${colors[a]}");
                                    Navigator.of(context).push(
                                      MaterialPageRoute(builder: (_)=>BlocProvider.value(
                                          value:  BlocProvider.of<CardCubit>(context),
                                           child: Cardd(),
                                      )),
                                    );
                                  }
                                  else{
                                    isCard1=false;
                                    setState(() {  });
                                  }
                                } }); }
                          }
                        }
                        else{
                          isDate=false;
                          setState(() {});
                        }

                      }
                    }, child: Text("Next"));
                  },
                ),
                20.verticalSpace,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
