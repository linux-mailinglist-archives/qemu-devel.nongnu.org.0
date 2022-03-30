Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F2CCB4ECEE4
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Mar 2022 23:36:00 +0200 (CEST)
Received: from localhost ([::1]:51460 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZfyy-0003gw-2h
	for lists+qemu-devel@lfdr.de; Wed, 30 Mar 2022 17:36:00 -0400
Received: from eggs.gnu.org ([209.51.188.92]:36940)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nZfxW-0002sM-Mj; Wed, 30 Mar 2022 17:34:30 -0400
Received: from [2607:f8b0:4864:20::229] (port=44986
 helo=mail-oi1-x229.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nZfxV-0004T1-2h; Wed, 30 Mar 2022 17:34:30 -0400
Received: by mail-oi1-x229.google.com with SMTP id t21so18536230oie.11;
 Wed, 30 Mar 2022 14:34:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=qqjbIjO/VCCfOluwvM7prdF9heNteBfWPxQeJwv+f2w=;
 b=Hg2HUdb0eiCRnPU21tErYk/UFnRX//kZuo8B2DlblvQJV1DJQ7Wwr4TvbsZMfhU/v2
 6mF5KIMtSRso7qfYqfZyy0tW5uKhq3VIp5yGlMCfBH3RsDGF70T4plnu+vD2hSLttNyf
 MeQYdguRsH/dUEMiFH6A6YEx+ofhtLQ8a3HHdSuWb7GYJ+PZPB0wRdxa6mKN+ZNSuF/1
 qDljqMXM3HWssCgPkGaNsN+vZmOXnRQB/mEWnV5uxLtEpUUGva8qbv5XqBoNw78TyFBd
 d3uri0PznJjxHHrFtvS2/XJWAtVPbvwdEeauSa2lQs8f1yeYxDp8sdvqzMwmIc4wIjeO
 50mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=qqjbIjO/VCCfOluwvM7prdF9heNteBfWPxQeJwv+f2w=;
 b=lQkgclhGQGmb1YrWBztJlvokIAbb7ovr5LsK5OL0ZB2NLMwlEXd/C/cbBo8uvPVHBs
 mJimIqNP79WCb4lSJxNndHfxcP2kUf/hzEC02CasBlcKBoAj6MeVZrHuNtoLFM87J3z8
 H9cLblK5h2ZIVJSBfcLrLNip0Jv/hqPJdDsX5O/+6pDuJHx29BrUgFY3jlJINwJECzJt
 RHcWZio/8fbcuQLLewDOw7Pml1E1zm7yJSNbGQcufrweTLABnZpliqsuTglYvYpSvDUo
 /V7MfC3Zo/tQHxKVrFW6M5dVK7e09f4ROEskLWqVAGF+AW3zyHaQj473HWym9aerRE+C
 ESeA==
X-Gm-Message-State: AOAM531NbcSy8X8zs8NWPsjYaWPO2qcfxSs5BB2FApf216UOVFoE5Crq
 NhXzBvMvkr0kyPYkkZxzjCM=
X-Google-Smtp-Source: ABdhPJyFaP4t/wiQr5HhBcORmmOkHpYirt18H9wdfHXwg8kEHGMc3UZ20fUGz3/amroskVQR8L5dhg==
X-Received: by 2002:a05:6808:ec1:b0:2f7:4de5:3c64 with SMTP id
 q1-20020a0568080ec100b002f74de53c64mr1104250oiv.146.1648676067639; 
 Wed, 30 Mar 2022 14:34:27 -0700 (PDT)
Received: from ?IPV6:2804:431:c7c6:abe8:ed:2c78:ab0c:7946?
 ([2804:431:c7c6:abe8:ed:2c78:ab0c:7946])
 by smtp.gmail.com with ESMTPSA id
 n15-20020aca240f000000b002da2fc73741sm10722281oic.33.2022.03.30.14.34.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Mar 2022 14:34:27 -0700 (PDT)
Message-ID: <29927bdd-f236-8694-0426-546bbaa85eb1@gmail.com>
Date: Wed, 30 Mar 2022 18:34:24 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 1/4] target/ppc: initialize 'reg_val' in kvm_get_one_spr()
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>, qemu-devel@nongnu.org
References: <20220330210443.597500-1-danielhb413@gmail.com>
 <20220330210443.597500-2-danielhb413@gmail.com>
 <a3211c13-cb5c-ff39-f424-f2efe8b4d706@gmail.com>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <a3211c13-cb5c-ff39-f424-f2efe8b4d706@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::229
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::229;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x229.google.com
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
Cc: qemu-ppc@nongnu.org, clg@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 3/30/22 18:22, Philippe Mathieu-Daudé wrote:
> On 30/3/22 23:04, Daniel Henrique Barboza wrote:
>> Valgrind isn't convinced that we are initializing the values we assign
>> to env->spr[spr] because it doesn't understand that the 'reg_val' union
>> is being written by the kvm_vcpu_ioctl() that follows (via struct
>> kvm_one_reg).
>>
>> This results in Valgrind complaining about uninitialized values every
>> time we use env->spr in a conditional, like this instance:
>>
>> ==707578== Thread 1:
>> ==707578== Conditional jump or move depends on uninitialised value(s)
>> ==707578==    at 0xA10A40: hreg_compute_hflags_value (helper_regs.c:106)
>> ==707578==    by 0xA10C9F: hreg_compute_hflags (helper_regs.c:173)
>> ==707578==    by 0xA110F7: hreg_store_msr (helper_regs.c:262)
>> ==707578==    by 0xA051A3: ppc_cpu_reset (cpu_init.c:7168)
>> ==707578==    by 0xD4730F: device_transitional_reset (qdev.c:799)
>> ==707578==    by 0xD4A11B: resettable_phase_hold (resettable.c:182)
>> ==707578==    by 0xD49A77: resettable_assert_reset (resettable.c:60)
>> ==707578==    by 0xD4994B: resettable_reset (resettable.c:45)
>> ==707578==    by 0xD458BB: device_cold_reset (qdev.c:296)
>> ==707578==    by 0x48FBC7: cpu_reset (cpu-common.c:114)
>> ==707578==    by 0x97B5EB: spapr_reset_vcpu (spapr_cpu_core.c:38)
>> ==707578==    by 0x97BABB: spapr_cpu_core_reset (spapr_cpu_core.c:209)
>> ==707578==  Uninitialised value was created by a stack allocation
>> ==707578==    at 0xB11F08: kvm_get_one_spr (kvm.c:543)
>>
>> Initializing 'reg_val' has no impact in the logic and makes Valgrind
>> output more bearable.
>>
>> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
>> ---
>>   target/ppc/kvm.c | 6 ++++--
>>   1 file changed, 4 insertions(+), 2 deletions(-)
>>
>> diff --git a/target/ppc/kvm.c b/target/ppc/kvm.c
>> index dc93b99189..ce1b926e8c 100644
>> --- a/target/ppc/kvm.c
>> +++ b/target/ppc/kvm.c
>> @@ -543,10 +543,12 @@ static void kvm_get_one_spr(CPUState *cs, uint64_t id, int spr)
>>   {
>>       PowerPCCPU *cpu = POWERPC_CPU(cs);
>>       CPUPPCState *env = &cpu->env;
>> -    union {
>> +    union reg_val {
>>           uint32_t u32;
>>           uint64_t u64;
>> -    } val;
>> +    };
>> +    /* Init reg_val to avoid "uninitialised value" Valgrind warnings */
>> +    union reg_val val = {0};
> 
> This should also work:
> 
> -- >8 --
> @@ -546,7 +546,7 @@ static void kvm_get_one_spr(CPUState *cs, uint64_t id, int spr)
>       union {
>           uint32_t u32;
>           uint64_t u64;
> -    } val;
> +    } val = { 0 };

Apparently it does work. I'll make a few tests and re-send.


Also, do we have an official way of spelling this zeroed struct initialization? I
see several instances of {0} and { 0 } in the code. In this series I used {0}.
./scripts/checkpatch.pl seems ok with both formats.


Thanks,


Daniel


> ---

