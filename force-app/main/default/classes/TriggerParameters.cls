/*
* @author : Davide Arena 
*/
public with sharing class TriggerParameters
{
    /*** STATIC CONSTANTS ***/

    private static final String CANNOT_SET = 'Cannot set instance property: ';
    private static final String CANNOT_INIT = 'Cannot create a TriggerParameters instance in current context';    
    
    /*** INSTANCE PROPERTIES ***/
    // All instance properties can't be change once a value is assigned
    
    public TriggerOperation event {
        get{ return event; }
        set{
            if(event!=null)throw new TriggerParametersException(CANNOT_SET+'event');
            event=value;
        }
    }

    public List<SObject> newList {
        get{ return new List<SObject>(newList); }
        set{
            if(newList!=null)throw new TriggerParametersException(CANNOT_SET+'newList');
            newList=value;
        }
    }
    
    public Map<Id,SObject> newMap {
        get{ return new Map<Id,SObject>(newMap); }
        set{
            if(newMap!=null)throw new TriggerParametersException(CANNOT_SET+'newMap');
            newMap=value;
        }
    }
    
    public List<SObject> oldList {
        get{ return new List<SObject>(oldList); }
        set{
            if(oldList!=null)throw new TriggerParametersException(CANNOT_SET+'oldList');
            oldList=value;
        }
    }

    public Map<Id,SObject> oldMap {
        get{ return new Map<Id,SObject>(oldMap); }
        set{
            if(oldMap!=null)throw new TriggerParametersException(CANNOT_SET+'oldMap');
            oldMap=value;
        }
    }

    public Integer size {
        get{ return size; }
        set{
            if(size!=null)throw new TriggerParametersException(CANNOT_SET+'size');
            size=value;
        }
    }
    
    public Schema.SObjectType sObjectType {
        get{ return sObjectType; }
        set{
            if(sObjectType!=null)throw new TriggerParametersException(CANNOT_SET+'sObjectType');
            sObjectType=value;
        }
    }

    /*** CONSTRUCTORS ***/
    // Class instances can be be constructed only in Trigger and Test contexts.
    // An instance constructed in Trigger context inherits all properties from it

    public TriggerParameters() {
        if(!Trigger.isExecuting && !Test.isRunningTest()){
            throw new TriggerParametersException(CANNOT_INIT);
        }
        else if(Trigger.isExecuting) {
            this.event = Trigger.operationType;
            this.newList = Trigger.new;
            this.newMap = Trigger.newMap;
            this.oldList = Trigger.old;
            this.oldMap = Trigger.oldMap;
            this.size = Trigger.size;
            this.sObjectType = Trigger.new == null ? Trigger.old[0].getSObjectType() : Trigger.new[0].getSObjectType();
        }
    }

    /*** CUSTOM EXCEPTION ***/
    
    private class TriggerParametersException extends Exception{}
}