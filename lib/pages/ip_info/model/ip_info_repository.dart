import 'package:networking_tools_demo/model/data_sources/two_ip_data_source.dart';
import 'package:networking_tools_demo/model/entities/ip_address_info.dart';

class IpInfoRepository {
  final TwoIpDataSource _twoIpDataSource;

  IpInfoRepository({
    required TwoIpDataSource twoIpDataSource,
  }) : _twoIpDataSource = twoIpDataSource;

  Future<IpAddressInfo> getIpAddressInfo(String ip) =>
      _twoIpDataSource.getIpAddressInfo(ip);
}
