import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

part 'model_class.g.dart';

@HiveType(typeId: 0)
class ModelClass extends HiveObject{

  @HiveField(0)
   String? categoryName;

  @HiveField(1)
  String? descriptionName;

  @HiveField(2)
  String? walletName;

  @HiveField(3)
  String? moneyAmmount;

  @HiveField(4)
  Timestamp? timestamp;

  ModelClass(
      {
       required  this.categoryName,
        required this.descriptionName,
        required this.walletName,
        required this.moneyAmmount,
        required  this.timestamp}
      );
}


@HiveType(typeId: 1)
class ModelClass1 extends HiveObject{

  @HiveField(0)
  String categoryName;

  @HiveField(1)
  String descriptionName;

  @HiveField(2)
  String walletName;

  @HiveField(3)
  String moneyAmmount;

  @HiveField(4)
  DateTime time;

  ModelClass1(
      {
        required  this.categoryName,
        required this.descriptionName,
        required this.walletName,
        required this.moneyAmmount,
        required  this.time}
      );
}