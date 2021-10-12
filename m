Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D57F42AF13
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Oct 2021 23:36:58 +0200 (CEST)
Received: from localhost ([::1]:40254 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maPSC-0006bz-RG
	for lists+qemu-devel@lfdr.de; Tue, 12 Oct 2021 17:36:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52704)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1maPQ9-0004n1-KA
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 17:34:49 -0400
Received: from mail-il1-x12b.google.com ([2607:f8b0:4864:20::12b]:44651)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1maPQ7-0008H5-WA
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 17:34:49 -0400
Received: by mail-il1-x12b.google.com with SMTP id j8so505963ila.11
 for <qemu-devel@nongnu.org>; Tue, 12 Oct 2021 14:34:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fHbDf+yzIBIUYHEVkFjrO6jaLQtY7suxD3+C3MbBdug=;
 b=CV+t4vWdD0g4f8fPa0tddowgVk4icC3D6Z85gKiwkF/CT02dCElo3YLX6qfPbtBhaB
 fOx4whRurkcXqiYb+1wwjLojei4GAt2C2uWk1OyFdtGEoVjdeJyRYZWJgW4ekiUGlOHT
 2aTnqmeBjYR/MBX7VtvD6uwiWPczYLcn5GsvURoBhjHKMAtp/YyDpXilRJWozG7+WBKo
 fR8xvH4K8HCyVRWmIZiCY9T4/MC2RKZQgzq/igptatGa1EF/zRYpcWPK5UoSM0bq8c71
 L7mAC6GFWRDzks+mLhS+l0NxED04gWc4qSsGTkOjcjXrSH10ZW2KDEyrmmFszswet/FV
 aEMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fHbDf+yzIBIUYHEVkFjrO6jaLQtY7suxD3+C3MbBdug=;
 b=tDKj9HKjTHMSDUwq3bP1CBjA9DbySrPCCrqQDvoccc1ZS8H+TplUCCNdEOQdeol7bx
 piF78KPDPR6MZNzb5Ocb27lbksRJZW81n6QUS52CCXe2xkh2GjGW1kGBFEMmhlRlnRtC
 FCX29KN7Y62DOSslEt7g61Iu87TBgEwGSXIsWJ8T8dRENA0FUJjtTVgakOGj0tHwTa6c
 SYMvz77eP7iyMceSzI/hV9H+NBHQqQBP5d3IbjdmdNjJzd811Qi0MaY+PWdxuxhnDWZv
 4MghSoKr+JT9jkt/2gSMKy2bAGBu9dowrGrgKaRufQgh/QmKzWsowD0ezx1cM+Q5LlTL
 D/MQ==
X-Gm-Message-State: AOAM532d15XqqjVEvmIcAxzA7YyIAu35NnT9hbcj6N/kkbgJgXPra1Io
 qOvuF52z1793KNT5b///7QRNuFyG6aU3eIqrC5s=
X-Google-Smtp-Source: ABdhPJy3tZmnS5NNQumRh54c8RFy/RGO1gYuZUsU7RG+SZv/HWiMomy36nziuQIAAY/E++zw50zDVKTlkyZMIH72hxA=
X-Received: by 2002:a05:6e02:214a:: with SMTP id
 d10mr16115942ilv.290.1634074486787; 
 Tue, 12 Oct 2021 14:34:46 -0700 (PDT)
MIME-Version: 1.0
References: <20211012162159.471406-1-richard.henderson@linaro.org>
 <20211012162159.471406-19-richard.henderson@linaro.org>
In-Reply-To: <20211012162159.471406-19-richard.henderson@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 13 Oct 2021 07:34:20 +1000
Message-ID: <CAKmqyKP42SNz0dOq1Q_7Jg=KfE1ZMu6bug1fmySGXt5QLrE-OA@mail.gmail.com>
Subject: Re: [PATCH v2 18/23] target/riscv: Remove exit_tb and
 lookup_and_goto_ptr
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

