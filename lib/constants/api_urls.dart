class ApiUrls {
  static const baseUrl = 'https://apptest.dokandemo.com/wp-json/';
  static const registration = baseUrl + 'wp/v2/users/register';
  static const login = baseUrl + 'jwt-auth/v1/token';
  static const userDetails = baseUrl + 'wp/v2/users/me?context=edit';
  static const userUpdate = baseUrl + 'wp/v2/users/me';
}
