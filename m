Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CEB69461BF1
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Nov 2021 17:41:55 +0100 (CET)
Received: from localhost ([::1]:43762 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mrjj0-0005b5-Er
	for lists+qemu-devel@lfdr.de; Mon, 29 Nov 2021 11:41:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48208)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mrjhR-0004pj-Ai
 for qemu-devel@nongnu.org; Mon, 29 Nov 2021 11:40:17 -0500
Received: from [2a00:1450:4864:20::32d] (port=35826
 helo=mail-wm1-x32d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mrjhP-0004yD-Qa
 for qemu-devel@nongnu.org; Mon, 29 Nov 2021 11:40:17 -0500
Received: by mail-wm1-x32d.google.com with SMTP id
 77-20020a1c0450000000b0033123de3425so17388579wme.0
 for <qemu-devel@nongnu.org>; Mon, 29 Nov 2021 08:40:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rZktKS/eKvfkBOXRPsrxx/+Lth/dEWNjkBEwor/Uvp8=;
 b=lHD4H/Kl8oJa39ijZCqAC1ZDDaxfSuBLsQMjMizIf9ie3eHlaDjgPQ/X9NfoHXSxoA
 FSnca5AyOtKUvmDxGO9zMKUmzM9c6X2H+CJmR4TorvX+uL0wQjcmf4ZBspKzGkqHk9wM
 W7LqLwsT+4YqDv+ove6rN02HhbYUekH0f5p0RUvdAZ7rqkENPzVaRRg6Y6C6ZYy9Q9xq
 K8Sj4fMJj1it2FKgJxZcZPkxWxyOkMkiIxj9Ps5QATVAmLOosyulgqPP1OVRGnFOjbAV
 8Nf3okeT8uYNeZ/heoavVugfyfPnwkvzEGrQ7vj2RBtizRoxNE6gtDrh30jlMGqINktZ
 pWoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rZktKS/eKvfkBOXRPsrxx/+Lth/dEWNjkBEwor/Uvp8=;
 b=pL0ghRcwchW5InkbXVkp71cX8JjoBtIgJIjl1lcX4ME8/RhQjjTIyeBoYpX7a+3F7h
 5jVF7sB4vhmkV5PBPn5t7Lk8GcQdgHPtrWWSFn0waTjvIQB8nAHOgwAEGFo8ja/vsioT
 AkDnnt6jSTF3mZzkMuDT/Q17ncg2GZhMTLchtZXlK6G+W/TnmAWDEGZtmZ2Vd/OPdKd6
 PhU3T4CtjPNyTABG1lNwldsrXlYeomehWdmtcs35eBIDTB38saKUKofUsfmxPw2YLPE+
 xbQrhp/wBXiT3qD9nZLzKUK+AhlmGk6lWQGYy54rYl9jnmjobQiwMKho9IvIja6yBeAg
 HfOQ==
X-Gm-Message-State: AOAM5306gU4GrrJ3ex4vMOggY0XKbbddBa9x84ta1SfHf6bvLJXIq3g+
 NlSua3x6GBC+VIfBy32YBX6EHpYi2JrW0cqnhPBXmg==
X-Google-Smtp-Source: ABdhPJxIFp4bqtF1HHD+7myJUPcca6LVdLlP9q9dX/41OM4LSUZEFoLt31DthC3SF3kKCOw9TiS9jvBHzNe3jt/Hfq8=
X-Received: by 2002:a05:600c:3486:: with SMTP id
 a6mr38160614wmq.32.1638204014414; 
 Mon, 29 Nov 2021 08:40:14 -0800 (PST)
MIME-Version: 1.0
References: <20211123173759.1383510-1-richard.henderson@linaro.org>
 <20211123173759.1383510-5-richard.henderson@linaro.org>
In-Reply-To: <20211123173759.1383510-5-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 29 Nov 2021 16:40:03 +0000
Message-ID: <CAFEAcA9F772qY4GBvqUmVcd=2o1bFQ7VFFw5AmyFnugfctBxjw@mail.gmail.com>
Subject: Re: [PATCH v6 04/16] linux-user/host/mips: Add safe-syscall.inc.S
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32d
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-devel@nongnu.org, imp@bsdimp.com, Laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 23 Nov 2021 at 17:44, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  linux-user/host/mips/hostdep.h          |   3 +
>  linux-user/host/mips/safe-syscall.inc.S | 123 ++++++++++++++++++++++++
>  2 files changed, 126 insertions(+)
>  create mode 100644 linux-user/host/mips/safe-syscall.inc.S


> +LEAF(safe_syscall_base)
> +        .cfi_startproc
> +#if _MIPS_SIM == _ABIO32
> +        /*
> +         * The syscall calling convention is nearly the same as C:
> +         * we enter with a0 == &signal_pending
> +         *               a1 == syscall number
> +         *               a2, a3, stack == syscall arguments
> +         *               and return the result in a0
> +         * and the syscall instruction needs
> +         *               v0 == syscall number
> +         *               a0 ... a3, stack == syscall arguments
> +         *               and returns the result in v0
> +         * Shuffle everything around appropriately.
> +         */
> +        move    t0, a0          /* signal_pending pointer */
> +        move    v0, a1          /* syscall number */
> +        move    a0, a2          /* syscall arguments */
> +        move    a1, a3
> +        lw      a2, 16(sp)
> +        lw      a3, 20(sp)
> +        lw      t4, 24(sp)
> +        lw      t5, 28(sp)
> +        lw      t6, 32(sp)
> +        lw      t7, 40(sp)
> +        sw      t4, 16(sp)
> +        sw      t5, 20(sp)
> +        sw      t6, 24(sp)
> +        sw      t7, 28(sp)

This is a varargs call, so (unless I'm confused, which is
quite possible) the caller will only allocate enough stack
space for the arguments we're actually passed, right? That
means that unless the syscall actually has 3 or more arguments
the memory at 16(sp) will be whatever the caller had on the
stack above the argument-passing area, and we can't write to
it. I think we need to actually move sp down here so we have
some space we know we can scribble on.

-- PMM

