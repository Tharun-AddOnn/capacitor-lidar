export interface LidarPlugin {
  isLiDARAvailable(): Promise<{ available: boolean }>;
  startScan():Promise<void>;
  stopScan():Promise<void>;
  exportResults():Promise<void>;
}
