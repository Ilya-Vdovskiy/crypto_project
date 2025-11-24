import 'package:crypto_project/repositories/models/crypto_coin.dart';

abstract class AbstractCryptoListRepos {
  Future<List<CryptoCoin>> getCoinList();
}