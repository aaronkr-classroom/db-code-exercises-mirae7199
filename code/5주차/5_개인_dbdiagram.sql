
TABLE UserAccount {
    user_id INT
    email VARCHAR
    password VARCHAR
    created_at timestamp
}

TABLE Character {
    charactor_id INT
    user_id INT
    name VARCHAR
    level INT
    class VARCHAR
}

TABLE Item {
    item_id INT
    name VARCHAR
    type VARCHAR
}

TABLE Inventory {
    character_id INT
    item_id INT
    quantity INT
    indexes {
        (character_id, item_id)
    } 
}



Ref: Character.user_id > UserAccount.user_id
Ref: Inventory.charactor_id > Character.charactor_id
Ref: Inventory.item_id > Item.item_id
