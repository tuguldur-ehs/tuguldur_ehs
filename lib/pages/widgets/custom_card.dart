import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final String? title;
  final String? type;
  final String? time;
  final VoidCallback onTap;
  final bool? isSent;

  CustomCard({
    this.title,
    this.type,
    this.time,
    required this.onTap,
    this.isSent = false,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        height: 90,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${title}',
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
              ),
            ),
            Row(
              children: [
                const SizedBox(width: 10),
                Icon(Icons.note_alt_sharp, size: 20),
                const SizedBox(width: 5),
                Text(
                  'Төрөл: ',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '${type}',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 13,
                  ),
                ),
                Spacer(),
                Icon(Icons.arrow_forward_ios_outlined)
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(width: 10),
                Icon(Icons.more_time_outlined, size: 20),
                const SizedBox(width: 5),
                Text(
                  'Гүйцэтгэх хугацаа: ',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '${time}',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 13,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
