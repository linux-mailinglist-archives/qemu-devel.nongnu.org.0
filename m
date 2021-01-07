Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 155E22ED5B2
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jan 2021 18:32:50 +0100 (CET)
Received: from localhost ([::1]:41836 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxZ9V-0005ET-5c
	for lists+qemu-devel@lfdr.de; Thu, 07 Jan 2021 12:32:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53880)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1kxZ4x-0000Q8-94
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 12:28:07 -0500
Received: from mail-il1-x12a.google.com ([2607:f8b0:4864:20::12a]:33699)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1kxZ4v-00077z-6M
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 12:28:07 -0500
Received: by mail-il1-x12a.google.com with SMTP id n9so7517518ili.0
 for <qemu-devel@nongnu.org>; Thu, 07 Jan 2021 09:28:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6w3bLel4a6nCEui4l7Ii2zpI8zBMAixbYDKLoH0c4KQ=;
 b=HUxLlOCmnxLz/KK3m9/HDHTfOS7G9yEKtRJCIoS970R+fSSv8ljB7032xkt5dufcB1
 AID7ox/MaLC48o9R+qj8wGLbKv/14tGt/y/ndrcpI7KoDLqCz85gBJS1a0b5nkyIZJct
 sv2NqauSDRjtgyUpVEDCUZlsWXEhs2yR5UB6yncSeypmvgtTI9NWVUcurW8glipXm69F
 i3ewGcafuI7B+l4TDqc2dwRD8K1X9QqVsraPOc0bGm0jYgzo5sjtPp0flSkAolAnqEy/
 wwG2wTd589auG+NIFrFriDCIYzqQs7grId6xGcIbLJ1k1thagyNMzjreH1qWklnH5lsQ
 /sjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6w3bLel4a6nCEui4l7Ii2zpI8zBMAixbYDKLoH0c4KQ=;
 b=cnytE/DmsiFvPXOmAVjkMNOSr/dEhSE4B3U0ybmy1Pg5dIzGeBc52Iwch3FTFKZwWS
 IdMNFKc/r8hoxGlQxPJm3ePy077WDNHRavnXK3jB3eUW/n+qFaUaayJSDtz5myhFB6gQ
 cCn+rV0CwIKzBkO1HiSxwJcIbzE1aK7tDKGeM8UfmnGAJgY6yDzLGR7SAMyAC5ZzmcuF
 VkWr2WGnd26FguUhWnbiCQWhBuyAynp+pEXNbewIHHzUtm+VomhbW5WRPMMttWcMZzkG
 m8pTJ47LABfO4MCxSCq/MXocEbZbymogAxDiHT9kzZryTxqrzhMnDGX8yMcHz5zGnW/F
 Fu/A==
X-Gm-Message-State: AOAM5337jkaOZsosYfo+c9FNbzVMe0spUvXYYak3QzOu+lCCS1WdcWLx
 m3uZVA0YNs5kK7TET2dnTVEmjqA23mOchyHir/9Hp/bLqBM=
X-Google-Smtp-Source: ABdhPJwuGIQoVjTw4CZTijGUdR2MkmuoDFf9uSln6bfRqQLrCHOltwDXrPQDWlaCv3TZMTqaCbi3Mu3O7vIUo8RXrmY=
X-Received: by 2002:a92:c942:: with SMTP id i2mr9893673ilq.227.1610040483574; 
 Thu, 07 Jan 2021 09:28:03 -0800 (PST)
MIME-Version: 1.0
References: <20201223060204.576856-1-richard.henderson@linaro.org>
 <20201223060204.576856-13-richard.henderson@linaro.org>
In-Reply-To: <20201223060204.576856-13-richard.henderson@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 7 Jan 2021 09:27:36 -0800
Message-ID: <CAKmqyKPa8PDfMiHP-5nyzU+0-dPJAnPi-4kuvri4a1grqeSJVA@mail.gmail.com>
Subject: Re: [PATCH 12/22] tcg: Remove TCG_TARGET_CONSTR_H
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::12a;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x12a.google.com
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

