Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 54906430EE3
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Oct 2021 06:28:14 +0200 (CEST)
Received: from localhost ([::1]:48138 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcKFx-0000Mc-8Y
	for lists+qemu-devel@lfdr.de; Mon, 18 Oct 2021 00:28:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40844)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kevans@freebsd.org>)
 id 1mcJT2-0007bl-RT
 for qemu-devel@nongnu.org; Sun, 17 Oct 2021 23:37:42 -0400
Received: from mx2.freebsd.org ([96.47.72.81]:43114)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kevans@freebsd.org>)
 id 1mcJSx-00061r-GT
 for qemu-devel@nongnu.org; Sun, 17 Oct 2021 23:37:40 -0400
Received: from mx1.freebsd.org (mx1.freebsd.org [96.47.72.80])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits)
 client-signature RSA-PSS (4096 bits))
 (Client CN "mx1.freebsd.org", Issuer "R3" (verified OK))
 by mx2.freebsd.org (Postfix) with ESMTPS id E832F9E9BC
 for <qemu-devel@nongnu.org>; Mon, 18 Oct 2021 03:37:33 +0000 (UTC)
 (envelope-from kevans@freebsd.org)
Received: from smtp.freebsd.org (smtp.freebsd.org
 [IPv6:2610:1c1:1:606c::24b:4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
 client-signature RSA-PSS (4096 bits) client-digest SHA256)
 (Client CN "smtp.freebsd.org", Issuer "R3" (verified OK))
 by mx1.freebsd.org (Postfix) with ESMTPS id 4HXjHd5vjXz3HKY
 for <qemu-devel@nongnu.org>; Mon, 18 Oct 2021 03:37:33 +0000 (UTC)
 (envelope-from kevans@freebsd.org)
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com
 [209.85.219.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (Client CN "smtp.gmail.com", Issuer "GTS CA 1O1" (verified OK))
 (Authenticated sender: kevans)
 by smtp.freebsd.org (Postfix) with ESMTPSA id 7A4ABD713
 for <qemu-devel@nongnu.org>; Mon, 18 Oct 2021 03:37:33 +0000 (UTC)
 (envelope-from kevans@freebsd.org)
Received: by mail-qv1-f44.google.com with SMTP id o13so9502026qvm.4
 for <qemu-devel@nongnu.org>; Sun, 17 Oct 2021 20:37:33 -0700 (PDT)
X-Gm-Message-State: AOAM532LWmIeiQh222zg+ZhxL8207RY/sVA40n4BiCxaY24d2kfknXSe
 NWvMp8th8o48FHsbTj6Y+KaEozfJPNRI5ubDhoU=
X-Google-Smtp-Source: ABdhPJwBbiQZ8VWGB+sv6qO/UDGCNoHyl4HlmhWOAAUxk67MIyu0m1MSweCEhd+WqEl1oSfTCxl61rQuPaXE3LQysW0=
X-Received: by 2002:a05:6214:ca9:: with SMTP id
 s9mr23255747qvs.31.1634528253133; 
 Sun, 17 Oct 2021 20:37:33 -0700 (PDT)
MIME-Version: 1.0
References: <20211008231506.17471-1-imp@bsdimp.com>
 <20211008231506.17471-14-imp@bsdimp.com>
In-Reply-To: <20211008231506.17471-14-imp@bsdimp.com>
From: Kyle Evans <kevans@freebsd.org>
Date: Sun, 17 Oct 2021 22:37:22 -0500
X-Gmail-Original-Message-ID: <CACNAnaFgBRpXrb0Xwest9i4Jfx0nAhVrRT7--yfM9o8CGLYxOw@mail.gmail.com>
Message-ID: <CACNAnaFgBRpXrb0Xwest9i4Jfx0nAhVrRT7--yfM9o8CGLYxOw@mail.gmail.com>
Subject: Re: [PATCH v2 13/15] bsd-user/sysarch: Provide a per-arch framework
 for sysarch syscall
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
Cc: Stacey Son <sson@freebsd.org>, Kyle Evans <kevans@freebsd.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Oct 8, 2021 at 6:15 PM Warner Losh <imp@bsdimp.com> wrote:
>
> Add the missing glue to pull in do_freebsd_sysarch to call
> do_freebsd_arch_sysarch. Put it in os-sys.c, which will be used for
> sysctl and sysarch system calls because they are mostly arch specific.
>
> Signed-off-by: Stacey Son <sson@FreeBSD.org>
> Signed-off-by: Warner Losh <imp@bsdimp.com>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  bsd-user/freebsd/meson.build |  3 +++
>  bsd-user/freebsd/os-sys.c    | 27 +++++++++++++++++++++++++++
>  bsd-user/meson.build         |  3 +++
>  bsd-user/qemu.h              |  3 +++
>  bsd-user/syscall.c           |  7 -------
>  5 files changed, 36 insertions(+), 7 deletions(-)
>  create mode 100644 bsd-user/freebsd/meson.build
>  create mode 100644 bsd-user/freebsd/os-sys.c
>
> diff --git a/bsd-user/freebsd/meson.build b/bsd-user/freebsd/meson.build
> new file mode 100644
> index 0000000000..4b69cca7b9
> --- /dev/null
> +++ b/bsd-user/freebsd/meson.build
> @@ -0,0 +1,3 @@
> +bsd_user_ss.add(files(
> +  'os-sys.c',
> +))
> diff --git a/bsd-user/freebsd/os-sys.c b/bsd-user/freebsd/os-sys.c
> new file mode 100644
> index 0000000000..309e27b9d6
> --- /dev/null
> +++ b/bsd-user/freebsd/os-sys.c
> @@ -0,0 +1,27 @@
> +/*
> + *  FreeBSD sysctl() and sysarch() system call emulation
> + *
> + *  Copyright (c) 2013-15 Stacey D. Son
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
> +#include "qemu.h"
> +#include "target_arch_sysarch.h"
> +
> +/* sysarch() is architecture dependent. */
> +abi_long do_freebsd_sysarch(void *cpu_env, abi_long arg1, abi_long arg2)
> +{
> +    return do_freebsd_arch_sysarch(cpu_env, arg1, arg2);
> +}
> diff --git a/bsd-user/meson.build b/bsd-user/meson.build
> index 243fb78930..a4163c91ff 100644
> --- a/bsd-user/meson.build
> +++ b/bsd-user/meson.build
> @@ -12,3 +12,6 @@ bsd_user_ss.add(files(
>    'syscall.c',
>    'uaccess.c',
>  ))
> +
> +# Pull in the OS-specific build glue, if any
> +subdir(targetos)
> diff --git a/bsd-user/qemu.h b/bsd-user/qemu.h
> index cdb85140f4..e65e41d53d 100644
> --- a/bsd-user/qemu.h
> +++ b/bsd-user/qemu.h
> @@ -239,6 +239,9 @@ extern unsigned long target_sgrowsiz;
>  abi_long get_errno(abi_long ret);
>  bool is_error(abi_long ret);
>
> +/* os-sys.c */
> +abi_long do_freebsd_sysarch(void *cpu_env, abi_long arg1, abi_long arg2);
> +
>  /* user access */
>
>  #define VERIFY_READ  PAGE_READ
> diff --git a/bsd-user/syscall.c b/bsd-user/syscall.c
> index d3b9f431e2..d3322760f4 100644
> --- a/bsd-user/syscall.c
> +++ b/bsd-user/syscall.c
> @@ -88,13 +88,6 @@ static abi_long do_obreak(abi_ulong new_brk)
>      return 0;
>  }
>
> -#if defined(TARGET_I386)
> -static abi_long do_freebsd_sysarch(CPUX86State *env, int op, abi_ulong parms)
> -{
> -    do_freebsd_arch_sysarch(env, op, parms);
> -}
> -#endif
> -
>  #ifdef __FreeBSD__
>  /*
>   * XXX this uses the undocumented oidfmt interface to find the kind of
> --
> 2.32.0
>

Reviewed-by: Kyle Evans <kevans@FreeBSD.org>

