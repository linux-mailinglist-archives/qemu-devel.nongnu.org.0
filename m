Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 923C94405DC
	for <lists+qemu-devel@lfdr.de>; Sat, 30 Oct 2021 01:46:03 +0200 (CEST)
Received: from localhost ([::1]:39002 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgbZQ-0002pc-Lm
	for lists+qemu-devel@lfdr.de; Fri, 29 Oct 2021 19:46:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52070)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mgbSY-0008Jl-M9; Fri, 29 Oct 2021 19:38:56 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:54840)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mgbSV-0002UV-AM; Fri, 29 Oct 2021 19:38:54 -0400
Received: by mail-wm1-x336.google.com with SMTP id 71so6926786wma.4;
 Fri, 29 Oct 2021 16:38:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=1zuB0zs580SQU5zGj4Mt0VaUQ3Vvx8sSVYokxt1bQ0Q=;
 b=j4jjPZmQTqNd840igPpFvF7BuO0yOv1BNG50NlL8V68lMi+Ua+kLbE+4JiU3srJdoz
 Kd0v5uA+upLvZ4tQqeCU93bLXX7U+hmtePD7nagzI5iKy6eL2g4MenIngP/ok72BiLkm
 HDsmnEOP7A49PPeM+qmg2nNPKoc8w1B/Wr/bHFRtJFTYq/Ue5lSPhltGL4ctMSYiasGD
 nIXY7153ELKzWXPzzPw8nJN6OJaYYNcBkeZh42qkGSu4wE3SRPtwwNIP+8g2OlU7snAV
 O4GYq4CSFralPJ+eVggvwZYTs0eBtd7TNF2SqMOo56UxsluosgoiDdbwIL4h+o79CXit
 XZDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=1zuB0zs580SQU5zGj4Mt0VaUQ3Vvx8sSVYokxt1bQ0Q=;
 b=ovFf1B9RrfBv1ufJqwng6iF9498uyk0VWd3Jdg8TNPAIcqfa9N0wyW2Chn2WZ253aX
 2vfGkNHWNeJPilZijxPaA6qusK832ewh+ch47tuaIvaTkNuart42oZD1AIt2nYNkWJE7
 0PmqA4/O48xrR8/ESrRaLPfOfMqXODFRT+8uoDU0lsYKAVhXH/CY5aO6gC9/1qQZwqKg
 fxp5RQBYPv/fBWZ9p3LGHphJKcTQWo1Yf2Jg2aMFhIP5WIaB1Xvn58TiYQ7qs9zuNjKS
 /EN38Vj7IlkCfe4EKJGvZtoXWfwx0E8Gxww0yQhDRauM3/0wEGcAnu5GUTRFbejUJ6fI
 C7fA==
X-Gm-Message-State: AOAM5315WoWCrAOXr0dgg+8ffymLtGv34mlp11jsvVI5ki84YaEESiGM
 R/u1WM8P4jR8w3TPJ6bYS+4=
X-Google-Smtp-Source: ABdhPJy0eq16KSaN0oQOfAokl7NzMfncJFSfMzFoX6jT6TVyyG3b6zhEdn31Ukjlr069qibrCsc7Uw==
X-Received: by 2002:a1c:4d8:: with SMTP id 207mr17396410wme.2.1635550726280;
 Fri, 29 Oct 2021 16:38:46 -0700 (PDT)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id e8sm7134478wrp.58.2021.10.29.16.38.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Oct 2021 16:38:45 -0700 (PDT)
Message-ID: <877f4d31-c8b3-896d-8a97-0a6676c0d3e7@amsat.org>
Date: Sat, 30 Oct 2021 01:38:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v5 52/67] target/s390x: Implement s390x_cpu_record_sigbus
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20211015041053.2769193-1-richard.henderson@linaro.org>
 <20211015041053.2769193-53-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20211015041053.2769193-53-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x336.google.com
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-2.512,
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
Cc: qemu-s390x <qemu-s390x@nongnu.org>, alex.bennee@linaro.org,
 laurent@vivier.eu, imp@bsdimp.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/15/21 06:10, Richard Henderson wrote:
