export class CreateAddressDto {
  street: string;
  number?: number;
  district: string;
  city: string;
  state: string;
  zipCode: string;
  complement?: string;
}
