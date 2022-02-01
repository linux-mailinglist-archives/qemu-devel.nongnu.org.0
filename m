Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D91584A633A
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Feb 2022 19:08:03 +0100 (CET)
Received: from localhost ([::1]:47398 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nExZS-0006i5-K2
	for lists+qemu-devel@lfdr.de; Tue, 01 Feb 2022 13:08:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40780)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kevans@freebsd.org>)
 id 1nEvs1-0007H8-1J
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 11:19:05 -0500
Received: from mx2.freebsd.org ([96.47.72.81]:13074)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kevans@freebsd.org>)
 id 1nEvrx-0006GB-72
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 11:19:02 -0500
Received: from mx1.freebsd.org (mx1.freebsd.org [IPv6:2610:1c1:1:606c::19:1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits)
 client-signature RSA-PSS (4096 bits))
 (Client CN "mx1.freebsd.org", Issuer "R3" (verified OK))
 by mx2.freebsd.org (Postfix) with ESMTPS id BB41D79D30
 for <qemu-devel@nongnu.org>; Tue,  1 Feb 2022 16:18:53 +0000 (UTC)
 (envelope-from kevans@freebsd.org)
Received: from smtp.freebsd.org (smtp.freebsd.org [96.47.72.83])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
 client-signature RSA-PSS (4096 bits) client-digest SHA256)
 (Client CN "smtp.freebsd.org", Issuer "R3" (verified OK))
 by mx1.freebsd.org (Postfix) with ESMTPS id 4Jp9994NPpz4Wq2
 for <qemu-devel@nongnu.org>; Tue,  1 Feb 2022 16:18:53 +0000 (UTC)
 (envelope-from kevans@freebsd.org)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=freebsd.org; s=dkim;
 t=1643732333;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4pYJqI82IOiYb6GG70tn777hQQkDd6hfFsjHkcBCfrs=;
 b=flWRim7pNJisnqqqU8cM9Fg3pdTQ2WeUoEG1GT5vj8cxzmIF0ZzqGbEyMfcj1ZcyARfUDw
 LrWjMooW10wEa4t1uoCVbmwzxajAt+cpW6BV48hUndd8AMsGC4FU3SY5C0AeQn9wqdl1If
 qGXwksajcfaEncYeCIWtPIhfJxuuF2Um1hHT1gGGWiZuQo7IdWxa3kVqCzbb357xUfg4JX
 Jjhz1gAZ4cHdpkdnEQJ48pko5zHk7m8+JcIQl+HivP8Wq1ATwv+bTtZK5NnPYYoR2r33sx
 rOHKplQ7VSbnPUZv4woK0UUXuvZalgAXZeMt1PrAGm4Cemj5A229joL6JUKmEQ==
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com
 [209.85.219.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (Client CN "smtp.gmail.com", Issuer "GTS CA 1D4" (verified OK))
 (Authenticated sender: kevans)
 by smtp.freebsd.org (Postfix) with ESMTPSA id 7291A2E928
 for <qemu-devel@nongnu.org>; Tue,  1 Feb 2022 16:18:53 +0000 (UTC)
 (envelope-from kevans@freebsd.org)
Received: by mail-qv1-f48.google.com with SMTP id i19so16424858qvx.12
 for <qemu-devel@nongnu.org>; Tue, 01 Feb 2022 08:18:53 -0800 (PST)
X-Gm-Message-State: AOAM533iiEpiR5Z0j8b6qSsniB5XbewqEwuly7qnUVPnhkhJAD7x0pPT
 XQtKNoKH+4hlrepFV04tGj/khtSuL8dYsHT3CW8=
X-Google-Smtp-Source: ABdhPJytUln+Fz3/su7ivkV5FuYKU2oPSuDYxMAMNBCYPwQA66+M8qgwAVoAghrqY4aS0507mvVJxXsM5+iydHhitto=
X-Received: by 2002:a05:6214:226c:: with SMTP id
 gs12mr23407648qvb.33.1643732332569; 
 Tue, 01 Feb 2022 08:18:52 -0800 (PST)
MIME-Version: 1.0
References: <20220201111455.52511-1-imp@bsdimp.com>
 <20220201111455.52511-10-imp@bsdimp.com>
In-Reply-To: <20220201111455.52511-10-imp@bsdimp.com>
From: Kyle Evans <kevans@freebsd.org>
Date: Tue, 1 Feb 2022 10:18:41 -0600
X-Gmail-Original-Message-ID: <CACNAnaEv+etFj-YZV8Kv2Ps-CO=R1i-EuLwx1KVsyDpzZdgw7g@mail.gmail.com>
Message-ID: <CACNAnaEv+etFj-YZV8Kv2Ps-CO=R1i-EuLwx1KVsyDpzZdgw7g@mail.gmail.com>
Subject: Re: [PATCH 09/22] bsd-user/freebsd/os-syscall.c: Move syscall
 processing here
To: Warner Losh <imp@bsdimp.com>
Content-Type: text/plain; charset="UTF-8"
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=freebsd.org;
 s=dkim; t=1643732333;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4pYJqI82IOiYb6GG70tn777hQQkDd6hfFsjHkcBCfrs=;
 b=ur2YANu+m7evUXJ/ZPmQkwSm57ZDOr2cnrFiURIHnbr426RsLkpggKd+wq0EzMtBmmTJN0
 2lDWEFYFln1iLY34wRbPVC9CfqYUVo1ANWPq/t4rJ644WuEciSvc2jWn8/ezWSBFusKshC
 rwjzjb+ialCXTpMbI0VS5xexcWGAiRn8PsKU86Bb+P9ce0/Jl1W/ynPEUewOJF8QPR0b+H
 PM6xp77IA6Xia2ypZhltT3Tb2Gb4OcxUtAMe/CLjpXhJOevEizBHz/EHs+Zu0Um2ZbvSdZ
 obZGP9XtrpINmrWYrcGsUCDubOswKcXOjjWP2cLMda2Mvmp1fVrm5+xq/9TuCw==
ARC-Seal: i=1; s=dkim; d=freebsd.org; t=1643732333; a=rsa-sha256; cv=none;
 b=eZtVpakbUl+S3ZgiOWWj0K519T8DSL122DJGtHAAZr0SaeMfvChlIa2zEWZ8GEc/Pwj0Po
 WHC596ExfD4FDhg8JwLmQ2DLOpiqBtP+ztttg8nDkYoOynK052Q+wdPlHSzS4L1AjyqnAk
 ZvMEH7a7mm7iXiAKaHpQpU/pupJUDvFNo4jVvwifDbhg9J3tNHbUv20a+fJ/bxhI0E00tA
 D29CklwGgF9H3L9U6/JzWFDsiCWd8TdbQ/4BJswyM4aWBOpbHv39x+3TBXOxH69ReHUP+B
 A8I+CmXMeAWlaAwHxHmuoc92zGf5eTeH43KVkdDGz0u1cwxQUz8IKelEfrm+EQ==
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
Cc: Peter Maydell <peter.maydell@linaro.org>, arrowd@freebsd.org,
 Kyle Evans <kevans@freebsd.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, def@freebsd.org,
 Jessica Clarke <jrtc27@freebsd.org>, Brad Smith <brad@comstyle.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Feb 1, 2022 at 5:15 AM Warner Losh <imp@bsdimp.com> wrote:
>
> While there is some commonality between *BSD syscall processing, there's
> a number of differences and the system call numbers and ABIs have been
> independent since the late 90s. Move FreeBSD's proessing here and delete
> it.
>

"processing"

> The upstream implementation is somewhat different than the current
> implementation. It will be much easier to upstream these from scratch,
> justifying the final result, rather than working out the diffs and
> justifying the changes. Also tweak a comment to qemu standard form.
>
> Signed-off-by: Warner Losh <imp@bsdimp.com>
> ---
>  bsd-user/freebsd/os-syscall.c | 68 +++++++++++++++++++++++++++++++++++
>  1 file changed, 68 insertions(+)
>  create mode 100644 bsd-user/freebsd/os-syscall.c
>
> diff --git a/bsd-user/freebsd/os-syscall.c b/bsd-user/freebsd/os-syscall.c
> new file mode 100644
> index 00000000000..7e2bedb918d
> --- /dev/null
> +++ b/bsd-user/freebsd/os-syscall.c
> @@ -0,0 +1,68 @@
> +/*
> + *  BSD syscalls
> + *
> + *  Copyright (c) 2003-2008 Fabrice Bellard
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
> +/*
> + * We need the FreeBSD "legacy" definitions. Rust needs the FreeBSD 11 system
> + * calls, so we have to emulate that despite FreeBSD being EOL'd.
> + */

... FreeBSD 11 being EOL'd.

> +#define _WANT_FREEBSD11_STAT
> +#define _WANT_FREEBSD11_STATFS
> +#define _WANT_FREEBSD11_DIRENT
> +#define _WANT_KERNEL_ERRNO
> +#define _WANT_SEMUN
> +#include "qemu/osdep.h"
> +#include "qemu/cutils.h"
> +#include "qemu/path.h"
> +#include <sys/syscall.h>
> +#include <sys/param.h>
> +#include <sys/sysctl.h>
> +#include <utime.h>
> +
> +#include "qemu.h"
> +#include "qemu-common.h"
> +#include "signal-common.h"
> +#include "user/syscall-trace.h"
> +
> +void target_set_brk(abi_ulong new_brk)
> +{
> +}
> +
> +bool is_error(abi_long ret)
> +{
> +
> +    return (abi_ulong)ret >= (abi_ulong)(-4096);
> +}
> +
> +/*
> + * do_syscall() should always have a single exit point at the end so that
> + * actions, such as logging of syscall results, can be performed.  All errnos
> + * that do_syscall() returns must be -TARGET_<errcode>.
> + */
> +abi_long do_freebsd_syscall(void *cpu_env, int num, abi_long arg1,
> +                            abi_long arg2, abi_long arg3, abi_long arg4,
> +                            abi_long arg5, abi_long arg6, abi_long arg7,
> +                            abi_long arg8)
> +{
> +    return 0;
> +}
> +
> +void syscall_init(void)
> +{
> +}
> --
> 2.33.1
>

Small typo + omission, otherwise:

Reviewed-by: Kyle Evans <kevans@FreeBSD.org>

