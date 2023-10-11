/* json 파일로드 외부 함수로 출력 */
function htmlview() {
  fetch('./data.json')
    .then(response => response.json())
    .then(data => {
      const pensions = data.penson_product;

      const productList = document.querySelector('#product');

      var htmlcode = "";

      for (const pension of pensions) {
        htmlcode += `
          <li onclick="resv('`+pension.a_wktitle+`','`+pension.a_wkpd+`')">
            <div>
              <span><img src="${pension.a_wkimg}"></span>
              <span>${pension.a_wktitle}</span>
              <span>${Number(pension.a_wkpd).toLocaleString()}원</span>
            </div>
          </li>
        `;
      }
      productList.innerHTML = htmlcode;
    });
}
htmlview();

function resv(nm, money){
	location.href="./m_reservation.jsp?pnm="+encodeURI(nm)+"&pmoney="+money;
}



/*
fetch('./data.json')
  .then(response => response.json())
  .then(data => {
    const pensions = data.penson_product;

    const productList = document.querySelector('.product');

    for (const pension of pensions) {
      const listItem = document.createElement('li');

      const div = document.createElement('div');

      const imgSpan = document.createElement('span');
      imgSpan.innerHTML = `<img src="${pension.a_wkimg}">`;

      const titleSpan = document.createElement('span');
      titleSpan.innerHTML = `${pension.a_wktitle}`;

      const priceSpan = document.createElement('span');
      priceSpan.innerHTML = `${pension.a_wkpd}원`;

      div.appendChild(imgSpan);
      div.appendChild(titleSpan);
      div.appendChild(priceSpan);

      listItem.appendChild(div);
      productList.appendChild(listItem);
    }
  });
*/
