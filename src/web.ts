import { WebPlugin } from '@capacitor/core';

import type { LidarPlugin } from './definitions';

export class LidarWeb extends WebPlugin implements LidarPlugin {
  async echo(options: { value: string }): Promise<{ value: string }> {
    console.log('ECHO', options);
    return options;
  }
}
