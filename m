Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E83252081C
	for <lists+qemu-devel@lfdr.de>; Tue, 10 May 2022 01:02:44 +0200 (CEST)
Received: from localhost ([::1]:52702 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1noCOp-0000BK-7c
	for lists+qemu-devel@lfdr.de; Mon, 09 May 2022 19:02:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41620)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1noCNx-0007nd-P5
 for qemu-devel@nongnu.org; Mon, 09 May 2022 19:01:49 -0400
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632]:45596)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1noCNw-0004yp-0H
 for qemu-devel@nongnu.org; Mon, 09 May 2022 19:01:49 -0400
Received: by mail-pl1-x632.google.com with SMTP id q18so2288418pln.12
 for <qemu-devel@nongnu.org>; Mon, 09 May 2022 16:01:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=E4vwhhkC5j6YrgYDqBNPDz0QorDtzFEKj2kzyIFab48=;
 b=rUwOrFP/M3p2tqH+jrsgGhAi/TXG8EtR76vcVc0vIMHFmUk2RYU4DoAc9FgEHYchXI
 vhUi/eTQ+HXKtVhKLak6pPt9GbjmREWl5TTM9BGmeI2m7mgVjTHl3faHoFgiOQR8dq8a
 MGauiKC48UTRcKzVmtefBTUtePE+1bTkT22YFDgjSblnMkqoFCzexNSMcqf+97GGde2Q
 tHJuSdBhL93R2eASamW0nJOy0KyfXRP+pkuMdVURGM/MOF33eNnQJRkSFNvz8yxDFaW6
 I1x9J4xvCfAZmQCpRaWq3IPuFCCIpdg3oU3ldCZXwOMUpvNGqt3tbXwsBnGFZWqrnIId
 dn2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=E4vwhhkC5j6YrgYDqBNPDz0QorDtzFEKj2kzyIFab48=;
 b=qNvoFujkUIiXCHfIZKnWME8l8AArZpUeNpLnbIJbFGPUADW2VOt9JxqZwQND7Eoaa+
 xC7S7pxHVcum2NdsyPihVfxcf13TivIbhbzRtAUybqEHwSjaE4htrWcDZbJGpVrSfBBb
 KUfS81+DKQgPdSte0uA7LEgVRX3H75y5OM0IYja4k3O8RN8CaFtePib7fSuSDNs0bdXm
 C0v4BRR8Tyw6eQEwEBdE49Or5yAhpK/RZUvgSHvmoyPKSei7oz2rYMWBYdQvH4Tr4l9w
 P8gXiMbanAfkDkAp8YErC2UAkC/x6NWj76qRzdleSQBemz5dFG/Rukz7ulM9EukE+zvv
 uj5w==
X-Gm-Message-State: AOAM532L/CtA306eH0PtnA5xmJV8mJnisDwl33YHrTprMhWtr69B0b2Y
 qL2z4OUKCWwhSPbC/TXV7WCNdw==
X-Google-Smtp-Source: ABdhPJxltpMNOtmN4Z5V1AZogsAMKv+kdl0l+XuOtZUk7PW08EpgKsNfVMcSNRoar9KPjqasjwOsgA==
X-Received: by 2002:a17:902:f144:b0:15e:cd78:e36e with SMTP id
 d4-20020a170902f14400b0015ecd78e36emr18303928plb.144.1652137306359; 
 Mon, 09 May 2022 16:01:46 -0700 (PDT)
Received: from [192.168.1.6] ([71.212.142.129])
 by smtp.gmail.com with ESMTPSA id
 u9-20020a17090a1f0900b001d26c7d5aacsm254166pja.13.2022.05.09.16.01.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 May 2022 16:01:45 -0700 (PDT)
Message-ID: <bcd3200c-54b1-3647-a165-fe7c5f7687c9@linaro.org>
Date: Mon, 9 May 2022 16:01:43 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 2/2] target/ppc: Fix FPSCR.FI changing in
 float_overflow_excp()
