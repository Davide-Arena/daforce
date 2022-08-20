@IsTest(IsParallel=true)
public class TriggerParametersTest {
    
    public static final Id TEST_ACCOUNT_ID = '0011r00001oInva1id';
    
    @IsTest
    public static void constructorTest(){
        new TriggerParameters();
    }
	@IsTest
    public static void eventPropertyTest(){
        TriggerParameters tp = new TriggerParameters();
        tp.event = System.TriggerOperation.BEFORE_INSERT;
        System.assertEquals(
            tp.event,
            System.TriggerOperation.BEFORE_INSERT
        );
    }
    @IsTest
    public static void newListPropertyTest(){
        TriggerParameters tp = new TriggerParameters();
        List<SObject> newList = new List<SObject>();
        //Collection properties can be initilaized in Test context
        tp.newList = newList;
        System.assertEquals(
            tp.newList,
            newList
        );
        //Collection properties cannot be modified once they are initilaized
        tp.newList.add(
            new Account(
                Id=TEST_ACCOUNT_ID,
                Name='Test Account'
            )
        );
        System.assertEquals(
            tp.newList,
            newList
        );
    }
    @IsTest
    public static void newMapPropertyTest(){
        TriggerParameters tp = new TriggerParameters();
        Map<Id,SObject> newMap = new Map<Id,SObject>();
        //Collection properties can be initilaized in Test context
        tp.newMap = newMap;
        //Collection properties cannot be modified once they are initilaized
        tp.newMap.put(
            TEST_ACCOUNT_ID,
            new Account(
                Id=TEST_ACCOUNT_ID,
                Name='Test Account'
            )
        );
        System.assertEquals(
            tp.newMap,
            newMap
        );
    }
    @IsTest
    public static void oldListPropertyTest(){
        TriggerParameters tp = new TriggerParameters();
        List<SObject> oldList = new List<SObject>();
        //Collection properties can be initilaized in Test context
        tp.oldList = oldList;
        System.assertEquals(
            tp.oldList,
            oldList
        );
        //Collection properties cannot be modified once they are initilaized
        tp.oldList.add(
            new Account(
                Id=TEST_ACCOUNT_ID,
                Name='Test Account'
            )
        );
        System.assertEquals(
            tp.oldList,
            oldList
        );
    }
    @IsTest
    public static void oldMapPropertyTest(){
        TriggerParameters tp = new TriggerParameters();
        Map<Id,SObject> oldMap = new Map<Id,SObject>();
        //Collection properties can be initilaized in Test context
        tp.oldMap = oldMap;
        System.assertEquals(
            tp.oldMap,
            oldMap
        );
        //Collection properties cannot be modified once they are initilaized
        tp.oldMap.put(
            TEST_ACCOUNT_ID,
            new Account(
                Id=TEST_ACCOUNT_ID,
                Name='Test Account'
            )
        );
        System.assertEquals(
            tp.oldMap,
            oldMap
        );
    }
    @IsTest
    public static void sizePropertyTest(){
        TriggerParameters tp = new TriggerParameters();
        tp.size = 100;
        System.assertEquals(
            tp.size,
            100
        );
    }
    @IsTest
    public static void sObjectTypePropertyTest(){
        TriggerParameters tp = new TriggerParameters();
        tp.sObjectType = Schema.Account.SObjectType;
        System.assertEquals(
            tp.sObjectType,
            Schema.Account.SObjectType
        );
    }
}