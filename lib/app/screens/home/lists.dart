import 'package:flutter/material.dart';
import 'package:sih_app_2/services/listService.dart';
import 'package:sih_app_2/models/medicine.dart';

class Lists extends StatefulWidget {
  @override
  _ListsState createState() => _ListsState();
}

class _ListsState extends State<Lists> {
  Widget build(BuildContext context) {
    return ListView.separated(
          itemCount: medicines.length,
          separatorBuilder: (context, index) =>Divider(),
          itemBuilder: (BuildContext context,int index){
            Medicine medicine=medicines[index];
            return Dismissible(
              onDismissed: (direction){
                setState(() {
                  medicines.removeAt(index);
                });
              },
              background: Container(
                color: Colors.redAccent,
              ),
              child: ListTile(
                title: Text(medicine.name),
                leading: CircleAvatar(
                  child: Text('${medicine.power}'),
                ),
                subtitle: Text(medicine.dosage),
              ),
              key: ObjectKey(medicine),
            );
          },
      );
  }
}
