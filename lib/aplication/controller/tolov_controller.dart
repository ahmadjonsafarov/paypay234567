import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:paypay/domain/model/tolovModel.dart';

class TolovController extends ChangeNotifier{
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  bool isLoading =true;
  tolov({required name,required number,required money}){
    isLoading =true;
    notifyListeners();
    firestore.collection('payment').add(
      TolovModel(name: name, number: number, money: money).toJson(),
    );
    isLoading =false;
    notifyListeners();
  }

}