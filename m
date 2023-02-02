Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A465688023
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Feb 2023 15:30:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNaaY-0005gj-RR; Thu, 02 Feb 2023 09:29:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1pNaaX-0005ga-E0
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 09:29:21 -0500
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1pNaaV-0005jb-KR
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 09:29:21 -0500
Received: by mail-ed1-x52a.google.com with SMTP id v13so2148319eda.11
 for <qemu-devel@nongnu.org>; Thu, 02 Feb 2023 06:29:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vrull.eu; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=J/KshAgycDFR262NirTWMpA7IYyDq5dPRxB8Xfwd4YY=;
 b=Bgdy6gQ3N2aKAeMPzcScO6PZO2Y1Tw5zMUSTvLt4vK8O0LAwDhkXPzjh7HlkjU2q1x
 BDPgZHvo0gg3dSlU38VmNnNFhSTQ+KL2xMUK44HDbXQIR6iGkUCgJZViJ0SqFhR2YEgY
 gbNdJ0jSMirHFIFMrWFbTCy5vX3HPW2jKzq7z6jX9QT7stVgjBkShirs/YCG98ivKVz7
 Wlzxn2oMFcxUs6+xl8fx2QMIa+KKMzNzzWbVRJKEzpjUeUTiVXbIlJJI5vjMgaWChjUm
 LVpG67jN1Gx/ufjZX92WhK0OHez+NZFhTNdCfJ+SyP8YbQtNDPps0Q497/6+K6Zk1AeU
 5QbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=J/KshAgycDFR262NirTWMpA7IYyDq5dPRxB8Xfwd4YY=;
 b=P225M2utw6MmqqARDTBtYSTX4PYHCOIWup3q9DG/h5VbcHnngpB+gxCcLy2q/2a4Yh
 6LUNOmIMKCjaUKFGOcHN6JqoX36DXWqh5OUH71XHHjfGtvVAXDMevhZWsg8Mybzb5C0/
 SCrKjIoVx2we6oRPtJVoIbXSrdrzlnCttRPOnc7RmudonLJ5xAXxJlpPSxcXlVv2EPi+
 AJeui7CMi8n4kLMbE2P3RlokhJvgGEWP9pflUGKYqNH+fZl3nOQbt+d5RcHHehetx9QZ
 D4E2uFePMOaNJu+H9LIxmXJ7c4vMqi2fFjp4b9q4a8KlG8NZKfWrxQTqj8ojzn3IHJLk
 dOtw==
X-Gm-Message-State: AO0yUKV6DA07m3PbEg7vKcy3JZh8QQ/OfzAthKGBtBDRHwCFA9I/em8n
 Ocr32Yc5ddckuNxOiUddO0V5FB2L9AwP9bKDKNjrTA==
X-Google-Smtp-Source: AK7set+aXTDYV7wFKByKnT/AoyMIOXBWAgau8kmhI7L9pb3HEk2ywMgTPYY156SvfN78GPHIu37UDRqUqT9Kct5MHE0=
X-Received: by 2002:a05:6402:1e8c:b0:48e:bad6:720c with SMTP id
 f12-20020a0564021e8c00b0048ebad6720cmr2056180edf.2.1675348157630; Thu, 02 Feb
 2023 06:29:17 -0800 (PST)
MIME-Version: 1.0
References: <20230202124230.295997-1-lawrence.hunter@codethink.co.uk>
 <20230202124230.295997-10-lawrence.hunter@codethink.co.uk>
In-Reply-To: <20230202124230.295997-10-lawrence.hunter@codethink.co.uk>
From: Philipp Tomsich <philipp.tomsich@vrull.eu>
Date: Thu, 2 Feb 2023 15:29:06 +0100
Message-ID: <CAAeLtUCG7DEwGAwEPjmH3tvacX5P4t6eAO5_pb4o2nKc3bwN8A@mail.gmail.com>
Subject: Re: [PATCH 09/39] target/riscv: Add vandn.[vv,vx,vi] decoding,
 translation and execution support
To: Lawrence Hunter <lawrence.hunter@codethink.co.uk>
Cc: qemu-devel@nongnu.org, dickon.hood@codethink.co.uk, 
 nazar.kazakov@codethink.co.uk, kiran.ostrolenk@codethink.co.uk, 
 frank.chang@sifive.com, palmer@dabbelt.com, alistair.francis@wdc.com, 
 bin.meng@windriver.com, pbonzini@redhat.com, kvm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=philipp.tomsich@vrull.eu; helo=mail-ed1-x52a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Thu, 2 Feb 2023 at 13:42, Lawrence Hunter
