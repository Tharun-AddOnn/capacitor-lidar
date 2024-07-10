import { WebPlugin } from '@capacitor/core';

import type { LidarPlugin } from './definitions';

export class LidarWeb extends WebPlugin implements LidarPlugin {
  isLiDARAvailable(): Promise<{ available: boolean; }> {
    throw new Error('Method not implemented.');
  }
  startScan(): Promise<void> {
    throw new Error('Method not implemented.');
  }
}
