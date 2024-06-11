import 'package:dashboard_table_master/dashboard_sidemenu/sidemenu_data.dart';
import 'package:dashboard_table_master/dashboard_sidemenu/sidemenu_logic.dart';
import 'package:flutter/material.dart';
import 'package:fstudio/fstudio.dart';

class SidemenuWidget extends FPage<SidemenuLogic> {
  int selectedIndex = 0;
  @override
  void initialize() {
    setLogic(SidemenuLogic());
  }

  @override
  Widget buildLayout(BuildContext context) {
    final data = SideMenuData();

    return LayoutBuilder(
      builder: (context, constraints) {
        double menuWidth =
            constraints.maxWidth * 0.8; // Adjust width percentage as needed

        return Container(
          width: menuWidth,
          decoration: BoxDecoration(border: Border.all(color: Colors.black)),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Region Singapore',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Expanded(
                child: ListView.builder(
                  itemCount: data.menu.length,
                  itemBuilder: (context, index) => BuildMenuEntry(data, index),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget BuildMenuEntry(SideMenuData data, int index) {
    final isSelected = selectedIndex == index;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      child: InkWell(
        // onTap: () => setState(() {
        //   selectedIndex = index;
        // }),
        child: Container(
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: isSelected ? Colors.amber[200] : Colors.white,
            border: Border.all(color: Colors.black),
            borderRadius: BorderRadius.circular(8),
          ),
          alignment: Alignment.centerLeft,
          child: Text(
            data.menu[index].title,
          ),
        ),
      ),
    );
  }
}
