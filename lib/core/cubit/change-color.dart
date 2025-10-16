import 'package:flutter_bloc/flutter_bloc.dart';

class Changecolor extends Cubit<int> {
  Changecolor() : super(0);

  void changeIndex(int newIndex) => emit(newIndex);
}
