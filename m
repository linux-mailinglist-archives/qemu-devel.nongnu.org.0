Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 65F2E438248
	for <lists+qemu-devel@lfdr.de>; Sat, 23 Oct 2021 09:55:45 +0200 (CEST)
Received: from localhost ([::1]:52536 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1meBsV-00014j-6R
	for lists+qemu-devel@lfdr.de; Sat, 23 Oct 2021 03:55:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42536)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kevans@freebsd.org>)
 id 1meBVF-0006Cp-CA; Sat, 23 Oct 2021 03:31:41 -0400
Received: from mx2.freebsd.org ([2610:1c1:1:606c::19:2]:49143)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kevans@freebsd.org>)
 id 1meBVB-0003Xw-G9; Sat, 23 Oct 2021 03:31:40 -0400
Received: from mx1.freebsd.org (mx1.freebsd.org [96.47.72.80])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits)
 client-signature RSA-PSS (4096 bits))
 (Client CN "mx1.freebsd.org", Issuer "R3" (verified OK))
 by mx2.freebsd.org (Postfix) with ESMTPS id 5E04899801;
 Sat, 23 Oct 2021 07:31:35 +0000 (UTC)
 (envelope-from kevans@freebsd.org)
Received: from smtp.freebsd.org (smtp.freebsd.org [96.47.72.83])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
 client-signature RSA-PSS (4096 bits) client-digest SHA256)
 (Client CN "smtp.freebsd.org", Issuer "R3" (verified OK))
 by mx1.freebsd.org (Postfix) with ESMTPS id 4HbtFM1lXGz3F1f;
 Sat, 23 Oct 2021 07:31:35 +0000 (UTC)
 (envelope-from kevans@freebsd.org)
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com
 [209.85.222.174])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (Client CN "smtp.gmail.com", Issuer "GTS CA 1D4" (verified OK))
 (Authenticated sender: kevans)
 by smtp.freebsd.org (Postfix) with ESMTPSA id 1DA14A456;
 Sat, 23 Oct 2021 07:31:35 +0000 (UTC)
 (envelope-from kevans@freebsd.org)
Received: by mail-qk1-f174.google.com with SMTP id j12so6835378qkk.5;
 Sat, 23 Oct 2021 00:31:35 -0700 (PDT)
X-Gm-Message-State: AOAM533f7KsgnsMIaNHwGEPGjs9Ubxa36MG0n7Y3MnPUr1vIrrqWV6cV
 /hRuJQ7Iv3NUZfiT0Mf+n9t3Lc016yj9wOfAPs4=
X-Google-Smtp-Source: ABdhPJyjVQ43d91Nrp+FKPK8UbXPxkOQNfUTZqPSfKmKKQGAYQiIMf0aQvC6XVGy+Q82eP7A+mypoafA0RvouaYYQ7Y=
X-Received: by 2002:a37:a956:: with SMTP id s83mr3760568qke.244.1634974294733; 
 Sat, 23 Oct 2021 00:31:34 -0700 (PDT)
MIME-Version: 1.0
References: <20211019164447.16359-1-imp@bsdimp.com>
 <20211019164447.16359-5-imp@bsdimp.com>
In-Reply-To: <20211019164447.16359-5-imp@bsdimp.com>
From: Kyle Evans <kevans@freebsd.org>
Date: Sat, 23 Oct 2021 02:31:23 -0500
X-Gmail-Original-Message-ID: <CACNAnaGdg8BjE5SJ1aAmV=DvKuRQ+eRkiZ+Am=SWHNLT4orNjg@mail.gmail.com>
Message-ID: <CACNAnaGdg8BjE5SJ1aAmV=DvKuRQ+eRkiZ+Am=SWHNLT4orNjg@mail.gmail.com>
Subject: Re: [PATCH 04/24] bsd-user/arm/target_arch_cpu.h: CPU Loop definitions
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
 Kyle Evans <kevans@freebsd.org>, Olivier Houchard <cognet@ci0.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Laurent Vivier <laurent@vivier.eu>,
 Michael Tokarev <mjt@tls.msk.ru>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Oct 19, 2021 at 11:45 AM Warner Losh <imp@bsdimp.com> wrote:
>
> target_arch_cpu.h is for CPU loop definitions. Create the file and
> define target_cpu_init and target_cpu_reset for arm.
>
> Signed-off-by: Olivier Houchard <cognet@ci0.org>
> Signed-off-by: Stacey Son <sson@FreeBSD.org>
> Signed-off-by: Warner Losh <imp@bsdimp.com>
> ---
>  bsd-user/arm/target_arch_cpu.h | 42 ++++++++++++++++++++++++++++++++++
>  1 file changed, 42 insertions(+)
>  create mode 100644 bsd-user/arm/target_arch_cpu.h
>
> diff --git a/bsd-user/arm/target_arch_cpu.h b/bsd-user/arm/target_arch_cpu.h
> new file mode 100644
> index 0000000000..0f3538196d
> --- /dev/null
> +++ b/bsd-user/arm/target_arch_cpu.h
> @@ -0,0 +1,42 @@
> +/*
> + *  arm cpu init and loop
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
> +#ifndef _TARGET_ARCH_CPU_H_
> +#define _TARGET_ARCH_CPU_H_
> +
> +#include "target_arch.h"
> +
> +#define TARGET_DEFAULT_CPU_MODEL "any"
> +
> +static inline void target_cpu_init(CPUARMState *env,
> +        struct target_pt_regs *regs)
> +{
> +    int i;
> +
> +    cpsr_write(env, regs->uregs[16], 0xffffffff, CPSRWriteRaw);
> +    for (i = 0; i < 16; i++) {
> +        env->regs[i] = regs->uregs[i];
> +    }
> +}
> +
> +static inline void target_cpu_reset(CPUArchState *cpu)
> +{
> +}
> +
> +#endif /* !_TARGET_ARCH_CPU_H */
> --
> 2.32.0
>

Reviewed-by: Kyle Evans <kevans@FreeBSD.org>

