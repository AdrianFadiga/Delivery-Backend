import { Module } from '@nestjs/common';
import { AddressesModule } from './addresses/addresses.module';
import { DatabaseModule } from './database/database.module';

@Module({
  imports: [AddressesModule, DatabaseModule],
})
export class AppModule {}
