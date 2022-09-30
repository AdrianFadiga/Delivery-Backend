import { Module } from '@nestjs/common';
import { AddressesService } from './addresses.service';
import { AddressesController } from './addresses.controller';
import { DatabaseModule } from 'src/database/database.module';

@Module({
  controllers: [AddressesController],
  providers: [AddressesService],
  // imports: [DatabaseModule]
})
export class AddressesModule {}
