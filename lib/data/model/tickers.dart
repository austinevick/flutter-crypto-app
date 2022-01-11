class TickerModel {
  String? id;
  String? currency;
  String? symbol;
  String? name;
  String? logoUrl;
  String? status;
  String? platformCurrency;
  double? price;
  String? priceDate;
  String? priceTimestamp;
  String? circulatingSupply;
  double? marketCap;
  String? marketCapDominance;
  String? numExchanges;
  String? numPairs;
  String? numPairsUnmapped;
  String? firstCandle;
  String? firstTrade;
  String? firstOrderBook;
  String? rank;
  String? rankDelta;
  String? high;
  String? highTimestamp;
  double? oneDayChange;
  double? oneHourChange;
  double? sevenDayChange;

  TickerModel(
      {this.id,
      this.currency,
      this.symbol,
      this.name,
      this.logoUrl,
      this.status,
      this.platformCurrency,
      this.price,
      this.priceDate,
      this.priceTimestamp,
      this.circulatingSupply,
      this.oneDayChange,
      this.oneHourChange,
      this.sevenDayChange,
      this.marketCap,
      this.marketCapDominance,
      this.numExchanges,
      this.numPairs,
      this.numPairsUnmapped,
      this.firstCandle,
      this.firstTrade,
      this.firstOrderBook,
      this.rank,
      this.rankDelta,
      this.high,
      this.highTimestamp});

  TickerModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    currency = json['currency'];
    symbol = json['symbol'];
    name = json['name'];
    logoUrl = json['logo_url'];
    status = json['status'];
    platformCurrency = json['platform_currency'];
    price = double.parse(json['price']).toDouble();
    priceDate = json['price_date'];
    priceTimestamp = json['price_timestamp'];
    circulatingSupply = json['circulating_supply'];
    marketCap = double.parse(json['market_cap']).toDouble();
    marketCapDominance = json['market_cap_dominance'];
    numExchanges = json['num_exchanges'];
    numPairs = json['num_pairs'];
    numPairsUnmapped = json['num_pairs_unmapped'];
    firstCandle = json['first_candle'];
    firstTrade = json['first_trade'];
    firstOrderBook = json['first_order_book'];
    rank = json['rank'];
    rankDelta = json['rank_delta'];
    oneDayChange = double.parse(json['1d']['price_change']).toDouble();
    oneHourChange = double.parse(json['1h']['price_change']).toDouble();
    sevenDayChange = double.parse(json['7d']['price_change']).toDouble();
    high = json['high'];
    highTimestamp = json['high_timestamp'];
  }
}
