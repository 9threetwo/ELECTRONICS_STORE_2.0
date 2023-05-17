import Container from 'react-bootstrap/Container'


const Contacts = () => {
    return (
        <Container>
            <h1>Контактные данные</h1>
            <div className="container">
                <div className="col-1-2">
                    <br></br>
                    <h4>Позвоните нам</h4>
                    <a>Есть вопросы? Мы поможем!</a>
                    <p><a href="tel:+7 (495) 123-45-67">+7 (495) 123-45-67</a> для Москвы</p>
                    <p><a href="tel:+7 (123) 456-78-90">+7 (123) 456-78-90</a> для регионов</p>
                </div>
                <div className="col-1-2">
                    <br></br>
                    <h4>Напишите нам</h4>
                    <a>Идеи? Предложения? Мы открыты для любых вопросов!</a>
                    <p>Написать на <a href="mailto:electronics.store@site.com"> electronics.store@site.com</a></p>
                </div>
                <div>
                    <br></br>
                    <br></br>
                    <br></br>
                    <br></br>
                    <br></br>
                    <br></br>
                    <p>Продавец товара: ООО «МВМ»: 105066</p>

                    <p>ИНН 7707548740  КПП 997350001</p>

                    <p>ОГРН 1057746840095</p>

                    <p>Юр. адрес: г. Москва, ул. Нижняя Красносельская, д. 40/12, корпус 20, этаж 5, помещение II, комната 3</p>
                </div>
            </div>
        </Container>
    )
}

export default Contacts