trigger casetrigger on Case (after insert) {
    list<Case> childcases = new list<Case>();
for(case parent : trigger.new) {
    case child = new case(parentid=parent.id,subject = parent.subject);
    childcases.add(child);
}
insert childcases;
}