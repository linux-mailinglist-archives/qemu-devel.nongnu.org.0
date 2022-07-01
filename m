Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AEEFB5637C2
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Jul 2022 18:22:51 +0200 (CEST)
Received: from localhost ([::1]:37922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o7JPu-0001bL-Cl
	for lists+qemu-devel@lfdr.de; Fri, 01 Jul 2022 12:22:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49830)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o7JNe-0007AR-Jh
 for qemu-devel@nongnu.org; Fri, 01 Jul 2022 12:20:30 -0400
Received: from mail-yw1-x1129.google.com ([2607:f8b0:4864:20::1129]:40545)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o7JNa-0004QV-1j
 for qemu-devel@nongnu.org; Fri, 01 Jul 2022 12:20:30 -0400
Received: by mail-yw1-x1129.google.com with SMTP id
 00721157ae682-317a66d62dfso28498547b3.7
 for <qemu-devel@nongnu.org>; Fri, 01 Jul 2022 09:20:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=S5JXIsE8vtDMYhj1krdNo6HvMnv2BFi9S40GbuScVMs=;
 b=ETk5/4LMJ40/Mto17Bytq5KTIkpxnLeZSSFhmmGq125GC1FrnEYbk9lRqUP8GIeF5L
 9mqSHWgQklB91R368evqr1iTg0G0I1a4rVwIqhARwA5fm95K5vWDvcE42mYCFkn8CWCs
 TSi6zGluw6OqIsbR0Wzk1XbDhCqiODFnYQhQdzsp8vmSzs53aFiy2XS+ewlfG46H91ir
 41mqR+3CNsDVoGiga87kiHg+iCeySUgWJnWbsUviie+2wuWZgaf0Jyv4AqbhK27N2oN0
 FB443yRI1FM7RANFAdvDWPb/5QjBwxjiarODOq+JfC483l4hKs6dpJW3ZnHrbesBP6OB
 4zdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=S5JXIsE8vtDMYhj1krdNo6HvMnv2BFi9S40GbuScVMs=;
 b=BNviIGltrro8EQyPnlajns4MCvv0m02BmmrMcmmQtqDSQOo1GPKC1kew71r9TG1GDt
 sR9QXDrOMhhebLNOl9C6BqL2CEIpeLm/s6167rgmCKHhmLdyzjgZAXAr3uq4FsMpaADn
 ldqtps063Ta+HVQelIIlFUyol/CH127Ne7k+yTR3d5oNNkqns1pLnU2brmCzWoDsC+HI
 ZCtKd9QEsDIZfY9oo3wbf9v0dLq5np/bLJIfITfetA2o4OdnGPjGxsxiVuR8Mk2KtoGD
 JOQPRhmEk+MiqW8mI4JkBim8m7dBmz7ZnYBF2gRq4MXzMULExeW7NFU/AnlHOdS1ztcN
 Y8WA==
X-Gm-Message-State: AJIora+ZESldwPYMC9BAWXxwaZJoqSiw4N90YuBAxsoYZoCms51jumL7
 XgXD9EfAeCV2FZZvb7L7RemRuUz4HUgZ6rkWFt56Wg==
X-Google-Smtp-Source: AGRyM1s2a0/AuXQD/aHctO9ZEuSvcwJ1Ia/sMRJR3Ccek2dM/KN6Inuqox93+CDNeyZd0C/S5xZUyxLezVYhYnnz8tc=
X-Received: by 2002:a0d:ca16:0:b0:31b:7adf:d91 with SMTP id
 m22-20020a0dca16000000b0031b7adf0d91mr17490604ywd.455.1656692423760; Fri, 01
 Jul 2022 09:20:23 -0700 (PDT)
MIME-Version: 1.0
References: <20220628042117.368549-1-richard.henderson@linaro.org>
 <20220628042117.368549-20-richard.henderson@linaro.org>
In-Reply-To: <20220628042117.368549-20-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 1 Jul 2022 17:19:45 +0100
Message-ID: <CAFEAcA-v6_atdSMggO7mAfW0H96F8s2fZWLD3biHLjsFnbzYgQ@mail.gmail.com>
Subject: Re: [PATCH v4 19/45] target/arm: Implement SME MOVA
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1129;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1129.google.com
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

