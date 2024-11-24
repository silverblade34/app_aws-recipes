import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';

final poolId = dotenv.env['POOL_ID'];
final appClientId = dotenv.env['APP_CLIENT_ID'];

final Map<String, dynamic> amplifyConfigJson = {
  "UserAgent": "aws-amplify-cli/2.0",
  "Version": "1.0",
  "auth": {
    "plugins": {
      "awsCognitoAuthPlugin": {
        "IdentityManager": {"Default": {}},
        "CognitoUserPool": {
          "Default": {
            "PoolId": poolId,
            "AppClientId": appClientId,
            "Region": "us-east-2",
          }
        },
        "Auth": {
          "Default": {
            "authenticationFlowType": "USER_SRP_AUTH",
            "usernameAttributes": ["email"],
            "signupAttributes": ["email", "name"],
            "passwordProtectionSettings": {
              "passwordPolicyMinLength": 8,
              "passwordPolicyCharacters": []
            }
          }
        }
      }
    }
  }
};

final String amplifyConfig = jsonEncode(amplifyConfigJson);
