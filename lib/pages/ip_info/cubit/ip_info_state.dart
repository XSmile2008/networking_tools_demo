part of 'ip_info_cubit.dart';

RegExp _validIpRegExp = RegExp(r'^\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}$');

class IpInfoState extends Equatable
    with WithSideEffects<IpInfoState, IpInfoSideEffect> {
  @override
  final List<IpInfoSideEffect> sideEffects;
  final bool isLoading;
  final String ip;
  final String? ipValidationErrorMessage;
  final IpAddressInfo? ipAddressInfo;

  const IpInfoState({
    this.sideEffects = const [],
    this.isLoading = false,
    this.ip = '',
    this.ipValidationErrorMessage,
    this.ipAddressInfo,
  });

  bool get isValidIp => _validIpRegExp.hasMatch(ip);

  @override
  List<Object?> get props => [
        sideEffects,
        isLoading,
        ip,
        ipValidationErrorMessage,
      ];

  IpInfoState withIpChanged(String ip) {
    final bool isValidIp = _validIpRegExp.hasMatch(ip);
    return copyWith(
      ip: ip,
      ipValidationErrorMessage: ipValidationErrorMessage != null
          ? isValidIp
              ? null
              : 'Invalid IP address'
          : null,
    );
  }

  IpInfoState validated() => copyWith(
        ipValidationErrorMessage: isValidIp ? null : 'Invalid IP address',
      );

  IpInfoState loading() => copyWith(isLoading: true);

  IpInfoState loaded(IpAddressInfo ipAddressInfo) => copyWith(
        isLoading: false,
        ipAddressInfo: ipAddressInfo,
      );

IpInfoState idle() => copyWith(isLoading: false);

  IpInfoState copyWith({
    List<IpInfoSideEffect>? sideEffects,
    bool? isLoading,
    String? ip,
    String? ipValidationErrorMessage,
    IpAddressInfo? ipAddressInfo,
  }) =>
      IpInfoState(
        sideEffects: sideEffects ?? this.sideEffects,
        isLoading: isLoading ?? this.isLoading,
        ip: ip ?? this.ip,
        ipValidationErrorMessage:
            ipValidationErrorMessage ?? this.ipValidationErrorMessage,
        ipAddressInfo: ipAddressInfo ?? this.ipAddressInfo,
      );

  @override
  IpInfoState withSideEffects(List<IpInfoSideEffect> sideEffects) =>
      copyWith(sideEffects: sideEffects);
}
