Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F332E4A63D2
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Feb 2022 19:30:26 +0100 (CET)
Received: from localhost ([::1]:57790 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nExv5-0000XO-Ms
	for lists+qemu-devel@lfdr.de; Tue, 01 Feb 2022 13:30:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45680)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kevans@freebsd.org>)
 id 1nEwBx-0007Vx-O7
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 11:39:42 -0500
Received: from [2610:1c1:1:606c::19:2] (port=30677 helo=mx2.freebsd.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kevans@freebsd.org>)
 id 1nEwBu-000110-78
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 11:39:40 -0500
Received: from mx1.freebsd.org (mx1.freebsd.org [IPv6:2610:1c1:1:606c::19:1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits)
 client-signature RSA-PSS (4096 bits))
 (Client CN "mx1.freebsd.org", Issuer "R3" (verified OK))
 by mx2.freebsd.org (Postfix) with ESMTPS id 62432803A6
 for <qemu-devel@nongnu.org>; Tue,  1 Feb 2022 16:39:14 +0000 (UTC)
 (envelope-from kevans@freebsd.org)
Received: from smtp.freebsd.org (smtp.freebsd.org
 [IPv6:2610:1c1:1:606c::24b:4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
 client-signature RSA-PSS (4096 bits) client-digest SHA256)
 (Client CN "smtp.freebsd.org", Issuer "R3" (verified OK))
 by mx1.freebsd.org (Postfix) with ESMTPS id 4Jp9cf1wFpz4fgP
 for <qemu-devel@nongnu.org>; Tue,  1 Feb 2022 16:39:14 +0000 (UTC)
 (envelope-from kevans@freebsd.org)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=freebsd.org; s=dkim;
 t=1643733554;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=AKqjXB7/z/LtlRkv2/mDbCD5GCmVU+Ltv7b33Xgfrlw=;
 b=FcOPvM3SsuSTnEUgUBCr9smC5frku7yakM87s2PYCc5RNyUvsnL6sE3mxGv1vH+/46sBV6
 XY4seoqcNEeT/NLzTHvLLXZptdrrV5wyb4ijFeZDMrkbIYtv4b1HJKe10G6pNF2zaHD0Io
 dPlCnb9CX/kWSlhDmj/aZjJDOpflELR6lOY2iYAdwDhiQEMADxluP1oV785b9vyaw+ybdA
 u1QJTl+sO0cRko+XPXeX4xFA6LEVVrlEPnf+QF29F5dxFBwlgIVrwJGZF4E1BsKsHIvYxL
 cmxsuq7byGVxJjtf9ygZ8o2/ovfa6deWley6OqYtIgtEVjX7VtM5O5qdSD4Klg==
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com
 [209.85.160.181])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (Client CN "smtp.gmail.com", Issuer "GTS CA 1D4" (verified OK))
 (Authenticated sender: kevans)
 by smtp.freebsd.org (Postfix) with ESMTPSA id 1E5C92E933
 for <qemu-devel@nongnu.org>; Tue,  1 Feb 2022 16:39:14 +0000 (UTC)
 (envelope-from kevans@freebsd.org)
Received: by mail-qt1-f181.google.com with SMTP id r14so14906609qtt.5
 for <qemu-devel@nongnu.org>; Tue, 01 Feb 2022 08:39:14 -0800 (PST)
X-Gm-Message-State: AOAM531gkiaaOzixl2/YVeUyu9fv3ir9XBkvm44ccm+potpua58NZmhE
 DmP8TK8cgWJrF6lGNhm16lkfK2Eiw9fsAJ73XZ8=
X-Google-Smtp-Source: ABdhPJyGVg6kAFB4S2GnnOa5OZfpNWkFVxdfL5m+G3zbWosQkpqu4BMaR+JESbM/6LlZ1+4dAN4aiMOLSyCCjbXsjlI=
X-Received: by 2002:a05:622a:ca:: with SMTP id
 p10mr14606704qtw.123.1643733553763; 
 Tue, 01 Feb 2022 08:39:13 -0800 (PST)
MIME-Version: 1.0
References: <20220201111455.52511-1-imp@bsdimp.com>
 <20220201111455.52511-18-imp@bsdimp.com>
In-Reply-To: <20220201111455.52511-18-imp@bsdimp.com>
From: Kyle Evans <kevans@freebsd.org>
Date: Tue, 1 Feb 2022 10:39:02 -0600
X-Gmail-Original-Message-ID: <CACNAnaEoSn0Ra8XWwg9T6XfmXkDjZXTruzgZ9gXrgzi_pzD3Nw@mail.gmail.com>
Message-ID: <CACNAnaEoSn0Ra8XWwg9T6XfmXkDjZXTruzgZ9gXrgzi_pzD3Nw@mail.gmail.com>
Subject: Re: [PATCH 17/22] bsd-user: introduce target.h
To: Warner Losh <imp@bsdimp.com>
Content-Type: text/plain; charset="UTF-8"
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=freebsd.org;
 s=dkim; t=1643733554;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=AKqjXB7/z/LtlRkv2/mDbCD5GCmVU+Ltv7b33Xgfrlw=;
 b=GLvRD1QWU7jHDApERCxr4Gat2Exc9V3OiYnJo5LTbW1QuzWLKNpTsQOz41ExrPc19y7VWF
 vO19A0scnMMeR8a413yrGeFvanNECZEZNEVBeEkLVQcM6WTycGKfGTJnvVDVVdeMpRfWFG
 aOBkgm3PhmWigAoVozJfpmM7zz6N2xDJKKGmBaTqDgIiBNAeucDw4s2cEFcJd36bx4Pqoy
 /p6z9XOG0pkkdy3JrJsHLCmyVRppusDOBOQbHiqHJeMCB0RdmOM12XMlz8fq2dXp8gb1RE
 CjshSsFLUfGmhaoVF2lCBhnMx1QtkP4SzXGfUBB6N2ecuKo92pkTJ0cMH1KSiQ==
