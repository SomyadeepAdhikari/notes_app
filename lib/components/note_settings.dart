import 'package:flutter/material.dart';

class NoteSettings extends StatelessWidget {
  void Function()? onEditTap;
  void Function()? onDeleteTap;
  NoteSettings({super.key,required this.onEditTap,required this.onDeleteTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.pop(context);
            onEditTap!();
          },
          child: Container(
            padding: const EdgeInsets.all(8),
            height: 50,
            color: Theme.of(context).colorScheme.secondary,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Edit',style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Theme.of(context).colorScheme.inversePrimary),
                ),
                Icon(Icons.edit,color: Theme.of(context).colorScheme.inversePrimary,)
              ],
            ),
          )
        ),
        GestureDetector(
          onTap: () {
            Navigator.pop(context);
            onDeleteTap!();
          },
          child: Container(
            height: 50,
            color: Theme.of(context).colorScheme.secondary,
            padding: const EdgeInsets.all(8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Delete',style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Theme.of(context).colorScheme.inversePrimary),
                ),
                Icon(Icons.delete,color: Theme.of(context).colorScheme.inversePrimary,)
              ],
            ),
          )
        )
      ],
    );
  }
}