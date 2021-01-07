Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 04B4A2ED5B5
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jan 2021 18:34:54 +0100 (CET)
Received: from localhost ([::1]:46752 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxZBV-0007TP-Ui
	for lists+qemu-devel@lfdr.de; Thu, 07 Jan 2021 12:34:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55082)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1kxZ8S-0005gg-Ek
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 12:31:44 -0500
Received: from mail-il1-x12b.google.com ([2607:f8b0:4864:20::12b]:34589)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1kxZ8Q-000082-FF
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 12:31:44 -0500
Received: by mail-il1-x12b.google.com with SMTP id x15so7522909ilq.1
 for <qemu-devel@nongnu.org>; Thu, 07 Jan 2021 09:31:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9MjhiBXIzgG4uviDipxbR/Ul3Wl94uG1rl612laeIh8=;
 b=bOkSJSngcZpavTjGTDAcbVkD9YJdMq+Lys3RDAiGSjWEZHQ+9Ig2KuZlvKSt9IsnG4
 tU4Z97i0Ygxh+F3t8CagYhdh4ZNoWHhZCVfomvFwMtkPsBe1BvUZ7S2//ssjMrWOkKc2
 tr1MZ8fHgm8vAK85zQcQtLFmFMEl1NMyhCu0f/XLIIPn1vOoZ0K8Zf8FyXGZ1+qjtjB/
 liSkiaTV6Vm0SXshEsSdCk5v82lFhbZ9sXPFMv+CbiFL8YTRhSeGoAC4SzFDhvxvAAj4
 7Dbo5l1mm1O2w4UdFTmyx6jpqf4p/NU3R0ZHvc6jgsu9bm9cKvK6kteRdslRZjHwj5uP
 7vbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9MjhiBXIzgG4uviDipxbR/Ul3Wl94uG1rl612laeIh8=;
 b=DvcR6viIqtXUkm7YlodFqWDKCsnHqVUBf9u5qEduHbRgb8+PUsLyPBlluE95uNc2hX
 ADpKeVYasu2kDgg4ZmDE8rmIQHStblKnvgoRWoKdl4CVqoKgcwDBChy95tUH2+DVfdzl
 0t6uk+aqWHs6DXTO2A1mFVKzezqGkvTQ3JyOSnlbpMg/zB8JDvaGzcaWUbD2o3vHDgt5
 Oq0AeOattMxhiwHMGMaG4PJ+iSvZFo3P18ohsDt3TzsDs2AGWPST7lEnhQ97zrpCNssI
 MNVfRzdhctuHSkmEYl9QrQJUEBtV1Nbi+mVU15wHdWXkg9GgM7d7n+TLLSCj6w9ly8rD
 XW2w==
X-Gm-Message-State: AOAM533vaMk6UwUsuyIVnufy96yw9LJqIyplPbfrV/v2xBSToPfD3FJn
 3p7pKZpezjDEgJ7WKmunYuKVWUX+vtlWm9mq6mw=
X-Google-Smtp-Source: ABdhPJwHIOeuQ/huIV5EhEREIUsUOb2B1uxj8v+vMpmWMUIZ0tinu+ek0uLjgkQ7hg4kMgFn5wI6hDz8Fn+Eipo/9j0=
X-Received: by 2002:a92:c942:: with SMTP id i2mr9908418ilq.227.1610040701383; 
 Thu, 07 Jan 2021 09:31:41 -0800 (PST)
MIME-Version: 1.0
References: <20201223060204.576856-1-richard.henderson@linaro.org>
 <20201223060204.576856-23-richard.henderson@linaro.org>
In-Reply-To: <20201223060204.576856-23-richard.henderson@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 7 Jan 2021 09:31:15 -0800
Message-ID: <CAKmqyKMeYcPGi-4fwPrhYzysJarihs3rOk2oTHuoNHXhpg6V8w@mail.gmail.com>
Subject: Re: [PATCH 22/22] tcg: Remove TCG_TARGET_CONSET_H
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

