import 'package:equatable/equatable.dart';

class CryptoCoin extends Equatable{
  const CryptoCoin({required this.name, required this.price, required this.imageUrl});

  final String name;
  final double price;
  final String imageUrl;
  
  @override
  List<Object?> get props => [name, price, imageUrl];
}
