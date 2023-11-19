part of 'ip_info_cubit.dart';

abstract class IpInfoSideEffect extends Equatable implements SideEffect {
  const IpInfoSideEffect();
}

class IpInfoShowError extends IpInfoSideEffect {
  final Object error;

  const IpInfoShowError(this.error);

  @override
  List<Object> get props => [error];
}
