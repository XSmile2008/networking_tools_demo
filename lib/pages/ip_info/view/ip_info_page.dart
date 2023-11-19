import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/ip_info_cubit.dart';
import '../model/ip_info_repository.dart';
import 'ip_info_view.dart';

class IpInfoPage extends StatelessWidget {
  const IpInfoPage({super.key});

  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (_) => IpInfoCubit(
          repository: IpInfoRepository(
            twoIpDataSource: RepositoryProvider.of(context),
          ),
        ),
        child: const IpInfoView(),
      );
}
