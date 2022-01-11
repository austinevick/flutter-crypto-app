class ExchangeRate {
  String? currency;
  double? rate;
  DateTime? timestamp;

  ExchangeRate({this.currency, this.rate, this.timestamp});

  ExchangeRate.fromJson(Map<String, dynamic> json) {
    currency = json['currency'];
    rate = double.parse(json['rate']).toDouble();
    timestamp = DateTime.parse(json['timestamp']);
  }
}
