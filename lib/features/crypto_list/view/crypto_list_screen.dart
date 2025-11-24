import 'package:crypto_project/repositories/abstract_crypto_list_repos.dart';
import 'package:crypto_project/repositories/models/crypto_coin.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import '../widget/widget.dart';

class CryptoListScreen extends StatefulWidget {
  const CryptoListScreen({super.key});

  @override
  State<CryptoListScreen> createState() => _CryptoListScreenState();
}

class _CryptoListScreenState extends State<CryptoListScreen> {
   List<CryptoCoin>? _cryptoCoinList;

  Future<void> _loadCoinList() async {
    _cryptoCoinList = await GetIt.I<AbstractCryptoListRepos>().getCoinList();
    setState(() {});
  }

  @override
  void initState() {
    _loadCoinList();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('CURRENSY BEST COIN')),

      body: (_cryptoCoinList == null)
          ? const Center(child: CircularProgressIndicator())
          : ListView.separated(
              padding: const EdgeInsets.all(12),
              itemCount: _cryptoCoinList!.length,
              separatorBuilder: (context, index) => const Divider(),
              itemBuilder: (context, i) {
                final coin = _cryptoCoinList![i];
                return CryptoListTile(coin: coin);
              },
            ),
    );
  }
}
