package com.capacitor.lidar;

import com.getcapacitor.JSObject;
import com.getcapacitor.Plugin;
import com.getcapacitor.PluginCall;
import com.getcapacitor.PluginMethod;
import com.getcapacitor.annotation.CapacitorPlugin;

@CapacitorPlugin(name = "Lidar")
public class LidarPlugin extends Plugin {

    private Lidar implementation = new Lidar();

    @PluginMethod
    public boolean isLiDARAvailable(PluginCall call) {
        call.reject("Not available for android");
    }

    @PluginMethod
    public void startScan(PluginCall call){
        call.reject("Not available for android");
    }
}
