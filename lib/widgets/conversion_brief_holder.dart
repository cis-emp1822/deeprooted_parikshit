import 'package:deeprooted_parikshit/models/conversion_brief.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ConversionBriefHolder extends StatelessWidget {
  ConversionBriefHolder({Key? key, this.conversionBrief, this.conversionName})
      : super(key: key);
  final ConversionBrief? conversionBrief;
  final String? conversionName;
  final NumberFormat formatCurrency = NumberFormat.simpleCurrency();
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                conversionName!.toUpperCase(),
                style:
                    const TextStyle(fontSize: 24, fontWeight: FontWeight.w400),
              ),
              Text(
                DateFormat('dd MMM yyyy, hh:mm:ss').format(
                    DateTime.fromMillisecondsSinceEpoch(
                        int.parse(conversionBrief!.timestamp!))),
              )
            ],
          ),
        ),
        Flexible(
          child: GridView(
            padding: const EdgeInsets.symmetric(vertical: 10),
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 3.3, crossAxisCount: 2),
            children: [
              rowValues("OPEN", conversionBrief!.open!.toString()),
              rowValues("HIGH", conversionBrief!.high!.toString()),
              rowValues("LOW", conversionBrief!.low!.toString()),
              rowValues("LAST", conversionBrief!.last!.toString()),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0),
          child: rowValues("VOLUME", conversionBrief!.volume!.toString(),
              formatto: false),
        ),
      ],
    );
  }

  Widget rowValues(String string1, String string2, {bool formatto = true}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(string1),
        Text(
          formatto ? formatCurrency.format(double.parse(string2)) : string2,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
        )
      ],
    );
  }
}
