# create a client key named as client.key
openssl genrsa -out client_cert.key 2048

# create a csr
openssl req -new -key client_cert.key -out client_cert.csr -config req-client.cnf

# create a client certificate for 365 days.
openssl x509 -req -in client_cert.csr -CA root-ca.pem -CAkey root-ca.key -CAcreateserial -out client_cert.crt -days 365 -extfile req-client.cnf -extensions v3_req

# validate the certificate
openssl x509 -in client_cert.crt -text -noout