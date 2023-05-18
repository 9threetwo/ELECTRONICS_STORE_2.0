import React from 'react'
import {Container, Row, Col} from 'react-bootstrap'



function Footer() {
    return (
        <footer>
            <Container>
                <Row>
                    <Col className="ml-auto">
                        <div className='text-center text-white p-3' > © 2023 Created by Sofya Govorova 
                            <div className2='text-white'> <a href='https://github.com/9threetwo/ELECTRONICS_STORE_2.0'>github.com/9threetwo
                            </a></div>
                        </div>
                    </Col>
                </Row>
            </Container>
        </footer>
    )
}

export default Footer;