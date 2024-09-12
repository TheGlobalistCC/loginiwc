document.getElementById('dataForm').addEventListener('submit', async (event) => {
    event.preventDefault();
    const data = document.getElementById('data').value;

    const response = await fetch('/api/encrypt', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json',
        },
        body: JSON.stringify({ data }),
    });

    const result = await response.json();
    document.getElementById('response').innerText = `Encriptado: ${result.encrypted}\nDesencriptado: ${result.decrypted}`;
});