<lawrence.hunter@codethink.co.uk> wrote:
>
> From: Nazar Kazakov <nazar.kazakov@codethink.co.uk>
>
> Signed-off-by: Nazar Kazakov <nazar.kazakov@codethink.co.uk>
> ---
>  target/riscv/helper.h                      |  9 +++++++++
>  target/riscv/insn32.decode                 |  3 +++
>  target/riscv/insn_trans/trans_rvzvkb.c.inc |  5 +++++
>  target/riscv/vcrypto_helper.c              | 19 +++++++++++++++++++
>  4 files changed, 36 insertions(+)
>
> diff --git a/target/riscv/helper.h b/target/riscv/helper.h
> index c980d52828..5de615ea78 100644
> --- a/target/riscv/helper.h
> +++ b/target/riscv/helper.h
> @@ -1171,3 +1171,12 @@ DEF_HELPER_5(vbrev8_v_b, void, ptr, ptr, ptr, env, i32)
>  DEF_HELPER_5(vbrev8_v_h, void, ptr, ptr, ptr, env, i32)
>  DEF_HELPER_5(vbrev8_v_w, void, ptr, ptr, ptr, env, i32)
>  DEF_HELPER_5(vbrev8_v_d, void, ptr, ptr, ptr, env, i32)
> +
> +DEF_HELPER_6(vandn_vv_b, void, ptr, ptr, ptr, ptr, env, i32)
> +DEF_HELPER_6(vandn_vv_h, void, ptr, ptr, ptr, ptr, env, i32)
> +DEF_HELPER_6(vandn_vv_w, void, ptr, ptr, ptr, ptr, env, i32)
> +DEF_HELPER_6(vandn_vv_d, void, ptr, ptr, ptr, ptr, env, i32)
> +DEF_HELPER_6(vandn_vx_b, void, ptr, ptr, tl, ptr, env, i32)
> +DEF_HELPER_6(vandn_vx_h, void, ptr, ptr, tl, ptr, env, i32)
> +DEF_HELPER_6(vandn_vx_w, void, ptr, ptr, tl, ptr, env, i32)
> +DEF_HELPER_6(vandn_vx_d, void, ptr, ptr, tl, ptr, env, i32)
> diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
> index 342199abc0..d6f5e4d198 100644
> --- a/target/riscv/insn32.decode
> +++ b/target/riscv/insn32.decode
> @@ -904,3 +904,6 @@ vror_vi         010100 . ..... ..... 011 ..... 1010111 @r_vm
>  vror_vi2        010101 . ..... ..... 011 ..... 1010111 @r_vm
>  vbrev8_v        010010 . ..... 01000 010 ..... 1010111 @r2_vm
>  vrev8_v         010010 . ..... 01001 010 ..... 1010111 @r2_vm
> +vandn_vi        000001 . ..... ..... 011 ..... 1010111 @r_vm
> +vandn_vv        000001 . ..... ..... 000 ..... 1010111 @r_vm
> +vandn_vx        000001 . ..... ..... 100 ..... 1010111 @r_vm
> diff --git a/target/riscv/insn_trans/trans_rvzvkb.c.inc b/target/riscv/insn_trans/trans_rvzvkb.c.inc
> index 18b362db92..a973b27bdd 100644
> --- a/target/riscv/insn_trans/trans_rvzvkb.c.inc
> +++ b/target/riscv/insn_trans/trans_rvzvkb.c.inc
> @@ -147,6 +147,11 @@ static bool trans_##NAME(DisasContext *s, arg_rmr * a)                 \
>      return false;                                                      \
>  }
>
> +
> +GEN_OPIVV_TRANS(vandn_vv, zvkb_vv_check)
> +GEN_OPIVX_TRANS(vandn_vx, zvkb_vx_check)
> +GEN_OPIVI_TRANS(vandn_vi, IMM_SX, vandn_vx, zvkb_vx_check)

I don't see any reason why this shouldn't have gvec support (after
all, it is a andc with the arguments inverted) with something like
this:

static void gen_andn_i64(TCGv_i64 ret, TCGv_i64 arg1, TCGv_i64 arg2)
{
    tcg_gen_andc_i64(ret, arg1, arg2);
}

static void gen_andn_vec(unsigned vece, TCGv_vec r, TCGv_vec a, TCGv_vec b)
{
    tcg_gen_andc_vec(vece, r, b, a);
}

