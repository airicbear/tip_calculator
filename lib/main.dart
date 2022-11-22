import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tip_calculator/data/models/bill.dart';
import 'package:tip_calculator/ui/result_panel.dart';
import 'package:tip_calculator/ui/round_tip_input.dart';
import 'package:tip_calculator/ui/split_input.dart';
import 'package:tip_calculator/ui/subtotal_input.dart';
import 'package:provider/provider.dart';
import 'package:tip_calculator/ui/tip_input.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (BuildContext context) => BillModel(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      title: 'Tip Calculator',
      darkTheme: ThemeData(
        brightness: Brightness.dark,
      ),
      home: const MyHomePage(
        title: 'Tip Calculator',
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: ListView(
          children: const [
            ResultPanel(),
            SplitInput(),
            TipInput(),
            RoundTipInput(),
            SubtotalInput(),
          ],
        ),
      ),
    );
  }
}
