import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FloatActionButton extends StatelessWidget {
  const FloatActionButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Color(0xff465bd8),
      onPressed: () {
        // controller
        //     .deleteItem(controller.items[index]);
      },
      child: const Icon(Icons.delete,
        size: 20,
      ),
      mini: true,
      materialTapTargetSize:
      MaterialTapTargetSize.shrinkWrap,
      heroTag: null,
    );
  }
}
