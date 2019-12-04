import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:my_doctor/models/medicine.dart';
import 'package:my_doctor/utils/common.dart';

class Medicine extends StatefulWidget {
  static String tag = 'medicine-page';
  @override
  _MedicinePageState createState() => new _MedicinePageState();
}

class _MedicinePageState extends State<Medicine> {
  String _medicalNameFilter = '';

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final body = SingleChildScrollView(
        padding: EdgeInsets.all(20.0), child: _createResearchFields());

    return Scaffold(
      appBar: AppBar(
        title: Text("Remédios"),
        backgroundColor: Color(0xffABCFF2),
      ),
      body: body,
    );
  }

  Widget _createResearchFields() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        _buildSearchMedicineTextField(),
        SizedBox(height: 30.0),
        _createMainList(),
      ],
    );
  }

  final _filterController = new TextEditingController();

  Widget _buildSearchMedicineTextField() {
    return Stack(alignment: Alignment(1.2, 1.0), children: <Widget>[
      TextField(
        autofocus: true,
        controller: _filterController,
        keyboardType: TextInputType.text,
        textInputAction: TextInputAction.done,
        decoration: InputDecoration(labelText: 'Remédio'),
        onChanged: (text) {
          setState(() {
            _medicalNameFilter = text;
          });
        },
      ),
    ]);
  }

  Widget _buildCard(document) {
    final doctorObject = MedicineObject.fromDocument(document);

    if (!doctorObject.produto
        .toLowerCase()
        .contains(_medicalNameFilter.toLowerCase())) return SizedBox();

    return Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        elevation: 10,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              title: Text(doctorObject.produto,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w900,
                  )),
              subtitle: Container(
                padding: EdgeInsets.only(top: 5.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Text(doctorObject.produto,
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w900,
                          )),
                      Text(doctorObject.produto,
                          style: TextStyle(
                            color: Colors.black,
                          )),
                    ]),
              ),
            ),
          ],
        ));
  }

  Widget _createMainList() {
    return StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance.collection('medicines_objects').snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError)
          return Common.errorContainer(error: snapshot.error);
        switch (snapshot.connectionState) {
          case ConnectionState.none:
          case ConnectionState.waiting:
            return Common.progressContainer();
          case ConnectionState.active:
          case ConnectionState.done:
            if (snapshot.data.documents.length == 0)
              return Common.emptyContainer(
                  message: "Nenhum objeto encontrado!");
            else
              return ListView(
                shrinkWrap: true,
                children: snapshot.data.documents.map(_buildCard).toList(),
              );
        }
        return null;
      },
    );
  }
}
