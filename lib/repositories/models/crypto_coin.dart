import 'package:equatable/equatable.dart';

class CryptoCoin extends Equatable{
  const CryptoCoin({required this.name, required this.priceInUsd, required this.imageUrl});

  final String name;
  final double priceInUsd;
  final String imageUrl;
  
  @override
  List<Object?> get props => [name, priceInUsd, imageUrl];
}
