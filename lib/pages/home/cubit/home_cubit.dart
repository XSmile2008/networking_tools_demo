import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:networking_tools_demo/arch/side_effect.dart';

part 'home_side_effect.dart';
part 'home_state.dart';

enum HomeTab {
  ipInfo(icon: Icons.lan, label: 'Ip info'),
  macInfo(icon: Icons.computer, label: 'Mac info');

  final IconData icon;
  final String label;

  const HomeTab({
    required this.icon,
    required this.label,
  });
}

class HomeCubit extends Cubit<HomeState> {
  HomeCubit()
      : super(
          const HomeState(
            selectedTab: HomeTab.ipInfo,
          ),
        );

  void onTabPressed(HomeTab tab) {
    emit(state.copyWith(selectedTab: tab));
  }
}
