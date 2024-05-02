import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateTimeScreen extends StatefulWidget {
  const DateTimeScreen({super.key});

  @override
  State<DateTimeScreen> createState() => _DateTimeScreenState();
}

class _DateTimeScreenState extends State<DateTimeScreen> {
  final TextEditingController _date = TextEditingController();
  final TextEditingController _time = TextEditingController();
  TimeOfDay selectedTime = TimeOfDay.now();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Todo: Date
        TextField(
          controller: _date,
          readOnly: true,
          decoration: const InputDecoration(
            icon: Icon(Icons.calendar_today_rounded),
            labelText: "Select Date",
          ),
          onTap: () async {
            DateTime? pickedDate = await showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime(1900),
              lastDate: DateTime(2100),
            );

            if (pickedDate != null) {
              setState(() {
                _date.text = DateFormat('mm-dd-yyyy').format(pickedDate);
              });
            }
          },
        ),

        // Todo: Time
        TextField(
          controller: _time,
          readOnly: true,
          decoration: const InputDecoration(
              icon: Icon(Icons.access_time_filled), labelText: "Select Time"),
          onTap: () async {
            TimeOfDay? time = await showTimePicker(
              context: context,
              initialTime: TimeOfDay.now(),
              initialEntryMode: TimePickerEntryMode.dial,
            );

            if (time != null) {
              setState(() {
                _time.text = time.format(context);
              });
            }
          },
        ),
      ],
    );
  }
}
