import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'edit_cubit.dart';

/// Component which helps on the creation of views that handle the manipulation
/// of a specific value.
///
/// This widget will be provided with the [initialValue] of the view,
/// as well as a widget [builder] function that handles the view itself,
/// in relation of the current state of the data.
class EditBuilder<T> extends StatelessWidget {
  /// The value that the builder will have upon initialization.
  ///
  /// This field should not be [null].
  final T initialValue;

  /// Function that creates the widget controlled inside this view.
  /// - First parameter: current value handled by the component.
  /// - Second parameter: function that allows updating the current state.
  ///
  /// This field should not be [null].
  final Widget Function(T, void Function(T)) builder;

  const EditBuilder({
    Key key,
    @required this.initialValue,
    @required this.builder,
  })  : assert(initialValue != null),
        assert(builder != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => EditCubit(initialValue),
      child: Builder(
        builder: (context) => builder(
          context.read<EditCubit<T>>().state,
          context.watch<EditCubit<T>>().update,
        ),
      ),
    );
  }
}
