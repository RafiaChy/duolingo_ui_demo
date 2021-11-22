// import 'dart:math';

// import 'package:flutter/material.dart';

// class UnscrambleText extends StatefulWidget {
//   final String inputFromTextField;
//   const UnscrambleText({
//     Key? key,
//     required this.inputFromTextField,
//   }) : super(key: key);

//   @override
//   State<UnscrambleText> createState() => _UnscrambleTextState();
// }

// class _UnscrambleTextState extends State<UnscrambleText> {
//   Widget acceptedWidget(String text) {
//     return Container(
//       padding: const EdgeInsets.all(8),
//       width: (text.length + 100),
//       child: Center(
//         child: Text(
//           text,
//           style: const TextStyle(
//               fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
//         ),
//       ),
//       color: Colors.blueAccent,
//     );
//   }

//   String acceptedData = " ";

//   @override
//   Widget build(BuildContext context) {
//     List<String> splitToString = widget.inputFromTextField.split(' ');

//     splitToString.shuffle();

//     List<String> secList = List.from(splitToString);

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Unscramble'),
//       ),
//       body: SingleChildScrollView(
//         child: Container(
//           padding: const EdgeInsets.all(3),
//           child: Column(
//             children: [
//               Container(
//                 padding: const EdgeInsets.all(20),
//                 child: const Text(
//                   'Drag and Drop To Unscramble',
//                   style: TextStyle(
//                     fontSize: 24,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ),
//               Container(
//                 padding: const EdgeInsets.all(20),
//                 child: Wrap(
//                   spacing: 20,
//                   runSpacing: 30,
//                   children: splitToString
//                       .map(
//                         (e) => Draggable(
//                           data: e,

//                           // onDragStarted: () {
//                           //   print("onDragStarted");
//                           // },
//                           // onDragCompleted: () {
//                           //   print("onDragCompleted");
//                           // },
//                           // onDraggableCanceled: (Velocity velocity, Offset offset) {
//                           //   setState(() => position = offset);
//                           // },
//                           child: e == acceptedData
//                             //  ? Container(
//                                   padding: const EdgeInsets.all(8),
//                                   width: (e.length + 100),
//                                   color: Colors.grey,
//                                   height: 50,
//                                 )
//                               : Container(
//                                   padding: const EdgeInsets.all(8),
//                                   width: (e.length + 100),
//                                   child: Center(
//                                     child: Text(
//                                       e,
//                                       style: const TextStyle(
//                                           fontSize: 18,
//                                           fontWeight: FontWeight.bold,
//                                           color: Colors.white),
//                                     ),
//                                   ),
//                                   color: Colors.blueAccent,
//                                 ),
//                           feedback: Material(
//                             child: Container(
//                               padding: const EdgeInsets.all(8),
//                               width: (e.length + 100),
//                               color: Colors.amber,
//                               child: Center(
//                                 child: Text(
//                                   e,
//                                   style: const TextStyle(
//                                     fontSize: 18,
//                                     fontWeight: FontWeight.bold,
//                                     color: Colors.black,
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ),
//                           childWhenDragging: Container(
//                             padding: const EdgeInsets.all(8),
//                             width: (e.length + 100),
//                             color: Colors.grey,
//                             height: 50,
//                           ),
//                         ),
//                       )
//                       .toList(),
//                 ),
//               ),
//               const SizedBox(
//                 height: 50,
//               ),
//               const SizedBox(
//                 height: 50,
//               ),
//               Wrap(
//                 children: secList
//                     .asMap()
//                     .entries
//                     .map(
//                       (e) => DragTarget(
//                         onWillAccept: (data) => true,
//                         onAccept: (String data) {
//                           setState(() {
//                             acceptedData = data;
//                             splitToString.remove(e.value);
//                           });
//                         },
//                         builder: (BuildContext context,
//                             List<dynamic> spliteToStringData,
//                             List<dynamic> rejectedData) {
//                           return Wrap(
//                             spacing: 20,
//                             runSpacing: 30,
//                             children: [
//                               Container(
//                                 padding: const EdgeInsets.all(10),
//                                 child: acceptedWidget(acceptedData),
//                               ),
//                             ],
//                           );
//                         },
//                       ),
//                     )
//                     .toList(),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

//  import flutter package
// import 'package:flutter/material.dart';

// //  import theme.dart file from ui\screen
// import 'package:rafia_unscramble_bloc/ui/screens/theme.dart';

// //  make a Stateless class which have a drag target

// class DragTargetExample extends StatelessWidget {
//   //  generate  a list  which conatin 5 random words
//   final List<String> words = ['Hello', 'Flutter', 'Dart', 'Is', 'Awesome'];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Drag Target'),
//       ),
//       body: SingleChildScrollView(
//         child: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               _generalDetailsComponentUI(context, words.length, words),
//               const SizedBox(
//                 height: 20,
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

  //  this is wwhat I thought... first create and show all the elmeents of the list
  // then create a drag target which will accept the element and remove it from the list
  //  and then let user darg the elments into the target and for each drag we can keep refereshing the state()
  //  do you gues think i is good idea to  do like this?
  // I dont see any other way how that would work anyways.
  //  alight then I will try implemting that

  //

//   Widget _generalDetailsComponentUI(
//     BuildContext context,
//     int itemCount,
//     List<String> details,
//   ) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         SizedBox(
//           height: 89,
//           child: ListView.builder(
//             scrollDirection: Axis.horizontal,
//             shrinkWrap: true,
//             itemCount: itemCount,
//             itemBuilder: (context, index) {
//               return Padding(
//                 padding: const EdgeInsets.fromLTRB(8, 5, 21, 55),
//                 child: Container(
//                   decoration: BoxDecoration(
//                     color: AppColors.darkGrey,
//                     // add shadow to container
//                     boxShadow: [
//                       BoxShadow(
//                         color: AppColors.shadowBlack.withOpacity(0.1),
//                         offset: const Offset(0, 3),
//                         blurRadius: 13,
//                         spreadRadius: 1,
//                       ),
//                     ],
//                     borderRadius: const BorderRadius.all(
//                       Radius.circular(8),
//                     ),
//                   ),
//                   child: Padding(
//                     padding: const EdgeInsets.symmetric(
//                         horizontal: 21, vertical: 13),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           //  if tag is null then show '${details[index]['title']}'
//                           details[index].toUpperCase(),
//                           style: Theme.of(context)
//                               .textTheme
//                               .bodyText2
//                               ?.copyWith(
//                                 color: AppColors.lightBlue2.withOpacity(0.1),
//                                 fontWeight: FontWeight.w700,
//                                 fontSize: 13,
//                                 // fontFamily: 'Montserrat',
//                                 fontFamily: 'Montserrat',
//                               ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               );
//             },
//           ),
//         ),
//       ],
//     );
//   }
// }

