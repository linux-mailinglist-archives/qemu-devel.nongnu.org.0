Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C055D3EA505
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Aug 2021 14:59:42 +0200 (CEST)
Received: from localhost ([::1]:40930 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mEAJB-0004hk-S4
	for lists+qemu-devel@lfdr.de; Thu, 12 Aug 2021 08:59:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60774)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mEAHy-0003Ge-Ev
 for qemu-devel@nongnu.org; Thu, 12 Aug 2021 08:58:26 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:45625)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mEAHw-0003OS-RE
 for qemu-devel@nongnu.org; Thu, 12 Aug 2021 08:58:26 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 203-20020a1c00d40000b02902e6a4e244e4so4497128wma.4
 for <qemu-devel@nongnu.org>; Thu, 12 Aug 2021 05:58:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=r3pcQEyGniq8eGxf7Ybn8FpWQZxjqWcciNCrN4hfwrE=;
 b=tRQW3tAR429MN/AzH9mM4GGGZH8YJPF/QZrHWzy9pNj9PWIEhyInu5HtNeKxyi7ShH
 u+jSJz3T+GUVo8A1LPCUFWEubaGOWZbZmBeTJp6B29L2diaqC7ciTmvtzNRPKelhDJmC
 T10EckJjFUiR9PMMSCR4ZYG7T/IQINHnWsArFSj3IBML0LO3T2NZSZVcx/BUwDx2/pxm
 ZEKZ0WDOv/H0NDOXgB05O5y8IRpqpvYoy1aSDaavqW+QRHrlTV2UQZHJVtvedD67Hzrk
 6gibwbJrD5FZs/EVRukxJQ1yOy/4OmpbLDBEC6u/KmwWmylO6NJPEoGLfz5EL2qdy5sF
 4fLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=r3pcQEyGniq8eGxf7Ybn8FpWQZxjqWcciNCrN4hfwrE=;
 b=A6dCBp5DPv5A8s6NTTteEHin02t+lLFMsnADdbGK5b0qPc7jd4qJLwe76w8UVFw9AP
 RBorYPHNXk954T15FGgnATHI0f9Lce12dNzNhzjmwMdCZvcMLW5ywmW2LVat0QYnV46T
 Bb1cG9vG/+OglT6qyanMwxPzTDuUa/VFDVHKb0bHScRvlNutA6Q26hUh4kdx/eBDirBs
 ABaRlaj37rXKHKOUF+YdqJ+NBRGrRoECkdJu22RTCCaqcHRqL7We1dCSfUAhomyXGS4P
 qyyTIJ0J+ee/7kzTI2KphwffTh1XSm8jvWVoMmqVBUU0pSKhzaA8Efs2Xo9vVFLE9dk8
 4dqg==
X-Gm-Message-State: AOAM532Ka/SNUL9DRUhEU3htApXBtgtFwj7JJfQ9rf0jBkbFj3FnPJjD
 64cs9mPUoXlECl3RwRK3Yag=
X-Google-Smtp-Source: ABdhPJxatsPZ16OT854PV3qRXy+J7+SF5Rr3cAHm142YPsMREvZF1CsxG93TSMm7z7dD4lL/U93ehg==
X-Received: by 2002:a1c:f214:: with SMTP id s20mr3870977wmc.14.1628773103350; 
 Thu, 12 Aug 2021 05:58:23 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id s10sm3562747wrv.54.2021.08.12.05.58.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Aug 2021 05:58:22 -0700 (PDT)
Subject: Re: [PATCH-for-6.1?] target/i386: Fixed size of constant for Windows
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210812111056.26926-1-laramglazier@gmail.com>
 <1cdc5ffe-adc5-41ac-e588-b8eab62ecc76@amsat.org>
 <CAFEAcA9BwJ4A8bBDZ6cbrW5NHxPHrp5GLZgNVSa=xzZjQyXygQ@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <fa3d3493-6e4f-d311-3e26-c3b94b9830e3@amsat.org>
