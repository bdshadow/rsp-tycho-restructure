#!/bin/bash
git clone https://github.com/redhat-developer/rsp-server.git
cd rsp-server
cd api
mkdir -p bundles/org.jboss.tools.rsp.api 
mkdir -p docs/org.jboss.tools.rsp.schema 
git mv META-INF src .classpath .gitignore .project build.properties pom.xml bundles/org.jboss.tools.rsp.api
git mv ../schema/* ../schema/.[!.]* docs/org.jboss.tools.rsp.schema
cd ../
rm -rf schema
mkdir -p client/jars/org.jboss.tools.rsp.client.cli 
git mv client-cli/* client-cli/.[!.]* client/jars/org.jboss.tools.rsp.client.cli
rm -rf client-cli
mkdir -p framework/bundles 
cd framework/bundles
mkdir org.jboss.tools.rsp.launching org.jboss.tools.rsp.launching.java org.jboss.tools.rsp.server org.jboss.tools.rsp.server.spi
git mv ../../launching/* ../../launching/.[!.]* org.jboss.tools.rsp.launching
git mv ../../launching-java/* ../../launching-java/.[!.]* org.jboss.tools.rsp.launching.java
git mv ../../server/* ../../server/.[!.]* org.jboss.tools.rsp.server
git mv ../../server-spi/* ../../server-spi/.[!.]* org.jboss.tools.rsp.server.spi
cd ../
mkdir -p tests/org.jboss.tools.rsp.launching.java.test/src
mv bundles/org.jboss.tools.rsp.launching.java/src/test/java/* tests/org.jboss.tools.rsp.launching.java.test/src
mkdir -p tests/org.jboss.tools.rsp.server.test/src
mv bundles/org.jboss.tools.rsp.server/src/test/java/* tests/org.jboss.tools.rsp.server.test/src
cd ../
rm -rf launching launching-java server server-spi
mkdir -p runtimes/bundles/org.jboss.tools.rsp.server.minishift runtimes/bundles/org.jboss.tools.rsp.server.wildfly
git mv server-minishift/* server-minishift/.[!.]*  runtimes/bundles/org.jboss.tools.rsp.server.minishift
git mv server-wildfly/* server-wildfly/.[!.]*  runtimes/bundles/org.jboss.tools.rsp.server.wildfly
rm -rf server-minishift server-wildfly
cd runtimes
mkdir -p tests/org.jboss.tools.rsp.server.wildfly.test/src
git mv bundles/org.jboss.tools.rsp.server.wildfly/src/test/java/* tests/org.jboss.tools.rsp.server.wildfly.test/src
git mv bundles/org.jboss.tools.rsp.server.wildfly/src/test/resources/* tests/org.jboss.tools.rsp.server.wildfly.test/


cd ../../
cp -rf tycho-files/* rsp-server

cd rsp-server
git add -A
git commit -a -m "Reorganize repository into a tycho build"
git remote add rob git@github.com:robstryker/rsp-server.git
git fetch rob
git cherry-pick e4b7e51f850978dc068d17e4992faa74a471c287


