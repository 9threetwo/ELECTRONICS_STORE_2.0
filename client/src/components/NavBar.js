import { Container, Navbar, Nav, Button } from 'react-bootstrap'
import { NavLink, Link, useNavigate } from 'react-router-dom'
// import { AppContext } from './AppContext.js'
import { useContext } from 'react'
import { observer } from 'mobx-react-lite'
import { AppContext } from '../components/AppContext.js'
import { logout } from '../http/userAPI.js'

const NavBar = observer(() => {
    const { user, basket } = useContext(AppContext)
    const navigate = useNavigate()

    const handleLogout = (event) => {
        logout()
        user.logout()
        navigate('/login', {replace: true})
    }

    return (
        <Navbar bg="dark" variant="dark">
            <Container>
            <NavLink to="/" className="navbar-brand">ELECTROnics store</NavLink>
            <Nav className="ml-auto">
            {user.isAuth ? (
                    <>
                        <NavLink to="/contacts" className="nav-link"><Button className='btn btn-outline-dark btn-default btn-xs text-center text-white' variant="outline-primary">Контакты</Button></NavLink>
                        <NavLink to="/user" className="nav-link"><Button className='btn btn-outline-dark btn-default btn-xs text-center text-white' variant="outline-primary">Личный кабинет</Button></NavLink>
                        <NavLink to="/basket" className="nav-link"><Button className='btn btn-outline-dark btn-default btn-xs text-center text-white' variant="outline-primary">Корзина{!!basket.count && <span>({basket.count})</span>}</Button></NavLink>
                        <NavLink to="/login" className="nav-link"><Button className='btn btn-outline-danger btn-default btn-xs text-center text-white' variant="outline-primary" onClick={handleLogout}>Выйти</Button></NavLink>
                    </>
                ) : (
                    <>
                        <NavLink to="/login" className="nav-link">Войти</NavLink>
                        <NavLink to="/signup" className="nav-link">Регистрация</NavLink>
                    </>
                )}

                {user.isAdmin && (
                    <>
                        <NavLink to="/admin" className="nav-link"><Button className='btn btn-outline-warning btn-default btn-xs text-center text-white' variant="outline-primary">Панель управления</Button></NavLink>
                    </>
                )}
            </Nav>
            </Container>
        </Navbar>
    )
})

export default NavBar