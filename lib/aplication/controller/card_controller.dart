import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:paypay/domain/model/cardModel.dart';

class CardController extends ChangeNotifier{
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  bool isLoading =true;
  createCard({required name,required surname,required cardnumber,required date,required color,required money}) async {
    isLoading =true;
    notifyListeners();
    await firestore.collection('card').add(
        CardModel(
            money,
            color: color,
            name: name,
            surname: surname,
            cardnumber: cardnumber,
            date: date).toJson());
    isLoading =false;
    notifyListeners();
  }

}
