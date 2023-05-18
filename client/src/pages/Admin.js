import { Container, Button} from 'react-bootstrap'
import { useContext } from 'react'
import { AppContext } from '../components/AppContext.js'
import { Link, useNavigate } from 'react-router-dom'
import { logout } from '../http/userAPI.js'
import {Row, Col} from 'react-bootstrap'

const Admin = () => {
    const { user } = useContext(AppContext)
    const navigate = useNavigate()

    const handleLogout = (event) => {
        logout()
        user.logout()
        navigate('/login', {replace: true})
    }

    return (
        <Container>
            <div className='text-center p-3'><h2>Панель управления для администратора</h2>
            </div>
                <Row>
                    <Col className="ml-auto">
                        <div className='text-center text-white p-3' >
                            <div className='p-2'><Link to="/admin/orders">
                                <Button className='btn btn-outline-danger btn-default btn-lg' variant="outline-primary">Все заказы</Button>
                                </Link>
                            </div>
                            <div className='p-2'><Link to="/admin/categories">
                                <Button className='btn btn-outline-danger btn-default btn-lg' variant="outline-primary">Категории</Button>
                                </Link>
                            </div>
                            <div className='p-2'><Link to="/admin/brands">
                                <Button className='btn btn-outline-danger btn-default btn-lg' variant="outline-primary">Бренды</Button>
                                </Link>
                            </div>
                            <div className='p-2'><Link to="/admin/products">
                                <Button className='btn btn-outline-danger btn-default btn-lg' variant="outline-primary">Товары</Button>
                                </Link>
                            </div>
                        </div>
                    </Col>
                </Row>
        </Container>
    )
}

export default Admin