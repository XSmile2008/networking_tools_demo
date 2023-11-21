// region Mocks

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:networking_tools_demo/model/data_sources/two_ip_data_source.dart';
import 'package:networking_tools_demo/model/entities/ip_address_info.dart';
import 'package:networking_tools_demo/pages/ip_info/model/ip_info_repository.dart';

class _MockTwoIpDataSource extends Mock implements TwoIpDataSource {}
// endregion

abstract class _TestValues {
  static const ip = '192.168.1.1';

  static const IpAddressInfo ipAddressInfo = IpAddressInfo(
    ip: '192.168.1.1',
    countryCode: 'US',
    country: 'United States',
    region: 'California',
    city: 'Mountain View',
    zipCode: '94043',
    latitude: '37.4229',
    longitude: '-122.085',
    timeZone: 'America/Los_Angeles',
  );
}

void main() {
  late TwoIpDataSource twoIpDataSource;
  setUp(() {
    twoIpDataSource = _MockTwoIpDataSource();
  });

  late IpInfoRepository ipInfoRepository;
  setUp(() {
    ipInfoRepository = IpInfoRepository(
      twoIpDataSource: twoIpDataSource,
    );
  });

  group('getIpAddressInfo tests', () {
    test('''.
      ## Given:
      - `TwoIpDataSource.getIpAddressInfo` will return some IP address info after being called with some `ip`
      ## When:
      - `getIpAddressInfo` is called with some `ip`
      ## Then should:
      - return given IP address info
      ''', () async {
      // Given
      when(
        () => twoIpDataSource.getIpAddressInfo(_TestValues.ip),
      ).thenAnswer((_) async => _TestValues.ipAddressInfo);

      // When
      final result = await ipInfoRepository.getIpAddressInfo(_TestValues.ip);

      // Then
      expect(result, _TestValues.ipAddressInfo);
    });
  });
}
