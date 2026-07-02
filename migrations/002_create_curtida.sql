CREATE TABLE IF NOT EXISTS curtidas (
    id_curtida INT PRIMARY KEY AUTO_INCREMENT,
    id_usuario INT NOT NULL,
    id_postagem INT NOT NULL,
    data_curtida DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario) ON DELETE CASCADE,
    FOREIGN KEY (id_postagem) REFERENCES postagens(id_postagem) ON DELETE CASCADE,
    UNIQUE KEY unique_curtida (id_usuario, id_postagem)
);
