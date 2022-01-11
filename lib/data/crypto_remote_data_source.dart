import 'dart:convert';

import 'package:flutter_cryto_app/common/api_constant.dart';
import 'package:flutter_cryto_app/data/model/currency.dart';
import 'package:flutter_cryto_app/data/model/exchange_rate.dart';
import 'package:flutter_cryto_app/data/model/tickers.dart';
import 'package:http/http.dart';

abstract class CryptoRemoteDataSource {
  Future<List<TickerModel>> getTickers();
  Future<List<ExchangeRate>> getExchangeRate();
  Future<List<Currency>> getCurrency();
}

class CryptoRemoteDataSourceImpl extends CryptoRemoteDataSource {
  final Client _client = Client();
  @override
  Future<List<Currency>> getCurrency() async {
    final response =
        await _client.get(Uri.parse('$BASEURL/currencies?key=$APIKEY'));
    if (response.statusCode == 200) {
      Iterable data = jsonDecode(response.body);

      return data.map((e) => Currency.fromJson(e)).toList();
    } else {
      print(response.reasonPhrase);
      throw Exception('Unable to get data');
    }
  }

  @override
  Future<List<ExchangeRate>> getExchangeRate() async {
    final response =
        await _client.get(Uri.parse('$BASEURL/exchange-rates?key=$APIKEY'));
    if (response.statusCode == 200) {
      Iterable data = jsonDecode(response.body);
      print(data);
      return data.map((e) => ExchangeRate.fromJson(e)).toList();
    } else {
      print(response.reasonPhrase);
      throw Exception('Unable to get data');
    }
  }

  @override
  Future<List<TickerModel>> getTickers() async {
    final response = await _client.get(Uri.parse(
        '$BASEURL/currencies/ticker?key=$APIKEY&interval=1d,1h,7d&convert=EUR&platform&per-page=100&page=1'));
    if (response.statusCode == 200) {
      Iterable data = jsonDecode(response.body);
      print(data);
      return data.map((e) => TickerModel.fromJson(e)).toList();
    } else {
      print(response.reasonPhrase);
      throw Exception('Unable to get data');
    }
  }
}
