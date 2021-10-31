Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F32F1440DC9
	for <lists+qemu-devel@lfdr.de>; Sun, 31 Oct 2021 11:16:42 +0100 (CET)
Received: from localhost ([::1]:51172 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mh7tJ-0004EE-Pz
	for lists+qemu-devel@lfdr.de; Sun, 31 Oct 2021 06:16:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49518)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mh7qs-0002pb-9T
 for qemu-devel@nongnu.org; Sun, 31 Oct 2021 06:14:10 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:37626)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mh7qp-0008Uz-U0
 for qemu-devel@nongnu.org; Sun, 31 Oct 2021 06:14:09 -0400
Received: by mail-wr1-x436.google.com with SMTP id b12so19346460wrh.4
 for <qemu-devel@nongnu.org>; Sun, 31 Oct 2021 03:14:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Cy4L0S28nPFuqicSoYW2REVCs2fa4tpslkZT6abahDs=;
 b=JQBaSKln4Y2b756t57ny3un14SAOCXbjeFc6qYA9/ga3fY16Qd30x3FCsNKscE4FZh
 7NpSnm2BWObGzm8+kGc9wSrlDchmtXhPdgJHybPe4Qn6USdLWU4I2totWJhUF6utxfVB
 LQ0BbDRJjM11yRYiG0vZp9Q2TS1CfJauQ+IrQ9cILluaAUhNw7jg0uNYbNBgjw6108Ob
 C77YBS+QGuP7aQxr9b5aXZjKQBx4DByan/B7SD42WFbvisrEwVwVV5Yg898WTme5dF6f
 wd2Ohe466JQqFB8gJ+LsZxadND+NnUaB5RhduzWqDkQ42Hl8VyxXWQENnBep1jb8udLe
 JGsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Cy4L0S28nPFuqicSoYW2REVCs2fa4tpslkZT6abahDs=;
 b=jNRoEAnPjRwsIF4DjmKvd29ChZ1GzRsdJEyt07anJQ5tP0uJ0k2UuE4hKKXGJu2VM1
 aCzYduKM2SJWN1LAmKSX1I2o+qXLkkLgudk6+DqAV8b4wxKneIZp3bnqK66k1roD5Du2
 5A14ZTK3kDFlBsPY7aDLELm2cFllbqVX/C4381eDSTv7e7kriMdJeMZSwxit0tjMa6nl
 Rt2Dh/8wePZ/6xiHQTr7ByOylXxOewTQncIGdi3Ud++GaZR2x/Azl2lH3w6v25zuK+CD
 yKD1NBm9sHXv054ZKo8iO0ktaBn1YdUGAEN2zxsMzUiFd0CLC0Ct3myOmRSUlK8uDKUS
 gF4g==
X-Gm-Message-State: AOAM531qlbNyvFgjzFo5AMEAI8kIelh1Ro0YvCJhiYgcQ4ziqQFCxlDY
 fpjPjEie9wjL6hR2ekxpZUs=
X-Google-Smtp-Source: ABdhPJwixs5OqNkLeBHhvRmITXSAgFKN7AoPYaviQxOqn5goPM8dsbaKWdcyPJLt+58W06PxFoY2jQ==
X-Received: by 2002:adf:a402:: with SMTP id d2mr30491182wra.266.1635675246513; 
 Sun, 31 Oct 2021 03:14:06 -0700 (PDT)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id q8sm2482799wrx.71.2021.10.31.03.14.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 31 Oct 2021 03:14:05 -0700 (PDT)
