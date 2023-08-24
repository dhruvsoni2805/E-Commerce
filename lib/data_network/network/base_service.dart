abstract class BaseService {
  Future<dynamic> getApiResponse(String url);
  Future<dynamic> postApiResponse(String url, String data);
}
