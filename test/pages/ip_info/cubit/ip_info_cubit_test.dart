import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:networking_tools_demo/pages/ip_info/cubit/ip_info_cubit.dart';
import 'package:networking_tools_demo/pages/ip_info/model/ip_info_repository.dart';

// region Mocks

class _MockIpInfoRepository extends Mock implements IpInfoRepository {}
// endregion

void main() {
  late IpInfoRepository ipInfoRepository;
  setUp(() {
    ipInfoRepository = _MockIpInfoRepository();
  });

  group('Initial state tests', () {
    test('''.
      Initial state should be IpInfoState with:
      - empty `sideEffects` list
      - `isLoading` set to `false`
      - `ip` set to empty string
      - `ipValidationErrorMessage` set to `null`
      - `ipAddressInfo` set to `null`
      ''', () {
      expect(
        IpInfoCubit(
          repository: ipInfoRepository,
        ).state,
        const IpInfoState(
          sideEffects: [],
          isLoading: false,
          ip: '',
          ipValidationErrorMessage: null,
          ipAddressInfo: null,
        ),
      );
    });
  });

  group('onIpChanged tests', () {
    blocTest(
      '''.
      ## When:
      - `onIpChanged` is called with correct IP address as `ip`
      ## Then should:
      - emit `IpInfoState` with:
        - `ip` set to the string passed to `onIpChanged`
        - `ipValidationErrorMessage` set to `null`
      ''',
      build: () => IpInfoCubit(
        repository: ipInfoRepository,
      ),
      act: (cubit) => cubit.onIpChanged('192.168.1.1'),
      expect: () => [
        const IpInfoState(
          ip: '192.168.1.1',
          ipValidationErrorMessage: null,
        ),
      ],
    );

    blocTest(
      '''.
      ## When:
      - `onIpChanged` is called with not valid IP address as `ip`
      ## Then should:
      - emit `IpInfoState` with:
        - `ip` set to the string passed to `onIpChanged`
        - `ipValidationErrorMessage` set to `null`
      ''',
      build: () => IpInfoCubit(
        repository: ipInfoRepository,
      ),
      act: (cubit) => cubit.onIpChanged('taco'),
      expect: () => [
        const IpInfoState(
          ip: 'taco',
          ipValidationErrorMessage: null,
        ),
      ],
    );

    blocTest(
      '''.
      ## Given:
      - state is `IpInfoState` with:
        - invalid `ip`
        - `ipValidationErrorMessage` set to 'Invalid IP address'
      ## When:
      - `onIpChanged` is called with not valid IP address as `ip`
      ## Then should:
      - emit `IpInfoState` with:
        - `ip` set to the string passed to `onIpChanged`
        - not changed `ipValidationErrorMessage`
      ''',
      build: () => IpInfoCubit(
        repository: ipInfoRepository,
      ),
      seed: () => const IpInfoState(
        ip: 'taco',
        ipValidationErrorMessage: 'Invalid IP address',
      ),
      act: (cubit) => cubit.onIpChanged('burrito'),
      expect: () => [
        const IpInfoState(
          ip: 'burrito',
          ipValidationErrorMessage: 'Invalid IP address',
        ),
      ],
    );

    blocTest(
      '''.
      ## Given:
      - state is `IpInfoState` with:
        - invalid `ip`
        - `ipValidationErrorMessage` set to 'Invalid IP address'
      ## When:
      - `onIpChanged` is called with valid IP address as `ip`
      ## Then should:
      - emit `IpInfoState` with:
        - `ip` set to the string passed to `onIpChanged`
        - cleared `ipValidationErrorMessage`
      ''',
      build: () => IpInfoCubit(
        repository: ipInfoRepository,
      ),
      seed: () => const IpInfoState(
        ip: 'taco',
        ipValidationErrorMessage: 'Invalid IP address',
      ),
      act: (cubit) => cubit.onIpChanged('192.168.1.1'),
      expect: () => [
        const IpInfoState(
          ip: '192.168.1.1',
          ipValidationErrorMessage: null,
        ),
      ],
    );
  });
}
