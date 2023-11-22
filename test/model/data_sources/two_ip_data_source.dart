// region Mocks

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:networking_tools_demo/model/data_sources/two_ip_data_source.dart';
import 'package:networking_tools_demo/model/entities/ip_address_info.dart';
import 'package:networking_tools_demo/model/entities/mac_address_info.dart';

class _MockDio extends Mock implements Dio {}
// endregion

abstract class _TestValues {
  static const ip = '192.168.1.1';

  /// From https://api.2ip.ua/geo.json?ip=8.8.8.8
  static const Map<String, dynamic> ipAddressInfoJson = {
    'ip': '8.8.8.8',
    'country_code': 'US',
    'country': 'United states of america',
    'country_rus': '\u0421\u0428\u0410',
    'country_ua': '\u0421\u0428\u0410',
    'region': 'California',
    'region_rus':
        '\u041a\u0430\u043b\u0438\u0444\u043e\u0440\u043d\u0438\u044f',
    'region_ua': '\u041a\u0430\u043b\u0456\u0444\u043e\u0440\u043d\u0456\u044f',
    'city': 'Mountain view',
    'city_rus': '\u041c\u0430\u0443\u043d\u0442\u0438\u043d-\u0412\u044c\u044e',
    'latitude': '37.38605',
    'longitude': '-122.08385',
    'zip_code': '94035',
    'time_zone': '-07:00',
  };

  static const IpAddressInfo ipAddressInfo = IpAddressInfo(
    ip: '8.8.8.8',
    countryCode: 'US',
    country: 'United states of america',
    region: 'California',
    city: 'Mountain view',
    zipCode: '94035',
    latitude: '37.38605',
    longitude: '-122.08385',
    timeZone: '-07:00',
  );

  static const mac = '00:30:48:5a:58:65';

  /// From https://api.2ip.ua/mac.json?mac=00:30:48:5a:58:65
  static const Map<String, dynamic> macAddressInfoJson = {
    'company': 'Super Micro Computer, Inc.',
    'address': '2051 Junction Avenue San Jose CA US 95131 ',
    'country': 'US',
    'private': 'Taco',
    'oui': '003048',
    'block_size': 'MA-L',
    'date_created': '2007-11-14',
    'date_updated': '2011-05-25',
  };

  static const MacAddressInfo macAddressInfo = MacAddressInfo(
    company: 'Super Micro Computer, Inc.',
    address: '2051 Junction Avenue San Jose CA US 95131 ',
    country: 'US',
    private: 'Taco',
    oui: '003048',
    blockSize: 'MA-L',
    dateCreated: '2007-11-14',
    dateUpdated: '2011-05-25',
  );
}

void main() {
  late Dio dio;
  setUp(() {
    dio = _MockDio();
  });

  late TwoIpDataSource twoIpDataSource;
  setUp(() {
    twoIpDataSource = TwoIpDataSource(
      dio: dio,
    );
  });

  group('getIpAddressInfo tests', () {
    test('''.
      ## Given:
      - `Dio.get` will return some `Response` where `data` contains JSON representation of IP address info
      ## When:
      - `getIpAddressInfo` is called with some `ip`
      ## Then should:
      - return parsed IP address info
      ''', () async {
      // Given
      when(
        () => dio.get(
          '/geo.json',
          queryParameters: {
            'ip': _TestValues.ip,
          },
        ),
      ).thenAnswer(
        (_) async => Response(
          data: _TestValues.ipAddressInfoJson,
          statusCode: 200,
          requestOptions: RequestOptions(path: '/geo.json'),
        ),
      );

      // When
      final result = await twoIpDataSource.getIpAddressInfo(_TestValues.ip);

      // Then
      expect(result, _TestValues.ipAddressInfo);
    });
  });

  group('getMacAddressInfo tests', () {
    test('''.
      ## Given:
      - `Dio.get` will return some `Response` where `data` contains JSON representation of MAC address info
      ## When:
      - `getMacAddressInfo` is called with some `mac`
      ## Then should:
      - return parsed MAC address info
      ''', () async {
      // Given
      when(
        () => dio.get(
          '/mac.json',
          queryParameters: {
            'mac': _TestValues.mac,
          },
        ),
      ).thenAnswer(
        (_) async => Response(
          data: _TestValues.macAddressInfoJson,
          statusCode: 200,
          requestOptions: RequestOptions(path: '/mac.json'),
        ),
      );

      // When
      final result = await twoIpDataSource.getMacAddressInfo(_TestValues.mac);

      // Then
      expect(result, _TestValues.macAddressInfo);
    });
  });
}
