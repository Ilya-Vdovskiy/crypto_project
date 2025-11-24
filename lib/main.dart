import 'dart:async';

import 'package:crypto_project/repositories/abstract_crypto_list_repos.dart';
import 'package:crypto_project/repositories/crypto_list_repos.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:talker_bloc_logger/talker_bloc_logger.dart';
import 'package:talker_dio_logger/talker_dio_logger.dart';
import 'package:talker_flutter/talker_flutter.dart';
import 'crypto_coins_app.dart';

void main() {
  final talker = TalkerFlutter.init();
  GetIt.I.registerSingleton(talker);

  GetIt.I<Talker>().debug('Start talker...');

  final dio = Dio();
  dio.interceptors.add(
    TalkerDioLogger(
      settings: const TalkerDioLoggerSettings(printResponseData: false),
    ),
  );

  Bloc.observer = TalkerBlocObserver(
    talker: talker,
    settings: TalkerBlocLoggerSettings(
      printEventFullData: false,
      printStateFullData: false,
    ),
  );

  GetIt.I.registerLazySingleton<AbstractCryptoListRepos>(
    () => CryptoListRepos(dio: dio),
  );

  FlutterError.onError = (detail) =>
      GetIt.I<Talker>().handle(detail.exception, detail.stack);

  runZonedGuarded(
    () => runApp(CryptoCoinsApp()),
    (e, st) => GetIt.I<Talker>().handle(e, st),
  );
}
