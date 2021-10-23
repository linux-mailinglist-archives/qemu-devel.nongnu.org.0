Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DCA15438249
	for <lists+qemu-devel@lfdr.de>; Sat, 23 Oct 2021 09:56:21 +0200 (CEST)
Received: from localhost ([::1]:52868 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1meBt6-0001J3-LL
	for lists+qemu-devel@lfdr.de; Sat, 23 Oct 2021 03:56:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42464)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kevans@freebsd.org>)
 id 1meBUn-0005zS-OY; Sat, 23 Oct 2021 03:31:15 -0400
Received: from mx2.freebsd.org ([96.47.72.81]:48599)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kevans@freebsd.org>)
 id 1meBUj-0003Ka-Jo; Sat, 23 Oct 2021 03:31:13 -0400
Received: from mx1.freebsd.org (mx1.freebsd.org [IPv6:2610:1c1:1:606c::19:1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits)
 client-signature RSA-PSS (4096 bits))
 (Client CN "mx1.freebsd.org", Issuer "R3" (verified OK))
 by mx2.freebsd.org (Postfix) with ESMTPS id D485B98FFA;
 Sat, 23 Oct 2021 07:31:08 +0000 (UTC)
 (envelope-from kevans@freebsd.org)
Received: from smtp.freebsd.org (smtp.freebsd.org [96.47.72.83])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
 client-signature RSA-PSS (4096 bits) client-digest SHA256)
 (Client CN "smtp.freebsd.org", Issuer "R3" (verified OK))
 by mx1.freebsd.org (Postfix) with ESMTPS id 4HbtDr5K9Kz3F1K;
 Sat, 23 Oct 2021 07:31:08 +0000 (UTC)
 (envelope-from kevans@freebsd.org)
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com
 [209.85.160.175])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (Client CN "smtp.gmail.com", Issuer "GTS CA 1D4" (verified OK))
 (Authenticated sender: kevans)
 by smtp.freebsd.org (Postfix) with ESMTPSA id 96C40A260;
 Sat, 23 Oct 2021 07:31:08 +0000 (UTC)
 (envelope-from kevans@freebsd.org)
Received: by mail-qt1-f175.google.com with SMTP id n2so5620568qta.2;
 Sat, 23 Oct 2021 00:31:08 -0700 (PDT)
X-Gm-Message-State: AOAM531wfIKKxtT5ckIG8ibUq2n5ouyvO1jrYekyhTZKEj1B12gAFT4f
 agA/T20MbuvA5ZB3QnPYOvdb3CECEFmDub7gOVA=
X-Google-Smtp-Source: ABdhPJwTgG/rUhuIPO+c1wtSJbHn1gDCH044Iqek2hyhG8k5P3kFSUMnh3rJh1sGcu9/17WHMxN9EDYzV83Imalv7+U=
X-Received: by 2002:ac8:5747:: with SMTP id 7mr4852246qtx.11.1634974268185;
 Sat, 23 Oct 2021 00:31:08 -0700 (PDT)
MIME-Version: 1.0
References: <20211019164447.16359-1-imp@bsdimp.com>
 <20211019164447.16359-4-imp@bsdimp.com>
In-Reply-To: <20211019164447.16359-4-imp@bsdimp.com>
From: Kyle Evans <kevans@freebsd.org>
Date: Sat, 23 Oct 2021 02:30:57 -0500
X-Gmail-Original-Message-ID: <CACNAnaEhoeTMXRggQZmv3S+jSy4CpytLWLZW5cxkg5L67Y=mpg@mail.gmail.com>
Message-ID: <CACNAnaEhoeTMXRggQZmv3S+jSy4CpytLWLZW5cxkg5L67Y=mpg@mail.gmail.com>
Subject: Re: [PATCH 03/24] bsd-user/arm/target_arch_cpu.c: Target specific TLS
 routines
To: Warner Losh <imp@bsdimp.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=96.47.72.81; envelope-from=kevans@freebsd.org;
 helo=mx2.freebsd.org
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
> Target specific TLS routines to get and set the TLS values.
>
> Signed-off-by: Klye Evans <kevans@FreeBSD.org>

s/Klye/Kyle/ :-)

> Signed-off-by: Stacey Son <sson@FreeBSD.org>
> Signed-off-by: Warner Losh <imp@bsdimp.com>
> ---
>  bsd-user/arm/target_arch.h     | 28 ++++++++++++++++++++++++
>  bsd-user/arm/target_arch_cpu.c | 39 ++++++++++++++++++++++++++++++++++
>  2 files changed, 67 insertions(+)
>  create mode 100644 bsd-user/arm/target_arch.h
>  create mode 100644 bsd-user/arm/target_arch_cpu.c
>
> diff --git a/bsd-user/arm/target_arch.h b/bsd-user/arm/target_arch.h
> new file mode 100644
> index 0000000000..93cfaea098
> --- /dev/null
> +++ b/bsd-user/arm/target_arch.h
> @@ -0,0 +1,28 @@
> +/*
> + * ARM 32-bit specific prototypes for bsd-user
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
> +
> +#ifndef _TARGET_ARCH_H_
> +#define _TARGET_ARCH_H_
> +
> +#include "qemu.h"
> +
> +void target_cpu_set_tls(CPUARMState *env, target_ulong newtls);
> +target_ulong target_cpu_get_tls(CPUARMState *env);
> +
> +#endif /* !_TARGET_ARCH_H_ */
> diff --git a/bsd-user/arm/target_arch_cpu.c b/bsd-user/arm/target_arch_cpu.c
> new file mode 100644
> index 0000000000..02bf9149d5
> --- /dev/null
> +++ b/bsd-user/arm/target_arch_cpu.c
> @@ -0,0 +1,39 @@
> +/*
> + *  arm cpu related code
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
> +#include "target_arch.h"
> +
> +void target_cpu_set_tls(CPUARMState *env, target_ulong newtls)
> +{
> +    if (access_secure_reg(env)) {
> +        env->cp15.tpidrurw_s = newtls;
> +        env->cp15.tpidruro_s = newtls;
> +        return;
> +    }
> +
> +    env->cp15.tpidr_el[0] = newtls;
> +    env->cp15.tpidrro_el[0] = newtls;
> +}
> +
> +target_ulong target_cpu_get_tls(CPUARMState *env)
> +{
> +    if (access_secure_reg(env)) {
> +        return env->cp15.tpidruro_s;
> +    }
> +    return env->cp15.tpidrro_el[0];
> +}
> --
> 2.32.0
>

Modulo typo:

Reviewed-by: Kyle Evans <kevans@FreeBSD.org>

