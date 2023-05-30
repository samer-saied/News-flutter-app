import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class LoadingCardWidget extends StatelessWidget {
  const LoadingCardWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: SizedBox(
          width: 200.0,
          child: Shimmer.fromColors(
            baseColor: Colors.white,
            highlightColor: Colors.grey,
            child: const Text(
              'انتظر من فضلك جاري التحميل',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ));
  }
}
