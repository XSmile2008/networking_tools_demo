import 'package:dio/dio.dart';

import '../entities/ip_address_info.dart';
import '../entities/mac_address_info.dart';

class TwoIpDataSource {
  final Dio _dio;

  TwoIpDataSource({
    required Dio dio,
  }) : _dio = dio;

  Future<IpAddressInfo?> getIpAddressInfo(String ip) => _dio.get(
        '/geo.json',
        queryParameters: {'ip': ip},
      ).then((response) {
        if (response.data == null) return null;
        return IpAddressInfo.fromJson(response.data);
      });

  Future<MacAddressInfo?> getMacAddressInfo(String mac) => _dio.get(
        '/mac.json',
        queryParameters: {'mac': mac},
      ).then((response) {
        if (response.data == null) return null;
        return MacAddressInfo.fromJson(response.data);
      });
}
