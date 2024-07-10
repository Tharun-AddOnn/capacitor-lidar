export interface LidarPlugin {
  isLiDARAvailable(): Promise<{ available: boolean }>;
  startScan():Promise<void>;
}