Content-Language: en-US
To: =?UTF-8?Q?V=c3=adctor_Colombo?= <victor.colombo@eldorado.org.br>,
 qemu-devel@nongnu.org, qemu-ppc@nongnu.org
Cc: clg@kaod.org, danielhb413@gmail.com, david@gibson.dropbear.id.au,
 groug@kaod.org
References: <20220509124836.27819-1-victor.colombo@eldorado.org.br>
 <20220509124836.27819-3-victor.colombo@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220509124836.27819-3-victor.colombo@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x632.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/9/22 07:48, Víctor Colombo wrote:
> This patch fixes another not-so-clear situation in Power ISA
> regarding the inexact bits in FPSCR. The ISA states that:
> 
> """
> When Overflow Exception is disabled (OE=0) and an
> Overflow Exception occurs, the following actions are
> taken:
> ...
> 2. Inexact Exception is set
> XX <- 1
> ...
> FI is set to 1
> ...
> """
> 
> However, when tested on a Power 9 hardware, some instructions that
> trigger an OX don't set the FI bit:
> 
> xvcvdpsp(0x4050533fcdb7b95ff8d561c40bf90996) = FI: CLEARED -> CLEARED
> xvnmsubmsp(0xf3c0c1fc8f3230, 0xbeaab9c5) = FI: CLEARED -> CLEARED
> (just a few examples. Other instructions are also affected)
> 
> The root cause for this seems to be that only instructions that list
> the bit FI in the "Special Registers Altered" should modify it.
> 
> QEMU is, today, not working like the hardware:
> 
> xvcvdpsp(0x4050533fcdb7b95ff8d561c40bf90996) = FI: CLEARED -> SET
> xvnmsubmsp(0xf3c0c1fc8f3230, 0xbeaab9c5) = FI: CLEARED -> SET
> 
> (all tests assume FI is cleared beforehand)
> 
> Fix this by passing an argument to float_overflow_excp() indicating
> if the FI should be set.
> 
> Signed-off-by: Víctor Colombo <victor.colombo@eldorado.org.br>
> ---
>   target/ppc/fpu_helper.c | 8 +++++---
>   1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/target/ppc/fpu_helper.c b/target/ppc/fpu_helper.c
> index 773c80e12d..ee1259ede1 100644
> --- a/target/ppc/fpu_helper.c
> +++ b/target/ppc/fpu_helper.c
> @@ -329,7 +329,7 @@ static inline void float_zero_divide_excp(CPUPPCState *env, uintptr_t raddr)
>       }
>   }
>   
> -static inline void float_overflow_excp(CPUPPCState *env)
> +static inline void float_overflow_excp(CPUPPCState *env, bool set_fi)
>   {
>       CPUState *cs = env_cpu(env);
>   
> @@ -345,7 +345,9 @@ static inline void float_overflow_excp(CPUPPCState *env)
>           env->error_code = POWERPC_EXCP_FP | POWERPC_EXCP_FP_OX;
>       } else {
>           env->fpscr |= FP_XX;
> -        env->fpscr |= FP_FI;
> +        if (set_fi) {
> +            env->fpscr |= FP_FI;
> +        }


Again, I believe setting FP_FI here is wrong, it should only be set later in 
do_float_check_status.  Indeed, setting XX here probably isn't best...
..
> @@ -471,7 +473,7 @@ static void do_float_check_status(CPUPPCState *env, bool change_fi,
>       int status = get_float_exception_flags(&env->fp_status);
>   
>       if (status & float_flag_overflow) {
> -        float_overflow_excp(env);
> +        float_overflow_excp(env, change_fi);

I think the ideal solution would be to return an update to status from float_overflow_excp 
so that all of the inexact handling happens below.  Since inexact is the last bit to be 
processed, this could be as simple as

     if (status & overflow) {
         status = float_overflow_excp(env);
     } else if (status & underflow) {
         ...
     }
     if (status & inexact) {
     ...

returning OE ? 0 : float_flag_inexact, without trying to merge inexact into the full set 
of status flags.


r~

