import 'package:equatable/equatable.dart';

/// Dart impelementation of following JSON
///
/// {"company":"Super Micro Computer, Inc.","address":"2051 Junction Avenue San Jose CA US 95131 ","country":"","private":"","oui":"003048","block_size":"MA-L","date_created":"0000-00-00","date_updated":"0000-00-00"}

class MacAddressInfo extends Equatable {
  final String company;
  final String address;
  final String country;
  final String private;
  final String oui;
  final String blockSize;
  final String dateCreated;
  final String dateUpdated;

  const MacAddressInfo({
    required this.company,
    required this.address,
    required this.country,
    required this.private,
    required this.oui,
    required this.blockSize,
    required this.dateCreated,
    required this.dateUpdated,
  });

  @override
  List<Object?> get props => [
        company,
        address,
        country,
        private,
        oui,
        blockSize,
        dateCreated,
        dateUpdated,
      ];

  factory MacAddressInfo.fromJson(Map<String, dynamic> json) => MacAddressInfo(
        company: json['company'] as String,
        address: json['address'] as String,
        country: json['country'] as String,
        private: json['private'] as String,
        oui: json['oui'] as String,
        blockSize: json['block_size'] as String,
        dateCreated: json['date_created'] as String,
        dateUpdated: json['date_updated'] as String,
      );
}
