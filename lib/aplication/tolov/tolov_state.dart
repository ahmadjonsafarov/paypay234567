part of 'tolov_cubit.dart';

@immutable
class TolovState {
  String name;
  String number;
  num money;

  TolovState({
    this.name="",
    this.number="",
    this.money=1000,
});
  TolovState copyWith({String? name,String? number,num? money}){
    return TolovState(
      name: name ?? this.name,
      number: number ?? this.number,
      money: money ?? this.money,
    );
  }
}

