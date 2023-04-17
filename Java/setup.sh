#!/bin/sh

javac Calculate.java

cat << EOT > calculate
#!/bin/sh

java --class-path Java Calculate \$@
EOT

chmod +x calculate