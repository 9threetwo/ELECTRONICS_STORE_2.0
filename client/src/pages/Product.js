import { Container, Row, Col, Button, Image, Spinner, Table } from 'react-bootstrap'
import { useEffect, useState, useContext } from 'react'
import { fetchOneProduct, fetchProdRating } from '../http/catalogAPI.js'
import { useParams } from 'react-router-dom'
import { append } from '../http/basketAPI.js'
import { AppContext } from '../components/AppContext.js'

const Product = () => {
    const { id } = useParams()
    const { basket } = useContext(AppContext)
    const [product, setProduct] = useState(null)
    const [rating, setRating] = useState(null)

    useEffect(() => {
        fetchOneProduct(id).then(data => setProduct(data))
        fetchProdRating(id).then(data => setRating(data))
    }, [id])

    const handleClick = (productId) => {
        append(productId).then(data => {
            basket.products = data.products
        })
    }

    if (!product) {
        return <Spinner animation="border" />
    }

    return (
        <Container>
            <Row className="mt-3 mb-3">
                <Col lg={4}>
                    {product.image ? (
                        <Image width={300} height={300} src={process.env.REACT_APP_IMG_URL + product.image} />
                    ) : (
                        <Image width={300} height={300} src="http://via.placeholder.com/300" />
                    )}
                </Col>
                <Col lg={8}>
                    <h1>{product.name}</h1>
                    <h3>{product.price}.00 руб.</h3>
                    <p>Бренд: {product.brand.name}</p>
                    <p>Категория: {product.category.name}</p>
                    {/*<div>*/}
                    {/*    {rating ? (*/}
                    {/*        <p>Рейтинг: {rating.rating}, голосов {rating.votes}</p>*/}
                    {/*    ) : (*/}
                    {/*        <Spinner animation="border" />*/}
                    {/*    )}*/}
                    {/*</div>*/}
                    <Button onClick={() => handleClick(product.id)}>Добавить в корзину</Button>
                </Col>
            </Row>
            {!!product.props.length &&
                <Row>
                    <Col>
                        <h3>О товаре: </h3>
                        <p>Betrayed agreement manor thing discretion. Surprise going ecstatic formal. Itself conduct themselves daughter cold sons upon. Court pure surrounded supposing scale horses this promise thirty curiosity witty warrant. Limits although grave which increasing attempt often. </p>

                        <p>Lasting our moderate danger high concerns tall snug possession wished about vicinity show solicitude answer wholly. Themselves enjoy husbands companions moonlight provided confined thrown wound. Death end on wicket handsome suitable. Make motionless formed. Water parish greater raillery behaviour we doubtful sake perpetual ferrars. </p>

                        <p>Oppose fat preference welcome discretion tolerably power written particular summer worth decay. Regret arranging delicate deal debating arrived elinor nature daughters next elegance. </p>
                        <h3>Характеристики</h3>
                            <Table bordered hover size="sm">
                                <tbody>
                                    {product.props.map(item => 
                                        <tr key={item.id}>
                                            <td>{item.name}</td>
                                            <td>{item.value}</td>
                                        </tr>
                                    )}
                                </tbody>
                            </Table>
                    </Col>
                </Row>
            }
        </Container>
    )
}

export default Product