On Tue, Dec 22, 2020 at 10:21 PM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> All backends have now been converted to tcg-target-constr.h,
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
>  tcg/tcg.c                | 16 ----------------
>  10 files changed, 26 deletions(-)
>
> diff --git a/tcg/aarch64/tcg-target.h b/tcg/aarch64/tcg-target.h
> index ca7af5a589..663dd0b95e 100644
> --- a/tcg/aarch64/tcg-target.h
> +++ b/tcg/aarch64/tcg-target.h
> @@ -159,6 +159,5 @@ void tb_target_set_jmp_target(uintptr_t, uintptr_t, uintptr_t);
>  #define TCG_TARGET_NEED_LDST_LABELS
>  #endif
>  #define TCG_TARGET_NEED_POOL_LABELS
> -#define TCG_TARGET_CONSTR_H
>
>  #endif /* AARCH64_TCG_TARGET_H */
> diff --git a/tcg/arm/tcg-target.h b/tcg/arm/tcg-target.h
> index 6f058d6d9b..17e771374d 100644
> --- a/tcg/arm/tcg-target.h
> +++ b/tcg/arm/tcg-target.h
> @@ -146,6 +146,5 @@ void tb_target_set_jmp_target(uintptr_t, uintptr_t, uintptr_t);
>  #define TCG_TARGET_NEED_LDST_LABELS
>  #endif
>  #define TCG_TARGET_NEED_POOL_LABELS
> -#define TCG_TARGET_CONSTR_H
>
>  #endif
> diff --git a/tcg/i386/tcg-target.h b/tcg/i386/tcg-target.h
> index 7c405e166d..abd4ac7fc0 100644
> --- a/tcg/i386/tcg-target.h
> +++ b/tcg/i386/tcg-target.h
> @@ -235,6 +235,5 @@ static inline void tb_target_set_jmp_target(uintptr_t tc_ptr,
>  #define TCG_TARGET_NEED_LDST_LABELS
>  #endif
>  #define TCG_TARGET_NEED_POOL_LABELS
> -#define TCG_TARGET_CONSTR_H
>
>  #endif
> diff --git a/tcg/mips/tcg-target.h b/tcg/mips/tcg-target.h
> index f4a79bcad1..c6b091d849 100644
> --- a/tcg/mips/tcg-target.h
> +++ b/tcg/mips/tcg-target.h
> @@ -217,6 +217,5 @@ void tb_target_set_jmp_target(uintptr_t, uintptr_t, uintptr_t);
>  #ifdef CONFIG_SOFTMMU
>  #define TCG_TARGET_NEED_LDST_LABELS
>  #endif
> -#define TCG_TARGET_CONSTR_H
>
>  #endif
> diff --git a/tcg/ppc/tcg-target.h b/tcg/ppc/tcg-target.h
> index 78d3470f3c..be10363956 100644
> --- a/tcg/ppc/tcg-target.h
> +++ b/tcg/ppc/tcg-target.h
> @@ -185,6 +185,5 @@ void tb_target_set_jmp_target(uintptr_t, uintptr_t, uintptr_t);
>  #define TCG_TARGET_NEED_LDST_LABELS
>  #endif
>  #define TCG_TARGET_NEED_POOL_LABELS
> -#define TCG_TARGET_CONSTR_H
>
>  #endif
> diff --git a/tcg/riscv/tcg-target.h b/tcg/riscv/tcg-target.h
> index ff8ff43a46..032439d806 100644
> --- a/tcg/riscv/tcg-target.h
> +++ b/tcg/riscv/tcg-target.h
> @@ -175,6 +175,5 @@ void tb_target_set_jmp_target(uintptr_t, uintptr_t, uintptr_t);
>  #define TCG_TARGET_NEED_POOL_LABELS
>
>  #define TCG_TARGET_HAS_MEMORY_BSWAP 0
> -#define TCG_TARGET_CONSTR_H
>
>  #endif
> diff --git a/tcg/s390/tcg-target.h b/tcg/s390/tcg-target.h
> index 3aff3cc572..63c8797bd3 100644
> --- a/tcg/s390/tcg-target.h
> +++ b/tcg/s390/tcg-target.h
> @@ -162,6 +162,5 @@ static inline void tb_target_set_jmp_target(uintptr_t tc_ptr,
>  #define TCG_TARGET_NEED_LDST_LABELS
>  #endif
>  #define TCG_TARGET_NEED_POOL_LABELS
> -#define TCG_TARGET_CONSTR_H
>
>  #endif
> diff --git a/tcg/sparc/tcg-target.h b/tcg/sparc/tcg-target.h
> index bfee6191b3..633841ebf2 100644
> --- a/tcg/sparc/tcg-target.h
> +++ b/tcg/sparc/tcg-target.h
> @@ -179,6 +179,5 @@ static inline void flush_icache_range(uintptr_t start, uintptr_t stop)
>  void tb_target_set_jmp_target(uintptr_t, uintptr_t, uintptr_t);
>
>  #define TCG_TARGET_NEED_POOL_LABELS
> -#define TCG_TARGET_CONSTR_H
>
>  #endif
> diff --git a/tcg/tci/tcg-target.h b/tcg/tci/tcg-target.h
> index cd3dee51bb..8c1c1d265d 100644
> --- a/tcg/tci/tcg-target.h
> +++ b/tcg/tci/tcg-target.h
> @@ -210,6 +210,4 @@ static inline void tb_target_set_jmp_target(uintptr_t tc_ptr,
>      /* no need to flush icache explicitly */
>  }
>
> -#define TCG_TARGET_CONSTR_H
> -
>  #endif /* TCG_TARGET_H */
> diff --git a/tcg/tcg.c b/tcg/tcg.c
> index f5b53d739e..2bde926315 100644
> --- a/tcg/tcg.c
> +++ b/tcg/tcg.c
> @@ -102,10 +102,6 @@ static void tcg_register_jit_int(void *buf, size_t size,
>      __attribute__((unused));
>
>  /* Forward declarations for functions declared and used in tcg-target.c.inc. */
> -#ifndef TCG_TARGET_CONSTR_H
> -static const char *target_parse_constraint(TCGArgConstraint *ct,
> -                                           const char *ct_str, TCGType type);
> -#endif
>  static void tcg_out_ld(TCGContext *s, TCGType type, TCGReg ret, TCGReg arg1,
>                         intptr_t arg2);
>  static bool tcg_out_mov(TCGContext *s, TCGType type, TCGReg ret, TCGReg arg);
> @@ -2288,7 +2284,6 @@ static void process_op_defs(TCGContext *s)
>                      ct_str++;
>                      break;
>
> -#ifdef TCG_TARGET_CONSTR_H
>                  /* Include all of the target-specific constraints. */
>
>  #undef CONST
> @@ -2304,17 +2299,6 @@ static void process_op_defs(TCGContext *s)
>                  default:
>                      /* Typo in TCGTargetOpDef constraint. */
>                      g_assert_not_reached();
> -#else
> -                default:
> -                    {
> -                        TCGType type = (def->flags & TCG_OPF_64BIT
> -                                        ? TCG_TYPE_I64 : TCG_TYPE_I32);
> -                        ct_str = target_parse_constraint(&def->args_ct[i],
> -                                                         ct_str, type);
> -                        /* Typo in TCGTargetOpDef constraint. */
> -                        tcg_debug_assert(ct_str != NULL);
> -                    }
> -#endif
>                  }
>              }
>          }
> --
> 2.25.1
>
>

