workspace "Service Tier Architecture" "A 6-component service tier architecture" {

    model {
        user = person "User" "End user of the application"
        
        externalSystem = softwareSystem "3rd Party Services" "External APIs and services"
        
        serviceSystem = softwareSystem "Service Tier System" "Main application system" {
            spa = container "SPA" "Single Page Application providing the user interface" "React" {
                tags "WebApp"
            }
            
            webApi = container "Web API" "Provides REST API for the application" "REST with Golang" {
                tags "API"
            }
            
            database = container "Relational Database" "Stores application data" "PostgreSQL" {
                tags "Database"
            }
            
            dataPipeline = container "Data Pipeline" "Processes and transforms data" "Kafka with Airflow" {
                tags "Pipeline"
            }
            
            dataWarehouse = container "Data Warehouse" "Stores analytical data" "Snowflake" {
                tags "DataWarehouse"
            }
            
            integrationApi = container "Integration API" "Handles external service integrations" "Web API" {
                tags "API"
            }
        }

        # relationships
        user -> spa "Uses" "HTTPS"
        spa -> webApi "Makes API calls to" "JSON/HTTPS"
        webApi -> database "Reads from and writes to" "SQL"
        webApi -> integrationApi "Calls" "HTTPS"
        integrationApi -> externalSystem "Integrates with" "HTTPS/REST"
        
        database -> dataPipeline "Data extracted by" "SQL"
        dataPipeline -> dataWarehouse "Loads processed data into" "ETL"
    }

    views {
        systemContext serviceSystem "SystemContext" {
            include *
            autoLayout
        }

        container serviceSystem "Containers" {
            include *
            autoLayout
        }

        styles {
            element "Person" {
                color #ffffff
                fontSize 22
                shape Person
                background #08427b
            }
            
            element "Software System" {
                background #1168bd
                color #ffffff
            }
            
            element "WebApp" {
                background #4477aa
                color #ffffff
                shape WebBrowser
            }
            
            element "API" {
                background #4477aa
                color #ffffff
                shape Cylinder
            }
            
            element "Database" {
                background #4477aa
                color #ffffff
                shape Cylinder
            }
            
            element "Pipeline" {
                background #4477aa
                color #ffffff
                shape Pipe
            }
            
            element "DataWarehouse" {
                background #4477aa
                color #ffffff
                shape Folder
            }
            
            relationship "Relationship" {
                dashed false
            }
        }

        theme default
    }

}