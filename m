Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1568B515378
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Apr 2022 20:17:31 +0200 (CEST)
Received: from localhost ([::1]:54106 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nkVBJ-0003Gj-Ml
	for lists+qemu-devel@lfdr.de; Fri, 29 Apr 2022 14:17:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50798)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nkV8k-0001me-He
 for qemu-devel@nongnu.org; Fri, 29 Apr 2022 14:14:52 -0400
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433]:38900)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nkV8i-0007DW-NG
 for qemu-devel@nongnu.org; Fri, 29 Apr 2022 14:14:50 -0400
Received: by mail-pf1-x433.google.com with SMTP id g8so5170554pfh.5
 for <qemu-devel@nongnu.org>; Fri, 29 Apr 2022 11:14:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=PI/dls5qJxDS1ruA8upB0SazkJnGvk19z1T1dEO9I2k=;
 b=VkrUFuHvAE98bneobH996xEZgG/gDFXLl+n1R5oteTnssajbRjjn1Yd8ajJKvkS+dj
 k90WMu7sU80t5LiBM/LO9KxWC3R/ZZF5K/T4M1t7opXL81Q4LuXLIsqi0Vy6IdOoX2oW
 VkdbcmXeT6kPGD6RaMErQmdgUzEvO7Ee1KdwXj2BA2FBe8nIQ7PS8jgV+DZACbP1kZhV
 cJinQYc3WQmQLQzmprFyJy7LVMcb1eIYH1JhX7hTpcL/UwuVZTz9c+g853iWUneRlTqx
 iXKiZ2jwXe9J0XS1vM2lAlHcEdA7XUhrREpbej+RcR087n3hPvlcXojPat8LFycAVh1y
 Pg3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=PI/dls5qJxDS1ruA8upB0SazkJnGvk19z1T1dEO9I2k=;
 b=57D8fAEMVhxD0Q5IfvDWIuQv9+WRl0UemlCZwyYDLAaeLH4mXw6TLqWr668tLRkEYC
 baSfjCZZfuZZ51mNscCYzsMnuAEzXBVtZ/ThiozsaB4AmpQ1/3rok0WHieCzV5uzksPw
 g4W9SyM3ckprzubJX9KI6G2Tj9BV6VOnn7EQWoLPg86bWPLiGQmUvhPAL8VZALeSme9c
 VXLlxx0DEHovB+4/qm2RAo9SgBu5PhnXBvwHY9mrxIzrhULUukZrml8zOR3c6AszrilF
 /KvduNwn7kmv/Y14J3wmINsOiP35m871DpIaJ8VsPfdhOanWHPpIsKm2oaVk2JWgQpE3
 uqBA==
X-Gm-Message-State: AOAM531GpvigsjSDlpoQL3klrjMdWKAOW9oN11x5G+K+eUnn1QPZ9nvc
 1ZExQBNT0PH3SHgc9Sks+Nj3vw==
X-Google-Smtp-Source: ABdhPJwR+O0AXE5zTrGp9HmbUrHOxnBM54mLoV0bUt+tuvXZ+VrqlcNjEQ9m7T43i3cqmtD4L7KCVA==
X-Received: by 2002:a05:6a00:1585:b0:50d:a8b9:d414 with SMTP id
 u5-20020a056a00158500b0050da8b9d414mr537890pfk.56.1651256087166; 
 Fri, 29 Apr 2022 11:14:47 -0700 (PDT)
Received: from [192.168.1.6] ([71.212.142.129])
 by smtp.gmail.com with ESMTPSA id
 z6-20020a63e106000000b003c14af5061bsm6873128pgh.51.2022.04.29.11.14.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Apr 2022 11:14:46 -0700 (PDT)
Message-ID: <c9c83ad3-8fd3-da38-b0b6-15f7c8a7c8c3@linaro.org>
Date: Fri, 29 Apr 2022 11:14:44 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: s390x regression - Re: [PATCH v5 21/26] linux-user/s390x:
 Implement setup_sigtramp
Content-Language: en-US
To: Ulrich Weigand <Ulrich.Weigand@de.ibm.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
References: <20210929130553.121567-1-richard.henderson@linaro.org>
 <20210929130553.121567-22-richard.henderson@linaro.org>
 <cc4c1322a26533ca694985a5cf70d0e0aa9cea26.camel@de.ibm.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <cc4c1322a26533ca694985a5cf70d0e0aa9cea26.camel@de.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x433.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: "qemu-s390x@nongnu.org" <qemu-s390x@nongnu.org>,
 "f4bug@amsat.org" <f4bug@amsat.org>,
 "alex.bennee@linaro.org" <alex.bennee@linaro.org>,
 "laurent@vivier.eu" <laurent@vivier.eu>, Ilya Leoshkevich <iii@de.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/28/22 11:15, Ulrich Weigand wrote:
> Richard Henderson <richard.henderson@linaro.org> wrote:
> 
>> Create and record the two signal trampolines.
>> Use them when the guest does not use SA_RESTORER.
> 
> This patch caused a regression when running the wasmtime CI under qemu:
> https://github.com/bytecodealliance/wasmtime/pull/4076
> 
> The problem is that this part:
> 
>> diff --git a/linux-user/s390x/signal.c b/linux-user/s390x/signal.c
>> index 80f34086d7..676b948147 100644
>> --- a/linux-user/s390x/signal.c
>> +++ b/linux-user/s390x/signal.c
>> @@ -68,7 +68,6 @@ typedef struct {
>>      target_sigregs sregs;
>>      int signo;
>>      target_sigregs_ext sregs_ext;
>> -    uint16_t retcode;
>> } sigframe;
>>
>> #define TARGET_UC_VXRS 2
>> @@ -85,7 +84,6 @@ struct target_ucontext {
>>
>> typedef struct {
>>      uint8_t callee_used_stack[__SIGNAL_FRAMESIZE];
>> -    uint16_t retcode;
>>      struct target_siginfo info;
>>      struct target_ucontext uc;
>> } rt_sigframe;
> 
> changes the layout of the signal stack frame that is visible from user
> space.  Some user space code, in particular the GCC unwinder
> (s390_fallback_frame_state in libgcc), relies on that layout and no
> longer works correctly if it is changed.
> 
> 
> Reverting just those two hunks above on top of QEMU 7.0 makes the
> wasmtime CI pass again.  (Actually, just the second hunk is enough; the
> first hunk is not visible since the removed variable is at the very top
> of the frame.)

Ah, quite right -- I had read the comment for sigframe,

         __u16 svc_insn;         /* Offset of svc_insn is NOT fixed! */


and incorrectly assumed that applied to rt_sigframe too.
So, yes, the second hunk should be reverted, with a comment that it is not used and not 
even initialized by the kernel.


r~

