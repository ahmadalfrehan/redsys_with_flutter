package com.example.redsys_with_flutter.flutter_with_redsys
import android.app.Activity
import androidx.annotation.NonNull
import android.content.Context
import com.google.gson.Gson
import com.redsys.tpvvinapplibrary.ErrorResponse
import com.redsys.tpvvinapplibrary.IPaymentResult
import com.redsys.tpvvinapplibrary.ResultResponse
import com.redsys.tpvvinapplibrary.TPVV
import com.redsys.tpvvinapplibrary.TPVVConfiguration
import com.redsys.tpvvinapplibrary.TPVVConstants
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.embedding.engine.plugins.activity.ActivityAware
import io.flutter.plugin.common.MethodCall
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler

/** FlutterWithRedsysPlugin */
class FlutterWithRedsysPlugin : FlutterPlugin, MethodCallHandler, ActivityAware {
    /// The MethodChannel that will the communication between Flutter and native Android
    ///
    /// This local reference serves to register the plugin with the Flutter Engine and unregister it
    /// when the Flutter Engine is detached from the Activity
    private lateinit var channel: MethodChannel
    private lateinit var context: Context
    private lateinit var activity: Activity
    override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
        channel = MethodChannel(flutterPluginBinding.binaryMessenger, "flutter_with_redsys")
        channel.setMethodCallHandler(this)
        context = flutterPluginBinding.applicationContext
    }

    override fun onMethodCall(@NonNull call: MethodCall, @NonNull result:  MethodChannel.Result) {
        if (call.method == "webPayment") {
            var reference: String = ""
            TPVVConfiguration.setLicense(call.argument("license"))
            if (call.argument<String>("environment").equals(TPVVConstants.ENVIRONMENT_REAL)) {
                TPVVConfiguration.setEnvironment(TPVVConstants.ENVIRONMENT_REAL)
                if (call.argument<String>("reference").equals(TPVVConstants.REQUEST_REFERENCE)) {
                    reference = TPVVConstants.REQUEST_REFERENCE
                }
            } else {
                TPVVConfiguration.setEnvironment(TPVVConstants.ENVIRONMENT_TEST)
            }
            TPVVConfiguration.setFuc(call.argument("fuc"))
            TPVVConfiguration.setTerminal(call.argument("terminal"))
            TPVVConfiguration.setMerchantUrl(call.argument("merchantUrl"))
            TPVVConfiguration.setCurrency(call.argument("currency"))
            TPVVConfiguration.setPaymentMethods(call.argument("paymentMethods"))
            TPVVConfiguration.setMerchantData(call.argument("merchantData"))
            var amount: Double ? = (call.argument<Double>("amount"))?.toDouble()
            amount = amount!!*100
            TPVV.doWebViewPayment(
                activity.getApplicationContext(),
                call.argument<String>("order"),
                amount,
                TPVVConstants.PAYMENT_TYPE_NORMAL,
                reference,
                "Descripción",
                null,
                object : IPaymentResult {
                    override fun paymentResultOK(response: ResultResponse?) {
                        result.success(Gson().toJson(response))
                    }
                    override fun paymentResultKO(error: ErrorResponse?) {
                        result.success(Gson().toJson(error))
                    }
                })
        } else {
            result.notImplemented()
        }
    }

    override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
        channel.setMethodCallHandler(null)
    }

    override fun onDetachedFromActivity() {
        TODO("Not yet implemented")
    }

    override fun onReattachedToActivityForConfigChanges(binding: ActivityPluginBinding) {
        TODO("Not yet implemented")
    }

    override fun onAttachedToActivity(binding: ActivityPluginBinding) {
        activity = binding.activity;
    }

    override fun onDetachedFromActivityForConfigChanges() {
        TODO("Not yet implemented")
    }
}
