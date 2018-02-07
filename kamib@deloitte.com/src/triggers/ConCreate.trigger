trigger ConCreate on Lead (after Update) {
    ContactCreate.afterUpdate(trigger.new,trigger.oldMap);

}