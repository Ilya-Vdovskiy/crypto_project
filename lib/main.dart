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
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() {
   runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();

    final talker = TalkerFlutter.init();
    GetIt.I.registerSingleton<Talker>(talker);

    GetIt.I<Talker>().debug('Start talker...');

    final fireApp = await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    talker.info(fireApp.options.projectId);

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

    runApp(CryptoCoinsApp());
  }, (error, stack) {
    final talker = GetIt.I.isRegistered<Talker>() ? GetIt.I<Talker>() : null;
    if (talker != null) {
      talker.handle(error, stack);
    } else {
      FlutterError.reportError(FlutterErrorDetails(exception: error, stack: stack));
    }
  });
}