On Tue, Dec 22, 2020 at 10:29 PM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> All backends have now been converted to tcg-target-conset.h,
> so we can remove the fallback code.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  tcg/aarch64/tcg-target.h |  1 -
>  tcg/arm/tcg-target.h     |  1 -
>  tcg/i386/tcg-target.h    |  1 -
>  tcg/mips/tcg-target.h    |  1 -
>  tcg/ppc/tcg-target.h     |  1 -
>  tcg/riscv/tcg-target.h   |  1 -
>  tcg/s390/tcg-target.h    |  1 -
>  tcg/sparc/tcg-target.h   |  1 -
>  tcg/tci/tcg-target.h     |  2 --
>  tcg/tcg.c                | 13 -------------
>  10 files changed, 23 deletions(-)
>
> diff --git a/tcg/aarch64/tcg-target.h b/tcg/aarch64/tcg-target.h
> index a81f6dadf9..663dd0b95e 100644
> --- a/tcg/aarch64/tcg-target.h
> +++ b/tcg/aarch64/tcg-target.h
> @@ -159,6 +159,5 @@ void tb_target_set_jmp_target(uintptr_t, uintptr_t, uintptr_t);
>  #define TCG_TARGET_NEED_LDST_LABELS
>  #endif
>  #define TCG_TARGET_NEED_POOL_LABELS
> -#define TCG_TARGET_CONSET_H
>
>  #endif /* AARCH64_TCG_TARGET_H */
> diff --git a/tcg/arm/tcg-target.h b/tcg/arm/tcg-target.h
> index 918f09239a..17e771374d 100644
> --- a/tcg/arm/tcg-target.h
> +++ b/tcg/arm/tcg-target.h
> @@ -146,6 +146,5 @@ void tb_target_set_jmp_target(uintptr_t, uintptr_t, uintptr_t);
>  #define TCG_TARGET_NEED_LDST_LABELS
>  #endif
>  #define TCG_TARGET_NEED_POOL_LABELS
> -#define TCG_TARGET_CONSET_H
>
>  #endif
> diff --git a/tcg/i386/tcg-target.h b/tcg/i386/tcg-target.h
> index 74a2566900..abd4ac7fc0 100644
> --- a/tcg/i386/tcg-target.h
> +++ b/tcg/i386/tcg-target.h
> @@ -235,6 +235,5 @@ static inline void tb_target_set_jmp_target(uintptr_t tc_ptr,
>  #define TCG_TARGET_NEED_LDST_LABELS
>  #endif
>  #define TCG_TARGET_NEED_POOL_LABELS
> -#define TCG_TARGET_CONSET_H
>
>  #endif
> diff --git a/tcg/mips/tcg-target.h b/tcg/mips/tcg-target.h
> index 688d691cda..c6b091d849 100644
> --- a/tcg/mips/tcg-target.h
> +++ b/tcg/mips/tcg-target.h
> @@ -217,6 +217,5 @@ void tb_target_set_jmp_target(uintptr_t, uintptr_t, uintptr_t);
>  #ifdef CONFIG_SOFTMMU
>  #define TCG_TARGET_NEED_LDST_LABELS
>  #endif
> -#define TCG_TARGET_CONSET_H
>
>  #endif
> diff --git a/tcg/ppc/tcg-target.h b/tcg/ppc/tcg-target.h
> index c958faffb7..be10363956 100644
> --- a/tcg/ppc/tcg-target.h
> +++ b/tcg/ppc/tcg-target.h
> @@ -185,6 +185,5 @@ void tb_target_set_jmp_target(uintptr_t, uintptr_t, uintptr_t);
>  #define TCG_TARGET_NEED_LDST_LABELS
>  #endif
>  #define TCG_TARGET_NEED_POOL_LABELS
> -#define TCG_TARGET_CONSET_H
>
>  #endif
> diff --git a/tcg/riscv/tcg-target.h b/tcg/riscv/tcg-target.h
> index a357962e01..032439d806 100644
> --- a/tcg/riscv/tcg-target.h
> +++ b/tcg/riscv/tcg-target.h
> @@ -175,6 +175,5 @@ void tb_target_set_jmp_target(uintptr_t, uintptr_t, uintptr_t);
>  #define TCG_TARGET_NEED_POOL_LABELS
>
>  #define TCG_TARGET_HAS_MEMORY_BSWAP 0
> -#define TCG_TARGET_CONSET_H
>
>  #endif
> diff --git a/tcg/s390/tcg-target.h b/tcg/s390/tcg-target.h
> index 78277a8d07..63c8797bd3 100644
> --- a/tcg/s390/tcg-target.h
> +++ b/tcg/s390/tcg-target.h
> @@ -162,6 +162,5 @@ static inline void tb_target_set_jmp_target(uintptr_t tc_ptr,
>  #define TCG_TARGET_NEED_LDST_LABELS
>  #endif
>  #define TCG_TARGET_NEED_POOL_LABELS
> -#define TCG_TARGET_CONSET_H
>
>  #endif
> diff --git a/tcg/sparc/tcg-target.h b/tcg/sparc/tcg-target.h
> index 1304c225b1..633841ebf2 100644
> --- a/tcg/sparc/tcg-target.h
> +++ b/tcg/sparc/tcg-target.h
> @@ -179,6 +179,5 @@ static inline void flush_icache_range(uintptr_t start, uintptr_t stop)
>  void tb_target_set_jmp_target(uintptr_t, uintptr_t, uintptr_t);
>
>  #define TCG_TARGET_NEED_POOL_LABELS
> -#define TCG_TARGET_CONSET_H
>
>  #endif
> diff --git a/tcg/tci/tcg-target.h b/tcg/tci/tcg-target.h
> index 42b84a0e87..8c1c1d265d 100644
> --- a/tcg/tci/tcg-target.h
> +++ b/tcg/tci/tcg-target.h
> @@ -210,6 +210,4 @@ static inline void tb_target_set_jmp_target(uintptr_t tc_ptr,
>      /* no need to flush icache explicitly */
>  }
>
> -#define TCG_TARGET_CONSET_H
> -
>  #endif /* TCG_TARGET_H */
> diff --git a/tcg/tcg.c b/tcg/tcg.c
> index c58d728ca5..dd5b045d88 100644
> --- a/tcg/tcg.c
> +++ b/tcg/tcg.c
> @@ -68,11 +68,7 @@
>  /* Forward declarations for functions declared in tcg-target.c.inc and
>     used here. */
>  static void tcg_target_init(TCGContext *s);
> -#ifdef TCG_TARGET_CONSET_H
>  static int tcg_target_op_def(TCGOpcode);
> -#else
> -static const TCGTargetOpDef *tcg_target_op_def(TCGOpcode);
> -#endif
>  static void tcg_target_qemu_prologue(TCGContext *s);
>  static bool patch_reloc(tcg_insn_unit *code_ptr, int type,
>                          intptr_t value, intptr_t addend);
> @@ -344,7 +340,6 @@ static void set_jmp_reset_offset(TCGContext *s, int which)
>      s->tb_jmp_reset_offset[which] = tcg_current_code_size(s);
>  }
>
> -#ifdef TCG_TARGET_CONSET_H
>  #define C_PFX1(P, A)                    P##A
>  #define C_PFX2(P, A, B)                 P##A##_##B
>  #define C_PFX3(P, A, B, C)              P##A##_##B##_##C
> @@ -457,8 +452,6 @@ static const TCGTargetOpDef constraint_sets[] = {
>  #define C_O2_I4(O1, O2, I1, I2, I3, I4) \
>      C_PFX6(c_o2_i4_, O1, O2, I1, I2, I3, I4)
>
> -#endif /* TCG_TARGET_CONSET_H */
> -
>  #include "tcg-target.c.inc"
>
>  /* compare a pointer @ptr and a tb_tc @s */
> @@ -2367,16 +2360,10 @@ static void process_op_defs(TCGContext *s)
>              continue;
>          }
>
> -#ifdef TCG_TARGET_CONSET_H
>          i = tcg_target_op_def(op);
>          /* Missing TCGTargetOpDef entry. */
>          tcg_debug_assert(i >= 0 && i < ARRAY_SIZE(constraint_sets));
>          tdefs = &constraint_sets[i];
> -#else
> -        tdefs = tcg_target_op_def(op);
> -        /* Missing TCGTargetOpDef entry. */
> -        tcg_debug_assert(tdefs != NULL);
> -#endif
>
>          for (i = 0; i < nb_args; i++) {
>              const char *ct_str = tdefs->args_ct_str[i];
> --
> 2.25.1
>
>