Date: Thu, 12 Aug 2021 14:58:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9BwJ4A8bBDZ6cbrW5NHxPHrp5GLZgNVSa=xzZjQyXygQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
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
Cc: Thomas Huth <thuth@redhat.com>, Lara Lazier <laramglazier@gmail.com>,
 =?UTF-8?Q?Volker_R=c3=bcmelin?= <vr_qemu@t-online.de>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/12/21 2:54 PM, Peter Maydell wrote:
> On Thu, 12 Aug 2021 at 12:38, Philippe Mathieu-Daudé <f4bug@amsat.org> wrote:
>>
>> On 8/12/21 1:10 PM, Lara Lazier wrote:
>>> ~0UL has 64 bits on Linux and 32 bits on Windows.
>>
>>> Fixes: https://gitlab.com/qemu-project/qemu/-/issues/512".
>>
>> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/512
>> Fixes: 3407259b20c ("target/i386: Added consistency checks for CR3")
>>
>>> Reported-by: Volker Rümelin <vr_qemu@t-online.de>
>>> Signed-off-by: Lara Lazier <laramglazier@gmail.com>
>>> ---
>>>  target/i386/tcg/sysemu/misc_helper.c | 2 +-
>>>  target/i386/tcg/sysemu/svm_helper.c  | 2 +-
>>>  2 files changed, 2 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/target/i386/tcg/sysemu/misc_helper.c b/target/i386/tcg/sysemu/misc_helper.c
>>> index 0a7a58ca9a..91b0fc916b 100644
>>> --- a/target/i386/tcg/sysemu/misc_helper.c
>>> +++ b/target/i386/tcg/sysemu/misc_helper.c
>>> @@ -97,7 +97,7 @@ void helper_write_crN(CPUX86State *env, int reg, target_ulong t0)
>>>          break;
>>>      case 3:
>>>          if ((env->efer & MSR_EFER_LMA) &&
>>> -                (t0 & ((~0UL) << env_archcpu(env)->phys_bits))) {
>>> +                (t0 & ((~0ULL) << env_archcpu(env)->phys_bits))) {
>>
>> Maybe safer to use extract64()? I'm not sure how many bits you want
>> to check, so used TARGET_LONG_BITS:
>>
>>             extract64(t0, env_archcpu(env)->phys_bits,
>>                       TARGET_LONG_BITS - env_archcpu(env)->phys_bits) {
> 
> The repetition of the 'phys_bits' expression in both the shift and the
> length field is pretty awkward. Maybe
> 
>   t0 & ~MAKE_64BIT_MASK(0, env_archcpu(env)->phys_bits)

Ah, nicer.

> But for this bugfix I think just fixing the suffix is fine.

Sure.

> 
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

>>>              cpu_vmexit(env, SVM_EXIT_ERR, 0, GETPC());
>>>          }
>>>          if (!(env->efer & MSR_EFER_LMA)) {
>>> diff --git a/target/i386/tcg/sysemu/svm_helper.c b/target/i386/tcg/sysemu/svm_helper.c
>>> index 3891f4e4a8..42cd5053e5 100644
>>> --- a/target/i386/tcg/sysemu/svm_helper.c
>>> +++ b/target/i386/tcg/sysemu/svm_helper.c
>>> @@ -290,7 +290,7 @@ void helper_vmrun(CPUX86State *env, int aflag, int next_eip_addend)
>>>      }
>>>      new_cr3 = x86_ldq_phys(cs, env->vm_vmcb + offsetof(struct vmcb, save.cr3));
>>>      if ((env->efer & MSR_EFER_LMA) &&
>>> -            (new_cr3 & ((~0UL) << cpu->phys_bits))) {
>>> +            (new_cr3 & ((~0ULL) << cpu->phys_bits))) {
>>>          cpu_vmexit(env, SVM_EXIT_ERR, 0, GETPC());
>>>      }
>>>      new_cr4 = x86_ldq_phys(cs, env->vm_vmcb + offsetof(struct vmcb, save.cr4));
>>>
>>
>> Any idea how to avoid that class of bug? Some CFLAG or plain checkpatch?
> 
> In general the 'UL' is often dubious and worth checking --
> either 'U' suffices or you wanted 'ULL'. But in a few places
> where you're actually working with 'unsigned long' it's what
> you need, so I'm not sure a checkpatch rule would be possible.

OK, thanks.

