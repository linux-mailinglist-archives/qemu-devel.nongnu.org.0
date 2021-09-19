Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0836410CE9
	for <lists+qemu-devel@lfdr.de>; Sun, 19 Sep 2021 20:36:07 +0200 (CEST)
Received: from localhost ([::1]:37700 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mS1fa-0001in-Kv
	for lists+qemu-devel@lfdr.de; Sun, 19 Sep 2021 14:36:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58854)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mS1bs-0007Yw-7c
 for qemu-devel@nongnu.org; Sun, 19 Sep 2021 14:32:16 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:55836)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mS1bq-0001wm-7U
 for qemu-devel@nongnu.org; Sun, 19 Sep 2021 14:32:15 -0400
Received: by mail-wm1-x332.google.com with SMTP id v127so778781wme.5
 for <qemu-devel@nongnu.org>; Sun, 19 Sep 2021 11:32:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=JZBL2PnVkQocL+0to1hshSWV++xWJHu/FesFG6YWw3Y=;
 b=gMdAr2oeqdF3SNw+nlLEP27W8cqOOG+c3WdP7JRZwOzqg0z+Eap6fbNwxkKQdyUDmN
 rBAeh2/xOqogcur4zHJrerpASF/AtPkGSrTOrHW6wp6J0BtM9BKIuqDGapwFOBBhzT12
 OAQHhfo93c7EGZC2Udz1Hc0laObh+VzlO0SVB7otq0KF5kBVfvRjbVtkZsziLdzPdYG8
 AKfQVTxufe0WZB6U0ZIidirXhcKI3aD96d8fBbfasv1AS/6QOgGPrwTRyD9cQlfdACKi
 r+soaPSs98lxQ15oaynodMnzFhBaiR89QP/A8pJ9Djz4YtyNUXOhKYpduzmtW7C25rmk
 70FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=JZBL2PnVkQocL+0to1hshSWV++xWJHu/FesFG6YWw3Y=;
 b=kpU5bYqybbUgyPocAnBjMHY3Ll9bEWCn+iyLVBgpaCRkTHSZ1gNSRDME4wRekifThk
 VFF6hWfpmRGL378epE5QTXMr3bsoTFf9pWEfTnUT7CJIhVaYhAnU47qY/FICLb0+x3/E
 9Hxr2T8gMTg5S3qVgdgN2jYHyj+jf4Z0ge4c1cWppSyWGYFUfsQ6toK6lRuuxHIoGBKx
 7Jydk2d0e17VEIdqwQ8ACnAmwwqL8ECiHPNVPzPYxy98056TVxbtGCOVGgj8VHSnLbpa
 TUKwoqMn52jX20VqI2Z0+f5r3RtKxGl7VlrN2KBTZGXueW8oOxYeneuw7U1VQS/BXJRo
 JgFw==
X-Gm-Message-State: AOAM53335h6ajOKonJtsCEx/wHb1LFL3wg1jn4H85679GUJa2v/XQ1f7
 0OOwopXSxnJsJJOwr4xTxkE=
X-Google-Smtp-Source: ABdhPJwIFHM1wFKqqZuS6zXclXIbUi9TT1mxsW7oqldeGThD8YURtAyzImFyJooq76TcsqtWePWglw==
X-Received: by 2002:a7b:c316:: with SMTP id k22mr26082441wmj.56.1632076332738; 
 Sun, 19 Sep 2021 11:32:12 -0700 (PDT)
Received: from [192.168.1.36] (14.red-83-35-25.dynamicip.rima-tde.net.
 [83.35.25.14])
 by smtp.gmail.com with ESMTPSA id h1sm2564343wmb.7.2021.09.19.11.32.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 19 Sep 2021 11:32:12 -0700 (PDT)
Message-ID: <e963b2fd-a616-84dd-19a3-3a1f67ebb452@amsat.org>
Date: Sun, 19 Sep 2021 20:32:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v2 27/41] target/i386: Implement x86_cpu_record_sigsegv
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210918184527.408540-1-richard.henderson@linaro.org>
 <20210918184527.408540-28-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20210918184527.408540-28-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x332.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, CTE_8BIT_MISMATCH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
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
Cc: laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/18/21 20:45, Richard Henderson wrote:
> Record cr2, error_code, and exception_index.  That last means
> that we must exit to cpu_loop ourselves, instead of letting
> exception_index being overwritten.
> 
> Use the maperr parameter to properly set PG_ERROR_P_MASK.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/i386/tcg/helper-tcg.h       |  6 ++++++
>  target/i386/tcg/tcg-cpu.c          |  3 ++-
>  target/i386/tcg/user/excp_helper.c | 23 +++++++++++++++++------
>  3 files changed, 25 insertions(+), 7 deletions(-)

> diff --git a/target/i386/tcg/user/excp_helper.c b/target/i386/tcg/user/excp_helper.c
> index a89b5228fd..cd507e2a1b 100644
> --- a/target/i386/tcg/user/excp_helper.c
> +++ b/target/i386/tcg/user/excp_helper.c
> @@ -22,18 +22,29 @@
>  #include "exec/exec-all.h"
>  #include "tcg/helper-tcg.h"
>  
> -bool x86_cpu_tlb_fill(CPUState *cs, vaddr addr, int size,
> -                      MMUAccessType access_type, int mmu_idx,
> -                      bool probe, uintptr_t retaddr)
> +void x86_cpu_record_sigsegv(CPUState *cs, vaddr addr,
> +                            MMUAccessType access_type,
> +                            bool maperr, uintptr_t ra)
>  {
>      X86CPU *cpu = X86_CPU(cs);
>      CPUX86State *env = &cpu->env;
>  
> +    /*
> +     * The error_code that hw reports as part of the exception frame
> +     * is copied to linux sigcontext.err.  The exception_index is
> +     * copied to linux sigcontext.trapno.  Short of inventing a new
> +     * place to store the trapno, we cannot let our caller raise the
> +     * signal and set exception_index to EXCP_INTERRUPT.
> +     */
>      env->cr[2] = addr;
> -    env->error_code = (access_type == MMU_DATA_STORE) << PG_ERROR_W_BIT;
> -    env->error_code |= PG_ERROR_U_MASK;
> +    env->error_code = ((access_type == MMU_DATA_STORE) << PG_ERROR_W_BIT)
> +                    | (maperr ? 0 : PG_ERROR_P_MASK)
> +                    | PG_ERROR_U_MASK;
>      cs->exception_index = EXCP0E_PAGE;
> +
> +    /* Disable do_interrupt_user. */
>      env->exception_is_int = 0;
>      env->exception_next_eip = -1;
> -    cpu_loop_exit_restore(cs, retaddr);
> +
> +    cpu_loop_exit_restore(cs, ra);
>  }
> 

Better have an x86 expert also review this, but to the best
of my knowledge:
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

And YAY! btw, thanks :>

