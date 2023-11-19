import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:networking_tools_demo/arch/bloc_side_effects_handler.dart';
import 'package:networking_tools_demo/pages/ip_info/view/ip_info_page.dart';

import '../cubit/home_cubit.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeCubit cubit = context.read();
    return BlocSideEffectsHandler<HomeCubit, HomeState, HomeSideEffect>(
      listener: (context, sideEffect) {},
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) => Scaffold(
          body: Stack(
            children: [
              Visibility(
                visible: state.selectedTab == HomeTab.ipInfo,
                child: const IpInfoPage(),
              ),
              Visibility(
                visible: state.selectedTab == HomeTab.macInfo,
                child: const IpInfoPage(),
              ),
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            iconSize: 26,
            items: HomeTab.values
                .map(
                  (item) => BottomNavigationBarItem(
                    icon: Icon(item.icon),
                    label: item.label,
                  ),
                )
                .toList(),
            currentIndex: state.selectedTab.index,
            onTap: (selectedItemIndex) {
              cubit.onTabPressed(HomeTab.values[selectedItemIndex]);
            },
          ),
        ),
      ),
    );
  }
}
