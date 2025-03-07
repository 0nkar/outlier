function decipher(encryptedText, knownWord) {
    for (let shift = 0; shift < 26; shift++) {
        let decrypted = encryptedText.split('').map(char => {
            if (char.match(/[a-z]/i)) {
                let base = char === char.toUpperCase() ? 65 : 97;
                return String.fromCharCode(((char.charCodeAt(0) - base - shift + 26) % 26) + base);
            }
            return char;
        }).join('');

        if (decrypted.includes(knownWord)) {
            return decrypted;
        }
    }
    return '';
}
