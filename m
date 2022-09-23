Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D60A55E7307
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Sep 2022 06:38:18 +0200 (CEST)
Received: from localhost ([::1]:44340 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obaS9-0001OG-63
	for lists+qemu-devel@lfdr.de; Fri, 23 Sep 2022 00:38:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42772)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1obaPs-0007OQ-M9
 for qemu-devel@nongnu.org; Fri, 23 Sep 2022 00:36:04 -0400
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529]:40631)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1obaPq-0006E6-Nk
 for qemu-devel@nongnu.org; Fri, 23 Sep 2022 00:35:56 -0400
Received: by mail-pg1-x529.google.com with SMTP id 207so11153311pgc.7
 for <qemu-devel@nongnu.org>; Thu, 22 Sep 2022 21:35:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=M4r2kuqchVgOF7iXfiibNvHMnk+TMlUe2AXf6PnR0cU=;
 b=YnU9w5Vs9vFh+GViQSNYi28AGwUxYJKJYULRcpOjI/XYElkwE5JvqR+PjUJaQc3q/t
 MUCuyKgnflFxPpXiabzrVEXXQb//iG2sIxTc77fz7Nb/YVzw2WsIpzsRTc9E62O9lyB4
 hOHyEFp8sRXvhpTOBNYfUDbR8hc5nTWKnoa9sfPYuYHKUt3jXZKrFNeVR3o9Ap8Pyg5f
 OKI3cbREzRyOf7+6CgioXM3OVliXtxtk6+HFcSAy7RERDVFX8Q4MQAsFpWFGkzO2ygcY
 K/tfjuL/5DW8oVjfCRXqOVc9AYh2/xorsa9iBzbmVk4sQ8MpolGkUesEm1LmR5rfbWx/
 qG/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=M4r2kuqchVgOF7iXfiibNvHMnk+TMlUe2AXf6PnR0cU=;
 b=pueZ6Jjgjel+YSscWjOuo2KR//GAQXMhyn5XFKvOjnI50xtPnV7AjPbipj1yT9MEjo
 ZiUUU7942KYfxtg5u9u+IDpHF49kcmp542Rmthoz9jO6dvfQ6gcPnN2jLqEbgeZFC9MH
 yPhPDYMPw2cjCFnGNycToQ9lTMacvcnqhgmcyr2dnK5+BBhIkHmEssLHBbn0q2lOQ5cw
 DKizPeO4RAhpwVJAiRu6XTV2s5VRjlrwuWi+r+lMLF0ppk0r2AX2RqUHcfkPBJvZgMNp
 MelEphFHrRwWTE6GdSES4TFWpKxEysYJRFou50VDL2tmYyKwjVc7vSnrbpZkaj8uqF+/
 JzXw==
X-Gm-Message-State: ACrzQf3a5AgTj/eqe2TjBNYsAhPiKnwObe/SwjK9N2zLWmr+0gnkDWrh
 oTM+N7a+2oGyVhwNE3HScnN3J+rru2pVvw7Oatk=
X-Google-Smtp-Source: AMsMyM79x5KShxJS6JUnub4ekIcR5AE6GqkSDU96RLmTo11LfaxBWVuCKw20CzXbQE4qiw7gffdgodl1pZDqCWSYHH0=
X-Received: by 2002:a63:db07:0:b0:439:2e24:df01 with SMTP id
 e7-20020a63db07000000b004392e24df01mr5981719pgg.221.1663907753305; Thu, 22
 Sep 2022 21:35:53 -0700 (PDT)
MIME-Version: 1.0
References: <20220917072635.11616-1-palmer@rivosinc.com>
In-Reply-To: <20220917072635.11616-1-palmer@rivosinc.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 23 Sep 2022 14:35:26 +1000
Message-ID: <CAKmqyKMOZ2k4AmF==-6Q5oes+=Y7oxP=jyecrn4TwQpT+RrnYg@mail.gmail.com>
Subject: Re: [PATCH v2] RISC-V: Add support for Ztso
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=alistair23@gmail.com; helo=mail-pg1-x529.google.com
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

On Sat, Sep 17, 2022 at 6:12 PM Palmer Dabbelt <palmer@rivosinc.com> wrote:
>
> The Ztso extension was recently frozen, this adds it as a CPU property
> and adds various fences throughout the port in order to allow TSO
> targets to function on weaker hosts.  We need no fences for AMOs as
> they're already SC, the placess we need barriers are described.
>
> Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
> ---
> Like the v1 this has been pretty minimally tested, but I figured I'd
> just send it.  This is what I would have done the first time had I not
> read that comment near TCG_GUEST_DEFAULT_MO, I think trying to describe
> that when I ran into Richard at the Cauldron was probably more confusing
> than just digging up the code and sending it along.

