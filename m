Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E0070454B7A
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Nov 2021 17:58:11 +0100 (CET)
Received: from localhost ([::1]:40160 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mnOGB-0007qY-1p
	for lists+qemu-devel@lfdr.de; Wed, 17 Nov 2021 11:58:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36010)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mnO4j-0004K4-Vb
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 11:46:22 -0500
Received: from [2607:f8b0:4864:20::92e] (port=45032
 helo=mail-ua1-x92e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mnO4f-0001eC-HW
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 11:46:21 -0500
Received: by mail-ua1-x92e.google.com with SMTP id p2so7214574uad.11
 for <qemu-devel@nongnu.org>; Wed, 17 Nov 2021 08:46:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/yutFPMrUgtZ/iO27nOpVPHLWUfmPSy6pQI6+e6jZew=;
 b=u2nUs6R+amgPSyRMQ9CZ6/vEBvTflSo2FjH+XyKBO86EYlqNGOTdJCJ01rsD3phjdP
 FyYzg7YDwvfvXMHkTY5kRYN3bRdATsohe/GHS73shDg5UgH97b940KmcxhQOfzPxzpoA
 z8Gbxsd0NY7c3WfxZW0XjvQFZVUzGQdlwM6JI2g/eidZuO7rYcvjg79WU9gI8SAq29Uq
 lL4cqlSk9GarrElewSaxfj6nmQFl8MBd1p1Ag0o9f4b1dO3CZOoaZ1ZAyYzbz0oDmjbf
 dJ+N4oLTK/WBeGhh+hvPK4/a0mzYa1/uMfi9fbe008QLRcJiDCc3ANXYiBxLoJgBJ7Qu
 KjvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/yutFPMrUgtZ/iO27nOpVPHLWUfmPSy6pQI6+e6jZew=;
 b=i9rAxRzEk1V1kahnqhzytX9lbtB5f8t//neGvjK0aTNVPIARqkwncSsE08K2hhPPP2
 Rt2ZDFXEVMtcj0C8fMMpI9rOPjCf2ukbMgnLCIpnRUKkkI6wa9QtTLvrd9ltaPSC3Q4F
 Nb/K71Oy3Wj592GlYqSYjFqMYoidMF8W79t3xGLYzUbA4mmNn2VxwDh0on97mJTxcK99
 YM877LAHsV0KBYHaX9ANJluZjAaBktKSlQl0mYOJFFY62u2dCzq7nf+3/76oCNbh63Jm
 wkUmHDwmKuZVbDqi3SQ2apJRO2E5ITOHkhWuDjK40j89lUZCiTqkLRwUSL/VZVVU7d28
 lmpw==
X-Gm-Message-State: AOAM530LAqY57Rt7mXeQn4k79b4ziASuH/tSLHKDV6fdgVs5It1+DUyS
 7gnzI1i3YJAaGBold8yuhQyPkMFTm734fYuDWu5KZA==
X-Google-Smtp-Source: ABdhPJys0ZWj35TENuN66i3X5OCnIqNQHKOUNAOEujbZLklQbNQHWUT2U6AonFfpDE8inNL3NDPTU4wfdVLM4g+Ap+g=
X-Received: by 2002:ab0:4405:: with SMTP id m5mr25416229uam.11.1637167576505; 
 Wed, 17 Nov 2021 08:46:16 -0800 (PST)
MIME-Version: 1.0
References: <20211117160412.71563-1-richard.henderson@linaro.org>
 <20211117160412.71563-10-richard.henderson@linaro.org>
In-Reply-To: <20211117160412.71563-10-richard.henderson@linaro.org>
From: Warner Losh <imp@bsdimp.com>
Date: Wed, 17 Nov 2021 09:46:06 -0700
Message-ID: <CANCZdfryBFO9jhVX8SB_MRebZCDuUsyXWkk6KXzPa3hBw0YA1g@mail.gmail.com>
Subject: Re: [PATCH v5 09/17] *-user: Rename TARGET_ERESTARTSYS to
 QEMU_ERESTARTSYS
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: multipart/alternative; boundary="000000000000d5f34c05d0fec738"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::92e
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::92e;
 envelope-from=wlosh@bsdimp.com; helo=mail-ua1-x92e.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, PDS_HP_HELO_NORDNS=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=no autolearn_force=no
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
Cc: QEMU Developers <qemu-devel@nongnu.org>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000d5f34c05d0fec738
Content-Type: text/plain; charset="UTF-8"

On Wed, Nov 17, 2021 at 9:04 AM Richard Henderson <
richard.henderson@linaro.org> wrote:

> This value is fully internal to qemu, and so is not a TARGET define.
> We use this as an extra marker for both host and target errno.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  bsd-user/errno_defs.h                       |  2 +-
>  linux-user/generic/target_errno_defs.h      |  2 +-
>  linux-user/safe-syscall.h                   |  8 ++++----
>  linux-user/signal-common.h                  |  2 +-
>  linux-user/aarch64/cpu_loop.c               |  2 +-
>  linux-user/alpha/cpu_loop.c                 |  2 +-
>  linux-user/arm/cpu_loop.c                   |  2 +-
>  linux-user/cris/cpu_loop.c                  |  2 +-
>  linux-user/hexagon/cpu_loop.c               |  2 +-
>  linux-user/hppa/cpu_loop.c                  |  2 +-
>  linux-user/i386/cpu_loop.c                  |  6 +++---
>  linux-user/m68k/cpu_loop.c                  |  2 +-
>  linux-user/microblaze/cpu_loop.c            |  2 +-
>  linux-user/mips/cpu_loop.c                  |  2 +-
>  linux-user/openrisc/cpu_loop.c              |  2 +-
>  linux-user/ppc/cpu_loop.c                   |  2 +-
>  linux-user/riscv/cpu_loop.c                 |  2 +-
>  linux-user/s390x/cpu_loop.c                 |  2 +-
>  linux-user/sh4/cpu_loop.c                   |  2 +-
>  linux-user/signal.c                         |  6 +++---
>  linux-user/sparc/cpu_loop.c                 |  2 +-
>  linux-user/syscall.c                        | 16 ++++++++--------
>  linux-user/xtensa/cpu_loop.c                |  2 +-
>  common-user/host/aarch64/safe-syscall.inc.S |  2 +-
>  common-user/host/arm/safe-syscall.inc.S     |  2 +-
>  common-user/host/i386/safe-syscall.inc.S    |  2 +-
>  common-user/host/mips/safe-syscall.inc.S    |  2 +-
>  common-user/host/ppc64/safe-syscall.inc.S   |  2 +-
>  common-user/host/riscv/safe-syscall.inc.S   |  2 +-
>  common-user/host/s390x/safe-syscall.inc.S   |  2 +-
>  common-user/host/sparc64/safe-syscall.inc.S |  2 +-
>  common-user/host/x86_64/safe-syscall.inc.S  |  2 +-
>  32 files changed, 46 insertions(+), 46 deletions(-)
>

Reviewed-by: Warner Losh <imp@bsdimp.com>


> diff --git a/bsd-user/errno_defs.h b/bsd-user/errno_defs.h
> index 832671354f..583ebe8cee 100644
> --- a/bsd-user/errno_defs.h
> +++ b/bsd-user/errno_defs.h
> @@ -151,6 +151,6 @@
>  /* Internal errors: */
>  #define TARGET_EJUSTRETURN      254             /* Just return without
> modifing regs */
>  #define TARGET_ERESTART         255             /* Restart syscall */
> -#define TARGET_ERESTARTSYS      TARGET_ERESTART /* Linux compat */
> +#define QEMU_ERESTARTSYS        TARGET_ERESTART /* compat */
>
>  #endif /* !  _ERRNO_DEFS_H_ */
> diff --git a/linux-user/generic/target_errno_defs.h
> b/linux-user/generic/target_errno_defs.h
> index 17d85e0b61..58a06a10d6 100644
> --- a/linux-user/generic/target_errno_defs.h
> +++ b/linux-user/generic/target_errno_defs.h
> @@ -153,7 +153,7 @@
>   * after handling any pending signals. They match with the ones the guest
>   * kernel uses for the same purpose.
>   */
> -#define TARGET_ERESTARTSYS     512     /* Restart system call (if
> SA_RESTART) */
> +#define QEMU_ERESTARTSYS     512     /* Restart system call (if
> SA_RESTART) */
>
>  /* QEMU internal, not visible to the guest. This is returned by the
>   * do_sigreturn() code after a successful sigreturn syscall, to indicate
> diff --git a/linux-user/safe-syscall.h b/linux-user/safe-syscall.h
> index 0deb87e51a..70c2dec408 100644
> --- a/linux-user/safe-syscall.h
> +++ b/linux-user/safe-syscall.h
> @@ -25,10 +25,10 @@
>   *
>   * Call a system call if guest signal not pending.
>   * This has the same API as the libc syscall() function, except that it
> - * may return -1 with errno == TARGET_ERESTARTSYS if a signal was pending.
> + * may return -1 with errno == QEMU_ERESTARTSYS if a signal was pending.
>   *
>   * Returns: the system call result, or -1 with an error code in errno
> - * (Errnos are host errnos; we rely on TARGET_ERESTARTSYS not clashing
> + * (Errnos are host errnos; we rely on QEMU_ERESTARTSYS not clashing
>   * with any of the host errno values.)
>   */
>
> @@ -81,7 +81,7 @@
>   * which are only technically blocking (ie which we know in practice won't
>   * stay in the host kernel indefinitely) it's OK to use libc if necessary.
>   * You must be able to cope with backing out correctly if some
> safe_syscall
> - * you make in the implementation returns either -TARGET_ERESTARTSYS or
> + * you make in the implementation returns either -QEMU_ERESTARTSYS or
>   * EINTR though.)
>   *
>   * block_signals() cannot be used for interruptible syscalls.
> @@ -94,7 +94,7 @@
>   * handler checks the interrupted host PC against the addresse of that
>   * known section. If the PC is before or at the address of the syscall
>   * instruction then we change the PC to point at a "return
> - * -TARGET_ERESTARTSYS" code path instead, and then exit the signal
> handler
> + * -QEMU_ERESTARTSYS" code path instead, and then exit the signal handler
>   * (causing the safe_syscall() call to immediately return that value).
>   * Then in the main.c loop if we see this magic return value we adjust
>   * the guest PC to wind it back to before the system call, and invoke
> diff --git a/linux-user/signal-common.h b/linux-user/signal-common.h
> index 7457f8025c..b9f33bb44f 100644
> --- a/linux-user/signal-common.h
> +++ b/linux-user/signal-common.h
> @@ -76,7 +76,7 @@ abi_long do_swapcontext(CPUArchState *env, abi_ulong
> uold_ctx,
>   * Block all signals, and arrange that the signal mask is returned to
>   * its correct value for the guest before we resume execution of guest
> code.
>   * If this function returns non-zero, then the caller should immediately
> - * return -TARGET_ERESTARTSYS to the main loop, which will take the
> pending
> + * return -QEMU_ERESTARTSYS to the main loop, which will take the pending
>   * signal and restart execution of the syscall.
>   * If block_signals() returns zero, then the caller can continue with
>   * emulation of the system call knowing that no signals can be taken
> diff --git a/linux-user/aarch64/cpu_loop.c b/linux-user/aarch64/cpu_loop.c
> index 97e0728b67..775ba43913 100644
> --- a/linux-user/aarch64/cpu_loop.c
> +++ b/linux-user/aarch64/cpu_loop.c
> @@ -99,7 +99,7 @@ void cpu_loop(CPUARMState *env)
>                               env->xregs[4],
>                               env->xregs[5],
>                               0, 0);
> -            if (ret == -TARGET_ERESTARTSYS) {
> +            if (ret == -QEMU_ERESTARTSYS) {
>                  env->pc -= 4;
>              } else if (ret != -TARGET_QEMU_ESIGRETURN) {
>                  env->xregs[0] = ret;
> diff --git a/linux-user/alpha/cpu_loop.c b/linux-user/alpha/cpu_loop.c
> index 4029849d5c..ce9b251ce3 100644
> --- a/linux-user/alpha/cpu_loop.c
> +++ b/linux-user/alpha/cpu_loop.c
> @@ -98,7 +98,7 @@ void cpu_loop(CPUAlphaState *env)
>                                      env->ir[IR_A2], env->ir[IR_A3],
>                                      env->ir[IR_A4], env->ir[IR_A5],
>                                      0, 0);
> -                if (sysret == -TARGET_ERESTARTSYS) {
> +                if (sysret == -QEMU_ERESTARTSYS) {
>                      env->pc -= 4;
>                      break;
>                  }
> diff --git a/linux-user/arm/cpu_loop.c b/linux-user/arm/cpu_loop.c
> index 01cb6eb534..1fcf19750e 100644
> --- a/linux-user/arm/cpu_loop.c
> +++ b/linux-user/arm/cpu_loop.c
> @@ -407,7 +407,7 @@ void cpu_loop(CPUARMState *env)
>                                       env->regs[4],
>                                       env->regs[5],
>                                       0, 0);
> -                    if (ret == -TARGET_ERESTARTSYS) {
> +                    if (ret == -QEMU_ERESTARTSYS) {
>                          env->regs[15] -= env->thumb ? 2 : 4;
>                      } else if (ret != -TARGET_QEMU_ESIGRETURN) {
>                          env->regs[0] = ret;
> diff --git a/linux-user/cris/cpu_loop.c b/linux-user/cris/cpu_loop.c
> index 0d5d268609..f3e5b13f89 100644
> --- a/linux-user/cris/cpu_loop.c
> +++ b/linux-user/cris/cpu_loop.c
> @@ -50,7 +50,7 @@ void cpu_loop(CPUCRISState *env)
>                               env->pregs[7],
>                               env->pregs[11],
>                               0, 0);
> -            if (ret == -TARGET_ERESTARTSYS) {
> +            if (ret == -QEMU_ERESTARTSYS) {
>                  env->pc -= 2;
>              } else if (ret != -TARGET_QEMU_ESIGRETURN) {
>                  env->regs[10] = ret;
> diff --git a/linux-user/hexagon/cpu_loop.c b/linux-user/hexagon/cpu_loop.c
> index 6b24cbaba9..1cacbf42f1 100644
> --- a/linux-user/hexagon/cpu_loop.c
> +++ b/linux-user/hexagon/cpu_loop.c
> @@ -54,7 +54,7 @@ void cpu_loop(CPUHexagonState *env)
>                               env->gpr[4],
>                               env->gpr[5],
>                               0, 0);
> -            if (ret == -TARGET_ERESTARTSYS) {
> +            if (ret == -QEMU_ERESTARTSYS) {
>                  env->gpr[HEX_REG_PC] -= 4;
>              } else if (ret != -TARGET_QEMU_ESIGRETURN) {
>                  env->gpr[0] = ret;
> diff --git a/linux-user/hppa/cpu_loop.c b/linux-user/hppa/cpu_loop.c
> index 375576c8f0..5315224d12 100644
> --- a/linux-user/hppa/cpu_loop.c
> +++ b/linux-user/hppa/cpu_loop.c
> @@ -133,7 +133,7 @@ void cpu_loop(CPUHPPAState *env)
>                  env->iaoq_f = env->gr[31];
>                  env->iaoq_b = env->gr[31] + 4;
>                  break;
> -            case -TARGET_ERESTARTSYS:
> +            case -QEMU_ERESTARTSYS:
>              case -TARGET_QEMU_ESIGRETURN:
>                  break;
>              }
> diff --git a/linux-user/i386/cpu_loop.c b/linux-user/i386/cpu_loop.c
> index f6a1cc632b..fbd9a353e5 100644
> --- a/linux-user/i386/cpu_loop.c
> +++ b/linux-user/i386/cpu_loop.c
> @@ -180,7 +180,7 @@ static void emulate_vsyscall(CPUX86State *env)
>      ret = do_syscall(env, syscall, env->regs[R_EDI], env->regs[R_ESI],
>                       env->regs[R_EDX], env->regs[10], env->regs[8],
>                       env->regs[9], 0, 0);
> -    g_assert(ret != -TARGET_ERESTARTSYS);
> +    g_assert(ret != -QEMU_ERESTARTSYS);
>      g_assert(ret != -TARGET_QEMU_ESIGRETURN);
>      if (ret == -TARGET_EFAULT) {
>          goto sigsegv;
> @@ -223,7 +223,7 @@ void cpu_loop(CPUX86State *env)
>                               env->regs[R_EDI],
>                               env->regs[R_EBP],
>                               0, 0);
> -            if (ret == -TARGET_ERESTARTSYS) {
> +            if (ret == -QEMU_ERESTARTSYS) {
>                  env->eip -= 2;
>              } else if (ret != -TARGET_QEMU_ESIGRETURN) {
>                  env->regs[R_EAX] = ret;
> @@ -241,7 +241,7 @@ void cpu_loop(CPUX86State *env)
>                               env->regs[8],
>                               env->regs[9],
>                               0, 0);
> -            if (ret == -TARGET_ERESTARTSYS) {
> +            if (ret == -QEMU_ERESTARTSYS) {
>                  env->eip -= 2;
>              } else if (ret != -TARGET_QEMU_ESIGRETURN) {
>                  env->regs[R_EAX] = ret;
> diff --git a/linux-user/m68k/cpu_loop.c b/linux-user/m68k/cpu_loop.c
> index 790bd558c3..b03c21a3dc 100644
> --- a/linux-user/m68k/cpu_loop.c
> +++ b/linux-user/m68k/cpu_loop.c
> @@ -80,7 +80,7 @@ void cpu_loop(CPUM68KState *env)
>                                   env->dregs[5],
>                                   env->aregs[0],
>                                   0, 0);
> -                if (ret == -TARGET_ERESTARTSYS) {
> +                if (ret == -QEMU_ERESTARTSYS) {
>                      env->pc -= 2;
>                  } else if (ret != -TARGET_QEMU_ESIGRETURN) {
>                      env->dregs[0] = ret;
> diff --git a/linux-user/microblaze/cpu_loop.c
> b/linux-user/microblaze/cpu_loop.c
> index a94467dd2d..6e368f986e 100644
> --- a/linux-user/microblaze/cpu_loop.c
> +++ b/linux-user/microblaze/cpu_loop.c
> @@ -53,7 +53,7 @@ void cpu_loop(CPUMBState *env)
>                               env->regs[9],
>                               env->regs[10],
>                               0, 0);
> -            if (ret == -TARGET_ERESTARTSYS) {
> +            if (ret == -QEMU_ERESTARTSYS) {
>                  /* Wind back to before the syscall. */
>                  env->pc -= 4;
>              } else if (ret != -TARGET_QEMU_ESIGRETURN) {
> diff --git a/linux-user/mips/cpu_loop.c b/linux-user/mips/cpu_loop.c
> index b735c99a24..64f308c6ad 100644
> --- a/linux-user/mips/cpu_loop.c
> +++ b/linux-user/mips/cpu_loop.c
> @@ -141,7 +141,7 @@ done_syscall:
>                               env->active_tc.gpr[8], env->active_tc.gpr[9],
>                               env->active_tc.gpr[10],
> env->active_tc.gpr[11]);
>  # endif /* O32 */
> -            if (ret == -TARGET_ERESTARTSYS) {
> +            if (ret == -QEMU_ERESTARTSYS) {
>                  env->active_tc.PC -= 4;
>                  break;
>              }
> diff --git a/linux-user/openrisc/cpu_loop.c
> b/linux-user/openrisc/cpu_loop.c
> index 3cfdbbf037..3147ab2b62 100644
> --- a/linux-user/openrisc/cpu_loop.c
> +++ b/linux-user/openrisc/cpu_loop.c
> @@ -48,7 +48,7 @@ void cpu_loop(CPUOpenRISCState *env)
>                               cpu_get_gpr(env, 6),
>                               cpu_get_gpr(env, 7),
>                               cpu_get_gpr(env, 8), 0, 0);
> -            if (ret == -TARGET_ERESTARTSYS) {
> +            if (ret == -QEMU_ERESTARTSYS) {
>                  env->pc -= 4;
>              } else if (ret != -TARGET_QEMU_ESIGRETURN) {
>                  cpu_set_gpr(env, 11, ret);
> diff --git a/linux-user/ppc/cpu_loop.c b/linux-user/ppc/cpu_loop.c
> index 483e669300..5348641e9e 100644
> --- a/linux-user/ppc/cpu_loop.c
> +++ b/linux-user/ppc/cpu_loop.c
> @@ -428,7 +428,7 @@ void cpu_loop(CPUPPCState *env)
>              ret = do_syscall(env, env->gpr[0], env->gpr[3], env->gpr[4],
>                               env->gpr[5], env->gpr[6], env->gpr[7],
>                               env->gpr[8], 0, 0);
> -            if (ret == -TARGET_ERESTARTSYS) {
> +            if (ret == -QEMU_ERESTARTSYS) {
>                  env->nip -= 4;
>                  break;
>              }
> diff --git a/linux-user/riscv/cpu_loop.c b/linux-user/riscv/cpu_loop.c
> index b301dac802..20f8c48b1d 100644
> --- a/linux-user/riscv/cpu_loop.c
> +++ b/linux-user/riscv/cpu_loop.c
> @@ -69,7 +69,7 @@ void cpu_loop(CPURISCVState *env)
>                                   env->gpr[xA5],
>                                   0, 0);
>              }
> -            if (ret == -TARGET_ERESTARTSYS) {
> +            if (ret == -QEMU_ERESTARTSYS) {
>                  env->pc -= 4;
>              } else if (ret != -TARGET_QEMU_ESIGRETURN) {
>                  env->gpr[xA0] = ret;
> diff --git a/linux-user/s390x/cpu_loop.c b/linux-user/s390x/cpu_loop.c
> index d089c8417e..043582ca7c 100644
> --- a/linux-user/s390x/cpu_loop.c
> +++ b/linux-user/s390x/cpu_loop.c
> @@ -83,7 +83,7 @@ void cpu_loop(CPUS390XState *env)
>              ret = do_syscall(env, n, env->regs[2], env->regs[3],
>                               env->regs[4], env->regs[5],
>                               env->regs[6], env->regs[7], 0, 0);
> -            if (ret == -TARGET_ERESTARTSYS) {
> +            if (ret == -QEMU_ERESTARTSYS) {
>                  env->psw.addr -= env->int_svc_ilen;
>              } else if (ret != -TARGET_QEMU_ESIGRETURN) {
>                  env->regs[2] = ret;
> diff --git a/linux-user/sh4/cpu_loop.c b/linux-user/sh4/cpu_loop.c
> index ac9b01840c..6c4ebfa969 100644
> --- a/linux-user/sh4/cpu_loop.c
> +++ b/linux-user/sh4/cpu_loop.c
> @@ -50,7 +50,7 @@ void cpu_loop(CPUSH4State *env)
>                               env->gregs[0],
>                               env->gregs[1],
>                               0, 0);
> -            if (ret == -TARGET_ERESTARTSYS) {
> +            if (ret == -QEMU_ERESTARTSYS) {
>                  env->pc -= 2;
>              } else if (ret != -TARGET_QEMU_ESIGRETURN) {
>                  env->gregs[0] = ret;
> diff --git a/linux-user/signal.c b/linux-user/signal.c
> index ca8f24b9ec..12b1705287 100644
> --- a/linux-user/signal.c
> +++ b/linux-user/signal.c
> @@ -213,7 +213,7 @@ int block_signals(void)
>
>  /* Wrapper for sigprocmask function
>   * Emulates a sigprocmask in a safe way for the guest. Note that set and
> oldset
> - * are host signal set, not guest ones. Returns -TARGET_ERESTARTSYS if
> + * are host signal set, not guest ones. Returns -QEMU_ERESTARTSYS if
>   * a signal was already pending and the syscall must be restarted, or
>   * 0 on success.
>   * If set is NULL, this is guaranteed not to fail.
> @@ -230,7 +230,7 @@ int do_sigprocmask(int how, const sigset_t *set,
> sigset_t *oldset)
>          int i;
>
>          if (block_signals()) {
> -            return -TARGET_ERESTARTSYS;
> +            return -QEMU_ERESTARTSYS;
>          }
>
>          switch (how) {
> @@ -985,7 +985,7 @@ int do_sigaction(int sig, const struct
> target_sigaction *act,
>      }
>
>      if (block_signals()) {
> -        return -TARGET_ERESTARTSYS;
> +        return -QEMU_ERESTARTSYS;
>      }
>
>      k = &sigact_table[sig - 1];
> diff --git a/linux-user/sparc/cpu_loop.c b/linux-user/sparc/cpu_loop.c
> index 0ba65e431c..529337c5e0 100644
> --- a/linux-user/sparc/cpu_loop.c
> +++ b/linux-user/sparc/cpu_loop.c
> @@ -181,7 +181,7 @@ void cpu_loop (CPUSPARCState *env)
>                                env->regwptr[2], env->regwptr[3],
>                                env->regwptr[4], env->regwptr[5],
>                                0, 0);
> -            if (ret == -TARGET_ERESTARTSYS || ret ==
> -TARGET_QEMU_ESIGRETURN) {
> +            if (ret == -QEMU_ERESTARTSYS || ret ==
> -TARGET_QEMU_ESIGRETURN) {
>                  break;
>              }
>              if ((abi_ulong)ret >= (abi_ulong)(-515)) {
> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
> index 544f5b662f..3c0e341e45 100644
> --- a/linux-user/syscall.c
> +++ b/linux-user/syscall.c
> @@ -545,7 +545,7 @@ static inline abi_long get_errno(abi_long ret)
>
>  const char *target_strerror(int err)
>  {
> -    if (err == TARGET_ERESTARTSYS) {
> +    if (err == QEMU_ERESTARTSYS) {
>          return "To be restarted";
>      }
>      if (err == TARGET_QEMU_ESIGRETURN) {
> @@ -6456,7 +6456,7 @@ static int do_fork(CPUArchState *env, unsigned int
> flags, abi_ulong newsp,
>          }
>
>          if (block_signals()) {
> -            return -TARGET_ERESTARTSYS;
> +            return -QEMU_ERESTARTSYS;
>          }
>
>          fork_start();
> @@ -8173,7 +8173,7 @@ static abi_long do_syscall1(void *cpu_env, int num,
> abi_long arg1,
>             Do thread termination if we have more then one thread.  */
>
>          if (block_signals()) {
> -            return -TARGET_ERESTARTSYS;
> +            return -QEMU_ERESTARTSYS;
>          }
>
>          pthread_mutex_lock(&clone_lock);
> @@ -9162,7 +9162,7 @@ static abi_long do_syscall1(void *cpu_env, int num,
> abi_long arg1,
>  #endif
>              ret = get_errno(safe_rt_sigsuspend(&ts->sigsuspend_mask,
>                                                 SIGSET_T_SIZE));
> -            if (ret != -TARGET_ERESTARTSYS) {
> +            if (ret != -QEMU_ERESTARTSYS) {
>                  ts->in_sigsuspend = 1;
>              }
>          }
> @@ -9181,7 +9181,7 @@ static abi_long do_syscall1(void *cpu_env, int num,
> abi_long arg1,
>              unlock_user(p, arg1, 0);
>              ret = get_errno(safe_rt_sigsuspend(&ts->sigsuspend_mask,
>                                                 SIGSET_T_SIZE));
> -            if (ret != -TARGET_ERESTARTSYS) {
> +            if (ret != -QEMU_ERESTARTSYS) {
>                  ts->in_sigsuspend = 1;
>              }
>          }
> @@ -9297,13 +9297,13 @@ static abi_long do_syscall1(void *cpu_env, int
> num, abi_long arg1,
>  #ifdef TARGET_NR_sigreturn
>      case TARGET_NR_sigreturn:
>          if (block_signals()) {
> -            return -TARGET_ERESTARTSYS;
> +            return -QEMU_ERESTARTSYS;
>          }
>          return do_sigreturn(cpu_env);
>  #endif
>      case TARGET_NR_rt_sigreturn:
>          if (block_signals()) {
> -            return -TARGET_ERESTARTSYS;
> +            return -QEMU_ERESTARTSYS;
>          }
>          return do_rt_sigreturn(cpu_env);
>      case TARGET_NR_sethostname:
> @@ -13141,7 +13141,7 @@ abi_long do_syscall(void *cpu_env, int num,
> abi_long arg1,
>          static bool flag;
>          flag = !flag;
>          if (flag) {
> -            return -TARGET_ERESTARTSYS;
> +            return -QEMU_ERESTARTSYS;
>          }
>      }
>  #endif
> diff --git a/linux-user/xtensa/cpu_loop.c b/linux-user/xtensa/cpu_loop.c
> index a83490ab35..29cc6f3830 100644
> --- a/linux-user/xtensa/cpu_loop.c
> +++ b/linux-user/xtensa/cpu_loop.c
> @@ -184,7 +184,7 @@ void cpu_loop(CPUXtensaState *env)
>                      env->regs[2] = ret;
>                      break;
>
> -                case -TARGET_ERESTARTSYS:
> +                case -QEMU_ERESTARTSYS:
>                      env->pc -= 3;
>                      break;
>
> diff --git a/common-user/host/aarch64/safe-syscall.inc.S
> b/common-user/host/aarch64/safe-syscall.inc.S
> index d3f065cdef..6b405be448 100644
> --- a/common-user/host/aarch64/safe-syscall.inc.S
> +++ b/common-user/host/aarch64/safe-syscall.inc.S
> @@ -86,7 +86,7 @@ safe_syscall_end:
>         ret
>
>         /* code path when we didn't execute the syscall */
> -2:     mov     w0, #TARGET_ERESTARTSYS
> +2:     mov     w0, #QEMU_ERESTARTSYS
>         b       1b
>
>         .cfi_endproc
> diff --git a/common-user/host/arm/safe-syscall.inc.S
> b/common-user/host/arm/safe-syscall.inc.S
> index 328299021d..e9b8d49d7c 100644
> --- a/common-user/host/arm/safe-syscall.inc.S
> +++ b/common-user/host/arm/safe-syscall.inc.S
> @@ -104,7 +104,7 @@ safe_syscall_end:
>         b       9b
>
>         /* code path when we didn't execute the syscall */
> -2:     ldr     r0, =TARGET_ERESTARTSYS
> +2:     ldr     r0, =QEMU_ERESTARTSYS
>         b       1b
>
>         .fnend
> diff --git a/common-user/host/i386/safe-syscall.inc.S
> b/common-user/host/i386/safe-syscall.inc.S
> index c27207492a..3f928764db 100644
> --- a/common-user/host/i386/safe-syscall.inc.S
> +++ b/common-user/host/i386/safe-syscall.inc.S
> @@ -114,7 +114,7 @@ safe_syscall_end:
>         jmp     9b
>
>         /* code path when we didn't execute the syscall */
> -2:     mov     $TARGET_ERESTARTSYS, %eax
> +2:     mov     $QEMU_ERESTARTSYS, %eax
>         jmp     1b
>         .cfi_endproc
>
> diff --git a/common-user/host/mips/safe-syscall.inc.S
> b/common-user/host/mips/safe-syscall.inc.S
> index 1e2f5a079c..90bf3cc03e 100644
> --- a/common-user/host/mips/safe-syscall.inc.S
> +++ b/common-user/host/mips/safe-syscall.inc.S
> @@ -122,7 +122,7 @@ safe_syscall_end:
>          PTR_ADDIU sp, sp, FRAME
>
>         /* code path when we didn't execute the syscall */
> -0:     li      v0, TARGET_ERESTARTSYS
> +0:     li      v0, QEMU_ERESTARTSYS
>
>         /* code path setting errno */
>  1:     PTR_L   t0, ERRNOP(sp)
> diff --git a/common-user/host/ppc64/safe-syscall.inc.S
> b/common-user/host/ppc64/safe-syscall.inc.S
> index e35408c5fb..11c4672f71 100644
> --- a/common-user/host/ppc64/safe-syscall.inc.S
> +++ b/common-user/host/ppc64/safe-syscall.inc.S
> @@ -92,7 +92,7 @@ safe_syscall_end:
>         blr
>
>         /* code path when we didn't execute the syscall */
> -0:     li      3, TARGET_ERESTARTSYS
> +0:     li      3, QEMU_ERESTARTSYS
>         b       1b
>
>         .cfi_endproc
> diff --git a/common-user/host/riscv/safe-syscall.inc.S
> b/common-user/host/riscv/safe-syscall.inc.S
> index eddede702b..2f07c729c4 100644
> --- a/common-user/host/riscv/safe-syscall.inc.S
> +++ b/common-user/host/riscv/safe-syscall.inc.S
> @@ -81,7 +81,7 @@ safe_syscall_end:
>         ret
>
>         /* code path when we didn't execute the syscall */
> -2:     li      a0, TARGET_ERESTARTSYS
> +2:     li      a0, QEMU_ERESTARTSYS
>         j       1b
>
>         .cfi_endproc
> diff --git a/common-user/host/s390x/safe-syscall.inc.S
> b/common-user/host/s390x/safe-syscall.inc.S
> index f2a3bccc13..c1cc127e85 100644
> --- a/common-user/host/s390x/safe-syscall.inc.S
> +++ b/common-user/host/s390x/safe-syscall.inc.S
> @@ -91,7 +91,7 @@ safe_syscall_end:
>         .cfi_restore_state
>
>         /* code path when we didn't execute the syscall */
> -1:     lghi    %r2, -TARGET_ERESTARTSYS
> +1:     lghi    %r2, -QEMU_ERESTARTSYS
>
>         /* code path setting errno */
>  0:     lcr     %r2, %r2                /* create positive errno */
> diff --git a/common-user/host/sparc64/safe-syscall.inc.S
> b/common-user/host/sparc64/safe-syscall.inc.S
> index 2492fcbd9e..55e32b30eb 100644
> --- a/common-user/host/sparc64/safe-syscall.inc.S
> +++ b/common-user/host/sparc64/safe-syscall.inc.S
> @@ -85,7 +85,7 @@ safe_syscall_end:
>
>         /* code path when we didn't execute the syscall */
>  2:     ba,pt   %xcc, 1b
> -        set    TARGET_ERESTARTSYS, %o0
> +        set    QEMU_ERESTARTSYS, %o0
>
>         .cfi_endproc
>         .size   safe_syscall_base, .-safe_syscall_base
> diff --git a/common-user/host/x86_64/safe-syscall.inc.S
> b/common-user/host/x86_64/safe-syscall.inc.S
> index e3f920fa5c..b93d684e66 100644
> --- a/common-user/host/x86_64/safe-syscall.inc.S
> +++ b/common-user/host/x86_64/safe-syscall.inc.S
> @@ -102,7 +102,7 @@ safe_syscall_end:
>          jmp    9b
>
>          /* code path when we didn't execute the syscall */
> -2:      mov     $TARGET_ERESTARTSYS, %eax
> +2:      mov     $QEMU_ERESTARTSYS, %eax
>          jmp    1b
>
>          .cfi_endproc
> --
> 2.25.1
>
>

--000000000000d5f34c05d0fec738
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Nov 17, 2021 at 9:04 AM Richa=
rd Henderson &lt;<a href=3D"mailto:richard.henderson@linaro.org">richard.he=
nderson@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">This value is fully internal to qemu, and so is not a TAR=
GET define.<br>
We use this as an extra marker for both host and target errno.<br>
<br>
Signed-off-by: Richard Henderson &lt;<a href=3D"mailto:richard.henderson@li=
naro.org" target=3D"_blank">richard.henderson@linaro.org</a>&gt;<br>
---<br>
=C2=A0bsd-user/errno_defs.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 2 +-<br>
=C2=A0linux-user/generic/target_errno_defs.h=C2=A0 =C2=A0 =C2=A0 |=C2=A0 2 =
+-<br>
=C2=A0linux-user/safe-syscall.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 8 ++++----<br>
=C2=A0linux-user/signal-common.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 2 +-<br>
=C2=A0linux-user/aarch64/cpu_loop.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 2 +-<br>
=C2=A0linux-user/alpha/cpu_loop.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0|=C2=A0 2 +-<br>
=C2=A0linux-user/arm/cpu_loop.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 2 +-<br>
=C2=A0linux-user/cris/cpu_loop.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 2 +-<br>
=C2=A0linux-user/hexagon/cpu_loop.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 2 +-<br>
=C2=A0linux-user/hppa/cpu_loop.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 2 +-<br>
=C2=A0linux-user/i386/cpu_loop.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 6 +++---<br>
=C2=A0linux-user/m68k/cpu_loop.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 2 +-<br>
=C2=A0linux-user/microblaze/cpu_loop.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 2 +-<br>
=C2=A0linux-user/mips/cpu_loop.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 2 +-<br>
=C2=A0linux-user/openrisc/cpu_loop.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 |=C2=A0 2 +-<br>
=C2=A0linux-user/ppc/cpu_loop.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 2 +-<br>
=C2=A0linux-user/riscv/cpu_loop.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0|=C2=A0 2 +-<br>
=C2=A0linux-user/s390x/cpu_loop.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0|=C2=A0 2 +-<br>
=C2=A0linux-user/sh4/cpu_loop.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 2 +-<br>
=C2=A0linux-user/signal.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 6 +++---<br>
=C2=A0linux-user/sparc/cpu_loop.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0|=C2=A0 2 +-<br>
=C2=A0linux-user/syscall.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 16 ++++++++--------<br>
=C2=A0linux-user/xtensa/cpu_loop.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 |=C2=A0 2 +-<br>
=C2=A0common-user/host/aarch64/safe-syscall.inc.S |=C2=A0 2 +-<br>
=C2=A0common-user/host/arm/safe-syscall.inc.S=C2=A0 =C2=A0 =C2=A0|=C2=A0 2 =
+-<br>
=C2=A0common-user/host/i386/safe-syscall.inc.S=C2=A0 =C2=A0 |=C2=A0 2 +-<br=
>
=C2=A0common-user/host/mips/safe-syscall.inc.S=C2=A0 =C2=A0 |=C2=A0 2 +-<br=
>
=C2=A0common-user/host/ppc64/safe-syscall.inc.S=C2=A0 =C2=A0|=C2=A0 2 +-<br=
>
=C2=A0common-user/host/riscv/safe-syscall.inc.S=C2=A0 =C2=A0|=C2=A0 2 +-<br=
>
=C2=A0common-user/host/s390x/safe-syscall.inc.S=C2=A0 =C2=A0|=C2=A0 2 +-<br=
>
=C2=A0common-user/host/sparc64/safe-syscall.inc.S |=C2=A0 2 +-<br>
=C2=A0common-user/host/x86_64/safe-syscall.inc.S=C2=A0 |=C2=A0 2 +-<br>
=C2=A032 files changed, 46 insertions(+), 46 deletions(-)<br></blockquote><=
div><br></div><div>Reviewed-by: Warner Losh &lt;<a href=3D"mailto:imp@bsdim=
p.com">imp@bsdimp.com</a>&gt;<br></div><div>=C2=A0</div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">
diff --git a/bsd-user/errno_defs.h b/bsd-user/errno_defs.h<br>
index 832671354f..583ebe8cee 100644<br>
--- a/bsd-user/errno_defs.h<br>
+++ b/bsd-user/errno_defs.h<br>
@@ -151,6 +151,6 @@<br>
=C2=A0/* Internal errors: */<br>
=C2=A0#define TARGET_EJUSTRETURN=C2=A0 =C2=A0 =C2=A0 254=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Just return without modifing regs */<br>
=C2=A0#define TARGET_ERESTART=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0255=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Restart syscall */<br>
-#define TARGET_ERESTARTSYS=C2=A0 =C2=A0 =C2=A0 TARGET_ERESTART /* Linux co=
mpat */<br>
+#define QEMU_ERESTARTSYS=C2=A0 =C2=A0 =C2=A0 =C2=A0 TARGET_ERESTART /* com=
pat */<br>
<br>
=C2=A0#endif /* !=C2=A0 _ERRNO_DEFS_H_ */<br>
diff --git a/linux-user/generic/target_errno_defs.h b/linux-user/generic/ta=
rget_errno_defs.h<br>
index 17d85e0b61..58a06a10d6 100644<br>
--- a/linux-user/generic/target_errno_defs.h<br>
+++ b/linux-user/generic/target_errno_defs.h<br>
@@ -153,7 +153,7 @@<br>
=C2=A0 * after handling any pending signals. They match with the ones the g=
uest<br>
=C2=A0 * kernel uses for the same purpose.<br>
=C2=A0 */<br>
-#define TARGET_ERESTARTSYS=C2=A0 =C2=A0 =C2=A0512=C2=A0 =C2=A0 =C2=A0/* Re=
start system call (if SA_RESTART) */<br>
+#define QEMU_ERESTARTSYS=C2=A0 =C2=A0 =C2=A0512=C2=A0 =C2=A0 =C2=A0/* Rest=
art system call (if SA_RESTART) */<br>
<br>
=C2=A0/* QEMU internal, not visible to the guest. This is returned by the<b=
r>
=C2=A0 * do_sigreturn() code after a successful sigreturn syscall, to indic=
ate<br>
diff --git a/linux-user/safe-syscall.h b/linux-user/safe-syscall.h<br>
index 0deb87e51a..70c2dec408 100644<br>
--- a/linux-user/safe-syscall.h<br>
+++ b/linux-user/safe-syscall.h<br>
@@ -25,10 +25,10 @@<br>
=C2=A0 *<br>
=C2=A0 * Call a system call if guest signal not pending.<br>
=C2=A0 * This has the same API as the libc syscall() function, except that =
it<br>
- * may return -1 with errno =3D=3D TARGET_ERESTARTSYS if a signal was pend=
ing.<br>
+ * may return -1 with errno =3D=3D QEMU_ERESTARTSYS if a signal was pendin=
g.<br>
=C2=A0 *<br>
=C2=A0 * Returns: the system call result, or -1 with an error code in errno=
<br>
- * (Errnos are host errnos; we rely on TARGET_ERESTARTSYS not clashing<br>
+ * (Errnos are host errnos; we rely on QEMU_ERESTARTSYS not clashing<br>
=C2=A0 * with any of the host errno values.)<br>
=C2=A0 */<br>
<br>
@@ -81,7 +81,7 @@<br>
=C2=A0 * which are only technically blocking (ie which we know in practice =
won&#39;t<br>
=C2=A0 * stay in the host kernel indefinitely) it&#39;s OK to use libc if n=
ecessary.<br>
=C2=A0 * You must be able to cope with backing out correctly if some safe_s=
yscall<br>
- * you make in the implementation returns either -TARGET_ERESTARTSYS or<br=
>
+ * you make in the implementation returns either -QEMU_ERESTARTSYS or<br>
=C2=A0 * EINTR though.)<br>
=C2=A0 *<br>
=C2=A0 * block_signals() cannot be used for interruptible syscalls.<br>
@@ -94,7 +94,7 @@<br>
=C2=A0 * handler checks the interrupted host PC against the addresse of tha=
t<br>
=C2=A0 * known section. If the PC is before or at the address of the syscal=
l<br>
=C2=A0 * instruction then we change the PC to point at a &quot;return<br>
- * -TARGET_ERESTARTSYS&quot; code path instead, and then exit the signal h=
andler<br>
+ * -QEMU_ERESTARTSYS&quot; code path instead, and then exit the signal han=
dler<br>
=C2=A0 * (causing the safe_syscall() call to immediately return that value)=
.<br>
=C2=A0 * Then in the main.c loop if we see this magic return value we adjus=
t<br>
=C2=A0 * the guest PC to wind it back to before the system call, and invoke=
<br>
diff --git a/linux-user/signal-common.h b/linux-user/signal-common.h<br>
index 7457f8025c..b9f33bb44f 100644<br>
--- a/linux-user/signal-common.h<br>
+++ b/linux-user/signal-common.h<br>
@@ -76,7 +76,7 @@ abi_long do_swapcontext(CPUArchState *env, abi_ulong uold=
_ctx,<br>
=C2=A0 * Block all signals, and arrange that the signal mask is returned to=
<br>
=C2=A0 * its correct value for the guest before we resume execution of gues=
t code.<br>
=C2=A0 * If this function returns non-zero, then the caller should immediat=
ely<br>
- * return -TARGET_ERESTARTSYS to the main loop, which will take the pendin=
g<br>
+ * return -QEMU_ERESTARTSYS to the main loop, which will take the pending<=
br>
=C2=A0 * signal and restart execution of the syscall.<br>
=C2=A0 * If block_signals() returns zero, then the caller can continue with=
<br>
=C2=A0 * emulation of the system call knowing that no signals can be taken<=
br>
diff --git a/linux-user/aarch64/cpu_loop.c b/linux-user/aarch64/cpu_loop.c<=
br>
index 97e0728b67..775ba43913 100644<br>
--- a/linux-user/aarch64/cpu_loop.c<br>
+++ b/linux-user/aarch64/cpu_loop.c<br>
@@ -99,7 +99,7 @@ void cpu_loop(CPUARMState *env)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 env-&gt;xregs[4],<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 env-&gt;xregs[5],<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0, 0);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ret =3D=3D -TARGET_ERESTARTS=
YS) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ret =3D=3D -QEMU_ERESTARTSYS=
) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0env-&gt;pc -=
=3D 4;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} else if (ret !=3D -TARGET=
_QEMU_ESIGRETURN) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0env-&gt;xregs=
[0] =3D ret;<br>
diff --git a/linux-user/alpha/cpu_loop.c b/linux-user/alpha/cpu_loop.c<br>
index 4029849d5c..ce9b251ce3 100644<br>
--- a/linux-user/alpha/cpu_loop.c<br>
+++ b/linux-user/alpha/cpu_loop.c<br>
@@ -98,7 +98,7 @@ void cpu_loop(CPUAlphaState *env)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0env-&gt;ir[IR_A2=
], env-&gt;ir[IR_A3],<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0env-&gt;ir[IR_A4=
], env-&gt;ir[IR_A5],<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00, 0);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (sysret =3D=3D =
-TARGET_ERESTARTSYS) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (sysret =3D=3D =
-QEMU_ERESTARTSYS) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0env-&gt;pc -=3D 4;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0break;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
diff --git a/linux-user/arm/cpu_loop.c b/linux-user/arm/cpu_loop.c<br>
index 01cb6eb534..1fcf19750e 100644<br>
--- a/linux-user/arm/cpu_loop.c<br>
+++ b/linux-user/arm/cpu_loop.c<br>
@@ -407,7 +407,7 @@ void cpu_loop(CPUARMState *env)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 env-&gt;regs[4]=
,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 env-&gt;regs[5]=
,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0, 0);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (=
ret =3D=3D -TARGET_ERESTARTSYS) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (=
ret =3D=3D -QEMU_ERESTARTSYS) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0env-&gt;regs[15] -=3D env-&gt;thumb ? 2 : 4;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0} else if (ret !=3D -TARGET_QEMU_ESIGRETURN) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0env-&gt;regs[0] =3D ret;<br>
diff --git a/linux-user/cris/cpu_loop.c b/linux-user/cris/cpu_loop.c<br>
index 0d5d268609..f3e5b13f89 100644<br>
--- a/linux-user/cris/cpu_loop.c<br>
+++ b/linux-user/cris/cpu_loop.c<br>
@@ -50,7 +50,7 @@ void cpu_loop(CPUCRISState *env)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 env-&gt;pregs[7], <br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 env-&gt;pregs[11],<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0, 0);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ret =3D=3D -TARGET_ERESTARTS=
YS) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ret =3D=3D -QEMU_ERESTARTSYS=
) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0env-&gt;pc -=
=3D 2;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} else if (ret !=3D -TARGET=
_QEMU_ESIGRETURN) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0env-&gt;regs[=
10] =3D ret;<br>
diff --git a/linux-user/hexagon/cpu_loop.c b/linux-user/hexagon/cpu_loop.c<=
br>
index 6b24cbaba9..1cacbf42f1 100644<br>
--- a/linux-user/hexagon/cpu_loop.c<br>
+++ b/linux-user/hexagon/cpu_loop.c<br>
@@ -54,7 +54,7 @@ void cpu_loop(CPUHexagonState *env)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 env-&gt;gpr[4],<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 env-&gt;gpr[5],<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0, 0);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ret =3D=3D -TARGET_ERESTARTS=
YS) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ret =3D=3D -QEMU_ERESTARTSYS=
) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0env-&gt;gpr[H=
EX_REG_PC] -=3D 4;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} else if (ret !=3D -TARGET=
_QEMU_ESIGRETURN) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0env-&gt;gpr[0=
] =3D ret;<br>
diff --git a/linux-user/hppa/cpu_loop.c b/linux-user/hppa/cpu_loop.c<br>
index 375576c8f0..5315224d12 100644<br>
--- a/linux-user/hppa/cpu_loop.c<br>
+++ b/linux-user/hppa/cpu_loop.c<br>
@@ -133,7 +133,7 @@ void cpu_loop(CPUHPPAState *env)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0env-&gt;iaoq_=
f =3D env-&gt;gr[31];<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0env-&gt;iaoq_=
b =3D env-&gt;gr[31] + 4;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case -TARGET_ERESTARTSYS:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case -QEMU_ERESTARTSYS:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case -TARGET_QEMU_ESIGRETUR=
N:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
diff --git a/linux-user/i386/cpu_loop.c b/linux-user/i386/cpu_loop.c<br>
index f6a1cc632b..fbd9a353e5 100644<br>
--- a/linux-user/i386/cpu_loop.c<br>
+++ b/linux-user/i386/cpu_loop.c<br>
@@ -180,7 +180,7 @@ static void emulate_vsyscall(CPUX86State *env)<br>
=C2=A0 =C2=A0 =C2=A0ret =3D do_syscall(env, syscall, env-&gt;regs[R_EDI], e=
nv-&gt;regs[R_ESI],<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 env-&gt;regs[R_EDX], env-&gt;regs[10], env-&gt;regs[8],<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 env-&gt;regs[9], 0, 0);<br>
-=C2=A0 =C2=A0 g_assert(ret !=3D -TARGET_ERESTARTSYS);<br>
+=C2=A0 =C2=A0 g_assert(ret !=3D -QEMU_ERESTARTSYS);<br>
=C2=A0 =C2=A0 =C2=A0g_assert(ret !=3D -TARGET_QEMU_ESIGRETURN);<br>
=C2=A0 =C2=A0 =C2=A0if (ret =3D=3D -TARGET_EFAULT) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto sigsegv;<br>
@@ -223,7 +223,7 @@ void cpu_loop(CPUX86State *env)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 env-&gt;regs[R_EDI],<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 env-&gt;regs[R_EBP],<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0, 0);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ret =3D=3D -TARGET_ERESTARTS=
YS) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ret =3D=3D -QEMU_ERESTARTSYS=
) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0env-&gt;eip -=
=3D 2;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} else if (ret !=3D -TARGET=
_QEMU_ESIGRETURN) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0env-&gt;regs[=
R_EAX] =3D ret;<br>
@@ -241,7 +241,7 @@ void cpu_loop(CPUX86State *env)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 env-&gt;regs[8],<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 env-&gt;regs[9],<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0, 0);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ret =3D=3D -TARGET_ERESTARTS=
YS) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ret =3D=3D -QEMU_ERESTARTSYS=
) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0env-&gt;eip -=
=3D 2;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} else if (ret !=3D -TARGET=
_QEMU_ESIGRETURN) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0env-&gt;regs[=
R_EAX] =3D ret;<br>
diff --git a/linux-user/m68k/cpu_loop.c b/linux-user/m68k/cpu_loop.c<br>
index 790bd558c3..b03c21a3dc 100644<br>
--- a/linux-user/m68k/cpu_loop.c<br>
+++ b/linux-user/m68k/cpu_loop.c<br>
@@ -80,7 +80,7 @@ void cpu_loop(CPUM68KState *env)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 env-&gt;dregs[5],<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 env-&gt;aregs[0],<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0, 0);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ret =3D=3D -TA=
RGET_ERESTARTSYS) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ret =3D=3D -QE=
MU_ERESTARTSYS) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0env-&gt;pc -=3D 2;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} else if (re=
t !=3D -TARGET_QEMU_ESIGRETURN) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0env-&gt;dregs[0] =3D ret;<br>
diff --git a/linux-user/microblaze/cpu_loop.c b/linux-user/microblaze/cpu_l=
oop.c<br>
index a94467dd2d..6e368f986e 100644<br>
--- a/linux-user/microblaze/cpu_loop.c<br>
+++ b/linux-user/microblaze/cpu_loop.c<br>
@@ -53,7 +53,7 @@ void cpu_loop(CPUMBState *env)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 env-&gt;regs[9], <br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 env-&gt;regs[10],<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0, 0);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ret =3D=3D -TARGET_ERESTARTS=
YS) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ret =3D=3D -QEMU_ERESTARTSYS=
) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Wind back =
to before the syscall. */<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0env-&gt;pc -=
=3D 4;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} else if (ret !=3D -TARGET=
_QEMU_ESIGRETURN) {<br>
diff --git a/linux-user/mips/cpu_loop.c b/linux-user/mips/cpu_loop.c<br>
index b735c99a24..64f308c6ad 100644<br>
--- a/linux-user/mips/cpu_loop.c<br>
+++ b/linux-user/mips/cpu_loop.c<br>
@@ -141,7 +141,7 @@ done_syscall:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 env-&gt;active_tc.gpr[8], env-&gt;active_tc=
.gpr[9],<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 env-&gt;active_tc.gpr[10], env-&gt;active_t=
c.gpr[11]);<br>
=C2=A0# endif /* O32 */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ret =3D=3D -TARGET_ERESTARTS=
YS) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ret =3D=3D -QEMU_ERESTARTSYS=
) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0env-&gt;activ=
e_tc.PC -=3D 4;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
diff --git a/linux-user/openrisc/cpu_loop.c b/linux-user/openrisc/cpu_loop.=
c<br>
index 3cfdbbf037..3147ab2b62 100644<br>
--- a/linux-user/openrisc/cpu_loop.c<br>
+++ b/linux-user/openrisc/cpu_loop.c<br>
@@ -48,7 +48,7 @@ void cpu_loop(CPUOpenRISCState *env)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cpu_get_gpr(env, 6),<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cpu_get_gpr(env, 7),<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cpu_get_gpr(env, 8), 0, 0);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ret =3D=3D -TARGET_ERESTARTS=
YS) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ret =3D=3D -QEMU_ERESTARTSYS=
) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0env-&gt;pc -=
=3D 4;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} else if (ret !=3D -TARGET=
_QEMU_ESIGRETURN) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cpu_set_gpr(e=
nv, 11, ret);<br>
diff --git a/linux-user/ppc/cpu_loop.c b/linux-user/ppc/cpu_loop.c<br>
index 483e669300..5348641e9e 100644<br>
--- a/linux-user/ppc/cpu_loop.c<br>
+++ b/linux-user/ppc/cpu_loop.c<br>
@@ -428,7 +428,7 @@ void cpu_loop(CPUPPCState *env)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D do_syscall(env, env=
-&gt;gpr[0], env-&gt;gpr[3], env-&gt;gpr[4],<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 env-&gt;gpr[5], env-&gt;gpr[6], env-&gt;gpr=
[7],<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 env-&gt;gpr[8], 0, 0);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ret =3D=3D -TARGET_ERESTARTS=
YS) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ret =3D=3D -QEMU_ERESTARTSYS=
) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0env-&gt;nip -=
=3D 4;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
diff --git a/linux-user/riscv/cpu_loop.c b/linux-user/riscv/cpu_loop.c<br>
index b301dac802..20f8c48b1d 100644<br>
--- a/linux-user/riscv/cpu_loop.c<br>
+++ b/linux-user/riscv/cpu_loop.c<br>
@@ -69,7 +69,7 @@ void cpu_loop(CPURISCVState *env)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 env-&gt;gpr[xA5],<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0, 0);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ret =3D=3D -TARGET_ERESTARTS=
YS) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ret =3D=3D -QEMU_ERESTARTSYS=
) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0env-&gt;pc -=
=3D 4;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} else if (ret !=3D -TARGET=
_QEMU_ESIGRETURN) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0env-&gt;gpr[x=
A0] =3D ret;<br>
diff --git a/linux-user/s390x/cpu_loop.c b/linux-user/s390x/cpu_loop.c<br>
index d089c8417e..043582ca7c 100644<br>
--- a/linux-user/s390x/cpu_loop.c<br>
+++ b/linux-user/s390x/cpu_loop.c<br>
@@ -83,7 +83,7 @@ void cpu_loop(CPUS390XState *env)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D do_syscall(env, n, =
env-&gt;regs[2], env-&gt;regs[3],<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 env-&gt;regs[4], env-&gt;regs[5],<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 env-&gt;regs[6], env-&gt;regs[7], 0, 0);<br=
>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ret =3D=3D -TARGET_ERESTARTS=
YS) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ret =3D=3D -QEMU_ERESTARTSYS=
) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0env-&gt;psw.a=
ddr -=3D env-&gt;int_svc_ilen;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} else if (ret !=3D -TARGET=
_QEMU_ESIGRETURN) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0env-&gt;regs[=
2] =3D ret;<br>
diff --git a/linux-user/sh4/cpu_loop.c b/linux-user/sh4/cpu_loop.c<br>
index ac9b01840c..6c4ebfa969 100644<br>
--- a/linux-user/sh4/cpu_loop.c<br>
+++ b/linux-user/sh4/cpu_loop.c<br>
@@ -50,7 +50,7 @@ void cpu_loop(CPUSH4State *env)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 env-&gt;gregs[0],<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 env-&gt;gregs[1],<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0, 0);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ret =3D=3D -TARGET_ERESTARTS=
YS) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ret =3D=3D -QEMU_ERESTARTSYS=
) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0env-&gt;pc -=
=3D 2;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} else if (ret !=3D -TARGET=
_QEMU_ESIGRETURN) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0env-&gt;gregs=
[0] =3D ret;<br>
diff --git a/linux-user/signal.c b/linux-user/signal.c<br>
index ca8f24b9ec..12b1705287 100644<br>
--- a/linux-user/signal.c<br>
+++ b/linux-user/signal.c<br>
@@ -213,7 +213,7 @@ int block_signals(void)<br>
<br>
=C2=A0/* Wrapper for sigprocmask function<br>
=C2=A0 * Emulates a sigprocmask in a safe way for the guest. Note that set =
and oldset<br>
- * are host signal set, not guest ones. Returns -TARGET_ERESTARTSYS if<br>
+ * are host signal set, not guest ones. Returns -QEMU_ERESTARTSYS if<br>
=C2=A0 * a signal was already pending and the syscall must be restarted, or=
<br>
=C2=A0 * 0 on success.<br>
=C2=A0 * If set is NULL, this is guaranteed not to fail.<br>
@@ -230,7 +230,7 @@ int do_sigprocmask(int how, const sigset_t *set, sigset=
_t *oldset)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int i;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (block_signals()) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -TARGET_ERESTARTSYS;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -QEMU_ERESTARTSYS;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0switch (how) {<br>
@@ -985,7 +985,7 @@ int do_sigaction(int sig, const struct target_sigaction=
 *act,<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
=C2=A0 =C2=A0 =C2=A0if (block_signals()) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 return -TARGET_ERESTARTSYS;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return -QEMU_ERESTARTSYS;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
=C2=A0 =C2=A0 =C2=A0k =3D &amp;sigact_table[sig - 1];<br>
diff --git a/linux-user/sparc/cpu_loop.c b/linux-user/sparc/cpu_loop.c<br>
index 0ba65e431c..529337c5e0 100644<br>
--- a/linux-user/sparc/cpu_loop.c<br>
+++ b/linux-user/sparc/cpu_loop.c<br>
@@ -181,7 +181,7 @@ void cpu_loop (CPUSPARCState *env)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0env-&gt;regwptr[2], env-&gt;regwptr[3=
],<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0env-&gt;regwptr[4], env-&gt;regwptr[5=
],<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00, 0);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ret =3D=3D -TARGET_ERESTARTS=
YS || ret =3D=3D -TARGET_QEMU_ESIGRETURN) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ret =3D=3D -QEMU_ERESTARTSYS=
 || ret =3D=3D -TARGET_QEMU_ESIGRETURN) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if ((abi_ulong)ret &gt;=3D =
(abi_ulong)(-515)) {<br>
diff --git a/linux-user/syscall.c b/linux-user/syscall.c<br>
index 544f5b662f..3c0e341e45 100644<br>
--- a/linux-user/syscall.c<br>
+++ b/linux-user/syscall.c<br>
@@ -545,7 +545,7 @@ static inline abi_long get_errno(abi_long ret)<br>
<br>
=C2=A0const char *target_strerror(int err)<br>
=C2=A0{<br>
-=C2=A0 =C2=A0 if (err =3D=3D TARGET_ERESTARTSYS) {<br>
+=C2=A0 =C2=A0 if (err =3D=3D QEMU_ERESTARTSYS) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return &quot;To be restarted&quot;;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0if (err =3D=3D TARGET_QEMU_ESIGRETURN) {<br>
@@ -6456,7 +6456,7 @@ static int do_fork(CPUArchState *env, unsigned int fl=
ags, abi_ulong newsp,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (block_signals()) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -TARGET_ERESTARTSYS;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -QEMU_ERESTARTSYS;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fork_start();<br>
@@ -8173,7 +8173,7 @@ static abi_long do_syscall1(void *cpu_env, int num, a=
bi_long arg1,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Do thread termination if we have =
more then one thread.=C2=A0 */<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (block_signals()) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -TARGET_ERESTARTSYS;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -QEMU_ERESTARTSYS;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pthread_mutex_lock(&amp;clone_lock);<br>
@@ -9162,7 +9162,7 @@ static abi_long do_syscall1(void *cpu_env, int num, a=
bi_long arg1,<br>
=C2=A0#endif<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D get_errno(safe_rt_s=
igsuspend(&amp;ts-&gt;sigsuspend_mask,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 SIGSET_T_SIZE));<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ret !=3D -TARGET_ERESTARTSYS=
) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ret !=3D -QEMU_ERESTARTSYS) =
{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ts-&gt;in_sig=
suspend =3D 1;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
@@ -9181,7 +9181,7 @@ static abi_long do_syscall1(void *cpu_env, int num, a=
bi_long arg1,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0unlock_user(p, arg1, 0);<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D get_errno(safe_rt_s=
igsuspend(&amp;ts-&gt;sigsuspend_mask,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 SIGSET_T_SIZE));<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ret !=3D -TARGET_ERESTARTSYS=
) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ret !=3D -QEMU_ERESTARTSYS) =
{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ts-&gt;in_sig=
suspend =3D 1;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
@@ -9297,13 +9297,13 @@ static abi_long do_syscall1(void *cpu_env, int num,=
 abi_long arg1,<br>
=C2=A0#ifdef TARGET_NR_sigreturn<br>
=C2=A0 =C2=A0 =C2=A0case TARGET_NR_sigreturn:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (block_signals()) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -TARGET_ERESTARTSYS;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -QEMU_ERESTARTSYS;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return do_sigreturn(cpu_env);<br>
=C2=A0#endif<br>
=C2=A0 =C2=A0 =C2=A0case TARGET_NR_rt_sigreturn:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (block_signals()) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -TARGET_ERESTARTSYS;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -QEMU_ERESTARTSYS;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return do_rt_sigreturn(cpu_env);<br>
=C2=A0 =C2=A0 =C2=A0case TARGET_NR_sethostname:<br>
@@ -13141,7 +13141,7 @@ abi_long do_syscall(void *cpu_env, int num, abi_lon=
g arg1,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0static bool flag;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0flag =3D !flag;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (flag) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -TARGET_ERESTARTSYS;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -QEMU_ERESTARTSYS;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0#endif<br>
diff --git a/linux-user/xtensa/cpu_loop.c b/linux-user/xtensa/cpu_loop.c<br=
>
index a83490ab35..29cc6f3830 100644<br>
--- a/linux-user/xtensa/cpu_loop.c<br>
+++ b/linux-user/xtensa/cpu_loop.c<br>
@@ -184,7 +184,7 @@ void cpu_loop(CPUXtensaState *env)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0env-&gt;regs[2] =3D ret;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0break;<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case -TARGET_EREST=
ARTSYS:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case -QEMU_ERESTAR=
TSYS:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0env-&gt;pc -=3D 3;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0break;<br>
<br>
diff --git a/common-user/host/aarch64/safe-syscall.inc.S b/common-user/host=
/aarch64/safe-syscall.inc.S<br>
index d3f065cdef..6b405be448 100644<br>
--- a/common-user/host/aarch64/safe-syscall.inc.S<br>
+++ b/common-user/host/aarch64/safe-syscall.inc.S<br>
@@ -86,7 +86,7 @@ safe_syscall_end:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* code path when we didn&#39;t execute the sys=
call */<br>
-2:=C2=A0 =C2=A0 =C2=A0mov=C2=A0 =C2=A0 =C2=A0w0, #TARGET_ERESTARTSYS<br>
+2:=C2=A0 =C2=A0 =C2=A0mov=C2=A0 =C2=A0 =C2=A0w0, #QEMU_ERESTARTSYS<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 b=C2=A0 =C2=A0 =C2=A0 =C2=A01b<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 .cfi_endproc<br>
diff --git a/common-user/host/arm/safe-syscall.inc.S b/common-user/host/arm=
/safe-syscall.inc.S<br>
index 328299021d..e9b8d49d7c 100644<br>
--- a/common-user/host/arm/safe-syscall.inc.S<br>
+++ b/common-user/host/arm/safe-syscall.inc.S<br>
@@ -104,7 +104,7 @@ safe_syscall_end:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 b=C2=A0 =C2=A0 =C2=A0 =C2=A09b<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* code path when we didn&#39;t execute the sys=
call */<br>
-2:=C2=A0 =C2=A0 =C2=A0ldr=C2=A0 =C2=A0 =C2=A0r0, =3DTARGET_ERESTARTSYS<br>
+2:=C2=A0 =C2=A0 =C2=A0ldr=C2=A0 =C2=A0 =C2=A0r0, =3DQEMU_ERESTARTSYS<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 b=C2=A0 =C2=A0 =C2=A0 =C2=A01b<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 .fnend<br>
diff --git a/common-user/host/i386/safe-syscall.inc.S b/common-user/host/i3=
86/safe-syscall.inc.S<br>
index c27207492a..3f928764db 100644<br>
--- a/common-user/host/i386/safe-syscall.inc.S<br>
+++ b/common-user/host/i386/safe-syscall.inc.S<br>
@@ -114,7 +114,7 @@ safe_syscall_end:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 jmp=C2=A0 =C2=A0 =C2=A09b<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* code path when we didn&#39;t execute the sys=
call */<br>
-2:=C2=A0 =C2=A0 =C2=A0mov=C2=A0 =C2=A0 =C2=A0$TARGET_ERESTARTSYS, %eax<br>
+2:=C2=A0 =C2=A0 =C2=A0mov=C2=A0 =C2=A0 =C2=A0$QEMU_ERESTARTSYS, %eax<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 jmp=C2=A0 =C2=A0 =C2=A01b<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 .cfi_endproc<br>
<br>
diff --git a/common-user/host/mips/safe-syscall.inc.S b/common-user/host/mi=
ps/safe-syscall.inc.S<br>
index 1e2f5a079c..90bf3cc03e 100644<br>
--- a/common-user/host/mips/safe-syscall.inc.S<br>
+++ b/common-user/host/mips/safe-syscall.inc.S<br>
@@ -122,7 +122,7 @@ safe_syscall_end:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0PTR_ADDIU sp, sp, FRAME<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* code path when we didn&#39;t execute the sys=
call */<br>
-0:=C2=A0 =C2=A0 =C2=A0li=C2=A0 =C2=A0 =C2=A0 v0, TARGET_ERESTARTSYS<br>
+0:=C2=A0 =C2=A0 =C2=A0li=C2=A0 =C2=A0 =C2=A0 v0, QEMU_ERESTARTSYS<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* code path setting errno */<br>
=C2=A01:=C2=A0 =C2=A0 =C2=A0PTR_L=C2=A0 =C2=A0t0, ERRNOP(sp)<br>
diff --git a/common-user/host/ppc64/safe-syscall.inc.S b/common-user/host/p=
pc64/safe-syscall.inc.S<br>
index e35408c5fb..11c4672f71 100644<br>
--- a/common-user/host/ppc64/safe-syscall.inc.S<br>
+++ b/common-user/host/ppc64/safe-syscall.inc.S<br>
@@ -92,7 +92,7 @@ safe_syscall_end:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 blr<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* code path when we didn&#39;t execute the sys=
call */<br>
-0:=C2=A0 =C2=A0 =C2=A0li=C2=A0 =C2=A0 =C2=A0 3, TARGET_ERESTARTSYS<br>
+0:=C2=A0 =C2=A0 =C2=A0li=C2=A0 =C2=A0 =C2=A0 3, QEMU_ERESTARTSYS<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 b=C2=A0 =C2=A0 =C2=A0 =C2=A01b<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 .cfi_endproc<br>
diff --git a/common-user/host/riscv/safe-syscall.inc.S b/common-user/host/r=
iscv/safe-syscall.inc.S<br>
index eddede702b..2f07c729c4 100644<br>
--- a/common-user/host/riscv/safe-syscall.inc.S<br>
+++ b/common-user/host/riscv/safe-syscall.inc.S<br>
@@ -81,7 +81,7 @@ safe_syscall_end:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* code path when we didn&#39;t execute the sys=
call */<br>
-2:=C2=A0 =C2=A0 =C2=A0li=C2=A0 =C2=A0 =C2=A0 a0, TARGET_ERESTARTSYS<br>
+2:=C2=A0 =C2=A0 =C2=A0li=C2=A0 =C2=A0 =C2=A0 a0, QEMU_ERESTARTSYS<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 j=C2=A0 =C2=A0 =C2=A0 =C2=A01b<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 .cfi_endproc<br>
diff --git a/common-user/host/s390x/safe-syscall.inc.S b/common-user/host/s=
390x/safe-syscall.inc.S<br>
index f2a3bccc13..c1cc127e85 100644<br>
--- a/common-user/host/s390x/safe-syscall.inc.S<br>
+++ b/common-user/host/s390x/safe-syscall.inc.S<br>
@@ -91,7 +91,7 @@ safe_syscall_end:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 .cfi_restore_state<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* code path when we didn&#39;t execute the sys=
call */<br>
-1:=C2=A0 =C2=A0 =C2=A0lghi=C2=A0 =C2=A0 %r2, -TARGET_ERESTARTSYS<br>
+1:=C2=A0 =C2=A0 =C2=A0lghi=C2=A0 =C2=A0 %r2, -QEMU_ERESTARTSYS<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* code path setting errno */<br>
=C2=A00:=C2=A0 =C2=A0 =C2=A0lcr=C2=A0 =C2=A0 =C2=A0%r2, %r2=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* create positive errno */<br>
diff --git a/common-user/host/sparc64/safe-syscall.inc.S b/common-user/host=
/sparc64/safe-syscall.inc.S<br>
index 2492fcbd9e..55e32b30eb 100644<br>
--- a/common-user/host/sparc64/safe-syscall.inc.S<br>
+++ b/common-user/host/sparc64/safe-syscall.inc.S<br>
@@ -85,7 +85,7 @@ safe_syscall_end:<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* code path when we didn&#39;t execute the sys=
call */<br>
=C2=A02:=C2=A0 =C2=A0 =C2=A0ba,pt=C2=A0 =C2=A0%xcc, 1b<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 set=C2=A0 =C2=A0 TARGET_ERESTARTSYS, %o0<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 set=C2=A0 =C2=A0 QEMU_ERESTARTSYS, %o0<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 .cfi_endproc<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 .size=C2=A0 =C2=A0safe_syscall_base, .-safe_sys=
call_base<br>
diff --git a/common-user/host/x86_64/safe-syscall.inc.S b/common-user/host/=
x86_64/safe-syscall.inc.S<br>
index e3f920fa5c..b93d684e66 100644<br>
--- a/common-user/host/x86_64/safe-syscall.inc.S<br>
+++ b/common-user/host/x86_64/safe-syscall.inc.S<br>
@@ -102,7 +102,7 @@ safe_syscall_end:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0jmp=C2=A0 =C2=A0 9b<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* code path when we didn&#39;t execute t=
he syscall */<br>
-2:=C2=A0 =C2=A0 =C2=A0 mov=C2=A0 =C2=A0 =C2=A0$TARGET_ERESTARTSYS, %eax<br=
>
+2:=C2=A0 =C2=A0 =C2=A0 mov=C2=A0 =C2=A0 =C2=A0$QEMU_ERESTARTSYS, %eax<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0jmp=C2=A0 =C2=A0 1b<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.cfi_endproc<br>
-- <br>
2.25.1<br>
<br>
</blockquote></div></div>

--000000000000d5f34c05d0fec738--

