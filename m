Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 25EB22FBA97
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 15:59:27 +0100 (CET)
Received: from localhost ([::1]:60910 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1sTe-00007d-6r
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 09:59:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48982)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l1sSf-0007fV-JW
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 09:58:25 -0500
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531]:38044)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l1sSd-0007XB-OK
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 09:58:25 -0500
Received: by mail-ed1-x531.google.com with SMTP id s11so14580766edd.5
 for <qemu-devel@nongnu.org>; Tue, 19 Jan 2021 06:58:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2i1Cyn0yi8gIVKey1vRJ1gyFDEPIR4LrYwMJnD9QkXo=;
 b=lRAthtXAa+SkURdyutx8c2KXP+wLiFriNJSj1FINbfF92vGYo+l9H2Fa2YHDHd2xDv
 KnZM0DRw10tNlErQfc1g2TSlpmSQ1MmDN1lL2oa3JwWwKIv68mjC8nHCbzyqEK+DetIy
 R6l+foFzlYOg9zHhe05aqdUL/rV46ht4eTU4EjF6SYmiKs9kZIgBPLwkKh1dnckShGPz
 PAidMcBj2R1rG3/yKvsb2gwzowBryeqbI7UsR/IXzGsH12GS4m6z8HebF9V+uYbJFwKZ
 UnU3FAuvZcWk1WSYclSPIufrSFJJoV8ihfYJWyHjLaDid6MvCDWlFZBkMg6vhE36OrU5
 G5AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2i1Cyn0yi8gIVKey1vRJ1gyFDEPIR4LrYwMJnD9QkXo=;
 b=ekZJvBLxBK8ygBboqE58CC9Ja8SC4F30wD7amMpPeT397MRSjbSkz/XwmvN6pawTAA
 w9jeZz+S/1qMjUST5c9XJENjal6six66NJiAKQRY5pEg128yW6kH5CF9wsiHdHrO3A2c
 nnbXBHH9qZajMYgcnvgXbIFUsLJB8UePpt9MP8Ah2fpXQuET+EPSNDIgMiCqOu4HvpdX
 W/RA8R0j19VGmWjwxb2nuHH9dIyPIbaLTTYwUYyv8ZZKYdJ85BVn5IfqFBep096YCidK
 ggs2zJLvn6n/ffKc43xk6AMks9X62h4ek1oANpkyfglRM1l+WizRiMRqBLpZ9HNf0BV1
 4IBg==
X-Gm-Message-State: AOAM533pvM84kPIDCuAFP0i2Zac0I3CAaqL42WpRoO43ODcfQfNDhqvl
 +IOZdH2VTXCq1ynW3vxdkb+EQZH4j08IoAOxgHhXHg==
X-Google-Smtp-Source: ABdhPJxfWCD0/GaHPFkMvFJnhPb3QuOREDtVv9eG676J4OpG8SSd04oDFyr96fLIVWF9e8r82tvmJ3Rl6VPpxWtqpSs=
X-Received: by 2002:aa7:dd12:: with SMTP id i18mr2870549edv.36.1611068302027; 
 Tue, 19 Jan 2021 06:58:22 -0800 (PST)
MIME-Version: 1.0
References: <20210115210456.1053477-1-richard.henderson@linaro.org>
 <20210115210456.1053477-12-richard.henderson@linaro.org>
In-Reply-To: <20210115210456.1053477-12-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 19 Jan 2021 14:58:10 +0000
Message-ID: <CAFEAcA_kpxVK+7eZC+d=63m1Na9O+vwGWhaMc11EZBf2UD2XWw@mail.gmail.com>
Subject: Re: [PATCH v2 11/22] tcg/sparc: Split out target constraints to
 tcg-target-con-str.h
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x531.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 15 Jan 2021 at 21:14, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/sparc/tcg-target-con-str.h | 22 +++++++++++++++++
>  tcg/sparc/tcg-target.h         |  5 +---
>  tcg/sparc/tcg-target.c.inc     | 45 +++++-----------------------------
>  3 files changed, 29 insertions(+), 43 deletions(-)
>  create mode 100644 tcg/sparc/tcg-target-con-str.h
>
> diff --git a/tcg/sparc/tcg-target-con-str.h b/tcg/sparc/tcg-target-con-str.h
> new file mode 100644
> index 0000000000..6dc5b95f33
> --- /dev/null
> +++ b/tcg/sparc/tcg-target-con-str.h
> @@ -0,0 +1,22 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Define Sparc target-specific operand constraints.
> + * Copyright (c) 2021 Linaro
> + */
> +
> +/*
> + * Define constraint letters for register sets:
> + * REGS(letter, register_mask)
> + */
> +REGS('r', 0xffffffff)
> +REGS('R', ALL_64)
> +REGS('s', 0xffffffff & ~RESERVE_QLDST)
> +REGS('S', ALL_64 & ~RESERVE_QLDST)

As with s390, I think an ALL_GENERAL_REGS constant would help here.


> +
> +/*
> + * Define constraint letters for constants:
> + * CONST(letter, TCG_CT_CONST_* bit set)
> + */
> +CONST('I', TCG_CT_CONST_S11)
> +CONST('J', TCG_CT_CONST_S13)
> +CONST('Z', TCG_CT_CONST_ZERO)


> -static const char *target_parse_constraint(TCGArgConstraint *ct,
> -                                           const char *ct_str, TCGType type)
> -{
> -    switch (*ct_str++) {
> -    case 'r':
> -        ct->regs = 0xffffffff;
> -        break;
> -    case 'R':
> -        ct->regs = ALL_64;
> -        break;
> -    case 'A': /* qemu_ld/st address constraint */
> -        ct->regs = TARGET_LONG_BITS == 64 ? ALL_64 : 0xffffffff;
> -    reserve_helpers:
> -        tcg_regset_reset_reg(ct->regs, TCG_REG_O0);
> -        tcg_regset_reset_reg(ct->regs, TCG_REG_O1);
> -        tcg_regset_reset_reg(ct->regs, TCG_REG_O2);
> -        break;

The "A" constraint seems to have vanished in the conversion...

thanks
-- PMM

