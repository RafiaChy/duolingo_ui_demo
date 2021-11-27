import 'package:flutter/material.dart';
//  import flutter material.dart

import 'package:rafia_unscramble_bloc/ui/screens/theme.dart';
import 'package:rafia_unscramble_bloc/widgets/my_box.dart';

class UnscrambleText extends StatefulWidget {
  const UnscrambleText(
      {Key? key, required this.title, required this.inputFromTextField})
      : super(key: key);

  final String title;
  final String inputFromTextField;

  @override
  UnscrambleTextState createState() => UnscrambleTextState();
}

//  create UnscrambleTextState class

class UnscrambleTextState extends State<UnscrambleText> {
  // map to keep track of the score
  final Map<String, bool> score = {};
  bool accepted = false;

  // Choices for the user to darg and drop to the drag target
  final List<String> choices = [];
  final List<String> dragTargets = [];

  // make a void function which extract the choices from the inputFromTextField if there is any empty space in the inputFromTextField then don't add it to the choices
  void _extractChoices() {
    //  split the inputFromTextField by space
    final List<String> widgets = widget.inputFromTextField.split(' ');
    //suffle the list items
    widgets.shuffle();
    //  iterate over the widgets
    for (var widget in widgets) {
      //  if the widget is not empty
      if (widget.isNotEmpty) {
        //  add the widget to the choices
        choices.add(widget);
      }
    }
  }

  // make a void initState() method
  @override
  void initState() {
    super.initState();
    _extractChoices();
  }

  final List<String> acceptedData = [];
  //  map which store k,v where k = index of the acceptedData and v = the value of the acceptedData
  final Map<String, int> acceptedDataMap = {};
  // late String word;

  // //  list which store the index of choices which are accepted

  // override the build method
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      // floatingActionButton let user reset the game

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 89),
          child: Wrap(
              // arrage the choices in a row
              direction: Axis.horizontal,
              children: [
                const Divider(
                  color: AppColors.border,
                  thickness: 2,
                ),
                const SizedBox(
                  height: 55,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 21),
                  child: Wrap(
                    // get the choices and loop over them
                    children: choices.map((String choice) {
                      const Divider(
                        thickness: 2,
                        color: AppColors.appBackground,
                      );
                      //  loop over

                      return Draggable<String>(
                          //  set the data to the random choice
                          data: choice,
                          //  set the child to the random choice
                          child:
                              //   if acceptedData do not conatin the choice then show MyBox
                              !acceptedData.contains(choice)
                                  ? MyBox(
                                      //  set the child to the random choice
                                      color1: AppColors.appBackground,
                                      widget: Text(
                                        choice,
                                        style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: AppColors.white,
                                        ),
                                      ),
                                    )
                                  : const SizedBox(),
                          //  set the feedback to the random choice
                          feedback: MyBox(
                            color1: AppColors.appBackground.withOpacity(0.13),
                            //  set the child to the random choice
                            widget: Text(
                              choice,
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: AppColors.white,
                              ),
                            ),
                          ),
                          childWhenDragging: const SizedBox());
                    }).toList(),
                  ),
                ),
                const Divider(
                  thickness: 2,
                  color: AppColors.border,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 21, vertical: 21),
                  child: Wrap(
                    // children: dragTargets
                    //     .map((choices) => _buildDragTarget(choices))
                    //     .toList(),
                    children: [
                      for (int i = 0; i < choices.length; i++)
                        _buildDragTarget(choices[i])
                    ],
                  ),
                ),
                const Divider(
                  thickness: 2,
                  color: AppColors.border,
                ),

                // add Button to submit the answer
                Padding(
                  padding: const EdgeInsets.only(left: 21),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      //  add ElevatedButton to submit the answer
                    ],
                  ),
                ),
              ]),
        ),
      ),
    );
  }

  Widget _buildDragTarget(String mydata) {
    return DragTarget<String>(
      builder: (BuildContext context, List<String?> incoming, List rejected) =>
          //  if choice exist in the acceptedData then show MyBox
          acceptedData.contains(mydata)
              ? MyBox(
                  color1: AppColors.appBackground,
                  widget: Text(
                    mydata,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: AppColors.white,
                    ),
                  ),
                )
              : const MyBox(
                  color1: AppColors.appBackground,
                  givenHeight: 34,
                  givenWidth: 89,
                ),
      onWillAccept: (data) {
        return true;
      },
      onAccept: (String? data) {
        setState(() {
          // add to the acceptedData
          acceptedData.add(data!);
          // garb the index of the drag target where the data is added
          acceptedDataMap[data] = acceptedData.indexOf(data);
        });
      },
      onLeave: (data) {},
    );
  }
}
