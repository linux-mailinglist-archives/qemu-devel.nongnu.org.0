Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E4FF43AC38
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Oct 2021 08:20:56 +0200 (CEST)
Received: from localhost ([::1]:50028 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfFpM-0007LS-5u
	for lists+qemu-devel@lfdr.de; Tue, 26 Oct 2021 02:20:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45542)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kevans@freebsd.org>)
 id 1mfFO2-0006dv-4d; Tue, 26 Oct 2021 01:52:39 -0400
Received: from mx2.freebsd.org ([2610:1c1:1:606c::19:2]:60770)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kevans@freebsd.org>)
 id 1mfFNt-0000KR-Sh; Tue, 26 Oct 2021 01:52:34 -0400
Received: from mx1.freebsd.org (mx1.freebsd.org [96.47.72.80])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits)
 client-signature RSA-PSS (4096 bits))
 (Client CN "mx1.freebsd.org", Issuer "R3" (verified OK))
 by mx2.freebsd.org (Postfix) with ESMTPS id D94FC77C7F;
 Tue, 26 Oct 2021 05:52:26 +0000 (UTC)
 (envelope-from kevans@freebsd.org)
Received: from smtp.freebsd.org (smtp.freebsd.org [96.47.72.83])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
 client-signature RSA-PSS (4096 bits) client-digest SHA256)
 (Client CN "smtp.freebsd.org", Issuer "R3" (verified OK))
 by mx1.freebsd.org (Postfix) with ESMTPS id 4HdgvZ5RWsz3JKs;
 Tue, 26 Oct 2021 05:52:26 +0000 (UTC)
 (envelope-from kevans@freebsd.org)
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com
 [209.85.160.169])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (Client CN "smtp.gmail.com", Issuer "GTS CA 1D4" (verified OK))
 (Authenticated sender: kevans)
 by smtp.freebsd.org (Postfix) with ESMTPSA id 9BA6BCCFD;
 Tue, 26 Oct 2021 05:52:26 +0000 (UTC)
 (envelope-from kevans@freebsd.org)
Received: by mail-qt1-f169.google.com with SMTP id o12so12481238qtq.7;
 Mon, 25 Oct 2021 22:52:26 -0700 (PDT)
X-Gm-Message-State: AOAM5304/+8C1j1MJY4CQnMS4fQ44kD9n231HJe6pClWURvazqfXGaqs
 kU9y5JeVriQl3zo6B3lu+xt524VRvp/93ljpBoI=
X-Google-Smtp-Source: ABdhPJxzQtQ2h6Aj2z97NKn01fBnjpEjwvlboMY99CIBgdKvZBWkr5qdhihK0JHYFTZ4yqKR8VD3ylPnKVXg7C+shSU=
X-Received: by 2002:ac8:57c3:: with SMTP id w3mr22202139qta.132.1635227546370; 
 Mon, 25 Oct 2021 22:52:26 -0700 (PDT)
MIME-Version: 1.0
References: <20211019164447.16359-1-imp@bsdimp.com>
 <20211019164447.16359-12-imp@bsdimp.com>
In-Reply-To: <20211019164447.16359-12-imp@bsdimp.com>
From: Kyle Evans <kevans@freebsd.org>
Date: Tue, 26 Oct 2021 00:52:15 -0500
X-Gmail-Original-Message-ID: <CACNAnaE6VnuvYWFF=uteKxQYG9m34iWDkeUazxZ16ic1bg7MoQ@mail.gmail.com>
Message-ID: <CACNAnaE6VnuvYWFF=uteKxQYG9m34iWDkeUazxZ16ic1bg7MoQ@mail.gmail.com>
Subject: Re: [PATCH 11/24] bsd-user/arm/target_arch_vmparam.h: Parameters for
 arm address space
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
> Various parameters describing the layout of the ARM address space. In
> addition, define routines to get the stack pointer and to set the second
> return value.
>
> Signed-off-by: Stacey Son <sson@FreeBSD.org>
> Signed-off-by: Klye Evans <kevans@FreeBSD.org>
> Signed-off-by: Warner Losh <imp@bsdimp.com>
> ---
>  bsd-user/arm/target_arch_vmparam.h | 48 ++++++++++++++++++++++++++++++
>  1 file changed, 48 insertions(+)
>  create mode 100644 bsd-user/arm/target_arch_vmparam.h
>
> diff --git a/bsd-user/arm/target_arch_vmparam.h b/bsd-user/arm/target_arch_vmparam.h
> new file mode 100644
> index 0000000000..4bbc04ddf5
> --- /dev/null
> +++ b/bsd-user/arm/target_arch_vmparam.h
> @@ -0,0 +1,48 @@
> +/*
> + *  arm VM parameters definitions
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
> +#ifndef _TARGET_ARCH_VMPARAM_H_
> +#define _TARGET_ARCH_VMPARAM_H_
> +
> +#include "cpu.h"
> +
> +/* compare to sys/arm/include/vmparam.h */
> +#define TARGET_MAXTSIZ      (64 * MiB)           /* max text size */
> +#define TARGET_DFLDSIZ      (128 * MiB)          /* initial data size limit */
> +#define TARGET_MAXDSIZ      (512 * MiB)          /* max data size */
> +#define TARGET_DFLSSIZ      (4 * MiB)            /* initial stack size limit */
> +#define TARGET_MAXSSIZ      (64 * MiB)           /* max stack size */
> +#define TARGET_SGROWSIZ     (128 * KiB)          /* amount to grow stack */
> +
> +#define TARGET_RESERVED_VA  0xf7000000
> +
> +                /* KERNBASE - 512 MB */
> +#define TARGET_VM_MAXUSER_ADDRESS   (0xc0000000 - (512 * MiB))
> +#define TARGET_USRSTACK             TARGET_VM_MAXUSER_ADDRESS
> +
> +static inline abi_ulong get_sp_from_cpustate(CPUARMState *state)
> +{
> +    return state->regs[13]; /* sp */
> +}
> +
> +static inline void set_second_rval(CPUARMState *state, abi_ulong retval2)
> +{
> +    state->regs[1] = retval2;
> +}
> +
> +#endif  /* ! _TARGET_ARCH_VMPARAM_H_ */
> --
> 2.32.0
>

Reviewed-by: Kyle Evans <kevans@FreeBSD.org>

