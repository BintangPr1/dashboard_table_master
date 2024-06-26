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
                  child: FSimpleButton(
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              backgroundColor: Colors.white,
                              title: const Text("Add"),
                              actions: [
                                TextFieldWithLabel(
                                  label: 'Country Code',
                                  controller: countryCode,
                                ),
                                TextFieldWithLabel(
                                  label: 'Period',
                                  controller: period,
                                ),
                                TextFieldWithLabel(
                                  label: 'Min Weight',
                                  controller: minWeight,
                                ),
                                TextFieldWithLabel(
                                  label: 'Max Weight',
                                  controller: maxWeight,
                                ),
                                TextFieldWithLabel(
                                  label: 'Penalty Percentage',
                                  controller: penaltyPercentage,
                                ),
                                TextFieldWithLabel(
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
                                      child: FSimpleButton(
                                        onTap: () {
                                          Navigator.of(context).pop();
                                        },
                                        backgroundColor: Colors.blue.shade100,
                                        height: 30,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(8)), // ),
                                        child: const Center(
                                          child: Text(
                                            'Cancel',
                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                        border: Border.all(color: Colors.black),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      width: 100,
                                      child: FSimpleButton(
                                        onTap: () {
                                          logic.insertRow();

                                          Navigator.pop(context);
                                        },
                                        backgroundColor: Colors.blue.shade100,
                                        height: 30,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(8)),
                                        child: const Center(
                                          child: Text(
                                            'Add',
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            );
                          });
                    },
                    backgroundColor: Colors.green.shade100,
                    height: 30,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    child: const Center(
                      child: Text(
                        '+ Add',
                        style: TextStyle(color: Colors.black),
                      ),
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
                  child: FSimpleButton(
                    onTap: () {
                      logic.updateControllers();
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              backgroundColor: Colors.white,
                              title: const Text("Update"),
                              actions: [
                                TextFieldWithLabel(
                                  label: 'Country Code',
                                  controller: countryCodeUpdate,
                                ),
                                TextFieldWithLabel(
                                  label: 'Period',
                                  controller: periodUpdate,
                                ),
                                TextFieldWithLabel(
                                  label: 'Min Weight',
                                  controller: minWeightUpdate,
                                ),
                                TextFieldWithLabel(
                                  label: 'Max Weight',
                                  controller: maxWeightUpdate,
                                ),
                                TextFieldWithLabel(
                                  label: 'Penalty Percentage',
                                  controller: penaltyPercentageUpdate,
                                ),
                                TextFieldWithLabel(
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
                                      child: FSimpleButton(
                                        onTap: () {
                                          Navigator.of(context).pop();
                                        },
                                        backgroundColor: Colors.blue.shade100,
                                        height: 30,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(8)),
                                        child: const Center(
                                          child: Text(
                                            'Cancel',
                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                        border: Border.all(color: Colors.black),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      width: 100,
                                      child: FSimpleButton(
                                        onTap: () {
                                          logic.updateRow();
                                          Navigator.pop(context);
                                        },
                                        backgroundColor: Colors.blue.shade100,
                                        height: 30,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(8)),
                                        child: const Center(
                                          child: Text(
                                            'Update',
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            );
                          });
                    },
                    backgroundColor: Colors.yellow.shade100,
                    height: 30,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    //
                    child: const Center(
                      child: Text(
                        'Update',
                        style: TextStyle(color: Colors.black),
                      ),
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
                  child: FSimpleButton(
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: const Text("delete this row"),
                              actions: [
                                FSimpleButton(
                                  padding: const EdgeInsets.all(5),
                                  backgroundColor: Colors.red,
                                  child: const Text("DELETE"),
                                  onTap: () {
                                    logic.deleteRow();
                                    Navigator.pop(context);
                                  },
                                )
                              ],
                            );
                          });
                    },
                    backgroundColor: Colors.red.shade100,
                    height: 30,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    child: const Center(
                      child: Text(
                        'Delete',
                        style: TextStyle(color: Colors.black),
                      ),
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
                  child: FSimpleButton(
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: const Text("View"),
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
                    backgroundColor: Colors.white,
                    height: 30,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    child: const Center(
                      child: Text(
                        'View',
                        style: TextStyle(color: Colors.black),
                      ),
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
