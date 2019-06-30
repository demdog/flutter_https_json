import 'dart:convert';
import 'dart:io';

class NetworkUtils {

  static const CertSubject = '/CN=test.apigj.com';
  static const CertIssuer = '/C=US/O=Let\'s Encrypt/CN=Let\'s Encrypt Authority X3';
  static const TrustHost = 'test.apigj.com';
  static const Host = 'test.apigj.com:18443';

  static httpsPostData(String urlPath, Object reqData) async {
    var httpClient = new HttpClient();
    httpClient.badCertificateCallback = (X509Certificate cert, String host, int port) {
      if(cert.subject == CertSubject && cert.issuer == CertIssuer){
        if(host == TrustHost){
          return true;
        }
      }
      return false;
    };
    // httpClient.addCredentials(url, realm, credentials)

    var request = await httpClient.postUrl(new Uri.https(Host,urlPath));

    request.add(utf8.encode(json.encode(reqData)));
    var response = await request.close();
    var responseBody = await response.transform(utf8.decoder).join();

    Map dataMap = jsonDecode(responseBody);
    httpClient.close();
    return dataMap;
  }
}