At a quick glance this looks reasonable. Did I miss anything or is
this ready to go?

Alistair

> ---
>  target/riscv/cpu.c                      |  3 +++
>  target/riscv/cpu.h                      |  1 +
>  target/riscv/insn_trans/trans_rva.c.inc | 11 ++++++++---
>  target/riscv/insn_trans/trans_rvi.c.inc | 16 ++++++++++++++--
>  target/riscv/insn_trans/trans_rvv.c.inc | 20 ++++++++++++++++++++
>  target/riscv/translate.c                |  3 +++
>  6 files changed, 49 insertions(+), 5 deletions(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index ac6f82ebd0..d66169efa5 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -919,6 +919,8 @@ static Property riscv_cpu_extensions[] = {
>      DEFINE_PROP_BOOL("zhinx", RISCVCPU, cfg.ext_zhinx, false),
>      DEFINE_PROP_BOOL("zhinxmin", RISCVCPU, cfg.ext_zhinxmin, false),
>
> +    DEFINE_PROP_BOOL("ztso", RISCVCPU, cfg.ext_ztso, false),
> +
>      /* Vendor-specific custom extensions */
>      DEFINE_PROP_BOOL("xventanacondops", RISCVCPU, cfg.ext_XVentanaCondOps, false),
>
> @@ -1094,6 +1096,7 @@ static void riscv_isa_string_ext(RISCVCPU *cpu, char **isa_str, int max_str_len)
>          ISA_EDATA_ENTRY(zksed, ext_zksed),
>          ISA_EDATA_ENTRY(zksh, ext_zksh),
>          ISA_EDATA_ENTRY(zkt, ext_zkt),
> +        ISA_EDATA_ENTRY(ztso, ext_ztso),
>          ISA_EDATA_ENTRY(zve32f, ext_zve32f),
>          ISA_EDATA_ENTRY(zve64f, ext_zve64f),
>          ISA_EDATA_ENTRY(zhinx, ext_zhinx),
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 5c7acc055a..c64fd4e258 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -433,6 +433,7 @@ struct RISCVCPUConfig {
>      bool ext_zve32f;
>      bool ext_zve64f;
>      bool ext_zmmul;
> +    bool ext_ztso;
>      bool rvv_ta_all_1s;
>
>      uint32_t mvendorid;
> diff --git a/target/riscv/insn_trans/trans_rva.c.inc b/target/riscv/insn_trans/trans_rva.c.inc
> index 45db82c9be..9066e1bde3 100644
> --- a/target/riscv/insn_trans/trans_rva.c.inc
> +++ b/target/riscv/insn_trans/trans_rva.c.inc
> @@ -26,7 +26,11 @@ static bool gen_lr(DisasContext *ctx, arg_atomic *a, MemOp mop)
>          tcg_gen_mb(TCG_MO_ALL | TCG_BAR_STRL);
>      }
>      tcg_gen_qemu_ld_tl(load_val, src1, ctx->mem_idx, mop);
> -    if (a->aq) {
> +    /*
> +     * TSO defines AMOs as acquire+release-RCsc, but does not define LR/SC as
> +     * AMOs.  Instead treat them like loads.
> +     */
> +    if (a->aq || ctx->ztso) {
>          tcg_gen_mb(TCG_MO_ALL | TCG_BAR_LDAQ);
>      }
>
> @@ -61,9 +65,10 @@ static bool gen_sc(DisasContext *ctx, arg_atomic *a, MemOp mop)
>      gen_set_label(l1);
>      /*
>       * Address comparison failure.  However, we still need to
> -     * provide the memory barrier implied by AQ/RL.
> +     * provide the memory barrier implied by AQ/RL/TSO.
>       */
> -    tcg_gen_mb(TCG_MO_ALL + a->aq * TCG_BAR_LDAQ + a->rl * TCG_BAR_STRL);
> +    TCGBar bar_strl = (ctx->ztso || a->rl) ? TCG_BAR_STRL : 0;
> +    tcg_gen_mb(TCG_MO_ALL + a->aq * TCG_BAR_LDAQ + bar_strl);
>      gen_set_gpr(ctx, a->rd, tcg_constant_tl(1));
>
>      gen_set_label(l2);
> diff --git a/target/riscv/insn_trans/trans_rvi.c.inc b/target/riscv/insn_trans/trans_rvi.c.inc
> index ca8e3d1ea1..9bef42a3e5 100644
> --- a/target/riscv/insn_trans/trans_rvi.c.inc
> +++ b/target/riscv/insn_trans/trans_rvi.c.inc
> @@ -261,11 +261,19 @@ static bool gen_load_i128(DisasContext *ctx, arg_lb *a, MemOp memop)
>
>  static bool gen_load(DisasContext *ctx, arg_lb *a, MemOp memop)
>  {
> +    bool out;
> +
>      if (get_xl(ctx) == MXL_RV128) {
> -        return gen_load_i128(ctx, a, memop);
> +        out = gen_load_i128(ctx, a, memop);
>      } else {
> -        return gen_load_tl(ctx, a, memop);
> +        out = gen_load_tl(ctx, a, memop);
> +    }
> +
> +    if (ctx->ztso) {
> +        tcg_gen_mb(TCG_MO_ALL | TCG_BAR_LDAQ);
>      }
> +
> +    return out;
>  }
>
>  static bool trans_lb(DisasContext *ctx, arg_lb *a)
> @@ -322,6 +330,10 @@ static bool gen_store_tl(DisasContext *ctx, arg_sb *a, MemOp memop)
>      TCGv addr = get_address(ctx, a->rs1, a->imm);
>      TCGv data = get_gpr(ctx, a->rs2, EXT_NONE);
>
> +    if (ctx->ztso) {
> +        tcg_gen_mb(TCG_MO_ALL | TCG_BAR_STRL);
> +    }
> +
>      tcg_gen_qemu_st_tl(data, addr, ctx->mem_idx, memop);
>      return true;
>  }
> diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
> index 6c091824b6..1994b38035 100644
> --- a/target/riscv/insn_trans/trans_rvv.c.inc
> +++ b/target/riscv/insn_trans/trans_rvv.c.inc
> @@ -671,8 +671,28 @@ static bool ldst_us_trans(uint32_t vd, uint32_t rs1, uint32_t data,
>      tcg_gen_addi_ptr(dest, cpu_env, vreg_ofs(s, vd));
>      tcg_gen_addi_ptr(mask, cpu_env, vreg_ofs(s, 0));
>
> +    /*
> +     * According to the specification
> +     *
> +     *   Additionally, if the Ztso extension is implemented, then vector memory
> +     *   instructions in the V extension and Zve family of extensions follow
> +     *   RVTSO at the instruction level.  The Ztso extension does not
> +     *   strengthen the ordering of intra-instruction element accesses.
> +     *
> +     * as a result neither ordered nor unordered accesses from the V
> +     * instructions need ordering within the loop but we do still need barriers
> +     * around the loop.
> +     */
> +    if (is_store && s->ztso) {
> +      tcg_gen_mb(TCG_MO_ALL | TCG_BAR_STRL);
> +    }
> +
>      fn(dest, mask, base, cpu_env, desc);
>
> +    if (!is_store && s->ztso) {
> +      tcg_gen_mb(TCG_MO_ALL | TCG_BAR_LDAQ);
> +    }
> +
>      tcg_temp_free_ptr(dest);
>      tcg_temp_free_ptr(mask);
>
> diff --git a/target/riscv/translate.c b/target/riscv/translate.c
> index 63b04e8a94..c7c574b09f 100644
> --- a/target/riscv/translate.c
> +++ b/target/riscv/translate.c
> @@ -109,6 +109,8 @@ typedef struct DisasContext {
>      /* PointerMasking extension */
>      bool pm_mask_enabled;
>      bool pm_base_enabled;
> +    /* Ztso */
> +    bool ztso;
>      /* TCG of the current insn_start */
>      TCGOp *insn_start;
>  } DisasContext;
> @@ -1109,6 +1111,7 @@ static void riscv_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
>      memset(ctx->ftemp, 0, sizeof(ctx->ftemp));
>      ctx->pm_mask_enabled = FIELD_EX32(tb_flags, TB_FLAGS, PM_MASK_ENABLED);
>      ctx->pm_base_enabled = FIELD_EX32(tb_flags, TB_FLAGS, PM_BASE_ENABLED);
> +    ctx->ztso = cpu->cfg.ext_ztso;
>      ctx->zero = tcg_constant_tl(0);
>  }
>
> --
> 2.34.1
>
>

