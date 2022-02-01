Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 68CC54A65B0
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Feb 2022 21:31:43 +0100 (CET)
Received: from localhost ([::1]:36328 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEzoQ-0006cS-EL
	for lists+qemu-devel@lfdr.de; Tue, 01 Feb 2022 15:31:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47886)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kevans@freebsd.org>)
 id 1nEwJg-0007uD-G4
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 11:47:40 -0500
Received: from mx2.freebsd.org ([96.47.72.81]:55080)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kevans@freebsd.org>)
 id 1nEwJe-0002SJ-MG
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 11:47:40 -0500
Received: from mx1.freebsd.org (mx1.freebsd.org [IPv6:2610:1c1:1:606c::19:1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits)
 client-signature RSA-PSS (4096 bits))
 (Client CN "mx1.freebsd.org", Issuer "R3" (verified OK))
 by mx2.freebsd.org (Postfix) with ESMTPS id A990682723
 for <qemu-devel@nongnu.org>; Tue,  1 Feb 2022 16:47:37 +0000 (UTC)
 (envelope-from kevans@freebsd.org)
Received: from smtp.freebsd.org (smtp.freebsd.org
 [IPv6:2610:1c1:1:606c::24b:4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
 client-signature RSA-PSS (4096 bits) client-digest SHA256)
 (Client CN "smtp.freebsd.org", Issuer "R3" (verified OK))
 by mx1.freebsd.org (Postfix) with ESMTPS id 4Jp9pK42Zjz4hwZ
 for <qemu-devel@nongnu.org>; Tue,  1 Feb 2022 16:47:37 +0000 (UTC)
 (envelope-from kevans@freebsd.org)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=freebsd.org; s=dkim;
 t=1643734057;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=XyrdoACIgR4vhUG0xaBjXGepcIglST6Tq0lyxDPXpiA=;
 b=INi9f6Pzl2j99j6uHUydfooeLToBU24p/2xrzv722qaw66XyG+jjlGduSUsaqbfhzdsDHJ
 8Mya0T1fmF8X6BjZdNQujI+FykQMkQNE+jApIEpDqv3F1sNWurw6FINeczeaY+sMcmM9Gs
 L/WsbaE/32UpTwB8DdfYNyzx/zs/ZkW0xxt8LqaZ1KODz9qH87ShvVnCEFVdyBoQHjunPm
 tovhWaksMkXD0IwTF7y2FrMeumY6x1hiI1I7lyd0FXXjCKDykH5fiwuqVW/OFGOgJ7LvbU
 N7m8sdC+0WrAvHjUpIKahcxHRYmw3fyGnIKgU0q23AdVPRR3+MCOlZUS2+p0CQ==
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com
 [209.85.219.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (Client CN "smtp.gmail.com", Issuer "GTS CA 1D4" (verified OK))
 (Authenticated sender: kevans)
 by smtp.freebsd.org (Postfix) with ESMTPSA id 6B9A52EBDC
 for <qemu-devel@nongnu.org>; Tue,  1 Feb 2022 16:47:37 +0000 (UTC)
 (envelope-from kevans@freebsd.org)
Received: by mail-qv1-f51.google.com with SMTP id b4so11679734qvf.0
 for <qemu-devel@nongnu.org>; Tue, 01 Feb 2022 08:47:37 -0800 (PST)
X-Gm-Message-State: AOAM532nmBYlDJByYlfOjW4AbsQQxBzKb8CrXMOM+zK4T+9tfOdZIPXH
 89O9nrInE9dFEQ6XOqc8LlWTMtqb9uVu2mhfSDc=
X-Google-Smtp-Source: ABdhPJyr2nK0bOUA51DA5/Uem1qiVp/OTpP5SDhD9aFSsf9thzsHzqdXwlGKmdS2hRyap1O3XSanlCpbQImDPFSMHS4=
X-Received: by 2002:a05:6214:1cce:: with SMTP id
 g14mr3956062qvd.108.1643734057101; 
 Tue, 01 Feb 2022 08:47:37 -0800 (PST)
MIME-Version: 1.0
References: <20220201111455.52511-1-imp@bsdimp.com>
 <20220201111455.52511-14-imp@bsdimp.com>
In-Reply-To: <20220201111455.52511-14-imp@bsdimp.com>
From: Kyle Evans <kevans@freebsd.org>
Date: Tue, 1 Feb 2022 10:47:25 -0600
X-Gmail-Original-Message-ID: <CACNAnaG6O2+46XzxgU+xgWP1Z6AzJ38YXojnkTzF-U3sz0603g@mail.gmail.com>
Message-ID: <CACNAnaG6O2+46XzxgU+xgWP1Z6AzJ38YXojnkTzF-U3sz0603g@mail.gmail.com>
Subject: Re: [PATCH 13/22] bsd-user/bsd-file.h: Implementation details for the
 filesystem calls
To: Warner Losh <imp@bsdimp.com>
Content-Type: text/plain; charset="UTF-8"
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=freebsd.org;
 s=dkim; t=1643734057;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=XyrdoACIgR4vhUG0xaBjXGepcIglST6Tq0lyxDPXpiA=;
 b=ZBZbESq3ZNHv2an2lumMESvwi7m8UZwztcFcjWcoeOto5PbSDdVEIRwh8R7nmzgpUVGuOC
 GH0CbOd8vN2HxF/j29lDE0DhgKEYUN4PmkrO8vmcnrvejzl65mfSM9wbFTcRjqGBclcm4c
 i+H9GMX/1acUiOitdmj5pGdGYPjYDvlKrXkN3+aurofiBumpt0FvXvpBBKEJvpTtRe352d
 JNGSUl5KESIYawZPUKxFxuJfTUiB8lDNPRznyqTSwetJ0GfDVpg+OZTcSSATRkNlp7eEHA
 QunABYkhPrjXCoVldghdE/y+1s7Lw/jHsKuG3s9FMnHVNQEHwcvFqZGxqU98CA==
ARC-Seal: i=1; s=dkim; d=freebsd.org; t=1643734057; a=rsa-sha256; cv=none;
 b=cUbt0P6Ezs2wcp90wKCgOb1air+vOQRoVJNqzne6vUMa8aX44jtV//c/96ijm9uOkG69iQ
 uaC42x7s6hgetOYM1yhBbncqsBbTZLDLOJk84TuQo/qqI9ZvZ+HqIz/d4r7ZIHAn+9MTAt
 RA1z9uMmF1/x1ptb0dgtZVO4qQfLLzkX9QGRlSmaAVvgMF3KmzsP6LURCeQZNfxiz0iDuq
 yOiq9LuWsz/8sSQjPnLYLJ8lqMjtYVRtjjogG1AIXkozv8xR9Z1gCM/CahViJFc2r/4iEm
 9Tk1C0Sl1pBHOBxbyReluSH09PieKubsytvAw0yfL3O2KOJty9WSPmdKEJ2g4g==
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
> An include file that pulls in all the definitions needed for the file
> related system calls. This also includes the host definitions to
> implement the system calls and some helper routines to lock/unlock
> different aspects of the system call arguments.
>
> Signed-off-by: Warner Losh <imp@bsdimp.com>
> ---
>  bsd-user/bsd-file.h           | 39 +++++++++++++++++++++++++++++++++++
>  bsd-user/freebsd/os-syscall.c |  2 ++
>  2 files changed, 41 insertions(+)
>  create mode 100644 bsd-user/bsd-file.h
>

Reviewed-by: Kyle Evans <kevans@FreeBSD.org>

> diff --git a/bsd-user/bsd-file.h b/bsd-user/bsd-file.h
> new file mode 100644
> index 00000000000..2f743db38e1
> --- /dev/null
> +++ b/bsd-user/bsd-file.h
> @@ -0,0 +1,39 @@
> +/*
> + *  file related system call shims and definitions
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
> +#ifndef BSD_FILE_H_
> +#define BSD_FILE_H_
> +
> +#include <sys/types.h>
> +#include <sys/mount.h>
> +#include <sys/uio.h>
> +#include <fcntl.h>
> +#include <poll.h>
> +#include <stdio.h>
> +#include <stdlib.h>
> +#include <unistd.h>
> +
> +#include "qemu/path.h"
> +
> +extern struct iovec *lock_iovec(int type, abi_ulong target_addr, int count,
> +        int copy);
> +extern void unlock_iovec(struct iovec *vec, abi_ulong target_addr, int count,
> +        int copy);
> +
> +#endif /* !BSD_FILE_H_ */
> diff --git a/bsd-user/freebsd/os-syscall.c b/bsd-user/freebsd/os-syscall.c
> index 2e84cf350b1..060134a9ecd 100644
> --- a/bsd-user/freebsd/os-syscall.c
> +++ b/bsd-user/freebsd/os-syscall.c
> @@ -40,6 +40,8 @@
>  #include "signal-common.h"
>  #include "user/syscall-trace.h"
>
> +#include "bsd-file.h"
> +
>  void target_set_brk(abi_ulong new_brk)
>  {
>  }
> --
> 2.33.1
>

