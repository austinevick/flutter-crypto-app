import 'package:flutter_cryto_app/data/crypto_remote_data_source.dart';
import 'package:flutter_cryto_app/data/model/currency.dart';
import 'package:flutter_cryto_app/data/model/exchange_rate.dart';
import 'package:flutter_cryto_app/data/model/tickers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final cryptoProvider = Provider<CryptoProvider>((ref) {
  return CryptoProvider();
});

class CryptoProvider {
  CryptoRemoteDataSource source = CryptoRemoteDataSourceImpl();

  Future<List<Currency>> getCurrency() async {
    return await source.getCurrency();
  }

  Future<List<ExchangeRate>> getExchangeRate() async {
    return await source.getExchangeRate();
  }

  Future<List<TickerModel>> getTickers() async {
    return await source.getTickers();
  }
}
