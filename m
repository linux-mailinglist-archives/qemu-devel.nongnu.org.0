Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EED8410CC4
	for <lists+qemu-devel@lfdr.de>; Sun, 19 Sep 2021 20:04:22 +0200 (CEST)
Received: from localhost ([::1]:44322 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mS1Ar-00018c-2S
	for lists+qemu-devel@lfdr.de; Sun, 19 Sep 2021 14:04:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54316)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mS198-0000Qc-AD
 for qemu-devel@nongnu.org; Sun, 19 Sep 2021 14:02:37 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:38597)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mS192-00073V-3b
 for qemu-devel@nongnu.org; Sun, 19 Sep 2021 14:02:29 -0400
Received: by mail-wr1-x42f.google.com with SMTP id u18so22816396wrg.5
 for <qemu-devel@nongnu.org>; Sun, 19 Sep 2021 11:02:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=9ZflzJU/tweTWio2N+Qa6+sH8fIEBtz8yK/EMO2tKi8=;
 b=OcBloTrtBzzg2uUSzcSf207/BtDnOwNKmroVhtuY6Tq5bTV552ApnYHUwLlocDA3IQ
 oACxefBTkzYx0Mnrmp7zvsr18/QlQJOmdL88coet027cLLf0pw2jPOv/GE1kfyjCIAGK
 mGI6/CKpCaJvNV2z9FQ20jnzforJRfmSdfN7JxT832Q0ZepAeq5IqliIS8c0Eniwey3x
 ruEwfOlvP6KtIsp+SzlUEAknEpN8FSuCEMQBKi1yXkCQFDfW2gqW0RZY+UaN+IruGHVA
 AoX4Y/FvXOHgCAoMasZwe6KhrszYsmBtKCEbpnE6tsGndKN8cx+Hcl2vsQr5i138diRz
 jEew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=9ZflzJU/tweTWio2N+Qa6+sH8fIEBtz8yK/EMO2tKi8=;
 b=MQumpNAwAzujQsaoWqR1Le7NyMIVID40GXxOhFPA+odz576ugdRELMHwjUYemyo8XA
 08gm6jc/RpUI08Ebeg5SV+0bU1zR57vUa8ySTJ9d3NasR5UWvs4oPrHefZrUDufRN6T4
 6aJ6rlKJSgge7km6tDErp3Gq4KtWYUPQegWBhT3dEljsf7ZIS8qCEqS4WKtTdFrNr5IO
 BJ7HfWPv/oolpT3ESNUnB8p0mrd8nqdscFjLJkVG81jIpnbsgByC9AOkq2UiBqCwP67h
 URspvdfB4XsS7RQMvDLUkVVO9FYU0B/WZiqj8SA5J/mSDh32XVRZeXJzcRa75InwsGxq
 5Wyg==
X-Gm-Message-State: AOAM531FOIJPSlSkvwK83ZiyA0OBJAc1+WYoFX/zSFh9lyKlhC0BJq1D
 tmt4kUaAItfw39YfrQsAW0c=
X-Google-Smtp-Source: ABdhPJwoRBh0fYtxaaAQajsmpS/GN0Z1wqwIpm6w7irpxuAZqcQ7M8Vi+c3R2U4YSB3Y58FzdGXv4w==
X-Received: by 2002:a5d:6741:: with SMTP id l1mr24223537wrw.289.1632074545424; 
 Sun, 19 Sep 2021 11:02:25 -0700 (PDT)
Received: from [192.168.1.36] (14.red-83-35-25.dynamicip.rima-tde.net.
 [83.35.25.14])
 by smtp.gmail.com with ESMTPSA id x17sm3436899wrc.51.2021.09.19.11.02.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 19 Sep 2021 11:02:24 -0700 (PDT)
Message-ID: <0cc27595-cfa0-e082-fe2e-43f8f34d4543@amsat.org>
Date: Sun, 19 Sep 2021 20:02:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v2 06/41] linux-user: Reorg handling for SIGSEGV
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210918184527.408540-1-richard.henderson@linaro.org>
 <20210918184527.408540-7-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20210918184527.408540-7-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42f.google.com
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

On 9/18/21 20:44, Richard Henderson wrote:
> Add stub host-signal.h for all linux-user hosts.
> Add new code replacing cpu_signal_handler.
> Full migration will happen one host at a time.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

