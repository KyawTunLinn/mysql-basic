# သင်ခန်းစာ ၈ — Data ဖတ်ယူခြင်း (SELECT)

![Advanced SELECT Data Illustration](images/lesson08.svg)

ဤသင်ခန်းစာမာ SQL ၏ အရေးအပါဆုံးနှင့် အသုံးအများဆုံး Command ဖြစ်သော **SELECT** Statement ကို ကျွမ်းကျင်စွာ အသုံးပြုနည်း လေ့လာသွားပါမည်။

**ခန့်မှန်း ကြာချိန် - မိနစ် ၃၀**

---

##  SELECT အလုပ်လုပ်ပုံ visual Diagram


---

##  အဆင့် ၁ - Column အားလုံး ထုတ်ကြည့်ခြင်း (`SELECT *`)

```sql
SELECT * FROM customers;
```

`*` မှာ "Column အားလုံး" ဟု အဓိပ္ပာယ် ရပါသည်။

---

##  အဆင့် ၂ - သီးသန့် Column များကိုသာ ထုတ်ကြည့်ခြင်း

```sql
SELECT first_name, last_name, email FROM customers;
```

---

##  အဆင့် ၃ - Column များကို အမည်သစ် (Alias) ပေးခြင်း (`AS`)

`AS` ကို သုံးပြီးလျှင် ထွက်လာသော ရလဒ် Column အမည်ကို ပြောင်းလဲ ပြသနိုင်ပါတယ် -

```sql
SELECT first_name AS name, email AS contact FROM customers;
```

| name | contact |
|---|---|
| U Ba | uba@gmail.com |
| Daw Hla | hla@gmail.com |

---

##  အဆင့် ၄ - Query ထဲမာ တွက်ချက်မှုများ ပြုလုပ်ခြင်း

```sql
SELECT name, price, stock, price * stock AS total_value FROM products;
```

`price * stock` ကို တွက်ချက်ပြီးလျှင် `total_value` အမည်ဖြင့် Column အသစ် တိုးပြီးလျှင် ပြသပေးပါမည်။

---

##  အဆင့် ၅ - စာသားများ ပေါင်းစပ်ခြင်း (`CONCAT`)

```sql
SELECT CONCAT(first_name, ' ', last_name) AS full_name, city FROM customers;
```

| full_name | city |
|---|---|
| U Ba | Yangon |
| Daw Hla | Mandalay |

---

##  အဆင့် ၆ - ထပ်နေသော Data များကို ရှင်းထုတ်ခြင်း (`DISTINCT`)

```sql
SELECT DISTINCT city FROM customers;
```


---

##  အဆင့် ၇ - Data အတန်း အရေအတွက် ရေတွက်ခြင်း (`COUNT`)

```sql
SELECT COUNT(*) FROM customers;
```

---

##  အဆင့် ၈ - NULL (အလွတ် တန်ဖိုး) များကို စစ်ဆေးခြင်း

MySQL တွင် Data အလွတ် ဖြစ်နေသည်ကို `NULL` ဟု သတ်မှတ်ပါတယ်။

```sql
-- Phone နံပါတ် အလွတ် ဖြစ်နေသူများကို ရှာရန်
SELECT * FROM customers WHERE phone IS NULL;

-- Phone နံပါတ် ပါရှိသူများကို ရှာရန်
SELECT * FROM customers WHERE phone IS NOT NULL;
```

 `= NULL` သို့ `= ''` ဟု ရေးလို့ မရပါ! မဖြစ်မနေ `IS NULL` သို့မဟုတ် `IS NOT NULL` ဟု ရေးရပါမည်။

---

##  လေ့ကျင့်ခန်း (Exercise)

၁. Products ထဲမှ ပစ္စည်း အမည်နှင့် စျေးနှုန်းများကို ထုတ်ပြပါ။
၂. ကုန်ပစ္စည်းများကို ၁၀% လျှော့စျေး တွက်ချက်ပြပါ - `price * 0.9 AS discounted_price`
၃. Customers ထဲမာ Phone နံပါတ် မရှိသော သူများကို ရှာပါ။

---

##  နောက်ထပ် သွားရမည့် အဆင့်

Data ဖတ်ယူနည်းကို လေ့လာပြီးပြီ ဖြစ်လို့ ရှိပြီးသား Data များကို ပြင်ဆင်ခြင်း (UPDATE) နှင့် ဖျက်ပစ်ခြင်း (DELETE) များကို ဆက်လက် လေ့လာကြပါစို့။

-> [သင်ခန်းစာ ၉: Data ပြင်ဆင်ခြင်းနှင့် ဖျက်ပစ်ခြင်း](09-update-delete.md)
