import 'package:flutter/material.dart';

class CryptoListTile extends StatelessWidget {
  const CryptoListTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ListTile(
      title: Text('BTS', style: theme.textTheme.labelLarge),
      subtitle: Text('10507.00', style: theme.textTheme.labelMedium),
      leading: Icon(Icons.abc),
      trailing: Icon(Icons.arrow_forward_ios),
      onTap: () {},
    );
  }
}