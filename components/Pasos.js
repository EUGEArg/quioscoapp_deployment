import { useRouter } from 'next/router'

const pasos = [
    { paso: 1, nombre: 'Menú', url: '/' },
    { paso: 2, nombre: 'Resúmen', url: '/resumen' },
    { paso: 3, nombre: 'Datos y Total', url: '/total' },
]

const Pasos = () => {
    const router = useRouter()

    const calcularProgreso = () => {
        let valor;
        if(router.pathname === '/') {
            valor = 5;
        }else if (router.pathname === '/resumen'){
            valor = 50
        }else{
            valor = 100
        }
        return valor
        }
//Otra solución para cacular el progreso que se muestra en la barra:  return (paso/3) * 100   

    return (
        <>
            <div className="flex justify-between mb-10">
                {pasos.map((paso) => (
                    <button
                        onClick={() => {
                            router.push(paso.url) //para redireccionar pág
                        }}
                        className="text-2xl font-bold" key={paso.paso}>{paso.nombre}</button>
                ))}
            </div>
            <div className='bg-gray-100 mb-10'>
                <div 
                    className='rounded-full bg-amber-500 text-xs leading-none h-2 text-center text-white' 
                    style={{width:`${calcularProgreso()}%`}}> 
                    {/* de esta manera el div toma el width de acuerdo al cálculo 33, 66 0 100 */}
                </div>
            </div>
        </>
    )
}

export default Pasos