On Tue, 28 Jun 2022 at 05:40, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> We can reuse the SVE functions for implementing moves to/from
> horizontal tile slices, but we need new ones for moves to/from
> vertical tile slices.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

> diff --git a/target/arm/sme_helper.c b/target/arm/sme_helper.c
> index eef2df73e1..95159862de 100644
> --- a/target/arm/sme_helper.c
> +++ b/target/arm/sme_helper.c
> @@ -19,8 +19,10 @@
>
>  #include "qemu/osdep.h"
>  #include "cpu.h"
> -#include "internals.h"

Did you mean to delete this #include line ?

> +#include "tcg/tcg-gvec-desc.h"
>  #include "exec/helper-proto.h"
> +#include "qemu/int128.h"
> +#include "vec_internal.h"
>
>  /* ResetSVEState */
>  void arm_reset_sve_state(CPUARMState *env)
> @@ -84,3 +86,111 @@ void helper_sme_zero(CPUARMState *env, uint32_t imm, uint32_t svl)
>          }
>      }
>  }
> +
> +/*
> + * Move Zreg vector to ZArray column.
> + */
> +#define DO_MOVA_C(NAME, TYPE, H)                                        \
> +void HELPER(NAME)(void *za, void *vn, void *vg, uint32_t desc)          \
> +{                                                                       \
> +    int i, oprsz = simd_oprsz(desc);                                    \
> +    for (i = 0; i < oprsz; ) {                                          \
> +        uint16_t pg = *(uint16_t *)(vg + H1_2(i >> 3));                 \
> +        do {                                                            \
> +            if (pg & 1) {                                               \
> +                *(TYPE *)za = *(TYPE *)(vn + H(i));                     \
> +            }                                                           \
> +            za += sizeof(ARMVectorReg) * sizeof(TYPE);                  \
> +            i += sizeof(TYPE);                                          \
> +            pg >>= sizeof(TYPE);                                        \
> +        } while (i & 15);                                               \
> +    }                                                                   \
> +}
> +
> +DO_MOVA_C(sme_mova_cz_b, uint8_t, H1)
> +DO_MOVA_C(sme_mova_cz_h, uint16_t, H2)
> +DO_MOVA_C(sme_mova_cz_s, uint32_t, H4)
> +
> +void HELPER(sme_mova_cz_d)(void *za, void *vn, void *vg, uint32_t desc)
> +{
> +    int i, oprsz = simd_oprsz(desc) / 8;
> +    uint8_t *pg = vg;
> +    uint64_t *n = vn;
> +    uint64_t *a = za;
> +
> +    for (i = 0; i < oprsz; i++) {
> +        if (pg[H1_2(i)] & 1) {

The documentation of the H macros says
"The H1_<N> macros are used when performing byte arithmetic and then
 casting the final pointer to a type of size N."
but we're not casting anything to a 2-byte type, so what's happening here?

> +            a[i * sizeof(ARMVectorReg)] = n[i];
> +        }
> +    }
> +}
> +
> +void HELPER(sme_mova_cz_q)(void *za, void *vn, void *vg, uint32_t desc)
> +{
> +    int i, oprsz = simd_oprsz(desc) / 16;
> +    uint16_t *pg = vg;
> +    Int128 *n = vn;
> +    Int128 *a = za;
> +
> +    for (i = 0; i < oprsz; i++) {
> +        if (pg[H2(i)] & 1) {
> +            a[i * sizeof(ARMVectorReg)] = n[i];

Is it really OK to do this with an Int128 store? That is
in host-order, but the two halves of a 128-bit quantity
in the ZA array are in architectural order. I suppose the
source also will have them in the architectural order, but
it does look odd, especially uncommented.

> +        }
> +    }
> +}
> +
> +#undef DO_MOVA_C

