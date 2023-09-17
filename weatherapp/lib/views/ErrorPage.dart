import 'package:flutter/material.dart';

import 'constants/widgets/DefualtTextOne.dart';

class ErrorPage extends StatelessWidget {
  final String error;
  const ErrorPage({
    required this.error,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Center(),
        ClipRRect(
            borderRadius: BorderRadius.circular(200),
            child: const Image(
              height: 400,
              image: AssetImage('assets/error.jpg'),
              fit: BoxFit.cover,
            )),
        const SizedBox(
          height: 20,
        ),
        DefualTextOne(
            textSize: 20,
            text: error.replaceRange(0, 11, ''),
            color: Colors.red),
      ],
    );
  }
}
