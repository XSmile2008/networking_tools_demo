import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/mac_info_cubit.dart';
import '../model/mac_info_repository.dart';
import 'mac_info_view.dart';

class MacInfoPage extends StatelessWidget {
  const MacInfoPage({super.key});

  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (_) => MacInfoCubit(
          repository: MacInfoRepository(
            twoIpDataSource: RepositoryProvider.of(context),
          ),
        ),
        child: const MacInfoView(),
      );
}
