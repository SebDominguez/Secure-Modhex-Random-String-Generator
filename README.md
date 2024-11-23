# Secure-Modhex-Random-String-Generator

**modhexgen** is a lightweight Bash script for generating [Modhex](https://docs.yubico.com/yesdk/users-manual/application-otp/modhex.html) random strings.
## Features
- Generates random Modhex strings of specified lengths.
- That's it.

## Installation
Curl the script to your local system:
```bash
curl -O https://raw.githubusercontent.com/SebDominguez/Secure-Modhex-Random-String-Generator/refs/heads/main/modhexgen.sh
chmod +x modhexgen.sh
```

## Usage
Run the script directly from your terminal:

### Generate a 32 random ModHex string
```bash
./modhexgen.sh
```

### Generate an arbitrary sized random Modhex string
```bash
./modhexgen.sh -s <size>
```

Replace `<size>` with the desired length of the random Modhex string. Acceptable varues are from 1 to 4096.

### Generate only lower case Mod Hex
```bash
./modhexgen.sh -l
```

### Generate only upper case Mod Hex
```bash
./modhexgen.sh -u
```

Note: `-u` and `-l` options are mutualy exclusive.

## License
This project is licensed under the [Good Luck With That Shit Public License (GLWTPL)](./LICENSE).

## Contributions
Feel free to open an issue or submit a pull request so I can ignore them.
