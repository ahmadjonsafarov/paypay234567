import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'card_state.dart';

class CardCubit extends Cubit<CardState> {
  CardCubit() : super(CardState());
  
  addCard(String name,String surname,String cardnumber,String date,String color){
    emit(state.copyWith(name: name,surname: surname,cardnumber: cardnumber,date: date, money: 1000000,color: color));
}

}
