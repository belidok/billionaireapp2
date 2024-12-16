import 'package:billionaireapp2/addmoney_button.dart';
import 'package:billionaireapp2/balance_view.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  double balance = 0;
  Future<void> addMoney() async {
    setState(() {
      balance = balance + 500;
    });
    // Obtain shared preferences.
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setDouble('balance', balance);

    print(balance);
  }

  @override
  void initState() {
    laodBalance();
    super.initState();
  }

  void laodBalance() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      balance = prefs.getDouble('balance') ?? 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(useMaterial3: true),
      home: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: const Text('Billionaire App2!'),
          ),
          body: Container(
            padding: const EdgeInsets.only(top: 20, bottom: 20),
            height: double.infinity,
            width: double.infinity,
            color: Colors.blueGrey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BalanceView(balance: balance),
                AddmoneyButton(
                  addMoneyFunction: addMoney,
                ),
              ],
            ),
          )),
    );
  }
}
