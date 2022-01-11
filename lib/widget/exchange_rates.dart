import 'package:flutter/material.dart';
import 'package:flutter_cryto_app/data/model/exchange_rate.dart';
import 'package:flutter_cryto_app/provider/crypto_provider.dart';
import 'package:flutter_cryto_app/widget/currency_list.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

final _currencyFutureProvider = FutureProvider((ref) async {
  return await ref.read(cryptoProvider).getExchangeRate();
});

class ExchangeRates extends StatelessWidget {
  const ExchangeRates({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, watch, child) {
        return watch.watch(_currencyFutureProvider).when(
              data: (currency) {
                final source = ExchangeRateDataSource(currency: currency);
                return SfDataGrid(
                    source: source,
                    columns: list
                        .map((e) => GridColumn(
                            width: 120,
                            columnName: e,
                            label: buildHeaderText(e)))
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

final List<String> list = ['Currency', 'Rate', 'Date'];

class ExchangeRateDataSource extends DataGridSource {
  late List<DataGridRow> _currencies;
  @override
  List<DataGridRow> get rows => _currencies;

  ExchangeRateDataSource({required List<ExchangeRate> currency}) {
    _currencies = currency
        .map<DataGridRow>((c) => DataGridRow(
            cells: list
                .map((e) => DataGridCell(columnName: e, value: c))
                .toList()))
        .toList();
  }

  @override
  DataGridRowAdapter? buildRow(DataGridRow row) {
    return DataGridRowAdapter(
        cells: row.getCells().map<Widget>((e) {
      final ExchangeRate rate = e.value;
      final column =
          list.firstWhere((element) => element.toString() == e.columnName);
      switch (column) {
        case 'Currency':
          return buildText(rate.currency!);
        case 'Rate':
          return buildText(rate.rate!.toStringAsFixed(2));
        case 'Date':
          return buildText(DateFormat().add_yMMMd().format(rate.timestamp!));

        default:
          return const Text('');
      }
    }).toList());
  }
}
