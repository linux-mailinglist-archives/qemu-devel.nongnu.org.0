Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 26EBC382DBF
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 15:43:18 +0200 (CEST)
Received: from localhost ([::1]:40880 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lidWe-00054m-Uv
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 09:43:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44354)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lidV4-000494-G4
 for qemu-devel@nongnu.org; Mon, 17 May 2021 09:41:38 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:42639)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lidV2-0001N4-Pc
 for qemu-devel@nongnu.org; Mon, 17 May 2021 09:41:38 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 f75-20020a1c1f4e0000b0290171001e7329so3641392wmf.1
 for <qemu-devel@nongnu.org>; Mon, 17 May 2021 06:41:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Pp6Wd07gKfy2xP7AcvsN2n6so/Kd05yTttq0fpS4r/E=;
 b=gWkszaZBqdE/7pF+zrjAfWZahD0crpCismcC/cXfXbJmhLFCP7AukSYqP2DRDmbDkQ
 46dBkrrGlU4HznZporyZ6IpJwtK4RZZC6/vbjK8LE3n3mHmc5eD8z78N0Arugm2qWueK
 Fq3g2vczetSP/3YqARXMFSvRWDx09dyHfU8A3PO7Vytb2dnskVoE2dtoI3t7qh9F9fTr
 nMThy2n9Wq41Ev3tmHnnPjfo9mGVU0M9pfaHFwGhtIIYLMc6IbYtqwshsmeVkk9iIsR4
 oiIicye9gBhUqI+XF1LVamK6TeWD3sfpIkV+tw7/xapV2YXMS3W45OQ41No7fvpYTdXF
 Ea/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:from:to:cc:references:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Pp6Wd07gKfy2xP7AcvsN2n6so/Kd05yTttq0fpS4r/E=;
 b=BQbyQwYBzB8ZzAYQJTTWuHZRoE2VgVflF2hp20ppF4a9YcNuPDusDIN2TgT6xpc6Yq
 pBsRxmw/8gQBCiYnqVQK7L+dB3f8w7fochmlXck9kWhiY2SELob3/SJrwJlhzjp3qTqc
 shJCwRNuV8BCPj/hhzXrHxQTKdVcRkzTBfnexo4PW6uydTUCz80xuWWHecUFpECzEKsl
 C+Et1r9WBQz+yFdoXob9QShsapqRd1+zZfKIqActlhxeEtQMQ5TV55b31VMY8hU491e2
 uDNPbkg4z5ChPtVL3HKfakAEmadaGqV/NBTBGyXq8A+Bs4yIOdQ2uPnhcjFY4faNqeIf
 SaOw==
X-Gm-Message-State: AOAM530EBtgpnbSd0WfYd0h9DC0Yzo8LhLqxoES6xml44L/ljL/3hd0C
 /e+zW92RgG2dg/bwdm+zWIvPp4GFC6/8Lw==
X-Google-Smtp-Source: ABdhPJy4qhbGEIsEXrW0uppnzEsRD0oeuETb7qlc8KFpvSFXbaAZIqLEBhVtbwNnRc4FBQad6g12vw==
X-Received: by 2002:a05:600c:4303:: with SMTP id
 p3mr64241846wme.166.1621258895129; 
 Mon, 17 May 2021 06:41:35 -0700 (PDT)
