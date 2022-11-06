import React, {useState, useEffect} from "react";
import './App.css';
import 'bootstrap/dist/css/bootstrap.min.css';
import axios from 'axios';
import {Modal, ModalBody, ModalFooter, ModalHeader} from 'reactstrap';
import LogoNegativo from '.assets/LogoNegativo.png';

function App(){

    const baseUrl="https://localhost:7165/api/destino";

    const [data, setData] = useState([]);

    const pedidoGet = async()=>{
        await axios.get(baseUrl)
        .then(response => {
            setData(response.data);
        }).catch(error =>{
            console.log(error);
        })
    }

    useEffect(()=>{
        pedidoGet();
    })

  return (
    <div className="App">
        <br/>
        <h3>Cadastro e Leitura Destinos</h3>
      <header className="App-header">
        <img src="{LogoNegativo}" alt="Cadastro"/>
        <button className="btn btn-success">Cadastrar Novo Destino</button>
      </header>
    <table className="table table-bordered" >
        <thead>
            <tr>
                <th>DestinoId</th>
                <th>Local da Viagem</th>
                <th>Descrição</th>
                <th>ValorViagem</th>
                <th>Operações</th>
            </tr>
        </thead>
        <tbody>

            {data.map(destino=>(
                <tr key={destino.id}>
                    <td>{destino.id}</td>
                    <td>{destino.LocalViagem}</td>
                    <td>{destino.Descricao}</td>
                    <td>{destino.ValorViagem}</td>
                    <td>
                        <button className="btn btn-primary">Editar</button> {" "}
                        <button className="btn btn-dager">Excluir</button>
                    </td>
                </tr>
            ))}
        </tbody>
    </table>
    </div>
  );
}

export default App;