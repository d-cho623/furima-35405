document.addEventListener('DOMContentLoaded', function(){
  if ( document.getElementById('item-image')){
    const ImageList = document.getElementById("image-list")

    // 選択した画像を表示する関数
    const createImageHTML = (blob, id) => {
      // 画像を表示するためのdiv要素を生成
      const imageElement = document.createElement('div');
      imageElement.setAttribute('class', "image-element")
      let imageElementNum = document.querySelectorAll('.image-element').length
      let imageElements = document.querySelectorAll('.image-element')

      // 表示する画像を生成
      const blobImage = document.createElement('img');
      blobImage.setAttribute('src', blob);
      blobImage.setAttribute('id', `image-${id}`)

      const imageContent = document.getElementById(`image-${id}`)
      if (imageContent){
        imageContent.remove();
        imageElements[id].appendChild(blobImage);
      }
      else{
        imageElement.appendChild(blobImage);
        ImageList.appendChild(imageElement);
      };

      
      const hoge = document.getElementById(`item_image_${id}`)


      // ファイル選択ボタンを生成
      const inputHTML = document.createElement('input')
      inputHTML.setAttribute('id', `item_image_${id}`)
      inputHTML.setAttribute('name', 'item[images][]')
      inputHTML.setAttribute('type', 'file')
      inputHTML.setAttribute('data-id', `${Number(id) + 1}`)

      // 生成したHTMLの要素をブラウザに表示させる

      if (!hoge){
      imageElement.appendChild(inputHTML)
      }
      inputHTML.addEventListener('change', (e) => {
        file = e.target.files[0];
        blob = window.URL.createObjectURL(file);
        const id = e.target.getAttribute('data-id')
        createImageHTML(blob, id)
      })
    };

    document.getElementById(`item-image`).addEventListener('change', function(e){

      const file = e.target.files[0];
      const id = e.target.getAttribute('data-id')
      const blob = window.URL.createObjectURL(file);
      createImageHTML(blob, id);
    });
  }
});