import 'package:flutter/material.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';

void main() {
  runApp(const SmartBridgePhone());
}

class SmartBridgePhone extends StatelessWidget {
  const SmartBridgePhone({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const BluetoothDiscoveryScreen(),
    );
  }
}

class BluetoothDiscoveryScreen extends StatefulWidget {
  const BluetoothDiscoveryScreen({super.key});

  @override
  State<BluetoothDiscoveryScreen> createState() => _BluetoothDiscoveryScreen();
}

class _BluetoothDiscoveryScreen extends State<BluetoothDiscoveryScreen> {
  List<BluetoothDevice> devices = [];
  bool bluetoothEnabled = false;

  void initState() {
    super.initState();
    checkBluetooth();
    getBondedDevices();
  }

  void getBondedDevices() async {
    var devices2 = await FlutterBluetoothSerial.instance.getBondedDevices();
    setState(() {
      devices = devices2;
    });
  }

  void checkBluetooth() async {
    bool isEnabled = await FlutterBluetoothSerial.instance.isEnabled ?? false;
    setState(() {
      bluetoothEnabled = isEnabled;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('SmartBridge - Teléfono')),
      body: Column(
        children: [
          if (!bluetoothEnabled)
            ElevatedButton(
              onPressed: FlutterBluetoothSerial.instance.requestEnable,
              child: const Text('Activar Bluetooth'),
            ),
          Expanded(
            child: ListView(
              children: devices
                  .map(
                    (d) => ListTile(
                      title: Text(d.name ?? 'Sin nombre'),
                      subtitle: Text(d.address),
                      onTap: () async {
                        BluetoothConnection connection =
                            await BluetoothConnection.toAddress(d.address);
                        print("Conectado a ${d.name}");
                      },
                    ),
                  )
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}
