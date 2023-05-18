import { useState, useEffect } from 'react'
import { adminGetAll as getAllOrders } from '../http/orderAPI.js'
import { Button, Container, Spinner } from 'react-bootstrap'
import Orders from '../components/Orders.js'
import CreateOrder from '../components/CreateOrder.js'

const AdminOrders = () => {
    const [orders, setOrders] = useState(null)
    const [fetching, setFetching] = useState(true)
    const [show, setShow] = useState(false)

    useEffect(() => {
        getAllOrders()
            .then(
                data => setOrders(data)
            )
            .finally(
                () => setFetching(false)
            )
    }, [])

    if (fetching) {
        return <Spinner animation="border" />
    }

    return (
        <Container>
            <div className='text-center p-3'><h1>Все заказы</h1>
            {/* <Button className='btn btn-default btn-lg' onClick={() => setShow(true)}>Создать заказ</Button> */}
            </div>
            <CreateOrder show={show} setShow={setShow} />
            <Orders items={orders} admin={true} />
        </Container>
    )
}

export default AdminOrders