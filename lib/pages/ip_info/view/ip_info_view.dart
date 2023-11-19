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
                        children: [
                          Text('IP address: ${state.ipAddressInfo!.ip}'),
                          Text(
                            'Country code: ${state.ipAddressInfo!.countryCode}',
                          ),
                          Text('Country: ${state.ipAddressInfo!.country}'),
                          Text('Region: ${state.ipAddressInfo!.region}'),
                          Text('City: ${state.ipAddressInfo!.city}'),
                          Text('Zip code: ${state.ipAddressInfo!.zipCode}'),
                          Text('Latitude: ${state.ipAddressInfo!.latitude}'),
                          Text('Longitude: ${state.ipAddressInfo!.longitude}'),
                          Text('Time zone: ${state.ipAddressInfo!.timeZone}'),
                        ],
                      ),
                    ),
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
