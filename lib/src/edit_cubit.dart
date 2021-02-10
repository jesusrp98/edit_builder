import 'package:flutter_bloc/flutter_bloc.dart';

/// Entity which handles the current state of the [EditBuilder] widget.
class EditCubit<T> extends Cubit<T> {
  EditCubit(T state)
      : assert(state != null),
        super(state);

  /// Method which emits the new state to the cubit.
  void update(T newState) => emit(newState);
}
