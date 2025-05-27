import 'package:get/get.dart';
import 'package:homefood/data/api/api_client.dart';
import 'package:homefood/utils/app_constants.dart';

class RecommendedProductRepo extends GetxService {
  final ApiClient apiClient;
  RecommendedProductRepo({required this.apiClient});

  Future<Response> getRecommendedProductList() async {
    return apiClient.get(AppConstants.RECOMMENDED_PRODUCT_URI);
  }
}
