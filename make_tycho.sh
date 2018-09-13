#!/bin/bash
git clone https://github.com/redhat-developer/rsp-server.git
cd rsp-server
cd api
mkdir bundles/org.jboss.tools.rsp.api -p
mkdir docs/org.jboss.tools.rsp.schema -p
git mv META-INF src .classpath .gitignore .project build.properties pom.xml bundles/org.jboss.tools.rsp.api
git mv ../schema/* ../schema/.[!.]* docs/org.jboss.tools.rsp.schema
cd ../
rm -rf schema
mkdir client/jars/org.jboss.tools.rsp.client.cli -p
git mv client-cli/* client-cli/.[!.]* client/jars/org.jboss.tools.rsp.client.cli
rm -rf client-cli
mkdir framework/bundles -p
cd framework/bundles
mkdir org.jboss.tools.rsp.launching org.jboss.tools.rsp.launching.java org.jboss.tools.rsp.server org.jboss.tools.rsp.server.spi
git mv ../../launching/* ../../launching/.[!.]* org.jboss.tools.rsp.launching
git mv ../../launching-java/* ../../launching-java/.[!.]* org.jboss.tools.rsp.launching.java
git mv ../../server/* ../../server/.[!.]* org.jboss.tools.rsp.server
git mv ../../server-spi/* ../../server-spi/.[!.]* org.jboss.tools.rsp.server.spi
cd ../
mkdir tests/org.jboss.tools.rsp.launching.java.test/src -p
mv bundles/org.jboss.tools.rsp.launching.java/src/test/java/* tests/org.jboss.tools.rsp.launching.java.test/src
mkdir tests/org.jboss.tools.rsp.server.test/src -p
mv bundles/org.jboss.tools.rsp.server/src/test/java/* tests/org.jboss.tools.rsp.server.test/src
cd ../
rm -rf launching launching-java server server-spi
mkdir runtimes/bundles/org.jboss.tools.rsp.server.minishift runtimes/bundles/org.jboss.tools.rsp.server.wildfly -p
git mv server-minishift/* server-minishift/.[!.]*  runtimes/bundles/org.jboss.tools.rsp.server.minishift
git mv server-wildfly/* server-wildfly/.[!.]*  runtimes/bundles/org.jboss.tools.rsp.server.wildfly
rm -rf server-minishift server-wildfly
cd runtimes
mkdir tests/org.jboss.tools.rsp.server.wildfly.test/src -p
mv bundles/org.jboss.tools.rsp.server.wildfly/src/test/java/* tests/org.jboss.tools.rsp.server.wildfly.test/src

cd ../../
cp -rf tycho-files/* rsp-server
