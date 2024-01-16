import 'package:expense_tracking_application/model/model_class.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';

class TransectionPageScreen extends StatefulWidget {
  const TransectionPageScreen({Key? key}) : super(key: key);

  @override
  State<TransectionPageScreen> createState() => _TransectionPageScreenState();
}

class _TransectionPageScreenState extends State<TransectionPageScreen> {

  Box walletBox = Hive.box("wallet");

  @override
  Widget build(BuildContext context) {

    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(

      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Color(0xffFFFFFF),
        ),
        child: Column(
          children: [

            SizedBox(
              height: height * 0.1,
            ),

            Expanded(child: ValueListenableBuilder(
                valueListenable: walletBox.listenable(),
                builder: (context, Box box, widget){
                  if(box.isEmpty){
                    return Text("No Transection Found");
                  }
                    else{
                    return ListView.builder(
                        shrinkWrap: true,
                        reverse: true,
                        scrollDirection: Axis.vertical,
                        itemCount: box.length,
                        itemBuilder:(context, index){

                          var data = box.values.toList().cast<ModelClass>();

                          return Container(
                            height: 89,
                            width: 336,
                            decoration: BoxDecoration(
                              color: Color(0xffFCFCFC),
                            ),

                            child: Row(
                              children: [

                                Container(
                                    height: 60,
                                  width: 60,
                                   decoration: BoxDecoration(
                                     borderRadius: BorderRadius.circular(16),
                                     color: Color(0xffFCEED4),
                                   ),
                                ),
                                
                                Column(
                                  children: [
                                    Text("${data[index].categoryName}"),
                                    Text("${data[index].descriptionName}"),
                                  ],
                                ),

                                Column(
                                  children: [
                                    Text("${data[index].moneyAmmount}"),
                                    Text("${data[index].timestamp}"),
                                  ],
                                )
                              ],
                            ),
                          );
                        });
                  }

                }
            ),
            ),
          ],
        ),
      ),

    );
  }
}
