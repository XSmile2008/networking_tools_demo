import 'package:equatable/equatable.dart';

class IpAddressInfo extends Equatable {
  final String ip;
  final String countryCode;
  final String country;
  final String region;
  final String city;
  final String zipCode;
  final String latitude;
  final String longitude;
  final String timeZone;

  const IpAddressInfo({
    required this.ip,
    required this.countryCode,
    required this.country,
    required this.region,
    required this.city,
    required this.zipCode,
    required this.latitude,
    required this.longitude,
    required this.timeZone,
  });

  @override
  List<Object?> get props => [
        ip,
        countryCode,
        country,
        region,
        city,
        zipCode,
        latitude,
        longitude,
        timeZone,
      ];

  factory IpAddressInfo.fromJson(Map<String, dynamic> json) => IpAddressInfo(
        ip: json['ip'],
        countryCode: json['country_code'],
        country: json['country'],
        region: json['region'],
        city: json['city'],
        zipCode: json['zip_code'],
        latitude: json['latitude'],
        longitude: json['longitude'],
        timeZone: json['time_zone'],
      );
}
