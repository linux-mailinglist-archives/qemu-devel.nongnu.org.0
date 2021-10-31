Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C7BF3440DD3
	for <lists+qemu-devel@lfdr.de>; Sun, 31 Oct 2021 11:28:37 +0100 (CET)
Received: from localhost ([::1]:32800 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mh84q-0003R5-TA
	for lists+qemu-devel@lfdr.de; Sun, 31 Oct 2021 06:28:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51642)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mh82x-0002iO-KT
 for qemu-devel@nongnu.org; Sun, 31 Oct 2021 06:26:40 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:37700)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mh82v-0005Sq-C6
 for qemu-devel@nongnu.org; Sun, 31 Oct 2021 06:26:39 -0400
Received: by mail-wr1-x433.google.com with SMTP id b12so19373524wrh.4
 for <qemu-devel@nongnu.org>; Sun, 31 Oct 2021 03:26:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=uuIwCHfk2CMNhggvvzY/1CN5EO61/xkwBenZzjEKChw=;
 b=ASKpoH0WiFIEZolxDl/yhnco1rUJFJdpYfa2MoA4fnkn9kTa3AO8VkzLcP/c5I+pun
 S9le69U+0ecyW/FE9RgNolL2gnWF6C2aH7+2ZklCvTHbLEuzi2r3osagr6dNMd339yNQ
 rNcf9QcFrGa3fetLVcXsmocHAL49AH8cJyu/34+7hzZ6bv3eHnrHGb+sHUSIQL3MS5nv
 xjo7N/BWLc+Zy1SGE+pvKLz+c4hIQXBSYuaXnyvOo3e7ZIRIa9C+yncyVVR1t/29s+hO
 5mJCttUZ7nyR+6WCyXqtoggjyXd6b8NIhg99icBUci1vhTtAaaC2s4RjQJzGEUrBUrNa
 7QbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=uuIwCHfk2CMNhggvvzY/1CN5EO61/xkwBenZzjEKChw=;
 b=LyCWxb9lH33ChGxGow9fZ00IOGiWCe13UmuE6hXjZlS6lecfOF8tkuZbZbmsZRiabL
 x34B4Mt1psrx6BMplEVMcpPJrDx5wFzvH6EqYWSVGEAmO89wW+XAFdDbzhSFR6sy7Meb
 NXWB6VLmHwDhWvLLx1TvHPXZh1DyT+DHFxhHztwn0KKIipNjxtu70SUPf5K0ltQ2B+EG
 zKTaJqH4s2BhXu5ups0kW8yk9RMzTTxmWkR+e2/YVlBLmojyzwfDfV1Ql1heVDb2uxaC
 GswF0QFJRNV7d6vZSQDDQICw7R0QgLglgYHSFUAXhbhD9JEf7stKzkIxEkmSPvSbX27Z
 /vvQ==
X-Gm-Message-State: AOAM531WzCFKdjS2ux9Wym9TznLW1TXCLCeqlrMpz7R6ERLFSmRk90tm
 vmGA9gtlYOaVfedLomMrlVk=
X-Google-Smtp-Source: ABdhPJwHMSt3MdDR7jOzcbMq/1IPz9DH/UNKaHWUpHKqdasBMS9nPaNvL7CJYLqCksF7qCUfxQF9dQ==
X-Received: by 2002:adf:c00d:: with SMTP id z13mr28562409wre.299.1635675995289; 
 Sun, 31 Oct 2021 03:26:35 -0700 (PDT)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id f18sm10988507wrg.3.2021.10.31.03.26.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 31 Oct 2021 03:26:34 -0700 (PDT)
