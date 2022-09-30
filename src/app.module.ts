import { Module } from '@nestjs/common';
import { ConfigModule } from '@nestjs/config';
import { AddressesModule } from './addresses/addresses.module';
import { DatabaseModule } from './database/database.module';

@Module({
  imports: [AddressesModule, 
    DatabaseModule, 
    ConfigModule.forRoot({
    isGlobal: true,
  })],
})
export class AppModule {}
