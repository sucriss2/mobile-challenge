import UIKit

var greeting = "Hello, playground"

//Address
//https://api.github.com/search/repositories?q=language:Java&sort=stars&page=1

//first step
//Criar entidade que represente o json na aplicacao.

struct RepositoryResponse: Codable {
    var totalCount: Int
}


struct REST {
    
    
}

//============================
//APENDICE
//============================

//Como decodificar um JSON em um entidade/modelo

do {
    let jsonString = """
    {
        "total_count": 123456
    }
"""
    
    //1. Instanciar um objeto JsonDecoder
    let decoder = JSONDecoder()
    
    //2. Configurar para converter de snake_case para camelCase
    decoder.keyDecodingStrategy = .convertFromSnakeCase
    
    //3. Converter a string do Json para um objeto do tipo data. Adicional
    let jsonData = jsonString.data(using: .utf8)! // (! forced uwrap - desempacotamento força, apenas pra exclicacao)
    
    //4. Converter Json data em um objeto do tipo RepositoryResponse.
    do{
        let repositoryResponse = try decoder.decode(RepositoryResponse.self, from: jsonData)
        print(repositoryResponse)
    } catch {
        print(error.localizedDescription)
    }
    
    
}

//============================
//APENDICE
//============================

//Como codificar um modelo para um Json Data

do {
    
    //1. Instanciar o objeto JSONEncoder
    let encoder = JSONEncoder()
    
    //2.Configurar para converter de camelCase para snake_case
    encoder.keyEncodingStrategy = .convertToSnakeCase
    
    //3.Criar um objeto para converter ao JSon. (adicional)
    let object = RepositoryResponse(totalCount: 1234)
    
    //4.converter o objeto em data para Json
    do {
        let jsonData = try encoder.encode(object)
        print(jsonData)
        
        //Converter data em string
        let string = String(data: jsonData, encoding: .utf8)
        print(string!)
    } catch {
        print(error.localizedDescription)
    }
    
}