Message-ID: <c9938138-ce79-43fe-e648-4b7e3bbd9152@amsat.org>
Date: Sun, 31 Oct 2021 11:26:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v6 21/66] target/alpha: Implement alpha_cpu_record_sigsegv
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>
References: <20211030171635.1689530-1-richard.henderson@linaro.org>
 <20211030171635.1689530-22-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20211030171635.1689530-22-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x433.google.com
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-2.426,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: alex.bennee@linaro.org, laurent@vivier.eu, imp@bsdimp.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/30/21 19:15, Richard Henderson wrote:
> Record trap_arg{0,1,2} for the linux-user signal frame.
> 
> Fill in the stores to trap_arg{1,2} that were missing
> from the previous user-only alpha_cpu_tlb_fill function.
> Use maperr to simplify computation of trap_arg1.
> 
> Remove the code for EXCP_MMFAULT from cpu_loop, as
> that part is now handled by cpu_loop_exit_sigsegv.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/alpha/cpu.h          | 13 +++++++++----
>  linux-user/alpha/cpu_loop.c |  8 --------
>  target/alpha/cpu.c          |  6 ++++--
>  target/alpha/helper.c       | 39 ++++++++++++++++++++++++++++++++-----
>  4 files changed, 47 insertions(+), 19 deletions(-)
> 
> diff --git a/target/alpha/cpu.h b/target/alpha/cpu.h
> index 772828cc26..d49cc36d07 100644
> --- a/target/alpha/cpu.h
> +++ b/target/alpha/cpu.h
> @@ -439,9 +439,6 @@ void alpha_translate_init(void);
>  #define CPU_RESOLVING_TYPE TYPE_ALPHA_CPU
>  
>  void alpha_cpu_list(void);
> -bool alpha_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
> -                        MMUAccessType access_type, int mmu_idx,
> -                        bool probe, uintptr_t retaddr);
>  void QEMU_NORETURN dynamic_excp(CPUAlphaState *, uintptr_t, int, int);
>  void QEMU_NORETURN arith_excp(CPUAlphaState *, uintptr_t, int, uint64_t);
>  
> @@ -449,7 +446,15 @@ uint64_t cpu_alpha_load_fpcr (CPUAlphaState *env);
>  void cpu_alpha_store_fpcr (CPUAlphaState *env, uint64_t val);
>  uint64_t cpu_alpha_load_gr(CPUAlphaState *env, unsigned reg);
>  void cpu_alpha_store_gr(CPUAlphaState *env, unsigned reg, uint64_t val);
> -#ifndef CONFIG_USER_ONLY
> +
> +#ifdef CONFIG_USER_ONLY
> +void alpha_cpu_record_sigsegv(CPUState *cs, vaddr address,
> +                              MMUAccessType access_type,
> +                              bool maperr, uintptr_t retaddr);
> +#else
> +bool alpha_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
> +                        MMUAccessType access_type, int mmu_idx,
> +                        bool probe, uintptr_t retaddr);
>  void alpha_cpu_do_transaction_failed(CPUState *cs, hwaddr physaddr,
>                                       vaddr addr, unsigned size,
>                                       MMUAccessType access_type,
> diff --git a/linux-user/alpha/cpu_loop.c b/linux-user/alpha/cpu_loop.c
> index 1b00a81385..4cc8e0a55c 100644
> --- a/linux-user/alpha/cpu_loop.c
> +++ b/linux-user/alpha/cpu_loop.c
> @@ -54,14 +54,6 @@ void cpu_loop(CPUAlphaState *env)
>              fprintf(stderr, "External interrupt. Exit\n");
>              exit(EXIT_FAILURE);
>              break;
> -        case EXCP_MMFAULT:
> -            info.si_signo = TARGET_SIGSEGV;
> -            info.si_errno = 0;
> -            info.si_code = (page_get_flags(env->trap_arg0) & PAGE_VALID
> -                            ? TARGET_SEGV_ACCERR : TARGET_SEGV_MAPERR);
> -            info._sifields._sigfault._addr = env->trap_arg0;
> -            queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
> -            break;
>          case EXCP_UNALIGN:
>              info.si_signo = TARGET_SIGBUS;
>              info.si_errno = 0;
> diff --git a/target/alpha/cpu.c b/target/alpha/cpu.c
> index 93e16a2ffb..69f32c3078 100644
> --- a/target/alpha/cpu.c
> +++ b/target/alpha/cpu.c
> @@ -218,9 +218,11 @@ static const struct SysemuCPUOps alpha_sysemu_ops = {
>  
>  static const struct TCGCPUOps alpha_tcg_ops = {
>      .initialize = alpha_translate_init,
> -    .tlb_fill = alpha_cpu_tlb_fill,
>  
> -#ifndef CONFIG_USER_ONLY
> +#ifdef CONFIG_USER_ONLY
> +    .record_sigsegv = alpha_cpu_record_sigsegv,
> +#else
> +    .tlb_fill = alpha_cpu_tlb_fill,
>      .cpu_exec_interrupt = alpha_cpu_exec_interrupt,
>      .do_interrupt = alpha_cpu_do_interrupt,
>      .do_transaction_failed = alpha_cpu_do_transaction_failed,
> diff --git a/target/alpha/helper.c b/target/alpha/helper.c
> index 81550d9e2f..b7e7f73b15 100644
> --- a/target/alpha/helper.c
> +++ b/target/alpha/helper.c
> @@ -120,15 +120,44 @@ void cpu_alpha_store_gr(CPUAlphaState *env, unsigned reg, uint64_t val)
>  }
>  
>  #if defined(CONFIG_USER_ONLY)
> -bool alpha_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
> -                        MMUAccessType access_type, int mmu_idx,
> -                        bool probe, uintptr_t retaddr)
> +void alpha_cpu_record_sigsegv(CPUState *cs, vaddr address,
> +                              MMUAccessType access_type,
> +                              bool maperr, uintptr_t retaddr)
>  {
>      AlphaCPU *cpu = ALPHA_CPU(cs);
> +    target_ulong mmcsr, cause;
>  
> -    cs->exception_index = EXCP_MMFAULT;
> +    /* Assuming !maperr, infer the missing protection. */
> +    switch (access_type) {
> +    case MMU_DATA_LOAD:
> +        mmcsr = MM_K_FOR;
> +        cause = 0;
> +        break;
> +    case MMU_DATA_STORE:
> +        mmcsr = MM_K_FOW;
> +        cause = 1;
> +        break;
> +    case MMU_INST_FETCH:
> +        mmcsr = MM_K_FOE;
> +        cause = -1;
> +        break;
> +    default:
> +        g_assert_not_reached();
> +    }
> +    if (maperr) {
> +        if (address < BIT_ULL(TARGET_VIRT_ADDR_SPACE_BITS - 1)) {
> +            /* Userspace address, therefore page not mapped. */
> +            mmcsr = MM_K_TNV;
> +        } else {
> +            /* Kernel or invalid address. */
> +            mmcsr = MM_K_ACV;
> +        }
> +    }
> +
> +    /* Record the arguments that PALcode would give to the kernel. */
>      cpu->env.trap_arg0 = address;
> -    cpu_loop_exit_restore(cs, retaddr);
> +    cpu->env.trap_arg1 = mmcsr;
> +    cpu->env.trap_arg2 = cause;
>  }
>  #else
>  /* Returns the OSF/1 entMM failure indication, or -1 on success.  */
> 

I don't have experience with kernel nor alpha arch. The changes
make sense to me, so to the best of my knowledge:
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

