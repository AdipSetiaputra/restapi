-- Database Schema untuk RestAPI Menu
-- Database: PostgreSQL (Neon Console)
-- Created: 2026-04-02

-- Create menus table with UUID
CREATE TABLE menus (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    name VARCHAR(255) NOT NULL,
    description TEXT,
    price DECIMAL(10, 2) NOT NULL,
    category VARCHAR(100),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Add comments to table and columns
COMMENT ON TABLE menus IS 'Tabel untuk menyimpan data menu restoran';
COMMENT ON COLUMN menus.id IS 'Primary key auto increment';
COMMENT ON COLUMN menus.name IS 'Nama menu (wajib diisi)';
COMMENT ON COLUMN menus.description IS 'Deskripsi menu (opsional)';
COMMENT ON COLUMN menus.price IS 'Harga menu (wajib diisi, positif)';
COMMENT ON COLUMN menus.category IS 'Kategori menu (opsional)';
COMMENT ON COLUMN menus.created_at IS 'Timestamp saat data dibuat';
COMMENT ON COLUMN menus.updated_at IS 'Timestamp saat data diupdate';

-- Create index untuk pencarian cepat
CREATE INDEX idx_menus_name ON menus(name);
CREATE INDEX idx_menus_category ON menus(category);
CREATE INDEX idx_menus_price ON menus(price);

-- Insert sample data with RANDOM UUID
INSERT INTO menus (name, description, price, category) VALUES
('Nasi Goreng Special', 'Nasi goreng dengan telur dan ayam', 25000, 'Makanan'),
('Mie Goreng', 'Mie goreng dengan sayuran', 22000, 'Makanan'),
('Es Teh Manis', 'Teh manis dingin', 5000, 'Minuman'),
('Kopi Hitam', 'Kopi hitam panas', 8000, 'Minuman'),
('Sate Ayam', 'Sate ayam 10 tusuk dengan bumbu kacang', 30000, 'Makanan');

-- Verifikasi data
SELECT * FROM menus;
