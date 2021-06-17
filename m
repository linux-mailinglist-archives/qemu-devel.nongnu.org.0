Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B77AF3AA815
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Jun 2021 02:26:37 +0200 (CEST)
Received: from localhost ([::1]:53324 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltfrg-0000Ca-P3
	for lists+qemu-devel@lfdr.de; Wed, 16 Jun 2021 20:26:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35152)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shorne@gmail.com>) id 1ltfq8-0007xF-Mm
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 20:25:00 -0400
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433]:38476)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shorne@gmail.com>) id 1ltfq4-0007Zx-6u
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 20:25:00 -0400
Received: by mail-pf1-x433.google.com with SMTP id z26so3556591pfj.5
 for <qemu-devel@nongnu.org>; Wed, 16 Jun 2021 17:24:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=uTQ6y8E7L4utog7CGQXZNPNfGDv/kBo+p+5uc3dT1TI=;
 b=G6Us0gqDuA0HxjyXDqcDuhAkUhHHj9ud/gu/BYu+6HG62I9WoAacwiz25xXGAiFZ1P
 GP5sS/dSko8STR3HbArlFH9ZZlfPaogXBSrjT+ZVhIINwQxFBd+axoG4Z2JbiKJmN+VB
 SdqND781FjrrgTU7HE+r54uicpA0IFZphYpWlVo2WbmcjRnTpq2D7eAZKW6T31Sar02f
 vd7ENXU4zbH5f3qE4TR+yWWBEv2U/P9kbjIr8iX0QjRj3NEp8txYskGMAtfheaqS0X2L
 SNNJ1Ql+to75vtOtKs4HA69MIXtSk/TN+uuOjzF+qIkLOHVK6Ps4XI8+rpYoAzQUw3+h
 6uWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=uTQ6y8E7L4utog7CGQXZNPNfGDv/kBo+p+5uc3dT1TI=;
 b=dBfKWANxcrnTBMGc0+4ti5wwXfypVJM2neahcrVzqxXN/zKn9oVPqy3q3ProrouzIc
 9gh335V7q2rt1r7s0mjd/VT8iT5Nz8QMsfyqR+5uz4WC1nWr0N24TBgIxpvXoB9yqUjJ
 uG2gOkUKO05QXealyngCBtXiPjXPICoA69BzWhswkwVD03WX9itfkdMrjOJqYTGoMDaF
 MxUrk/lYdS5Por1ZPqqLtRBnJpkkQSrXUSFeCpFXa9913IgveCchW14A/mhvhhUmY3gZ
 178WBVKYhG5sm6z8CCx97ANr6Uqcyp9KFHyyPJ6llE0iYXyMTN8Eg6onOWj1EsJuu4W7
 OFag==
X-Gm-Message-State: AOAM5318YRpHggRx+4EKBEGgB//M2NtNLjO4UyVnArjxwfaZaPK2kCgE
 K4bPdY0MF4kjZp64RbDZtCk=
X-Google-Smtp-Source: ABdhPJwM5yBAXLJms5oNLjW7vOscEpOXE6pRchBn/XKHRA+R167lKfpP0bAPz7F+8HvdgdlV6TBLLw==
X-Received: by 2002:a63:5b0d:: with SMTP id p13mr2358949pgb.84.1623889493519; 
 Wed, 16 Jun 2021 17:24:53 -0700 (PDT)
Received: from localhost (g151.115-65-219.ppp.wakwak.ne.jp. [115.65.219.151])
 by smtp.gmail.com with ESMTPSA id
 v9sm1106942pgq.54.2021.06.16.17.24.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Jun 2021 17:24:52 -0700 (PDT)
