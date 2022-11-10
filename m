Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 417216241D0
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Nov 2022 13:00:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ot6Dz-00008P-8L; Thu, 10 Nov 2022 07:00:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1ot6Dv-00006q-V2
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 06:59:59 -0500
Received: from smtp-out1.suse.de ([2001:67c:2178:6::1c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1ot6Du-0000Sp-Ea
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 06:59:59 -0500
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id F2B9A22CD6;
 Thu, 10 Nov 2022 11:59:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1668081595; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ww742QdOF4X4tmBVhNRjJ6ND9tLlRdxd1yiXzj/q/1Q=;
 b=o+Bmef5GiXJDRKmujtkGi5IVPmg4MZf+7cACrfKHxpPjJPoXG4GAiibHwtygMB3fnZPm0m
 ZWt2K8wACUH13FNv8CvpPZ3ntRLTiXCgto1JlF1DCoQssMlTvQI8K6iZaAKEzKUKftsjUr
 qe41SLzQUFrehIFOSjRYljTTwEs2wZY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1668081595;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ww742QdOF4X4tmBVhNRjJ6ND9tLlRdxd1yiXzj/q/1Q=;
 b=cs/lKt4CTKojRd/VOQWwAio9YsHY1ufUAjIDznDY4EAhvv6jSDUmaR9bijJ+Y2ODONYzux
 ze7rzQ2/RPQAgDDA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B9B3B1332F;
 Thu, 10 Nov 2022 11:59:54 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id BLbfKrrnbGNhRAAAMHmgww
 (envelope-from <cfontana@suse.de>); Thu, 10 Nov 2022 11:59:54 +0000
Message-ID: <87f37780-910f-18ea-622f-d1157419de93@suse.de>
Date: Thu, 10 Nov 2022 12:59:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH 2/3] net: Restore printing of the help text with "-nic
 help"
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Jason Wang <jasowang@redhat.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, pbonzini@redhat.com
References: <20221104125705.415923-1-thuth@redhat.com>
 <20221104125705.415923-3-thuth@redhat.com>
 <92cea786-0a5d-1ddd-68d5-14ca98143614@suse.de>
 <6d6d0704-de37-db36-223e-f770311c70fd@redhat.com>
 <2cdf742a-b756-e586-229b-a27ceea4dfd8@suse.de>
 <516f943b-b741-3111-39f2-64aa6b69f0f4@redhat.com>
 <b7921236-b9ac-aa43-b1a8-863c8df8b7a5@suse.de>
 <082435f5-6a91-1418-1d27-9369e439854d@redhat.com>
From: Claudio Fontana <cfontana@suse.de>
In-Reply-To: <082435f5-6a91-1418-1d27-9369e439854d@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2001:67c:2178:6::1c;
 envelope-from=cfontana@suse.de; helo=smtp-out1.suse.de
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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

On 11/10/22 12:35, Thomas Huth wrote:
> On 08/11/2022 10.43, Claudio Fontana wrote:
>> On 11/8/22 09:59, Thomas Huth wrote:
>>> On 08/11/2022 09.52, Claudio Fontana wrote:
>>>> On 11/8/22 09:42, Thomas Huth wrote:
>>>>> On 07/11/2022 13.27, Claudio Fontana wrote:
>>>>>> should -net and -netdev be adapted too?
>>>>>
>>>>> "-netdev help" already works just fine ... and "-net" should IMHO rather be
>>>>> removed than improved ;-)
>>>>>
>>>>>     Thomas
>>>>>
>>>>
>>>> I wonder if it could be done once for all, in net_init_clients,
>>>> instead of repeating the is_help_option in net_init_netdev and net_param_nic
>>>> (and that would take care of net_init_client too, so we'd get "net" for free)..
>>>
>>> I don't think that it makes too much sense to have one option for all -
>>> since all three CLI options are slightly different anyway. E.g. "-net nic"
>>> only exists for "-net", "hubport" cannot be used with "-net", "-nic" can
>>> also be used to configure the NIC model, etc.
>>>
>>>    Thomas
>>>
>>
>> Hi Thomas, I would not suggest to merge everything together,
>>
>> I was considering whether it would make sense to just check the "type" id for is_help_option
>> once, since all the options "net", "netdev", "nic" have a "type" implied_opt_name,
>>
>> and so it should be possible to make a list of structs that signify what to do for "net", "netdev", "nic", and
>> loop on that and check for that help string once,
>>
>> and then split off the codepath into the "net", "netdev", "nic" - specific code as it is now,
>> either manually or by storing the function that is now in the foreach as a function pointer in the struct, ie moving the is_help_option check one level up.
>>
>> However, it might not be worth it since it seems that for "nic" the nic models need to also be printed, so it might make things needlessly verbose.
>>
>> Not sure, have not tried to write the code for it.
> 
> Sorry, I currently fail to see how that should really work out nicely, so 
> I'll continue with my current patch. But feel free to write some patches, 
> maybe it's clearer to me if I see the code.
> 
>   Thomas
> 

No worries, maybe it's just too complex and not worth it.

Ciao,

C

