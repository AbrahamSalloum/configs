CIPHERS=(aes128-ctr, aes128-gcm@openssh.com, aes192-ctr, aes256-ctr, aes256-gcm@openssh.com, chacha20-poly1305@openssh.com)
# Test each cipher 3 times with 100GB file
for i in `seq 1 3`; do
    for CIPHER in "${CIPHERS[@]}"; do
        echo "Test ${i} for 100GB file with cipher: ${CIPHER}"
        scp -o Ciphers=$CIPHER 10G localhost:/dev/null
    done
done
# Test each cipher 3 times with 5GB file
for i in `seq 1 3`; do
    for CIPHER in "${CIPHERS[@]}"; do
        echo "Test ${i} for 5GB file with cipher: ${CIPHER}"
        scp -o Ciphers=$CIPHER 5G localhost:/dev/null
    done
done
