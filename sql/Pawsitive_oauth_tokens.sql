create table oauth_tokens
(
    id                       int auto_increment,
    access_token             text     not null,
    access_token_expires_on  datetime not null,
    client_id                text     not null,
    refresh_token            text     not null,
    refresh_token_expires_on datetime not null,
    user_id                  int      not null,
    constraint oauth_tokens_id_uindex
        unique (id)
);

alter table oauth_tokens
    add primary key (id);

INSERT INTO Pawsitive.oauth_tokens (id, access_token, access_token_expires_on, client_id, refresh_token, refresh_token_expires_on, user_id) VALUES (1, '6fac54f9dc30c97a427dc4aa86ddfeca596f951a', '2020-10-26 02:23:15', 'app', '01aa21047d26f4c8164be00322e348b09efaaf3c', '2020-11-09 01:23:15', 1);
INSERT INTO Pawsitive.oauth_tokens (id, access_token, access_token_expires_on, client_id, refresh_token, refresh_token_expires_on, user_id) VALUES (2, 'c91ce2a7d5d7f7ab5e1f3229b5b67f413870b1ee', '2020-10-26 02:23:34', 'app', 'f8c5d67c20d655fb408b90b16f078138bce106db', '2020-11-09 01:23:34', 1);
INSERT INTO Pawsitive.oauth_tokens (id, access_token, access_token_expires_on, client_id, refresh_token, refresh_token_expires_on, user_id) VALUES (3, '3f3c727eab712c51a14d9863c1d6e04cac5cc1f5', '2020-10-26 02:25:32', 'app', '27e5594f70a80e22d0ee8b770c2648c9dda0e74f', '2020-11-09 01:25:32', 1);
INSERT INTO Pawsitive.oauth_tokens (id, access_token, access_token_expires_on, client_id, refresh_token, refresh_token_expires_on, user_id) VALUES (4, '5992d0bb8b9604ab9dc21a381b08d20552350ef7', '2020-10-26 02:30:42', 'app', 'a1b3a359b02c15e546368049e4c7060a5ff87217', '2020-11-09 01:30:42', 1);
INSERT INTO Pawsitive.oauth_tokens (id, access_token, access_token_expires_on, client_id, refresh_token, refresh_token_expires_on, user_id) VALUES (5, '3c138238f0458002623f7c89bc1cc39b9f1995d2', '2020-10-26 02:30:54', 'app', 'ab621826efd7e5f6052ef70d0d0fb5b71ae710f7', '2020-11-09 01:30:54', 1);
INSERT INTO Pawsitive.oauth_tokens (id, access_token, access_token_expires_on, client_id, refresh_token, refresh_token_expires_on, user_id) VALUES (6, 'ba4b5168083bb4be1173dcb2f51d8380cea57f0f', '2020-10-26 02:30:55', 'app', 'f7bdf9decbe3f54ff0bacaba7a69cac8c31e5e36', '2020-11-09 01:30:55', 1);
INSERT INTO Pawsitive.oauth_tokens (id, access_token, access_token_expires_on, client_id, refresh_token, refresh_token_expires_on, user_id) VALUES (7, 'a5912163695e847aeda31cc1264bf682bf243a26', '2020-10-26 02:30:56', 'app', '432d96ed58d1ea302a1cb2c374a77d33ae05e3a7', '2020-11-09 01:30:56', 1);
INSERT INTO Pawsitive.oauth_tokens (id, access_token, access_token_expires_on, client_id, refresh_token, refresh_token_expires_on, user_id) VALUES (8, '5f206ff4a6efe69e9cf68393b097633c207e8fec', '2020-10-26 02:31:24', 'app', '3ec8c18eeb0adc5d2ce7ff8e711cb25a14abcd58', '2020-11-09 01:31:24', 1);
INSERT INTO Pawsitive.oauth_tokens (id, access_token, access_token_expires_on, client_id, refresh_token, refresh_token_expires_on, user_id) VALUES (9, '19e4d802bb887caa87f3e30737d8667d0020b1b9', '2020-10-26 02:31:51', 'app', '633f9a8956bfd07e14a6114e25207aded6ecf7c4', '2020-11-09 01:31:51', 1);
INSERT INTO Pawsitive.oauth_tokens (id, access_token, access_token_expires_on, client_id, refresh_token, refresh_token_expires_on, user_id) VALUES (10, 'ffc0d49112b133c0751f15c607ff855b5b6e9c8e', '2020-10-26 02:32:09', 'app', 'd0a13838ae7f873bde0181587f21bd9187fea4e8', '2020-11-09 01:32:09', 1);
INSERT INTO Pawsitive.oauth_tokens (id, access_token, access_token_expires_on, client_id, refresh_token, refresh_token_expires_on, user_id) VALUES (11, '473f3441498a610776e544315d42286c7fab561b', '2020-10-26 13:15:14', 'app', '4517ad2e5e08cfb773f3507350acf77e0525a2c9', '2020-11-09 12:15:14', 1);
INSERT INTO Pawsitive.oauth_tokens (id, access_token, access_token_expires_on, client_id, refresh_token, refresh_token_expires_on, user_id) VALUES (12, '8d59f06174543330fd9a265f87cda73d7e03e0a2', '2020-11-01 12:47:47', 'app', 'e186a6d3666991a99eae16eaa07c901ffe5dc42a', '2020-11-15 11:47:47', 1);