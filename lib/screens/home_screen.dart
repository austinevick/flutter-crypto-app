import 'package:flutter/material.dart';
import 'package:flutter_cryto_app/data/model/exchange_rate.dart';
import 'package:flutter_cryto_app/widget/currency_list.dart';
import 'package:flutter_cryto_app/widget/custom_button.dart';
import 'package:flutter_cryto_app/widget/custom_drawer.dart';
import 'package:flutter_cryto_app/widget/exchange_rates.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              title: const Text('Cryptocurrency'),
            ),
            body: LayoutBuilder(
              builder: (context, constraints) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    buildButton(),
                    const Divider(),
                    Expanded(
                      child: AnimatedSwitcher(
                        duration: const Duration(seconds: 1),
                        child: selectedIndex == 0
                            ? const CurrencyList()
                            : const ExchangeRates(),
                      ),
                    )
                  ],
                );
              },
            )));
  }

  Widget buildButton() => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomButton(
            textColor: selectedIndex == 0 ? Colors.white : Colors.white54,
            color: selectedIndex == 0 ? const Color(0xff0ee6b7) : Colors.grey,
            text: 'Currencies',
            selectedIndex: selectedIndex,
            onPressed: () => setState(() => selectedIndex = 0),
          ),
          CustomButton(
            textColor: selectedIndex == 1 ? Colors.white : Colors.white60,
            color: selectedIndex == 1 ? const Color(0xff0ee6b7) : Colors.grey,
            text: 'Exchange rate',
            selectedIndex: selectedIndex,
            onPressed: () => setState(() => selectedIndex = 1),
          )
        ],
      );
}
