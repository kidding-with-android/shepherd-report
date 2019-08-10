import 'package:flutter/material.dart';

class MemberList extends StatefulWidget {
  @override
  MemberListState createState() => MemberListState();
}

class MemberListState extends State<MemberList> {
  final List<String> _members = <String>[];
  // final Set<DateTime> _saved = Set<DateTime>();
  // final TextStyle _biggerFont = const TextStyle(fontSize: 18);
	// final String _localeName = "pt_BR";
	// DateFormat formatter;

  @override
  Widget build(BuildContext context) {
		// initializeDateFormatting(_localeName);
		// formatter = DateFormat(DateFormat.YEAR_MONTH, _localeName);

    return Scaffold(
      appBar: AppBar(
        title: Text('Membros'),
      ),
      body: Text('Testando'),
			floatingActionButton: FloatingActionButton(
				onPressed: () {
					// Considerar usar BottomSheet
					// https://api.flutter.dev/flutter/material/BottomSheet-class.html
					_neverSatisfied();
				},
				child: Icon(Icons.add),
				backgroundColor: Colors.yellow,
			),
    );
  }

	Future<void> _neverSatisfied() async {
		return showDialog<void>(
			context: context,
			barrierDismissible: false, // user must tap button!
			builder: (BuildContext context) {
				return AlertDialog(
					title: Text('Adicione um membro'),
					content: SingleChildScrollView(
						child: TextField(
							decoration: InputDecoration(
								labelText: 'Nome',
							),
						)
					),
					actions: <Widget>[
						FlatButton(
							child: Text('Cancelar'),
							onPressed: () {
								Navigator.of(context).pop();
							},
						),
						FlatButton(
							child: Text('Adicionar'),
							onPressed: () {
								Navigator.of(context).pop();
							},
						),
					],
				);
			},
		);
	}

  // List<DateTime> _generateMonths() {
	// 	DateTime now = DateTime.now();
	// 	if (_months.length > 0) {
	// 		final DateTime last = _months.last;
	// 		now = DateTime(last.year, last.month - 1);
	// 	}

	// 	return List.generate(10, (index) {
	// 		return DateTime(now.year, now.month - index);
	// 	});
  // }

  // void _pushSaved() {
  //   Navigator.of(context).push(
  //     MaterialPageRoute<void>(
  //       builder: (BuildContext context) {
  //         final Iterable<ListTile> tiles = _saved.map((DateTime month) {
  //           return ListTile(
  //             title: Text(
  //               formatter.format(month),
  //               style: _biggerFont,
  //             ),
  //           );
  //         });
  //         final List<Widget> divided = ListTile.divideTiles(
  //           context: context,
  //           tiles: tiles,
  //         ).toList();

  //         return Scaffold(
  //           appBar: AppBar(
  //             title: Text('Saved Suggestions'),
  //           ),
  //           body: ListView(
  //             children: divided,
  //           ),
  //         );
  //       },
  //     ),
  //   );
  // }

  // Widget _buildMonths() {
  //   return ListView.builder(
	// 		padding: const EdgeInsets.all(16),
	// 		itemBuilder: (BuildContext _context, int i) {
	// 			if (i.isOdd) {
	// 				return Divider();
	// 			}

	// 			final int index = i ~/ 2;
	// 			if (index >= _months.length) {
	// 				_months.addAll(_generateMonths());
	// 			}
	// 			return _buildRow(_months[index]);
	// 		}
	// 	);
  // }

  // Widget _buildRow(DateTime month) {
  //   final bool alreadySaved = _saved.contains(month);

  //   return ListTile(
  //     title: Text(
  //       formatter.format(month),
  //       style: _biggerFont,
  //     ),
  //     trailing: Icon(
  //       alreadySaved ? Icons.favorite : Icons.favorite_border,
  //       color: alreadySaved ? Colors.red : null,
  //     ),
  //     onTap: () {
  //       setState(() {
  //         if (alreadySaved) {
  //           _saved.remove(month);
  //         } else {
  //           _saved.add(month);
  //         }
  //       });
  //     },
  //   );
  // }
}
