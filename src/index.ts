import { registerPlugin } from '@capacitor/core';

import type { LidarPlugin } from './definitions';

const Lidar = registerPlugin<LidarPlugin>('Lidar', {
  web: () => import('./web').then(m => new m.LidarWeb()),
});

export * from './definitions';
export { Lidar };
