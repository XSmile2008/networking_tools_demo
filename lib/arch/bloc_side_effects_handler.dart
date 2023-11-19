import 'package:collection/collection.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'side_effect.dart';

typedef SideEffectHandler<E extends SideEffect> = void Function(
  BuildContext context,
  E sideEffect,
);

class BlocSideEffectsHandler<
    B extends BlocBase<S>,
    S extends WithSideEffects<S, E>,
    E extends SideEffect> extends BlocListener<B, S> {
  BlocSideEffectsHandler({
    super.key,
    required SideEffectHandler<E> listener,
    super.child,
  }) : super(
          listenWhen: (previous, current) =>
              current.sideEffects.isNotEmpty &&
              previous.sideEffects.firstOrNull !=
                  current.sideEffects.firstOrNull,
          listener: (context, state) {
            final bloc = context.read<B>();
            final sideEffect = state.sideEffects.first;
            if (!bloc.isClosed) {
              // ignore: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member
              bloc.emit(state - sideEffect);
            }
            listener(context, sideEffect);
          },
        );
}