> diff --git a/target/arm/translate-sme.c b/target/arm/translate-sme.c
> index 971504559b..8e6881086b 100644
> --- a/target/arm/translate-sme.c
> +++ b/target/arm/translate-sme.c
> @@ -35,6 +35,77 @@
>  #include "decode-sme.c.inc"
>
>
> +static TCGv_ptr get_tile_rowcol(DisasContext *s, int esz, int rs,
> +                                int tile_index, bool vertical)
> +{
> +    int tile = tile_index >> (4 - esz);
> +    int index = esz == MO_128 ? 0 : extract32(tile_index, 0, 4 - esz);
> +    int pos, len, offset;
> +    TCGv_i32 t_index;
> +    TCGv_ptr addr;
> +
> +    /* Resolve tile.size[index] to an untyped ZA slice index. */
> +    t_index = tcg_temp_new_i32();
> +    tcg_gen_trunc_tl_i32(t_index, cpu_reg(s, rs));
> +    tcg_gen_addi_i32(t_index, t_index, index);

This code isn't doing what the comment says; it's just calculating
the (not-yet-taken-MOD-dim) slice index, which does depend on the type.

> +
> +    len = ctz32(streaming_vec_reg_size(s)) - esz;

What is this the length of ?

> +
> +    if (vertical) {

I ended up reviewing this function from bottom to top because to
me the horizontal case seemed simpler to understand first.
(As a result the review comments might read a bit out-of-order.)
Dunno if that justifies flipping the condition around, though.

> +        /*
> +         * Compute the offset of the index within the tile:

"byte offset" ?

> +         *     (index % (svl / size)) * size
> +         *   = (index % (svl >> esz)) << esz
> +         * Perform the power-of-two modulo via extraction of the low @len bits.
> +         * Perform the multiply by shifting left by @pos bits.
> +         * These two operations are performed simultaneously via deposit.
> +         */
> +        pos = esz;
> +        tcg_gen_deposit_z_i32(t_index, t_index, pos, len);

As an aside, this appears to be "deposit into a zero value", but
I had to go digging in the source to find that out, because we
don't document the semantics of this either in the header file
where this function is declared, or in a doc comment on the
implementation of it, or in tcg/README, or in docs/devel.
We really desperately need to document the interface the TCG
core code provides to frontends, because it's getting further
and further away from "it's functions to emit the IR ops
described in tcg/README, with obvious looking function names"...

> +
> +        /* The tile slice offset within env->zarray is the column offset. */
> +        offset = tile;

I don't understand why we can just add the tile index
(which is going to be an integer 0, 1, 2..) to a byte offset.
In the horizontal case we add tile * sizeof(ARMVectorReg),
which makes more sense to me.

> +
> +        /* Include the offset of zarray to make this relative to env. */
> +        offset += offsetof(CPUARMState, zarray);
> +        tcg_gen_addi_i32(t_index, t_index, offset);
> +
> +        /*
> +         * For big-endian, adjust the column slice offset within
> +         * the uint64_t host words that make up env->zarray.
> +         * This must wait until index and offset are combined.

Why? Neither the byte-offset of the start of the tile nor
the byte offset of zarray in CPUARMState ought to be non-8-aligned.

> +         */
> +        if (HOST_BIG_ENDIAN && esz < MO_64) {
> +            tcg_gen_xori_i32(t_index, t_index, 8 - (1 << esz));
> +        }
> +    } else {
> +        /*
> +         * Compute the offset of the index within the tile:

"byte offset", right ?

Also this is doing the "take index MOD dim" that the pseudocode
does as a preceding step at the same time, so we should mention that.

> +         *     (index % (svl / size)) * (size * sizeof(row))
> +         *   = (index % (svl >> esz)) << (esz + log2(sizeof(row)))
> +         */
> +        pos = esz + ctz32(sizeof(ARMVectorReg));
> +        tcg_gen_deposit_z_i32(t_index, t_index, pos, len);
> +
> +        /* The tile slice offset within env->zarray is the row offset. */
> +        offset = tile * sizeof(ARMVectorReg);
> +
> +        /* Include the offset of zarray to make this relative to env. */
> +        offset += offsetof(CPUARMState, zarray);
> +        tcg_gen_addi_i32(t_index, t_index, offset);
> +
> +        /* Row slices need no endian adjustment. */
> +    }
> +
> +    /* Add the offset to env to produce the final pointer. */
> +    addr = tcg_temp_new_ptr();
> +    tcg_gen_ext_i32_ptr(addr, t_index);
> +    tcg_temp_free_i32(t_index);
> +    tcg_gen_add_ptr(addr, addr, cpu_env);
> +
> +    return addr;
> +}

-- PMM

