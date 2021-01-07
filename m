Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A3792ED596
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jan 2021 18:29:09 +0100 (CET)
Received: from localhost ([::1]:34666 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxZ5w-00016C-MC
	for lists+qemu-devel@lfdr.de; Thu, 07 Jan 2021 12:29:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53554)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1kxZ4D-0007vl-48
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 12:27:22 -0500
Received: from mail-il1-x12b.google.com ([2607:f8b0:4864:20::12b]:33694)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1kxZ4B-0006sw-69
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 12:27:20 -0500
Received: by mail-il1-x12b.google.com with SMTP id n9so7514717ili.0
 for <qemu-devel@nongnu.org>; Thu, 07 Jan 2021 09:27:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2fJ4tnsZcgLuQRlybs1j2m17X9FShkRVCMtgwy5eMgM=;
 b=aiWu8fCLmhdVAXEVx5vqBw0XTGp9VcpHS0Syb96J4vXMDxI3UQ4xwcZ93dUb7vjr/k
 AWIsvouQ3r2/NOOeluVao/fRDtnCucRYLfAhsNy1cn5cD4Trz4zMOtvfWRiBKOjO/i+B
 BXxOJ3LFt6siZd4ZEQJu72qcPPWDRFja/LleRbEuEGCZbjYcdM8DFY9t2hkNpSO57lq+
 Ao5t353jxAOzGstao1NuFl17QYsR4XdOMW13rKphcaTlhCSLISdxo8QasA1PpNqIMFEg
 J3DX+hbS+/gcsbruBr4oO/EXD8x7DpVBBSJgCg/9EbeOIf7GTsLGaXfmsIiXRvVn9RJk
 Q/RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2fJ4tnsZcgLuQRlybs1j2m17X9FShkRVCMtgwy5eMgM=;
 b=M2CN36EnGgaBO48jzNZ0lSJhOfFNGXjUgsHbPx4YjAxJvEKy5FAJFE7hjsMHUAO9gQ
 Ls+gHFTcwRWPFOWk+B8lCCn/9jwHTNornsbY1vccwax25J+cHQv4rKtrGASnWbB6Naym
 YONmIDYX2wK7oKP2Z7ewR9sF1q6QzQ6PjQ69LCc4K/0SelgyBKTlUx+JAprLd/8dZ7Km
 3GcQm6Ro2YDuGTa5MHRxhWNVZ4XReJxG5dHf8ygdb33LO93/qJeQ+7S8R0PCdl4C+e9f
 yicHQ/g4F/V+z/KQ34AfdRQhTTaS/EqAX0QAi9opbcpNAZPFccxpcnOXBADKQqPNQ1E9
 s+lw==
X-Gm-Message-State: AOAM530Q9vcd5gky8D7g87RgjKIGZeU5sPiq7AEP1DiCQ5b2gxM2WcA7
 Y8fCj4BC2A+ENS0auhhT8eRb4x0TuuDTKvlSma4=
X-Google-Smtp-Source: ABdhPJwgm0w5KsyLPe71OTn4C1yj0AhhYczS0xH6NtxH82oQ0ovOJjFjlN032elaXuvD6pFW5D7cuLYdLvrLr1UIS/U=
X-Received: by 2002:a92:dc0f:: with SMTP id t15mr9985238iln.267.1610040438144; 
 Thu, 07 Jan 2021 09:27:18 -0800 (PST)
MIME-Version: 1.0
References: <20201223060204.576856-1-richard.henderson@linaro.org>
 <20201223060204.576856-10-richard.henderson@linaro.org>
In-Reply-To: <20201223060204.576856-10-richard.henderson@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 7 Jan 2021 09:26:51 -0800
Message-ID: <CAKmqyKOmkekPJkHf5Z5KSVoO1DMzmEQHe2i6D5U4KBhEKrsvyw@mail.gmail.com>
Subject: Re: [PATCH 09/22] tcg/riscv: Convert to tcg-target-constr.h
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::12b;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x12b.google.com
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

On Tue, Dec 22, 2020 at 10:13 PM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Acked-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  tcg/riscv/tcg-target-constr.h | 24 +++++++++++++++++++++
>  tcg/riscv/tcg-target.h        |  1 +
>  tcg/riscv/tcg-target.c.inc    | 39 -----------------------------------
>  3 files changed, 25 insertions(+), 39 deletions(-)
>  create mode 100644 tcg/riscv/tcg-target-constr.h
>
> diff --git a/tcg/riscv/tcg-target-constr.h b/tcg/riscv/tcg-target-constr.h
> new file mode 100644
> index 0000000000..5daf2e6a5b
> --- /dev/null
> +++ b/tcg/riscv/tcg-target-constr.h
> @@ -0,0 +1,24 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * RISC-V target-specific operand constaints.
> + * Copyright (c) 2020 Linaro
> + */
> +
> +#define ALL_GENERAL_REGS  0xffffffffu
> +
> +#ifdef CONFIG_SOFTMMU
> +#define ALL_QLDST_REGS \
> +    (ALL_GENERAL_REGS & ~((1 << TCG_REG_A0) | (1 << TCG_REG_A1) | \
> +                          (1 << TCG_REG_A2) | (1 << TCG_REG_A3) | \
> +                          (1 << TCG_REG_A5)))
> +#else
> +#define ALL_QLDST_REGS   ALL_GENERAL_REGS
> +#endif
> +
> +REGS('r', ALL_GENERAL_REGS)
> +REGS('L', ALL_QLDST_REGS)
> +
> +CONST('I', TCG_CT_CONST_S12)
> +CONST('N', TCG_CT_CONST_N12)
> +CONST('M', TCG_CT_CONST_M12)
> +CONST('Z', TCG_CT_CONST_ZERO)
> diff --git a/tcg/riscv/tcg-target.h b/tcg/riscv/tcg-target.h
> index 032439d806..ff8ff43a46 100644
> --- a/tcg/riscv/tcg-target.h
> +++ b/tcg/riscv/tcg-target.h
> @@ -175,5 +175,6 @@ void tb_target_set_jmp_target(uintptr_t, uintptr_t, uintptr_t);
>  #define TCG_TARGET_NEED_POOL_LABELS
>
>  #define TCG_TARGET_HAS_MEMORY_BSWAP 0
> +#define TCG_TARGET_CONSTR_H
>
>  #endif
> diff --git a/tcg/riscv/tcg-target.c.inc b/tcg/riscv/tcg-target.c.inc
> index d536f3ccc1..33047c1951 100644
> --- a/tcg/riscv/tcg-target.c.inc
> +++ b/tcg/riscv/tcg-target.c.inc
> @@ -131,45 +131,6 @@ static inline tcg_target_long sextreg(tcg_target_long val, int pos, int len)
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

