class BidAndAsk {
  String? timestamp;
  String? microtimestamp;
  List<List<double>>? bids;
  List<List<double>>? asks;

  BidAndAsk({this.timestamp, this.microtimestamp, this.bids, this.asks});

  BidAndAsk.fromJson(Map<String, dynamic> json) {
    timestamp = json['timestamp'];
    microtimestamp = json['microtimestamp'];
    if (json['bids'] != null) {
      bids = [];
      json['bids'].forEach((v) {
        List<double>? internalPoint = [];
        v?.forEach(
            (element) => internalPoint.add(double.tryParse(element) ?? 0));
        bids!.add(internalPoint);
      });
    }
    if (json['asks'] != null) {
      asks = [];
      json['asks'].forEach((v) {
        List<double>? internalPoint = [];
        v?.forEach(
            (element) => internalPoint.add(double.tryParse(element) ?? 0));
        asks!.add(internalPoint);
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['timestamp'] = timestamp;
    data['microtimestamp'] = microtimestamp;

    data['bids'] = bids;
    data['asks'] = asks;

    return data;
  }
}
