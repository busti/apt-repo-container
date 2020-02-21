inotifywait -m /data -e create -e moved_to |
  while read path file; do
    if [[ "$file" =~ .*deb$ ]]; then
      echo "Reading '$file'"
      reprepro -b /app/htdocs/apt/ includedeb trusty "$path"
    fi
  done