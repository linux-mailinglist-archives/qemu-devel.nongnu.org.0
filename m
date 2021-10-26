Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D9AE643AC7F
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Oct 2021 08:56:17 +0200 (CEST)
Received: from localhost ([::1]:43800 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfGNa-00075I-Li
	for lists+qemu-devel@lfdr.de; Tue, 26 Oct 2021 02:56:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47642)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kevans@freebsd.org>)
 id 1mfFcg-0004Oh-2p; Tue, 26 Oct 2021 02:07:46 -0400
Received: from mx2.freebsd.org ([96.47.72.81]:47380)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kevans@freebsd.org>)
 id 1mfFcd-0001x4-6M; Tue, 26 Oct 2021 02:07:45 -0400
Received: from mx1.freebsd.org (mx1.freebsd.org [IPv6:2610:1c1:1:606c::19:1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits)
 client-signature RSA-PSS (4096 bits))
 (Client CN "mx1.freebsd.org", Issuer "R3" (verified OK))
 by mx2.freebsd.org (Postfix) with ESMTPS id A79FC7A5E0;
 Tue, 26 Oct 2021 06:07:41 +0000 (UTC)
 (envelope-from kevans@freebsd.org)
Received: from smtp.freebsd.org (smtp.freebsd.org [96.47.72.83])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
 client-signature RSA-PSS (4096 bits) client-digest SHA256)
 (Client CN "smtp.freebsd.org", Issuer "R3" (verified OK))
 by mx1.freebsd.org (Postfix) with ESMTPS id 4HdhF93zhNz3LxJ;
 Tue, 26 Oct 2021 06:07:41 +0000 (UTC)
 (envelope-from kevans@freebsd.org)
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com
 [209.85.219.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (Client CN "smtp.gmail.com", Issuer "GTS CA 1D4" (verified OK))
 (Authenticated sender: kevans)
 by smtp.freebsd.org (Postfix) with ESMTPSA id 69E7BD3BE;
 Tue, 26 Oct 2021 06:07:41 +0000 (UTC)
 (envelope-from kevans@freebsd.org)
Received: by mail-qv1-f45.google.com with SMTP id b1so6895964qvk.5;
 Mon, 25 Oct 2021 23:07:41 -0700 (PDT)
X-Gm-Message-State: AOAM532BDFWD4cA4FOQteaKZMdB21NqRe6nwMugn7qQdrg8EALf8e+4X
 /WC8WLppT8Su17VJMwgAqO+naH03Snh1gs6koxc=
X-Google-Smtp-Source: ABdhPJyQF1yyn7RKbEUUn0LTVibOGx0JAGRQ+jN/v3RrFTKFn6pr5eDqwHm3wT+55M6CwjOAXs9rOhavQkj22GT8vIM=
X-Received: by 2002:ad4:5966:: with SMTP id eq6mr20866442qvb.64.1635228461152; 
 Mon, 25 Oct 2021 23:07:41 -0700 (PDT)
MIME-Version: 1.0
References: <20211019164447.16359-1-imp@bsdimp.com>
 <20211019164447.16359-15-imp@bsdimp.com>
In-Reply-To: <20211019164447.16359-15-imp@bsdimp.com>
From: Kyle Evans <kevans@freebsd.org>
Date: Tue, 26 Oct 2021 01:07:30 -0500
X-Gmail-Original-Message-ID: <CACNAnaGoJNziKqKYVqfNm0Bf0fs_KL7ctZBmMOYwOdHL5=x2OQ@mail.gmail.com>
Message-ID: <CACNAnaGoJNziKqKYVqfNm0Bf0fs_KL7ctZBmMOYwOdHL5=x2OQ@mail.gmail.com>
Subject: Re: [PATCH 14/24] bsd-user/arm/target_arch_elf.h: arm defines for ELF
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
> Basic set of defines needed for arm ELF file activation.
>
> Signed-off-by: Stacey Son <sson@FreeBSD.org>
> Signed-off-by: Warner Losh <imp@bsdimp.com>
> ---
>  bsd-user/arm/target_arch_elf.h | 36 ++++++++++++++++++++++++++++++++++
>  1 file changed, 36 insertions(+)
>  create mode 100644 bsd-user/arm/target_arch_elf.h
>
> diff --git a/bsd-user/arm/target_arch_elf.h b/bsd-user/arm/target_arch_elf.h
> new file mode 100644
> index 0000000000..15b5c66511
> --- /dev/null
> +++ b/bsd-user/arm/target_arch_elf.h
> @@ -0,0 +1,36 @@
> +/*
> + *  arm ELF definitions
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
> +#ifndef _TARGET_ARCH_ELF_H_
> +#define _TARGET_ARCH_ELF_H_
> +
> +#define ELF_START_MMAP 0x80000000
> +#define ELF_ET_DYN_LOAD_ADDR    0x500000
> +
> +#define elf_check_arch(x) ((x) == EM_ARM)
> +
> +#define ELF_CLASS       ELFCLASS32
> +#define ELF_DATA        ELFDATA2LSB
> +#define ELF_ARCH        EM_ARM
> +
> +#define USE_ELF_CORE_DUMP
> +#define ELF_EXEC_PAGESIZE       4096
> +
> +#define ELF_HWCAP 0
> +
> +#endif /* _TARGET_ARCH_ELF_H_ */
> --
> 2.32.0
>

Reviewed-by: Kyle Evans <kevans@FreeBSD.org>