ARC-Seal: i=1; s=dkim; d=freebsd.org; t=1643733554; a=rsa-sha256; cv=none;
 b=cKbsVIc+Bzwbcycz1X0uAYF4WT3WiX261Dz+HxfFTBGOVJbotAFhJnvECh1nydrOc45aXx
 5xP9mZhhfBi+bQM3dDUAboG0glxfmpft852PJ8rFLm7glbhvLxuF9+sJ61mqn/WJzRyM1p
 M+nFLoY2noOl0ZP6rYU2u0M7mBRm8XisR6ViP/aOnjmHA+5xKVknMUDFSLLxZs44hQKH/E
 /mSiKs4FkmGYIwaSFTHiUE14YBaPpNTlYU3YAgIUMJrRbXnvqnTL2ur71KhvRTgWo/J9Ej
 gvFlnv/jcnNUfCObjWxjyC322pRB18LyzUXqwZLXqHVxaV6Ey4OfDotfcGrNDA==
ARC-Authentication-Results: i=1;
	mx1.freebsd.org;
	none
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2610:1c1:1:606c::19:2
 (failed)
Received-SPF: pass client-ip=2610:1c1:1:606c::19:2;
 envelope-from=kevans@freebsd.org; helo=mx2.freebsd.org
X-Spam_score_int: -63
X-Spam_score: -6.4
X-Spam_bar: ------
X-Spam_report: (-6.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.081,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
> Create target.h. This file is intended to be simple and describe basic
> things about the architecture. If something is a basic feature of the
> architecture, it belongs here. Should we need something that's per-BSD
> there will be a target-os.h that will live in the per-bsd directories.
>
> Define regpairs_aligned to reflect whether or not registers are 'paired'
> for 64-bit arguments or not. This will be false for all 64-bit targets,
> and will be true on those architectures that pair (currently just armv7
> and powerpc on FreeBSD 14.x).
>
> Signed-off-by: Warner Losh <imp@bsdimp.com>
> ---
>  bsd-user/arm/target.h    | 21 +++++++++++++++++++++
>  bsd-user/i386/target.h   | 21 +++++++++++++++++++++
>  bsd-user/qemu.h          |  1 +
>  bsd-user/x86_64/target.h | 21 +++++++++++++++++++++
>  4 files changed, 64 insertions(+)
>  create mode 100644 bsd-user/arm/target.h
>  create mode 100644 bsd-user/i386/target.h
>  create mode 100644 bsd-user/x86_64/target.h
>

Reviewed-by: Kyle Evans <kevans@FreeBSD.org>

> diff --git a/bsd-user/arm/target.h b/bsd-user/arm/target.h
> new file mode 100644
> index 00000000000..1f7ee49bfb4
> --- /dev/null
> +++ b/bsd-user/arm/target.h
> @@ -0,0 +1,21 @@
> +/*
> + * Intel general target stuff that's common to all i386 details
> + *
> + * Copyright (c) 2022 M. Warner Losh <imp@bsdimp.com>
> + *
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + */
> +
> +#ifndef TARGET_H
> +#define TARGET_H
> +
> +/*
> + * arm EABI 'lumps' the registers for 64-bit args.
> + */
> +static inline int regpairs_aligned(void *cpu_env)
> +{
> +    return 1;
> +}
> +
> +#endif /* ! TARGET_H */
> +
> diff --git a/bsd-user/i386/target.h b/bsd-user/i386/target.h
> new file mode 100644
> index 00000000000..b0ab477d683
> --- /dev/null
> +++ b/bsd-user/i386/target.h
> @@ -0,0 +1,21 @@
> +/*
> + * Intel general target stuff that's common to all i386 details
> + *
> + * Copyright (c) 2022 M. Warner Losh <imp@bsdimp.com>
> + *
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + */
> +
> +#ifndef TARGET_ARCH_H
> +#define TARGET_ARCH_H
> +
> +/*
> + * i386 doesn't 'lump' the registers for 64-bit args.
> + */
> +static inline int regpairs_aligned(void *cpu_env)
> +{
> +    return 0;
> +}
> +
> +#endif /* ! TARGET_ARCH_H */
> +
> diff --git a/bsd-user/qemu.h b/bsd-user/qemu.h
> index 56042ddbc5d..a9efa807b78 100644
> --- a/bsd-user/qemu.h
> +++ b/bsd-user/qemu.h
> @@ -35,6 +35,7 @@ extern char **environ;
>  #include "target_syscall.h"
>  #include "target_os_vmparam.h"
>  #include "target_os_signal.h"
> +#include "target.h"
>  #include "exec/gdbstub.h"
>
>  /*
> diff --git a/bsd-user/x86_64/target.h b/bsd-user/x86_64/target.h
> new file mode 100644
> index 00000000000..6d3aef8fc49
> --- /dev/null
> +++ b/bsd-user/x86_64/target.h
> @@ -0,0 +1,21 @@
> +/*
> + * Intel general target stuff that's common to all x86_64 details
> + *
> + * Copyright (c) 2022 M. Warner Losh <imp@bsdimp.com>
> + *
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + */
> +
> +#ifndef TARGET_H
> +#define TARGET_H
> +
> +/*
> + * x86 doesn't 'lump' the registers for 64-bit args, all args are 64 bits.
> + */
> +static inline int regpairs_aligned(void *cpu_env)
> +{
> +    return 0;
> +}
> +
> +#endif /* ! TARGET_H */
> +
> --
> 2.33.1
>