static void tcg_gen_gvec_andn(unsigned vece, uint32_t dofs, uint32_t aofs,
                       uint32_t bofs, uint32_t oprsz, uint32_t maxsz)
{
    static const GVecGen3 g = {
        .fni8 = gen_andn_i64,
        .fniv = gen_andn_vec,
        .fno = gen_helper_vec_andn,
        .prefer_i64 = TCG_TARGET_REG_BITS == 64,
    };

    if (aofs == bofs) {
        tcg_gen_gvec_dup_imm(MO_64, dofs, oprsz, maxsz, 0);
    } else {
        tcg_gen_gvec_3(dofs, aofs, bofs, oprsz, maxsz, &g);
    }
}

static void tcg_gen_gvec_andns(unsigned vece, uint32_t dofs, uint32_t aofs,
                               TCGv_i64 c, uint32_t oprsz, uint32_t maxsz)
{
    static const GVecGen2s g = {
        .fni8 = gen_andn_i64,
        .fniv = gen_andn_vec,
        .fno = gen_helper_vec_andns,
        .prefer_i64 = TCG_TARGET_REG_BITS == 64,
    };

    tcg_gen_gvec_2s(dofs, aofs, oprsz, maxsz, c, &g);
}

static void tcg_gen_gvec_andni(unsigned vece, uint32_t dofs, uint32_t aofs,
                               int64_t c, uint32_t oprsz, uint32_t maxsz)
{
    TCGv_i64 tmp = tcg_constant_i64(c);
    tcg_gen_gvec_andns(vece, dofs, aofs, tmp, oprsz, maxsz);
}

/* vandn.v[vxi] */
GEN_OPIVV_GVEC_TRANS_CHECK(vandn_vv, andn, zvkb_check_vv)
GEN_OPIVX_GVEC_TRANS_CHECK(vandn_vx, andns, zvkb_check_vx)
GEN_OPIVI_GVEC_TRANS_CHECK(vandn_vi, IMM_SX, vandn_vx, andni, zvkb_check_vi)

> +
>  static bool vxrev8_check(DisasContext *s, arg_rmr *a)
>  {
>      return s->cfg_ptr->ext_zvkb == true && vext_check_isa_ill(s) &&
> diff --git a/target/riscv/vcrypto_helper.c b/target/riscv/vcrypto_helper.c
> index b09fe5fa2a..900e68dfb0 100644
> --- a/target/riscv/vcrypto_helper.c
> +++ b/target/riscv/vcrypto_helper.c
> @@ -135,3 +135,22 @@ GEN_VEXT_V(vrev8_v_b, 1)
>  GEN_VEXT_V(vrev8_v_h, 2)
>  GEN_VEXT_V(vrev8_v_w, 4)
>  GEN_VEXT_V(vrev8_v_d, 8)
> +
> +#define DO_ANDN(a, b) ((b) & ~(a))
> +RVVCALL(OPIVV2, vandn_vv_b, OP_UUU_B, H1, H1, H1, DO_ANDN)
> +RVVCALL(OPIVV2, vandn_vv_h, OP_UUU_H, H2, H2, H2, DO_ANDN)
> +RVVCALL(OPIVV2, vandn_vv_w, OP_UUU_W, H4, H4, H4, DO_ANDN)
> +RVVCALL(OPIVV2, vandn_vv_d, OP_UUU_D, H8, H8, H8, DO_ANDN)
> +GEN_VEXT_VV(vandn_vv_b, 1)
> +GEN_VEXT_VV(vandn_vv_h, 2)
> +GEN_VEXT_VV(vandn_vv_w, 4)
> +GEN_VEXT_VV(vandn_vv_d, 8)
> +
> +RVVCALL(OPIVX2, vandn_vx_b, OP_UUU_B, H1, H1, DO_ANDN)
> +RVVCALL(OPIVX2, vandn_vx_h, OP_UUU_H, H2, H2, DO_ANDN)
> +RVVCALL(OPIVX2, vandn_vx_w, OP_UUU_W, H4, H4, DO_ANDN)
> +RVVCALL(OPIVX2, vandn_vx_d, OP_UUU_D, H8, H8, DO_ANDN)
> +GEN_VEXT_VX(vandn_vx_b, 1)
> +GEN_VEXT_VX(vandn_vx_h, 2)
> +GEN_VEXT_VX(vandn_vx_w, 4)
> +GEN_VEXT_VX(vandn_vx_d, 8)
> --
> 2.39.1
>

