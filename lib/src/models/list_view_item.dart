import 'package:flutter_clone_small_parts/src/models/base_model.dart';
import 'package:flutter/material.dart';

class ListViewItem extends BaseModel {
  final String name;
  final Widget page;

  ListViewItem({
    required this.name,
    required this.page,
  });
}
