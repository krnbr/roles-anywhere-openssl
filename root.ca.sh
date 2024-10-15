# Create a root key, file named as root-ca.key.
openssl genrsa -out root-ca.key 2048
# validate the key.
openssl rsa -check -noout -in root-ca.key
# create root-ca
openssl req -x509 -new -nodes -key root-ca.key \
  -subj "/CN=Roles Anywhere Trust CA/O=Telstra Limited/ST=Victoria/L=Melbourne/C=AU" \
  -sha256 \
  -days "3650" \
  -extensions ca_ext \
  -config root-ca.cnf \
  -out root-ca.pem