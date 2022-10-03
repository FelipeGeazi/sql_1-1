CREATE TABLE IF NOT EXISTS usuarios (
 id BIGSERIAL PRIMARY KEY,
 nome VARCHAR(100) NOT NULL,
 apelido VARCHAR(50),
 idade INTEGER NOT NULL
);

CREATE TABLE IF NOT EXISTS enderecos (
 id BIGSERIAL PRIMARY KEY,
 pais VARCHAR(150) NOT NULL,
 usuario_id INTEGER UNIQUE NOT NULL,
 FOREIGN KEY (usuario_id) REFERENCES usuarios(id)
);

INSERT INTO
 usuarios (nome, apelido, idade)
VALUES
 ('Roberto', 'Beto', 22),
 ('Vinicius', 'Vini', 20);

INSERT INTO
 enderecos (pais, usuario_id)
VALUES
 ('Brasil', 1),
 ('Canadá', 2);

SELECT
 *
FROM
 enderecos AS e
 JOIN usuarios u ON e.usuario_id = u.id
WHERE
 u.id = 1;

SELECT
 e.pais,
 u.nome,
 u.apelido,
 u.idade
FROM
 enderecos e
 JOIN usuarios u ON e.usuario_id = u.id
WHERE
 u.id = 2;