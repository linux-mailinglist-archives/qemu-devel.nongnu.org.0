Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E97C4A6674
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Feb 2022 21:54:13 +0100 (CET)
Received: from localhost ([::1]:45254 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nF0AF-0004N4-Tm
	for lists+qemu-devel@lfdr.de; Tue, 01 Feb 2022 15:54:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48038)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kevans@freebsd.org>)
 id 1nEwKU-0000ui-A5
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 11:48:30 -0500
Received: from mx2.freebsd.org ([96.47.72.81]:55376)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kevans@freebsd.org>)
 id 1nEwKS-0002W0-Lj
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 11:48:30 -0500
Received: from mx1.freebsd.org (mx1.freebsd.org [IPv6:2610:1c1:1:606c::19:1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits)
 client-signature RSA-PSS (4096 bits))
 (Client CN "mx1.freebsd.org", Issuer "R3" (verified OK))
 by mx2.freebsd.org (Postfix) with ESMTPS id 420D78279D
 for <qemu-devel@nongnu.org>; Tue,  1 Feb 2022 16:48:28 +0000 (UTC)
 (envelope-from kevans@freebsd.org)
Received: from smtp.freebsd.org (smtp.freebsd.org [96.47.72.83])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
 client-signature RSA-PSS (4096 bits) client-digest SHA256)
 (Client CN "smtp.freebsd.org", Issuer "R3" (verified OK))
 by mx1.freebsd.org (Postfix) with ESMTPS id 4Jp9qJ0s1Rz4j2l
 for <qemu-devel@nongnu.org>; Tue,  1 Feb 2022 16:48:28 +0000 (UTC)
 (envelope-from kevans@freebsd.org)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=freebsd.org; s=dkim;
 t=1643734108;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=rKluUIQZQsqnSUN5Z+2ZFS6GkxEje3sjEHhwXi1oIfw=;
 b=mqxFG48GN4pJM2i1MwBrfvMi1hkeWFjo8/za+F/WvbOZblvZe46pvFLJ/twkh4gLyl2lJF
 FHDoEh3lCxc2MBfMTpgDsBGyAGsvly9mP3MYhHpBrdrP+24ddLlHVKdL94049N9J7Q007Z
 Mp6h6VXdQVxXtnh0uGCdtksXfFiXrR+pcqHaB3UZ2zkpKWosFf/3wZpJUi1CfsL6xo11CB
 hR+YKtmAnvMUcNWvlN5pB4b4t8XiTWKky0FZvLfq9/NaURoKX7Mc9p2P4EEe1rkDPqRrWE
 /PfUCAqU9Jc+adxQqJBQOe649kRu7Mbw+EC+gIiwgNNlEaciircAJRZ7AUfInw==
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com
 [209.85.222.181])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (Client CN "smtp.gmail.com", Issuer "GTS CA 1D4" (verified OK))
 (Authenticated sender: kevans)
 by smtp.freebsd.org (Postfix) with ESMTPSA id F1FE72F1DF
 for <qemu-devel@nongnu.org>; Tue,  1 Feb 2022 16:48:27 +0000 (UTC)
 (envelope-from kevans@freebsd.org)
Received: by mail-qk1-f181.google.com with SMTP id bs32so4249224qkb.1
 for <qemu-devel@nongnu.org>; Tue, 01 Feb 2022 08:48:27 -0800 (PST)
X-Gm-Message-State: AOAM5325xM9EOmgqdP/k5DJu8F+TVTphCC2ZZuFwcX1UDHKY7ShNWCTz
 03Dhr/qAqnqjG2YIFIch6fdhM8CF6iGpAz83ouE=
X-Google-Smtp-Source: ABdhPJxPcLFjzgWe/sJ0IUbwfDLcAg2DVKUbHa8YNnqnuF96ynhFeW1xoumEZpl/fbeUDdH5Zx/5U59xCmHPrkJaz/Y=
X-Received: by 2002:a05:620a:2891:: with SMTP id
 j17mr17284402qkp.350.1643734107691; 
 Tue, 01 Feb 2022 08:48:27 -0800 (PST)
MIME-Version: 1.0
References: <20220201111455.52511-1-imp@bsdimp.com>
 <20220201111455.52511-23-imp@bsdimp.com>
In-Reply-To: <20220201111455.52511-23-imp@bsdimp.com>
From: Kyle Evans <kevans@freebsd.org>
Date: Tue, 1 Feb 2022 10:48:16 -0600
X-Gmail-Original-Message-ID: <CACNAnaFnN7+6dceZ=2j5cL9G4+tuTjVP43NPpewx5x_LCc3RSg@mail.gmail.com>
Message-ID: <CACNAnaFnN7+6dceZ=2j5cL9G4+tuTjVP43NPpewx5x_LCc3RSg@mail.gmail.com>
Subject: Re: [PATCH 22/22] bsd-user/freebsd/os-syscall.c: Implement exit
To: Warner Losh <imp@bsdimp.com>
Content-Type: text/plain; charset="UTF-8"
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=freebsd.org;
 s=dkim; t=1643734108;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=rKluUIQZQsqnSUN5Z+2ZFS6GkxEje3sjEHhwXi1oIfw=;
 b=wd65I6MhyXVPvUXZl1FxLHrJR3W5iQnz3cDTIVNHzqrle07Tejt8aTnVITBc6f2W1DhSvX
 C6uZrI7edmzA+CeamdTKqe5EdfdZKv5HQTfBcJgbkkICUCr3TkQyyglCB4Hft8UbNGcDOU
 BTF3sIHEjLqB2SgpwYzWoEG8/UaoQ0hdeaQaP+yg1/eT5TdSMVcIpLFkfaJuK9W858BWK6
 RkBOgcFW5zCTXduobaOxjjBBmi1lihjVr9AHy4lhY7BD05AtZSu90atucAWhs0UpZFqta9
 gtI+hYGLj6hjS7opIlcRx5TKdjkjz0+KvMXgxXHG08MGTABfvtGEcdrAVUkVyA==
