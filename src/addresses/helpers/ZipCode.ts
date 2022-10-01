import axios from "axios";

export class ZipCode {
    static async isInvalid(zipCode: string) {
        try {
           const response = await axios.get(`https://viacep.com.br/ws/${zipCode}/json/`);
           return response.data.erro;
        } catch {
            return true;
        }
    }
}