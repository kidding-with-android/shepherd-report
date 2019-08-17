import 'package:flutter/material.dart';

class MemberList extends StatefulWidget {
  @override
  MemberListState createState() => MemberListState();
}

class MemberListState extends State<MemberList> {
  final List<Member> _members = <Member>[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Membros'),
      ),
      body: _buildMemberList(),
			floatingActionButton: FloatingActionButton(
				onPressed: () {
					_memberInclude();
				},
				child: Icon(Icons.add),
				backgroundColor: Colors.yellow,
			),
    );
  }

	Widget _buildMemberList() {
    return ListView.builder(
			padding: const EdgeInsets.all(16),
			itemCount: _members.length,
			itemBuilder: (BuildContext _context, int i) {
				if (i.isOdd) {
					return Divider();
				}

				final int index = i ~/ 2;
				return _buildRow(_members[index]);
			}
		);
  }

	Widget _buildRow(Member member) {
		return ListTile(
			title: Text(member.name),
		);
	}

	Future<Widget> _memberInclude() async {
    final _formKey = GlobalKey<FormState>();
    Member _member = Member();

		return showDialog<Widget>(
			context: context,
			barrierDismissible: false, // user must tap button!
			builder: (BuildContext context) {
				return AlertDialog(
					title: Text('Adicione um membro'),
					content: SingleChildScrollView(
						child: Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  TextFormField(
                    validator: (value) {
                      if (value.isEmpty) {
                        return "Não esqueça do nome";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      labelText: 'Nome',
                    ),
                    onSaved: (value) {
											setState(() {
                      	_member.name = value;
											});
                    },
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value.isNotEmpty && int.parse(value) < 10) {
                        return "Mande ele para o kinder";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      labelText: 'Idade'
                    ),
                    keyboardType: TextInputType.number,
                    onSaved: (value) {
											setState(() {
                      	_member.age = int.parse(value);
											});
                    },
                  )
                ],
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
                if (_formKey.currentState.validate()) {
                  _addMember(_member);
								  Navigator.of(context).pop();
                }
							},
						),
					],
				);
			},
		);
	}

  _addMember(Member member) {
    _members.add(member);
  }
}

class Member {
  String name = '';
  int age;
}
