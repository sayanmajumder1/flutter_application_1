import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  Color scaffoldColor = Colors.white;
  Color button1Color = Colors.white;
  Color button2Color = Colors.white;
  Color button3Color = Colors.white;
  Color buttonText1Color = Colors.black;
  Color buttonText2Color = Colors.black;
  Color buttonText3Color = Colors.black;
  // Initial background color

  @override
  Widget build(BuildContext context) {
    // Scaffold Of The Body.
    return Scaffold(
      backgroundColor: scaffoldColor, // Set the background color
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                backgroundColor: MaterialStateProperty.resolveWith<Color>(
                  (Set<MaterialState> states) {
                    if (states.contains(MaterialState.pressed)) {
                      return Colors
                          .red; // Change the background color to red when pressed
                    }
                    return button1Color; // Return the default button color
                  },
                ),
              ),
              onPressed: () {
                setState(() {
                  buttonText1Color = const Color.fromARGB(255, 10, 10, 10);
                  // Change the background color of the button
                  button1Color = Colors.red;
                  // Change the background color to red
                  button3Color = Colors.white;
                  scaffoldColor = const Color.fromARGB(255, 59, 238, 39);
                });
              },
              child: const Text('TextButton 1'),
            ),
            const SizedBox(width: 16), // Add spacing between buttons
            TextButton(
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(
                    const Color.fromARGB(255, 18, 18, 18)),
                overlayColor: MaterialStateProperty.resolveWith<Color?>(
                  (Set<MaterialState> states) {
                    if (states.contains(MaterialState.pressed)) {
                      return const Color.fromARGB(255, 250, 250, 246);
                    }

                    return button2Color; // Defer to the widget's default.
                  },
                ),
              ),
              onPressed: () {
                setState(() {
                  button2Color = const Color.fromARGB(255, 158, 10, 198);
                  // Change the background color to green
                  scaffoldColor = const Color.fromARGB(255, 18, 127, 171);
                  buttonText2Color = const Color.fromARGB(255, 19, 19, 19);
                });
              },
              child: const Text('TextButton 2'),
            ),
            TextButton(
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(
                    const Color.fromARGB(255, 15, 15, 15)),
                overlayColor: MaterialStateProperty.resolveWith<Color?>(
                  (Set<MaterialState> states) {
                    if (states.contains(MaterialState.pressed)) {
                      return const Color.fromARGB(255, 250, 250, 246);
                    }

                    return button3Color; // Defer to the widget's default.
                  },
                ),
              ),
              onPressed: () {
                setState(() {
                  // Reset the background color to white
                  scaffoldColor = Colors.white;
                  button1Color = Colors.white;
                  button2Color = Colors.white;
                  button3Color = Colors.black;
                });
              },
              child: const Text('TextButton 3'),
            ),
          ],
        ),
      ),
    );
  }
}
