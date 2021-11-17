Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C4FF454A6D
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Nov 2021 17:00:02 +0100 (CET)
Received: from localhost ([::1]:60900 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mnNLt-0006ih-2v
	for lists+qemu-devel@lfdr.de; Wed, 17 Nov 2021 11:00:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48574)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mnNKi-00061M-7U
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 10:58:48 -0500
Received: from [2607:f8b0:4864:20::92f] (port=42934
 helo=mail-ua1-x92f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mnNKe-00028K-4a
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 10:58:47 -0500
Received: by mail-ua1-x92f.google.com with SMTP id t13so6923250uad.9
 for <qemu-devel@nongnu.org>; Wed, 17 Nov 2021 07:58:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bYn2LZtT6hY0QnG3DKB/UtAFlQQrZcHbAOq8Y43muqg=;
 b=LflgHoIFWtB/FiI8rLqvx7rulgTB5cJSJoBUaaIhrUmHgquUteNapqwEv1C/xT9Q4B
 z4Ng3o1bochAobfSkxV71CCilhhjL3764oUKMdVVtCOFpRVWFXcRg8jhpZFi/I4MUFnf
 vFZCjC9EGMZ73149kWjEoY/ZZbnppJfqBdLeQ7BcqabvJZtLhyi2d6SBXIUFfMQl9wVj
 XGSjeNWjdUK+a3C5QPNSotkCY5Z4MIg572/wU03hYhia+P0EE0+OINSbmWrUEq1oT6/J
 opwPxpew0NfU9kvvS8NS0X0oETjvg9LUCt9Etx0qhc9CcJQo/uAZolhYOrE7+JHukwhm
 zdww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bYn2LZtT6hY0QnG3DKB/UtAFlQQrZcHbAOq8Y43muqg=;
 b=sgN3k5ZYO8Bo9Mb40K+PodKnq5F8xYgHvDAvzgNbEAJHfjpdc1ngozi0J2DS5WqZiL
 8gOcYTx2mNuqwauRXXDRw0h9OcLbNL4lQxRIU16/ZoE+EQ18z61CBOFWsnChvFcFbYc3
 IbNqXcLSB4/JwB7VVZbD5x/Z490itPJBJXK+7l7QTGxzDv3dMS9udp9LPZgQDrb+fmwP
 7wQ0qfkZPztoIGasgsiQ+Buh5WzhdH1KPAmFj4Qv6CSGV81g22CATC07B2L7B4OqiPnj
 Nz1VaLmXRroB8/p1a0B16mAHItBw5UyoDeB/XVdpivZ3vp6/ap3AMrO92ppTMeUIKTj2
 00LA==
X-Gm-Message-State: AOAM531oJl/52W5a243TY+lt2HJzMb06X9D9TZAAYoehbigrq7Wuo7gY
 Zk5FriQ5RTZK1WRFmNZY0LRuwKSgObeBnoAI8GTuO6Xiqn4=
X-Google-Smtp-Source: ABdhPJzIxNVhcYnfRNIImBeOX72/wuM/+TuhiaBsYpefARxC9VFuZDZW2xmPFKkAf+a5ODCtOb07Wvhmpdv35lYb5qM=
X-Received: by 2002:ab0:6f47:: with SMTP id r7mr25197225uat.85.1637164722102; 
 Wed, 17 Nov 2021 07:58:42 -0800 (PST)
MIME-Version: 1.0
References: <20211116110256.365484-1-richard.henderson@linaro.org>
 <20211116110256.365484-8-richard.henderson@linaro.org>
In-Reply-To: <20211116110256.365484-8-richard.henderson@linaro.org>
From: Warner Losh <imp@bsdimp.com>
Date: Wed, 17 Nov 2021 08:58:31 -0700
Message-ID: <CANCZdfr4gh100haSf0+fcQrc2ZfZf0xVa-qgzxjYj1dvUNfspg@mail.gmail.com>
Subject: Re: [PATCH v4 7/9] linux-user: Remove HAVE_SAFE_SYSCALL and hostdep.h
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: multipart/alternative; boundary="000000000000b33d8105d0fe1dbe"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::92f
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::92f;
 envelope-from=wlosh@bsdimp.com; helo=mail-ua1-x92f.google.com
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

--000000000000b33d8105d0fe1dbe
Content-Type: text/plain; charset="UTF-8"

On Tue, Nov 16, 2021 at 4:03 AM Richard Henderson <
richard.henderson@linaro.org> wrote:

> All supported hosts now define HAVE_SAFE_SYSCALL, so remove
> the ifdefs.  This leaves hostdep.h empty, so remove it.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  common-user/host/aarch64/hostdep.h | 18 ------------------
>  common-user/host/arm/hostdep.h     | 18 ------------------
>  common-user/host/i386/hostdep.h    | 18 ------------------
>  common-user/host/mips/hostdep.h    |  2 --
>  common-user/host/ppc64/hostdep.h   | 18 ------------------
>  common-user/host/riscv/hostdep.h   | 14 --------------
>  common-user/host/s390x/hostdep.h   | 18 ------------------
>  common-user/host/sparc64/hostdep.h |  2 --
>  common-user/host/x86_64/hostdep.h  | 18 ------------------
>  linux-user/host/ia64/hostdep.h     | 15 ---------------
>  linux-user/host/mips/hostdep.h     | 15 ---------------
>  linux-user/host/ppc/hostdep.h      | 15 ---------------
>  linux-user/host/s390/hostdep.h     | 15 ---------------
>  linux-user/host/sparc/hostdep.h    | 15 ---------------
>  linux-user/host/sparc64/hostdep.h  | 15 ---------------
>  linux-user/host/x32/hostdep.h      | 15 ---------------
>  linux-user/safe-syscall.h          | 12 ------------
>  linux-user/user-internals.h        |  1 -
>  linux-user/signal.c                |  2 --
>  linux-user/safe-syscall.S          |  3 ---
>  20 files changed, 249 deletions(-)
>  delete mode 100644 common-user/host/aarch64/hostdep.h
>  delete mode 100644 common-user/host/arm/hostdep.h
>  delete mode 100644 common-user/host/i386/hostdep.h
>  delete mode 100644 common-user/host/mips/hostdep.h
>  delete mode 100644 common-user/host/ppc64/hostdep.h
>  delete mode 100644 common-user/host/riscv/hostdep.h
>  delete mode 100644 common-user/host/s390x/hostdep.h
>  delete mode 100644 common-user/host/sparc64/hostdep.h
>  delete mode 100644 common-user/host/x86_64/hostdep.h
>  delete mode 100644 linux-user/host/ia64/hostdep.h
>  delete mode 100644 linux-user/host/mips/hostdep.h
>  delete mode 100644 linux-user/host/ppc/hostdep.h
>  delete mode 100644 linux-user/host/s390/hostdep.h
>  delete mode 100644 linux-user/host/sparc/hostdep.h
>  delete mode 100644 linux-user/host/sparc64/hostdep.h
>  delete mode 100644 linux-user/host/x32/hostdep.h
>

Reviewed-by: Warner Losh <imp@bsdimp.com>



> diff --git a/common-user/host/aarch64/hostdep.h
> b/common-user/host/aarch64/hostdep.h
> deleted file mode 100644
> index 39299d798a..0000000000
> --- a/common-user/host/aarch64/hostdep.h
> +++ /dev/null
> @@ -1,18 +0,0 @@
> -/*
> - * hostdep.h : things which are dependent on the host architecture
> - *
> - *  * Written by Peter Maydell <peter.maydell@linaro.org>
> - *
> - * Copyright (C) 2016 Linaro Limited
> - *
> - * This work is licensed under the terms of the GNU GPL, version 2 or
> later.
> - * See the COPYING file in the top-level directory.
> - */
> -
> -#ifndef AARCH64_HOSTDEP_H
> -#define AARCH64_HOSTDEP_H
> -
> -/* We have a safe-syscall.inc.S */
> -#define HAVE_SAFE_SYSCALL
> -
> -#endif
> diff --git a/common-user/host/arm/hostdep.h
> b/common-user/host/arm/hostdep.h
> deleted file mode 100644
> index 86b137875a..0000000000
> --- a/common-user/host/arm/hostdep.h
> +++ /dev/null
> @@ -1,18 +0,0 @@
> -/*
> - * hostdep.h : things which are dependent on the host architecture
> - *
> - *  * Written by Peter Maydell <peter.maydell@linaro.org>
> - *
> - * Copyright (C) 2016 Linaro Limited
> - *
> - * This work is licensed under the terms of the GNU GPL, version 2 or
> later.
> - * See the COPYING file in the top-level directory.
> - */
> -
> -#ifndef ARM_HOSTDEP_H
> -#define ARM_HOSTDEP_H
> -
> -/* We have a safe-syscall.inc.S */
> -#define HAVE_SAFE_SYSCALL
> -
> -#endif
> diff --git a/common-user/host/i386/hostdep.h
> b/common-user/host/i386/hostdep.h
> deleted file mode 100644
> index ce7136501f..0000000000
> --- a/common-user/host/i386/hostdep.h
> +++ /dev/null
> @@ -1,18 +0,0 @@
> -/*
> - * hostdep.h : things which are dependent on the host architecture
> - *
> - *  * Written by Peter Maydell <peter.maydell@linaro.org>
> - *
> - * Copyright (C) 2016 Linaro Limited
> - *
> - * This work is licensed under the terms of the GNU GPL, version 2 or
> later.
> - * See the COPYING file in the top-level directory.
> - */
> -
> -#ifndef I386_HOSTDEP_H
> -#define I386_HOSTDEP_H
> -
> -/* We have a safe-syscall.inc.S */
> -#define HAVE_SAFE_SYSCALL
> -
> -#endif
> diff --git a/common-user/host/mips/hostdep.h
> b/common-user/host/mips/hostdep.h
> deleted file mode 100644
> index b18aca1deb..0000000000
> --- a/common-user/host/mips/hostdep.h
> +++ /dev/null
> @@ -1,2 +0,0 @@
> -/* We have a safe-syscall.inc.S */
> -#define HAVE_SAFE_SYSCALL
> diff --git a/common-user/host/ppc64/hostdep.h
> b/common-user/host/ppc64/hostdep.h
> deleted file mode 100644
> index 0c290dd904..0000000000
> --- a/common-user/host/ppc64/hostdep.h
> +++ /dev/null
> @@ -1,18 +0,0 @@
> -/*
> - * hostdep.h : things which are dependent on the host architecture
> - *
> - *  * Written by Peter Maydell <peter.maydell@linaro.org>
> - *
> - * Copyright (C) 2016 Linaro Limited
> - *
> - * This work is licensed under the terms of the GNU GPL, version 2 or
> later.
> - * See the COPYING file in the top-level directory.
> - */
> -
> -#ifndef PPC64_HOSTDEP_H
> -#define PPC64_HOSTDEP_H
> -
> -/* We have a safe-syscall.inc.S */
> -#define HAVE_SAFE_SYSCALL
> -
> -#endif
> diff --git a/common-user/host/riscv/hostdep.h
> b/common-user/host/riscv/hostdep.h
> deleted file mode 100644
> index 7f67c22868..0000000000
> --- a/common-user/host/riscv/hostdep.h
> +++ /dev/null
> @@ -1,14 +0,0 @@
> -/*
> - * hostdep.h : things which are dependent on the host architecture
> - *
> - * This work is licensed under the terms of the GNU GPL, version 2 or
> later.
> - * See the COPYING file in the top-level directory.
> - */
> -
> -#ifndef RISCV_HOSTDEP_H
> -#define RISCV_HOSTDEP_H
> -
> -/* We have a safe-syscall.inc.S */
> -#define HAVE_SAFE_SYSCALL
> -
> -#endif
> diff --git a/common-user/host/s390x/hostdep.h
> b/common-user/host/s390x/hostdep.h
> deleted file mode 100644
> index d801145854..0000000000
> --- a/common-user/host/s390x/hostdep.h
> +++ /dev/null
> @@ -1,18 +0,0 @@
> -/*
> - * hostdep.h : things which are dependent on the host architecture
> - *
> - *  * Written by Peter Maydell <peter.maydell@linaro.org>
> - *
> - * Copyright (C) 2016 Linaro Limited
> - *
> - * This work is licensed under the terms of the GNU GPL, version 2 or
> later.
> - * See the COPYING file in the top-level directory.
> - */
> -
> -#ifndef S390X_HOSTDEP_H
> -#define S390X_HOSTDEP_H
> -
> -/* We have a safe-syscall.inc.S */
> -#define HAVE_SAFE_SYSCALL
> -
> -#endif
> diff --git a/common-user/host/sparc64/hostdep.h
> b/common-user/host/sparc64/hostdep.h
> deleted file mode 100644
> index b18aca1deb..0000000000
> --- a/common-user/host/sparc64/hostdep.h
> +++ /dev/null
> @@ -1,2 +0,0 @@
> -/* We have a safe-syscall.inc.S */
> -#define HAVE_SAFE_SYSCALL
> diff --git a/common-user/host/x86_64/hostdep.h
> b/common-user/host/x86_64/hostdep.h
> deleted file mode 100644
> index 9c62bd26bd..0000000000
> --- a/common-user/host/x86_64/hostdep.h
> +++ /dev/null
> @@ -1,18 +0,0 @@
> -/*
> - * hostdep.h : things which are dependent on the host architecture
> - *
> - *  * Written by Peter Maydell <peter.maydell@linaro.org>
> - *
> - * Copyright (C) 2016 Linaro Limited
> - *
> - * This work is licensed under the terms of the GNU GPL, version 2 or
> later.
> - * See the COPYING file in the top-level directory.
> - */
> -
> -#ifndef X86_64_HOSTDEP_H
> -#define X86_64_HOSTDEP_H
> -
> -/* We have a safe-syscall.inc.S */
> -#define HAVE_SAFE_SYSCALL
> -
> -#endif
> diff --git a/linux-user/host/ia64/hostdep.h
> b/linux-user/host/ia64/hostdep.h
> deleted file mode 100644
> index 263bf7658e..0000000000
> --- a/linux-user/host/ia64/hostdep.h
> +++ /dev/null
> @@ -1,15 +0,0 @@
> -/*
> - * hostdep.h : things which are dependent on the host architecture
> - *
> - *  * Written by Peter Maydell <peter.maydell@linaro.org>
> - *
> - * Copyright (C) 2016 Linaro Limited
> - *
> - * This work is licensed under the terms of the GNU GPL, version 2 or
> later.
> - * See the COPYING file in the top-level directory.
> - */
> -
> -#ifndef IA64_HOSTDEP_H
> -#define IA64_HOSTDEP_H
> -
> -#endif
> diff --git a/linux-user/host/mips/hostdep.h
> b/linux-user/host/mips/hostdep.h
> deleted file mode 100644
> index ba111d75c3..0000000000
> --- a/linux-user/host/mips/hostdep.h
> +++ /dev/null
> @@ -1,15 +0,0 @@
> -/*
> - * hostdep.h : things which are dependent on the host architecture
> - *
> - *  * Written by Peter Maydell <peter.maydell@linaro.org>
> - *
> - * Copyright (C) 2016 Linaro Limited
> - *
> - * This work is licensed under the terms of the GNU GPL, version 2 or
> later.
> - * See the COPYING file in the top-level directory.
> - */
> -
> -#ifndef MIPS_HOSTDEP_H
> -#define MIPS_HOSTDEP_H
> -
> -#endif
> diff --git a/linux-user/host/ppc/hostdep.h b/linux-user/host/ppc/hostdep.h
> deleted file mode 100644
> index 23d8bd9d47..0000000000
> --- a/linux-user/host/ppc/hostdep.h
> +++ /dev/null
> @@ -1,15 +0,0 @@
> -/*
> - * hostdep.h : things which are dependent on the host architecture
> - *
> - *  * Written by Peter Maydell <peter.maydell@linaro.org>
> - *
> - * Copyright (C) 2016 Linaro Limited
> - *
> - * This work is licensed under the terms of the GNU GPL, version 2 or
> later.
> - * See the COPYING file in the top-level directory.
> - */
> -
> -#ifndef PPC_HOSTDEP_H
> -#define PPC_HOSTDEP_H
> -
> -#endif
> diff --git a/linux-user/host/s390/hostdep.h
> b/linux-user/host/s390/hostdep.h
> deleted file mode 100644
> index afcba5a16a..0000000000
> --- a/linux-user/host/s390/hostdep.h
> +++ /dev/null
> @@ -1,15 +0,0 @@
> -/*
> - * hostdep.h : things which are dependent on the host architecture
> - *
> - *  * Written by Peter Maydell <peter.maydell@linaro.org>
> - *
> - * Copyright (C) 2016 Linaro Limited
> - *
> - * This work is licensed under the terms of the GNU GPL, version 2 or
> later.
> - * See the COPYING file in the top-level directory.
> - */
> -
> -#ifndef S390_HOSTDEP_H
> -#define S390_HOSTDEP_H
> -
> -#endif
> diff --git a/linux-user/host/sparc/hostdep.h
> b/linux-user/host/sparc/hostdep.h
> deleted file mode 100644
> index 391ad923cf..0000000000
> --- a/linux-user/host/sparc/hostdep.h
> +++ /dev/null
> @@ -1,15 +0,0 @@
> -/*
> - * hostdep.h : things which are dependent on the host architecture
> - *
> - *  * Written by Peter Maydell <peter.maydell@linaro.org>
> - *
> - * Copyright (C) 2016 Linaro Limited
> - *
> - * This work is licensed under the terms of the GNU GPL, version 2 or
> later.
> - * See the COPYING file in the top-level directory.
> - */
> -
> -#ifndef SPARC_HOSTDEP_H
> -#define SPARC_HOSTDEP_H
> -
> -#endif
> diff --git a/linux-user/host/sparc64/hostdep.h
> b/linux-user/host/sparc64/hostdep.h
> deleted file mode 100644
> index ce3968fca0..0000000000
> --- a/linux-user/host/sparc64/hostdep.h
> +++ /dev/null
> @@ -1,15 +0,0 @@
> -/*
> - * hostdep.h : things which are dependent on the host architecture
> - *
> - *  * Written by Peter Maydell <peter.maydell@linaro.org>
> - *
> - * Copyright (C) 2016 Linaro Limited
> - *
> - * This work is licensed under the terms of the GNU GPL, version 2 or
> later.
> - * See the COPYING file in the top-level directory.
> - */
> -
> -#ifndef SPARC64_HOSTDEP_H
> -#define SPARC64_HOSTDEP_H
> -
> -#endif
> diff --git a/linux-user/host/x32/hostdep.h b/linux-user/host/x32/hostdep.h
> deleted file mode 100644
> index 2c2d6d37da..0000000000
> --- a/linux-user/host/x32/hostdep.h
> +++ /dev/null
> @@ -1,15 +0,0 @@
> -/*
> - * hostdep.h : things which are dependent on the host architecture
> - *
> - *  * Written by Peter Maydell <peter.maydell@linaro.org>
> - *
> - * Copyright (C) 2016 Linaro Limited
> - *
> - * This work is licensed under the terms of the GNU GPL, version 2 or
> later.
> - * See the COPYING file in the top-level directory.
> - */
> -
> -#ifndef X32_HOSTDEP_H
> -#define X32_HOSTDEP_H
> -
> -#endif
> diff --git a/linux-user/safe-syscall.h b/linux-user/safe-syscall.h
> index ea0e8a8d24..0deb87e51a 100644
> --- a/linux-user/safe-syscall.h
> +++ b/linux-user/safe-syscall.h
> @@ -124,7 +124,6 @@
>   * need to check SA_RESTART flags in QEMU or distinguish the various
>   * kinds of restartability.
>   */
> -#ifdef HAVE_SAFE_SYSCALL
>
>  /* The core part of this function is implemented in assembly. */
>  extern long safe_syscall_base(int *pending, int *errnop, long number,
> ...);
> @@ -137,15 +136,4 @@ extern char safe_syscall_end[];
>      safe_syscall_base(&((TaskState *)thread_cpu->opaque)->signal_pending,
> \
>                        &errno, __VA_ARGS__)
>
> -#else
> -
> -/*
> - * Fallback for architectures which don't yet provide a safe-syscall
> assembly
> - * fragment; note that this is racy!
> - * This should go away when all host architectures have been updated.
> - */
> -#define safe_syscall syscall
> -
> -#endif
> -
>  #endif
> diff --git a/linux-user/user-internals.h b/linux-user/user-internals.h
> index 661612a088..f71f372829 100644
> --- a/linux-user/user-internals.h
> +++ b/linux-user/user-internals.h
> @@ -18,7 +18,6 @@
>  #ifndef LINUX_USER_USER_INTERNALS_H
>  #define LINUX_USER_USER_INTERNALS_H
>
> -#include "hostdep.h"
>  #include "exec/user/thunk.h"
>  #include "exec/exec-all.h"
>  #include "qemu/log.h"
> diff --git a/linux-user/signal.c b/linux-user/signal.c
> index 6d5e5b698c..ca8f24b9ec 100644
> --- a/linux-user/signal.c
> +++ b/linux-user/signal.c
> @@ -798,7 +798,6 @@ int queue_signal(CPUArchState *env, int sig, int
> si_type,
>  /* Adjust the signal context to rewind out of safe-syscall if we're in it
> */
>  static inline void rewind_if_in_safe_syscall(void *puc)
>  {
> -#ifdef HAVE_SAFE_SYSCALL
>      ucontext_t *uc = (ucontext_t *)puc;
>      uintptr_t pcreg = host_signal_pc(uc);
>
> @@ -806,7 +805,6 @@ static inline void rewind_if_in_safe_syscall(void *puc)
>          && pcreg < (uintptr_t)safe_syscall_end) {
>          host_signal_set_pc(uc, (uintptr_t)safe_syscall_start);
>      }
> -#endif
>  }
>
>  static void host_signal_handler(int host_sig, siginfo_t *info, void *puc)
> diff --git a/linux-user/safe-syscall.S b/linux-user/safe-syscall.S
> index 42ea7c40ba..7ddc997801 100644
> --- a/linux-user/safe-syscall.S
> +++ b/linux-user/safe-syscall.S
> @@ -10,15 +10,12 @@
>   * See the COPYING file in the top-level directory.
>   */
>
> -#include "hostdep.h"
>  #include "target_errno_defs.h"
>
>  /* We have the correct host directory on our include path
>   * so that this will pull in the right fragment for the architecture.
>   */
> -#ifdef HAVE_SAFE_SYSCALL
>  #include "safe-syscall.inc.S"
> -#endif
>
>  /* We must specifically say that we're happy for the stack to not be
>   * executable, otherwise the toolchain will default to assuming our
> --
> 2.25.1
>
>

--000000000000b33d8105d0fe1dbe
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Nov 16, 2021 at 4:03 AM Richa=
rd Henderson &lt;<a href=3D"mailto:richard.henderson@linaro.org">richard.he=
nderson@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">All supported hosts now define HAVE_SAFE_SYSCALL, so remo=
ve<br>
the ifdefs.=C2=A0 This leaves hostdep.h empty, so remove it.<br>
<br>
Signed-off-by: Richard Henderson &lt;<a href=3D"mailto:richard.henderson@li=
naro.org" target=3D"_blank">richard.henderson@linaro.org</a>&gt;<br>
---<br>
=C2=A0common-user/host/aarch64/hostdep.h | 18 ------------------<br>
=C2=A0common-user/host/arm/hostdep.h=C2=A0 =C2=A0 =C2=A0| 18 --------------=
----<br>
=C2=A0common-user/host/i386/hostdep.h=C2=A0 =C2=A0 | 18 ------------------<=
br>
=C2=A0common-user/host/mips/hostdep.h=C2=A0 =C2=A0 |=C2=A0 2 --<br>
=C2=A0common-user/host/ppc64/hostdep.h=C2=A0 =C2=A0| 18 ------------------<=
br>
=C2=A0common-user/host/riscv/hostdep.h=C2=A0 =C2=A0| 14 --------------<br>
=C2=A0common-user/host/s390x/hostdep.h=C2=A0 =C2=A0| 18 ------------------<=
br>
=C2=A0common-user/host/sparc64/hostdep.h |=C2=A0 2 --<br>
=C2=A0common-user/host/x86_64/hostdep.h=C2=A0 | 18 ------------------<br>
=C2=A0linux-user/host/ia64/hostdep.h=C2=A0 =C2=A0 =C2=A0| 15 --------------=
-<br>
=C2=A0linux-user/host/mips/hostdep.h=C2=A0 =C2=A0 =C2=A0| 15 --------------=
-<br>
=C2=A0linux-user/host/ppc/hostdep.h=C2=A0 =C2=A0 =C2=A0 | 15 --------------=
-<br>
=C2=A0linux-user/host/s390/hostdep.h=C2=A0 =C2=A0 =C2=A0| 15 --------------=
-<br>
=C2=A0linux-user/host/sparc/hostdep.h=C2=A0 =C2=A0 | 15 ---------------<br>
=C2=A0linux-user/host/sparc64/hostdep.h=C2=A0 | 15 ---------------<br>
=C2=A0linux-user/host/x32/hostdep.h=C2=A0 =C2=A0 =C2=A0 | 15 --------------=
-<br>
=C2=A0linux-user/safe-syscall.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 12 ----=
--------<br>
=C2=A0linux-user/user-internals.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 1 -<br=
>
=C2=A0linux-user/signal.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 2 --<br>
=C2=A0linux-user/safe-syscall.S=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 3=
 ---<br>
=C2=A020 files changed, 249 deletions(-)<br>
=C2=A0delete mode 100644 common-user/host/aarch64/hostdep.h<br>
=C2=A0delete mode 100644 common-user/host/arm/hostdep.h<br>
=C2=A0delete mode 100644 common-user/host/i386/hostdep.h<br>
=C2=A0delete mode 100644 common-user/host/mips/hostdep.h<br>
=C2=A0delete mode 100644 common-user/host/ppc64/hostdep.h<br>
=C2=A0delete mode 100644 common-user/host/riscv/hostdep.h<br>
=C2=A0delete mode 100644 common-user/host/s390x/hostdep.h<br>
=C2=A0delete mode 100644 common-user/host/sparc64/hostdep.h<br>
=C2=A0delete mode 100644 common-user/host/x86_64/hostdep.h<br>
=C2=A0delete mode 100644 linux-user/host/ia64/hostdep.h<br>
=C2=A0delete mode 100644 linux-user/host/mips/hostdep.h<br>
=C2=A0delete mode 100644 linux-user/host/ppc/hostdep.h<br>
=C2=A0delete mode 100644 linux-user/host/s390/hostdep.h<br>
=C2=A0delete mode 100644 linux-user/host/sparc/hostdep.h<br>
=C2=A0delete mode 100644 linux-user/host/sparc64/hostdep.h<br>
=C2=A0delete mode 100644 linux-user/host/x32/hostdep.h<br></blockquote><div=
><br></div><div>Reviewed-by: Warner Losh &lt;<a href=3D"mailto:imp@bsdimp.c=
om">imp@bsdimp.com</a>&gt;</div><div><br></div><div>=C2=A0</div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px so=
lid rgb(204,204,204);padding-left:1ex">
diff --git a/common-user/host/aarch64/hostdep.h b/common-user/host/aarch64/=
hostdep.h<br>
deleted file mode 100644<br>
index 39299d798a..0000000000<br>
--- a/common-user/host/aarch64/hostdep.h<br>
+++ /dev/null<br>
@@ -1,18 +0,0 @@<br>
-/*<br>
- * hostdep.h : things which are dependent on the host architecture<br>
- *<br>
- *=C2=A0 * Written by Peter Maydell &lt;<a href=3D"mailto:peter.maydell@li=
naro.org" target=3D"_blank">peter.maydell@linaro.org</a>&gt;<br>
- *<br>
- * Copyright (C) 2016 Linaro Limited<br>
- *<br>
- * This work is licensed under the terms of the GNU GPL, version 2 or late=
r.<br>
- * See the COPYING file in the top-level directory.<br>
- */<br>
-<br>
-#ifndef AARCH64_HOSTDEP_H<br>
-#define AARCH64_HOSTDEP_H<br>
-<br>
-/* We have a safe-syscall.inc.S */<br>
-#define HAVE_SAFE_SYSCALL<br>
-<br>
-#endif<br>
diff --git a/common-user/host/arm/hostdep.h b/common-user/host/arm/hostdep.=
h<br>
deleted file mode 100644<br>
index 86b137875a..0000000000<br>
--- a/common-user/host/arm/hostdep.h<br>
+++ /dev/null<br>
@@ -1,18 +0,0 @@<br>
-/*<br>
- * hostdep.h : things which are dependent on the host architecture<br>
- *<br>
- *=C2=A0 * Written by Peter Maydell &lt;<a href=3D"mailto:peter.maydell@li=
naro.org" target=3D"_blank">peter.maydell@linaro.org</a>&gt;<br>
- *<br>
- * Copyright (C) 2016 Linaro Limited<br>
- *<br>
- * This work is licensed under the terms of the GNU GPL, version 2 or late=
r.<br>
- * See the COPYING file in the top-level directory.<br>
- */<br>
-<br>
-#ifndef ARM_HOSTDEP_H<br>
-#define ARM_HOSTDEP_H<br>
-<br>
-/* We have a safe-syscall.inc.S */<br>
-#define HAVE_SAFE_SYSCALL<br>
-<br>
-#endif<br>
diff --git a/common-user/host/i386/hostdep.h b/common-user/host/i386/hostde=
p.h<br>
deleted file mode 100644<br>
index ce7136501f..0000000000<br>
--- a/common-user/host/i386/hostdep.h<br>
+++ /dev/null<br>
@@ -1,18 +0,0 @@<br>
-/*<br>
- * hostdep.h : things which are dependent on the host architecture<br>
- *<br>
- *=C2=A0 * Written by Peter Maydell &lt;<a href=3D"mailto:peter.maydell@li=
naro.org" target=3D"_blank">peter.maydell@linaro.org</a>&gt;<br>
- *<br>
- * Copyright (C) 2016 Linaro Limited<br>
- *<br>
- * This work is licensed under the terms of the GNU GPL, version 2 or late=
r.<br>
- * See the COPYING file in the top-level directory.<br>
- */<br>
-<br>
-#ifndef I386_HOSTDEP_H<br>
-#define I386_HOSTDEP_H<br>
-<br>
-/* We have a safe-syscall.inc.S */<br>
-#define HAVE_SAFE_SYSCALL<br>
-<br>
-#endif<br>
diff --git a/common-user/host/mips/hostdep.h b/common-user/host/mips/hostde=
p.h<br>
deleted file mode 100644<br>
index b18aca1deb..0000000000<br>
--- a/common-user/host/mips/hostdep.h<br>
+++ /dev/null<br>
@@ -1,2 +0,0 @@<br>
-/* We have a safe-syscall.inc.S */<br>
-#define HAVE_SAFE_SYSCALL<br>
diff --git a/common-user/host/ppc64/hostdep.h b/common-user/host/ppc64/host=
dep.h<br>
deleted file mode 100644<br>
index 0c290dd904..0000000000<br>
--- a/common-user/host/ppc64/hostdep.h<br>
+++ /dev/null<br>
@@ -1,18 +0,0 @@<br>
-/*<br>
- * hostdep.h : things which are dependent on the host architecture<br>
- *<br>
- *=C2=A0 * Written by Peter Maydell &lt;<a href=3D"mailto:peter.maydell@li=
naro.org" target=3D"_blank">peter.maydell@linaro.org</a>&gt;<br>
- *<br>
- * Copyright (C) 2016 Linaro Limited<br>
- *<br>
- * This work is licensed under the terms of the GNU GPL, version 2 or late=
r.<br>
- * See the COPYING file in the top-level directory.<br>
- */<br>
-<br>
-#ifndef PPC64_HOSTDEP_H<br>
-#define PPC64_HOSTDEP_H<br>
-<br>
-/* We have a safe-syscall.inc.S */<br>
-#define HAVE_SAFE_SYSCALL<br>
-<br>
-#endif<br>
diff --git a/common-user/host/riscv/hostdep.h b/common-user/host/riscv/host=
dep.h<br>
deleted file mode 100644<br>
index 7f67c22868..0000000000<br>
--- a/common-user/host/riscv/hostdep.h<br>
+++ /dev/null<br>
@@ -1,14 +0,0 @@<br>
-/*<br>
- * hostdep.h : things which are dependent on the host architecture<br>
- *<br>
- * This work is licensed under the terms of the GNU GPL, version 2 or late=
r.<br>
- * See the COPYING file in the top-level directory.<br>
- */<br>
-<br>
-#ifndef RISCV_HOSTDEP_H<br>
-#define RISCV_HOSTDEP_H<br>
-<br>
-/* We have a safe-syscall.inc.S */<br>
-#define HAVE_SAFE_SYSCALL<br>
-<br>
-#endif<br>
diff --git a/common-user/host/s390x/hostdep.h b/common-user/host/s390x/host=
dep.h<br>
deleted file mode 100644<br>
index d801145854..0000000000<br>
--- a/common-user/host/s390x/hostdep.h<br>
+++ /dev/null<br>
@@ -1,18 +0,0 @@<br>
-/*<br>
- * hostdep.h : things which are dependent on the host architecture<br>
- *<br>
- *=C2=A0 * Written by Peter Maydell &lt;<a href=3D"mailto:peter.maydell@li=
naro.org" target=3D"_blank">peter.maydell@linaro.org</a>&gt;<br>
- *<br>
- * Copyright (C) 2016 Linaro Limited<br>
- *<br>
- * This work is licensed under the terms of the GNU GPL, version 2 or late=
r.<br>
- * See the COPYING file in the top-level directory.<br>
- */<br>
-<br>
-#ifndef S390X_HOSTDEP_H<br>
-#define S390X_HOSTDEP_H<br>
-<br>
-/* We have a safe-syscall.inc.S */<br>
-#define HAVE_SAFE_SYSCALL<br>
-<br>
-#endif<br>
diff --git a/common-user/host/sparc64/hostdep.h b/common-user/host/sparc64/=
hostdep.h<br>
deleted file mode 100644<br>
index b18aca1deb..0000000000<br>
--- a/common-user/host/sparc64/hostdep.h<br>
+++ /dev/null<br>
@@ -1,2 +0,0 @@<br>
-/* We have a safe-syscall.inc.S */<br>
-#define HAVE_SAFE_SYSCALL<br>
diff --git a/common-user/host/x86_64/hostdep.h b/common-user/host/x86_64/ho=
stdep.h<br>
deleted file mode 100644<br>
index 9c62bd26bd..0000000000<br>
--- a/common-user/host/x86_64/hostdep.h<br>
+++ /dev/null<br>
@@ -1,18 +0,0 @@<br>
-/*<br>
- * hostdep.h : things which are dependent on the host architecture<br>
- *<br>
- *=C2=A0 * Written by Peter Maydell &lt;<a href=3D"mailto:peter.maydell@li=
naro.org" target=3D"_blank">peter.maydell@linaro.org</a>&gt;<br>
- *<br>
- * Copyright (C) 2016 Linaro Limited<br>
- *<br>
- * This work is licensed under the terms of the GNU GPL, version 2 or late=
r.<br>
- * See the COPYING file in the top-level directory.<br>
- */<br>
-<br>
-#ifndef X86_64_HOSTDEP_H<br>
-#define X86_64_HOSTDEP_H<br>
-<br>
-/* We have a safe-syscall.inc.S */<br>
-#define HAVE_SAFE_SYSCALL<br>
-<br>
-#endif<br>
diff --git a/linux-user/host/ia64/hostdep.h b/linux-user/host/ia64/hostdep.=
h<br>
deleted file mode 100644<br>
index 263bf7658e..0000000000<br>
--- a/linux-user/host/ia64/hostdep.h<br>
+++ /dev/null<br>
@@ -1,15 +0,0 @@<br>
-/*<br>
- * hostdep.h : things which are dependent on the host architecture<br>
- *<br>
- *=C2=A0 * Written by Peter Maydell &lt;<a href=3D"mailto:peter.maydell@li=
naro.org" target=3D"_blank">peter.maydell@linaro.org</a>&gt;<br>
- *<br>
- * Copyright (C) 2016 Linaro Limited<br>
- *<br>
- * This work is licensed under the terms of the GNU GPL, version 2 or late=
r.<br>
- * See the COPYING file in the top-level directory.<br>
- */<br>
-<br>
-#ifndef IA64_HOSTDEP_H<br>
-#define IA64_HOSTDEP_H<br>
-<br>
-#endif<br>
diff --git a/linux-user/host/mips/hostdep.h b/linux-user/host/mips/hostdep.=
h<br>
deleted file mode 100644<br>
index ba111d75c3..0000000000<br>
--- a/linux-user/host/mips/hostdep.h<br>
+++ /dev/null<br>
@@ -1,15 +0,0 @@<br>
-/*<br>
- * hostdep.h : things which are dependent on the host architecture<br>
- *<br>
- *=C2=A0 * Written by Peter Maydell &lt;<a href=3D"mailto:peter.maydell@li=
naro.org" target=3D"_blank">peter.maydell@linaro.org</a>&gt;<br>
- *<br>
- * Copyright (C) 2016 Linaro Limited<br>
- *<br>
- * This work is licensed under the terms of the GNU GPL, version 2 or late=
r.<br>
- * See the COPYING file in the top-level directory.<br>
- */<br>
-<br>
-#ifndef MIPS_HOSTDEP_H<br>
-#define MIPS_HOSTDEP_H<br>
-<br>
-#endif<br>
diff --git a/linux-user/host/ppc/hostdep.h b/linux-user/host/ppc/hostdep.h<=
br>
deleted file mode 100644<br>
index 23d8bd9d47..0000000000<br>
--- a/linux-user/host/ppc/hostdep.h<br>
+++ /dev/null<br>
@@ -1,15 +0,0 @@<br>
-/*<br>
- * hostdep.h : things which are dependent on the host architecture<br>
- *<br>
- *=C2=A0 * Written by Peter Maydell &lt;<a href=3D"mailto:peter.maydell@li=
naro.org" target=3D"_blank">peter.maydell@linaro.org</a>&gt;<br>
- *<br>
- * Copyright (C) 2016 Linaro Limited<br>
- *<br>
- * This work is licensed under the terms of the GNU GPL, version 2 or late=
r.<br>
- * See the COPYING file in the top-level directory.<br>
- */<br>
-<br>
-#ifndef PPC_HOSTDEP_H<br>
-#define PPC_HOSTDEP_H<br>
-<br>
-#endif<br>
diff --git a/linux-user/host/s390/hostdep.h b/linux-user/host/s390/hostdep.=
h<br>
deleted file mode 100644<br>
index afcba5a16a..0000000000<br>
--- a/linux-user/host/s390/hostdep.h<br>
+++ /dev/null<br>
@@ -1,15 +0,0 @@<br>
-/*<br>
- * hostdep.h : things which are dependent on the host architecture<br>
- *<br>
- *=C2=A0 * Written by Peter Maydell &lt;<a href=3D"mailto:peter.maydell@li=
naro.org" target=3D"_blank">peter.maydell@linaro.org</a>&gt;<br>
- *<br>
- * Copyright (C) 2016 Linaro Limited<br>
- *<br>
- * This work is licensed under the terms of the GNU GPL, version 2 or late=
r.<br>
- * See the COPYING file in the top-level directory.<br>
- */<br>
-<br>
-#ifndef S390_HOSTDEP_H<br>
-#define S390_HOSTDEP_H<br>
-<br>
-#endif<br>
diff --git a/linux-user/host/sparc/hostdep.h b/linux-user/host/sparc/hostde=
p.h<br>
deleted file mode 100644<br>
index 391ad923cf..0000000000<br>
--- a/linux-user/host/sparc/hostdep.h<br>
+++ /dev/null<br>
@@ -1,15 +0,0 @@<br>
-/*<br>
- * hostdep.h : things which are dependent on the host architecture<br>
- *<br>
- *=C2=A0 * Written by Peter Maydell &lt;<a href=3D"mailto:peter.maydell@li=
naro.org" target=3D"_blank">peter.maydell@linaro.org</a>&gt;<br>
- *<br>
- * Copyright (C) 2016 Linaro Limited<br>
- *<br>
- * This work is licensed under the terms of the GNU GPL, version 2 or late=
r.<br>
- * See the COPYING file in the top-level directory.<br>
- */<br>
-<br>
-#ifndef SPARC_HOSTDEP_H<br>
-#define SPARC_HOSTDEP_H<br>
-<br>
-#endif<br>
diff --git a/linux-user/host/sparc64/hostdep.h b/linux-user/host/sparc64/ho=
stdep.h<br>
deleted file mode 100644<br>
index ce3968fca0..0000000000<br>
--- a/linux-user/host/sparc64/hostdep.h<br>
+++ /dev/null<br>
@@ -1,15 +0,0 @@<br>
-/*<br>
- * hostdep.h : things which are dependent on the host architecture<br>
- *<br>
- *=C2=A0 * Written by Peter Maydell &lt;<a href=3D"mailto:peter.maydell@li=
naro.org" target=3D"_blank">peter.maydell@linaro.org</a>&gt;<br>
- *<br>
- * Copyright (C) 2016 Linaro Limited<br>
- *<br>
- * This work is licensed under the terms of the GNU GPL, version 2 or late=
r.<br>
- * See the COPYING file in the top-level directory.<br>
- */<br>
-<br>
-#ifndef SPARC64_HOSTDEP_H<br>
-#define SPARC64_HOSTDEP_H<br>
-<br>
-#endif<br>
diff --git a/linux-user/host/x32/hostdep.h b/linux-user/host/x32/hostdep.h<=
br>
deleted file mode 100644<br>
index 2c2d6d37da..0000000000<br>
--- a/linux-user/host/x32/hostdep.h<br>
+++ /dev/null<br>
@@ -1,15 +0,0 @@<br>
-/*<br>
- * hostdep.h : things which are dependent on the host architecture<br>
- *<br>
- *=C2=A0 * Written by Peter Maydell &lt;<a href=3D"mailto:peter.maydell@li=
naro.org" target=3D"_blank">peter.maydell@linaro.org</a>&gt;<br>
- *<br>
- * Copyright (C) 2016 Linaro Limited<br>
- *<br>
- * This work is licensed under the terms of the GNU GPL, version 2 or late=
r.<br>
- * See the COPYING file in the top-level directory.<br>
- */<br>
-<br>
-#ifndef X32_HOSTDEP_H<br>
-#define X32_HOSTDEP_H<br>
-<br>
-#endif<br>
diff --git a/linux-user/safe-syscall.h b/linux-user/safe-syscall.h<br>
index ea0e8a8d24..0deb87e51a 100644<br>
--- a/linux-user/safe-syscall.h<br>
+++ b/linux-user/safe-syscall.h<br>
@@ -124,7 +124,6 @@<br>
=C2=A0 * need to check SA_RESTART flags in QEMU or distinguish the various<=
br>
=C2=A0 * kinds of restartability.<br>
=C2=A0 */<br>
-#ifdef HAVE_SAFE_SYSCALL<br>
<br>
=C2=A0/* The core part of this function is implemented in assembly. */<br>
=C2=A0extern long safe_syscall_base(int *pending, int *errnop, long number,=
 ...);<br>
@@ -137,15 +136,4 @@ extern char safe_syscall_end[];<br>
=C2=A0 =C2=A0 =C2=A0safe_syscall_base(&amp;((TaskState *)thread_cpu-&gt;opa=
que)-&gt;signal_pending, \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0&amp;errno, __VA_ARGS__)<br>
<br>
-#else<br>
-<br>
-/*<br>
- * Fallback for architectures which don&#39;t yet provide a safe-syscall a=
ssembly<br>
- * fragment; note that this is racy!<br>
- * This should go away when all host architectures have been updated.<br>
- */<br>
-#define safe_syscall syscall<br>
-<br>
-#endif<br>
-<br>
=C2=A0#endif<br>
diff --git a/linux-user/user-internals.h b/linux-user/user-internals.h<br>
index 661612a088..f71f372829 100644<br>
--- a/linux-user/user-internals.h<br>
+++ b/linux-user/user-internals.h<br>
@@ -18,7 +18,6 @@<br>
=C2=A0#ifndef LINUX_USER_USER_INTERNALS_H<br>
=C2=A0#define LINUX_USER_USER_INTERNALS_H<br>
<br>
-#include &quot;hostdep.h&quot;<br>
=C2=A0#include &quot;exec/user/thunk.h&quot;<br>
=C2=A0#include &quot;exec/exec-all.h&quot;<br>
=C2=A0#include &quot;qemu/log.h&quot;<br>
diff --git a/linux-user/signal.c b/linux-user/signal.c<br>
index 6d5e5b698c..ca8f24b9ec 100644<br>
--- a/linux-user/signal.c<br>
+++ b/linux-user/signal.c<br>
@@ -798,7 +798,6 @@ int queue_signal(CPUArchState *env, int sig, int si_typ=
e,<br>
=C2=A0/* Adjust the signal context to rewind out of safe-syscall if we&#39;=
re in it */<br>
=C2=A0static inline void rewind_if_in_safe_syscall(void *puc)<br>
=C2=A0{<br>
-#ifdef HAVE_SAFE_SYSCALL<br>
=C2=A0 =C2=A0 =C2=A0ucontext_t *uc =3D (ucontext_t *)puc;<br>
=C2=A0 =C2=A0 =C2=A0uintptr_t pcreg =3D host_signal_pc(uc);<br>
<br>
@@ -806,7 +805,6 @@ static inline void rewind_if_in_safe_syscall(void *puc)=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;&amp; pcreg &lt; (uintptr_t)safe_sys=
call_end) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0host_signal_set_pc(uc, (uintptr_t)safe_sy=
scall_start);<br>
=C2=A0 =C2=A0 =C2=A0}<br>
-#endif<br>
=C2=A0}<br>
<br>
=C2=A0static void host_signal_handler(int host_sig, siginfo_t *info, void *=
puc)<br>
diff --git a/linux-user/safe-syscall.S b/linux-user/safe-syscall.S<br>
index 42ea7c40ba..7ddc997801 100644<br>
--- a/linux-user/safe-syscall.S<br>
+++ b/linux-user/safe-syscall.S<br>
@@ -10,15 +10,12 @@<br>
=C2=A0 * See the COPYING file in the top-level directory.<br>
=C2=A0 */<br>
<br>
-#include &quot;hostdep.h&quot;<br>
=C2=A0#include &quot;target_errno_defs.h&quot;<br>
<br>
=C2=A0/* We have the correct host directory on our include path<br>
=C2=A0 * so that this will pull in the right fragment for the architecture.=
<br>
=C2=A0 */<br>
-#ifdef HAVE_SAFE_SYSCALL<br>
=C2=A0#include &quot;safe-syscall.inc.S&quot;<br>
-#endif<br>
<br>
=C2=A0/* We must specifically say that we&#39;re happy for the stack to not=
 be<br>
=C2=A0 * executable, otherwise the toolchain will default to assuming our<b=
r>
-- <br>
2.25.1<br>
<br>
</blockquote></div></div>

--000000000000b33d8105d0fe1dbe--

