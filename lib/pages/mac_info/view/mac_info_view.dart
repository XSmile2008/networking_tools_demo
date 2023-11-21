import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:networking_tools_demo/arch/bloc_side_effects_handler.dart';
import 'package:networking_tools_demo/widgets/loader_overlay.dart';

import '../cubit/mac_info_cubit.dart';

class MacInfoView extends StatelessWidget {
  const MacInfoView({super.key});

  @override
  Widget build(BuildContext context) {
    final MacInfoCubit cubit = context.read();
    final infoItemTextStyle = Theme.of(context).textTheme.headlineSmall;
    return BlocSideEffectsHandler<MacInfoCubit, MacInfoState,
        MacInfoSideEffect>(
      listener: (context, sideEffect) {},
      child: Scaffold(
        body: BlocBuilder<MacInfoCubit, MacInfoState>(
          builder: (context, state) => LoaderOverlay(
            isLoading: state.isLoading,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
              child: Column(
                children: [
                  TextField(
                    onChanged: cubit.onIpChanged,
                    decoration: InputDecoration(
                      labelText: 'MAC address',
                      hintText: 'XX:XX:XX:XX',
                      errorText: state.macValidationErrorMessage,
                    ),
                  ),
                  const SizedBox(height: 16),
                  if (state.macAddressInfo != null)
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Company: ${state.macAddressInfo!.company}',
                            style: infoItemTextStyle,
                          ),
                          Text(
                            'Address: ${state.macAddressInfo!.address}',
                            style: infoItemTextStyle,
                          ),
                          Text(
                            'Country: ${state.macAddressInfo!.country}',
                            style: infoItemTextStyle,
                          ),
                          Text(
                            'Private: ${state.macAddressInfo!.private}',
                            style: infoItemTextStyle,
                          ),
                          Text(
                            'OUI: ${state.macAddressInfo!.oui}',
                            style: infoItemTextStyle,
                          ),
                          Text(
                            'Bloc size: ${state.macAddressInfo!.blockSize}',
                            style: infoItemTextStyle,
                          ),
                          Text(
                            'Created: ${state.macAddressInfo!.dateCreated}',
                            style: infoItemTextStyle,
                          ),
                          Text(
                            'Updated: ${state.macAddressInfo!.dateUpdated}',
                            style: infoItemTextStyle,
                          ),
                        ],
                      ),
                    )
                  else
                    const Spacer(),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: cubit.onCheckPressed,
                    child: const Text('Check MAC address'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
