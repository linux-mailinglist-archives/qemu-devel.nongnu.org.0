Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8163F440DD2
	for <lists+qemu-devel@lfdr.de>; Sun, 31 Oct 2021 11:22:47 +0100 (CET)
Received: from localhost ([::1]:57916 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mh7zC-0000js-L2
	for lists+qemu-devel@lfdr.de; Sun, 31 Oct 2021 06:22:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50732)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mh7xs-0007j3-JK
 for qemu-devel@nongnu.org; Sun, 31 Oct 2021 06:21:25 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:55820)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mh7xq-0002pj-9t
 for qemu-devel@nongnu.org; Sun, 31 Oct 2021 06:21:24 -0400
Received: by mail-wm1-x32a.google.com with SMTP id v127so11358416wme.5
 for <qemu-devel@nongnu.org>; Sun, 31 Oct 2021 03:21:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=2o+0Uq9d8BsXCOnIpGKe3W76LKUwzv4CPOfK5wPJZsg=;
 b=XUx8eJiVJPWAmiPKEnCAqU3d6V2QBxQ+kMlvYgd1Bh/IsAendlclLWNLVEymyJskpA
 jljyY/GxuiU5MdElpo32V4vyh0eYaP9G2KJ7wchB/lLgltW+WblCWeDZv8rEAiPN5Hi+
 UUTcpVzFdnwokv3w4ZRv/zMuXmpJOOs5iSJn4v21yP2oTgiIpl3PcIIM8T98a42HYdeT
 go5/qBMbzTZ6t/qLcCT3ibuDVooyHunJiX4FYAzBFs7wyWmFMkjOHT5BvkNL5XZGa83t
 MRumT1/iP1FVkdeQwSfuFeVLhJK9TsKfSCcMqdJVB/YsyD2GwP6o+nnmwiHWp6n4SW+e
 HyNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=2o+0Uq9d8BsXCOnIpGKe3W76LKUwzv4CPOfK5wPJZsg=;
 b=YIonQGQ3lnKVFo2RYc+IT+3/YqgQLoLmy1CtkBlx+y++1OyjItu/75armPVVzSjY/k
 nsN1nl4sX2uBQnuS3XVAHo27D7SkNcpItW5z8wex+LkQe6CyxPH0xc4i22fclG3sl2KP
 QGTolSTQ7kmq11qhBmp3P50VxEytAyikZJH1gez6siMb5byvOZnDMV0akIiG4lxC1e08
 yW90Z8Hw+3uVvd1tWojsrmq1H0fZ3rGP7MT1YBeAo9Vtx6GAf6/2zb2D4+ud7ORn4lTa
 xI+X7n9KGpVnqgcXdeitfcOk08bX3TMKyg6B6dixd9PCyOz9Q0f/bVrS9OnGlff9dPlE
 BTzQ==
X-Gm-Message-State: AOAM53102qLvm4uYruDwnWbTRZ5MfqddMIQzXNn56AHcxOxs7FT0ptqe
 28xvv2sqTOnHkZ5WlAXSEoo=
X-Google-Smtp-Source: ABdhPJw8F+XP2/C5crDWla07L1AdyWj4gXp3AOUl+j7ET41hfestfx5rIRpGpX1GmrsSDTbmmuoXmQ==
X-Received: by 2002:a7b:c005:: with SMTP id c5mr24165828wmb.150.1635675680693; 
 Sun, 31 Oct 2021 03:21:20 -0700 (PDT)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id 13sm14133843wrz.38.2021.10.31.03.21.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 31 Oct 2021 03:21:19 -0700 (PDT)
Message-ID: <792ebb0d-e2cd-56a9-a9d3-21468aec941f@amsat.org>
Date: Sun, 31 Oct 2021 11:21:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v6 38/66] target/sh4: Make sh4_cpu_tlb_fill sysemu only
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20211030171635.1689530-1-richard.henderson@linaro.org>
 <20211030171635.1689530-39-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20211030171635.1689530-39-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32a.google.com
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