> diff --git a/linux-user/signal.c b/linux-user/signal.c
> index 5ea8e4584a..6f953f10d4 100644
> --- a/linux-user/signal.c
> +++ b/linux-user/signal.c
> @@ -18,12 +18,15 @@
>   */
>  #include "qemu/osdep.h"
>  #include "qemu/bitops.h"
> +#include "hw/core/tcg-cpu-ops.h"
> +
>  #include <sys/ucontext.h>
>  #include <sys/resource.h>
>  
>  #include "qemu.h"
>  #include "trace.h"
>  #include "signal-common.h"
> +#include "host-signal.h"
>  
>  static struct target_sigaction sigact_table[TARGET_NSIG];
>  
> @@ -761,41 +764,115 @@ static inline void rewind_if_in_safe_syscall(void *puc)
>  }
>  #endif
>  
> -static void host_signal_handler(int host_signum, siginfo_t *info,
> -                                void *puc)
> +static void host_signal_handler(int host_sig, siginfo_t *info, void *puc)
>  {
>      CPUArchState *env = thread_cpu->env_ptr;
>      CPUState *cpu = env_cpu(env);
>      TaskState *ts = cpu->opaque;
> -
> -    int sig;
>      target_siginfo_t tinfo;
>      ucontext_t *uc = puc;
>      struct emulated_sigtable *k;
> +    int guest_sig;
>  
> +#ifdef HOST_SIGNAL_PLACEHOLDER
>      /* the CPU emulator uses some host signals to detect exceptions,
>         we forward to it some signals */
> -    if ((host_signum == SIGSEGV || host_signum == SIGBUS)
> +    if ((host_sig == SIGSEGV || host_sig == SIGBUS)
>          && info->si_code > 0) {
> -        if (cpu_signal_handler(host_signum, info, puc))
> +        if (cpu_signal_handler(host_sig, info, puc))
>              return;
>      }
> +#else
> +    uintptr_t pc = 0;
> +    bool sync_sig = false;
> +
> +    /*
> +     * Non-spoofed SIGSEGV and SIGBUS are synchronous, and need special
> +     * handling wrt signal blocking and unwinding.
> +     */
> +    if ((host_sig == SIGSEGV || host_sig == SIGBUS) && info->si_code > 0) {
> +        MMUAccessType access_type;
> +        uintptr_t host_addr;
> +        abi_ptr guest_addr;
> +        bool is_write;
> +
> +        host_addr = (uintptr_t)info->si_addr;
> +
> +        /*
> +         * Convert forcefully to guest address space: addresses outside
> +         * reserved_va are still valid to report via SEGV_MAPERR.
> +         */
> +        guest_addr = h2g_nocheck(host_addr);
> +
> +        pc = host_signal_pc(uc);
> +        is_write = host_signal_write(info, uc);
> +        access_type = adjust_signal_pc(&pc, is_write);
> +
> +        if (host_sig == SIGSEGV) {
> +            const struct TCGCPUOps *tcg_ops;
> +
> +            if (info->si_code == SEGV_ACCERR && h2g_valid(host_addr)) {
> +                /* If this was a write to a TB protected page, restart. */
> +                if (is_write &&
> +                    handle_sigsegv_accerr_write(cpu, &uc->uc_sigmask,
> +                                                pc, guest_addr)) {
> +                    return;
> +                }
> +
> +                /*
> +                 * With reserved_va, the whole address space is PROT_NONE,
> +                 * which means that we may get ACCERR when we want MAPERR.
> +                 */
> +                if (page_get_flags(guest_addr) & PAGE_VALID) {
> +                    /* maperr = false; */
> +                } else {
> +                    info->si_code = SEGV_MAPERR;
> +                }
> +            }
> +
> +            sigprocmask(SIG_SETMASK, &uc->uc_sigmask, NULL);
> +
> +            tcg_ops = CPU_GET_CLASS(cpu)->tcg_ops;
> +            tcg_ops->tlb_fill(cpu, guest_addr, 0, access_type,
> +                              MMU_USER_IDX, false, pc);
> +            g_assert_not_reached();
> +        } else {
> +            sigprocmask(SIG_SETMASK, &uc->uc_sigmask, NULL);
> +        }
> +
> +        sync_sig = true;
> +    }
> +#endif
>  
>      /* get target signal number */
> -    sig = host_to_target_signal(host_signum);
> -    if (sig < 1 || sig > TARGET_NSIG)
> +    guest_sig = host_to_target_signal(host_sig);
> +    if (guest_sig < 1 || guest_sig > TARGET_NSIG) {
>          return;
> -    trace_user_host_signal(env, host_signum, sig);
> +    }
> +    trace_user_host_signal(env, host_sig, guest_sig);
> +
> +    host_to_target_siginfo_noswap(&tinfo, info);
> +    k = &ts->sigtab[guest_sig - 1];
> +    k->info = tinfo;
> +    k->pending = guest_sig;
> +    ts->signal_pending = 1;
> +
> +#ifndef HOST_SIGNAL_PLACEHOLDER
> +    /*
> +     * For synchronous signals, unwind the cpu state to the faulting
> +     * insn and then exit back to the main loop so that the signal
> +     * is delivered immediately.
> +     */
> +    if (sync_sig) {
> +        cpu->exception_index = EXCP_INTERRUPT;
> +        cpu_loop_exit_restore(cpu, pc);
> +    }
> +#endif
>  
>      rewind_if_in_safe_syscall(puc);
>  
> -    host_to_target_siginfo_noswap(&tinfo, info);
> -    k = &ts->sigtab[sig - 1];
> -    k->info = tinfo;
> -    k->pending = sig;
> -    ts->signal_pending = 1;
> -
> -    /* Block host signals until target signal handler entered. We
> +    /*
> +     * Block host signals until target signal handler entered. We
>       * can't block SIGSEGV or SIGBUS while we're executing guest
>       * code in case the guest code provokes one in the window between
>       * now and it getting out to the main loop. Signals will be
> 

So this is outside of my comfort zone; however after reviewing and
to the best of my knowledge it looks OK, so:
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

And I'll review the next patches assuming this one is OK.

