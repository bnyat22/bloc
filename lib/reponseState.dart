import 'package:flutter_bloc/flutter_bloc.dart';

class ReponseState extends Cubit<String> {
  String reponse = "reponse";
  ReponseState({required this.reponse}) : super("reponse");
  void setReponse(String r) {
    emit(r);
  }
}