Date: Thu, 17 Jun 2021 09:24:51 +0900
From: Stafford Horne <shorne@gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH 14/21] linux-user/openrisc: Implement setup_sigtramp
Message-ID: <YMqWU6IAgNUoXctT@antec>
References: <20210616011209.1446045-1-richard.henderson@linaro.org>
 <20210616011209.1446045-15-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210616011209.1446045-15-richard.henderson@linaro.org>
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=shorne@gmail.com; helo=mail-pf1-x433.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: alex.bennee@linaro.org, qemu-devel@nongnu.org, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jun 15, 2021 at 06:12:02PM -0700, Richard Henderson wrote:
> Create and record the rt signal trampoline.
> 
> Cc: Stafford Horne <shorne@gmail.com>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Stafford Horne <shorne@gmail.com>

> ---
>  linux-user/openrisc/target_signal.h |  2 ++
>  linux-user/openrisc/signal.c        | 24 ++++++++++++++++--------
>  2 files changed, 18 insertions(+), 8 deletions(-)
> 
> diff --git a/linux-user/openrisc/target_signal.h b/linux-user/openrisc/target_signal.h
> index 8283eaf544..077ec3d5e8 100644
> --- a/linux-user/openrisc/target_signal.h
> +++ b/linux-user/openrisc/target_signal.h
> @@ -26,4 +26,6 @@ typedef struct target_sigaltstack {
>  
>  #include "../generic/signal.h"
>  
> +#define TARGET_ARCH_HAS_SIGTRAMP_PAGE 1
> +
>  #endif /* OPENRISC_TARGET_SIGNAL_H */
> diff --git a/linux-user/openrisc/signal.c b/linux-user/openrisc/signal.c
> index 5c5640a284..b411b01864 100644
> --- a/linux-user/openrisc/signal.c
> +++ b/linux-user/openrisc/signal.c
> @@ -37,7 +37,6 @@ typedef struct target_ucontext {
>  typedef struct target_rt_sigframe {
>      struct target_siginfo info;
>      target_ucontext uc;
> -    uint32_t retcode[4];  /* trampoline code */
>  } target_rt_sigframe;
>  
>  static void restore_sigcontext(CPUOpenRISCState *env, target_sigcontext *sc)
> @@ -115,14 +114,8 @@ void setup_rt_frame(int sig, struct target_sigaction *ka,
>          __put_user(set->sig[i], &frame->uc.tuc_sigmask.sig[i]);
>      }
>  
> -    /* This is l.ori r11,r0,__NR_sigreturn; l.sys 1; l.nop; l.nop */
> -    __put_user(0xa9600000 | TARGET_NR_rt_sigreturn, frame->retcode + 0);
> -    __put_user(0x20000001, frame->retcode + 1);
> -    __put_user(0x15000000, frame->retcode + 2);
> -    __put_user(0x15000000, frame->retcode + 3);
> -
>      /* Set up registers for signal handler */
> -    cpu_set_gpr(env, 9, frame_addr + offsetof(target_rt_sigframe, retcode));
> +    cpu_set_gpr(env, 9, default_rt_sigreturn);
>      cpu_set_gpr(env, 3, sig);
>      cpu_set_gpr(env, 4, frame_addr + offsetof(target_rt_sigframe, info));
>      cpu_set_gpr(env, 5, frame_addr + offsetof(target_rt_sigframe, uc));
> @@ -168,3 +161,18 @@ long do_rt_sigreturn(CPUOpenRISCState *env)
>      force_sig(TARGET_SIGSEGV);
>      return 0;
>  }
> +
> +void setup_sigtramp(abi_ulong sigtramp_page)
> +{
> +    uint32_t *tramp = lock_user(VERIFY_WRITE, sigtramp_page, 4 * 4, 0);
> +    assert(tramp != NULL);
> +
> +    /* This is l.ori r11,r0,__NR_sigreturn; l.sys 1; l.nop; l.nop */
> +    __put_user(0xa9600000 | TARGET_NR_rt_sigreturn, tramp + 0);
> +    __put_user(0x20000001, tramp + 1);
> +    __put_user(0x15000000, tramp + 2);
> +    __put_user(0x15000000, tramp + 3);
> +
> +    default_rt_sigreturn = sigtramp_page;
> +    unlock_user(tramp, sigtramp_page, 4 * 4);
> +}
> -- 
> 2.25.1
> 

