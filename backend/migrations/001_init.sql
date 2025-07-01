-- PostgreSQL schema for rehearsal scheduler
CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  email VARCHAR(100) UNIQUE NOT NULL,
  name VARCHAR(100),
  password_hash VARCHAR(255),
  role VARCHAR(20),
  created_at TIMESTAMP DEFAULT now()
);

CREATE TABLE bands (
  id SERIAL PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  owner_id INTEGER REFERENCES users(id),
  created_at TIMESTAMP DEFAULT now()
);

CREATE TABLE band_members (
  id SERIAL PRIMARY KEY,
  band_id INTEGER REFERENCES bands(id),
  user_id INTEGER REFERENCES users(id),
  instrument VARCHAR(50),
  joined_at TIMESTAMP DEFAULT now()
);

CREATE TABLE rehearsals (
  id SERIAL PRIMARY KEY,
  band_id INTEGER REFERENCES bands(id),
  start_time TIMESTAMP,
  end_time TIMESTAMP,
  location VARCHAR(100),
  status VARCHAR(20),
  created_by INTEGER REFERENCES users(id)
);

CREATE TABLE attendance (
  id SERIAL PRIMARY KEY,
  rehearsal_id INTEGER REFERENCES rehearsals(id),
  user_id INTEGER REFERENCES users(id),
  status VARCHAR(20),
  responded_at TIMESTAMP
);

CREATE TABLE messages (
  id SERIAL PRIMARY KEY,
  band_id INTEGER REFERENCES bands(id),
  sender_id INTEGER REFERENCES users(id),
  content TEXT,
  sent_at TIMESTAMP DEFAULT now()
);