> For s390x, the only unaligned accesses that are signaled are atomic,
> and we don't actually want to raise SIGBUS for those, but instead
> raise a SPECIFICATION error, which the kernel will report as SIGILL.
> 
> Split out a do_unaligned_access function to share between the user-only
> s390x_cpu_record_sigbus and the sysemu s390x_do_unaligned_access.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> ---
>  target/s390x/s390x-internal.h  |  8 +++++---
>  target/s390x/cpu.c             |  1 +
>  target/s390x/tcg/excp_helper.c | 27 ++++++++++++++++++++-------
>  3 files changed, 26 insertions(+), 10 deletions(-)
> 
> diff --git a/target/s390x/s390x-internal.h b/target/s390x/s390x-internal.h
> index 163aa4f94a..1a178aed41 100644
> --- a/target/s390x/s390x-internal.h
> +++ b/target/s390x/s390x-internal.h
> @@ -270,18 +270,20 @@ ObjectClass *s390_cpu_class_by_name(const char *name);
>  void s390x_cpu_debug_excp_handler(CPUState *cs);
>  void s390_cpu_do_interrupt(CPUState *cpu);
>  bool s390_cpu_exec_interrupt(CPUState *cpu, int int_req);
> -void s390x_cpu_do_unaligned_access(CPUState *cs, vaddr addr,
> -                                   MMUAccessType access_type, int mmu_idx,
> -                                   uintptr_t retaddr) QEMU_NORETURN;
>  
>  #ifdef CONFIG_USER_ONLY
>  void s390_cpu_record_sigsegv(CPUState *cs, vaddr address,
>                               MMUAccessType access_type,
>                               bool maperr, uintptr_t retaddr);
> +void s390_cpu_record_sigbus(CPUState *cs, vaddr address,
> +                            MMUAccessType access_type, uintptr_t retaddr);
>  #else
>  bool s390_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
>                         MMUAccessType access_type, int mmu_idx,
>                         bool probe, uintptr_t retaddr);
> +void s390x_cpu_do_unaligned_access(CPUState *cs, vaddr addr,
> +                                   MMUAccessType access_type, int mmu_idx,
> +                                   uintptr_t retaddr) QEMU_NORETURN;
>  #endif
>  
>  
> diff --git a/target/s390x/cpu.c b/target/s390x/cpu.c
> index 593dda75c4..ccdbaf84d5 100644
> --- a/target/s390x/cpu.c
> +++ b/target/s390x/cpu.c
> @@ -269,6 +269,7 @@ static const struct TCGCPUOps s390_tcg_ops = {
>  
>  #ifdef CONFIG_USER_ONLY
>      .record_sigsegv = s390_cpu_record_sigsegv,
> +    .record_sigbus = s390_cpu_record_sigbus,
>  #else
>      .tlb_fill = s390_cpu_tlb_fill,
>      .cpu_exec_interrupt = s390_cpu_exec_interrupt,
> diff --git a/target/s390x/tcg/excp_helper.c b/target/s390x/tcg/excp_helper.c
> index b923d080fc..4e7648f301 100644
> --- a/target/s390x/tcg/excp_helper.c
> +++ b/target/s390x/tcg/excp_helper.c
> @@ -82,6 +82,19 @@ void HELPER(data_exception)(CPUS390XState *env, uint32_t dxc)
>      tcg_s390_data_exception(env, dxc, GETPC());
>  }
>  
> +/*
> + * Unaligned accesses are only diagnosed with MO_ALIGN.  At the moment,
> + * this is only for the atomic operations, for which we want to raise a
> + * specification exception.
> + */
> +static void QEMU_NORETURN do_unaligned_access(CPUState *cs, uintptr_t retaddr)
> +{
> +    S390CPU *cpu = S390_CPU(cs);
> +    CPUS390XState *env = &cpu->env;
> +
> +    tcg_s390_program_interrupt(env, PGM_SPECIFICATION, retaddr);
> +}
> +
>  #if defined(CONFIG_USER_ONLY)
>  
>  void s390_cpu_do_interrupt(CPUState *cs)
> @@ -106,6 +119,12 @@ void s390_cpu_record_sigsegv(CPUState *cs, vaddr address,
>      cpu_loop_exit_restore(cs, retaddr);
>  }
>  
> +void s390_cpu_record_sigbus(CPUState *cs, vaddr address,
> +                            MMUAccessType access_type, uintptr_t retaddr)
> +{
> +    do_unaligned_access(cs, retaddr);
> +}
> +
>  #else /* !CONFIG_USER_ONLY */
>  
>  static inline uint64_t cpu_mmu_idx_to_asc(int mmu_idx)
> @@ -593,17 +612,11 @@ void s390x_cpu_debug_excp_handler(CPUState *cs)
>      }
>  }
>  
> -/* Unaligned accesses are only diagnosed with MO_ALIGN.  At the moment,
> -   this is only for the atomic operations, for which we want to raise a
> -   specification exception.  */
>  void s390x_cpu_do_unaligned_access(CPUState *cs, vaddr addr,
>                                     MMUAccessType access_type,
>                                     int mmu_idx, uintptr_t retaddr)
>  {
> -    S390CPU *cpu = S390_CPU(cs);
> -    CPUS390XState *env = &cpu->env;
> -
> -    tcg_s390_program_interrupt(env, PGM_SPECIFICATION, retaddr);
> +    do_unaligned_access(cs, retaddr);
>  }
>  
>  static void QEMU_NORETURN monitor_event(CPUS390XState *env,
> 


