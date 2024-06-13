import 'package:dashboard_table_master/dashboard_crud/button_logic.dart';
import 'package:dashboard_table_master/dashboard_table/table_logic.dart';
import 'package:flutter/material.dart';
import 'package:fstudio/fstudio.dart';
import 'package:dashboard_table_master/utils/textfield_widget.dart';
import 'package:fstudio/widget/simple_button.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final supabase = Supabase.instance.client;
final tableLogic = TableLogic();

final TextEditingController countryCode = TextEditingController();
final TextEditingController period = TextEditingController();
final TextEditingController minWeight = TextEditingController();
final TextEditingController maxWeight = TextEditingController();
final TextEditingController penaltyPercentage = TextEditingController();
final TextEditingController rewardPercentage = TextEditingController();

final TextEditingController countryCodeUpdate = TextEditingController();
final TextEditingController periodUpdate = TextEditingController();
final TextEditingController minWeightUpdate = TextEditingController();
final TextEditingController maxWeightUpdate = TextEditingController();
final TextEditingController penaltyPercentageUpdate = TextEditingController();
final TextEditingController rewardPercentageUpdate = TextEditingController();

class ButtonWidget extends FPage<ButtonLogic> {
  @override
  void initialize() {
    setLogic(ButtonLogic());
  }

  @override
  @override
  Widget buildLayout(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'Master Staking Period',
          style: TextStyle(fontSize: 20),
        ),
        SizedBox(
          width: 239,
          child: Wrap(
            children: [
              Padding(
                padding: const EdgeInsets.all(3.0),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  width: 100,
                  child: TextButton(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              backgroundColor: Colors.white,
                              title: const Text("Add"),
                              actions: [
                                TextField1(
                                  label: 'Country Code',
                                  controller: countryCode,
                                ),
                                TextField1(
                                  label: 'Period',
                                  controller: period,
                                ),
                                TextField1(
                                  label: 'Min Weight',
                                  controller: minWeight,
                                ),
                                TextField1(
                                  label: 'Max Weight',
                                  controller: maxWeight,
                                ),
                                TextField1(
                                  label: 'Penalty Percentage',
                                  controller: penaltyPercentage,
                                ),
                                TextField1(
                                  label: 'Reward Percentage',
                                  controller: rewardPercentage,
                                ),
                                Row(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        border: Border.all(color: Colors.black),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      width: 100,
                                      child: TextButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        style: ButtonStyle(
                                          backgroundColor:
                                              WidgetStateProperty.all<Color>(
                                                  Colors.blue.shade100),
                                          shape: WidgetStateProperty.all<
                                              RoundedRectangleBorder>(
                                            RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                          ),
                                        ),
                                        child: const Text(
                                          'Cancel',
                                        ),
                                      ),
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                        border: Border.all(color: Colors.black),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      width: 100,
                                      child: TextButton(
                                        onPressed: () {
                                          logic.insertRow();

                                          Navigator.pop(context);
                                        },
                                        style: ButtonStyle(
                                          backgroundColor:
                                              WidgetStateProperty.all<Color>(
                                                  Colors.blue.shade100),
                                          shape: WidgetStateProperty.all<
                                              RoundedRectangleBorder>(
                                            RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                          ),
                                        ),
                                        child: const Text(
                                          'Add',
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            );
                          });
                    },
                    style: ButtonStyle(
                      backgroundColor:
                          WidgetStateProperty.all<Color>(Colors.green.shade100),
                      shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                    child: const Text(
                      '+ Add',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(3.0),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  width: 100,
                  child: TextButton(
                    onPressed: () {
                      logic.updateControllers();
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              backgroundColor: Colors.white,
                              title: const Text("Update"),
                              actions: [
                                TextField1(
                                  label: 'Country Code',
                                  controller: countryCodeUpdate,
                                ),
                                TextField1(
                                  label: 'Period',
                                  controller: periodUpdate,
                                ),
                                TextField1(
                                  label: 'Min Weight',
                                  controller: minWeightUpdate,
                                ),
                                TextField1(
                                  label: 'Max Weight',
                                  controller: maxWeightUpdate,
                                ),
                                TextField1(
                                  label: 'Penalty Percentage',
                                  controller: penaltyPercentageUpdate,
                                ),
                                TextField1(
                                  label: 'Reward Percentage',
                                  controller: rewardPercentageUpdate,
                                ),
                                Row(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        border: Border.all(color: Colors.black),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      width: 100,
                                      child: TextButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        style: ButtonStyle(
                                          backgroundColor:
                                              WidgetStateProperty.all<Color>(
                                                  Colors.blue.shade100),
                                          shape: WidgetStateProperty.all<
                                              RoundedRectangleBorder>(
                                            RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                          ),
                                        ),
                                        child: const Text(
                                          'Cancel',
                                        ),
                                      ),
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                        border: Border.all(color: Colors.black),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      width: 100,
                                      child: TextButton(
                                        onPressed: () {
                                          // logic.insertRow();
                                          logic.updateRow();
                                          Navigator.pop(context);
                                        },
                                        style: ButtonStyle(
                                          backgroundColor:
                                              WidgetStateProperty.all<Color>(
                                                  Colors.blue.shade100),
                                          shape: WidgetStateProperty.all<
                                              RoundedRectangleBorder>(
                                            RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                          ),
                                        ),
                                        child: const Text(
                                          'Update',
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            );
                          });
                    },
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all<Color>(
                          Colors.yellow.shade100),
                      shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                    child: const Text(
                      'Update',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(3.0),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  width: 100,
                  child: TextButton(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text("delete this row"),
                              actions: [
                                FSimpleButton(
                                  padding: EdgeInsets.all(5),
                                  backgroundColor: Colors.red,
                                  child: Text("DELETE"),
                                  onTap: () {
                                    logic.deleteRow();
                                    Navigator.pop(context);
                                  },
                                )
                              ],
                            );
                          });
                    },
                    style: ButtonStyle(
                      backgroundColor:
                          WidgetStateProperty.all<Color>(Colors.red.shade100),
                      shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                    child: const Text(
                      'Delete',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(3.0),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  width: 100,
                  child: TextButton(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text("View"),
                              content: Column(
                                children: [
                                  Text(
                                      "uid: ${tableLogic.selectedRow!.uid.toString()}"),
                                  Text(
                                      "Country Code: ${tableLogic.selectedRow!.countryCode.toString()}"),
                                  Text(
                                      "Period: ${tableLogic.selectedRow!.period.toString()}"),
                                  Text(
                                      "Min Weight: ${tableLogic.selectedRow!.minWeight.toString()}"),
                                  Text(
                                      "Max Weight: ${tableLogic.selectedRow!.maxWeight.toString()}"),
                                  Text(
                                      "Penalty Percentage: ${tableLogic.selectedRow!.penaltyPercentage.toString()}"),
                                  Text(
                                      "Reward Percentage: ${tableLogic.selectedRow!.rewardPercentage.toString()}"),
                                ],
                              ),
                            );
                          });
                    },
                    style: ButtonStyle(
                      backgroundColor:
                          WidgetStateProperty.all<Color>(Colors.white),
                      shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                    child: const Text(
                      'View',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
