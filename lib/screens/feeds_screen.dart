import 'package:flutter/material.dart';

import '../widgets/feeds_widget.dart';

class FeedsScreen extends StatelessWidget {
  const FeedsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: 1,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 1,
        crossAxisSpacing: 0.0,
        mainAxisSpacing: 0.0,
        childAspectRatio: 0.6,
      ),
      itemBuilder: (ctx, index) {
        return const FeedsWidget();
      },
    ));
  }
}
