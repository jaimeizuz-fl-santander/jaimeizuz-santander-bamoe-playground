PATCH NAME:      
    DBACLD-177511
PRODUCT NAME:
    IBM Business Automation Manager Open Edition (BAMOE)
VERSION:
    9.2.0
DESCRIPTION: 
    One-off patch for BAMOE 9.2.0 to include the following fixes:
    
    * https://github.com/apache/incubator-kie-issues/issues/1964
      locking mechanism does not work when using work item handler service because of invalid id
      
NOTE:
    This patch REPLACES the previously provided one-off patch `bamoe-9.2.0-DBACLD-174154.zip`!
       
MANUAL INSTALL INSTRUCTIONS FOR MAVEN BASED PROJECTS:

    1. Extract the attached zip (bamoe-9.2.0-DBACLD-177511.zip) and change into the DBACLD-177511 directory

    2. Run the following commands to install the patch binaries to the local maven repository:
    
       $ mvn install:install-file -Dfile=jbpm-flow-9.2.0-ibm-0004-DBACLD-177511.jar -Dsources=jbpm-flow-9.2.0-ibm-0004-DBACLD-177511-sources.jar -DpomFile=jbpm-flow-9.2.0-ibm-0004-DBACLD-177511.pom -Dpackaging=jar
       $ mvn install:install-file -Dfile=kie-addons-persistence-jdbc-9.2.0-ibm-0004-DBACLD-177511.jar -Dsources=kie-addons-persistence-jdbc-9.2.0-ibm-0004-DBACLD-177511-sources.jar -DpomFile=kie-addons-persistence-jdbc-9.2.0-ibm-0004-DBACLD-177511.pom -Dpackaging=jar
       $ mvn install:install-file -Dfile=kogito-services-9.2.0-ibm-0004-DBACLD-177511.jar -Dsources=kogito-services-9.2.0-ibm-0004-DBACLD-177511-sources.jar -DpomFile=kogito-services-9.2.0-ibm-0004-DBACLD-177511.pom -Dpackaging=jar

    3. Override the original version of modified jars explicitly declaring them in <dependencyManagement> or <dependency> section of your project pom.xml:

       <dependency>
           <groupId>org.kie.kogito</groupId>
           <artifactId>jbpm-flow</artifactId>
           <version>9.2.0-ibm-0004-DBACLD-177511</version>
       </dependency>
       <dependency>
           <groupId>org.kie</groupId>
           <artifactId>kie-addons-persistence-jdbc</artifactId>
           <version>9.2.0-ibm-0004-DBACLD-177511</version>
       </dependency>
       <dependency>
           <groupId>org.kie.kogito</groupId>
           <artifactId>kogito-services</artifactId>
           <version>9.2.0-ibm-0004-DBACLD-177511</version>
       </dependency>


REQUIRED PROJECT SETTINGS:

    1. In your project's `src/main/resources/application.properties` file, make sure the following setting is present:
       ```
       kogito.persistence.optimistic.lock=true
       ```

CREATOR:
        Martin Weiler
DATE:
        15-MAY-2025
