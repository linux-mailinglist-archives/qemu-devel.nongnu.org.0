Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CCCA12F883D
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 23:17:24 +0100 (CET)
Received: from localhost ([::1]:46000 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0XPH-0005Xr-U2
	for lists+qemu-devel@lfdr.de; Fri, 15 Jan 2021 17:17:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45458)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1l0XML-00045v-Gb
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 17:14:21 -0500
Received: from mail-io1-xd31.google.com ([2607:f8b0:4864:20::d31]:35442)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1l0XMJ-0001xU-Sa
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 17:14:21 -0500
Received: by mail-io1-xd31.google.com with SMTP id y19so21137600iov.2
 for <qemu-devel@nongnu.org>; Fri, 15 Jan 2021 14:14:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=nLW8JmWm0xb6VUaAjVFEGfRA3pIb+YDZkOQfF9bmUGQ=;
 b=BYI6aMuVXQxl9XSdl0iXxtyHYji2SoD9/tZmL1E4CbspvJxteCv7v/4t/kMKhThvvr
 uuP0QdOPS7pLq9Z+4/cwGHwoXatLjbtTgPS2IF5143EjAhG8bPA1IuV12baQYGs4QOOQ
 g6oyIma6Rq4oqdLYLw0fpoUvZVqdQFFTwJdM7RnKPyi/b5Z6WuqlEh8lGueypnVpGw2R
 P5nAX2efXlUUeNvk/LSEKur0wQdaBJDKPxZCQ2fd1H5vCdEEncfcRCYM2L4gJcb4AAgd
 RI0nZSlaZzeqdPWgr3q8vy/IxiJ7JUNI434iFVLYdqU0PCsfkxLHpChiq7rd3qwLJokt
 owow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nLW8JmWm0xb6VUaAjVFEGfRA3pIb+YDZkOQfF9bmUGQ=;
 b=LZ+DHvudmHZNzR2iVB7BoPPdrVGKX+hsAGXUWLppJ1MUJoiCg2hAWJfjJV2XHnSkIz
 JvWfozg+S+NCmnK8vadMgEo3mEvS7PRrlpTQ8hHJ6kQAggMNjBe8U1OjUtgrasvjiPz0
 bb18k+/jZvOqgNP6ibEgeAT3R9d06796zOKUw3atUCJPP7lTmXGkK8937VIaLZTpCnlD
 5xKzP4thCv7dQEkDqeUWejyDY5k2cvs0RFC6lfTs3g0VVSsfYoZ2Pa5jOv1LfVeNgax2
 CVmXZ/m8aHW+dqyj27SZpO4VAcDIlOUzFHDoR/i9DnOmSXGdf3CknLBw+ravqHKRP3l5
 RIew==
X-Gm-Message-State: AOAM532w93emHFZqfA7fDpUIosiIv5Km+bc+p6etyDqcHJtvhfNxcDWH
 uquC8024ga0GV9uPzxDnhvCem6ynDVLlJnWoNHg=
X-Google-Smtp-Source: ABdhPJzlNXkl3FsmS4AmahJ957ZgBoykBmS7ePjcsLPpvQyrZaZGj1cPOqlHjhFKvaYcbXYHUgcUE9q8sflWRhHHlBA=
X-Received: by 2002:a92:8455:: with SMTP id l82mr601316ild.40.1610748858786;
 Fri, 15 Jan 2021 14:14:18 -0800 (PST)
MIME-Version: 1.0
References: <20210115210456.1053477-1-richard.henderson@linaro.org>
 <20210115210456.1053477-10-richard.henderson@linaro.org>
