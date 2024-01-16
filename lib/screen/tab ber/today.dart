import 'package:expense_tracking_application/model/model_class.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';

class Today extends StatefulWidget {
  const Today({Key? key}) : super(key: key);

  @override
  State<Today> createState() => _TodayState();
}

class _TodayState extends State<Today> {

  Box walletBox = Hive.box("wallet");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder(
        valueListenable: walletBox.listenable(),
        builder: (context, Box box, widget){
          if(box.isEmpty){
            return Text("No Transection Found");
          }
          else return ListView.builder(
              shrinkWrap: true,
              itemCount: box.length,
              scrollDirection: Axis.vertical,
              reverse: true,
              itemBuilder: (context, index){
                var data = box.values.toList().cast<ModelClass>();
            return ListTile(
              title: Text(data[index].categoryName.toString()),
            );
          });
        },
      ),
    );
  }
}
