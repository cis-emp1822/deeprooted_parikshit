import 'package:deeprooted_parikshit/models/bids_and_ask.dart';
import 'package:dio/dio.dart';
import 'package:deeprooted_parikshit/models/conversion_brief.dart';

class CoinsRepo {
  const CoinsRepo(this.client);

  final Dio client;

  Future<ConversionBrief> getConversionBrief(String searchKeyword) async {
    try {
      final response = await client.get('/ticker/$searchKeyword');
      if (response.statusCode == 200 && response.data is Map<String, dynamic>) {
        final ConversionBrief conversionBrief =
            ConversionBrief.fromJson(response.data);

        return conversionBrief;
      } else {
        throw Exception("Unable to load from dictionary!");
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<BidAndAsk> getBidsAndAsks(String searchKeyword) async {
    try {
      final response = await client.get('/order_book/$searchKeyword');
      if (response.statusCode == 200 && response.data is Map<String, dynamic>) {
        final BidAndAsk bidAndAsk = BidAndAsk.fromJson(response.data);
        return bidAndAsk;
      } else {
        throw Exception("Unable to load from dictionary!");
      }
    } catch (e) {
      rethrow;
    }
  }
}
