while IFS=';' read -ra VN; do
    echo "${VN[5]}";
done <<< `vnstat --oneline`
