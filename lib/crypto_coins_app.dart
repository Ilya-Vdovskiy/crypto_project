import 'package:crypto_project/router/router.dart';
import 'package:crypto_project/theme/theme.dart';
import 'package:flutter/material.dart';

class CryptoCoinsApp extends StatefulWidget {
  const CryptoCoinsApp({super.key});

  @override
  State<CryptoCoinsApp> createState() => _CryptoCoinsAppState();
}

class _CryptoCoinsAppState extends State<CryptoCoinsApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp (
      theme: theme,
      routes: router,
    );
  }
}