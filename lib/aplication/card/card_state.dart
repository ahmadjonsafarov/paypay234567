part of 'card_cubit.dart';

@immutable
class CardState {
  String name;
  String surname;
  String cardnumber;
  String date;
  num money;
  String color;

  CardState({
    this.color='4294684165',
    this.name="",
    this.surname="",
    this.money=1000000,
    this.date="",
    this.cardnumber='',
});
  CardState copyWith({String? name,String? surname,String? cardnumber,String? date,required num money,String? color}){
    return CardState(
      money: money,
      name: name ?? this.name,
      surname: surname ?? this.surname,
      cardnumber: cardnumber ?? this.cardnumber,
      date: date ?? this.date,
      color: color ?? this.color,
    );
  }
}
