Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2025345D842
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Nov 2021 11:28:07 +0100 (CET)
Received: from localhost ([::1]:43024 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mqBz3-0000I6-NH
	for lists+qemu-devel@lfdr.de; Thu, 25 Nov 2021 05:28:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41486)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mqBxC-0006iw-E0
 for qemu-devel@nongnu.org; Thu, 25 Nov 2021 05:26:15 -0500
Received: from [2607:f8b0:4864:20::932] (port=38597
 helo=mail-ua1-x932.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mqBx7-0003j0-Ug
 for qemu-devel@nongnu.org; Thu, 25 Nov 2021 05:26:10 -0500
Received: by mail-ua1-x932.google.com with SMTP id w23so11245498uao.5
 for <qemu-devel@nongnu.org>; Thu, 25 Nov 2021 02:26:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=q1mExyzg/Rb6whbu83LAKyv+n4kibjXVDLExlfZNN6Y=;
 b=R768JRemX72Qh2N8BQgB1KXvUvW8AdObIiPQTCC4Soa++VfOQttb5OTAtO7JodDOR9
 kZtM/xWiTGC/CWw+7Z9QiokIriFy+snndgFVZOndDmuFrT1qY3Mx5FzRE4Okiozj/OGN
 yitjAIZeH9l59sj9iXYqC7sDLrHjECZ4LAUst8vJH4Amc6OlQdfEX02u/0F7QqDfTa52
 jdV7xhzR/y1mIeS4aaRYMMetjrpQ8cfZo2AOD71G7hZuKxhbHYUn3QmlfvTggW+KAwog
 M/dKx6Cyz2XPix4kAuvR+IGUbN6ZvTDgZLa5sVmPYJcJhsPn9VoMToRgor+LE7LeuV1U
 B3pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=q1mExyzg/Rb6whbu83LAKyv+n4kibjXVDLExlfZNN6Y=;
 b=ha5n+GddiZhM2vzHfpn4N7d1Dxzt34iw5TX76b4Ugeucgvr4Ayt2Bsrj615ZFUVqTt
 cX49SC+rmla6HVSEtiys71f8A/Doe3fExcFuVtWSys9M98hQHfVDgOno+Kn2jP3j7OQr
 MA9mOTyQ/q9UZ6y9pR0b50rUL4/Hzw+Vl04Ry+/BgSOJz0J2WybvbHulrmD8SzyGBxpF
 0CzmaMmAXiImkRK/Mn/fIel/VbMgEHDuI3mn2uoC14ZWgVexRrhi0qOPveRc9CYfVbK9
 u2jgvtwWfyrJjUeVjEaYckmHGJgqoAvNqHrdXJVRpr4sPXN5IEVycHYMHEi9v+QozjlZ
 RHCg==
X-Gm-Message-State: AOAM531MwDkAaKjZDl3XbxvlRK+M8LYBJGgl2QWhwMMfLn8fEtIOoqvx
 BpDKph9sHuHfZRYfNn+Mxgmf+JuJVIhogVRmRt+BhYTOUA1OAg==
X-Google-Smtp-Source: ABdhPJxmX1/RRhqM9miRID7GS4Yqn1EVvq5qZjqE0hqGPgPOvMXoTVKVfmKfNjfwJQZPqvPidIqQTSELkHWOZR/IStQ=
X-Received: by 2002:a05:6102:3e95:: with SMTP id
 m21mr7445833vsv.77.1637835964805; 
 Thu, 25 Nov 2021 02:26:04 -0800 (PST)
MIME-Version: 1.0
References: <20211123173759.1383510-1-richard.henderson@linaro.org>
 <20211123173759.1383510-4-richard.henderson@linaro.org>
In-Reply-To: <20211123173759.1383510-4-richard.henderson@linaro.org>
From: Warner Losh <imp@bsdimp.com>
Date: Thu, 25 Nov 2021 03:25:54 -0700
Message-ID: <CANCZdfq_E6UTJuQuZjy-Bqp-26oPks7BoE2j0YF7AtE2NQkMuA@mail.gmail.com>
Subject: Re: [PATCH v6 03/16] linux-user: Move syscall error detection into
 safe_syscall_base
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: multipart/alternative; boundary="000000000000e21c0d05d19a6611"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::932
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::932;
 envelope-from=wlosh@bsdimp.com; helo=mail-ua1-x932.google.com
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

--000000000000e21c0d05d19a6611
Content-Type: text/plain; charset="UTF-8"

On Tue, Nov 23, 2021 at 10:38 AM Richard Henderson <
richard.henderson@linaro.org> wrote:

> The current api from safe_syscall_base() is to return -errno, which is
> the interface provided by *some* linux kernel abis.  The wrapper macro,
> safe_syscall(), detects error, stores into errno, and returns -1, to
> match the api of the system syscall().
>
> For those kernel abis that do not return -errno natively, this leads
> to double syscall error detection.  E.g. Linux ppc64, which sets the
> SO flag for error.
>
> Simplify the usage from C by moving the error detection into assembly,
> and usage from assembly by providing a C helper with which to set errno.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  linux-user/safe-syscall.h                  | 16 +++-------
>  linux-user/safe-syscall-error.c            | 28 ++++++++++++++++
>  linux-user/host/aarch64/safe-syscall.inc.S | 20 ++++++------
>  linux-user/host/arm/safe-syscall.inc.S     | 27 ++++++++++------
>  linux-user/host/i386/safe-syscall.inc.S    | 37 +++++++++++++++-------
>  linux-user/host/ppc64/safe-syscall.inc.S   | 20 ++++++------
>  linux-user/host/riscv/safe-syscall.inc.S   | 20 ++++++------
>  linux-user/host/s390x/safe-syscall.inc.S   | 32 ++++++++++++-------
>  linux-user/host/x86_64/safe-syscall.inc.S  | 29 +++++++++--------
>  linux-user/meson.build                     |  1 +
>  10 files changed, 145 insertions(+), 85 deletions(-)
>  create mode 100644 linux-user/safe-syscall-error.c
>

Reviewed-by: Warner Losh <imp@bsdimp.com>

Note: My s390 assembler skills are quite weak, but it seems consistent with
the rest of the code. I'm less sure about the riscv and ppc64, but am quite
confident in the arm, aarch64, x86 and meson change. Not sure how to
otherwise
signal that when the review is uneven.


> diff --git a/linux-user/safe-syscall.h b/linux-user/safe-syscall.h
> index aaa9ffc0e2..97837faddb 100644
> --- a/linux-user/safe-syscall.h
> +++ b/linux-user/safe-syscall.h
> @@ -127,21 +127,15 @@
>  #ifdef HAVE_SAFE_SYSCALL
>  /* The core part of this function is implemented in assembly */
>  extern long safe_syscall_base(int *pending, long number, ...);
> +extern long safe_syscall_set_errno_tail(int value);
> +
>  /* These are defined by the safe-syscall.inc.S file */
>  extern char safe_syscall_start[];
>  extern char safe_syscall_end[];
>
> -#define safe_syscall(...)                                               \
> -    ({                                                                  \
> -        long ret_;                                                      \
> -        int *psp_ = &((TaskState *)thread_cpu->opaque)->signal_pending; \
> -        ret_ = safe_syscall_base(psp_, __VA_ARGS__);                    \
> -        if (is_error(ret_)) {                                           \
> -            errno = -ret_;                                              \
> -            ret_ = -1;                                                  \
> -        }                                                               \
> -        ret_;                                                           \
> -    })
> +#define safe_syscall(...)
>  \
> +    safe_syscall_base(&((TaskState *)thread_cpu->opaque)->signal_pending,
> \
> +                      __VA_ARGS__)
>
>  #else
>
> diff --git a/linux-user/safe-syscall-error.c
> b/linux-user/safe-syscall-error.c
> new file mode 100644
> index 0000000000..d7e2700f81
> --- /dev/null
> +++ b/linux-user/safe-syscall-error.c
> @@ -0,0 +1,28 @@
> +/*
> + * safe-syscall-error.c: errno setting fragment
> + * This is intended to be invoked by safe-syscall.S
> + *
> + * Written by Richard Henderson <rth@twiddle.net>
> + * Copyright (C) 2021 Red Hat, Inc.
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2 or
> later.
> + * See the COPYING file in the top-level directory.
> + */
> +
> +#include "qemu/osdep.h"
> +#include "hostdep.h"
> +#include "safe-syscall.h"
> +
> +#ifdef HAVE_SAFE_SYSCALL
> +/*
> + * This is intended to be invoked via tail-call on the error path
> + * from the assembly in host/arch/safe-syscall.inc.S.  This takes
> + * care of the host specific addressing of errno.
> + * Return -1 to finalize the return value for safe_syscall_base.
> + */
> +long safe_syscall_set_errno_tail(int value)
> +{
> +    errno = value;
> +    return -1;
> +}
> +#endif
> diff --git a/linux-user/host/aarch64/safe-syscall.inc.S
> b/linux-user/host/aarch64/safe-syscall.inc.S
> index e2e726ef55..76a0a18a6c 100644
> --- a/linux-user/host/aarch64/safe-syscall.inc.S
> +++ b/linux-user/host/aarch64/safe-syscall.inc.S
> @@ -22,15 +22,12 @@
>           * first argument an 'int *' to the signal_pending flag, the
>           * second one the system call number (as a 'long'), and all
> further
>           * arguments being syscall arguments (also 'long').
> -         * We return a long which is the syscall's return value, which
> -         * may be negative-errno on failure. Conversion to the
> -         * -1-and-errno-set convention is done by the calling wrapper.
>           */
>  safe_syscall_base:
>          .cfi_startproc
>          /* The syscall calling convention isn't the same as the
>           * C one:
> -         * we enter with x0 == *signal_pending
> +         * we enter with x0 == &signal_pending
>           *               x1 == syscall number
>           *               x2 ... x7, (stack) == syscall arguments
>           *               and return the result in x0
> @@ -60,16 +57,21 @@ safe_syscall_base:
>  safe_syscall_start:
>          /* if signal_pending is non-zero, don't do the call */
>          ldr     w10, [x9]
> -        cbnz    w10, 0f
> +        cbnz    w10, 2f
>          svc     0x0
>  safe_syscall_end:
>          /* code path for having successfully executed the syscall */
> +        cmp     x0, #-4096
> +        b.hi    0f
>          ret
>
> -0:
> +        /* code path setting errno */
> +0:      neg     w0, w0
> +        b       safe_syscall_set_errno_tail
> +
>          /* code path when we didn't execute the syscall */
> -        mov     x0, #-TARGET_ERESTARTSYS
> -        ret
> -        .cfi_endproc
> +2:      mov     w0, #TARGET_ERESTARTSYS
> +        b       safe_syscall_set_errno_tail
>
> +        .cfi_endproc
>          .size   safe_syscall_base, .-safe_syscall_base
> diff --git a/linux-user/host/arm/safe-syscall.inc.S
> b/linux-user/host/arm/safe-syscall.inc.S
> index 1f1ee8327b..618112c6bf 100644
> --- a/linux-user/host/arm/safe-syscall.inc.S
> +++ b/linux-user/host/arm/safe-syscall.inc.S
> @@ -27,9 +27,6 @@
>           * first argument an 'int *' to the signal_pending flag, the
>           * second one the system call number (as a 'long'), and all
> further
>           * arguments being syscall arguments (also 'long').
> -         * We return a long which is the syscall's return value, which
> -         * may be negative-errno on failure. Conversion to the
> -         * -1-and-errno-set convention is done by the calling wrapper.
>           */
>  safe_syscall_base:
>          .fnstart
> @@ -46,7 +43,7 @@ safe_syscall_base:
>          .cfi_rel_offset lr, 20
>
>          /* The syscall calling convention isn't the same as the C one:
> -         * we enter with r0 == *signal_pending
> +         * we enter with r0 == &signal_pending
>           *               r1 == syscall number
>           *               r2, r3, [sp+0] ... [sp+12] == syscall arguments
>           *               and return the result in r0
> @@ -74,17 +71,29 @@ safe_syscall_start:
>          /* if signal_pending is non-zero, don't do the call */
>          ldr     r12, [r8]               /* signal_pending */
>          tst     r12, r12
> -        bne     1f
> +        bne     2f
>          swi     0
>  safe_syscall_end:
>          /* code path for having successfully executed the syscall */
> +        cmp     r0, #-4096
> +        neghi   r0, r0
> +        bhi     1f
>          pop     { r4, r5, r6, r7, r8, pc }
>
> -1:
>          /* code path when we didn't execute the syscall */
> -        ldr     r0, =-TARGET_ERESTARTSYS
> -        pop     { r4, r5, r6, r7, r8, pc }
> +2:      mov     r0, #TARGET_ERESTARTSYS
> +
> +        /* code path setting errno */
> +1:      pop     { r4, r5, r6, r7, r8, lr }
> +        .cfi_adjust_cfa_offset -24
> +        .cfi_restore r4
> +        .cfi_restore r5
> +        .cfi_restore r6
> +        .cfi_restore r7
> +        .cfi_restore r8
> +        .cfi_restore lr
> +        b       safe_syscall_set_errno_tail
> +
>          .fnend
>          .cfi_endproc
> -
>          .size   safe_syscall_base, .-safe_syscall_base
> diff --git a/linux-user/host/i386/safe-syscall.inc.S
> b/linux-user/host/i386/safe-syscall.inc.S
> index e425aa54d8..f5883234bb 100644
> --- a/linux-user/host/i386/safe-syscall.inc.S
> +++ b/linux-user/host/i386/safe-syscall.inc.S
> @@ -20,9 +20,6 @@
>           * first argument an 'int *' to the signal_pending flag, the
>           * second one the system call number (as a 'long'), and all
> further
>           * arguments being syscall arguments (also 'long').
> -         * We return a long which is the syscall's return value, which
> -         * may be negative-errno on failure. Conversion to the
> -         * -1-and-errno-set convention is done by the calling wrapper.
>           */
>  safe_syscall_base:
>          .cfi_startproc
> @@ -41,7 +38,7 @@ safe_syscall_base:
>
>          /* The syscall calling convention isn't the same as the C one:
>           * we enter with 0(%esp) == return address
> -         *               4(%esp) == *signal_pending
> +         *               4(%esp) == &signal_pending
>           *               8(%esp) == syscall number
>           *               12(%esp) ... 32(%esp) == syscall arguments
>           *               and return the result in eax
> @@ -70,11 +67,13 @@ safe_syscall_start:
>          /* if signal_pending is non-zero, don't do the call */
>          mov     4+16(%esp), %eax        /* signal_pending */
>          cmpl    $0, (%eax)
> -        jnz     1f
> +        jnz     2f
>          mov     8+16(%esp), %eax        /* syscall number */
>          int     $0x80
>  safe_syscall_end:
>          /* code path for having successfully executed the syscall */
> +        cmp     $-4095, %eax
> +        jae     0f
>          pop     %ebx
>          .cfi_remember_state
>          .cfi_adjust_cfa_offset -4
> @@ -89,12 +88,28 @@ safe_syscall_end:
>          .cfi_adjust_cfa_offset -4
>          .cfi_restore ebp
>          ret
> -
> -1:
> -        /* code path when we didn't execute the syscall */
>          .cfi_restore_state
> -        mov     $-TARGET_ERESTARTSYS, %eax
> -        jmp     safe_syscall_end
> -        .cfi_endproc
>
> +0:      neg     %eax
> +        jmp     1f
> +
> +        /* code path when we didn't execute the syscall */
> +2:      mov     $TARGET_ERESTARTSYS, %eax
> +
> +        /* code path setting errno */
> +1:      pop     %ebx
> +        .cfi_adjust_cfa_offset -4
> +        .cfi_restore ebx
> +        pop     %edi
> +        .cfi_adjust_cfa_offset -4
> +        .cfi_restore edi
> +        pop     %esi
> +        .cfi_adjust_cfa_offset -4
> +        .cfi_restore esi
> +        pop     %ebp
> +        .cfi_adjust_cfa_offset -4
> +        .cfi_restore ebp
> +        jmp     safe_syscall_set_errno_tail
> +
> +        .cfi_endproc
>          .size   safe_syscall_base, .-safe_syscall_base
> diff --git a/linux-user/host/ppc64/safe-syscall.inc.S
> b/linux-user/host/ppc64/safe-syscall.inc.S
> index 5f19cd193c..b370889480 100644
> --- a/linux-user/host/ppc64/safe-syscall.inc.S
> +++ b/linux-user/host/ppc64/safe-syscall.inc.S
> @@ -22,9 +22,6 @@
>           * first argument an 'int *' to the signal_pending flag, the
>           * second one the system call number (as a 'long'), and all
> further
>           * arguments being syscall arguments (also 'long').
> -         * We return a long which is the syscall's return value, which
> -         * may be negative-errno on failure. Conversion to the
> -         * -1-and-errno-set convention is done by the calling wrapper.
>           */
>  #if _CALL_ELF == 2
>  safe_syscall_base:
> @@ -39,7 +36,7 @@ safe_syscall_base:
>  .L.safe_syscall_base:
>          .cfi_startproc
>  #endif
> -        /* We enter with r3 == *signal_pending
> +        /* We enter with r3 == &signal_pending
>           *               r4 == syscall number
>           *               r5 ... r10 == syscall arguments
>           *               and return the result in r3
> @@ -69,19 +66,20 @@ safe_syscall_start:
>          /* if signal_pending is non-zero, don't do the call */
>          lwz     12, 0(11)
>          cmpwi   0, 12, 0
> -        bne-    0f
> +        bne-    2f
>          sc
>  safe_syscall_end:
>          /* code path when we did execute the syscall */
> -        bnslr+
> -
> -        /* syscall failed; return negative errno */
> -        neg     3, 3
> +        bso-    1f
>          blr
>
>          /* code path when we didn't execute the syscall */
> -0:      addi    3, 0, -TARGET_ERESTARTSYS
> -        blr
> +2:      addi    3, 0, TARGET_ERESTARTSYS
> +
> +        /* code path setting errno */
> +1:      b       safe_syscall_set_errno_tail
> +        nop     /* per abi, for the linker to modify */
> +
>          .cfi_endproc
>
>  #if _CALL_ELF == 2
> diff --git a/linux-user/host/riscv/safe-syscall.inc.S
> b/linux-user/host/riscv/safe-syscall.inc.S
> index 95c4832de2..54c2e23f75 100644
> --- a/linux-user/host/riscv/safe-syscall.inc.S
> +++ b/linux-user/host/riscv/safe-syscall.inc.S
> @@ -23,15 +23,12 @@
>           * first argument an 'int *' to the signal_pending flag, the
>           * second one the system call number (as a 'long'), and all
> further
>           * arguments being syscall arguments (also 'long').
> -         * We return a long which is the syscall's return value, which
> -         * may be negative-errno on failure. Conversion to the
> -         * -1-and-errno-set convention is done by the calling wrapper.
>           */
>  safe_syscall_base:
>          .cfi_startproc
>          /*
>           * The syscall calling convention is nearly the same as C:
> -         * we enter with a0 == *signal_pending
> +         * we enter with a0 == &signal_pending
>           *               a1 == syscall number
>           *               a2 ... a7 == syscall arguments
>           *               and return the result in a0
> @@ -62,16 +59,21 @@ safe_syscall_base:
>  safe_syscall_start:
>          /* If signal_pending is non-zero, don't do the call */
>          lw      t1, 0(t0)
> -        bnez    t1, 0f
> +        bnez    t1, 2f
>          scall
>  safe_syscall_end:
>          /* code path for having successfully executed the syscall */
> +        li      t2, -4096
> +        bgtu    a0, t2, 0f
>          ret
>
> -0:
> +        /* code path setting errno */
> +0:      neg     a0, a0
> +        j       safe_syscall_set_errno_tail
> +
>          /* code path when we didn't execute the syscall */
> -        li      a0, -TARGET_ERESTARTSYS
> -        ret
> -        .cfi_endproc
> +2:      li      a0, TARGET_ERESTARTSYS
> +        j       safe_syscall_set_errno_tail
>
> +        .cfi_endproc
>          .size   safe_syscall_base, .-safe_syscall_base
> diff --git a/linux-user/host/s390x/safe-syscall.inc.S
> b/linux-user/host/s390x/safe-syscall.inc.S
> index d97d27458e..899dab39e9 100644
> --- a/linux-user/host/s390x/safe-syscall.inc.S
> +++ b/linux-user/host/s390x/safe-syscall.inc.S
> @@ -20,9 +20,6 @@
>           * first argument an 'int *' to the signal_pending flag, the
>           * second one the system call number (as a 'long'), and all
> further
>           * arguments being syscall arguments (also 'long').
> -         * We return a long which is the syscall's return value, which
> -         * may be negative-errno on failure. Conversion to the
> -         * -1-and-errno-set convention is done by the calling wrapper.
>           */
>  safe_syscall_base:
>          .cfi_startproc
> @@ -44,9 +41,9 @@ safe_syscall_base:
>          stg     %r1,0(%r15)             /* store back chain */
>          stg     %r0,8(%r15)             /* store eos */
>
> -        /* The syscall calling convention isn't the same as the
> -         * C one:
> -         * we enter with r2 == *signal_pending
> +        /*
> +         * The syscall calling convention isn't the same as the C one:
> +         * we enter with r2 == &signal_pending
>           *               r3 == syscall number
>           *               r4, r5, r6, (stack) == syscall arguments
>           *               and return the result in r2
> @@ -77,14 +74,25 @@ safe_syscall_start:
>          svc     0
>  safe_syscall_end:
>
> -1:      lg      %r15,0(%r15)            /* load back chain */
> +        /* code path for having successfully executed the syscall */
> +        lg      %r15,0(%r15)            /* load back chain */
>          .cfi_remember_state
>          .cfi_adjust_cfa_offset -160
>          lmg     %r6,%r15,48(%r15)       /* load saved registers */
> -        br      %r14
> -        .cfi_restore_state
> -2:      lghi    %r2, -TARGET_ERESTARTSYS
> -        j       1b
> -        .cfi_endproc
>
> +        lghi    %r0, -4095              /* check for syscall error */
> +        clgr    %r2, %r0
> +        blr     %r14                    /* return on success */
> +        lcr     %r2, %r2                /* create positive errno */
> +        jg      safe_syscall_set_errno_tail
> +        .cfi_restore_state
> +
> +        /* code path when we didn't execute the syscall */
> +2:      lg      %r15,0(%r15)            /* load back chain */
> +        .cfi_adjust_cfa_offset -160
> +        lmg     %r6,%r15,48(%r15)       /* load saved registers */
> +        lghi    %r2, TARGET_ERESTARTSYS
> +        jg      safe_syscall_set_errno_tail
> +
> +        .cfi_endproc
>          .size   safe_syscall_base, .-safe_syscall_base
> diff --git a/linux-user/host/x86_64/safe-syscall.inc.S
> b/linux-user/host/x86_64/safe-syscall.inc.S
> index 158225553e..39b64250c3 100644
> --- a/linux-user/host/x86_64/safe-syscall.inc.S
> +++ b/linux-user/host/x86_64/safe-syscall.inc.S
> @@ -19,9 +19,6 @@
>           * first argument an 'int *' to the signal_pending flag, the
>           * second one the system call number (as a 'long'), and all
> further
>           * arguments being syscall arguments (also 'long').
> -         * We return a long which is the syscall's return value, which
> -         * may be negative-errno on failure. Conversion to the
> -         * -1-and-errno-set convention is done by the calling wrapper.
>           */
>  safe_syscall_base:
>          .cfi_startproc
> @@ -35,9 +32,9 @@ safe_syscall_base:
>          .cfi_adjust_cfa_offset 8
>          .cfi_rel_offset rbp, 0
>
> -        /* The syscall calling convention isn't the same as the
> -         * C one:
> -         * we enter with rdi == *signal_pending
> +        /*
> +         * The syscall calling convention isn't the same as the C one:
> +         * we enter with rdi == &signal_pending
>           *               rsi == syscall number
>           *               rdx, rcx, r8, r9, (stack), (stack) == syscall
> arguments
>           *               and return the result in rax
> @@ -68,24 +65,30 @@ safe_syscall_base:
>  safe_syscall_start:
>          /* if signal_pending is non-zero, don't do the call */
>          cmpl    $0, (%rbp)
> -        jnz     1f
> +        jnz     2f
>          syscall
>  safe_syscall_end:
>          /* code path for having successfully executed the syscall */
> +        cmp     $-4095, %rax
> +        jae     0f
>          pop     %rbp
>          .cfi_remember_state
>          .cfi_def_cfa_offset 8
>          .cfi_restore rbp
>          ret
> -
> -1:
> -        /* code path when we didn't execute the syscall */
>          .cfi_restore_state
> -        mov     $-TARGET_ERESTARTSYS, %rax
> -        pop     %rbp
> +
> +0:      neg     %eax
> +        jmp     1f
> +
> +        /* code path when we didn't execute the syscall */
> +2:      mov     $TARGET_ERESTARTSYS, %eax
> +
> +        /* code path setting errno */
> +1:      pop     %rbp
>          .cfi_def_cfa_offset 8
>          .cfi_restore rbp
> -        ret
> +        jmp     safe_syscall_set_errno_tail
>          .cfi_endproc
>
>          .size   safe_syscall_base, .-safe_syscall_base
> diff --git a/linux-user/meson.build b/linux-user/meson.build
> index bf62c13e37..94ac3c58ce 100644
> --- a/linux-user/meson.build
> +++ b/linux-user/meson.build
> @@ -10,6 +10,7 @@ linux_user_ss.add(files(
>    'main.c',
>    'mmap.c',
>    'safe-syscall.S',
> +  'safe-syscall-error.c',
>    'signal.c',
>    'strace.c',
>    'syscall.c',
> --
> 2.25.1
>
>

--000000000000e21c0d05d19a6611
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Nov 23, 2021 at 10:38 AM Rich=
ard Henderson &lt;<a href=3D"mailto:richard.henderson@linaro.org">richard.h=
enderson@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex">The current api from safe_syscall_base() is to return -e=
rrno, which is<br>
the interface provided by *some* linux kernel abis.=C2=A0 The wrapper macro=
,<br>
safe_syscall(), detects error, stores into errno, and returns -1, to<br>
match the api of the system syscall().<br>
<br>
For those kernel abis that do not return -errno natively, this leads<br>
to double syscall error detection.=C2=A0 E.g. Linux ppc64, which sets the<b=
r>
SO flag for error.<br>
<br>
Simplify the usage from C by moving the error detection into assembly,<br>
and usage from assembly by providing a C helper with which to set errno.<br=
>
<br>
Signed-off-by: Richard Henderson &lt;<a href=3D"mailto:richard.henderson@li=
naro.org" target=3D"_blank">richard.henderson@linaro.org</a>&gt;<br>
---<br>
=C2=A0linux-user/safe-syscall.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 | 16 +++-------<br>
=C2=A0linux-user/safe-syscall-error.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 | 28 ++++++++++++++++<br>
=C2=A0linux-user/host/aarch64/safe-syscall.inc.S | 20 ++++++------<br>
=C2=A0linux-user/host/arm/safe-syscall.inc.S=C2=A0 =C2=A0 =C2=A0| 27 ++++++=
++++------<br>
=C2=A0linux-user/host/i386/safe-syscall.inc.S=C2=A0 =C2=A0 | 37 +++++++++++=
++++-------<br>
=C2=A0linux-user/host/ppc64/safe-syscall.inc.S=C2=A0 =C2=A0| 20 ++++++-----=
-<br>
=C2=A0linux-user/host/riscv/safe-syscall.inc.S=C2=A0 =C2=A0| 20 ++++++-----=
-<br>
=C2=A0linux-user/host/s390x/safe-syscall.inc.S=C2=A0 =C2=A0| 32 +++++++++++=
+-------<br>
=C2=A0linux-user/host/x86_64/safe-syscall.inc.S=C2=A0 | 29 +++++++++-------=
-<br>
=C2=A0linux-user/meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 1 +<br>
=C2=A010 files changed, 145 insertions(+), 85 deletions(-)<br>
=C2=A0create mode 100644 linux-user/safe-syscall-error.c<br></blockquote><d=
iv><br></div><div>Reviewed-by: Warner Losh &lt;<a href=3D"mailto:imp@bsdimp=
.com">imp@bsdimp.com</a>&gt;</div><div><br></div><div>Note: My s390 assembl=
er skills are quite weak, but it seems consistent with</div><div>the rest o=
f the code. I&#39;m less sure about the riscv and ppc64, but am quite</div>=
<div>confident in the arm, aarch64, x86 and meson change. Not sure how to o=
therwise</div><div>signal that when the review is uneven.</div><div>=C2=A0<=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex">
diff --git a/linux-user/safe-syscall.h b/linux-user/safe-syscall.h<br>
index aaa9ffc0e2..97837faddb 100644<br>
--- a/linux-user/safe-syscall.h<br>
+++ b/linux-user/safe-syscall.h<br>
@@ -127,21 +127,15 @@<br>
=C2=A0#ifdef HAVE_SAFE_SYSCALL<br>
=C2=A0/* The core part of this function is implemented in assembly */<br>
=C2=A0extern long safe_syscall_base(int *pending, long number, ...);<br>
+extern long safe_syscall_set_errno_tail(int value);<br>
+<br>
=C2=A0/* These are defined by the safe-syscall.inc.S file */<br>
=C2=A0extern char safe_syscall_start[];<br>
=C2=A0extern char safe_syscall_end[];<br>
<br>
-#define safe_syscall(...)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
-=C2=A0 =C2=A0 ({=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 long ret_;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 int *psp_ =3D &amp;((TaskState *)thread_cpu-&g=
t;opaque)-&gt;signal_pending; \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret_ =3D safe_syscall_base(psp_, __VA_ARGS__);=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (is_error(ret_)) {=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 errno =3D -ret_;=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \=
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret_ =3D -1;=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 }=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret_;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0\<br>
-=C2=A0 =C2=A0 })<br>
+#define safe_syscall(...)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
+=C2=A0 =C2=A0 safe_syscall_base(&amp;((TaskState *)thread_cpu-&gt;opaque)-=
&gt;signal_pending, \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 __VA_ARGS__)<br>
<br>
=C2=A0#else<br>
<br>
diff --git a/linux-user/safe-syscall-error.c b/linux-user/safe-syscall-erro=
r.c<br>
new file mode 100644<br>
index 0000000000..d7e2700f81<br>
--- /dev/null<br>
+++ b/linux-user/safe-syscall-error.c<br>
@@ -0,0 +1,28 @@<br>
+/*<br>
+ * safe-syscall-error.c: errno setting fragment<br>
+ * This is intended to be invoked by safe-syscall.S<br>
+ *<br>
+ * Written by Richard Henderson &lt;<a href=3D"mailto:rth@twiddle.net" tar=
get=3D"_blank">rth@twiddle.net</a>&gt;<br>
+ * Copyright (C) 2021 Red Hat, Inc.<br>
+ *<br>
+ * This work is licensed under the terms of the GNU GPL, version 2 or late=
r.<br>
+ * See the COPYING file in the top-level directory.<br>
+ */<br>
+<br>
+#include &quot;qemu/osdep.h&quot;<br>
+#include &quot;hostdep.h&quot;<br>
+#include &quot;safe-syscall.h&quot;<br>
+<br>
+#ifdef HAVE_SAFE_SYSCALL<br>
+/*<br>
+ * This is intended to be invoked via tail-call on the error path<br>
+ * from the assembly in host/arch/safe-syscall.inc.S.=C2=A0 This takes<br>
+ * care of the host specific addressing of errno.<br>
+ * Return -1 to finalize the return value for safe_syscall_base.<br>
+ */<br>
+long safe_syscall_set_errno_tail(int value)<br>
+{<br>
+=C2=A0 =C2=A0 errno =3D value;<br>
+=C2=A0 =C2=A0 return -1;<br>
+}<br>
+#endif<br>
diff --git a/linux-user/host/aarch64/safe-syscall.inc.S b/linux-user/host/a=
arch64/safe-syscall.inc.S<br>
index e2e726ef55..76a0a18a6c 100644<br>
--- a/linux-user/host/aarch64/safe-syscall.inc.S<br>
+++ b/linux-user/host/aarch64/safe-syscall.inc.S<br>
@@ -22,15 +22,12 @@<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * first argument an &#39;int *&#39; to t=
he signal_pending flag, the<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * second one the system call number (as =
a &#39;long&#39;), and all further<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * arguments being syscall arguments (als=
o &#39;long&#39;).<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* We return a long which is the syscall&=
#39;s return value, which<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* may be negative-errno on failure. Conv=
ersion to the<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* -1-and-errno-set convention is done by=
 the calling wrapper.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
=C2=A0safe_syscall_base:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.cfi_startproc<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* The syscall calling convention isn&#39=
;t the same as the<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * C one:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* we enter with x0 =3D=3D *signal_pendin=
g<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* we enter with x0 =3D=3D &amp;signal_pe=
nding<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0x1 =3D=3D syscall number<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0x2 ... x7, (stack) =3D=3D syscall arguments<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0and return the result in x0<br>
@@ -60,16 +57,21 @@ safe_syscall_base:<br>
=C2=A0safe_syscall_start:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* if signal_pending is non-zero, don&#39=
;t do the call */<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ldr=C2=A0 =C2=A0 =C2=A0w10, [x9]<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 cbnz=C2=A0 =C2=A0 w10, 0f<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 cbnz=C2=A0 =C2=A0 w10, 2f<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0svc=C2=A0 =C2=A0 =C2=A00x0<br>
=C2=A0safe_syscall_end:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* code path for having successfully exec=
uted the syscall */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 cmp=C2=A0 =C2=A0 =C2=A0x0, #-4096<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 b.hi=C2=A0 =C2=A0 0f<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret<br>
<br>
-0:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* code path setting errno */<br>
+0:=C2=A0 =C2=A0 =C2=A0 neg=C2=A0 =C2=A0 =C2=A0w0, w0<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 b=C2=A0 =C2=A0 =C2=A0 =C2=A0safe_syscall_set_e=
rrno_tail<br>
+<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* code path when we didn&#39;t execute t=
he syscall */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 mov=C2=A0 =C2=A0 =C2=A0x0, #-TARGET_ERESTARTSY=
S<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 .cfi_endproc<br>
+2:=C2=A0 =C2=A0 =C2=A0 mov=C2=A0 =C2=A0 =C2=A0w0, #TARGET_ERESTARTSYS<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 b=C2=A0 =C2=A0 =C2=A0 =C2=A0safe_syscall_set_e=
rrno_tail<br>
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .cfi_endproc<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.size=C2=A0 =C2=A0safe_syscall_base, .-sa=
fe_syscall_base<br>
diff --git a/linux-user/host/arm/safe-syscall.inc.S b/linux-user/host/arm/s=
afe-syscall.inc.S<br>
index 1f1ee8327b..618112c6bf 100644<br>
--- a/linux-user/host/arm/safe-syscall.inc.S<br>
+++ b/linux-user/host/arm/safe-syscall.inc.S<br>
@@ -27,9 +27,6 @@<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * first argument an &#39;int *&#39; to t=
he signal_pending flag, the<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * second one the system call number (as =
a &#39;long&#39;), and all further<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * arguments being syscall arguments (als=
o &#39;long&#39;).<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* We return a long which is the syscall&=
#39;s return value, which<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* may be negative-errno on failure. Conv=
ersion to the<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* -1-and-errno-set convention is done by=
 the calling wrapper.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
=C2=A0safe_syscall_base:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.fnstart<br>
@@ -46,7 +43,7 @@ safe_syscall_base:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.cfi_rel_offset lr, 20<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* The syscall calling convention isn&#39=
;t the same as the C one:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* we enter with r0 =3D=3D *signal_pendin=
g<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* we enter with r0 =3D=3D &amp;signal_pe=
nding<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0r1 =3D=3D syscall number<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0r2, r3, [sp+0] ... [sp+12] =3D=3D syscall arguments<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0and return the result in r0<br>
@@ -74,17 +71,29 @@ safe_syscall_start:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* if signal_pending is non-zero, don&#39=
;t do the call */<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ldr=C2=A0 =C2=A0 =C2=A0r12, [r8]=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* signal_pending */<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tst=C2=A0 =C2=A0 =C2=A0r12, r12<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 bne=C2=A0 =C2=A0 =C2=A01f<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 bne=C2=A0 =C2=A0 =C2=A02f<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0swi=C2=A0 =C2=A0 =C2=A00<br>
=C2=A0safe_syscall_end:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* code path for having successfully exec=
uted the syscall */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 cmp=C2=A0 =C2=A0 =C2=A0r0, #-4096<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 neghi=C2=A0 =C2=A0r0, r0<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 bhi=C2=A0 =C2=A0 =C2=A01f<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pop=C2=A0 =C2=A0 =C2=A0{ r4, r5, r6, r7, =
r8, pc }<br>
<br>
-1:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* code path when we didn&#39;t execute t=
he syscall */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 ldr=C2=A0 =C2=A0 =C2=A0r0, =3D-TARGET_ERESTART=
SYS<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 pop=C2=A0 =C2=A0 =C2=A0{ r4, r5, r6, r7, r8, p=
c }<br>
+2:=C2=A0 =C2=A0 =C2=A0 mov=C2=A0 =C2=A0 =C2=A0r0, #TARGET_ERESTARTSYS<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* code path setting errno */<br>
+1:=C2=A0 =C2=A0 =C2=A0 pop=C2=A0 =C2=A0 =C2=A0{ r4, r5, r6, r7, r8, lr }<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .cfi_adjust_cfa_offset -24<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .cfi_restore r4<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .cfi_restore r5<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .cfi_restore r6<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .cfi_restore r7<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .cfi_restore r8<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .cfi_restore lr<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 b=C2=A0 =C2=A0 =C2=A0 =C2=A0safe_syscall_set_e=
rrno_tail<br>
+<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.fnend<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.cfi_endproc<br>
-<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.size=C2=A0 =C2=A0safe_syscall_base, .-sa=
fe_syscall_base<br>
diff --git a/linux-user/host/i386/safe-syscall.inc.S b/linux-user/host/i386=
/safe-syscall.inc.S<br>
index e425aa54d8..f5883234bb 100644<br>
--- a/linux-user/host/i386/safe-syscall.inc.S<br>
+++ b/linux-user/host/i386/safe-syscall.inc.S<br>
@@ -20,9 +20,6 @@<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * first argument an &#39;int *&#39; to t=
he signal_pending flag, the<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * second one the system call number (as =
a &#39;long&#39;), and all further<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * arguments being syscall arguments (als=
o &#39;long&#39;).<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* We return a long which is the syscall&=
#39;s return value, which<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* may be negative-errno on failure. Conv=
ersion to the<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* -1-and-errno-set convention is done by=
 the calling wrapper.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
=C2=A0safe_syscall_base:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.cfi_startproc<br>
@@ -41,7 +38,7 @@ safe_syscall_base:<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* The syscall calling convention isn&#39=
;t the same as the C one:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * we enter with 0(%esp) =3D=3D return ad=
dress<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A04(%esp) =3D=3D *signal_pending<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A04(%esp) =3D=3D &amp;signal_pending<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A08(%esp) =3D=3D syscall number<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A012(%esp) ... 32(%esp) =3D=3D syscall arguments<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0and return the result in eax<br>
@@ -70,11 +67,13 @@ safe_syscall_start:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* if signal_pending is non-zero, don&#39=
;t do the call */<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mov=C2=A0 =C2=A0 =C2=A04+16(%esp), %eax=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* signal_pending */<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cmpl=C2=A0 =C2=A0 $0, (%eax)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 jnz=C2=A0 =C2=A0 =C2=A01f<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 jnz=C2=A0 =C2=A0 =C2=A02f<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mov=C2=A0 =C2=A0 =C2=A08+16(%esp), %eax=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* syscall number */<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int=C2=A0 =C2=A0 =C2=A0$0x80<br>
=C2=A0safe_syscall_end:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* code path for having successfully exec=
uted the syscall */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 cmp=C2=A0 =C2=A0 =C2=A0$-4095, %eax<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 jae=C2=A0 =C2=A0 =C2=A00f<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pop=C2=A0 =C2=A0 =C2=A0%ebx<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.cfi_remember_state<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.cfi_adjust_cfa_offset -4<br>
@@ -89,12 +88,28 @@ safe_syscall_end:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.cfi_adjust_cfa_offset -4<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.cfi_restore ebp<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret<br>
-<br>
-1:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* code path when we didn&#39;t execute the sy=
scall */<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.cfi_restore_state<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 mov=C2=A0 =C2=A0 =C2=A0$-TARGET_ERESTARTSYS, %=
eax<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 jmp=C2=A0 =C2=A0 =C2=A0safe_syscall_end<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 .cfi_endproc<br>
<br>
+0:=C2=A0 =C2=A0 =C2=A0 neg=C2=A0 =C2=A0 =C2=A0%eax<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 jmp=C2=A0 =C2=A0 =C2=A01f<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* code path when we didn&#39;t execute the sy=
scall */<br>
+2:=C2=A0 =C2=A0 =C2=A0 mov=C2=A0 =C2=A0 =C2=A0$TARGET_ERESTARTSYS, %eax<br=
>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* code path setting errno */<br>
+1:=C2=A0 =C2=A0 =C2=A0 pop=C2=A0 =C2=A0 =C2=A0%ebx<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .cfi_adjust_cfa_offset -4<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .cfi_restore ebx<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 pop=C2=A0 =C2=A0 =C2=A0%edi<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .cfi_adjust_cfa_offset -4<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .cfi_restore edi<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 pop=C2=A0 =C2=A0 =C2=A0%esi<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .cfi_adjust_cfa_offset -4<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .cfi_restore esi<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 pop=C2=A0 =C2=A0 =C2=A0%ebp<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .cfi_adjust_cfa_offset -4<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .cfi_restore ebp<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 jmp=C2=A0 =C2=A0 =C2=A0safe_syscall_set_errno_=
tail<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .cfi_endproc<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.size=C2=A0 =C2=A0safe_syscall_base, .-sa=
fe_syscall_base<br>
diff --git a/linux-user/host/ppc64/safe-syscall.inc.S b/linux-user/host/ppc=
64/safe-syscall.inc.S<br>
index 5f19cd193c..b370889480 100644<br>
--- a/linux-user/host/ppc64/safe-syscall.inc.S<br>
+++ b/linux-user/host/ppc64/safe-syscall.inc.S<br>
@@ -22,9 +22,6 @@<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * first argument an &#39;int *&#39; to t=
he signal_pending flag, the<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * second one the system call number (as =
a &#39;long&#39;), and all further<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * arguments being syscall arguments (als=
o &#39;long&#39;).<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* We return a long which is the syscall&=
#39;s return value, which<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* may be negative-errno on failure. Conv=
ersion to the<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* -1-and-errno-set convention is done by=
 the calling wrapper.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
=C2=A0#if _CALL_ELF =3D=3D 2<br>
=C2=A0safe_syscall_base:<br>
@@ -39,7 +36,7 @@ safe_syscall_base:<br>
=C2=A0.L.safe_syscall_base:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.cfi_startproc<br>
=C2=A0#endif<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* We enter with r3 =3D=3D *signal_pending<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* We enter with r3 =3D=3D &amp;signal_pending=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0r4 =3D=3D syscall number<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0r5 ... r10 =3D=3D syscall arguments<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0and return the result in r3<br>
@@ -69,19 +66,20 @@ safe_syscall_start:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* if signal_pending is non-zero, don&#39=
;t do the call */<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0lwz=C2=A0 =C2=A0 =C2=A012, 0(11)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cmpwi=C2=A0 =C2=A00, 12, 0<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 bne-=C2=A0 =C2=A0 0f<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 bne-=C2=A0 =C2=A0 2f<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sc<br>
=C2=A0safe_syscall_end:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* code path when we did execute the sysc=
all */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 bnslr+<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* syscall failed; return negative errno */<br=
>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 neg=C2=A0 =C2=A0 =C2=A03, 3<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 bso-=C2=A0 =C2=A0 1f<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0blr<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* code path when we didn&#39;t execute t=
he syscall */<br>
-0:=C2=A0 =C2=A0 =C2=A0 addi=C2=A0 =C2=A0 3, 0, -TARGET_ERESTARTSYS<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 blr<br>
+2:=C2=A0 =C2=A0 =C2=A0 addi=C2=A0 =C2=A0 3, 0, TARGET_ERESTARTSYS<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* code path setting errno */<br>
+1:=C2=A0 =C2=A0 =C2=A0 b=C2=A0 =C2=A0 =C2=A0 =C2=A0safe_syscall_set_errno_=
tail<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 nop=C2=A0 =C2=A0 =C2=A0/* per abi, for the lin=
ker to modify */<br>
+<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.cfi_endproc<br>
<br>
=C2=A0#if _CALL_ELF =3D=3D 2<br>
diff --git a/linux-user/host/riscv/safe-syscall.inc.S b/linux-user/host/ris=
cv/safe-syscall.inc.S<br>
index 95c4832de2..54c2e23f75 100644<br>
--- a/linux-user/host/riscv/safe-syscall.inc.S<br>
+++ b/linux-user/host/riscv/safe-syscall.inc.S<br>
@@ -23,15 +23,12 @@<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * first argument an &#39;int *&#39; to t=
he signal_pending flag, the<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * second one the system call number (as =
a &#39;long&#39;), and all further<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * arguments being syscall arguments (als=
o &#39;long&#39;).<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* We return a long which is the syscall&=
#39;s return value, which<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* may be negative-errno on failure. Conv=
ersion to the<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* -1-and-errno-set convention is done by=
 the calling wrapper.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
=C2=A0safe_syscall_base:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.cfi_startproc<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * The syscall calling convention is near=
ly the same as C:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* we enter with a0 =3D=3D *signal_pendin=
g<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* we enter with a0 =3D=3D &amp;signal_pe=
nding<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0a1 =3D=3D syscall number<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0a2 ... a7 =3D=3D syscall arguments<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0and return the result in a0<br>
@@ -62,16 +59,21 @@ safe_syscall_base:<br>
=C2=A0safe_syscall_start:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* If signal_pending is non-zero, don&#39=
;t do the call */<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0lw=C2=A0 =C2=A0 =C2=A0 t1, 0(t0)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 bnez=C2=A0 =C2=A0 t1, 0f<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 bnez=C2=A0 =C2=A0 t1, 2f<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0scall<br>
=C2=A0safe_syscall_end:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* code path for having successfully exec=
uted the syscall */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 li=C2=A0 =C2=A0 =C2=A0 t2, -4096<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 bgtu=C2=A0 =C2=A0 a0, t2, 0f<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret<br>
<br>
-0:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* code path setting errno */<br>
+0:=C2=A0 =C2=A0 =C2=A0 neg=C2=A0 =C2=A0 =C2=A0a0, a0<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 j=C2=A0 =C2=A0 =C2=A0 =C2=A0safe_syscall_set_e=
rrno_tail<br>
+<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* code path when we didn&#39;t execute t=
he syscall */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 li=C2=A0 =C2=A0 =C2=A0 a0, -TARGET_ERESTARTSYS=
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 .cfi_endproc<br>
+2:=C2=A0 =C2=A0 =C2=A0 li=C2=A0 =C2=A0 =C2=A0 a0, TARGET_ERESTARTSYS<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 j=C2=A0 =C2=A0 =C2=A0 =C2=A0safe_syscall_set_e=
rrno_tail<br>
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .cfi_endproc<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.size=C2=A0 =C2=A0safe_syscall_base, .-sa=
fe_syscall_base<br>
diff --git a/linux-user/host/s390x/safe-syscall.inc.S b/linux-user/host/s39=
0x/safe-syscall.inc.S<br>
index d97d27458e..899dab39e9 100644<br>
--- a/linux-user/host/s390x/safe-syscall.inc.S<br>
+++ b/linux-user/host/s390x/safe-syscall.inc.S<br>
@@ -20,9 +20,6 @@<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * first argument an &#39;int *&#39; to t=
he signal_pending flag, the<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * second one the system call number (as =
a &#39;long&#39;), and all further<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * arguments being syscall arguments (als=
o &#39;long&#39;).<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* We return a long which is the syscall&=
#39;s return value, which<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* may be negative-errno on failure. Conv=
ersion to the<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* -1-and-errno-set convention is done by=
 the calling wrapper.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
=C2=A0safe_syscall_base:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.cfi_startproc<br>
@@ -44,9 +41,9 @@ safe_syscall_base:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0stg=C2=A0 =C2=A0 =C2=A0%r1,0(%r15)=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* store back chain */<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0stg=C2=A0 =C2=A0 =C2=A0%r0,8(%r15)=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* store eos */<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* The syscall calling convention isn&#39;t th=
e same as the<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* C one:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* we enter with r2 =3D=3D *signal_pendin=
g<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 /*<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* The syscall calling convention isn&#39=
;t the same as the C one:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* we enter with r2 =3D=3D &amp;signal_pe=
nding<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0r3 =3D=3D syscall number<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0r4, r5, r6, (stack) =3D=3D syscall arguments<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0and return the result in r2<br>
@@ -77,14 +74,25 @@ safe_syscall_start:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0svc=C2=A0 =C2=A0 =C2=A00<br>
=C2=A0safe_syscall_end:<br>
<br>
-1:=C2=A0 =C2=A0 =C2=A0 lg=C2=A0 =C2=A0 =C2=A0 %r15,0(%r15)=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* load back chain */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* code path for having successfully executed =
the syscall */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 lg=C2=A0 =C2=A0 =C2=A0 %r15,0(%r15)=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* load back chain */<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.cfi_remember_state<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.cfi_adjust_cfa_offset -160<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0lmg=C2=A0 =C2=A0 =C2=A0%r6,%r15,48(%r15)=
=C2=A0 =C2=A0 =C2=A0 =C2=A0/* load saved registers */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 br=C2=A0 =C2=A0 =C2=A0 %r14<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 .cfi_restore_state<br>
-2:=C2=A0 =C2=A0 =C2=A0 lghi=C2=A0 =C2=A0 %r2, -TARGET_ERESTARTSYS<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 j=C2=A0 =C2=A0 =C2=A0 =C2=A01b<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 .cfi_endproc<br>
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 lghi=C2=A0 =C2=A0 %r0, -4095=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* check for syscall error */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 clgr=C2=A0 =C2=A0 %r2, %r0<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 blr=C2=A0 =C2=A0 =C2=A0%r14=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* return on success *=
/<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 lcr=C2=A0 =C2=A0 =C2=A0%r2, %r2=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* create positive errno */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 jg=C2=A0 =C2=A0 =C2=A0 safe_syscall_set_errno_=
tail<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .cfi_restore_state<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* code path when we didn&#39;t execute the sy=
scall */<br>
+2:=C2=A0 =C2=A0 =C2=A0 lg=C2=A0 =C2=A0 =C2=A0 %r15,0(%r15)=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* load back chain */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .cfi_adjust_cfa_offset -160<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 lmg=C2=A0 =C2=A0 =C2=A0%r6,%r15,48(%r15)=C2=A0=
 =C2=A0 =C2=A0 =C2=A0/* load saved registers */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 lghi=C2=A0 =C2=A0 %r2, TARGET_ERESTARTSYS<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 jg=C2=A0 =C2=A0 =C2=A0 safe_syscall_set_errno_=
tail<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .cfi_endproc<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.size=C2=A0 =C2=A0safe_syscall_base, .-sa=
fe_syscall_base<br>
diff --git a/linux-user/host/x86_64/safe-syscall.inc.S b/linux-user/host/x8=
6_64/safe-syscall.inc.S<br>
index 158225553e..39b64250c3 100644<br>
--- a/linux-user/host/x86_64/safe-syscall.inc.S<br>
+++ b/linux-user/host/x86_64/safe-syscall.inc.S<br>
@@ -19,9 +19,6 @@<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * first argument an &#39;int *&#39; to t=
he signal_pending flag, the<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * second one the system call number (as =
a &#39;long&#39;), and all further<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * arguments being syscall arguments (als=
o &#39;long&#39;).<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* We return a long which is the syscall&=
#39;s return value, which<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* may be negative-errno on failure. Conv=
ersion to the<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* -1-and-errno-set convention is done by=
 the calling wrapper.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
=C2=A0safe_syscall_base:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.cfi_startproc<br>
@@ -35,9 +32,9 @@ safe_syscall_base:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.cfi_adjust_cfa_offset 8<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.cfi_rel_offset rbp, 0<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* The syscall calling convention isn&#39;t th=
e same as the<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* C one:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* we enter with rdi =3D=3D *signal_pendi=
ng<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 /*<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* The syscall calling convention isn&#39=
;t the same as the C one:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* we enter with rdi =3D=3D &amp;signal_p=
ending<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0rsi =3D=3D syscall number<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0rdx, rcx, r8, r9, (stack), (stack) =3D=3D syscall argument=
s<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0and return the result in rax<br>
@@ -68,24 +65,30 @@ safe_syscall_base:<br>
=C2=A0safe_syscall_start:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* if signal_pending is non-zero, don&#39=
;t do the call */<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cmpl=C2=A0 =C2=A0 $0, (%rbp)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 jnz=C2=A0 =C2=A0 =C2=A01f<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 jnz=C2=A0 =C2=A0 =C2=A02f<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0syscall<br>
=C2=A0safe_syscall_end:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* code path for having successfully exec=
uted the syscall */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 cmp=C2=A0 =C2=A0 =C2=A0$-4095, %rax<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 jae=C2=A0 =C2=A0 =C2=A00f<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pop=C2=A0 =C2=A0 =C2=A0%rbp<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.cfi_remember_state<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.cfi_def_cfa_offset 8<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.cfi_restore rbp<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret<br>
-<br>
-1:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* code path when we didn&#39;t execute the sy=
scall */<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.cfi_restore_state<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 mov=C2=A0 =C2=A0 =C2=A0$-TARGET_ERESTARTSYS, %=
rax<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 pop=C2=A0 =C2=A0 =C2=A0%rbp<br>
+<br>
+0:=C2=A0 =C2=A0 =C2=A0 neg=C2=A0 =C2=A0 =C2=A0%eax<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 jmp=C2=A0 =C2=A0 =C2=A01f<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* code path when we didn&#39;t execute the sy=
scall */<br>
+2:=C2=A0 =C2=A0 =C2=A0 mov=C2=A0 =C2=A0 =C2=A0$TARGET_ERESTARTSYS, %eax<br=
>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* code path setting errno */<br>
+1:=C2=A0 =C2=A0 =C2=A0 pop=C2=A0 =C2=A0 =C2=A0%rbp<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.cfi_def_cfa_offset 8<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.cfi_restore rbp<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 jmp=C2=A0 =C2=A0 =C2=A0safe_syscall_set_errno_=
tail<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.cfi_endproc<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.size=C2=A0 =C2=A0safe_syscall_base, .-sa=
fe_syscall_base<br>
diff --git a/linux-user/meson.build b/linux-user/meson.build<br>
index bf62c13e37..94ac3c58ce 100644<br>
--- a/linux-user/meson.build<br>
+++ b/linux-user/meson.build<br>
@@ -10,6 +10,7 @@ linux_user_ss.add(files(<br>
=C2=A0 =C2=A0&#39;main.c&#39;,<br>
=C2=A0 =C2=A0&#39;mmap.c&#39;,<br>
=C2=A0 =C2=A0&#39;safe-syscall.S&#39;,<br>
+=C2=A0 &#39;safe-syscall-error.c&#39;,<br>
=C2=A0 =C2=A0&#39;signal.c&#39;,<br>
=C2=A0 =C2=A0&#39;strace.c&#39;,<br>
=C2=A0 =C2=A0&#39;syscall.c&#39;,<br>
-- <br>
2.25.1<br>
<br>
</blockquote></div></div>

--000000000000e21c0d05d19a6611--

