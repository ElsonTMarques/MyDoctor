import 'package:flutter/material.dart';

class Medicine extends StatelessWidget {
  static String tag = 'medicine-page';

  @override
  Widget build(BuildContext context) {
    final body = SingleChildScrollView(
      padding: EdgeInsets.all(20.0),
      child: _createResearchFields()
      
      );

    return Scaffold(
      appBar: AppBar(
        title: Text("Remédios"),
        backgroundColor: Color(0xffABCFF2),
      ),
      body: body,
    );
  }

  Widget _createResearchFields() {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        _buildSearchMedicineTextField(),
      ],
    );
  }

  Widget _buildSearchMedicineTextField() {
    return Stack(
      alignment: Alignment(1.2, 1.0),
      children: <Widget>[
        TextField(
          autofocus: true,
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.done,
          decoration: InputDecoration(labelText: 'Remédio'),
        ),
        FlatButton(
          onPressed: () {
              print("Function");
          },
          child: Icon(Icons.search)
        )
      ]
    );
  }
}
