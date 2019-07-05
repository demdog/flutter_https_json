import 'dart:convert';
import 'dart:io';

class NetworkUtils {

  static const CertSubject = '/CN=test.apigj.com';
  static const CertIssuer = '/C=US/O=Let\'s Encrypt/CN=Let\'s Encrypt Authority X3';
  static const TrustHost = 'test.apigj.com';
  static const Host = 'test.apigj.com:18443';

  static httpsPostData(String urlPath, Object reqData, {String host, Map<String, String> header, String trustHost, String certSubject, String certIssuer}) async {
    var httpClient = new HttpClient();
    httpClient.badCertificateCallback = (X509Certificate cert, String host, int port) {
      if(cert.subject == (certSubject??CertSubject) && cert.issuer == (certIssuer??CertIssuer)){
        if(host == (trustHost??TrustHost)){
          return true;
        }
      }
      return false;
    };
    // httpClient.addCredentials(url, realm, credentials)
    var request = await httpClient.postUrl(new Uri.https(host??Host,urlPath));
    if(header != null){
      for (var k in header.entries) {
        request.headers.set(k.key, k.value);
      }
    }
    request.add(utf8.encode(json.encode(reqData)));
    var response = await request.close();
    var responseBody = await response.transform(utf8.decoder).join();
      
    print(responseBody);
    Map dataMap = jsonDecode(responseBody);
    httpClient.close();
    return dataMap;
  }
}