Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A2DB33DA169
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Jul 2021 12:43:02 +0200 (CEST)
Received: from localhost ([::1]:36690 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m93VF-0007eu-O4
	for lists+qemu-devel@lfdr.de; Thu, 29 Jul 2021 06:43:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58780)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1m93UV-0006yW-Pr
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 06:42:15 -0400
Received: from smtp-out2.suse.de ([195.135.220.29]:44650)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1m93UU-0001qR-1i
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 06:42:15 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 49C2C201DF;
 Thu, 29 Jul 2021 10:42:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1627555332; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9Puxgbq+piwZ6LeDwog2ItRhY/uZ/IOD3W++56eHqxw=;
 b=pD5elMWVhUUURG5Km37uxAu7RUlw0h5ffL0fr4evwSX6aeKtays0e7IWD4lWfV3Td9Q5hd
 8xrubXyIUCf+HJIBFFkOSSXDJkOBJMS2i4Wukw5Q7v7ce6bSDq6Q1v+s3n9PKhty+KiB76
 z2PFjyDBgf73p+DHZmf6nSqalQtU9QM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1627555332;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9Puxgbq+piwZ6LeDwog2ItRhY/uZ/IOD3W++56eHqxw=;
 b=Bqt5duvpggR0H24bCZDmHzO/brbmtAOR7ZE4aFgwS5x7cvxypY1+Ec20FKRRasjPgXDMwn
 ctAmq68xs2zj43Dg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id DFD501348A;
 Thu, 29 Jul 2021 10:42:11 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id z4IpMwOGAmFyUgAAMHmgww
 (envelope-from <cfontana@suse.de>); Thu, 29 Jul 2021 10:42:11 +0000
Subject: Re: modular tcg
To: Gerd Hoffmann <kraxel@redhat.com>
References: <20210722220952.17444-1-jziviani@suse.de>
 <20210722220952.17444-2-jziviani@suse.de>
 <c26fc6f4-341f-c66f-5384-c811e1342891@suse.de>
 <20210723095231.sfbkhdwdg43nedkk@sirius.home.kraxel.org>
 <4b5c010f-1365-e746-c269-9b9e48771f7b@suse.de>
 <6a3940a4-ca70-343b-5724-0f8f59d6fde4@suse.de>
 <20210723124858.rh63jh2esxahib4e@sirius.home.kraxel.org>
 <20210729091407.n7bdlyw5rsievdch@sirius.home.kraxel.org>
 <d04c1456-e2fb-2b0d-e011-bcdafbacc9ba@suse.de>
 <20210729102627.ovaimyubcfieaika@sirius.home.kraxel.org>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <3bce146f-0036-dd59-9561-a7571929bfc3@suse.de>
Date: Thu, 29 Jul 2021 12:42:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20210729102627.ovaimyubcfieaika@sirius.home.kraxel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=195.135.220.29; envelope-from=cfontana@suse.de;
 helo=smtp-out2.suse.de
X-Spam_score_int: -46
X-Spam_score: -4.7
X-Spam_bar: ----
X-Spam_report: (-4.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.277,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-devel@nongnu.org, pbonzini@redhat.com, richard.henderson@linaro.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 "Jose R. Ziviani" <jziviani@suse.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/29/21 12:26 PM, Gerd Hoffmann wrote:
>   Hi,
> 
>>> It's basically two groups:
>>>
>>>  * Arch-specific (functions taking CPUX86State as argument), most of the
>>>    unresolved symbols in target/i386/ and i386/ directories go into this
>>>    category.
>>
>> Yes, and we need to think about all targets, not just i386.
> 
> Sure.  I just want go forward in small steps, so my plan is to tackle
> them one by one (starting with i386).
> 
>>>  * Common (functions taking CPUState as argument).  Everything else.
>>>
>>> The common functions could be added TCGCPUOps to allow them being called via
>>
>> TCGCCPUOps are target-specific in their implementation, so I guess
>> it's the arch specific part that could be TCGCPUOps (maybe, would need
>> deep thinking).
> 
> Ok, lets make it three groups then.
> 
>   (1) generic interface, arch implementation (this is what we have
>       TCGCPUOps hooks right now).
>   (2) generic interface, generic implementation (functions taking a
>       CPUState as argument, simliar to group (1).
>   (3) arch-specific interface and implementation (functions taking a
>       CPUX86State argument).
> 
> We could add group (2) to TCGCPUOps for this ...
> 
>>> CPUClass->tcg_ops->$name instead of a direct symbol reference.  Not sure this
>>> is a good idea though.  Experimental patch covering tcg_exec_realizefn +
>>> tcg_exec_unrealizefn below.
> 
> ... but as I sayed, not sure this is the best plan.
> 
> Adding group (3) to TCGCPUOps is a non-starter IMHO given that the
> function prototypes are arch-specific (using CPUX86State) and also
> the interfaces actually needed are arch-specific.  something like
> x86_register_ferr_irq or cpu_x86_update_dr7 simply doesn't exist on
> !x86.  I guess we'll need TCG${arch}Ops for those.
> 
>>> No idea yet how to handle arch-specific bits best.  Seems there is no existing
>>> infrastructure to untangle target-specific code and tcg, so this probably needs
>>> something new.
>>
>> We need target-specific modules. They could at the beginning absorb
>> also the non-target specific parts in my view.  So you have a big
>> tcg-arm module, a tcg-i386 module etc.
>>
>> I think I sketched already the idea in the Makefile I shared before?
> 
> We have target-specific modules in master branch.
> Used for qtest (all archs) and tcg (i386/x86_64 only, accel ops only).
> 
> The build system changes to build more tcg bits modular are here:
> https://git.kraxel.org/cgit/qemu/log/?h=sirius/modules-tcg-meson
> Doesn't build due unresolved symbols, but shows which code
> changes/cleanups/reorganizations are needed for (more) modular tcg.
> 
> take care,
>   Gerd
> 

What I mean is, for starters, lets make all tcg code land in the target-specific module.

Sorry I am multitasking quite a bit so I may be missing something obvious.

Ciao,

Claudio



