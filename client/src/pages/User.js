import { Container, Button } from 'react-bootstrap'
import { useContext } from 'react'
import { AppContext } from '../components/AppContext.js'
import { Link, useNavigate } from 'react-router-dom'
import { logout } from '../http/userAPI.js'

const User = () => {
    const { user } = useContext(AppContext)
    const navigate = useNavigate()

    const handleLogout = (event) => {
        logout()
        user.logout()
        navigate('/login', {replace: true})
    }

    return (
        <Container>
            <div className='text-center p-3'><h2>Личный кабинет постоянного покупателя</h2>
            <div className='p-2'><Link to="/user/orders">
                <Button className='btn btn-outline-success btn-default btn-lg' variant="outline-primary">История заказов</Button>
                </Link></div>
            </div>
            {/* <Button onClick={handleLogout}>Выйти</Button> */}
        </Container>
    )
}

export default User