import 'package:flutter_clone_small_parts/src/configs/theme.dart';
import 'package:flutter_clone_small_parts/src/models/list_view_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListViewLayout extends StatefulWidget {
  ListViewLayout({
    Key? key,
    required this.items,
  }) : super(key: key);

  final List<ListViewItem> items;

  @override
  _ListViewLayoutState createState() => _ListViewLayoutState();
}

class _ListViewLayoutState extends State<ListViewLayout> {
  @override
  Widget build(BuildContext context) {
    Widget _renderButton({
      required ListViewItem item,
    }) {
      assert(item != null);

      return GestureDetector(
        onTap: () {
          Get.to(item.page);
        },
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border(
              top: BorderSide(
                color: THEME.greyBorderColor,
              ),
              bottom: BorderSide(
                color: THEME.greyBorderColor,
              ),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: 8.0,
              horizontal: 16.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  item.name,
                ),
                Icon(
                  Icons.chevron_right,
                ),
              ],
            ),
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("App's Small Parts Clone List"),
      ),
      body: ListView.separated(
        itemBuilder: (context, index) => _renderButton(
          item: widget.items[index],
        ),
        separatorBuilder: (context, index) => Container(height: 8),
        itemCount: widget.items.length,
      ),
    );
  }
}
