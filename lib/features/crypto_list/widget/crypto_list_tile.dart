import 'package:crypto_project/repositories/models/crypto_coin.dart';
import 'package:flutter/material.dart';

class CryptoListTile extends StatelessWidget {
  const CryptoListTile({
    super.key,
    required this.coin
  });

  final CryptoCoin coin;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ListTile(
      title: Text(coin.name, style: theme.textTheme.labelLarge),
      subtitle: Text('${coin.price} \$', style: theme.textTheme.labelMedium),
      leading: Image.network(coin.imageUrl),
      trailing: Icon(Icons.arrow_forward_ios),
      onTap: () {},
    );
  }
}
// Navigator.pushNamed(context, '/coin_details');