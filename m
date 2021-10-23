Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 65AAB438240
	for <lists+qemu-devel@lfdr.de>; Sat, 23 Oct 2021 09:41:29 +0200 (CEST)
Received: from localhost ([::1]:41606 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1meBeg-0001Oj-6S
	for lists+qemu-devel@lfdr.de; Sat, 23 Oct 2021 03:41:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42432)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kevans@freebsd.org>)
 id 1meBTy-0005kU-4R; Sat, 23 Oct 2021 03:30:22 -0400
Received: from mx2.freebsd.org ([96.47.72.81]:47681)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kevans@freebsd.org>)
 id 1meBTv-0002tK-9Q; Sat, 23 Oct 2021 03:30:21 -0400
Received: from mx1.freebsd.org (mx1.freebsd.org [IPv6:2610:1c1:1:606c::19:1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits)
 client-signature RSA-PSS (4096 bits))
 (Client CN "mx1.freebsd.org", Issuer "R3" (verified OK))
 by mx2.freebsd.org (Postfix) with ESMTPS id 650EC995B2;
 Sat, 23 Oct 2021 07:30:17 +0000 (UTC)
 (envelope-from kevans@freebsd.org)
Received: from smtp.freebsd.org (smtp.freebsd.org
 [IPv6:2610:1c1:1:606c::24b:4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
 client-signature RSA-PSS (4096 bits) client-digest SHA256)
 (Client CN "smtp.freebsd.org", Issuer "R3" (verified OK))
 by mx1.freebsd.org (Postfix) with ESMTPS id 4HbtCs1yD8z3F0r;
 Sat, 23 Oct 2021 07:30:17 +0000 (UTC)
 (envelope-from kevans@freebsd.org)
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com
 [209.85.222.173])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (Client CN "smtp.gmail.com", Issuer "GTS CA 1D4" (verified OK))
 (Authenticated sender: kevans)
 by smtp.freebsd.org (Postfix) with ESMTPSA id 2492EA729;
 Sat, 23 Oct 2021 07:30:17 +0000 (UTC)
 (envelope-from kevans@freebsd.org)
Received: by mail-qk1-f173.google.com with SMTP id y10so6722056qkp.9;
 Sat, 23 Oct 2021 00:30:17 -0700 (PDT)
X-Gm-Message-State: AOAM531xiFdGX5eCR5NgmGm6rzpxWXzUM2prtxZy61MCLh6eTY75XzE7
 b9ba8HQwTONGgFd5ueW2JQtT1X/LmHEiksMvDMk=
X-Google-Smtp-Source: ABdhPJybqbEsp1eIKCV09d3L9PAtiA6LZf+E6GxVhSShGqTntIg/TjAM1OrwFp0pODrYtZS+4f1p0u3h6PCGUVotrV4=
X-Received: by 2002:a05:620a:424f:: with SMTP id
 w15mr3797331qko.258.1634974216773; 
 Sat, 23 Oct 2021 00:30:16 -0700 (PDT)
MIME-Version: 1.0
References: <20211019164447.16359-1-imp@bsdimp.com>
 <20211019164447.16359-3-imp@bsdimp.com>
In-Reply-To: <20211019164447.16359-3-imp@bsdimp.com>
From: Kyle Evans <kevans@freebsd.org>
Date: Sat, 23 Oct 2021 02:30:06 -0500
X-Gmail-Original-Message-ID: <CACNAnaF+c6DtEGbf9BxG_MyzAG3x5a8SDVqgE8+eHKeKwSNvBg@mail.gmail.com>
Message-ID: <CACNAnaF+c6DtEGbf9BxG_MyzAG3x5a8SDVqgE8+eHKeKwSNvBg@mail.gmail.com>
Subject: Re: [PATCH 02/24] bsd-user/arm/target_syscall.h: Add copyright and
 update name
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
> The preferred name for the 32-bit arm is now armv7. Update the name to
> reflect that. In addition, add Stacey's copyright to this file and
> update the include guards to the new convention.
>
> Signed-off-by: Stacey Son <sson@FreeBSD.org>
> Signed-off-by: Warner Losh <imp@bsdimp.com>
> ---
>  bsd-user/arm/target_syscall.h | 27 +++++++++++++++++++++++----
>  1 file changed, 23 insertions(+), 4 deletions(-)
>
> diff --git a/bsd-user/arm/target_syscall.h b/bsd-user/arm/target_syscall.h
> index ef4b37f017..a5f2bb4e01 100644
> --- a/bsd-user/arm/target_syscall.h
> +++ b/bsd-user/arm/target_syscall.h
> @@ -1,5 +1,24 @@
> -#ifndef BSD_USER_ARCH_SYSCALL_H_
> -#define BSD_USER_ARCH_SYSCALL_H_
> +/*
> + *  arm cpu system call stubs
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
> +#ifndef _TARGET_ARCH_SYSCALL_H_
> +#define _TARGET_ARCH_SYSCALL_H_
>
>  struct target_pt_regs {
>      abi_long uregs[17];
> @@ -31,6 +50,6 @@ struct target_pt_regs {
>  #define TARGET_FREEBSD_ARM_GET_TP       3
>
>  #define TARGET_HW_MACHINE       "arm"
> -#define TARGET_HW_MACHINE_ARCH  "armv6"
> +#define TARGET_HW_MACHINE_ARCH  "armv7"
>
> -#endif /* !BSD_USER_ARCH_SYSCALL_H_ */
> +#endif /* !_TARGET_ARCH_SYSCALL_H_ */
> --
> 2.32.0
>

Reviewed-by: Kyle Evans <kevans@FreeBSD.org>

