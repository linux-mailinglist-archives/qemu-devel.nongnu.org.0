Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A06424BAB69
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Feb 2022 22:05:21 +0100 (CET)
Received: from localhost ([::1]:43662 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKnxo-0004Vq-O7
	for lists+qemu-devel@lfdr.de; Thu, 17 Feb 2022 16:05:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45482)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nKnvm-00037c-Si; Thu, 17 Feb 2022 16:03:14 -0500
Received: from [2607:f8b0:4864:20::234] (port=37376
 helo=mail-oi1-x234.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nKnvl-000392-02; Thu, 17 Feb 2022 16:03:14 -0500
Received: by mail-oi1-x234.google.com with SMTP id r27so959099oiw.4;
 Thu, 17 Feb 2022 13:03:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=Qnba6HM+erk+cpbH2FtWSPZ+n+0pyBpCznIBnOL1DZQ=;
 b=Ysi/wf9vRsp6LMeDfMPWqTEicSQVG0ksSMPcX46HdHpRbYpN8coOYw2397prWiLUsF
 vClZn2zFVsVY2IS2HekclPXIeBk1/gOiD+U4yBdx7a1VX3LEkqe/n49JBI8Yu5b/DdtX
 3YXeFA4KcFoj3DAxZ79IO1QslcHK64gES6bj9AqmwGTBJ+sTLe2rGDG3xltKKuZc4Ry0
 lX0CRRx5Lwy+PdlXiowniq7KP7XkDC0VcQE7kM6qkJOBrTqF+p+aZZRfD59JRxTkl271
 FcyQBU+t4MF39hDC/mguUtwffqJI8qAnvZB0b1Byarj5hvAqY7JqN3Pv90+ay4qna2cS
 SEqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Qnba6HM+erk+cpbH2FtWSPZ+n+0pyBpCznIBnOL1DZQ=;
 b=xeKjJx4w7Y/6gBg1jQjtkPGxIC9u5WSv5E7DZpBIrTIMqkgfR4FO+99uIsf/Xzd8TS
 GfxgneWnXUL3DTTL4hB12UyqAJwJqw2bj9P1xp2xbStl4t92OU2I6Z+YoUM/ELsUMBIH
 52slTk29/nvEANisE2SpuJK9mVSdpFylwu87JDEAHSSzeUBWiMLtVhxjifi6rnWt5cGM
 5gXU9dtPrworJIA4WUZ8xOB6I0QBJVRUtAffs6BBosrVM2zDK+LUbppEaqcaZ381ntou
 0HxH+r/DLga/JXhvOAi4rV1pa58mNCZ4NnJIVbPdxi5gTjQeWtYKVmsWkKH81OjsZWNS
 QWXw==
X-Gm-Message-State: AOAM530ojYpc6OdZkVgmiXmQV1i6AHBpJ1StaVo+caJyCQPiwXWON+a7
 FhbSypfuyJ0QJUYmHaBE6lsdSyFBnOA=
X-Google-Smtp-Source: ABdhPJzCpaHmlSg1qc7CgAOpzsDnC4q/1ADwhFrcCiaohNkEhrxPt4aJeKNJMiVpHE7/4b2s0+J8cQ==
X-Received: by 2002:a05:6808:bd0:b0:2cf:15a:87b8 with SMTP id
 o16-20020a0568080bd000b002cf015a87b8mr3483604oik.282.1645131791320; 
 Thu, 17 Feb 2022 13:03:11 -0800 (PST)
Received: from ?IPV6:2804:431:c7c6:367f:eb9c:8725:6b7f:76b3?
 ([2804:431:c7c6:367f:eb9c:8725:6b7f:76b3])
 by smtp.gmail.com with ESMTPSA id s3sm604530ois.19.2022.02.17.13.03.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Feb 2022 13:03:11 -0800 (PST)
Message-ID: <e7373ca8-a1b1-ab58-ba9e-190560c62884@gmail.com>
Date: Thu, 17 Feb 2022 18:03:08 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] ppc/spapr: Advertise StoreEOI for POWER10 compat guests
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org
References: <20220214141157.3800212-1-clg@kaod.org>
 <d38d9e08-8988-6aa3-40f6-408b6eb823b0@gmail.com>
 <fb2e56cc-15d1-65ee-9d9c-64223483ed01@kaod.org>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <fb2e56cc-15d1-65ee-9d9c-64223483ed01@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::234
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::234;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x234.google.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Greg Kurz <groug@kaod.org>, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 2/17/22 10:23, Cédric Le Goater wrote:
> On 2/17/22 12:28, Daniel Henrique Barboza wrote:
>>
>>
>> On 2/14/22 11:11, Cédric Le Goater wrote:
>>> When an interrupt has been handled, the OS notifies the interrupt
>>> controller with a EOI sequence. On a POWER9 and POWER10 systems using
>>> the XIVE interrupt controller, this can be done with a load or a store
>>> operation on the ESB interrupt management page of the interrupt. The
>>> StoreEOI operation has less latency and improves interrupt handling
>>> performance but it was deactivated during the POWER9 DD2.0 timeframe
>>> because of ordering issues. POWER9 systems use the LoadEOI instead.
>>> POWER10 compat guests should have fixed the issue with
>>> Load-after-Store ordering and StoreEOI can be activated for them
>>> again.
>>>
>>> To maintain performance, this ordering is only enforced for the
>>> XIVE_ESB_SET_PQ_10 load operation. This operation can be used to
>>> disable temporarily an interrupt source. If StoreEOI is active, a
>>> source could be left enabled if the load and store operations come
>>> out of order.
>>>
>>> Add a check in our XIVE emulation model for Load-after-Store when
>>> StoreEOI is active. It should catch unreliable sequences. Other load
>>> operations should be fine without it.
>>>
>>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
>>> ---
>>
>> Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> 
> 
> Unfortunetaly, this patch breaks migration under TCG because the XIVE
> source flag is not updated on the target side. KVM is not impacted
> because the emulated sources are not used. This needs to be addressed
> in a v2.
> 
> That said, even without this patch, TCG migration is broken. some CPUs
> on the receive side are stalled on CPU Hard LOCKUPs. QEMU 6.2 is impacted.
> So it has been a while :/



