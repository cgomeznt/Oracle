INSERT INTO cdse_instance
     VALUES ((SELECT MAX (ins_pk) + 1
                FROM cdse_instance), 'CRECER', NULL, NULL, NULL, 'PE', 'es', 1, NULL, NULL);

INSERT INTO cdse_userinstance
            (ins_pk,
             usc_id
            )
     VALUES ((SELECT MAX (ins_pk)
                FROM cdse_instance),
             (SELECT usc_id
                FROM cdse_user
               WHERE usc_login = 'system')
            );

INSERT INTO cdse_country c
     VALUES ((SELECT MAX (cut_id) + 1
                FROM cdse_country), 'CRECER', 'PE', 'es');

INSERT INTO cdse_usercountry
            (cut_id,
             usc_id
            )
     VALUES ((SELECT MAX (cut_id)
                FROM cdse_country),
             (SELECT usc_id
                FROM cdse_user
               WHERE usc_login = 'system')
            );

COMMIT;
========================================================



delete CDSE_USERINSTANCE WHERE ins_pk=9;

delete CDSE_USERGROUPREPORT where ins_pk=9; 

delete CDSE_THIRDPERMISSION where ins_id=9;

delete CDSE_INSTANCE WHERE ins_pk=9;

delete CDSE_USERCOUNTRY WHERE CUT_ID=9;

delete CDSE_COUNTRY WHERE CUT_ID=9;

COMMIT;


Este era el error

[ERROR] Error trying to init Country: CO
org.springframework.beans.factory.BeanCreationException: Error creating bean with name 'sessionFactoryOper' defined in class path resource [config/applicationcontext.xml]: Initialization of bean failed; nested exception is org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named 'dataSourceCO' is defined
org.springframework.beans.factory.NoSuchBeanDefinitionException: No bean named 'dataSourceCO' is defined

