class AppConstants {
  static const String APP_NAME = 'DBFood';
  static const int APP_VERSION = 1;
  // static const String BASE_URL = 'https://mvs.bslmeiyu.com';
  static const String BASE_URL = 'http://127.0.0.1:8000';
  // static const String BASE_URL = 'http://192.168.1.7:8000';
  static const String POPULAR_PRODUCT_URI = '/api/v1/products/popular';
  static const String RECOMMENDED_PRODUCT_URI = '/api/v1/products/recommended';
  static const String DRINKS_URL = '/api/v1/products/drinks';

  static const String UPLOAD_URL = '/uploads/';

  //auth end points
  static const String REGISTRATION_URI = '/api/v1/auth/register';
  static const String LOGIN_URI = '/api/v1/auth/login';
  static const String USER_INFO_URI = '/api/v1/customer/info';

  // static const String TOKEN = 'DBtoken';
  static const String TOKEN = '';
  static const String PHONE = '';
  static const String PASSWORD = '';

  static const String CART_LIST = 'cart-list';
  static const String CART_HISTORY_LIST = 'cart-history-list';
}
