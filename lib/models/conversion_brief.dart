class ConversionBrief {
  String? volume;
  String? last;
  String? timestamp;
  String? bid;
  String? vwap;
  String? high;
  String? low;
  String? ask;
  double? open;

  ConversionBrief(
      {this.volume,
      this.last,
      this.timestamp,
      this.bid,
      this.vwap,
      this.high,
      this.low,
      this.ask,
      this.open});

  ConversionBrief.fromJson(Map<String, dynamic> json) {
    volume = json['volume'];
    last = json['last'];
    timestamp = json['timestamp'];
    bid = json['bid'];
    vwap = json['vwap'];
    high = json['high'];
    low = json['low'];
    ask = json['ask'];
    open = json['open'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['volume'] = volume;
    data['last'] = last;
    data['timestamp'] = timestamp;
    data['bid'] = bid;
    data['vwap'] = vwap;
    data['high'] = high;
    data['low'] = low;
    data['ask'] = ask;
    data['open'] = open;
    return data;
  }
}
