// URL to fetch
const url = 'https://billysitefunctapp.azurewebsites.net/api/API?code=EiOcNbK2W7B5rfWTxmWRKywAKCy28A1Tx44ELYH5ZgsAAzFuUKLGUQ==';

document.addEventListener('DOMContentLoaded', function () {
    // Fetch data
    fetch(url)
        .then(response => {
            if (!response.ok) {
                throw new Error('Network response was not ok'); // error no response
            }
            return response.text();
        })
        .then(data => {
            const resultElement = document.getElementById('result');
            resultElement.textContent = data; // Display the data in plain text
        })
        .catch(error => {
            console.error('Error fetching data:', error); // error no data
        });
});
