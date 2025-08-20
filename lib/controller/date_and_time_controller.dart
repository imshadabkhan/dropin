import 'package:dropin/core/widgets/text_widgets.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';



import 'package:flutter/foundation.dart'; // for kIsWeb
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

Future<void> pickDateAndSetController({
  required BuildContext context,
  required TextEditingController controller,
  String format = 'yyyy-MM-dd',
}) async {
  if (kIsWeb) {
    // 📦 Custom constrained dialog for web
    DateTime? picked = await showDialog(
      context: context,
      builder: (context) {
        DateTime tempPicked = DateTime(2000);
        return AlertDialog(
          contentPadding: EdgeInsets.zero,
          content: SizedBox(
            width: 500,
            height: 500,
            child: Theme(
              data: ThemeData(
                fontFamily: 'Montserrat',
                textTheme: const TextTheme(
                  bodyLarge: TextStyle(fontSize: 14),
                  bodyMedium: TextStyle(fontSize: 14),
                  bodySmall: TextStyle(fontSize: 12),
                  titleLarge: TextStyle(fontSize: 16),
                  titleMedium: TextStyle(fontSize: 14),
                  titleSmall: TextStyle(fontSize: 12),
                ),
                colorScheme: ColorScheme.light(
                  primary: Colors.purple, // Selected circle
                  onPrimary: Colors.white, // Selected date text
                  onSurface: Colors.black, // Default text
                ),
              ),
              child: CalendarDatePicker(
                initialDate: DateTime(2000),
                firstDate: DateTime(1900),
                lastDate: DateTime.now(),
                onDateChanged: (date) {
                  tempPicked = date;
                },
              ),
            ),

          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(null);
              },
              child: Texts.textNormal("Cancel",size:16,color: Colors.red,),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(tempPicked);
              },
              child: Texts.textNormal("Select",size: 16),
            ),
          ],
        );
      },
    );

    if (picked != null) {
      controller.text = DateFormat(format).format(picked);
    }
  } else {
    // ✅ Default mobile date picker
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime(2000),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (picked != null) {
      controller.text = DateFormat(format).format(picked);
    }
  }
}

