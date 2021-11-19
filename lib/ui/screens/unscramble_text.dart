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
  double width = 100.0, height = 100.0;
  late Offset position;

  @override
  void initState() {
    super.initState();
    position = Offset(0.0, height - 20);
  }

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
                          // onDragStarted: () {
                          //   print("onDragStarted");
                          // },
                          // onDragCompleted: () {
                          //   print("onDragCompleted");
                          // },
                          // onDraggableCanceled: (Velocity velocity, Offset offset) {
                          //   setState(() => position = offset);
                          // },
                          child: Container(
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
              DragTarget(
                onWillAccept: (data) => true,
                builder: (BuildContext context, List<dynamic> candidateData,
                    List<dynamic> rejectedData) {
                  return Column(
                    children: const [
                      Divider(
                        color: Colors.black,
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      Divider(
                        color: Colors.black,
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      Divider(
                        color: Colors.black,
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
