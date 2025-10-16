import 'package:flutter_bloc/flutter_bloc.dart';

class PlanSelectionCubit extends Cubit<bool> {
  PlanSelectionCubit() : super(false);

  void toggle() => emit(!state);
}