ARC-Seal: i=1; s=dkim; d=freebsd.org; t=1643734108; a=rsa-sha256; cv=none;
 b=qSpEPEYD/zYCSMb75Prz1+7c69HgiJM8snpXBedpxXfLqIJGOvyzVq9N1FzPidWMkClntS
 vcW0Buw66dPNYfU1XSpfhBrkSaeJEemF0F7YU5A0CoE2zseTPVBZCw2pQlt+nNFPCUGFf1
 ryNiEVyUTS6yOok8+2fE7So4MImeTxcaSwFTyslgdFchy4zjB9nCIgbk10YtJqg4Wit7EY
 JyGo2+nanq4zqPlOcPdJAETR+k5t+e3EM4/PgNo6KEMqTTw2XPfoYAmskehmZi7afg01Pq
 aYQXpkla4rLaFkBG8KZpt3n9Lc6pew8QyCbR7LtKwYjcHMisbOJ2x1LoP7rsjQ==
ARC-Authentication-Results: i=1;
	mx1.freebsd.org;
	none
Received-SPF: pass client-ip=96.47.72.81; envelope-from=kevans@freebsd.org;
 helo=mx2.freebsd.org
X-Spam_score_int: -71
X-Spam_score: -7.2
X-Spam_bar: -------
X-Spam_report: (-7.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.081,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Stacey Son <sson@freebsd.org>,
 arrowd@freebsd.org, Kyle Evans <kevans@freebsd.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, def@freebsd.org,
 Jessica Clarke <jrtc27@freebsd.org>, Brad Smith <brad@comstyle.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Feb 1, 2022 at 5:15 AM Warner Losh <imp@bsdimp.com> wrote:
>
> Implement the exit system call. Bring in bsd-proc.h to contain all the
> process system call implementation and helper routines.
>
> Signed-off-by: Stacey Son <sson@FreeBSD.org>
> Signed-off-by: Warner Losh <imp@bsdimp.com>
> ---
>  bsd-user/bsd-proc.h           | 43 +++++++++++++++++++++++++++++++++++
>  bsd-user/freebsd/os-syscall.c |  7 ++++++
>  2 files changed, 50 insertions(+)
>  create mode 100644 bsd-user/bsd-proc.h
>

Reviewed-by: Kyle Evans <kevans@FreeBSD.org>

> diff --git a/bsd-user/bsd-proc.h b/bsd-user/bsd-proc.h
> new file mode 100644
> index 00000000000..8f0b6990d14
> --- /dev/null
> +++ b/bsd-user/bsd-proc.h
> @@ -0,0 +1,43 @@
> +/*
> + *  process related system call shims and definitions
> + *
> + *  Copyright (c) 2013-2014 Stacey D. Son
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
> +#ifndef BSD_PROC_H_
> +#define BSD_PROC_H_
> +
> +#include <sys/types.h>
> +#include <sys/stat.h>
> +#include <sys/time.h>
> +#include <sys/resource.h>
> +#include <unistd.h>
> +
> +/* exit(2) */
> +static inline abi_long do_bsd_exit(void *cpu_env, abi_long arg1)
> +{
> +#ifdef TARGET_GPROF
> +    _mcleanup();
> +#endif
> +    gdb_exit(arg1);
> +    qemu_plugin_user_exit();
> +    /* XXX: should free thread stack and CPU env here  */
> +    _exit(arg1);
> +
> +    return 0;
> +}
> +
> +#endif /* !BSD_PROC_H_ */
> diff --git a/bsd-user/freebsd/os-syscall.c b/bsd-user/freebsd/os-syscall.c
> index f52c9e3c306..f66b6a1b1f5 100644
> --- a/bsd-user/freebsd/os-syscall.c
> +++ b/bsd-user/freebsd/os-syscall.c
> @@ -41,6 +41,7 @@
>  #include "user/syscall-trace.h"
>
>  #include "bsd-file.h"
> +#include "bsd-proc.h"
>
>  /* I/O */
>  safe_syscall3(ssize_t, read, int, fd, void *, buf, size_t, nbytes);
> @@ -227,6 +228,12 @@ abi_long do_freebsd_syscall(void *cpu_env, int num, abi_long arg1,
>      }
>
>      switch (num) {
> +        /*
> +         * process system calls
> +         */
> +    case TARGET_FREEBSD_NR_exit: /* exit(2) */
> +        ret = do_bsd_exit(cpu_env, arg1);
> +        break;
>
>          /*
>           * File system calls.
> --
> 2.33.1
>

