Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 16F73518A1D
	for <lists+qemu-devel@lfdr.de>; Tue,  3 May 2022 18:37:53 +0200 (CEST)
Received: from localhost ([::1]:36646 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nlvX5-0007kT-QK
	for lists+qemu-devel@lfdr.de; Tue, 03 May 2022 12:37:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48584)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nlvUE-0006I9-8N
 for qemu-devel@nongnu.org; Tue, 03 May 2022 12:34:54 -0400
Received: from mail-yb1-xb34.google.com ([2607:f8b0:4864:20::b34]:37428)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nlvUC-0001dz-CN
 for qemu-devel@nongnu.org; Tue, 03 May 2022 12:34:53 -0400
Received: by mail-yb1-xb34.google.com with SMTP id h10so2996629ybc.4
 for <qemu-devel@nongnu.org>; Tue, 03 May 2022 09:34:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=R4/onwwLQiFK8xPqZVzZXEpm/wAxnFgV8jkwdqlKH64=;
 b=m2U1ijoJkolOvb3QZ7ljH8QrXpR8KBJIE0aAEA6gSTq6q2HzgccnvGhVIxsZ6fF9oe
 xKbGua+0bZJouqy3AKxEKmMxsdHhl/vwhKgXjmJsXjT1dJYF40mS+GMD++su1SmP0EaE
 qH0lybBTWR0I0x9hMb0a8pE0hIps2zMJf2f29oohHYLZZJ6tBiYKaDjWf35DlqMQbzH5
 pR/jWXGaG1hUgdln0chRwaOiYZgAdwcrOJRSEwgRip0zVSB7JlxTbuQ/CiwwG2+iXUqS
 JR1zplh7v85USenyyX1bXVH/1RKcRMFu7lUTniJwjcYDsd2sdesLR//+feVplS6uI3QY
 bvdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=R4/onwwLQiFK8xPqZVzZXEpm/wAxnFgV8jkwdqlKH64=;
 b=Y6zROQHVahqPdpSr5JOE/jE+iX4JZwwf4u0eXFLT6t86rXZ5cjjuZELzAazjVR1o5p
 p3R36A4Eb7OjgMBy4hsDQ/DzTbSLq2RaKIx6aumB4VaSinpWVI17450MV23TD2cKbET7
 sJqTqk0FuIBOthFijLMRJ5EUrNz5OgOaRIC61LxYHG+U6lqlyPOkXVZF4LsR7Wt5W7ax
 xFSsVP5YkGHTNSz7QD2/pRcYX1ZuW11QYFKjRZdSgkjwANLQkJ4YsmGoUQz063kiecOG
 TYDv6PCsn5JITem2pk2pbEtX+mG4Zl872BPv6yfdN7K/CClJrejya7fr5DuAjpXLeGwN
 jRAw==
X-Gm-Message-State: AOAM5326KFki7WNHvLKczWklgiYXpjNrXmndl9MUK0YYPFDXIU9zs6rz
 JdkrwRyINWRV3j+Z+J789XIylobrhtsX2kQOwvheUw==
X-Google-Smtp-Source: ABdhPJyZGDR8ZE/SfB0zQLQcVSITZqYBY2UhjXXoN5wABp/TcOwABTkrBb167yrnMTJzyCOzFklcZN3j28oSQwpTrbw=
X-Received: by 2002:a5b:6c1:0:b0:633:b5c7:b9b7 with SMTP id
 r1-20020a5b06c1000000b00633b5c7b9b7mr14604291ybq.67.1651595691279; Tue, 03
 May 2022 09:34:51 -0700 (PDT)
MIME-Version: 1.0
References: <20220501055028.646596-1-richard.henderson@linaro.org>
 <20220501055028.646596-21-richard.henderson@linaro.org>
In-Reply-To: <20220501055028.646596-21-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 3 May 2022 17:34:40 +0100
Message-ID: <CAFEAcA_i_+MrxapQ821zWBwO7QKs2k=06xQRs9s6ojRB2CyxsA@mail.gmail.com>
Subject: Re: [PATCH v4 20/45] target/arm: Handle cpreg registration for
 missing EL
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b34;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb34.google.com
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

On Sun, 1 May 2022 at 07:21, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> More gracefully handle cpregs when EL2 and/or EL3 are missing.
> If the reg is entirely inaccessible, do not register it at all.
> If the reg is for EL2, and EL3 is present but EL2 is not,
> either discard, squash to const, or keep unchanged.
>
> Per rule RJFFP, mark the 4 aarch32 hypervisor access registers
> with ARM_CP_EL3_NO_EL2_KEEP, and mark all of the EL2 address
> translation and tlb invalidation "regs" ARM_CP_EL3_NO_EL2_UNDEF.
>
> This will simplify cpreg registration for conditional arm features.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
> v4: Add ARM_CP_EL3_NO_EL2_{UNDEF,KEEP}.
> ---
>  target/arm/cpregs.h |   9 +++
>  target/arm/helper.c | 163 ++++++++++++++++++++++++++++++--------------
>  2 files changed, 120 insertions(+), 52 deletions(-)
>
> diff --git a/target/arm/cpregs.h b/target/arm/cpregs.h
> index 73984549d2..9ed94d7121 100644
> --- a/target/arm/cpregs.h
> +++ b/target/arm/cpregs.h
> @@ -102,6 +102,15 @@ enum {
>      ARM_CP_SVE                   = 1 << 14,
>      /* Flag: Do not expose in gdb sysreg xml. */
>      ARM_CP_NO_GDB                = 1 << 15,
> +    /*
> +     * Flags: If EL3 but not EL2...
> +     *   - UNDEF: discard the cpreg,
> +     *   -  KEEP: retain the cpreg as is,
> +     *   -  else: set CONST on the cpreg.
> +     * See rule RJFFP in section D1.1.3 of DDI0487H.a.
> +     */
> +    ARM_CP_EL3_NO_EL2_UNDEF      = 1 << 16,
> +    ARM_CP_EL3_NO_EL2_KEEP       = 1 << 17,
>  };

"set CONST on the cpreg" is what the code does, but it's not
what the architecture wants. In particular, if the EL2 cpreg defines
a non-zero resetvalue then the EL3-no-EL2 CPU will get a
"reads as constant that value" rather than "reads as zero".
CNTHCTL_EL2 and MDCR_EL2 are examples of this.

thanks
-- PMM

