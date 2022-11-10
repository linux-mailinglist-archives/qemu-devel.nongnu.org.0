Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 243F76241F9
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Nov 2022 13:10:00 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ot6N9-0005OJ-0D; Thu, 10 Nov 2022 07:09:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1ot6N6-0005Nn-HT
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 07:09:28 -0500
Received: from smtp-out2.suse.de ([2001:67c:2178:6::1d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1ot6N3-0000Pd-NV
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 07:09:28 -0500
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 5C9921F92B;
 Thu, 10 Nov 2022 12:09:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1668082164; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Cak+BTdF/SmQjpf/meYS65lI8mRGUeJgZnUxPOopvrk=;
 b=XwZUgG6eI8hPFlPWol89xd+4cvHz+x2NJ6xnoOlPOGerArS5t12q5yLpDLVVeH245q0VcW
 zajKJSLFSnUCPteu1r5O8EUWIFo4HY2XOYzWjL0BE3GaVeCFUmUucqf6L17A7fasYcKXbg
 IPl0Ia/UA6TZ+WC5LCNUcuhy6GxNkLU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1668082164;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Cak+BTdF/SmQjpf/meYS65lI8mRGUeJgZnUxPOopvrk=;
 b=JEpHKySNVkE2L/Aiq8/F7daqGOE4XN+P9Tcr+vySA2+Sgc4XQczeEfl3OVQA4NwHo8OWZF
 0cGNbr6rfMqAlYBw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 2B4371332F;
 Thu, 10 Nov 2022 12:09:24 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id XOrVCPTpbGM6SgAAMHmgww
 (envelope-from <cfontana@suse.de>); Thu, 10 Nov 2022 12:09:24 +0000
Message-ID: <0e722605-a8e4-7497-ea1d-7bb322ad3ffd@suse.de>
Date: Thu, 10 Nov 2022 13:09:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH 2/3] net: Restore printing of the help text with "-nic
 help"
Content-Language: en-US
From: Claudio Fontana <cfontana@suse.de>
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Jason Wang <jasowang@redhat.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, pbonzini@redhat.com
References: <20221104125705.415923-1-thuth@redhat.com>
 <20221104125705.415923-3-thuth@redhat.com>
 <4a72c7c6-4b70-b6bf-705e-3303865066b6@suse.de>
 <9a4db614-297d-a85f-9788-ed46c71bb66b@redhat.com>
 <38ca7d88-dcb8-597b-7d15-90cfd1bc5017@suse.de>
In-Reply-To: <38ca7d88-dcb8-597b-7d15-90cfd1bc5017@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2001:67c:2178:6::1d;
 envelope-from=cfontana@suse.de; helo=smtp-out2.suse.de
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 11/10/22 13:05, Claudio Fontana wrote:
> On 11/10/22 12:42, Thomas Huth wrote:
>> On 08/11/2022 10.49, Claudio Fontana wrote:
>>> On 11/4/22 13:57, Thomas Huth wrote:
>>>> Running QEMU with "-nic help" used to work in QEMU 5.2 and earlier versions
>>>> (it showed the available netdev backends), but this feature got broken during
>>>> some refactoring in version 6.0. Let's restore the old behavior, and while
>>>> we're at it, let's also print the available NIC models here now since this
>>>> option can be used to configure both, netdev backend and model in one go.
>>>>
>>>> Fixes: ad6f932fe8 ("net: do not exit on "netdev_add help" monitor command")
>>>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>>>> ---
>>>>   net/net.c | 14 ++++++++++++--
>>>>   1 file changed, 12 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/net/net.c b/net/net.c
>>>> index c0516a8067..b4b8f2a9cc 100644
>>>> --- a/net/net.c
>>>> +++ b/net/net.c
>>>> @@ -1571,8 +1571,18 @@ static int net_param_nic(void *dummy, QemuOpts *opts, Error **errp)
>>>>       const char *type;
>>>>   
>>>>       type = qemu_opt_get(opts, "type");
>>>> -    if (type && g_str_equal(type, "none")) {
>>>> -        return 0;    /* Nothing to do, default_net is cleared in vl.c */
>>>> +    if (type) {
>>>> +        if (g_str_equal(type, "none")) {
>>>> +            return 0;    /* Nothing to do, default_net is cleared in vl.c */
>>>> +        }
>>>> +        if (is_help_option(type)) {
>>>> +            GPtrArray *nic_models = qemu_get_nic_models(TYPE_DEVICE);
>>>> +            show_netdevs();
>>>> +            printf("\n");
>>>> +            qemu_show_nic_models(type, (const char **)nic_models->pdata);
>>>> +            g_ptr_array_free(nic_models, true);
>>>
>>> nit: would not the order:
>>>
>>>> +            GPtrArray *nic_models;
>>>> +            show_netdevs();
>>>> +            printf("\n");
>>>> +            nic_models = qemu_get_nic_models(TYPE_DEVICE);
>>>> +            qemu_show_nic_models(type, (const char **)nic_models->pdata);
>>>> +            g_ptr_array_free(nic_models, true);
>>>
>>> flow more logically?
>>
>> I think that's mostly a matter of taste ...
> 
> To some extent, but for the reader it would make more sense not to intermix unrelated code?
> 
> I'd say:
> 
> - show_netdevs
> _ get nic models
> - show nic models
> 
> instead of:
> 
> - get nic models
> - show netdevs
> - show nic models
> 
> 
>  > and as long as the declaration 
>> of the variable has to stay at the top of the block (according to QEMU's 
>> coding style), I think I'd also prefer to keep the initialization there.
>>
> 
> This conflict can easily be solved by putting the nic_models on its own line,
> as I have shown in my hunk above.
>

And another option (not used enough in QEMU code imo), is to open a block specifically for the nic models.

Ie you can say:

 show_netdevs();
 printf("\n");
 {
     GPtrArray *nic_models = qemu_get_nic_models(TYPE_DEVICE);
     qemu_show_nic_models(type, (const char **)nic_models->pdata);
     g_ptr_array_free(nic_models, true);
 }

this even has the additional benefit of making the allocation/free of the nic_models clearer as it corresponds to the block.

C

