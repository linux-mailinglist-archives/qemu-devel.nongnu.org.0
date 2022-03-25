Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F3D44E781D
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Mar 2022 16:41:00 +0100 (CET)
Received: from localhost ([::1]:56464 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nXm3e-0000uu-Rw
	for lists+qemu-devel@lfdr.de; Fri, 25 Mar 2022 11:40:58 -0400
Received: from eggs.gnu.org ([209.51.188.92]:45864)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nXm2D-0000EP-Mg
 for qemu-devel@nongnu.org; Fri, 25 Mar 2022 11:39:29 -0400
Received: from [2001:4860:4864:20::2d] (port=35661
 helo=mail-oa1-x2d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nXm2C-0002Ph-1L
 for qemu-devel@nongnu.org; Fri, 25 Mar 2022 11:39:29 -0400
Received: by mail-oa1-x2d.google.com with SMTP id
 586e51a60fabf-de48295467so8492847fac.2
 for <qemu-devel@nongnu.org>; Fri, 25 Mar 2022 08:39:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=vor0zhVA5TV3EAkvwz+5zJQhbIL1gBO2eCdUuf3i7SY=;
 b=njTglcT5HSsmFBjVZ4yqrC2jZX5wlRegWOcnqLGlpokIEPUMQYwznKigZvAYlOMiJ5
 WOw8hlOobuz6JziWKvHsNp0ZkYYOdGRVezhUgPKL+WTXGuAlH4rhLg/et3F6tYG/TpGR
 VHw/Ha9+mlC60MTTd/i/chctqbn7EqiHnfdscA0ViohDUn1IPlUhZFxrDbpOknkJRpss
 SvYKytNHNBeVRt79VWIEwnMHl9Vftn5n2ALgmIoemkddsb6GMi8LtuqeD6mVJnK9cg4w
 FmjxI8HgHxB8c6lJyBAagwFoQNTBISm9U2efnaBN7Bf7kNoCm5lhwdHx2QcP1vtwVpon
 q4Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=vor0zhVA5TV3EAkvwz+5zJQhbIL1gBO2eCdUuf3i7SY=;
 b=ZXERgULEyqUt1U9r36r/2nDX6/+DNXzZb+evII/tEp6LM1h4xyxzoHbP8APsd8Ek/e
 iVf4RkQZTObyrkNlxwWmQtLZsojIOvL478nwLKdL0Ab7GmIJrXmlN+C3Bf4sTEFxbzmB
 FiKCci1EXaqNkayB+h27hVePrY3IPf/UeFgOEmWoiluK2RhhgSUYFnXqPne44XTCoQUm
 M603MYDITshjPmBrXC6q53aF0elvAikN7dOWGeo+9ziP3gqC7Tp7aS9WIUg8YX0Tm7lf
 TGYx+TboY94C2JXJFOX9iMBmqRu6FftW4j9ZJGqgtiuEP8Jb5LRPYHbIayCQjM2Y0IYR
 XYnQ==
X-Gm-Message-State: AOAM532qd15ZuRc3vPw3vPkmnC142hLootc5ucHrB8BlXDT5NzjSWBJC
 8k3qh1sMuT6Z/lmBbqg3+VVn/gyBtWIHjYl8aHA=
X-Google-Smtp-Source: ABdhPJw1eQZGCRRWlA82Ppg4FefB01x4XGxfLKeCZQWf3oxEDbF42uvPDTqFCvfgNvT90qQbMI0pwA==
X-Received: by 2002:a05:6870:e749:b0:dd:ed4f:a35a with SMTP id
 t9-20020a056870e74900b000dded4fa35amr8963933oak.44.1648222434464; 
 Fri, 25 Mar 2022 08:33:54 -0700 (PDT)
Received: from [172.24.8.129] (168.189-204-159.bestelclientes.com.mx.
 [189.204.159.168]) by smtp.gmail.com with ESMTPSA id
 e2-20020a0568301f2200b005cdafdea1d9sm2832318oth.50.2022.03.25.08.33.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Mar 2022 08:33:53 -0700 (PDT)
Message-ID: <6b890636-e138-32b9-90dc-df5aef78fa09@linaro.org>
Date: Fri, 25 Mar 2022 09:33:46 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 1/7] linux-user/nios2: Fix clone child return
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
References: <20220320160009.2665152-1-richard.henderson@linaro.org>
 <20220320160009.2665152-2-richard.henderson@linaro.org>
 <CAFEAcA_h7pQsaYJ9m_6L0PYD0wYsUa959Kg-SsAR93d+SzXkrQ@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA_h7pQsaYJ9m_6L0PYD0wYsUa959Kg-SsAR93d+SzXkrQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2001:4860:4864:20::2d
 (failed)
Received-SPF: pass client-ip=2001:4860:4864:20::2d;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x2d.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: alex.bennee@linaro.org, qemu-devel@nongnu.org, Laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/25/22 05:49, Peter Maydell wrote:
> On Sun, 20 Mar 2022 at 16:12, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> The child side of clone needs to set the secondary
>> syscall return value, r7, to indicate syscall success.
>>
>> Advance the pc before do_syscall, so that the new thread
>> does not re-execute the clone syscall.
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>   linux-user/nios2/target_cpu.h | 1 +
>>   linux-user/nios2/cpu_loop.c   | 4 +---
>>   2 files changed, 2 insertions(+), 3 deletions(-)
>>
>> diff --git a/linux-user/nios2/target_cpu.h b/linux-user/nios2/target_cpu.h
>> index 2d2008f002..830b4c0741 100644
>> --- a/linux-user/nios2/target_cpu.h
>> +++ b/linux-user/nios2/target_cpu.h
>> @@ -27,6 +27,7 @@ static inline void cpu_clone_regs_child(CPUNios2State *env, target_ulong newsp,
>>           env->regs[R_SP] = newsp;
>>       }
>>       env->regs[R_RET0] = 0;
>> +    env->regs[7] = 0;
>>   }
>>
>>   static inline void cpu_clone_regs_parent(CPUNios2State *env, unsigned flags)
>> diff --git a/linux-user/nios2/cpu_loop.c b/linux-user/nios2/cpu_loop.c
>> index 1e93ef34e6..a3acaa92ca 100644
>> --- a/linux-user/nios2/cpu_loop.c
>> +++ b/linux-user/nios2/cpu_loop.c
>> @@ -42,8 +42,7 @@ void cpu_loop(CPUNios2State *env)
>>           case EXCP_TRAP:
>>               switch (env->error_code) {
>>               case 0:
>> -                qemu_log_mask(CPU_LOG_INT, "\nSyscall\n");
>> -
> 
> Are you deliberately dropping this logging? If so, at least
> mention it in the commit message, but it doesn't really seem
> related to the rest of the patch...

It was intentional, but I meant to do it separately.

>> @@ -56,7 +55,6 @@ void cpu_loop(CPUNios2State *env)
>>                   env->regs[2] = abs(ret);
>>                   /* Return value is 0..4096 */
>>                   env->regs[7] = ret > 0xfffff000u;
>> -                env->regs[R_PC] += 4;
>>                   break;
> 
> It feels a bit odd to be advancing the PC in the cpu-loop, because
> on the real hardware you get this for free because 'trap' sets
> ea to PC+4 and you just return to ea. But it works, I guess.

I thought of this in relation to the other trap patch set.  I think we should indeed raise 
the exception with the pc already advanced, as per hw.  This would avoid the need for 
nios2_cpu_do_interrupt to do it, except in the case of EXCP_IRQ.

But at present the translator is raising EXCP_TRAP with pc = trap insn.

> (The nios2 "use r2 and r7 for syscall return information" API
> seems like an unnecessary use of the architectural weirdness
> budget on their part, but whatever.)

Indeed.


r~

