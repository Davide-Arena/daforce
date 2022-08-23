/*
* @author : Davide Arena 
*/
@IsTest
public with sharing class EnvironmentTest {
    @IsTest
    static void testIsSandbox(){
        System.assertEquals(
            Environment.SANDBOX_NAME != null,
            Environment.isSandbox(),
            'Environment.isSandbox returns '+Environment.isSandbox()+', but the Environment.SANDBOX_NAME is '+Environment.SANDBOX_NAME
        );
    }
}
