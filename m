Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 670DB546FBC
	for <lists+qemu-devel@lfdr.de>; Sat, 11 Jun 2022 00:48:13 +0200 (CEST)
Received: from localhost ([::1]:51266 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nznQK-0001rj-05
	for lists+qemu-devel@lfdr.de; Fri, 10 Jun 2022 18:48:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49078)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nznNm-0008Fv-LK
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 18:45:34 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:46696)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nznNa-00087q-Lk
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 18:45:34 -0400
Received: by mail-pj1-x102c.google.com with SMTP id
 k5-20020a17090a404500b001e8875e6242so655855pjg.5
 for <qemu-devel@nongnu.org>; Fri, 10 Jun 2022 15:45:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=C+8N9iCm4kTAm98pAo8bzvHGgvCHi7Ij25Cw+uFitp4=;
 b=VMTdwmx+QbXkFpIPEFhXxIBEvawuOHWf8baUozPpdUetrWk9BeM+Ma9RKBrp8BQrd2
 4Ao/9mqcFsXbpVBA3sno74k9lQIAe3IKhY3ue1sguP21ktqnfn7Edh+nz0Y8ZbtUJ3j9
 fBLb4o8c3W+EEwEZYdr1A3TrpTmq/oJpa0ePAOp8Nf97Ym3iSc56ysmTINIQUj98+Gt2
 xFUoEXHhTR0WR4yL5cYXY/EPN/es7hyR5YINffhiKSb3cl97PcSu6Rvmqt8W6JpWJcMN
 gZxxdGTPMGq/m4b3bwTeZwaNUiXaVz3G+1ZwL17hx5SlV7827o7xiTQBBqWxaQ/xtZ8n
 RoJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=C+8N9iCm4kTAm98pAo8bzvHGgvCHi7Ij25Cw+uFitp4=;
 b=d2R9qv2foI/rRjln90DxxUWv+27yEsMhGsLH2HFVvrr8dtaJveocjwlcmY+jHpXco0
 epeWjpWe7nbV6MTVplEr774vW1cu5R5SghGjweUgKVWn0H+iOtpXoGWcLlC05+LvsaIv
 7uuJ/DPLXx37tRIfCMftugOfubT9B2g7IaeJflugflZfFNl4OzKoGz4KXDLvBLKFzt2H
 w5Epdw0WrfU8RMNDqJsFo2r4pMOBYMkK+6FoHEDDGPpDukcmT3lVT62r3JpnluTKZJju
 TjxOdJld7G9M4GsF0KVC/J3NQCCEqLPtEcAbLQR1ZqKjBTrvvvd47Itr90khapGdl84v
 VzsQ==
X-Gm-Message-State: AOAM531lVP7u2Ym/bH2944PKyKm6aLUZzR29A/8MwOR8BhDWXkkqUfFw
 F3THKUgbgmu4lpUKnh9O8X2SYA==
X-Google-Smtp-Source: ABdhPJxQy/+YPg0PP9Xo2iuqEhxADjyYx1T6gUJM/TqNT3eGx3GBZ798usWtppsthxL2L0mUzRc+NA==
X-Received: by 2002:a17:90b:3b8a:b0:1e2:ee1e:6340 with SMTP id
 pc10-20020a17090b3b8a00b001e2ee1e6340mr1999210pjb.38.1654901120975; 
 Fri, 10 Jun 2022 15:45:20 -0700 (PDT)
Received: from [172.21.2.253] ([50.208.55.229])
 by smtp.gmail.com with ESMTPSA id
 a34-20020a056a001d2200b0051874318772sm52270pfx.201.2022.06.10.15.45.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Jun 2022 15:45:20 -0700 (PDT)
Message-ID: <20b38d22-0c59-ec11-88e1-af0f1f604984@linaro.org>
Date: Fri, 10 Jun 2022 15:45:18 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v15 8/9] target/loongarch: Adjust functions and structure
 to support user-mode
Content-Language: en-US
To: gaosong <gaosong@loongson.cn>, qemu-devel@nongnu.org
Cc: laurent@vivier.eu, Xiaojuan Yang <yangxiaojuan@loongson.cn>
References: <20220609024209.2406188-1-gaosong@loongson.cn>
 <20220609024209.2406188-9-gaosong@loongson.cn>
 <4c0fd198-922e-d94f-fec4-05c53c5d6858@linaro.org>
 <e6e9c111-ca44-0126-b7a5-dcffe33385a5@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <e6e9c111-ca44-0126-b7a5-dcffe33385a5@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On 6/9/22 23:53, gaosong wrote:
> Hi Richard,
> 
> On 2022/6/10 上午2:42, Richard Henderson wrote:
>>>   void helper_asrtle_d(CPULoongArchState *env, target_ulong rj, target_ulong rk)
>>>   {
>>>       if (rj > rk) {
>>> +#ifdef CONFIG_USER_ONLY
>>> +        cpu_loop_exit_sigsegv(env_cpu(env), GETPC(),
>>> +                              MMU_DATA_LOAD, true, GETPC());
>>> +#else
>>>           do_raise_exception(env, EXCCODE_ADEM, GETPC());
>>> +#endif
>>
>> This change is wrong.  First, the kernel's do_ade raises SIGBUS. Second, GETPC() is a 
>> host address, not a guest address.  Third, this highlights the fact that the existing 
>> system code is wrong, and should be setting badvaddr.
>>
>> You need to
>> (1) set badvaddr here, and then
>> (2) handle EXCCODE_ADEM in linux-user/loongarch/cpu_loop.c to 
>> force_fix_fault(TARGET_SIGBUS, TARGET_BUS_ADRERR, env->badvaddr). 
> 
> badvaddr is env->pc or base->pc_next?

I don't know.  The documentation for the ASRT{LE,GD}.D instructions is incomplete.

However, from the kernel code,

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/loongarch/kernel/traps.c#n360

I can see that the kernel expects *some* value to be set there.  Given that this is the 
same trap used by the bound check memory accesses, I presume that badvaddr is related to 
the memory access not the PC.  So I would expect badvaddr to be RJ.

But that is a guess.  Please check with your hardware engineers.


r~

