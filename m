Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E0392FB9B0
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 15:39:32 +0100 (CET)
Received: from localhost ([::1]:45964 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1sAN-0006LX-Cp
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 09:39:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44284)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l1s9C-0005se-Ub
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 09:38:18 -0500
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b]:41744)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l1s9A-0004P7-LB
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 09:38:18 -0500
Received: by mail-ed1-x52b.google.com with SMTP id bx12so7772427edb.8
 for <qemu-devel@nongnu.org>; Tue, 19 Jan 2021 06:38:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=cssEGXk/HJVCPZEW3Bfd9u7xa2v9/ly7wKqBdc49SZw=;
 b=D09K0RTO0AfTAeP5f+vfH5Z84bBwgwxqDTf79gZKLsNioOiFRjFdLoaKwlG/LolITA
 JQt728gxLmSNfg7CewEU0+f9gV3WJl2cAq9fOK63WAvWdW9F9jdVgpD31JdMIPpa4pwt
 NaNJUS4R5mQQIZtz1Uzo2VB5KDQO81RxMPAOnWWc9I7MlYrwdGPSgHiou3IY3xStClgC
 R7ftj5rMelWCsZJXsxbKuV5dpO9HEyOn/IMtv1LJCTy85ixtIKHWv+UuAMQlX1+PPFRK
 K5yk+v+c9vWvX3XhK1lBARFl8Z8AbH7NatFB0e8DVBazoHPwD7DQYCvEPSV/genQimof
 fSRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cssEGXk/HJVCPZEW3Bfd9u7xa2v9/ly7wKqBdc49SZw=;
 b=gd0UkL7UYabtLJ1e0C+Fj8MULdpSxU2gvA0DaEapD7STfEoxXzodDAMQX9xZ+ZRX7j
 D7o9z6Qtxsru75g83aOd/UYDngPUssAhjTZBOqAgywu6x4xtEOaH+k+xv1FOwnvCX+c4
 qYGbFwwBy/0T1ZC4Dhoxp7PJUUyTVE4pjKxhc6nn/2IUAyF4qqsxdr6Ro3cFTpA7Jgwh
 DPLs2wXQEafwDesskzozMm3mJC6pCFBfFFhsZmK+Bj6wn+u96O/vdVRtDaYt85oJ0K7o
 MpARZrJkl8JGsR1JJ9YharQo4V48JvsCWlAYMgKo4uQJWLpEcTdYA64jIZgkXruW9U8N
 gwUA==
X-Gm-Message-State: AOAM531MBYkESRz8m8VdvOunbcTaSnkDM4h+haW+JGtLDsKRXjQwgtZa
 IYwLcVTkQTSL9jQOYfAe/eNNYEdT1H4t8/hdOMK9mg==
X-Google-Smtp-Source: ABdhPJz0Nl0Rfcjp6C1kGHxbhwASEZpZ9OKb+uzcH+EwAXos6gCOJlxI1kr2jiJcMQ2GX9wav9ed5NJIA8y8PlhcG1A=
X-Received: by 2002:a05:6402:1a55:: with SMTP id
 bf21mr3773524edb.146.1611067094064; 
 Tue, 19 Jan 2021 06:38:14 -0800 (PST)
MIME-Version: 1.0
References: <20210115210456.1053477-1-richard.henderson@linaro.org>
 <20210115210456.1053477-4-richard.henderson@linaro.org>
In-Reply-To: <20210115210456.1053477-4-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 19 Jan 2021 14:38:03 +0000
Message-ID: <CAFEAcA9pnbrQYihP8NkajM0LHYzciuoO9xNmRmCbBaqB+WV5Qg@mail.gmail.com>
Subject: Re: [PATCH v2 03/22] tcg/i386: Split out target constraints to
 tcg-target-con-str.h
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52b.google.com
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

On Fri, 15 Jan 2021 at 21:08, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> This eliminates the target-specific function target_parse_constraint
> and folds it into the single caller, process_op_defs.  Since this is
> done directly into the switch statement, duplicates are compilation
> errors rather than silently ignored at runtime.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/i386/tcg-target-con-str.h |  33 +++++++++++
>  tcg/i386/tcg-target.h         |   1 +
>  tcg/tcg.c                     |  33 +++++++++--
>  tcg/i386/tcg-target.c.inc     | 101 ++++++----------------------------
>  4 files changed, 78 insertions(+), 90 deletions(-)
>  create mode 100644 tcg/i386/tcg-target-con-str.h

> +REGS('r', ALL_GENERAL_REGS)
> +REGS('x', ALL_VECTOR_REGS)
> +REGS('q', ALL_BYTEL_REGS)     /* regs that can be used as a byte operand */
> +REGS('Q', ALL_BYTEH_REGS)     /* regs with a second byte (e.g. %ah) */
> +REGS('L', ALL_GENERAL_REGS & ~SOFTMMU_RESERVE_REGS)  /* qemu_ld/st */
> +REGS('s', ALL_BYTEL_REGS & ~SOFTMMU_RESERVE_REGS)    /* qemu_st8_i32 data */

In the new setup we define 's' as the BYTEL regs minus the
softmmu reserved ones...

> diff --git a/tcg/i386/tcg-target.c.inc b/tcg/i386/tcg-target.c.inc
> index 74637f654a..c4b0b6bfca 100644
> --- a/tcg/i386/tcg-target.c.inc
> +++ b/tcg/i386/tcg-target.c.inc
> @@ -132,6 +132,22 @@ static const int tcg_target_call_oarg_regs[] = {
>  # define TCG_REG_L1 TCG_REG_EDX
>  #endif
>
> +#define ALL_BYTEH_REGS         0x0000000fu
> +#if TCG_TARGET_REG_BITS == 64
> +# define ALL_GENERAL_REGS      0x0000ffffu
> +# define ALL_VECTOR_REGS       0xffff0000u
> +# define ALL_BYTEL_REGS        ALL_GENERAL_REGS
> +#else
> +# define ALL_GENERAL_REGS      0x000000ffu
> +# define ALL_VECTOR_REGS       0x00ff0000u
> +# define ALL_BYTEL_REGS        ALL_BYTEH_REGS
> +#endif
> +#ifdef CONFIG_SOFTMMU
> +# define SOFTMMU_RESERVE_REGS  ((1 << TCG_REG_L0) | (1 << TCG_REG_L1))
> +#else
> +# define SOFTMMU_RESERVE_REGS  0
> +#endif

...which (ignoring L0/L1) is going to be 0xffff on x86-64, and 0xf on i386.

> -    case 's':
> -        /* qemu_st8_i32 data constraint */
> -        ct->regs = 0xf;
> -#ifdef CONFIG_SOFTMMU
> -        tcg_regset_reset_reg(ct->regs, TCG_REG_L0);
> -        tcg_regset_reset_reg(ct->regs, TCG_REG_L1);
> -#endif
> -        break;

But in the old code the 's' constraint is 0xf for both
x86-64 and i386. To match that I think that the new constraint
should use BYTEH, not BYTEL:
REGS('s', ALL_BYTEH_REGS & ~SOFTMMU_RESERVE_REGS)

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

