Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A290B520770
	for <lists+qemu-devel@lfdr.de>; Tue, 10 May 2022 00:17:03 +0200 (CEST)
Received: from localhost ([::1]:35068 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1noBgc-0001l5-72
	for lists+qemu-devel@lfdr.de; Mon, 09 May 2022 18:17:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36064)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1noBfM-0000uA-RJ
 for qemu-devel@nongnu.org; Mon, 09 May 2022 18:15:44 -0400
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432]:33317)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1noBfL-0007Hf-9L
 for qemu-devel@nongnu.org; Mon, 09 May 2022 18:15:44 -0400
Received: by mail-pf1-x432.google.com with SMTP id p12so13415372pfn.0
 for <qemu-devel@nongnu.org>; Mon, 09 May 2022 15:15:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=NsyupFJSpO4nLzJnsLkW3Rr+iZxVbPxLvZv9GASsS10=;
 b=xN9z0EL+Hc6WOKwnd4V98xKGtYkUwKIMSZzEnIYHXDONCPqizGZwGSL6VyTHTXVoeT
 73A52+5XIxaCu0oK3WV4kt0HVErso0bhVieDF7pWRKFlxvJY5RiFIAH8bZ5aRvwF7J9t
 VejD4g4FL8NNli7ZEmXr78SXyK49+dQNvsBINsJ70DYWJ3pphZ/KLomjelUVokWo9MKG
 4dMeOORI2M4zv9nmLOFfHipHbHMmF4ZATe3mMhcub6QiAqcR6TqNDSsqYWwV+wsIhE8x
 YNvGqDrlFU7KeiBvhP10eBoyoWq8jhZYX/EC9+D4+IZiTXKW0rmdLPTZIx6utiv9KYn5
 49eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=NsyupFJSpO4nLzJnsLkW3Rr+iZxVbPxLvZv9GASsS10=;
 b=Acm7h7Nm2Q8Fojor4uUOGbKWRSoRSW6MND6dV+6mjN8+pgL4Zo8daQ7YymGl5bszDX
 PJIMbJAXuqjKXQZdA1VaWjpTA6VOwayzhxVBOxhl4Rr7q1mC0wHqptMsZr6Y/xH9xMUf
 GUDwoU9+G047wxvMyDHccrFFVUdoxR/7Oc38BmfpEmXj2xEfo7RxyIqWrcdtAmh2lTSe
 KTtOu9su/qZIo871x5vtQwVKhDw71a0bE8X7U+HcNHWc1qm1n5V1TRZv4LqJUkTfQSwY
 8mBVxVHb993N/UrLlTz2B8vqEXGvK/QsZTCG0j/HP7ItOctu2QH2i02hB1SdXtNxI6Oz
 Jc4Q==
X-Gm-Message-State: AOAM531Gn8pP6RFNAoYzddDKOmrcMkWsNPCOrBMq2damvpf/E7WQ+1ym
 Jk5HvcY0JRqbZrcDQkFsZ4P7rw==
X-Google-Smtp-Source: ABdhPJwEOAaafWe23flTY01ERbLjhv7G+dnmtOIrc/Rt4YsQlQoeaYf8lpsprGhWJCa7VJrP5se1dQ==
X-Received: by 2002:a63:ce47:0:b0:3c6:77a0:d3be with SMTP id
 r7-20020a63ce47000000b003c677a0d3bemr10402530pgi.317.1652134541878; 
 Mon, 09 May 2022 15:15:41 -0700 (PDT)
Received: from [192.168.1.6] ([71.212.142.129])
 by smtp.gmail.com with ESMTPSA id
 w20-20020aa78594000000b0050dc76281e9sm9103175pfn.195.2022.05.09.15.15.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 May 2022 15:15:40 -0700 (PDT)
Message-ID: <46cee6f7-d98e-51e8-b3bc-c4f2497fbb97@linaro.org>
Date: Mon, 9 May 2022 15:15:36 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 1/2] target/ppc: Fix FPSCR.FI bit being cleared when it
 shouldn't
Content-Language: en-US
To: =?UTF-8?Q?V=c3=adctor_Colombo?= <victor.colombo@eldorado.org.br>,
 qemu-devel@nongnu.org, qemu-ppc@nongnu.org
Cc: clg@kaod.org, danielhb413@gmail.com, david@gibson.dropbear.id.au,
 groug@kaod.org
References: <20220509124836.27819-1-victor.colombo@eldorado.org.br>
 <20220509124836.27819-2-victor.colombo@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220509124836.27819-2-victor.colombo@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x432.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
> -static inline void float_inexact_excp(CPUPPCState *env)
> +static inline void float_inexact_excp(CPUPPCState *env, bool set_fi)
>   {
>       CPUState *cs = env_cpu(env);
>   
> -    env->fpscr |= FP_FI;
> +    if (set_fi) {
> +        env->fpscr |= FP_FI;
> +    }
>       env->fpscr |= FP_XX;
>       /* Update the floating-point exception summary */
>       env->fpscr |= FP_FX;

I think it would be better to move the change to FI from here...

> @@ -462,7 +464,8 @@ void helper_fpscr_check_status(CPUPPCState *env)
>       }
>   }
>   
> -static void do_float_check_status(CPUPPCState *env, uintptr_t raddr)
> +static void do_float_check_status(CPUPPCState *env, bool change_fi,
> +                                  uintptr_t raddr)
>   {
>       CPUState *cs = env_cpu(env);
>       int status = get_float_exception_flags(&env->fp_status);
> @@ -473,8 +476,8 @@ static void do_float_check_status(CPUPPCState *env, uintptr_t raddr)
>           float_underflow_excp(env);
>       }
>       if (status & float_flag_inexact) {
> -        float_inexact_excp(env);
> -    } else {
> +        float_inexact_excp(env, change_fi);
> +    } else if (change_fi) {
>           env->fpscr &= ~FP_FI; /* clear the FPSCR[FI] bit */
>       }

... to here.  E.g.

     if (status & float_flag_inexact) {
         float_inexact_excp(env);
     }
     if (change_fi) {
         if (status & float_flag_inexact) {
             env->fpscr |= FP_FI;
         } else {
             env->fpscr &= ~FP_FI;
         }
     }

or indeed

     env->fpscr = FIELD_DP64(env->fpscr, FPSCR, FI,
                             !!(status & float_flag_inexact));

Otherwise it all looks plausible.

> @@ -1690,9 +1693,9 @@ uint32_t helper_efdcmpeq(CPUPPCState *env, uint64_t op1, uint64_t op2)
>    *   nels  - number of elements (1, 2 or 4)
>    *   tp    - type (float32 or float64)
>    *   fld   - vsr_t field (VsrD(*) or VsrW(*))
> - *   sfprf - set FPRF
> + *   sfifprf - set FI and FPRF
>    */
> -#define VSX_ADD_SUB(name, op, nels, tp, fld, sfprf, r2sp)                    \
> +#define VSX_ADD_SUB(name, op, nels, tp, fld, sfifprf, r2sp)                  \


It might be easier to read if this renaming is done as a separate step.


r~