I've done a few tests and I can see Hard Lockups with TCG pseries migration, when using
multiples CPUs (I used -smp 4 like you suggested in private), since at least QEMU
v6.0.0.

This is hardly surprising since TCG migration isn't something that we ever supported in
a product or even in the community*. It would be good to understand why and get it fixed,
but for now we can take a bit comfort in knowing that:

- it has been broken for awhile (if ever worked). If this was a recent 7.0 regression
we would need to solve it for this upcoming release;

- single CPU TCG migration seems to be working fine, so we can count with this TCG
migration scenario for testing.



* I'm hoping David and Greg can push back on this if my assumption is wrong.



Thanks,



Daniel






> 
> See below.
> 
> C.
> 
> 
> 
> [   24.113608] watchdog: CPU 0 detected hard LOCKUP on other CPUs 1,3
> [   24.116534] watchdog: CPU 0 TB:15585461459, last SMP heartbeat TB:7394335409 (15998ms ago)
> [   24.117840] watchdog: CPU 1 Hard LOCKUP
> [   24.117956] watchdog: CPU 1 TB:15587843000, last heartbeat TB:5355690415 (19984ms ago)
> [   24.117999] Modules linked in:
> [   24.118387] irq event stamp: 341399
> [   24.118399] hardirqs last  enabled at (341399): [<c000000000caea2c>] snooze_loop+0x9c/0x290
> [   24.118900] hardirqs last disabled at (341398): [<c000000000208b9c>] do_idle+0x12c/0x450
> [   24.118943] softirqs last  enabled at (9798): [<c000000000f97dfc>] __do_softirq+0x60c/0x678
> [   24.118971] softirqs last disabled at (9789): [<c0000000001b06f8>] __irq_exit_rcu+0x158/0x1c0
> [   24.119127] CPU: 1 PID: 0 Comm: swapper/1 Not tainted 5.17.0-rc4-dirty #984
> [   24.119293] NIP:  c000000000caea78 LR: c000000000caea38 CTR: c000000000cae990
> [   24.119315] REGS: c0000000fff43d60 TRAP: 0100   Not tainted  (5.17.0-rc4-dirty)
> [   24.119352] MSR:  800000000280b033 <SF,VEC,VSX,EE,FP,ME,IR,DR,RI,LE>  CR: 28000228  XER: 00000006
> [   24.119554] CFAR: c000000000caea98 IRQMASK: 0
> [   24.119554] GPR00: c000000000caea2c c000000002bbbd80 c000000001c30b00 0000000000000000
> [   24.119554] GPR04: 0000000000000006 0000000000000000 000000000000c800 c000000001c7dc38
> [   24.119554] GPR08: c000000002b5d500 0000000000000000 00000003a115ef39 36d551ed00000000
> [   24.119554] GPR12: c000000000cae990 c0000000fffff300 0000000000000000 0000000000000000
> [   24.119554] GPR16: 0000000000000000 0000000000000000 0000000000000000 0000000000000000
> [   24.119554] GPR20: 0000000000000000 0000000000000000 0000000000000000 c000000001b3a660
> [   24.119554] GPR24: c0000000ffa4fb48 000000059d7c5070 c000000001c78e48 0000000000000000
> [   24.119554] GPR28: c000000001b3a660 c0000000015422e0 c0000000015422e8 0000000000000000
> [   24.119845] NIP [c000000000caea78] snooze_loop+0xe8/0x290
> [   24.119866] LR [c000000000caea38] snooze_loop+0xa8/0x290
> [   24.119998] Call Trace:
> [   24.120029] [c000000002bbbd80] [c000000000caea2c] snooze_loop+0x9c/0x290 (unreliable)
> [   24.120097] [c000000002bbbdc0] [c000000000cab730] cpuidle_enter_state+0x300/0x730
> [   24.120119] [c000000002bbbe30] [c000000000cabbfc] cpuidle_enter+0x4c/0x70
> [   24.120131] [c000000002bbbe70] [c000000000208d98] do_idle+0x328/0x450
> [   24.120141] [c000000002bbbf00] [c00000000020926c] cpu_startup_entry+0x3c/0x40
> [   24.120150] [c000000002bbbf30] [c00000000005e144] start_secondary+0x2a4/0x2b0
> [   24.120161] [c000000002bbbf90] [c00000000000d054] start_secondary_prolog+0x10/0x14
> [   24.120238] Instruction dump:
> [   24.120320] e9280080 e8c7d148 3ce20005 71290004 38e7d138 7d4a3214 4082003c 60000000
> [   24.120357] 60000000 60420000 7c210b78 7ffffb78 <8927000c> 2c090000 41820010 7d2c42a6
> 

