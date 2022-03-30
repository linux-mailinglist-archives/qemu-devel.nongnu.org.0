Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C982F4ECF45
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Mar 2022 23:59:29 +0200 (CEST)
Received: from localhost ([::1]:53088 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZgLg-0001LU-M3
	for lists+qemu-devel@lfdr.de; Wed, 30 Mar 2022 17:59:28 -0400
Received: from eggs.gnu.org ([209.51.188.92]:38090)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nZg2Z-0006A8-Bv; Wed, 30 Mar 2022 17:39:43 -0400
Received: from [2a00:1450:4864:20::332] (port=40588
 helo=mail-wm1-x332.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nZg2V-0005JS-H0; Wed, 30 Mar 2022 17:39:41 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 v64-20020a1cac43000000b0038cfd1b3a6dso639908wme.5; 
 Wed, 30 Mar 2022 14:39:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language
 :from:to:cc:references:in-reply-to:content-transfer-encoding;
 bh=9CKXKnHqCzGr2/IrCZazDaHkbd30MJBbbTCrcp/8Lvo=;
 b=JP+LkCDYoExHkb7gpNHxKeNfWNTkp+IeeE1PKEo1VQxvkX0PnyrEAp88P+LoBz8QDz
 zJF9QTkbyQq4o/LGp7bk4Yh8O4wGxjd5kYAxVTlAFVRNFX6QzMt0zJ3Y2sbDMCyXffze
 lR8VSmTRwU2SZuBSbBSPTFnRjaPWh0t8Hjcqq1YwNf/OIyPSN6DiBFuxaumiz5UfR6nx
 pY8pILsROUL7y93B0GL5j8j0HxTntAZUq4CfkQt6Ga/EmliGhuVFTIbCFkO/rtLhS5Sv
 NoaXTKr6bqcGCSw5MInv+jsYJwlOWwqcH8vcr0NMaRiO8hB/2kku99YCqJ9N8oYLGGyC
 dv7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:cc:references:in-reply-to
 :content-transfer-encoding;
 bh=9CKXKnHqCzGr2/IrCZazDaHkbd30MJBbbTCrcp/8Lvo=;
 b=mWdPsRbSpZMJGQwnfM7HIVq/yCGJUmvsv6Zrkce48k1eV5G9RwGTinDfU0vwp5D4Mz
 DzJA5ClWY2sGvuWRBFqOtD1zZNLblufDkS1IODWETPb5t18NetFphEYrHjRrTWCHYXfY
 pOxcXRP6vWhIW33jNnmvQU+ldxrvAx1QabgAvTNDE62xjikMjHn+JjX71cy4/gJUi/CR
 BICBmJoj4mNgM9xbA4G9xjJ4YXQ149RLzBV2n/cJItbSOVFCvm+dR6ZgRzorvPrwrc/z
 u862Wtt4eoHP048JozVeKiz370jMx7CDrbtmhXc6r9g1HBAAouX4I1tfXkBuhvUZOAym
 MHHA==
X-Gm-Message-State: AOAM530gx6SETSZ9OnrtOyzC+f813BuNtobgmd3uD3PXwiK0yzuFC51C
 e7BBwVO9dJL+DKRni3ispYk=
X-Google-Smtp-Source: ABdhPJyAMR65apVZMxHE0L52Jl63GyCVfdFdeKLf03eIzvABsYCQXqwc5EBGgkmlVZQjuUfQDCZpUA==
X-Received: by 2002:a05:600c:b49:b0:38c:93ad:6d4c with SMTP id
 k9-20020a05600c0b4900b0038c93ad6d4cmr1536210wmr.53.1648676376734; 
 Wed, 30 Mar 2022 14:39:36 -0700 (PDT)
Received: from ?IPV6:2600:70ff:f07f:0:403e:ab57:ee68:20ea?
 ([2600:70ff:f07f:0:403e:ab57:ee68:20ea])
 by smtp.gmail.com with ESMTPSA id
 j16-20020a05600c191000b0038c9249ffdesm6372330wmq.9.2022.03.30.14.39.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Mar 2022 14:39:36 -0700 (PDT)
Message-ID: <b55dc107-07ae-9aa5-b4a9-9c5b724e2dc5@gmail.com>
Date: Wed, 30 Mar 2022 23:39:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [PATCH 1/4] target/ppc: initialize 'reg_val' in kvm_get_one_spr()
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
To: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-devel@nongnu.org
References: <20220330210443.597500-1-danielhb413@gmail.com>
 <20220330210443.597500-2-danielhb413@gmail.com>
 <a3211c13-cb5c-ff39-f424-f2efe8b4d706@gmail.com>
 <29927bdd-f236-8694-0426-546bbaa85eb1@gmail.com>
 <71449b19-88b7-0ce5-f963-15fe747d3700@gmail.com>
In-Reply-To: <71449b19-88b7-0ce5-f963-15fe747d3700@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::332
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x332.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: qemu-ppc@nongnu.org, clg@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 30/3/22 23:38, Philippe Mathieu-Daudé wrote:
> On 30/3/22 23:34, Daniel Henrique Barboza wrote:
>> On 3/30/22 18:22, Philippe Mathieu-Daudé wrote:
>>> On 30/3/22 23:04, Daniel Henrique Barboza wrote:
>>>> Valgrind isn't convinced that we are initializing the values we assign
>>>> to env->spr[spr] because it doesn't understand that the 'reg_val' union
>>>> is being written by the kvm_vcpu_ioctl() that follows (via struct
>>>> kvm_one_reg).
>>>>
>>>> This results in Valgrind complaining about uninitialized values every
>>>> time we use env->spr in a conditional, like this instance:
>>>>
>>>> ==707578== Thread 1:
>>>> ==707578== Conditional jump or move depends on uninitialised value(s)
>>>> ==707578==    at 0xA10A40: hreg_compute_hflags_value 
>>>> (helper_regs.c:106)
>>>> ==707578==    by 0xA10C9F: hreg_compute_hflags (helper_regs.c:173)
>>>> ==707578==    by 0xA110F7: hreg_store_msr (helper_regs.c:262)
>>>> ==707578==    by 0xA051A3: ppc_cpu_reset (cpu_init.c:7168)
>>>> ==707578==    by 0xD4730F: device_transitional_reset (qdev.c:799)
>>>> ==707578==    by 0xD4A11B: resettable_phase_hold (resettable.c:182)
>>>> ==707578==    by 0xD49A77: resettable_assert_reset (resettable.c:60)
>>>> ==707578==    by 0xD4994B: resettable_reset (resettable.c:45)
>>>> ==707578==    by 0xD458BB: device_cold_reset (qdev.c:296)
>>>> ==707578==    by 0x48FBC7: cpu_reset (cpu-common.c:114)
>>>> ==707578==    by 0x97B5EB: spapr_reset_vcpu (spapr_cpu_core.c:38)
>>>> ==707578==    by 0x97BABB: spapr_cpu_core_reset (spapr_cpu_core.c:209)
>>>> ==707578==  Uninitialised value was created by a stack allocation
>>>> ==707578==    at 0xB11F08: kvm_get_one_spr (kvm.c:543)
>>>>
>>>> Initializing 'reg_val' has no impact in the logic and makes Valgrind
>>>> output more bearable.
>>>>
>>>> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
>>>> ---
>>>>   target/ppc/kvm.c | 6 ++++--
>>>>   1 file changed, 4 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/target/ppc/kvm.c b/target/ppc/kvm.c
>>>> index dc93b99189..ce1b926e8c 100644
>>>> --- a/target/ppc/kvm.c
>>>> +++ b/target/ppc/kvm.c
>>>> @@ -543,10 +543,12 @@ static void kvm_get_one_spr(CPUState *cs, 
>>>> uint64_t id, int spr)
>>>>   {
>>>>       PowerPCCPU *cpu = POWERPC_CPU(cs);
>>>>       CPUPPCState *env = &cpu->env;
>>>> -    union {
>>>> +    union reg_val {
>>>>           uint32_t u32;
>>>>           uint64_t u64;
>>>> -    } val;
>>>> +    };
>>>> +    /* Init reg_val to avoid "uninitialised value" Valgrind 
>>>> warnings */
>>>> +    union reg_val val = {0};
>>>
>>> This should also work:
>>>
>>> -- >8 --
>>> @@ -546,7 +546,7 @@ static void kvm_get_one_spr(CPUState *cs, 
>>> uint64_t id, int spr)
>>>       union {
>>>           uint32_t u32;
>>>           uint64_t u64;
>>> -    } val;
>>> +    } val = { 0 };
>>
>> Apparently it does work. I'll make a few tests and re-send.
>>
>>
>> Also, do we have an official way of spelling this zeroed struct 
>> initialization? I
>> see several instances of {0} and { 0 } in the code. In this series I 
>> used {0}.
>> ./scripts/checkpatch.pl seems ok with both formats.
> 
> $ git grep -F '= {0}' | wc -l
>        81
> $ git grep -F '= { 0 }' | wc -l
>       112
> $ git grep -F '= { }' | wc -l
>        61
> $ git grep -F '= {}' | wc -l
>       368
> 
> I am not aware of an official way. Apparently '{ }' is the way to go.

I meant '{}' but personally I prefer '{ }' for readability.

