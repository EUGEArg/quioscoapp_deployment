import Head from 'next/head'
import Image from 'next/image'
import Layout from '../layout/Layout'
import Producto from '../components/Producto'
import useQuiosco from '../hooks/useQuiosco' //hook

export default function Home() {
	const {categoriaActual} = useQuiosco()

	return (
		<Layout pagina={`Menú ${categoriaActual?.nombre}`}>
			<h1 className='text-4xl font-black'>{categoriaActual?.nombre}</h1> 
			<p className='text-2xl my-10'>Elije y personaliza tu pedido a continuación</p>

			<div className='grid gap-4 grid-cols-1 md:grid-cols-2 xl:grid-cols- 2xl:grid-cols-4'>
				{categoriaActual?.productos?.map(producto =>( //iterar sobre los productos y mostrar los de la categoría actual
					<Producto key={producto.id} producto={producto}/>
				))}
			</div>
		</Layout>
	)
}


