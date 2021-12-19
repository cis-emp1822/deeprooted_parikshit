import 'package:deeprooted_parikshit/models/bids_and_ask.dart';
import 'package:flutter/material.dart';

class BidsAndAsksHolder extends StatelessWidget {
  const BidsAndAsksHolder({Key? key, this.bidAndAsk}) : super(key: key);
  final BidAndAsk? bidAndAsk;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        const Padding(
          padding: EdgeInsets.all(10.0),
          child: Text("ORDER BOOK"),
        ),
        Flexible(
          child: Card(
            elevation: 3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: ListView(
              padding: const EdgeInsets.symmetric(vertical: 10),
              shrinkWrap: true,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: rowValues("BID PRICE", "QTY", "QTY", "ASK PRICE",
                      isBold: true),
                ),
                rowValues(
                  bidAndAsk!.bids![0][0].toString(),
                  bidAndAsk!.bids![0][1].toString(),
                  bidAndAsk!.asks![0][1].toString(),
                  bidAndAsk!.asks![0][0].toString(),
                ),
                rowValues(
                  bidAndAsk!.bids![1][0].toString(),
                  bidAndAsk!.bids![1][1].toString(),
                  bidAndAsk!.asks![1][1].toString(),
                  bidAndAsk!.asks![1][0].toString(),
                ),
                rowValues(
                  bidAndAsk!.bids![2][0].toString(),
                  bidAndAsk!.bids![2][1].toString(),
                  bidAndAsk!.asks![3][1].toString(),
                  bidAndAsk!.asks![3][0].toString(),
                ),
                rowValues(
                  bidAndAsk!.bids![3][0].toString(),
                  bidAndAsk!.bids![3][1].toString(),
                  bidAndAsk!.asks![3][1].toString(),
                  bidAndAsk!.asks![3][0].toString(),
                ),
                rowValues(
                  bidAndAsk!.bids![4][0].toString(),
                  bidAndAsk!.bids![4][1].toString(),
                  bidAndAsk!.asks![4][1].toString(),
                  bidAndAsk!.asks![4][0].toString(),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget rowValues(
      String string1, String string2, String string3, String string4,
      {bool isBold = false}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            string1,
            style: TextStyle(
                fontWeight: isBold ? FontWeight.bold : FontWeight.w300),
          ),
        ),
        Expanded(
          child: Text(
            string2,
            style: TextStyle(
                fontWeight: isBold ? FontWeight.bold : FontWeight.w300),
          ),
        ),
        Expanded(
          child: Text(
            string3,
            style: TextStyle(
                fontWeight: isBold ? FontWeight.bold : FontWeight.w300),
          ),
        ),
        Expanded(
          child: Text(
            string4,
            style: TextStyle(
                fontWeight: isBold ? FontWeight.bold : FontWeight.w300),
          ),
        ),
      ],
    );
  }
}
