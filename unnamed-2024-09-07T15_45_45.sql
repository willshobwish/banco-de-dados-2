CREATE TABLE images (
    id NOT NULL,
    overall_description NULL,
    filename NULL,
    NULL,
    PRIMARY KEY (id)
);

CREATE TABLE segments (
    id INT NOT NULL,
    filename NULL,
    description NULL,
    id_image NOT NULL,
    PRIMARY KEY (id)
);

ALTER TABLE segments
ADD CONSTRAINT FK_images_TO_segments FOREIGN KEY (id_image) REFERENCES images (id);