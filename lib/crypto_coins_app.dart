import 'package:crypto_project/router/router.dart';
import 'package:crypto_project/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:talker_flutter/talker_flutter.dart';

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
      navigatorObservers: [TalkerRouteObserver(GetIt.I<Talker>())],
    );
  }
}