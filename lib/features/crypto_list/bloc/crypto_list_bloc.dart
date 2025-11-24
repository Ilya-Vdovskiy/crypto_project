import 'dart:async';

import 'package:crypto_project/repositories/abstract_crypto_list_repos.dart';
import 'package:crypto_project/repositories/models/crypto_coin.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:talker_flutter/talker_flutter.dart';

part 'crypto_list_state.dart';
part 'crypto_list_event.dart';

class CryptoListBloc extends Bloc<CryptoListEvent, CryptoListState> {
  CryptoListBloc({required this.cryptoRepos}) : super(CryptoListInitial()) {
    on<LoadCryptoList>((event, emit) async {
      try {
        if (state is! CryptoListLoaded) {
          emit(CryptoListLoadind());
        }
        final cryptoList = await cryptoRepos.getCoinList();
        emit(CryptoListLoaded(cryptoList: cryptoList));
      } catch (e) {
        emit(CryptoListFaulure(error: e));
        GetIt.I<Talker>().handle(e);
      } finally {
        event.completer?.complete();
      }
    });
  }

  final AbstractCryptoListRepos cryptoRepos;

  @override
  void onError(Object error, StackTrace stackTrace) {
    super.onError(error, stackTrace);
    GetIt.I<Talker>().handle(error, stackTrace);
  }
}
