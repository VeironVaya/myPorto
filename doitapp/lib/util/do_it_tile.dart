import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class DoItTile extends StatelessWidget {
  final String actName;
  final bool actStatus;
  final Function(bool?)? onChanged;
  final Function(BuildContext)? deleteAct;

  const DoItTile({
    super.key,
    required this.actName,
    required this.actStatus,
    required this.onChanged,
    required this.deleteAct,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 18, left: 10, right: 10),
      child: Slidable(
        endActionPane: ActionPane(motion: const StretchMotion(), children: [
          SlidableAction(
            borderRadius: BorderRadius.circular(15),
            onPressed: deleteAct,
            icon: Icons.delete,
            backgroundColor: Colors.red,
          )
        ]),
        child: Container(
          height: 70,
          decoration: BoxDecoration(
            color: Colors.orange,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Row(
            children: [
              Checkbox(
                value: actStatus,
                onChanged: onChanged,
                fillColor: WidgetStateProperty.all(Colors.black),
                checkColor: Colors.white,
              ),
              Text(
                actName,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 19,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
