CREATE SCHEMA "data-managements";

CREATE TABLE "data-managements".daily_details (
    date DATE NOT NULL,
    rack_number CHAR(4) NOT NULL,
    difference INTEGER CHECK (difference >= -999999 AND difference <= 999999),
    game_count INTEGER CHECK (game_count >= 0 AND game_count <= 999999),
    PRIMARY KEY (date, rack_number)
);

INSERT INTO "data-managements".daily_details (date, rack_number, difference, game_count) VALUES
('2023-01-01', 'A001', -500, 300),
('2023-01-02', 'A002', 1000, 150),
('2023-01-03', 'A003', -250, 450);
