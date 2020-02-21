mv /app/conf /out
reprepro -Vb /out export

inotifywait -m /in -e create -e moved_to |
  while read path action file; do
    if [[ "$file" =~ .*deb$ ]]; then
      echo "found '$file' via '$action' in '$path'"
      sleep 10
      reprepro -b /out includedeb trusty "$path$file"
    fi
  done