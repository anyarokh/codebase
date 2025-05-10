import sqlite3
import json
import os

# Шлях до БД
DB_FILE = 'D:\diploma\code\website\db\morphology.db'

# Тека, куди будуть збережені JSON-файли
EXPORT_FOLDER = 'json_exports'

conn = sqlite3.connect(DB_FILE)
cursor = conn.cursor()

# Отримуємо список усіх таблиць у базі даних
cursor.execute("SELECT name FROM sqlite_master WHERE type='table';")
tables = [row[0] for row in cursor.fetchall()] # Збираємо імена таблиць у список

print(f"📋 Знайдено таблиці: {tables}")

# Створюємо папку для експорту, якщо вона ще не існує
os.makedirs(EXPORT_FOLDER, exist_ok=True)

# Перебираємо всі таблиці
for table_name in tables:
    if table_name.startswith('sqlite_'):  # Пропускаємо службові таблиці SQLite
        print(f"⚠️ Пропущено системну таблицю: {table_name}")
        continue

    print(f"📦 Експорт таблиці: {table_name}...")

    cursor.execute(f"SELECT * FROM {table_name}")
    rows = cursor.fetchall()

    # Якщо таблиця порожня — повідомляємо та переходимо до наступної
    if not rows:
        print(f"⚠️ Таблиця '{table_name}' не містить даних.")
        continue

    # Отримуємо назви стовпців
    col_names = [description[0] for description in cursor.description]

    # Створюємо список словників для кожного рядка
    data = [dict(zip(col_names, row)) for row in rows]

    # Формуємо шлях до файлу JSON для збереження
    output_file = f"{EXPORT_FOLDER}/{table_name}.json"

    # Записуємо дані у файл у форматі JSON
    with open(output_file, "w", encoding='utf-8') as f:
        json.dump(data, f, indent=2)

    print(f"✅ Записано {len(data)} рядків у файл {output_file}")

conn.close()

