Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CA49531117
	for <lists+qemu-devel@lfdr.de>; Mon, 23 May 2022 15:33:39 +0200 (CEST)
Received: from localhost ([::1]:41258 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nt8Bl-0000Fz-Su
	for lists+qemu-devel@lfdr.de; Mon, 23 May 2022 09:33:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59002)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nt89B-0007j5-VI
 for qemu-devel@nongnu.org; Mon, 23 May 2022 09:30:58 -0400
Received: from mail-yw1-x1133.google.com ([2607:f8b0:4864:20::1133]:33596)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nt899-0007vR-0V
 for qemu-devel@nongnu.org; Mon, 23 May 2022 09:30:57 -0400
Received: by mail-yw1-x1133.google.com with SMTP id
 00721157ae682-2fffcc66fe2so22252797b3.0
 for <qemu-devel@nongnu.org>; Mon, 23 May 2022 06:30:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=l6VqFaDsj1nnvTvtnSEweapb4m7Sbn88PHc9V5tOg9U=;
 b=ppYVcWMEEZZXuPjKwb1GLptdaHB6nWZRzrIsQaqxxcKujVxomooG830gliU6lWF8LU
 vlBjWJ/LQloFiAl4qQN1um13YiJF94sDfiSXsi3dryXblK29Ssnn6F2gu1efse3/izcR
 lWSL2Rvf7eNLeoLMI2pjUNGvFCr9a7aBFsBWC/m9/Gt1BGiQvB3K/P9Vug5u3uBTmKt3
 mculM5Uy+ba3rvmiWvv5pajM2OGhCERIVr8GqUCWgJEBEOe83VwsQPxbddojpZrnAzIf
 W2amRiGsFG/oleLyrot86vV1jGF2PX3xZfoQUwCEB4DvbyYkBeS6EKy4CRCzw1+QScFo
 ZvgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=l6VqFaDsj1nnvTvtnSEweapb4m7Sbn88PHc9V5tOg9U=;
 b=R1e5LbQQa2XUfXEtkboNp6f7DU9UY4cIAjpE0TGKL0nCEwAANIobKJOIILJj1o98Be
 adLQrG6VXnz++b/TySsgRftiQaLtX9odzryVUOdjfiwhxVmgKCoSGdxXWKBXHBTs1/ZK
 5+5WB4Jlj/CIL1phS9pEkqaHL1havHUYvu9rmGvxeWunhF2xFLDINX7oAjoJ6nfIZzxV
 M5G3PXkzS0GT8BcVifl2zF3Dyf+nDF4atj9Bu7mcyKltFwoXzZ8//g6IX0UE2yOQgxYZ
 7m2aoTANoTKbnhutqm1frrW0cY9AQ+bDtljQzYtpKFZ1Whe4m6J8yhtd2NTgkW3d01z3
 y2Ng==
X-Gm-Message-State: AOAM530AFTwmuTqm5QFyvw3UfNI8VEjVqjMAn4/qmdkBgxuSmKMQoPrC
 H81sVksoBxgm3VHQOKzFpgS4Ro21LGMMN/+CsI+95g==
X-Google-Smtp-Source: ABdhPJyQEYv26POojwRIDk8rUCd5IZ0gwK/pDIb8aYy/Jpg6DJ5+3TP/gznNawi6X/zKACirGHHW8vK+5kxBpOwvbLA=
X-Received: by 2002:a81:6589:0:b0:2ff:e11d:3fb3 with SMTP id
 z131-20020a816589000000b002ffe11d3fb3mr6181894ywb.10.1653312653685; Mon, 23
 May 2022 06:30:53 -0700 (PDT)
MIME-Version: 1.0
References: <20220521000400.454525-1-richard.henderson@linaro.org>
 <20220521000400.454525-24-richard.henderson@linaro.org>
In-Reply-To: <20220521000400.454525-24-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 23 May 2022 14:30:42 +0100
Message-ID: <CAFEAcA8ENQo8258jw=CeBG6Qamk49_zQ9RQjuwd4ZfymD=cV-w@mail.gmail.com>
Subject: Re: [PATCH v3 23/49] semihosting: Split out semihost_sys_open
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, alex.bennee@linaro.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1133;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1133.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, 21 May 2022 at 01:04, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Split out the non-ARM specific portions of SYS_OPEN to a
> reusable function.  This handles gdb and host file i/o.
>
> Add helpers to validate the length of the filename string.
> Prepare for usage by other semihosting by allowing the
> filename length parameter to be 0, and calling strlen.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>


> diff --git a/semihosting/arm-compat-semi.c b/semihosting/arm-compat-semi.c
> index 7a7468799f..cc008d0338 100644
> --- a/semihosting/arm-compat-semi.c
> +++ b/semihosting/arm-compat-semi.c
> @@ -35,9 +35,10 @@
>  #include "semihosting/semihost.h"
>  #include "semihosting/console.h"
>  #include "semihosting/common-semi.h"
> -#include "semihosting/guestfd.h"
>  #include "qemu/timer.h"
>  #include "exec/gdbstub.h"
> +#include "semihosting/guestfd.h"
> +#include "semihosting/syscalls.h"

Can we keep all the semihosting/ include lines together?

> diff --git a/semihosting/guestfd.c b/semihosting/guestfd.c
> index b6405f5663..7ac2e147a8 100644
> --- a/semihosting/guestfd.c
> +++ b/semihosting/guestfd.c
> @@ -11,6 +11,11 @@
>  #include "qemu/osdep.h"
>  #include "exec/gdbstub.h"
>  #include "semihosting/guestfd.h"
> +#ifdef CONFIG_USER_ONLY
> +#include "qemu.h"
> +#else
> +#include "semihosting/softmmu-uaccess.h"
> +#endif

Does this need to be in this patch, or should it be somewhere else?

> +static void host_open(CPUState *cs, gdb_syscall_complete_cb complete,
> +                      target_ulong fname, target_ulong fname_len,
> +                      int gdb_flags, int mode)
> +{
> +    CPUArchState *env G_GNUC_UNUSED = cs->env_ptr;
> +    char *p;
> +    int ret, host_flags;
> +
> +    ret = validate_lock_user_string(&p, cs, fname, fname_len);
> +    if (ret < 0) {
> +        complete(cs, -1, -ret);
> +        return;
> +    }
> +
> +    if (gdb_flags & GDB_O_WRONLY) {
> +        host_flags = O_WRONLY;
> +    } else if (gdb_flags & GDB_O_RDWR) {
> +        host_flags = O_RDWR;
> +    } else {
> +        host_flags = O_RDONLY;
> +    }
> +    if (gdb_flags & GDB_O_CREAT) {
> +        host_flags |= O_CREAT;
> +    }
> +    if (gdb_flags & GDB_O_TRUNC) {
> +        host_flags |= O_TRUNC;
> +    }
> +    if (gdb_flags & GDB_O_EXCL) {
> +        host_flags |= O_EXCL;
> +    }
> +
> +    ret = open(p, host_flags, mode);
> +    if (ret < 0) {
> +        complete(cs, -1, errno_for_gdb());

So this changes the errno values in the not-gdb case from being
host errno values to the gdb protocol ones. Errnos in Arm semihosting
are an unspecified mess, so maybe we can get away with changing
the existing QEMU behaviour; but I'd rather we didn't do it
one syscall at a time in a big refactoring series if we can avoid it.

> +    } else {
> +        int guestfd = alloc_guestfd();
> +        associate_guestfd(guestfd, ret);
> +        complete(cs, guestfd, 0);
> +    }
> +    unlock_user(p, fname, 0);
> +}

thanks
-- PMM

