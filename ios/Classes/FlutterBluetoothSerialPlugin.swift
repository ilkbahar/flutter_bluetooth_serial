import Flutter
import UIKit
import ExternalAccessory

public class FlutterBluetoothSerialPlugin: NSObject, FlutterPlugin {
    public static func register(with registrar: FlutterPluginRegistrar) {
        let channel = FlutterMethodChannel(name: "flutter_bluetooth_serial", binaryMessenger: registrar.messenger())
        let instance = FlutterBluetoothSerialPlugin()
        registrar.addMethodCallDelegate(instance, channel: channel)
    }
    
    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        switch call.method {
        case "getPlatformVersion":
            result("iOS " + UIDevice.current.systemVersion)
        case "isAvailable":
            // iOS'ta klasik Bluetooth API'leri public değil
            result(FlutterError(code: "UNAVAILABLE",
                              message: "Classic Bluetooth is not available on iOS",
                              details: "iOS only supports Bluetooth Low Energy (BLE) via public APIs"))
        case "isEnabled":
            result(FlutterError(code: "UNAVAILABLE",
                              message: "Classic Bluetooth is not available on iOS",
                              details: nil))
        default:
            result(FlutterMethodNotImplemented)
        }
    }
}