import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:networking_tools_demo/arch/side_effect.dart';
import 'package:networking_tools_demo/model/entities/mac_address_info.dart';

import '../model/mac_info_repository.dart';

part 'mac_info_side_effect.dart';
part 'mac_info_state.dart';

class MacInfoCubit extends Cubit<MacInfoState> {
  final MacInfoRepository _repository;

  MacInfoCubit({
    required MacInfoRepository repository,
  })  : _repository = repository,
        super(const MacInfoState());

  void onIpChanged(String ip) {
    final newState = state.withIpChanged(ip);
    emit(newState);
  }

  void onCheckPressed() async {
    emit(state.validated());
    if (!state.isValidMac) return;
    emit(state.loading());
    try {
      final MacAddressInfo? ipAddressInfo =
          await _repository.getMacAddressInfo(state.mac);
      emit(state.loaded(ipAddressInfo));
    } catch (e) {
      emit(state.idle() + MacInfoShowError(e));
    }
  }
}