In-Reply-To: <20210115210456.1053477-10-richard.henderson@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 15 Jan 2021 14:13:52 -0800
Message-ID: <CAKmqyKN5CXyHTE22rB+TA57UxZbT1pD7f9QJLyWXyZ11crg1fA@mail.gmail.com>
Subject: Re: [PATCH v2 09/22] tcg/riscv: Split out target constraints to
 tcg-target-con-str.h
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d31;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd31.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jan 15, 2021 at 1:09 PM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/riscv/tcg-target-con-str.h | 21 ++++++++++++++
>  tcg/riscv/tcg-target.h         |  1 +
>  tcg/riscv/tcg-target.c.inc     | 50 ++++++++--------------------------
>  3 files changed, 33 insertions(+), 39 deletions(-)
>  create mode 100644 tcg/riscv/tcg-target-con-str.h
>
> diff --git a/tcg/riscv/tcg-target-con-str.h b/tcg/riscv/tcg-target-con-str.h
> new file mode 100644
> index 0000000000..587fcd3593
> --- /dev/null
> +++ b/tcg/riscv/tcg-target-con-str.h
> @@ -0,0 +1,21 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Define RISC-V target-specific operand constraints.
> + * Copyright (c) 2021 Linaro
> + */
> +
> +/*
> + * Define constraint letters for register sets:
> + * REGS(letter, register_mask)
> + */
> +REGS('r', ALL_GENERAL_REGS)
> +REGS('L', ALL_QLDST_REGS)
> +
> +/*
> + * Define constraint letters for constants:
> + * CONST(letter, TCG_CT_CONST_* bit set)
> + */
> +CONST('I', TCG_CT_CONST_S12)
> +CONST('N', TCG_CT_CONST_N12)
> +CONST('M', TCG_CT_CONST_M12)
> +CONST('Z', TCG_CT_CONST_ZERO)
> diff --git a/tcg/riscv/tcg-target.h b/tcg/riscv/tcg-target.h
> index 727c8df418..daf3ef7b5c 100644
> --- a/tcg/riscv/tcg-target.h
> +++ b/tcg/riscv/tcg-target.h
> @@ -171,5 +171,6 @@ void tb_target_set_jmp_target(uintptr_t, uintptr_t, uintptr_t, uintptr_t);
>  #define TCG_TARGET_NEED_POOL_LABELS
>
>  #define TCG_TARGET_HAS_MEMORY_BSWAP 0
> +#define TCG_TARGET_CON_STR_H
>
>  #endif
> diff --git a/tcg/riscv/tcg-target.c.inc b/tcg/riscv/tcg-target.c.inc
> index 71c0badc02..185b569f4b 100644
> --- a/tcg/riscv/tcg-target.c.inc
> +++ b/tcg/riscv/tcg-target.c.inc
> @@ -122,6 +122,17 @@ static const int tcg_target_call_oarg_regs[] = {
>  #define TCG_CT_CONST_N12   0x400
>  #define TCG_CT_CONST_M12   0x800
>
> +#define ALL_GENERAL_REGS  0xffffffffu
> +#ifdef CONFIG_SOFTMMU
> +#define ALL_QLDST_REGS \
> +    (ALL_GENERAL_REGS & ~((1 << TCG_REG_A0) | (1 << TCG_REG_A1) | \
> +                          (1 << TCG_REG_A2) | (1 << TCG_REG_A3) | \
> +                          (1 << TCG_REG_A5)))

Why is this not TCG_REG_A4?

Alistair

> +#else
> +#define ALL_QLDST_REGS   ALL_GENERAL_REGS
> +#endif
> +
> +
>  static inline tcg_target_long sextreg(tcg_target_long val, int pos, int len)
>  {
>      if (TCG_TARGET_REG_BITS == 32) {
> @@ -131,45 +142,6 @@ static inline tcg_target_long sextreg(tcg_target_long val, int pos, int len)
>      }
>  }
>
> -/* parse target specific constraints */
> -static const char *target_parse_constraint(TCGArgConstraint *ct,
> -                                           const char *ct_str, TCGType type)
> -{
> -    switch (*ct_str++) {
> -    case 'r':
> -        ct->regs = 0xffffffff;
> -        break;
> -    case 'L':
> -        /* qemu_ld/qemu_st constraint */
> -        ct->regs = 0xffffffff;
> -        /* qemu_ld/qemu_st uses TCG_REG_TMP0 */
> -#if defined(CONFIG_SOFTMMU)
> -        tcg_regset_reset_reg(ct->regs, tcg_target_call_iarg_regs[0]);
> -        tcg_regset_reset_reg(ct->regs, tcg_target_call_iarg_regs[1]);
> -        tcg_regset_reset_reg(ct->regs, tcg_target_call_iarg_regs[2]);
> -        tcg_regset_reset_reg(ct->regs, tcg_target_call_iarg_regs[3]);
> -        tcg_regset_reset_reg(ct->regs, tcg_target_call_iarg_regs[4]);
> -#endif
> -        break;
> -    case 'I':
> -        ct->ct |= TCG_CT_CONST_S12;
> -        break;
> -    case 'N':
> -        ct->ct |= TCG_CT_CONST_N12;
> -        break;
> -    case 'M':
> -        ct->ct |= TCG_CT_CONST_M12;
> -        break;
> -    case 'Z':
> -        /* we can use a zero immediate as a zero register argument. */
> -        ct->ct |= TCG_CT_CONST_ZERO;
> -        break;
> -    default:
> -        return NULL;
> -    }
> -    return ct_str;
> -}
> -
>  /* test if a constant matches the constraint */
>  static int tcg_target_const_match(tcg_target_long val, TCGType type,
>                                    const TCGArgConstraint *arg_ct)
> --
> 2.25.1
>
>

