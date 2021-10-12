import 'package:flutter_bloc/flutter_bloc.dart';

class QuestionState extends Cubit<int> {
  int index = 0;
  int rep = 0;
  QuestionState({required this.index}) : super(0);
  void next(int length) {
    if (index < length - 1) {
      print(index);
      print(length);
      emit(index++);
      emit(rep--);
    }
  }

  void checkReponse() {
    emit(rep++);
  }
}
