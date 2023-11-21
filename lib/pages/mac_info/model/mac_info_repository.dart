import 'package:networking_tools_demo/model/data_sources/two_ip_data_source.dart';
import 'package:networking_tools_demo/model/entities/mac_address_info.dart';

class MacInfoRepository {
  final TwoIpDataSource _twoIpDataSource;

  MacInfoRepository({
    required TwoIpDataSource twoIpDataSource,
  }) : _twoIpDataSource = twoIpDataSource;

  Future<MacAddressInfo?> getMacAddressInfo(String ip) =>
      _twoIpDataSource.getMacAddressInfo(ip);
}
