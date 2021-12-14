Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E4933474C76
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Dec 2021 21:07:31 +0100 (CET)
Received: from localhost ([::1]:59068 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxE5D-0001na-1q
	for lists+qemu-devel@lfdr.de; Tue, 14 Dec 2021 15:07:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39468)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mxE3i-0000iU-3X; Tue, 14 Dec 2021 15:05:58 -0500
Received: from [2607:f8b0:4864:20::f36] (port=41683
 helo=mail-qv1-xf36.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mxE3g-0001oj-I2; Tue, 14 Dec 2021 15:05:57 -0500
Received: by mail-qv1-xf36.google.com with SMTP id m17so18315829qvx.8;
 Tue, 14 Dec 2021 12:05:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=1qflxNSaagENeTUa9kxwRTne72sSawXGwbLSRvp3mvE=;
 b=SMWNYWAldX0yC1CQ2lIwzZcQfF1R8R+b3gGb2jiv7NkeZfRlsu0CnPwVFuCQHsGivB
 L6sV3v3NaTFE5eBGVkRWw/E6uEvQTFxDuJW1oJAllK+Av7miZaOL2tpkPVHF0phqARbb
 u+Bb1bcULEXDkG4/jZmCcKiVbbaHMzShzqLQ8W2AvmSBjCfiEowm8oOyPTZ7Mr4eIY4X
 7+Ey/b464VesMBwNwDWJdKbkKvje6XuL1Z5q1l4pErZak3h+fbYmqmVZs9QLbcRL2CRl
 uZKxmkbrNF/e73mPJYgY5brrO0IX6+k9mptrBDWTLZERLn7dQZjkb3Enmd5g+0uqtLcg
 L1kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=1qflxNSaagENeTUa9kxwRTne72sSawXGwbLSRvp3mvE=;
 b=6AY8Zk/ZrNcB3458GT48RB6l+z7J5FpZQImPrw/Y16pdQRbC6/+hxyVOE9KFpLpdtt
 5dUVphCzzCZ1GcOCEXio3REbD0KQfvha9JlH3lo6WDkgYSLox67k65iQroF6E2G3tbiC
 j2VhmQLo1bUsfbhLNYlddHSNHjyKZY3HcmHEL2AqZ2TyeXgQbsijA7iVX+id3HOpJQmA
 0GJIy4ByhlDM4Am1Mw5y3e5XjnmL3APmVTL157XfzAiAT95w/S7bZBJZGio7kK6eaDDS
 u+52jjjAbSMO53/BTfLQLfomMg2vYbsTxgefg0xrhwWJ74xAdHkwa0i01hcXVRV5a7uF
 iG8w==
X-Gm-Message-State: AOAM533mHO2Dc1u27t1yxcefDzeiwhVQUMzGdOZB7xl4FwIUfkDee87z
 ZFxMkS38eR/XErkB/5P6g9s=
X-Google-Smtp-Source: ABdhPJwLUSBmh+9in8nbk9u3qGOQez4rLx5qQ2yLYDL9Yt8tLuOV31WmjuZuC7j4vreKjU0lPpyz4A==
X-Received: by 2002:a05:6214:20ee:: with SMTP id
 14mr7963848qvk.89.1639512354780; 
 Tue, 14 Dec 2021 12:05:54 -0800 (PST)
Received: from [192.168.10.222] ([179.225.209.176])
 by smtp.gmail.com with ESMTPSA id w10sm654214qkp.121.2021.12.14.12.05.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Dec 2021 12:05:54 -0800 (PST)
Message-ID: <c366ea89-ffab-bb3e-cfb3-bafa106918ac@gmail.com>
Date: Tue, 14 Dec 2021 17:05:51 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v9 10/10] target/ppc/excp_helper.c: EBB handling
 adjustments
Content-Language: en-US
To: David Gibson <david@gibson.dropbear.id.au>
References: <20211201151734.654994-1-danielhb413@gmail.com>
 <20211201151734.654994-11-danielhb413@gmail.com> <YbFhb1OMBZSCxV1V@yekko>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <YbFhb1OMBZSCxV1V@yekko>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::f36
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::f36;
 envelope-from=danielhb413@gmail.com; helo=mail-qv1-xf36.google.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.962,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: richard.henderson@linaro.org, qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 clg@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 12/8/21 22:52, David Gibson wrote:
