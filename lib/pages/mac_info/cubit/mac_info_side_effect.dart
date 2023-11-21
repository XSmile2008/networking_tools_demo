part of 'mac_info_cubit.dart';

abstract class MacInfoSideEffect extends Equatable implements SideEffect {
  const MacInfoSideEffect();
}

class MacInfoShowError extends MacInfoSideEffect {
  final Object error;

  const MacInfoShowError(this.error);

  @override
  List<Object> get props => [error];
}
