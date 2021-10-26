Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FDC643ACC8
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Oct 2021 09:11:51 +0200 (CEST)
Received: from localhost ([::1]:57288 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfGce-0008Nn-7O
	for lists+qemu-devel@lfdr.de; Tue, 26 Oct 2021 03:11:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46918)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kevans@freebsd.org>)
 id 1mfFYW-0002YX-Ln; Tue, 26 Oct 2021 02:03:28 -0400
Received: from mx2.freebsd.org ([2610:1c1:1:606c::19:2]:45422)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kevans@freebsd.org>)
 id 1mfFYR-0001QO-Rm; Tue, 26 Oct 2021 02:03:27 -0400
Received: from mx1.freebsd.org (mx1.freebsd.org [IPv6:2610:1c1:1:606c::19:1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits)
 client-signature RSA-PSS (4096 bits))
 (Client CN "mx1.freebsd.org", Issuer "R3" (verified OK))
 by mx2.freebsd.org (Postfix) with ESMTPS id DDC417A64E;
 Tue, 26 Oct 2021 06:03:22 +0000 (UTC)
 (envelope-from kevans@freebsd.org)
Received: from smtp.freebsd.org (smtp.freebsd.org [96.47.72.83])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
 client-signature RSA-PSS (4096 bits) client-digest SHA256)
 (Client CN "smtp.freebsd.org", Issuer "R3" (verified OK))
 by mx1.freebsd.org (Postfix) with ESMTPS id 4Hdh8B5WTyz3LpK;
 Tue, 26 Oct 2021 06:03:22 +0000 (UTC)
 (envelope-from kevans@freebsd.org)
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com
 [209.85.222.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (Client CN "smtp.gmail.com", Issuer "GTS CA 1D4" (verified OK))
 (Authenticated sender: kevans)
 by smtp.freebsd.org (Postfix) with ESMTPSA id 9DE17D402;
 Tue, 26 Oct 2021 06:03:22 +0000 (UTC)
 (envelope-from kevans@freebsd.org)
Received: by mail-qk1-f170.google.com with SMTP id h20so13988317qko.13;
 Mon, 25 Oct 2021 23:03:22 -0700 (PDT)
X-Gm-Message-State: AOAM530/4SnyMvoHwC/Nx1GUwNtRsP9G2pjKKlDDTr4VHHilcDTwQw66
 LFXCJfVKxnLivJXaPxtgsKPKAcbr6ZPrmloqqyw=
X-Google-Smtp-Source: ABdhPJyu4arn4KgMytLcbhMJVPo23UD10gi2vJTuHHVbfF/267u5mTIJz3I557laGdSaj08Ock1CpYDDehCifhntQhA=
X-Received: by 2002:a05:620a:424f:: with SMTP id
 w15mr17470220qko.258.1635228202257; 
 Mon, 25 Oct 2021 23:03:22 -0700 (PDT)
MIME-Version: 1.0
References: <20211019164447.16359-1-imp@bsdimp.com>
 <20211019164447.16359-18-imp@bsdimp.com>
In-Reply-To: <20211019164447.16359-18-imp@bsdimp.com>
From: Kyle Evans <kevans@freebsd.org>
Date: Tue, 26 Oct 2021 01:03:11 -0500
X-Gmail-Original-Message-ID: <CACNAnaFs0L4PioNz+nLO69x7RhbWVqgzD5xjKtQ1rQVk2an6EQ@mail.gmail.com>
Message-ID: <CACNAnaFs0L4PioNz+nLO69x7RhbWVqgzD5xjKtQ1rQVk2an6EQ@mail.gmail.com>
Subject: Re: [PATCH 17/24] bsd-user/arm/target_arch_signal.h: arm specific
 signal registers and stack
To: Warner Losh <imp@bsdimp.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2610:1c1:1:606c::19:2;
 envelope-from=kevans@freebsd.org; helo=mx2.freebsd.org
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Stacey Son <sson@freebsd.org>, qemu-trivial@nongnu.org,
 Kyle Evans <kevans@freebsd.org>, Michael Tokarev <mjt@tls.msk.ru>,
 QEMU Developers <qemu-devel@nongnu.org>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Oct 19, 2021 at 11:45 AM Warner Losh <imp@bsdimp.com> wrote:
>
> Defines for registers and stack layout related to signals.
>
> Signed-off-by: Stacey Son <sson@FreeBSD.org>
> Signed-off-by: Warner Losh <imp@bsdimp.com>
> ---
>  bsd-user/arm/target_arch_signal.h | 57 +++++++++++++++++++++++++++++++
>  1 file changed, 57 insertions(+)
>  create mode 100644 bsd-user/arm/target_arch_signal.h
>
> diff --git a/bsd-user/arm/target_arch_signal.h b/bsd-user/arm/target_arch_signal.h
> new file mode 100644
> index 0000000000..973183d99c
> --- /dev/null
> +++ b/bsd-user/arm/target_arch_signal.h
> @@ -0,0 +1,57 @@
> +/*
> + *  arm signal definitions
> + *
> + *  Copyright (c) 2013 Stacey D. Son
> + *
> + *  This program is free software; you can redistribute it and/or modify
> + *  it under the terms of the GNU General Public License as published by
> + *  the Free Software Foundation; either version 2 of the License, or
> + *  (at your option) any later version.
> + *
> + *  This program is distributed in the hope that it will be useful,
> + *  but WITHOUT ANY WARRANTY; without even the implied warranty of
> + *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + *  GNU General Public License for more details.
> + *
> + *  You should have received a copy of the GNU General Public License
> + *  along with this program; if not, see <http://www.gnu.org/licenses/>.
> + */
> +#ifndef _TARGET_ARCH_SIGNAL_H_
> +#define _TARGET_ARCH_SIGNAL_H_
> +
> +#include "cpu.h"
> +
> +#define TARGET_REG_R0   0
> +#define TARGET_REG_R1   1
> +#define TARGET_REG_R2   2
> +#define TARGET_REG_R3   3
> +#define TARGET_REG_R4   4
> +#define TARGET_REG_R5   5
> +#define TARGET_REG_R6   6
> +#define TARGET_REG_R7   7
> +#define TARGET_REG_R8   8
> +#define TARGET_REG_R9   9
> +#define TARGET_REG_R10  10
> +#define TARGET_REG_R11  11
> +#define TARGET_REG_R12  12
> +#define TARGET_REG_R13  13
> +#define TARGET_REG_R14  14
> +#define TARGET_REG_R15  15
> +#define TARGET_REG_CPSR 16
> +#define TARGET__NGREG   17
> +/* Convenience synonyms */
> +#define TARGET_REG_FP   TARGET_REG_R11
> +#define TARGET_REG_SP   TARGET_REG_R13
> +#define TARGET_REG_LR   TARGET_REG_R14
> +#define TARGET_REG_PC   TARGET_REG_R15
> +
> +#define TARGET_INSN_SIZE    4       /* arm instruction size */
> +
> +/* Size of the signal trampolin code. See _sigtramp(). */
> +#define TARGET_SZSIGCODE    ((abi_ulong)(9 * TARGET_INSN_SIZE))
> +
> +/* compare to arm/include/_limits.h */
> +#define TARGET_MINSIGSTKSZ  (1024 * 4)                  /* min sig stack size */
> +#define TARGET_SIGSTKSZ     (TARGET_MINSIGSTKSZ + 32768)  /* recommended size */
> +
> +#endif /* !_TARGET_ARCH_SIGNAL_H_ */
> --
> 2.32.0
>

Reviewed-by: Kyle Evans <kevans@FreeBSD.org>

