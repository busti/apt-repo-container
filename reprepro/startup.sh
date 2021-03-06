mv /app/conf /out
reprepro -Vb /out export

inotifywait -m /in -e create -e moved_to |
  while read path action file; do
    if [[ "$file" =~ .*deb$ ]]; then
      echo "found '$file' via '$action' in '$path'"
      for i in {1..3600}; do
        res=$( reprepro -b /out includedeb trusty "$path$file" 2>&1 )
        echo "reprepro returned: '$res'"
        if [[ $res =~ "error" ]]; then
          echo "retrying"
          sleep 1
        else
          echo "successfully added package"
          echo "removing artifact: '$path$file'"
          rm "$path$file"
          break
        fi
      done
    fi
  done
