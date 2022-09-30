import { v4 } from 'uuid';
import { CreateAddressDto } from '../dto/create-address.dto';

export class AddressEntity {
  id: string = v4();
  street: string;
  number: number;
  district: string;
  city: string;
  state: string;
  zipCode: string;
  complement: string;
  constructor(address: CreateAddressDto) {
    Object.assign(this, address);
  }
}
