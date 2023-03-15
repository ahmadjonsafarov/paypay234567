import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'tolov_state.dart';

class TolovCubit extends Cubit<TolovState> {
  TolovCubit() : super(TolovState());

  addTolov(String name,String number,num money){
    emit(state.copyWith(name: name,number: number,money: money));
  }

}
