import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import '../Cubits/navigation_cubit/navi_cubit.dart';
import 'Components.dart';
import 'WidgetBuilders.dart';

class DatePicker extends StatelessWidget {
  final String title;
  final Function() onDone;

  const DatePicker({super.key, required this.title, required this.onDone});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
              height: getHeight(60, context),
              width: getWidth(80, context),
              child: SfDateRangePicker(
                enablePastDates: false,
                allowViewNavigation: true,
                onSelectionChanged: (dateRangePickerSelectionChangedArgs) {
                  setFirstValue(
                    dateRangePickerSelectionChangedArgs.value,
                  );
                },
                view: DateRangePickerView.month,
              ),
            ),
            loadButton(onPressed: () async {
              await onDone();
              NaviCubit.get(context).pop(context);
            }, buttonText: "Select",textSize: getRSize(10, context), borderCurveSize: 10)
          ],
        ),
      ),
    );
  }
}

DateTime dateFirst = DateTime.now();

setFirstValue(firstValue
    ) {
  dateFirst = firstValue;
}

getFirstValue() {
  return dateFirst;
}

