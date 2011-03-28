{if $counter.xtype eq "textarea"}
<textarea id="tv{$tv->id}" name="tv{$tv->id}" rows="15">{$tv->get('value')|escape}</textarea>
{else}
<input id="tv{$tv->id}" name="tv{$tv->id}"
	type="text" class="textfield"
	value="{$tv->get('value')|escape}"
	{$style}
	tvtype="{$tv->type}"
/>
{/if}



<div id="counter{$tv->id}"></div>
<script type="text/javascript">
// <![CDATA[
{literal}
var fld = MODx.load({
{/literal}
    xtype: 'textfield'
    ,applyTo: 'tv{$tv->id}'
    ,width: '97%'
    ,enableKeyEvents: true
    {if $counter.xtype eq "textarea"}
    ,value: '{$tv->get('value')|escape:'javascript'}'
    ,height: 140
    {/if}    
{literal}
    ,listeners: { 'keypress': { fn:function(input,e){
        MODx.fireResourceFormChange();
		var max = '{/literal}{$counter.value}{literal}';
		var btns = [7,34,35,36,38,45];
        var content = input.el.dom.value;
        var count = content.length;
        var cf = Ext.getCmp('{/literal}counterfield{$tv->id}{literal}');
        var value = max-count;
        cf.setValue('{/literal}{$counter.caption}{literal}: ' + value);
		var btn = e.button;
		if (count>max){
			//console.log(e);
			if (btns.indexOf(btn) == -1){
				e.stopEvent();
                input.setValue(content.substring(0, max));
			}
			
		}
    }
    
    , scope:this}}

    
});
MODx.makeDroppable(fld);

MODx.load({

    xtype: 'displayfield',
    renderTo: '{/literal}counter{$tv->id}{literal}',
	layout: 'fit',
	id: '{/literal}counterfield{$tv->id}{literal}',
    fieldLabel: 'Allowed characters remaining',
    hideParent: true,
	value: '25'		

});

var task{/literal}tv{$tv->id}{literal} = {
    run: function(){
        var input = Ext.fly('{/literal}tv{$tv->id}{literal}');
		var max = '{/literal}{$counter.value}{literal}';
        var content = input.dom.value;
        var count = content.length;
        var cf = Ext.getCmp('{/literal}counterfield{$tv->id}{literal}');
        var value = max-count;
        cf.setValue('{/literal}{$counter.caption}{literal}: ' + value);
		if (count>max){
             input.dom.value = content.substring(0, max);
			}
	
    },
    interval: 1000 //1 second
}
Ext.TaskMgr.start(task{/literal}tv{$tv->id}{literal});


{/literal}
// ]]>
</script>