> On Wed, Dec 01, 2021 at 12:17:34PM -0300, Daniel Henrique Barboza wrote:
>> The current logic is only considering event-based exceptions triggered
>> by the performance monitor. This is true now, but we might want to add
>> support for external event-based exceptions in the future.
>>
>> Let's make it a bit easier to do so by adding the bit logic that would
>> happen in case we were dealing with an external event-based exception.
>>
>> While we're at it, add a few comments explaining why we're setting and
>> clearing BESCR bits.
>>
>> Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
> 
> Still looks fine, but I'm not seeing a particularly strong reason to
> keep this split from the previous patch.
>

Fair enough. I'll squash this patch with the previous one.



Thanks,


Daniel

  
>> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
>> ---
>>   target/ppc/excp_helper.c | 45 ++++++++++++++++++++++++++++++++++------
>>   1 file changed, 39 insertions(+), 6 deletions(-)
>>
>> diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
>> index a26d266fe6..42e2fee9c8 100644
>> --- a/target/ppc/excp_helper.c
>> +++ b/target/ppc/excp_helper.c
>> @@ -801,14 +801,47 @@ static inline void powerpc_excp(PowerPCCPU *cpu, int excp_model, int excp)
>>           break;
>>       case POWERPC_EXCP_EBB:       /* Event-based branch exception             */
>>           if ((env->spr[SPR_FSCR] & (1ull << FSCR_EBB)) &&
>> -            (env->spr[SPR_BESCR] & BESCR_GE) &&
>> -            (env->spr[SPR_BESCR] & BESCR_PME)) {
>> +            (env->spr[SPR_BESCR] & BESCR_GE)) {
>>               target_ulong nip;
>>   
>> -            env->spr[SPR_BESCR] &= ~BESCR_GE;   /* Clear GE */
>> -            env->spr[SPR_BESCR] |= BESCR_PMEO;  /* Set PMEO */
>> -            env->spr[SPR_EBBRR] = env->nip;     /* Save NIP for rfebb insn */
>> -            nip = env->spr[SPR_EBBHR];          /* EBB handler */
>> +            /*
>> +             * If we have Performance Monitor Event-Based exception
>> +             * enabled (BESCR_PME) and a Performance Monitor alert
>> +             * occurred (MMCR0_PMAO), clear BESCR_PME and set BESCR_PMEO
>> +             * (Performance Monitor Event-Based Exception Occurred).
>> +             *
>> +             * Software is responsible for clearing both BESCR_PMEO and
>> +             * MMCR0_PMAO after the event has been handled.
>> +             */
>> +            if ((env->spr[SPR_BESCR] & BESCR_PME) &&
>> +                (env->spr[SPR_POWER_MMCR0] & MMCR0_PMAO)) {
>> +                env->spr[SPR_BESCR] &= ~BESCR_PME;
>> +                env->spr[SPR_BESCR] |= BESCR_PMEO;
>> +            }
>> +
>> +            /*
>> +             * In the case of External Event-Based exceptions, do a
>> +             * similar logic with BESCR_EE and BESCR_EEO. BESCR_EEO must
>> +             * also be cleared by software.
>> +             *
>> +             * PowerISA 3.1 considers that we'll not have BESCR_PMEO and
>> +             * BESCR_EEO set at the same time. We can check for BESCR_PMEO
>> +             * being not set in step above to see if this exception was
>> +             * trigged by an external event.
>> +             */
>> +            if (env->spr[SPR_BESCR] & BESCR_EE &&
>> +                !(env->spr[SPR_BESCR] & BESCR_PMEO)) {
>> +                env->spr[SPR_BESCR] &= ~BESCR_EE;
>> +                env->spr[SPR_BESCR] |= BESCR_EEO;
>> +            }
>> +
>> +            /*
>> +             * Clear BESCR_GE, save NIP for 'rfebb' and point the
>> +             * execution to the event handler (SPR_EBBHR) address.
>> +             */
>> +            env->spr[SPR_BESCR] &= ~BESCR_GE;
>> +            env->spr[SPR_EBBRR] = env->nip;
>> +            nip = env->spr[SPR_EBBHR];
>>               powerpc_set_excp_state(cpu, nip, env->msr);
>>           }
>>           /*
> 

