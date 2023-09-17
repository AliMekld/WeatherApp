import 'package:flutter/material.dart';

import 'constants/widgets/DefualtTextOne.dart';

class noWearherBody extends StatelessWidget {
  const noWearherBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Center(),
          ClipRRect(
              borderRadius: BorderRadius.circular(200),
              child: Image(
                height: 400,
                width: MediaQuery.of(context).size.width * 0.9,
                image: const AssetImage('assets/noweather.png'),
                fit: BoxFit.cover,
              )),
          const SizedBox(
            height: 20,
          ),
          DefualTextOne(
              textSize: 20,
              text: 'Thier is No Weather  Start Searching Know!  🔎',
              color: Colors.white),
        ],
      ),
    );
  }
}
