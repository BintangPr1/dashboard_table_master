// class SearchWidget extends StatelessWidget {
//   const SearchWidget({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         border: Border.all(color: Colors.black),
//         borderRadius: BorderRadius.circular(8),
//       ),
//       padding: const EdgeInsets.all(8.0),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               const Row(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: [
//                   SizedBox(
//                     width: 100, // Fixed width for the label
//                     child: Text("uid" + ":", style: TextStyle(fontSize: 14)),
//                   ),
//                   SizedBox(
//                     width: 300, // Fixed width for the TextField
//                     child: TextField(
//                       decoration: InputDecoration(
//                         border: OutlineInputBorder(),
//                         isDense: true, // Reduces height of TextField
//                         contentPadding: EdgeInsets.symmetric(
//                             vertical: 8,
//                             horizontal: 8), // Adds padding inside the TextField
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 1), // Reduced spacing between fields
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: [
//                   const SizedBox(
//                     width: 100, // Fixed width for the label
//                     child: Text("Country Code" + ":",
//                         style: TextStyle(fontSize: 14)),
//                   ),
//                   SizedBox(
//                     width: 300, // Fixed width for the TextField
//                     height: 30, // Set height to match the TextField
//                     child: DropdownButtonFormField<String>(
//                       itemHeight: 48,
//                       decoration: const InputDecoration(
//                         border: OutlineInputBorder(),
//                         isDense: true, // Reduces height of the TextField
//                         contentPadding: EdgeInsets.symmetric(
//                             vertical: 8,
//                             horizontal: 8), // Adds padding inside the TextField
//                       ),
//                       items: const [
//                         DropdownMenuItem(
//                           value: '+65',
//                           child: Text('+65'),
//                         ),
//                         // Add more items as needed
//                       ],
//                       onChanged: (value) {
//                         // Handle change
//                       },
//                     ),
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 1), // Reduced spacing between fields
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: [
//                   const SizedBox(
//                     width: 100, // Fixed width for the label
//                     child: Text("Period" + ":", style: TextStyle(fontSize: 14)),
//                   ),
//                   SizedBox(
//                     width: 300, // Fixed width for the TextField
//                     child: DropdownButtonFormField<String>(
//                       itemHeight: 48,
//                       decoration: const InputDecoration(
//                         border: OutlineInputBorder(),
//                         isDense: true, // Reduces height of the TextField
//                         contentPadding: EdgeInsets.symmetric(
//                             vertical: 8,
//                             horizontal: 8), // Adds padding inside the TextField
//                       ),
//                       items: const [
//                         DropdownMenuItem(
//                           value: '14d',
//                           child: Text('14d'),
//                         ),
//                         DropdownMenuItem(
//                           value: '30d',
//                           child: Text('30d'),
//                         ),
//                         DropdownMenuItem(
//                           value: '90d',
//                           child: Text('90d'),
//                         ),
//                         DropdownMenuItem(
//                           value: '180d',
//                           child: Text('180d'),
//                         ),
//                         // Add more items as needed
//                       ],
//                       onChanged: (value) {
//                         // Handle change
//                       },
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//           Padding(
//             padding: const EdgeInsets.all(21.0),
//             child: Container(
//               decoration: BoxDecoration(
//                 border: Border.all(color: Colors.black),
//                 borderRadius: BorderRadius.circular(8),
//               ),
//               width: 100,
//               child: TextButton(
//                 onPressed: () {},
//                 style: ButtonStyle(
//                   backgroundColor:
//                       WidgetStateProperty.all<Color>(Colors.blue.shade100),
//                   shape: WidgetStateProperty.all<RoundedRectangleBorder>(
//                     RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(8),
//                     ),
//                   ),
//                 ),
//                 child: const Text(
//                   'Search',
//                   style: TextStyle(color: Colors.black),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:dashboard_table_master/dashboard_search/search_logic.dart';
import 'package:fstudio/fstudio.dart';
import 'package:flutter/material.dart';

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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 100, // Fixed width for the label
                    child: Text("uid" + ":", style: TextStyle(fontSize: 14)),
                  ),
                  SizedBox(
                    width: 300, // Fixed width for the TextField
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        isDense: true, // Reduces height of TextField
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 8,
                            horizontal: 8), // Adds padding inside the TextField
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 1), // Reduced spacing between fields
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(
                    width: 100, // Fixed width for the label
                    child: Text("Country Code" + ":",
                        style: TextStyle(fontSize: 14)),
                  ),
                  SizedBox(
                    width: 300, // Fixed width for the TextField
                    height: 30, // Set height to match the TextField
                    child: DropdownButtonFormField<String>(
                      itemHeight: 48,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        isDense: true, // Reduces height of the TextField
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 8,
                            horizontal: 8), // Adds padding inside the TextField
                      ),
                      items: const [
                        DropdownMenuItem(
                          value: '+65',
                          child: Text('+65'),
                        ),
                        // Add more items as needed
                      ],
                      onChanged: (value) {
                        // Handle change
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 1), // Reduced spacing between fields
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(
                    width: 100, // Fixed width for the label
                    child: Text("Period" + ":", style: TextStyle(fontSize: 14)),
                  ),
                  SizedBox(
                    width: 300, // Fixed width for the TextField
                    child: DropdownButtonFormField<String>(
                      itemHeight: 48,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        isDense: true, // Reduces height of the TextField
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 8,
                            horizontal: 8), // Adds padding inside the TextField
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
                        // Add more items as needed
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
              child: TextButton(
                onPressed: () {},
                style: ButtonStyle(
                  backgroundColor:
                      WidgetStateProperty.all<Color>(Colors.blue.shade100),
                  shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
                child: const Text(
                  'Search',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
