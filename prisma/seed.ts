import { categorias} from './data/categorias'
import { productos } from './data/productos'
import { PrismaClient } from '@prisma/client'

const prisma = new PrismaClient()

const main = async () : Promise<void> => { //tipado de Ts
    try {
        await prisma.categoria.createMany({ //para agregar múltiples elementos
            data: categorias
        })
        await prisma.producto.createMany({ //para agregar múltiples elementos
            data: productos
        })
    }catch (error) {
        console.log(error)
    }
}
main() //función principal