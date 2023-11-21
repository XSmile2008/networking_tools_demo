part of 'mac_info_cubit.dart';

RegExp _validMacRegExp = RegExp(r'^([0-9A-Fa-f]{2}[:-]){5}([0-9A-Fa-f]{2})$');

class MacInfoState extends Equatable
    with WithSideEffects<MacInfoState, MacInfoSideEffect> {
  @override
  final List<MacInfoSideEffect> sideEffects;
  final bool isLoading;
  final String mac;
  final String? macValidationErrorMessage;
  final MacAddressInfo? macAddressInfo;

  const MacInfoState({
    this.sideEffects = const [],
    this.isLoading = false,
    this.mac = '',
    this.macValidationErrorMessage,
    this.macAddressInfo,
  });

  bool get isValidMac => _validMacRegExp.hasMatch(mac);

  @override
  List<Object?> get props => [
        sideEffects,
        isLoading,
        mac,
        macValidationErrorMessage,
        macAddressInfo,
      ];

  MacInfoState withIpChanged(String mac) {
    final bool isValidNewIp = _validMacRegExp.hasMatch(mac);
    return MacInfoState(
      sideEffects: sideEffects,
      isLoading: isLoading,
      mac: mac,
      macValidationErrorMessage:
          isValidNewIp ? null : macValidationErrorMessage,
      macAddressInfo: macAddressInfo,
    );
  }

  MacInfoState validated() => copyWith(
        macValidationErrorMessage: isValidMac ? null : 'Invalid IP address',
      );

  MacInfoState loading() => copyWith(isLoading: true);

  MacInfoState loaded(MacAddressInfo? macAddressInfo) => copyWith(
        isLoading: false,
        macAddressInfo: macAddressInfo,
      );

  MacInfoState idle() => copyWith(isLoading: false);

  MacInfoState copyWith({
    List<MacInfoSideEffect>? sideEffects,
    bool? isLoading,
    String? mac,
    String? macValidationErrorMessage,
    MacAddressInfo? macAddressInfo,
  }) =>
      MacInfoState(
        sideEffects: sideEffects ?? this.sideEffects,
        isLoading: isLoading ?? this.isLoading,
        mac: mac ?? this.mac,
        macValidationErrorMessage:
            macValidationErrorMessage ?? this.macValidationErrorMessage,
        macAddressInfo: macAddressInfo ?? this.macAddressInfo,
      );

  @override
  MacInfoState withSideEffects(List<MacInfoSideEffect> sideEffects) =>
      copyWith(sideEffects: sideEffects);
}
