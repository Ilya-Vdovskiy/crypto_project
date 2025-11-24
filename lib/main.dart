import 'package:crypto_project/repositories/abstract_crypto_list_repos.dart';
import 'package:crypto_project/repositories/crypto_list_repos.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'crypto_coins_app.dart';

void main() {
  GetIt.I.registerLazySingleton<AbstractCryptoListRepos>(
    () => CryptoListRepos(dio: Dio()),
  );
  return runApp(CryptoCoinsApp());
}