Message-ID: <33d46517-8b50-1bfb-08f6-221678579693@amsat.org>
Date: Sun, 31 Oct 2021 11:14:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v6 29/66] target/microblaze: Make mb_cpu_tlb_fill sysemu
 only
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
References: <20211030171635.1689530-1-richard.henderson@linaro.org>
 <20211030171635.1689530-30-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20211030171635.1689530-30-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x436.google.com
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
> The fallback code in cpu_loop_exit_sigsegv is sufficient
> for microblaze linux-user.
> 
> Remove the code from cpu_loop that handled the unnamed 0xaa exception.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/microblaze/cpu.h          |  8 ++++----
>  linux-user/microblaze/cpu_loop.c | 10 ----------
>  target/microblaze/cpu.c          |  2 +-
>  target/microblaze/helper.c       | 13 +------------
>  4 files changed, 6 insertions(+), 27 deletions(-)
> 
> diff --git a/target/microblaze/cpu.h b/target/microblaze/cpu.h
> index b7a848bbae..e9cd0b88de 100644
> --- a/target/microblaze/cpu.h
> +++ b/target/microblaze/cpu.h
> @@ -394,10 +394,6 @@ void mb_tcg_init(void);
>  #define MMU_USER_IDX    2
>  /* See NB_MMU_MODES further up the file.  */
>  
> -bool mb_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
> -                     MMUAccessType access_type, int mmu_idx,
> -                     bool probe, uintptr_t retaddr);
> -
>  typedef CPUMBState CPUArchState;
>  typedef MicroBlazeCPU ArchCPU;
>  
> @@ -415,6 +411,10 @@ static inline void cpu_get_tb_cpu_state(CPUMBState *env, target_ulong *pc,
>  }
>  
>  #if !defined(CONFIG_USER_ONLY)
> +bool mb_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
> +                     MMUAccessType access_type, int mmu_idx,
> +                     bool probe, uintptr_t retaddr);
> +
>  void mb_cpu_transaction_failed(CPUState *cs, hwaddr physaddr, vaddr addr,
>                                 unsigned size, MMUAccessType access_type,
>                                 int mmu_idx, MemTxAttrs attrs,
> diff --git a/linux-user/microblaze/cpu_loop.c b/linux-user/microblaze/cpu_loop.c
> index 52222eb93f..a94467dd2d 100644
> --- a/linux-user/microblaze/cpu_loop.c
> +++ b/linux-user/microblaze/cpu_loop.c
> @@ -37,16 +37,6 @@ void cpu_loop(CPUMBState *env)
>          process_queued_cpu_work(cs);
>  
>          switch (trapnr) {
> -        case 0xaa:
> -            {
> -                info.si_signo = TARGET_SIGSEGV;
> -                info.si_errno = 0;
> -                /* XXX: check env->error_code */
> -                info.si_code = TARGET_SEGV_MAPERR;
> -                info._sifields._sigfault._addr = 0;
> -                queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
> -            }
> -            break;
>          case EXCP_INTERRUPT:
>            /* just indicate that signals should be handled asap */
>            break;
> diff --git a/target/microblaze/cpu.c b/target/microblaze/cpu.c
> index 15db277925..b9c888b87e 100644
> --- a/target/microblaze/cpu.c
> +++ b/target/microblaze/cpu.c
> @@ -365,9 +365,9 @@ static const struct SysemuCPUOps mb_sysemu_ops = {
>  static const struct TCGCPUOps mb_tcg_ops = {
>      .initialize = mb_tcg_init,
>      .synchronize_from_tb = mb_cpu_synchronize_from_tb,
> -    .tlb_fill = mb_cpu_tlb_fill,
>  
>  #ifndef CONFIG_USER_ONLY
> +    .tlb_fill = mb_cpu_tlb_fill,
>      .cpu_exec_interrupt = mb_cpu_exec_interrupt,
>      .do_interrupt = mb_cpu_do_interrupt,
>      .do_transaction_failed = mb_cpu_transaction_failed,
> diff --git a/target/microblaze/helper.c b/target/microblaze/helper.c
> index dd2aecd1d5..a607fe68e5 100644
> --- a/target/microblaze/helper.c
> +++ b/target/microblaze/helper.c
> @@ -24,18 +24,7 @@
>  #include "qemu/host-utils.h"
>  #include "exec/log.h"
>  
> -#if defined(CONFIG_USER_ONLY)
> -
> -bool mb_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
> -                     MMUAccessType access_type, int mmu_idx,
> -                     bool probe, uintptr_t retaddr)
> -{
> -    cs->exception_index = 0xaa;
> -    cpu_loop_exit_restore(cs, retaddr);
> -}
> -
> -#else /* !CONFIG_USER_ONLY */
> -
> +#ifndef CONFIG_USER_ONLY
>  static bool mb_cpu_access_is_secure(MicroBlazeCPU *cpu,
>                                      MMUAccessType access_type)
>  {
> 

To the best of my knowledge:
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

But I'd feel safer with an Ack-by from Edgar :)

