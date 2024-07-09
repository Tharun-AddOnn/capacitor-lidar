export interface LidarPlugin {
  echo(options: { value: string }): Promise<{ value: string }>;
}
