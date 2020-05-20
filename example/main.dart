import 'package:http/http.dart';
import 'package:web3dart/web3dart.dart';

const String privateKey =
    '98cee03ee4d0a69359da5eae0599c479fcf0d49075afedd381cce8733fb09964';
const String rpcUrl = 'https://devnet.newchain.cloud.diynova.com/';

Future<void> main() async {
  // start a client we can use to send transactions
  final client = Web3Client(rpcUrl, Client());

  final credentials = await client.credentialsFromPrivateKey(privateKey);
  final address = await credentials.extractAddress();

  print(address.hexEip55);
  print(await client.getBalance(address));

  await client.sendTransaction(
    credentials,
    Transaction(
      to: EthereumAddress.fromHex('0xC914Bb2ba888e3367bcecEb5C2d99DF7C7423706'),
      gasPrice: EtherAmount.inWei(BigInt.from(21000000)),
      maxGas: 10000000,
      value: EtherAmount.fromUnitAndValue(EtherUnit.ether, 1),
    ),
<<<<<<< HEAD:example/simple_transaction.dart
    fetchChainIdFromNetworkId: true,
=======
>>>>>>> etherum/master:example/main.dart
  );

  await client.dispose();
}
