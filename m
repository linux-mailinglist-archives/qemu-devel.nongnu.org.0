Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ECC845752DD
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jul 2022 18:33:23 +0200 (CEST)
Received: from localhost ([::1]:60354 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oC1mD-0008GY-UT
	for lists+qemu-devel@lfdr.de; Thu, 14 Jul 2022 12:33:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36380)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oC1jq-0005bf-DP; Thu, 14 Jul 2022 12:30:54 -0400
Received: from mail-oi1-x232.google.com ([2607:f8b0:4864:20::232]:35769)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oC1jo-0003CI-FR; Thu, 14 Jul 2022 12:30:54 -0400
Received: by mail-oi1-x232.google.com with SMTP id r82so3017978oig.2;
 Thu, 14 Jul 2022 09:30:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=NrTAED/6a/XTrQAmlgTA6OFL3iGwcXC2lo6fwie9b0M=;
 b=DQCP6u3EknckldT3kerB5jR1KPf4odAPG+Y5et95lqY7i9xZgnfx3nHbVV6ME7YrWk
 gf4PYavsjCege7OSwYaVq3xVAV81xPoJzoIylNGwj4dj0RAMOAMHsHT9vF116e6PI5VN
 yr2G6bjAWK96T29cIhpOw7ZBc/Uhgq32pwqykIbUyAxS/gwVpX3ONEmPZYiZg1xlYDaG
 Q443P7c244IMHPamwBg9oKOL7+ARQXPupD6AsL+aezNWNhxxsG90xqKGrCizWh7nmPia
 p7atVBJsaHHmhkAUlyPLCh8l9QMEoBbVeeHkQA92CR/SL/r+iBDXouiXJWgiLoi6FQVx
 sd4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=NrTAED/6a/XTrQAmlgTA6OFL3iGwcXC2lo6fwie9b0M=;
 b=3gh6rLT02fwXEyTQChGfYfgBVTwfYwZGvBgqQ9ckvUs5mps/Vn9TJHlsrh5dPTHeCE
 SSNQdYP0nnb+dGrMPQTNornXyirclGvfdM4eoLgZeUzHnZr0tRW/dMt3ojisaq9aTPYK
 0SCHmCd7xbiNtTTzRe/6SOFGGqGg5DUykkijgutEXCcKDZrBEat6dqiGWMVxnTbXevjy
 9Z/1KErJ9WwWJLjh0dau0Q/M/B06Jqpw1D8x+vHed6SsVTpraK5c2Skj1JR4AWmSBmit
 uuRKGEynpYZ1SVIwJjIjmTRttm/KBLt0/nkp+sawdxw8rAK4DFVSwytWJMx70nHLzucz
 aP0w==
X-Gm-Message-State: AJIora+Y16CutO4yGj2IMuWHxNDhyaPamqQL5qWyfrj4O+rRtqTLUAsK
 +O4MYVTBvul+BPNlNXSpwG4=
X-Google-Smtp-Source: AGRyM1tTAHi/pDYq0mWKYrDc5ongITqt4V7t3292hS93dvxtdxkuNKlEfda8ik8cjR1Qb250UDs4Pw==
X-Received: by 2002:aca:5dc6:0:b0:33a:25e:8d51 with SMTP id
 r189-20020aca5dc6000000b0033a025e8d51mr4955185oib.258.1657816250810; 
 Thu, 14 Jul 2022 09:30:50 -0700 (PDT)
Received: from [192.168.10.102] (201-27-97-88.dsl.telesp.net.br.
 [201.27.97.88]) by smtp.gmail.com with ESMTPSA id
 n13-20020a9d6f0d000000b0061c38aacda1sm823174otq.58.2022.07.14.09.30.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Jul 2022 09:30:50 -0700 (PDT)
Message-ID: <142c452e-6511-47ea-4a93-c925e1f5ceb3@gmail.com>
Date: Thu, 14 Jul 2022 13:30:47 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v2] target/ppc: check tb_env != 0 before printing
 TBU/TBL/DECR
Content-Language: en-US
To: "Matheus K. Ferst" <matheus.ferst@eldorado.org.br>,
 qemu-devel@nongnu.org, qemu-ppc@nongnu.org
Cc: clg@kaod.org, david@gibson.dropbear.id.au, groug@kaod.org
References: <20220713183847.41797-1-matheus.ferst@eldorado.org.br>
 <07a90f40-6ece-57aa-cbe7-15b9e8c37203@gmail.com>
 <03b9bcde-4bde-a7e0-b86a-e1bdb366db12@eldorado.org.br>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <03b9bcde-4bde-a7e0-b86a-e1bdb366db12@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::232;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x232.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 7/14/22 13:17, Matheus K. Ferst wrote:
