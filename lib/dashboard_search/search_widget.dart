import 'package:dashboard_table_master/dashboard_search/search_logic.dart';
import 'package:fstudio/fstudio.dart';
import 'package:flutter/material.dart';
import 'package:fstudio/widget/simple_button.dart';

class SearchWidget extends FPage<SearchLogic> {
  @override
  void initialize() {
    setLogic(SearchLogic());
  }

  @override
  Widget buildLayout(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 100,
                    child: Text("uid" + ":", style: TextStyle(fontSize: 14)),
                  ),
                  SizedBox(
                    width: 300,
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        isDense: true,
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 1),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(
                    width: 100,
                    child: Text("Country Code" + ":",
                        style: TextStyle(fontSize: 14)),
                  ),
                  SizedBox(
                    width: 300,
                    height: 30,
                    child: DropdownButtonFormField<String>(
                      itemHeight: 48,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        isDense: true,
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                      ),
                      items: const [
                        DropdownMenuItem(
                          value: '+65',
                          child: Text('+65'),
                        ),
                      ],
                      onChanged: (value) {},
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 1),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(
                    width: 100,
                    child: Text("Period" + ":", style: TextStyle(fontSize: 14)),
                  ),
                  SizedBox(
                    width: 300,
                    child: DropdownButtonFormField<String>(
                      itemHeight: 48,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        isDense: true,
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                      ),
                      items: const [
                        DropdownMenuItem(
                          value: '14d',
                          child: Text('14d'),
                        ),
                        DropdownMenuItem(
                          value: '30d',
                          child: Text('30d'),
                        ),
                        DropdownMenuItem(
                          value: '90d',
                          child: Text('90d'),
                        ),
                        DropdownMenuItem(
                          value: '180d',
                          child: Text('180d'),
                        ),
                      ],
                      onChanged: (value) {
                        // Handle change
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(21.0),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(8),
              ),
              width: 100,
              child: FSimpleButton(
                onTap: () {},
                backgroundColor: Colors.blue.shade100,
                height: 30,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
                child: const Center(
                  child: Text(
                    'Search',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
