import 'package:flutter_bloc/flutter_bloc.dart';

class RoomChipCubit extends Cubit<int> {
  RoomChipCubit() : super(-1);

  void selectRoom(int index) => emit(index);
  void reset() => emit(-1);
}
class PaymentChipCubit extends Cubit<int> {
  PaymentChipCubit() : super(-1);

  void select(int index) => emit(index);
  void reset() => emit(-1);
}

class StatusChipCubit extends Cubit<int> {
  StatusChipCubit() : super(-1);

  void select(int index) => emit(index);
  void reset() => emit(-1);
}

class TypeChipCubit extends Cubit<int> {
  TypeChipCubit() : super(-1);

  void select(int index) => emit(index);
  void reset() => emit(-1);
}