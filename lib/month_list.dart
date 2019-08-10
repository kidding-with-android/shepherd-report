import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'member_list.dart';

class MonthList extends StatefulWidget {
  @override
  MonthListState createState() => MonthListState();
}

class MonthListState extends State<MonthList> {
  final List<DateTime> _months = <DateTime>[];
  final Set<DateTime> _saved = Set<DateTime>();
  final TextStyle _biggerFont = const TextStyle(fontSize: 18);
	final String _localeName = "pt_BR";
	DateFormat formatter;

  @override
  Widget build(BuildContext context) {
		initializeDateFormatting(_localeName);
		formatter = DateFormat(DateFormat.YEAR_MONTH, _localeName);

    return Scaffold(
      appBar: AppBar(
        title: Text('Relatórios'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.list),
            onPressed: _pushSaved,
          ),
        ],
      ),
      body: _buildMonths(),
    );
  }

  List<DateTime> _generateMonths() {
		DateTime now = DateTime.now();
		if (_months.length > 0) {
			final DateTime last = _months.last;
			now = DateTime(last.year, last.month - 1);
		}

		return List.generate(10, (index) {
			return DateTime(now.year, now.month - index);
		});
  }

  void _pushSaved() {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (BuildContext context) {
          final Iterable<ListTile> tiles = _saved.map((DateTime month) {
            return ListTile(
              title: Text(
                formatter.format(month),
                style: _biggerFont,
              ),
            );
          });
          final List<Widget> divided = ListTile.divideTiles(
            context: context,
            tiles: tiles,
          ).toList();

          return Scaffold(
            appBar: AppBar(
              title: Text('Saved Suggestions'),
            ),
            body: ListView(
              children: divided,
            ),
          );
        },
      ),
    );
  }

  Widget _buildMonths() {
    return ListView.builder(
			padding: const EdgeInsets.all(16),
			itemBuilder: (BuildContext _context, int i) {
				if (i.isOdd) {
					return Divider();
				}

				final int index = i ~/ 2;
				if (index >= _months.length) {
					_months.addAll(_generateMonths());
				}
				return _buildRow(_months[index]);
			}
		);
  }

  Widget _buildRow(DateTime month) {
    final bool alreadySaved = _saved.contains(month);

    return ListTile(
      title: Text(
        formatter.format(month),
        style: _biggerFont,
      ),
      trailing: Icon(
        alreadySaved ? Icons.favorite : Icons.favorite_border,
        color: alreadySaved ? Colors.red : null,
      ),
      onTap: () {
				Navigator.of(context).push(
					MaterialPageRoute<void>(
						builder: (BuildContext context) => MemberList()
					),
				);

        setState(() {
          if (alreadySaved) {
            _saved.remove(month);
          } else {
            _saved.add(month);
          }
        });
      },
    );
  }
}
