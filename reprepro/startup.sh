inotifywait -m /in -e create -e moved_to |
  while read path file; do
    if [[ "$file" =~ .*deb$ ]]; then
      echo "Reading '$file'"
      reprepro -b /out/apt/ includedeb trusty "$path"
    fi
  done