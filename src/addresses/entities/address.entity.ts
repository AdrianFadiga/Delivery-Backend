import { BadRequestException } from '@nestjs/common';
import { CreateAddressDto } from '../dto/create-address.dto';
import { ZipCode } from '../helpers/ZipCode';
import { CreateAddressSchema } from '../schemas';


export class AddressEntity {
  static async create(newAddress: CreateAddressDto) {
    const address = await AddressEntity.validateAddress(newAddress);
    await AddressEntity.validateZipCode(address.zipCode)
    return address;
  }

  static async validateAddress(newAddress: CreateAddressDto) {
    return CreateAddressSchema.isValid(newAddress);
  }

  static async validateZipCode(zipCode: string) {
    const zipCodeRegex = /^[0-9]{5}[0-9]{3}$/
    if (!zipCodeRegex.test(zipCode)) throw new BadRequestException()

    const isInvalidZipCode = await ZipCode.isInvalid(zipCode);
    if (isInvalidZipCode) throw new BadRequestException()

    return zipCode; 
  }
}
