part of 'crypto_list_bloc.dart';

class CryptoListState extends Equatable{
  @override
  List<Object?> get props => [];
}

class CryptoListInitial extends CryptoListState {
  @override
  List<Object?> get props => [];
}

class CryptoListLoadind extends CryptoListState {
  @override
  List<Object?> get props => [];
}

class CryptoListLoaded extends CryptoListState {
  CryptoListLoaded({required this.cryptoList});

  final List<CryptoCoin> cryptoList;

  @override
  List<Object?> get props => [cryptoList];
}

class CryptoListFaulure extends CryptoListState {
  CryptoListFaulure({required this.error});

  final Object? error;

  @override
  List<Object?> get props => [error];
}