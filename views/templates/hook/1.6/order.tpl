{*
 * 2007-2014 PrestaShop
 *
 * NOTICE OF LICENSE
 *
 * This source file is subject to the Academic Free License (AFL 3.0)
 * that is bundled with this package in the file LICENSE.txt.
 * It is also available through the world-wide-web at this URL:
 * http://opensource.org/licenses/afl-3.0.php
 * If you did not receive a copy of the license and are unable to
 * obtain it through the world-wide-web, please send an email
 * to license@prestashop.com so we can send you a copy immediately.
 *
 *         DISCLAIMER   *
 * ***************************************
 * Do not edit or add to this file if you wish to upgrade Prestashop to newer
 * versions in the future.
 * ****************************************************
 *
 * @category	Belvg
 * @package	Belvg_Twocheckout
 * @author    Alexander Simonchik <support@belvg.com>
 * @copyright Copyright (c) 2010 - 2014 BelVG LLC. (http://www.belvg.com)
 * @license   http://store.belvg.com/BelVG-LICENSE-COMMUNITY.txt
*}

<div class="col-lg-12">
	<div class="panel">
		<h3>
			<i class="icon-credit-card"></i>
				{l s='Brink\'s API' mod='brinkscheckout'}
		</h3>
		{if isset($twocheckout_errors) && count($twocheckout_errors)}
			<div class="alert alert-danger">
				{foreach $twocheckout_errors as $twocheckout_error}
					{$twocheckout_error|escape:false}<br>
				{/foreach}
			</div>
		{/if}
		{if isset($twocheckout_success) && count($twocheckout_success)}
			<div class="alert alert-success">
				{foreach $twocheckout_success as $twocheckout_conf}
					{$twocheckout_conf|escape:false}<br>
				{/foreach}
			</div>
		{/if}
		<p><span>{l s='Sale ID:' mod='brinkscheckout'}</span> <b>{$twocheckout_sale_info.sale.sale_id|escape:false}</b></p>
		<p><span>{l s='Invoice ID:' mod='brinkscheckout'}</span> <b>{$twocheckout_sale_info.sale.invoice_id|escape:false}</b></p>
		<p><span>{l s='Ip address:' mod='brinkscheckout'}</span> <b>{$twocheckout_sale_info.sale.ip_address|escape:false}</b></p>
		<p><span>{l s='Ip country:' mod='brinkscheckout'}</span> <b>{$twocheckout_sale_info.sale.ip_country|escape:false}</b></p>
		<br>
		<p><b>{l s='Invoices list:' mod='brinkscheckout'}</b></p>
		{if isset($twocheckout_sale_info.sale.invoices)}
			<table class="table" width="100%" cellspacing="0" cellpadding="0">
				<colgroup>
					<col width="10%">
					<col width="10%">
					<col width="10%">
					<col width="10%">
					<col width="10%">
					<col width="10%">
					<col width="">
				</colgroup>
				<thead>
					<tr>
						<th>{l s='change ID:' mod='brinkscheckout'}</th>
						<th>{l s='invoice ID:' mod='brinkscheckout'}</th>
						<th>{l s='customer total:' mod='brinkscheckout'}</th>
						<th>{l s='date placed:' mod='brinkscheckout'}</th>
						<th>{l s='vendor total:' mod='brinkscheckout'}</th>
						<th>{l s='fees:' mod='brinkscheckout'}</th>
						<th>{l s='payout status:' mod='brinkscheckout'}</th>
					</tr>
				</thead>
				<tbody>
				{foreach $twocheckout_sale_info.sale.invoices as $twocheckout_sale_invoice}
					<tr>
						<td>{if isset($twocheckout_sale_invoice.change_id)}{$twocheckout_sale_invoice.change_id|escape:false}{else}--{/if}</td>
						<td>{if isset($twocheckout_sale_invoice.invoice_id)}{$twocheckout_sale_invoice.invoice_id|escape:false}{else}--{/if}</td>
						<td>{if isset($twocheckout_sale_invoice.customer_total)}{$twocheckout_sale_invoice.customer_total|escape:false}{else}--{/if}</td>
						<td>{if isset($twocheckout_sale_invoice.date_placed)}{$twocheckout_sale_invoice.date_placed|escape:false}{else}--{/if}</td>
						<td>{if isset($twocheckout_sale_invoice.vendor_total)}{$twocheckout_sale_invoice.vendor_total|escape:false}{else}--{/if}</td>
						<td>{if isset($twocheckout_sale_invoice.fees_2co)}{$twocheckout_sale_invoice.fees_2co|escape:false}{else}--{/if}</td>
						<td>{if isset($twocheckout_sale_invoice.payout_status)}{$twocheckout_sale_invoice.payout_status|escape:false}{else}--{/if}</td>
					</tr>
				{/foreach}
				</tbody>
			</table>
		{/if}
		<br>
		<form action="{$twocheckout_refund_transaction_link|escape:false}" method="post" name="capture-cancel">
			<div class="row form-group">
				<div class="col-lg-4">
					<select name="category" required="required" >
						<option value="1">{l s='Did not receive order' mod='brinkscheckout'}</option>
						<option value="2">{l s='Did not like item' mod='brinkscheckout'}</option>
						<option value="3">{l s='Item(s) not as described' mod='brinkscheckout'}</option>
						<option value="4">{l s='Fraud' mod='brinkscheckout'}</option>
						<option value="5">{l s='Other' mod='brinkscheckout'}</option>
						<option value="6">{l s='Item not available' mod='brinkscheckout'}</option>
						<option value="8">{l s='No Response from Supplier' mod='brinkscheckout'}</option>
						<option value="9">{l s='Recurring last installment' mod='brinkscheckout'}</option>
						<option value="10">{l s='Cancellation' mod='brinkscheckout'}</option>
						<option value="11">{l s='Billed in error' mod='brinkscheckout'}</option>
						<option value="12">{l s='Prohibited product' mod='brinkscheckout'}</option>
						<option value="13">{l s='Service refunded at suppliers request' mod='brinkscheckout'}</option>
						<option value="14">{l s='Non Delivery' mod='brinkscheckout'}</option>
						<option value="15">{l s='Not as described' mod='brinkscheckout'}</option>
						<option value="16">{l s='Out of Stock' mod='brinkscheckout'}</option>
						<option value="17">{l s='Duplicate' mod='brinkscheckout'}</option>
					</select>
				</div>
				<div class="col-lg-8">
					<textarea name="comment" placeholder="{l s='Message explaining why the refund was issued. Required. May not contain `<` or `>`. (5000 character max)' mod='brinkscheckout'}" required="required" cols="70" rows="6"></textarea>
					<input type="hidden" name="twocheckout_sale_id" value="{$twocheckout_sale_id|escape:false}" />
				</div>
			</div>
			<div class="row">
				<center>
					<input type="submit" name="cancel" value="{l s='Cancel the transaction!' mod='brinkscheckout'}" class="btn btn-default" onclick="return confirm('{l s='Are you sure you want cancel the transaction?' mod='brinkscheckout'}')">
				</center>
			</div>
		</form>
	</div>
</div>