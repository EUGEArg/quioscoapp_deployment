import { useState, useEffect, createContext } from 'react'
import axios from 'axios'
import {toast} from 'react-toastify'
import {useRouter} from 'next/router'

const QuioscoContext = createContext()

const QuioscoProvider = ({children}) => {
    const [categorias, setCategorias] = useState([])
    const [categoriaActual, setCategoriaActual] = useState({})
    const [producto, setProducto] = useState({}) 
    const [modal, setModal] = useState(false)
    const [pedido, setPedido] = useState([]) //arreglo vacío
    const [nombre, setNombre] = useState('')
    const [total, setTotal] = useState(0)

    const router = useRouter()
    
    const obtenerCategorias = async() => { //función creada para usar async- await-- para acceder a los datos
        const {data} = await axios('/api/categorias')
        setCategorias(data)
    }


    //useEffect
    useEffect(() => {
        obtenerCategorias()
    }, [])

    useEffect(() => {
        setCategoriaActual(categorias[0])
    }, [categorias]) // Al inicio ya se muestra una categoría seleccionada, en este caso la primera--> posición 0

    useEffect(() => {
        const nuevoTotal = pedido.reduce((total, producto) => (producto.precio * producto.cantidad) + total, 0)

        setTotal(nuevoTotal) //para calcular el valor total del pedido
    }, [pedido])


    //funciones
    const handleClickCategoria = id => { //click en categoría
        const categoria = categorias.filter( cat => cat.id === id) //filtrar categoría actual por el id al hacer click
        setCategoriaActual(categoria[0])
        router.push('/') //para mejor exp de ususario: siempre lleva a la pág principal: menú
    }

    const handleSetProducto = producto => {
        setProducto(producto)
    }

    const handleChangeModal = () => {
        setModal(!modal)
    }

    const handleAgregarPedido = ({categoriaId, ...producto}) => { //del objeto producto quito lo que no necesito: id de la categoría
        if(pedido.some(productoState => productoState.id === producto.id)){ //para detectar si está duplicado el pedido
            const pedidoActualizado = pedido.map(productoState => productoState.id === producto.id ? producto : productoState) //actualizar la cantidad
            setPedido(pedidoActualizado)
            toast.success('Guardado Correctamente')
        }else {
            setPedido([...pedido, producto]) //lo que se va a agregar al pedido 
            toast.success('Agregado al Pedido')
        }
        
        setModal(false) //para que cierre solo el modal
    }

    const handleEditarCantidades = id =>{
        const productoActualizar = pedido.filter( producto => producto.id === id )
        setProducto(productoActualizar[0])

        setModal(!modal)
    }

    const handleEliminarProducto = id => {
        const pedidoActualizado = pedido.filter (producto =>producto.id !== id)
        setPedido(pedidoActualizado)
    }

    const colocarOrden = async (e) => {
        e.preventDefault()
        //establecer conexión entre provider y endpoint de ordenes
        try{
            const {data} = await axios.post('/api/ordenes', {pedido, nombre, total, fecha: Date.now().toString()}) //conexión con la BD y los datos que tengo que extraer de la misma (deben coincidir con prisma)
            
            //Resetear luego de enviar una orden de pedido
            setCategoriaActual(categorias[0])
            setPedido([])
            setNombre('')
            setTotal(0)

            toast.success('Pedido Realizado Correctamente')

            setTimeout(() => {
                router.push('/')
            }, 3000)
            
        }catch(error){
            console.log(error)
        }
    }

    return(
        <QuioscoContext.Provider
            value={{
                categorias,
                categoriaActual,
                handleClickCategoria,
                producto,
                handleSetProducto,
                modal,
                handleChangeModal,
                handleAgregarPedido,
                pedido,
                handleEditarCantidades,
                handleEliminarProducto,
                nombre,
                setNombre,
                colocarOrden,
                total
            }}>
            {children} 
        </QuioscoContext.Provider>
    )
}

export{
    QuioscoProvider
}

export default QuioscoContext