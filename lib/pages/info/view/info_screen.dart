import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hab_security_fornt/pages/emp_advice/emp_advice_detail.dart';
import 'package:intl/intl.dart';

import '../../widgets/custom_card.dart';

class InfoPage extends StatefulWidget {
  const InfoPage({super.key});

  @override
  State<InfoPage> createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  final TextEditingController zaawarControllor = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController durationController = TextEditingController();
  final TextEditingController imageController = TextEditingController();

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
                      formattedDate,
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
              onTap: () {
                print('wfffff');
                Get.to(TaskDetailsPage());
              },
              title: 'Ажлын зааварчилгаа',
              type: '13н давхрын өрөлт',
              time: '10.3 - 10.10',
            ),
            const SizedBox(height: 30),
            CustomCard(
              onTap: () {},
              title: 'Аюулгүй ажиллагааны заавар',
              type: '13н давхрын өрөлт',
              time: '10.3 - 10.10',
            ),
            const SizedBox(height: 30),
            CustomCard(
              onTap: () {},
              title: 'Аюулгүй ажиллагааны заавар',
              type: '13н давхрын өрөлт',
              time: '10.3 - 10.10',
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  onTap: () => _showBottomSheet(context),
                  child: Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                    child: Icon(
                      Icons.add,
                      size: 60,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
      builder: (BuildContext context) {
        return Padding(
          padding: EdgeInsets.only(
            left: 20,
            right: 20,
            top: 20,
            bottom: MediaQuery.of(context).viewInsets.bottom + 20,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: zaawarControllor,
                decoration: InputDecoration(
                  hintText: 'Зааварчилгааны нэр', // Hint inside the field
                  filled: true, // Enable background color
                  fillColor: Colors.white, // White background
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10), // Rounded corners
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: Colors.blue, // Color when focused
                      width: 2,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              TextField(
                controller: descriptionController,
                maxLines: 3,
                decoration: InputDecoration(
                  hintText: 'Дэлгэрэнгүй',
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: Colors.blue,
                      width: 2,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              TextField(
                controller: durationController,
                decoration: InputDecoration(
                  hintText: 'Гүйцэтгэх хугацаа',
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: Colors.blue,
                      width: 2,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              TextField(
                controller: imageController,
                decoration: InputDecoration(
                  hintText: 'Зураг оруулах',
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: Colors.blue,
                      width: 2,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                //https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRNIMxGqAe-dHCBNzsINklaoplZP0YKOFUl7g&s
                onPressed: () {
                  print('KKKK${zaawarControllor.text}');
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  minimumSize: Size(double.infinity, 50),
                ),
                child: Text(
                  'Хадгалах',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

}