On Wed, Oct 13, 2021 at 2:33 AM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> GDB single-stepping is now handled generically, which means
> we don't need to do anything in the wrappers.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/translate.c                      | 27 +------------------
>  .../riscv/insn_trans/trans_privileged.c.inc   |  4 +--
>  target/riscv/insn_trans/trans_rvi.c.inc       |  8 +++---
>  target/riscv/insn_trans/trans_rvv.c.inc       |  2 +-
>  4 files changed, 7 insertions(+), 34 deletions(-)
>
> diff --git a/target/riscv/translate.c b/target/riscv/translate.c
> index d2442f0cf5..6d7fbca1fa 100644
> --- a/target/riscv/translate.c
> +++ b/target/riscv/translate.c
> @@ -149,31 +149,6 @@ static void generate_exception_mtval(DisasContext *ctx, int excp)
>      ctx->base.is_jmp = DISAS_NORETURN;
>  }
>
> -static void gen_exception_debug(void)
> -{
> -    gen_helper_raise_exception(cpu_env, tcg_constant_i32(EXCP_DEBUG));
> -}
> -
> -/* Wrapper around tcg_gen_exit_tb that handles single stepping */
> -static void exit_tb(DisasContext *ctx)
> -{
> -    if (ctx->base.singlestep_enabled) {
> -        gen_exception_debug();
> -    } else {
> -        tcg_gen_exit_tb(NULL, 0);
> -    }
> -}
> -
> -/* Wrapper around tcg_gen_lookup_and_goto_ptr that handles single stepping */
> -static void lookup_and_goto_ptr(DisasContext *ctx)
> -{
> -    if (ctx->base.singlestep_enabled) {
> -        gen_exception_debug();
> -    } else {
> -        tcg_gen_lookup_and_goto_ptr();
> -    }
> -}
> -
>  static void gen_exception_illegal(DisasContext *ctx)
>  {
>      generate_exception(ctx, RISCV_EXCP_ILLEGAL_INST);
> @@ -192,7 +167,7 @@ static void gen_goto_tb(DisasContext *ctx, int n, target_ulong dest)
>          tcg_gen_exit_tb(ctx->base.tb, n);
>      } else {
>          tcg_gen_movi_tl(cpu_pc, dest);
> -        lookup_and_goto_ptr(ctx);
> +        tcg_gen_lookup_and_goto_ptr();
>      }
>  }
>
> diff --git a/target/riscv/insn_trans/trans_privileged.c.inc b/target/riscv/insn_trans/trans_privileged.c.inc
> index a7afcb15ce..75c6ef80a6 100644
> --- a/target/riscv/insn_trans/trans_privileged.c.inc
> +++ b/target/riscv/insn_trans/trans_privileged.c.inc
> @@ -78,7 +78,7 @@ static bool trans_sret(DisasContext *ctx, arg_sret *a)
>
>      if (has_ext(ctx, RVS)) {
>          gen_helper_sret(cpu_pc, cpu_env, cpu_pc);
> -        exit_tb(ctx); /* no chaining */
> +        tcg_gen_exit_tb(NULL, 0); /* no chaining */
>          ctx->base.is_jmp = DISAS_NORETURN;
>      } else {
>          return false;
> @@ -94,7 +94,7 @@ static bool trans_mret(DisasContext *ctx, arg_mret *a)
>  #ifndef CONFIG_USER_ONLY
>      tcg_gen_movi_tl(cpu_pc, ctx->base.pc_next);
>      gen_helper_mret(cpu_pc, cpu_env, cpu_pc);
> -    exit_tb(ctx); /* no chaining */
> +    tcg_gen_exit_tb(NULL, 0); /* no chaining */
>      ctx->base.is_jmp = DISAS_NORETURN;
>      return true;
>  #else
> diff --git a/target/riscv/insn_trans/trans_rvi.c.inc b/target/riscv/insn_trans/trans_rvi.c.inc
> index 920ae0edb3..a6a57c94bb 100644
> --- a/target/riscv/insn_trans/trans_rvi.c.inc
> +++ b/target/riscv/insn_trans/trans_rvi.c.inc
> @@ -71,9 +71,7 @@ static bool trans_jalr(DisasContext *ctx, arg_jalr *a)
>      if (a->rd != 0) {
>          tcg_gen_movi_tl(cpu_gpr[a->rd], ctx->pc_succ_insn);
>      }
> -
> -    /* No chaining with JALR. */
> -    lookup_and_goto_ptr(ctx);
> +    tcg_gen_lookup_and_goto_ptr();
>
>      if (misaligned) {
>          gen_set_label(misaligned);
> @@ -421,7 +419,7 @@ static bool trans_fence_i(DisasContext *ctx, arg_fence_i *a)
>       * however we need to end the translation block
>       */
>      tcg_gen_movi_tl(cpu_pc, ctx->pc_succ_insn);
> -    exit_tb(ctx);
> +    tcg_gen_exit_tb(NULL, 0);
>      ctx->base.is_jmp = DISAS_NORETURN;
>      return true;
>  }
> @@ -430,7 +428,7 @@ static bool do_csr_post(DisasContext *ctx)
>  {
>      /* We may have changed important cpu state -- exit to main loop. */
>      tcg_gen_movi_tl(cpu_pc, ctx->pc_succ_insn);
> -    exit_tb(ctx);
> +    tcg_gen_exit_tb(NULL, 0);
>      ctx->base.is_jmp = DISAS_NORETURN;
>      return true;
>  }
> diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
> index fa451938f1..081a5ca34d 100644
> --- a/target/riscv/insn_trans/trans_rvv.c.inc
> +++ b/target/riscv/insn_trans/trans_rvv.c.inc
> @@ -41,7 +41,7 @@ static bool trans_vsetvl(DisasContext *ctx, arg_vsetvl *a)
>      gen_set_gpr(ctx, a->rd, dst);
>
>      tcg_gen_movi_tl(cpu_pc, ctx->pc_succ_insn);
> -    lookup_and_goto_ptr(ctx);
> +    tcg_gen_lookup_and_goto_ptr();
>      ctx->base.is_jmp = DISAS_NORETURN;
>      return true;
>  }
> --
> 2.25.1
>
>

