/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */


document.addEventListener('DOMContentLoaded', function() {
    const links = document.querySelectorAll('.menu a');

    links.forEach(link => {
        link.addEventListener('click', function(e) {
            e.preventDefault();

            const url = this.getAttribute('href');
            fetch(url)
                .then(response => response.text())
                .then(data => {
                    document.querySelector('.conteudo').innerHTML = data;
                });
        });
    });
});