// import 'package:googleapis_auth/auth_io.dart';

// class GetServerKey {
//   static Future<String> getServerKeyToken() async {
//     final scopes = ['https://www.googleapis.com/auth/firebase.messaging'];

//     final client = await clientViaServiceAccount(
//       ServiceAccountCredentials.fromJson({
//         "type": "service_account",
//         "project_id": "fir-test-33040",
//         "private_key_id": "e92aa934f4041cf71c7bde95ec8a57187ebffdbf",
//         "private_key":
//             "-----BEGIN PRIVATE KEY-----\nMIIEvgIBADANBgkqhkiG9w0BAQEFAASCBKgwggSkAgEAAoIBAQCdHAUIwX4yb+QE\noP0UUTUONB6TwJyXHEVqlG8D/YURD+AlCixgEuNVn4QcdPneCAUylqN+OTVDb8xv\n8EEejE4xGDg52tQFQjhI1mGsIPPi0QN0n/6swveaH5WSKJOMgAlJpJKoEWj0Zfmz\n97x4z9szXsXYEKio/SPSXzEh4c9Zs9RLSbX1hEZvwYsA52kxypOtYWTYJvecPzyH\n4eLNIIyxZV/EKjNYD73WBIlMOkbwmDa9/IcaZ0AJssmTrsxrfawugnzhBT139Omd\nQOyHPepaXXaQrYOfN8nRJ6Q1aqtyeHooPq/G4LGWs1loYoUZWP3qSDGrP//1Iod3\nSKc+kBARAgMBAAECggEABYENzBi7SxkQa/kX5LZTnYPF7nc5BTJAXFOG8CTZnJdp\nyuJoW5VN0ZodDsIqXtT5GaSdZbarXwlzqBhKr79Knf2zOpOoCecgAa1BDr64zKF1\n9YgFbBgIhKXGn7A8OxfhO2tAmBLEEovgC6YKPFFL5KjVVZR/1CvKLXyYRA+dLA9K\nuv3NVhUgkjEdGGvrnp0rMVNz6bEqSJa9nHSsotjUD8cuiWzy6g6TQZZapB/qvVWs\nMdSW148hFhIpZuz8j47miS2Ba1p4PWN5+EEAuZlhycSTYfFoFhkTSM4njxTGI4Jr\nG1HQM6aAaGDKZhps5oeHc9UQQA/ItSIUK0X1gN8cgQKBgQDLeKXy4wNvmMprjfFC\nuzp8qRHuzQklzlgRWuMvkI7VImZs9+lCoh7QGlJ+7hs50VvsheR2xHwS5scgeRpg\nQhEgxg7Uncczpf/Q8Nkree3jmBW97Pi5uMZ83l0U7LGFI6CE2YrDC33elwKMERHi\nkp8OA4yeawlIpOltjZRo11wZhQKBgQDFq1U7Dqkg81IvVWmoaRhcwnRXJGr6o92O\nuMgq0Ovt5vDdUo4PJipQubthgYP46aueHwfu3p5kwHCgEA48YTuypYxX412/zRVH\niGT4EKVHhc66lq814r6/zg8zt70HDo74PFCFi10FEy5DNOGxlWVsZ5EyWEslXxN+\nHE9c3G48HQKBgQC/kWT0zGWkwT77ipV21Z5YVjorEmIldSQXmvHBC6Je6tdyiurU\nMJ1AIzg+h2Gcyw94HgufApkqlpsuaLa7oBhOOgsmhTJS31x+VPSy6UZffQYjXiRD\nf8NpN1Z95+evSX7M9aCeyIgGdTkRtNSY9KDJ6e+QC4ifG50m5yCuoOz2nQKBgEjn\nPwEQECq58ybH/rcBQ936TgRRxy73vuBDoHfCJDHTCiTmrMRDlDm/tq9ooC7up8Ai\nu79K1epc22z9XvK//c+OpStJDSuPTPjcAjlHkl3FqRBCQQ7DuQxuyEaPzqTKpspB\nHIWUd9NGVrqsx0zCx+xqai/CRrzaywqpEFA0cGe1AoGBAKPuDXaYevT3POspUR2L\nHNw1XbvOOSf5Vla7GGLCiCmvcOoPfSRuFy/uSWgj6r0XTPNk1PLFH4YS6FL4/55l\n82Au8ATJSFc9JHvv+99PrK/fOYDVabwuoA1A6ZchJlmPVwq/Nc4WbLcbwp6iH0Ow\njw2vAEFqI6toi8m7NY9icb87\n-----END PRIVATE KEY-----\n",
//         "client_email":
//             "firebase-adminsdk-ioy3q@fir-test-33040.iam.gserviceaccount.com",
//         "client_id": "112190119057618092218",
//         "auth_uri": "https://accounts.google.com/o/oauth2/auth",
//         "token_uri": "https://oauth2.googleapis.com/token",
//         "auth_provider_x509_cert_url":
//             "https://www.googleapis.com/oauth2/v1/certs",
//         "client_x509_cert_url":
//             "https://www.googleapis.com/robot/v1/metadata/x509/firebase-adminsdk-ioy3q%40fir-test-33040.iam.gserviceaccount.com",
//         "universe_domain": "googleapis.com"
//       }),
//       scopes,
//     );

//     final accessServerKey = client.credentials.accessToken.data;
//     print("\n${accessServerKey}\n");
//     return accessServerKey;
//   }
// }
