import 'package:flutter_bloc/flutter_bloc.dart';

///
class EditCubit<T> extends Cubit<T> {
  EditCubit(T state) : super(state);

  ///
  void setValue(T newState) => emit(newState);
}
