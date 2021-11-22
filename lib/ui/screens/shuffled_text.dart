import 'package:flutter/material.dart';
import 'package:rafia_unscramble_bloc/ui/screens/theme.dart';
import 'package:rafia_unscramble_bloc/widgets/my_box.dart';

class ShuffledText extends StatefulWidget {
  //constructor
  const ShuffledText({
    Key? key,
    required this.title,
    required this.inputFromFirstScreen,
  }) : super(key: key);

  //arguments to receive from FirstSreen
  final String title;
  final String inputFromFirstScreen;

  @override
  _ShuffledTextState createState() => _ShuffledTextState();
}

class _ShuffledTextState extends State<ShuffledText> {
  // map to keep track of the score
  final Map<String, bool> score = {};
  bool accepted = false;

  // Choices for the user to darg and drop to the drag target
  final List<String> choices = [];

  // a void function which extract the choices from the inputFromFromFirstScreen if there is any empty space in the inputFromFromFirstScreen then don't add it to the choices
  void _extractChoices() {
    //  split the string inputFromFromFirstScreen into list of strings
    final List<String> widgets = widget.inputFromFirstScreen.split(' ');

    //shuffle the list
    widgets.shuffle();

    //  iterate over the list type called widgets
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          // arrage the choices in a row
          //direction: Axis.vertical,
          children: [
            Wrap(
              spacing: 20,
              runSpacing: 20,
              children: choices.map((String choice) {
                //  loop over

                return Draggable<String>(
                  //  set the data to the random choice
                  data: choice,

                  //  set the child to the random choice
                  child: MyBox(
                    color1: AppColors.white,
                    widget: Text(
                      choice,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: AppColors.black,
                      ),
                    ),
                  ),

                  //  set the feedback to the random choice
                  feedback: MyBox(
                    color1: AppColors.white.withOpacity(0.13),
                    //  set the child to the random choice
                    widget: Text(
                      choice,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: AppColors.black,
                      ),
                    ),
                  ),
                  childWhenDragging:
                      //  show empty box
                      MyBox(
                    color1: AppColors.white.withOpacity(0.13),
                    widget: const Text(
                      '',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: AppColors.black,
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
            const SizedBox(height: 55, width: 55),
            Wrap(
              spacing: 20,
              runSpacing: 20,
              children:
                  choices.map((choices) => _buildDragTarget(choices)).toList(),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildDragTarget(String choice) {
    return Wrap(
      spacing: 10,
      runAlignment: WrapAlignment.center,
      children: [
        DragTarget<String>(
          builder:
              (BuildContext context, List<String?> incoming, List rejected) =>
                  Container(
            color: AppColors.lightGrey,
            child: acceptedData.contains(choice)
                ? MyBox(
                    color1: AppColors.white,
                    widget: Text(
                      choice,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: AppColors.black,
                      ),
                    ),
                  )
                : const MyBox(
                    color1: AppColors.black,
                  ),
          ),
          onWillAccept: (data) {
            if (data == choice) {
              return true;
            } else {
              return false;
            }
          },
          onAccept: (String data) {
            //  if the data is not empty

            //  add the data to the acceptedData
            setState(() {
              //  add the choice to the acceptedData
              acceptedData.add(data);
              //  and remove the choice from the choices
              // choices.remove(data);
            });
          },
          onLeave: (data) {},
        ),
        const Divider(
          color: Colors.black,
        ),
      ],
    );
  }
}
