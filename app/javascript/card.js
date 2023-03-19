const pay = () => {
  const payjp = Payjp(process.env.PAYJP_PUBLIC_KEY);      //テスト公開鍵を環境変数で呼び出し
  const elements = payjp.elements();
  const numberElement = elements.create('cardNumber');    //番号のフォーム
  const expiryElement = elements.create('cardExpiry');    //有効期限のフォーム
  const cvcElement = elements.create('cardCvc');          //cvcのフォーム

  numberElement.mount('#number-form');
  expiryElement.mount('#expiry-form');
  cvcElement.mount('#cvc-form');

  const submit = document.getElementById("button");

  submit.addEventListener("click", (e) => {
    e.preventDefault();                                   //フォーム送信処理をキャンセルする
    payjp.createToken(numberElement).then(function (response) {
      if (response.error) {
      } else {
        const token = response.id;   //ここでトークン値を取得
        const renderDom = document.getElementById("charge-form");
        const tokenObj = `<input value=${token} name='token' type="hidden">`;
        renderDom.insertAdjacentHTML("beforeend", tokenObj);
      }
    numberElement.clear();
    expiryElement.clear();
    cvcElement.clear();
    document.getElementById("charge-form").submit(); //htmlファイルのform_withのid。フォームの情報をサーバーサイドに送信する処理がこれ。15行目をキャンセルしたので
    });
  });
};

window.addEventListener("load", pay);