import 'dart:math';

import 'package:flutter/material.dart';

class UnscrambleText extends StatefulWidget {
  final String inputFromTextField;
  const UnscrambleText({
    Key? key,
    required this.inputFromTextField,
  }) : super(key: key);

  @override
  State<UnscrambleText> createState() => _UnscrambleTextState();
}

class _UnscrambleTextState extends State<UnscrambleText> {
  // double width = 100.0, height = 100.0;
  // late Offset position;

  // @override
  // void initState() {
  //   super.initState();
  //position = Offset(0.0, height - 20);
  // }

  // Widget buildDragTarget(List<String> listerals) {
  //   return Container(
  //     height: 100,
  //     padding: const EdgeInsets.all(8),
  //     child: ListView.builder(
  //         itemBuilder: (ctx, i) {
  //           return DragTarget(
  //             onWillAccept: (data) => true,
  //             onAccept: (String data) {
  //               setState(() {
  //                 acceptedData = data;
  //               });
  //             },
  //             builder: (BuildContext context, List<dynamic> splitToStringData,
  //                 List<dynamic> rejectedData) {
  //               return Column(
  //                 children: [
  //                   Row(
  //                     children: [
  //                       Container(
  //                         padding: const EdgeInsets.all(10),
  //                         // color: Colors.blue,
  //                         // child: Text(
  //                         //   acceptedData,
  //                         //   style: const TextStyle(
  //                         //       fontSize: 18, color: Colors.white),
  //                         // ),
  //                         child: acceptedWidget(acceptedData),
  //                       ),
  //                       const Divider(
  //                         color: Colors.black,
  //                       ),
  //                     ],
  //                   ),
  //                 ],
  //               );
  //             },
  //           );
  //         },
  //         itemCount: listerals.length),
  //   );
  // }

  Widget acceptedWidget(String text) {
    return Container(
      padding: const EdgeInsets.all(8),
      width: (text.length + 100),
      child: Center(
        child: Text(
          text,
          style: const TextStyle(
              fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      color: Colors.blueAccent,
    );
  }

  String acceptedData = " ";

  @override
  Widget build(BuildContext context) {
    List<String> splitToString = widget.inputFromTextField.split(' ');
    splitToString.shuffle();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Unscramble'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(3),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(20),
                child: const Text(
                  'Drag and Drop To Unscramble',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(20),
                child: Wrap(
                  spacing: 20,
                  runSpacing: 30,
                  children: splitToString
                      .map(
                        (e) => Draggable(
                          data: e,

                          // onDragStarted: () {
                          //   print("onDragStarted");
                          // },
                          // onDragCompleted: () {
                          //   print("onDragCompleted");
                          // },
                          // onDraggableCanceled: (Velocity velocity, Offset offset) {
                          //   setState(() => position = offset);
                          // },
                          child: e == acceptedData
                              ? Container(
                                  padding: const EdgeInsets.all(8),
                                  width: (e.length + 100),
                                  color: Colors.grey,
                                  height: 50,
                                )
                              : Container(
                                  padding: const EdgeInsets.all(8),
                                  width: (e.length + 100),
                                  child: Center(
                                    child: Text(
                                      e,
                                      style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    ),
                                  ),
                                  color: Colors.blueAccent,
                                ),
                          feedback: Material(
                            child: Container(
                              padding: const EdgeInsets.all(8),
                              width: (e.length + 100),
                              color: Colors.amber,
                              child: Center(
                                child: Text(
                                  e,
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          childWhenDragging: Container(
                            padding: const EdgeInsets.all(8),
                            width: (e.length + 100),
                            color: Colors.grey,
                            height: 50,
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              const SizedBox(
                height: 50,
              ),

/******************************************************************************************** */

              Wrap(
                children: splitToString
                    .asMap()
                    .entries
                    .map(
                      (e) => DragTarget(
                        onWillAccept: (data) => true,
                        onAccept: (String data) {
                          setState(() {
                            acceptedData = data;
                          });
                          splitToString.remove(e.value);
                        },
                        builder: (BuildContext context,
                            List<dynamic> spliteToStringData,
                            List<dynamic> rejectedData) {
                          return Wrap(
                            spacing: 20,
                            runSpacing: 30,
                            children: [
                              Container(
                                padding: const EdgeInsets.all(10),
                                child: acceptedWidget(acceptedData),
                              ),
                            ],
                          );
                        },
                      ),
                    )
                    .toList(),
              ),
              //  for (var i = 0; i < splitToString.length; i++)

              // ],

              // Wrap(
              //   spacing: 20,
              //   runSpacing: 30,
              //   children: splitToString
              //       .asMap()
              //       .entries
              //       .map(
              //         (e) => DragTarget(
              //           onWillAccept: (data) => true,
              //           onAccept: (String data) {
              //             setState(() {
              //               acceptedData = data;
              //             });
              //           },
              //           builder: (BuildContext context,
              //               List<dynamic> splitToStringData,
              //               List<dynamic> rejectedData) {
              //             return Row(
              //               mainAxisAlignment: MainAxisAlignment.spaceAround,
              //               children: [
              //                 Container(
              //                   padding: const EdgeInsets.all(10),
              //                   // color: Colors.blue,
              //                   // child: Text(
              //                   //   acceptedData,
              //                   //   style: const TextStyle(
              //                   //       fontSize: 18, color: Colors.white),
              //                   // ),
              //                   child: acceptedWidget(acceptedData),
              //                 ),
              //                 const Divider(
              //                   color: Colors.black,
              //                 ),
              //               ],
              //             );
              //           },
              //         ),
              //       )
              //       .toList(),

              //   //],
              // ),

/****************************************************************************************************** */

/****************************************************************************************************** */

              // return Column(
              //   children: [
              //     Column(
              //       children: const [
              //         Divider(
              //           color: Colors.black,
              //         ),
              //       ],
              //     ),
              //     const SizedBox(
              //       height: 50,
              //     ),
              //     Column(
              //       children: const [
              //         Divider(
              //           color: Colors.black,
              //         ),
              //       ],
              //     ),
              //     const SizedBox(
              //       height: 50,
              //     ),
              //     Column(
              //       children: const [
              //         Divider(
              //           color: Colors.black,
              //         ),
              //       ],
              //     ),
              //   ],
              // );
              // return Column(
              //   children: [
              //     Wrap(
              //       children: [
              //         Container(
              //           child: Center(
              //             child: Text(acceptedData),
              //           ),
              //         ),
              //       ],
              //     ),
              //    const Divider(
              //       color: Colors.black,
              //     ),
              //   ],
              // );
            ],
          ),
        ),
      ),
    );
  }
}
