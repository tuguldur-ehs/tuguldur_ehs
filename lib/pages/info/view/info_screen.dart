import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../widgets/custom_card.dart';

class InfoPage extends StatefulWidget {
  const InfoPage({super.key});

  @override
  State<InfoPage> createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  @override
  Widget build(BuildContext context) {
    final formattedDate = DateFormat('yyyy.MM.dd').format(DateTime.now());
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 35),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                // Image.asset('assets/zuwlumj.png'),
                Icon(
                  Icons.handshake_outlined,
                  color: Colors.white,
                  size: 40,
                ),
                const SizedBox(
                  width: 15,
                ),
                Text(
                  'Зөвлөмж',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
            Row(
              children: [
                Column(
                  children: [
                    const SizedBox(height: 30),
                    Text(
                      '${formattedDate}',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20),
            CustomCard(
              onTap: () {},
              title: 'Ажлын зааварчилгаа',
              type: '13н давхрын өрөлт',
              time: '10.3 - 10.10',
            ),
            const SizedBox(height: 30),
            CustomCard(
              onTap:  () {},
              title: 'Аюулгүй ажиллагааны заавар',
              type: '13н давхрын өрөлт',
              time: '10.3 - 10.10',
            ),
            const SizedBox(height: 30),
            CustomCard(
              onTap:  () {},
              title: 'Аюулгүй ажиллагааны заавар',
              type: '13н давхрын өрөлт',
              time: '10.3 - 10.10',
            ),
          ],
        ),
      ),
    );
  }
}
