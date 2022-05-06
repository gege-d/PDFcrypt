# PDFcrypt

This is a program to encrypt and decrypt PDFs.
If you select an encrypted file, it will be decrypted, if you select a non-encrypted PDF file, it will be encrypted.

## Getting Started

### Installing

Download the installer from [here](https://github.com/Georg-007/PDFcrypt/releases/download/v3.0/PDFcrypt-Installer.exe) and run it. Follow the instructions there.
You can also use the portable version stored in [PDFcrypt.exe](bin/PDFcrypt.exe).

## Deployment

The binary was built with pyinstaller and the auto-py-to-exe gui. The configuration ist stored in [comp.json](comp.json) (You will have to update the paths to match your files' locations.).
Alternatively, you can run the python source directly, make sure to install dependencies with
```
pip install -r requirements.txt
```
in the repository.

## Contributing

Please read [CONTRIBUTING.md](CONTRIBUTING.md) for details on our code of conduct, and the process for submitting pull requests to us.

## License

This project is licensed under the Unlicense - see the [LICENSE.md](LICENSE.md) file for details.
