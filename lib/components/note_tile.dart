import 'package:flutter/material.dart';
import 'package:notes_app/components/note_settings.dart';
import 'package:popover/popover.dart';

class NoteTile extends StatelessWidget {
  final String text;
  void Function()? onEditPressed;
  void Function()? onDeletePressed;
  NoteTile({super.key, required this.text,required this.onEditPressed,required this.onDeletePressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.circular(8)
      ),
      margin: const EdgeInsets.only(left: 20,top: 10,right: 20),
      child: ListTile(
        title: Text(text),
        trailing: Builder(
          builder: (context) => IconButton(
              onPressed: () => showPopover(
                width: 100,
                height: 100,
                context: context, 
                bodyBuilder: (context) => NoteSettings(onEditTap: onEditPressed, onDeleteTap: onDeletePressed)
              ), 
              icon: const Icon(Icons.more_vert))
        )
        /* Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(onPressed: onEditPressed , icon: const Icon(Icons.edit)),
            IconButton(onPressed: onDeletePressed , icon: const Icon(Icons.delete))
        ],) */
      )
    );
  }
}


