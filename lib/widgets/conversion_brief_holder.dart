import 'package:deeprooted_parikshit/models/conversion_brief.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ConversionBriefHolder extends StatelessWidget {
  const ConversionBriefHolder(
      {Key? key, this.conversionBrief, this.conversionName})
      : super(key: key);
  final ConversionBrief? conversionBrief;
  final String? conversionName;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(conversionName!.toUpperCase()),
              Text(
                DateFormat('dd MMM yyyy, hh:mm:ss')
                    .format(DateTime.parse(conversionBrief!.timestamp!)),
              )
            ],
          ),
        ),
        // GridView(
        //     gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        //         crossAxisCount: 2))
      ],
    );
  }
}