On 10/30/21 19:16, Richard Henderson wrote:
> The fallback code in cpu_loop_exit_sigsegv is sufficient
> for sh4 linux-user.
> 
> Remove the code from cpu_loop that raised SIGSEGV.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/sh4/cpu.h          | 6 +++---
>  linux-user/sh4/cpu_loop.c | 8 --------
>  target/sh4/cpu.c          | 2 +-
>  target/sh4/helper.c       | 9 +--------
>  4 files changed, 5 insertions(+), 20 deletions(-)
> 
> diff --git a/target/sh4/cpu.h b/target/sh4/cpu.h
> index dc81406646..4cfb109f56 100644
> --- a/target/sh4/cpu.h
> +++ b/target/sh4/cpu.h
> @@ -213,12 +213,12 @@ void superh_cpu_do_unaligned_access(CPUState *cpu, vaddr addr,
>                                      uintptr_t retaddr) QEMU_NORETURN;
>  
>  void sh4_translate_init(void);
> +void sh4_cpu_list(void);
> +
> +#if !defined(CONFIG_USER_ONLY)
>  bool superh_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
>                           MMUAccessType access_type, int mmu_idx,
>                           bool probe, uintptr_t retaddr);
> -
> -void sh4_cpu_list(void);
> -#if !defined(CONFIG_USER_ONLY)
>  void superh_cpu_do_interrupt(CPUState *cpu);
>  bool superh_cpu_exec_interrupt(CPUState *cpu, int int_req);
>  void cpu_sh4_invalidate_tlb(CPUSH4State *s);
> diff --git a/linux-user/sh4/cpu_loop.c b/linux-user/sh4/cpu_loop.c
> index 65b8972e3c..ac9b01840c 100644
> --- a/linux-user/sh4/cpu_loop.c
> +++ b/linux-user/sh4/cpu_loop.c
> @@ -65,14 +65,6 @@ void cpu_loop(CPUSH4State *env)
>              info.si_code = TARGET_TRAP_BRKPT;
>              queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
>              break;
> -        case 0xa0:
> -        case 0xc0:
> -            info.si_signo = TARGET_SIGSEGV;
> -            info.si_errno = 0;
> -            info.si_code = TARGET_SEGV_MAPERR;
> -            info._sifields._sigfault._addr = env->tea;
> -            queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
> -            break;
>          case EXCP_ATOMIC:
>              cpu_exec_step_atomic(cs);
>              arch_interrupt = false;
> diff --git a/target/sh4/cpu.c b/target/sh4/cpu.c
> index 2047742d03..06b2691dc4 100644
> --- a/target/sh4/cpu.c
> +++ b/target/sh4/cpu.c
> @@ -236,9 +236,9 @@ static const struct SysemuCPUOps sh4_sysemu_ops = {
>  static const struct TCGCPUOps superh_tcg_ops = {
>      .initialize = sh4_translate_init,
>      .synchronize_from_tb = superh_cpu_synchronize_from_tb,
> -    .tlb_fill = superh_cpu_tlb_fill,
>  
>  #ifndef CONFIG_USER_ONLY
> +    .tlb_fill = superh_cpu_tlb_fill,
>      .cpu_exec_interrupt = superh_cpu_exec_interrupt,
>      .do_interrupt = superh_cpu_do_interrupt,
>      .do_unaligned_access = superh_cpu_do_unaligned_access,
> diff --git a/target/sh4/helper.c b/target/sh4/helper.c
> index 53cb9c3b63..6a620e36fc 100644
> --- a/target/sh4/helper.c
> +++ b/target/sh4/helper.c
> @@ -796,8 +796,6 @@ bool superh_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
>      return false;
>  }
>  
> -#endif /* !CONFIG_USER_ONLY */
> -
>  bool superh_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
>                           MMUAccessType access_type, int mmu_idx,
>                           bool probe, uintptr_t retaddr)
> @@ -806,11 +804,6 @@ bool superh_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
>      CPUSH4State *env = &cpu->env;
>      int ret;
>  
> -#ifdef CONFIG_USER_ONLY
> -    ret = (access_type == MMU_DATA_STORE ? MMU_DTLB_VIOLATION_WRITE :
> -           access_type == MMU_INST_FETCH ? MMU_ITLB_VIOLATION :
> -           MMU_DTLB_VIOLATION_READ);
> -#else
>      target_ulong physical;
>      int prot;
>  
> @@ -829,7 +822,6 @@ bool superh_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
>      if (ret != MMU_DTLB_MULTIPLE && ret != MMU_ITLB_MULTIPLE) {
>          env->pteh = (env->pteh & PTEH_ASID_MASK) | (address & PTEH_VPN_MASK);
>      }
> -#endif
>  
>      env->tea = address;
>      switch (ret) {
> @@ -868,3 +860,4 @@ bool superh_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
>      }
>      cpu_loop_exit_restore(cs, retaddr);
>  }
> +#endif /* !CONFIG_USER_ONLY */
> 

To the best of my knowledge:
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

