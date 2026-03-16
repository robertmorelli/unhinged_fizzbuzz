yes '' | nl --body-numbering a | sed -e '3~3s/.*/fizz/' -e '5~5s/.*/buzz/' -e '15~15s/.*/fizzbuzz/'
