#!/bin/bash
### Copyright 1999-2017. Plesk International GmbH. All rights reserved.

cd `dirname $0`

rm -rf CONTRIBUTING.md
rm -rf DEVELOPMENT_README.md
rm -rf INSTALL.md
rm -rf README-GIT.md
rm -rf README.md
rm -rf Vagrantfile
rm -rf bin
rm -rf build.sh
rm -rf demos
rm -rf documentation
rm -rf puppet
rm -rf resources
rm -rf tests

pushd library
    echo "Remove some unused components..."
    rm -rf Zend/Amf
    rm -rf Zend/Barcode
    rm -rf Zend/Captcha
    rm -rf Zend/Cloud
    rm -rf Zend/CodeGenerator
    rm -rf Zend/Dojo
    rm -rf Zend/Measure
    rm -rf Zend/Mobile
    rm -rf Zend/Pdf
    rm -rf Zend/Search
    rm -rf Zend/Service
    rm -rf Zend/Tool

    echo "Remove require_once..."
    find . -name '*.php' -not -wholename '*/Loader/Autoloader.php' \
    -not -wholename '*/Application.php' -not -wholename '*/Loader.php' \
    -print0 | \
    xargs -0 sed --regexp-extended -i -e 's/(require_once)/;\/\/ \1/g'
popd