Received: from [192.168.1.36] (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id v12sm15832780wru.73.2021.05.17.06.41.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 May 2021 06:41:34 -0700 (PDT)
Subject: Re: [Qemu-devel] [PATCH 7/7] target/xtensa: move non-HELPER functions
 to helper.c
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
To: Max Filippov <jcmvbkbc@gmail.com>
References: <20190114074855.16891-1-jcmvbkbc@gmail.com>
 <20190114074855.16891-8-jcmvbkbc@gmail.com>
 <CAAdtpL5NoHLoUZR6MQKMg92h=Cm-Fqyc+zJvXz-GWqbtobyu2A@mail.gmail.com>
 <CAMo8BfLotZPVu5XWZ=EKZPgW3yir1Fsddj31Q6jzGcYehhzGbQ@mail.gmail.com>
 <CAMo8Bf+zdmFgRgpq_kCi=jP0KDbHw=9+Ai_46i_Z8veek+qemg@mail.gmail.com>
 <c8189bc2-79e3-3b57-2f4a-54012ed6ebb7@amsat.org>
Message-ID: <a15d3777-311b-bf90-9a56-047417b5c40d@amsat.org>
Date: Mon, 17 May 2021 15:41:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <c8189bc2-79e3-3b57-2f4a-54012ed6ebb7@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x332.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/17/21 3:10 PM, Philippe Mathieu-Daudé wrote:
> On 5/17/21 2:11 PM, Max Filippov wrote:
>> On Mon, May 17, 2021 at 4:50 AM Max Filippov <jcmvbkbc@gmail.com> wrote:
>>>
>>> Hi Philippe,
>>>
>>> On Sun, May 16, 2021 at 10:05 PM Philippe Mathieu-Daudé
>>> <philippe@mathieu-daude.net> wrote:
>>>>
>>>> Hi Max,
>>>>
>>>> On Mon, Jan 14, 2019 at 8:52 AM Max Filippov <jcmvbkbc@gmail.com> wrote:
>>>>>
>>>>> Move remaining non-HELPER functions from op_helper.c to helper.c.
>>>>> No functional changes.
>>>>>
>>>>> Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
>>>>> ---
>>>>>  target/xtensa/helper.c    | 61 ++++++++++++++++++++++++++++++++++++++++++++---
>>>>>  target/xtensa/op_helper.c | 56 -------------------------------------------
>>>>>  2 files changed, 58 insertions(+), 59 deletions(-)
>>>>
>>>>> +void xtensa_cpu_do_unaligned_access(CPUState *cs,
>>>>> +                                    vaddr addr, MMUAccessType access_type,
>>>>> +                                    int mmu_idx, uintptr_t retaddr)
>>>>> +{
>>>>> +    XtensaCPU *cpu = XTENSA_CPU(cs);
>>>>> +    CPUXtensaState *env = &cpu->env;
>>>>> +
>>>>> +    if (xtensa_option_enabled(env->config, XTENSA_OPTION_UNALIGNED_EXCEPTION) &&
>>>>> +        !xtensa_option_enabled(env->config, XTENSA_OPTION_HW_ALIGNMENT)) {
>>>>
>>>> I know this is a simple code movement, but I wonder, what should
>>>> happen when there is
>>>> an unaligned fault and the options are disabled? Is this an impossible
>>>> case (unreachable)?
>>>
>>> It should be unreachable when XTENSA_OPTION_UNALIGNED_EXCEPTION
>>> is disabled. In that case the translation code generates access on aligned
>>> addresses according to the xtensa ISA, see the function
>>> gen_load_store_alignment in target/xtensa/translate.c
>>
>> There's also a case when both options are enabled, i.e. the
>> xtensa core has support for transparent unaligned access.
>> In that case the helper does nothing and the generic TCG
>> code is supposed to deal with the unaligned access correctly,
> 
> IIRC we can simplify as:

I meant 'IIUC' (if I understand correctly)...

> -- >8 --
> diff --git a/target/xtensa/helper.c b/target/xtensa/helper.c
> index eeffee297d1..6e8a6cdc99e 100644
> --- a/target/xtensa/helper.c
> +++ b/target/xtensa/helper.c
> @@ -270,13 +270,14 @@ void xtensa_cpu_do_unaligned_access(CPUState *cs,
>      XtensaCPU *cpu = XTENSA_CPU(cs);
>      CPUXtensaState *env = &cpu->env;
> 
> -    if (xtensa_option_enabled(env->config,
> XTENSA_OPTION_UNALIGNED_EXCEPTION) &&
> -        !xtensa_option_enabled(env->config, XTENSA_OPTION_HW_ALIGNMENT)) {
> -        cpu_restore_state(CPU(cpu), retaddr, true);
> -        HELPER(exception_cause_vaddr)(env,
> -                                      env->pc, LOAD_STORE_ALIGNMENT_CAUSE,
> -                                      addr);
> -    }
> +    assert(xtensa_option_enabled(env->config,
> +                                 XTENSA_OPTION_UNALIGNED_EXCEPTION));
> +    assert(!xtensa_option_enabled(env->config,
> XTENSA_OPTION_HW_ALIGNMENT));
> +
> +    cpu_restore_state(CPU(cpu), retaddr, true);
> +    HELPER(exception_cause_vaddr)(env,
> +                                  env->pc, LOAD_STORE_ALIGNMENT_CAUSE,
> +                                  addr);
>  }
> ---
> 
> ?
> 
> Thanks for the quick response btw :)
> 
> Phil.
> 

