import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:networking_tools_demo/arch/side_effect.dart';
import 'package:networking_tools_demo/model/entities/ip_address_info.dart';

import '../model/ip_info_repository.dart';

part 'ip_info_side_effect.dart';
part 'ip_info_state.dart';

class IpInfoCubit extends Cubit<IpInfoState> {
  final IpInfoRepository _repository;

  IpInfoCubit({
    required IpInfoRepository repository,
  })  : _repository = repository,
        super(const IpInfoState());

  void onIpChanged(String ip) {
    final newState = state.withIpChanged(ip);
    emit(newState);
  }

  void onCheckPressed() async {
    emit(state.validated());
    if (!state.isValidIp) return;
    emit(state.loading());
    try {
      final IpAddressInfo ipAddressInfo =
          await _repository.getIpAddressInfo(state.ip);
      emit(state.loaded(ipAddressInfo));
    } catch (e) {
      emit(state.idle() + IpInfoShowError(e));
    }
  }
}
