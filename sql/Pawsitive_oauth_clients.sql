create table oauth_clients
(
    client_id     text not null,
    client_secret text not null,
    redirect_uri  text not null
);

INSERT INTO Pawsitive.oauth_clients (client_id, client_secret, redirect_uri) VALUES ('app', 'app123', '/');