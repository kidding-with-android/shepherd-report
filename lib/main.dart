import 'package:flutter/material.dart';

import 'month_list/month_list.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Relatórios Apascentador',
			theme: ThemeData(
				primaryColor: Colors.white,
			),
      home: MonthList(),
    );
  }
}
