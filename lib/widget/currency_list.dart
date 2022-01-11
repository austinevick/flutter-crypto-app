import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_cryto_app/data/model/tickers.dart';
import 'package:flutter_cryto_app/provider/crypto_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

final _currencyFutureProvider = FutureProvider((ref) async {
  return await ref.read(cryptoProvider).getTickers();
});

class CurrencyList extends StatelessWidget {
  const CurrencyList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, watch, child) {
        return watch.watch(_currencyFutureProvider).when(
              data: (currency) {
                CurrencyDataSource source =
                    CurrencyDataSource(currency: currency);
                return SfDataGrid(
                    frozenColumnsCount: 1,
                    allowPullToRefresh: true,
                    source: source,
                    columns: columns
                        .map((e) => GridColumn(
                            columnName: e, label: buildHeaderText(e)))
                        .toList());
              },
              error: (error, stackTrace) =>
                  const Center(child: Text('Something went wrong')),
              loading: () => const Center(
                child: CircularProgressIndicator(),
              ),
            );
      },
    );
  }
}

buildHeaderText(e) => Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        e,
        style: const TextStyle(color: Colors.teal, fontWeight: FontWeight.bold),
      ),
    );
Widget buildText(String data) => Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(data),
    );

final List<String> columns = [
  'Id',
  'Name',
  'Rank',
  'Price',
  'Last 1 hour',
  'Last 1 day',
  'Last 7 days',
  'Market Cap'
];

class CurrencyDataSource extends DataGridSource {
  late List<DataGridRow> _currencies;
  @override
  List<DataGridRow> get rows => _currencies;

  CurrencyDataSource({required List<TickerModel> currency}) {
    _currencies = currency
        .map<DataGridRow>((c) => DataGridRow(
            cells: columns
                .map((e) => DataGridCell(columnName: e, value: c))
                .toList()))
        .toList();
  }

  @override
  DataGridRowAdapter? buildRow(DataGridRow row) {
    return DataGridRowAdapter(
        cells: row.getCells().map<Widget>((e) {
      final TickerModel currency = e.value;
      final column =
          columns.firstWhere((element) => element.toString() == e.columnName);
      switch (column) {
        case 'Id':
          return buildText(currency.id!);
        case 'Rank':
          return buildText(currency.rank!);
        case 'Name':
          return buildText(currency.name!);
        case 'Price':
          return buildText('\$' + currency.price!.toStringAsFixed(1));
        case 'Last 1 day':
          return buildText(currency.oneDayChange!.toStringAsFixed(2));
        case 'Last 1 hour':
          return buildText(currency.oneHourChange!.toStringAsFixed(2));
        case 'Last 7 days':
          return buildText(currency.price!.toStringAsFixed(2));
        case 'Market Cap':
          return buildText(currency.marketCap!.toStringAsFixed(0));
        default:
          return const Text('');
      }
    }).toList());
  }
}
