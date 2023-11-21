import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:networking_tools_demo/arch/bloc_side_effects_handler.dart';
import 'package:networking_tools_demo/widgets/loader_overlay.dart';

import '../cubit/ip_info_cubit.dart';

class IpInfoView extends StatelessWidget {
  const IpInfoView({super.key});

  @override
  Widget build(BuildContext context) {
    final IpInfoCubit cubit = context.read();
    final infoItemTextStyle = Theme.of(context).textTheme.headlineSmall;
    return BlocSideEffectsHandler<IpInfoCubit, IpInfoState, IpInfoSideEffect>(
      listener: (context, sideEffect) {},
      child: Scaffold(
        body: BlocBuilder<IpInfoCubit, IpInfoState>(
          builder: (context, state) => LoaderOverlay(
            isLoading: state.isLoading,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
              child: Column(
                children: [
                  TextField(
                    onChanged: cubit.onIpChanged,
                    decoration: InputDecoration(
                      labelText: 'IP address',
                      hintText: 'xxx.xxx.xxx.xxx',
                      errorText: state.ipValidationErrorMessage,
                    ),
                  ),
                  const SizedBox(height: 16),
                  if (state.ipAddressInfo != null)
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'IP address: ${state.ipAddressInfo!.ip}',
                            style: infoItemTextStyle,
                          ),
                          Text(
                            'Country code: ${state.ipAddressInfo!.countryCode}',
                            style: infoItemTextStyle,
                          ),
                          Text(
                            'Country: ${state.ipAddressInfo!.country}',
                            style: infoItemTextStyle,
                          ),
                          Text(
                            'Region: ${state.ipAddressInfo!.region}',
                            style: infoItemTextStyle,
                          ),
                          Text(
                            'City: ${state.ipAddressInfo!.city}',
                            style: infoItemTextStyle,
                          ),
                          Text(
                            'Zip code: ${state.ipAddressInfo!.zipCode}',
                            style: infoItemTextStyle,
                          ),
                          Text(
                            'Latitude: ${state.ipAddressInfo!.latitude}',
                            style: infoItemTextStyle,
                          ),
                          Text(
                            'Longitude: ${state.ipAddressInfo!.longitude}',
                            style: infoItemTextStyle,
                          ),
                          Text(
                            'Time zone: ${state.ipAddressInfo!.timeZone}',
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
                    child: const Text('Check IP address'),
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
