import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'edit_cubit.dart';

///
class EditBuilder<T> extends StatelessWidget {
  ///
  final T initialValue;

  ///
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
          context.watch<EditCubit<T>>().setValue,
        ),
      ),
    );
  }
}
