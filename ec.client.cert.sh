# create a client key named as client.key
openssl ecparam -name prime256v1 -genkey -noout -out ec_private_key.pem

# create a csr
openssl req -new -key ec_private_key.pem -out ec_client_cert.csr -config req-client.cnf 

# create a client certificate for 365 days.
openssl x509 -req -in ec_client_cert.csr -CA root-ca.pem -CAkey root-ca.key -CAcreateserial -out ec_client_cert.crt -days 365 -extfile req-client.cnf -extensions v3_req

# validate the certificate
openssl x509 -in ec_client_cert.crt -text -noout
