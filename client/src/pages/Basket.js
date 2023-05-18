import BasketList from '../components/BasketList.js'
import { Container } from 'react-bootstrap'

const Basket = () => {
    return (
        <Container>
            <div className='text-center p-3'><h1>Корзина</h1>
            </div>
            <BasketList />
        </Container>
    )
}

export default Basket