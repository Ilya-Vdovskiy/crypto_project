import 'package:crypto_project/repositories/abstract_crypto_list_repos.dart';
import 'package:crypto_project/repositories/models/crypto_coin.dart';
import 'package:dio/dio.dart';

class CryptoListRepos implements AbstractCryptoListRepos {
  CryptoListRepos({required this.dio});
  final Dio dio;

  @override
  Future<List<CryptoCoin>> getCoinList() async {
    final response = await dio.get(
      'https://min-api.cryptocompare.com/data/pricemultifull?fsyms=BTC,SOL,DOT,AVAX,ATOM,ETH,ADI,B2B,BBC,BNK,DAX,ETHM,OPT,USDT&tsyms=USD',
    );

    final data = response.data as Map<String, dynamic>;
    final dataRAW = data['RAW'] as Map<String, dynamic>;
    final cryptoCoinList = dataRAW.entries.map((e) {
      final usdData = (e.value as Map<String, dynamic>)['USD'] as Map<String, dynamic>;

      final price = usdData['PRICE'];
      final imageUrl = usdData['IMAGEURL'];

      return CryptoCoin(
        name: e.key,
        price: price,
        imageUrl: 'https://www.cryptocompare.com$imageUrl'
      );
    }).toList();

    return cryptoCoinList;
  }
}
