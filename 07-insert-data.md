# သင်ခန်းစာ ၇ — Data အသစ် ထည့်သွင်းခြင်း (INSERT INTO)

![INSERT INTO Illustration](images/lesson07.png)

ဖန်တီးထားသော Table ဇယားများထဲသို့ Data အသစ်များကို `INSERT INTO` အသုံးပြုပနာ စနစ်တကျ ထည့်သွင်းနည်း ဖြစ်ပါတယ်။
(INSERT) ကို လေ့လာသွားပါဖို့။

**ခန့်မှန်း ကြာချိန် - မိနစ် ၂၀**

---

## 🎨 INSERT Command အလုပ်လုပ်ပုံ visual Diagram

```
┌─────────────────────────────────────────────────────────────────────────┐
│                          INSERT INTO Operation                          │
├─────────────────────────────────────────────────────────────────────────┤
│  BEFORE (ယခင် တည်ရှိပြီး ဒေတာ):                                        │
│  +----+------------+-------------------+                                │
│  | id | name       | email             |                                │
│  +----+------------+-------------------+                                │
│  | 1  | U Ba       | uba@gmail.com     |                                │
│  | 2  | Daw Hla    | hla@gmail.com     |                                │
│  +----+------------+-------------------+                                │
│                                                                         │
│  INSERT Command Run လိုက်ချိန်:                                         │
│  INSERT INTO customers (name, email) VALUES ('Ko Aung', 'aung@e.com');  │
│                                                                         │
│  AFTER (Data အသစ် ထပ်တိုးလာပုံ):                                       │
│  +----+------------+-------------------+                                │
│  | id | name       | email             |                                │
│  +----+------------+-------------------+                                │
│  | 1  | U Ba       | uba@gmail.com     |                                │
│  | 2  | Daw Hla    | hla@gmail.com     |                                │
│  | 3  | Ko Aung    | aung@e.com        |  ◄── [DATA အသစ် အောက်နားမာ တိုးလာသည်]│
│  +----+------------+-------------------+                                │
└─────────────────────────────────────────────────────────────────────────┘
```

---

## 💡 INSERT Command ရေးသားပုံ အခြေခံ

```sql
INSERT INTO table_name (column1, column2, column3)
VALUES (value1, value2, value3);
```

### ရိုးရှင်းသော ဥပမာ -

```sql
INSERT INTO students (first_name, last_name, email, birth_date)
VALUES ('Alice', 'Wong', 'alice@email.com', '2000-05-15');
```

- `id` Column ကို ရိုက်ထည့်ရန် မလိုပါ (ယင်းသည် `AUTO_INCREMENT` ဖြစ်၍ MySQL မှ နံပါတ် 1, 2, 3... Auto ထည့်ပေးပါသည်)။
- စာသားနန့် ရက်စွဲ တန်ဖိုးများကို Single Quote (`'...'`) ထဲမာ ထည့်ရပါမည်။
- ရက်စွဲ Format မှာ `'YYYY-MM-DD'` ဖြစ်ပါသည်။

---

## 🚀 အဆင့် ၁ - အသုံးပြုမည့် Database ကို ရွေးပါ

```sql
USE shop;
```

---

## ⚡ အဆင့် ၂ - Data တန်း တစ်ကြောင်း ထည့်သွင်းခြင်း

```sql
INSERT INTO customers (first_name, last_name, email, phone, city)
VALUES ('Rachel', 'Green', 'rachel@email.com', '555-0200', 'Sittwe');
```

ထည့်သွင်းပြီးကြောင်း စစ်ဆေးရန် -

```sql
SELECT * FROM customers WHERE first_name = 'Rachel';
```

---

## 📊 အဆင့် ၃ - Data တန်း အများအပြား တစ်ပြိုင်နက် ထည့်သွင်းခြင်း (Multi-Row Insert)

```sql
INSERT INTO products (name, description, price, stock, category) VALUES
('T-Shirt',           'Cotton t-shirt, comfortable fit',       19.99,  100, 'Clothing'),
('Jeans',             'Classic blue jeans',                    49.99,   75, 'Clothing'),
('Sneakers',          'Casual sneakers for everyday wear',     69.99,   50, 'Footwear'),
('Winter Jacket',     'Warm jacket for cold weather',         129.99,   30, 'Clothing'),
('Cap',               'Baseball cap with adjustable strap',    14.99,  120, 'Accessories');
```

```
┌───────────────── MULTI-ROW INSERT visual Diagram ─────────────────┐
│                                                                   │
│  INSERT INTO products (name, price, stock, category) VALUES       │
│    ├── ('T-Shirt',  19.99, 100, 'Clothing'),                      │
│    ├── ('Jeans',    49.99,  75, 'Clothing'),                      │
│    └── ('Cap',      14.99, 120, 'Accessories');                   │
│                                                                   │
│  ရလဒ် ဇယား:                                                        │
│  +----+---------+-------+-------+-------------+                   │
│  | id | name    | price | stock | category    |                   │
│  +----+---------+-------+-------+-------------+                   │
│  | 1  | T-Shirt | 19.99 | 100   | Clothing    |                   │
│  | 2  | Jeans   | 49.99 | 75    | Clothing    |                   │
│  | 3  | Cap     | 14.99 | 120   | Accessories |                   │
│  +----+---------+-------+-------+-------------+                   │
└───────────────────────────────────────────────────────────────────┘
```

---

## ⚠️ INSERT ပြုလုပ်ရာမာ တွေ့ရတတ်သော အမှားများ

| အမှားအယွင်း | မှားယွင်းသော ရေးသားပုံ | မှန်ကန်သော ရေးသားပုံ |
|---|---|---|
| စာသားမာ Single Quote မပါခြင်း | `VALUES (John)` | `VALUES ('John')` |
| ရက်စွဲ Format မှားခြင်း | `VALUES ('15/05/2000')` | `VALUES ('2000-05-15')` |
| ကော်မာ (,) ဖြုတ်ကျန်ခဲ့ခြင်း | `VALUES ('Alice' 'Bob')` | `VALUES ('Alice', 'Bob')` |

---

## 🖥️ Workbench Visual ဖြင့် Data ထည့်သွင်းနည်း

၁. Left Panel မှ Table ပေါ် Right-click ထိပနာ **"Select Rows — Limit 1000"** ကို နှိပ်ပါ။
၂. အောက်ဆုံးဟိ အလွတ် အတန်းမာ တန်ဖိုးများကို စာရိုက် ရိုက်ထည့်ပါ။
၃. ထိပ်ပိုင်း လက်ညာဘက်ဟိ **"Apply"** ခလုတ်ကို နှိပ်ပါ။

---

## 📝 လေ့ကျင့်ခန်း (Exercise)

၁. `customers` Table ထဲသို့ ဝယ်သူ အသစ် (၃) ယောက် ထည့်ပါ။
၂. `products` Table ထဲသို့ ကုန်ပစ္စည်း အသစ် (၅) မျိုး ထည့်ပါ။
၃. စစ်ဆေးရန် `SELECT COUNT(*) FROM customers;` ကို Run ကြည့်ပါ။

---

## ➡️ နောက်ထပ် သွားရမည့် အဆင့်

Data အသစ်များ ထည့်သွင်းပြီးပြီ ဖြစ်လို့ ယင်း Data များကို အဆင့်မြင့် နည်းလမ်းများဖြင့် စစ်ထုတ် ဖတ်ယူနည်း (SELECT) ကို ဆက်လက် လေ့လာကြပါစို့။

→ [သင်ခန်းစာ ၈: Data ဖတ်ယူခြင်း (SELECT)](08-select-data.md)
