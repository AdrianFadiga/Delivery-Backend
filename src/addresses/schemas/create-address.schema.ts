import { CreateAddressDto } from "../dto/create-address.dto";
import * as yup from 'yup';

export class CreateAddressSchema {
    static isValid(address: Omit<CreateAddressDto, 'zipCode'>) {
        try {
            const schema = yup.object().shape({
                street: yup.string().max(30).required(),
                number: yup.number().required(),
                district: yup.string().max(30).required(),
                city: yup.string().max(30).required(),
                state: yup.string().max(30).required(),
                complement: yup.string().max(30).required(),
            })
            return schema.validate(address)
        } catch (err) {
            throw {status: 400, message: err.path, err: true}
        }
        //   .then((response) => response)
        //    .catch((err) => ({status: 400, message: err.path, err: true}))
    }
}