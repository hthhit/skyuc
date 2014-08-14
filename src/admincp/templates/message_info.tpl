{include file="pageheader.tpl"}
{insert_scripts files="validator.js"}
<div class="main-div">
<form action="message.php" method="post" name="theForm" enctype="multipart/form-data" onsubmit="return validate()">
<table width="100%">
{if $action eq "add"}
  <tr>
    <td class="label">{$lang.receiver_id}</td>
    <td>
      <select class="textCtrl"  name="receiver_id[]" size="5" multiple="true" style="width:40%">
      <option value="0" selected="true">{$lang.all_amdin}</option>
      {foreach from=$admin_list item=val}
      {if $val.user_name neq $admin_user}
        <option value="{$val.user_id}">{$val.user_name}</option>
      {/if}
      {/foreach}
      </select>
    </td>
  </tr>
{/if}
{if $action eq "reply"}
<tr>
  <td class="label">{$lang.receiver_id}</td>
  <td>
  <select class="textCtrl"  name="receiver_id" style="width:30%">
   <option value="{$msg_val.sender_id}">{$msg_val.user_name}</option>
  </select>
</td>
</tr>
{/if}
  <tr>
    <td class="label">{$lang.title}</td>
    <td>
      <input type="text" name="title" maxlength="50" value="{$msg_arr.title}" size="40" />
   </td>
  </tr>
  <tr>
    <td class="label">{$lang.message}  </td>
    <td>
      <textarea class="textCtrl" name="message" cols="55" rows="8" />{$msg_arr.message}</textarea>
    </td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td align="left">
      <input type="submit" class="button primary submitButton" value="{$lang.button_submit}"  />&nbsp;&nbsp;&nbsp;
      <input type="reset" class="button submitButton"  value="{$lang.button_reset}"  />
      <input type="hidden" name="act" value="{$form_act}" />
      <input type="hidden" name="id" value="{$msg_arr.message_id}" />
    </td>
  </tr>
</table>
</form>
</div>
<script language="JavaScript">
<!--

document.forms['theForm'].elements['title'].focus();
/**
 * 检查表单输入的数据
 */
function validate()
{
    validator = new Validator("theForm");
    validator.required("title",      title_empty);
    validator.required("message",    message_empty);
    return validator.passed();
}
//-->

</script>
{include file="pagefooter.tpl"}