> On 14/07/2022 10:35, Daniel Henrique Barboza wrote:
>> On 7/13/22 15:38, Matheus Ferst wrote:
>>> When using "-machine none", env->tb_env is not allocated, causing the
>>> segmentation fault reported in issue #85 (launchpad bug #811683). To
>>> avoid this problem, check if the pointer != NULL before calling the
>>> methods to print TBU/TBL/DECR.
>>>
>>> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/85
>>> Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
>>> ---
>>> v2:
>>>   - Added checks in monitor_get_decr, monitor_get_tbu, and monitor_get_tbl.
>>>   - Link to v1: https://lists.gnu.org/archive/html/qemu-ppc/2022-07/msg00173.html
>>> ---
>>>   target/ppc/cpu_init.c | 16 ++++++++--------
>>>   target/ppc/monitor.c  |  9 +++++++++
>>>   2 files changed, 17 insertions(+), 8 deletions(-)
>>>
>>> diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
>>> index 86ad28466a..7e96baac9f 100644
>>> --- a/target/ppc/cpu_init.c
>>> +++ b/target/ppc/cpu_init.c
>>> @@ -7476,18 +7476,18 @@ void ppc_cpu_dump_state(CPUState *cs, FILE *f, int flags)
>>>                    "%08x iidx %d didx %d\n",
>>>                    env->msr, env->spr[SPR_HID0], env->hflags,
>>>                    cpu_mmu_index(env, true), cpu_mmu_index(env, false));
>>> -#if !defined(NO_TIMER_DUMP)
>>
>> Why did you remove the NO_TIMER_DUMP check? Is it redundant with the env->tb_env
>> check?
>>
> 
> This is the only reference to this macro since it was added in d9bce9d99f46. I suppose it was manually defined, but the only discussion[1] I could find around this patch doesn't mention it. I don't see any other reason to define it other than avoiding segfaults in machines that don't allocate env_tb, but we can keep it if you prefer.

Thanks for the explanation. And nah, no need to keep it around since you're
already gating the code by checking  env->tb_env.


Daniel


> 
>>> -    qemu_fprintf(f, "TB %08" PRIu32 " %08" PRIu64
>>> +    if (env->tb_env) {
>>> +        qemu_fprintf(f, "TB %08" PRIu32 " %08" PRIu64
>>>   #if !defined(CONFIG_USER_ONLY)
>>> -                 " DECR " TARGET_FMT_lu
>>> +                     " DECR " TARGET_FMT_lu
>>>   #endif
>>> -                 "\n",
>>> -                 cpu_ppc_load_tbu(env), cpu_ppc_load_tbl(env)
>>> +                     "\n",
>>> +                     cpu_ppc_load_tbu(env), cpu_ppc_load_tbl(env)
>>>   #if !defined(CONFIG_USER_ONLY)
>>> -                 , cpu_ppc_load_decr(env)
>>> -#endif
>>> -        );
>>> +                     , cpu_ppc_load_decr(env)
>>>   #endif
>>> +            );
>>> +    }
>>
>> Not really a problem with your patch, but since you're changing this code, can
>> you please cleanse it from evil? I mean, look at this:
>>
>>
>>      if (env->tb_env) {
>>          qemu_fprintf(f, "TB %08" PRIu32 " %08" PRIu64
>> #if !defined(CONFIG_USER_ONLY)
>>                       " DECR " TARGET_FMT_lu
>> #endif
>>                       "\n",
>>                       cpu_ppc_load_tbu(env), cpu_ppc_load_tbl(env)
>> #if !defined(CONFIG_USER_ONLY)
>>                       , cpu_ppc_load_decr(env)
>> #endif
>>              );
>>      }
>>
>>
>> 2 ifdef macros in the middle of qemu_fprintf() params? With one line starting
>> with a ', '?  Why are we trading sanity for 3 lines of code repetition?
>>
>> We can --at least-- do something like this:
>>
>>      if (env->tb_env) {
>> #if !defined(CONFIG_USER_ONLY)
>>          qemu_fprintf(f, "TB %08" PRIu32 " %08" PRIu64
>>                       " DECR " TARGET_FMT_lu
>>                       "\n",
>>                       cpu_ppc_load_tbu(env), cpu_ppc_load_tbl(env),
>>                       cpu_ppc_load_decr(env));
>> #else
>>          qemu_fprintf(f, "TB %08" PRIu32 " %08" PRIu64
>>                       "\n",
>>                       cpu_ppc_load_tbu(env), cpu_ppc_load_tbl(env));
>> #endif
>>      }
>>
>>
>> Thanks,
>>
>>
>> Daniel
>>
>>
> 
> Sure, I'll change that in v3.
> 
> [1] https://lists.gnu.org/archive/html/qemu-devel/2007-03/msg00239.html
> 
> Thanks,
> Matheus K. Ferst
> Instituto de Pesquisas ELDORADO <http://www.eldorado.org.br/>
> Analista de Software
> Aviso Legal - Disclaimer <https://www.eldorado.org.br/disclaimer.html>

