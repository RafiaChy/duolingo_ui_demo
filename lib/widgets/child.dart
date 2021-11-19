// import 'package:flutter/material.dart';

// class Child extends StatelessWidget {
//   const Child({
//     Key? key,
//     required this.inputFromFirstTextField,
//   }) : super(key: key);
//   final String inputFromFirstTextField;

//   @override
//   Widget build(BuildContext context) {
//     List<String> splitToString = inputFromFirstTextField.split(' ');
//     splitToString.shuffle();

//     int countItem() {
//       var itemSize = 0;
//       for (var item in splitToString) {
//         itemSize = item.length;
//         print(itemSize);
//       }
//       return 1;
//     }

//     String item() {
//       String string = "";

//       for (var i in splitToString) {
//         string = i;
//         print(string);
//       }
//       return string;
//     }

//     return Container(
//       padding: const EdgeInsets.all(8),
//       width: (e.length + 50),
//       child: Center(child: Text(e)),
//       color: Colors.blueAccent,
//     );
//   }
// }
