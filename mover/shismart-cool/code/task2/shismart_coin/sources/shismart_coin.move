/*
/// Module: shismart_coin
module shismart_coin::shismart_coin {

}
*/
module shismart_coin::shismart_coin {
    use sui::coin::{Self, Coin, TreasuryCap};
    public struct SHISMART_COIN has drop {}
    fun init(witness: SHISMART_COIN, ctx: &mut TxContext) {
        let (treasury, metadata) = coin::create_currency(
            witness,
            6,                // decimals
            b"shismart COIN",           // symbol
            b"shismart COIN",       // name
            b"Amazing Coin", // description
            option:: none(),   // icon url
            ctx
        );
        transfer::public_freeze_object(metadata);
        transfer::public_transfer(treasury, tx_context::sender(ctx));
    }

    public entry fun mint(
        treasury_cap: &mut TreasuryCap<SHISMART_COIN>,
        amount: u64,
        recipient: address,
        ctx: &mut TxContext
    ) {
        coin::mint_and_transfer(treasury_cap, amount, recipient, ctx);
    }
    public entry fun burn(treasury_cap: &mut TreasuryCap<SHISMART_COIN>, coin: Coin<SHISMART_COIN>) {
        coin::burn(treasury_cap, coin);
    }
}