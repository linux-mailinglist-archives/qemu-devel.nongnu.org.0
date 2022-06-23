Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 132385578F2
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Jun 2022 13:47:01 +0200 (CEST)
Received: from localhost ([::1]:41984 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4LIZ-0003Co-9T
	for lists+qemu-devel@lfdr.de; Thu, 23 Jun 2022 07:46:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43724)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o4LDS-0001lS-Q6
 for qemu-devel@nongnu.org; Thu, 23 Jun 2022 07:41:42 -0400
Received: from mail-yw1-x1132.google.com ([2607:f8b0:4864:20::1132]:43772)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o4LDL-0002rO-Ll
 for qemu-devel@nongnu.org; Thu, 23 Jun 2022 07:41:42 -0400
Received: by mail-yw1-x1132.google.com with SMTP id
 00721157ae682-3137316bb69so190830927b3.10
 for <qemu-devel@nongnu.org>; Thu, 23 Jun 2022 04:41:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mBPbFFItJe0dJACBuW0aoEDI6NyvpHnJzxnTq6KNHi8=;
 b=Yskr2tw5eGnSFMQGQGQFA9YnniQMkiggtlonZdyftVuzX8aP/2EuFY4tp30wRbLI3j
 XgQ4ObkguJrmgeYoZm4D675uxVyY3LqvyRk5FU7G7pFl62PYXHSpTaLK/hlb3T8tMzAC
 /9TDbPTR8Yk3bvcF6gmRi42meeN9adWQiUvw/4ZJJty30IrL4q92ROkjtMF++JYs0k5E
 NYTvqoEeI318Ibn50Yn8yiUxVQYt9dOYbn6+c6J/Qn1LcULMkmiozyAhdlkSKwBXQ7rN
 8rjD361fUywiEOrvWNNKkMRrBIo3z+0JRerTO9aYAOospUyG/omop+CkERHuIVaUEwew
 h46Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mBPbFFItJe0dJACBuW0aoEDI6NyvpHnJzxnTq6KNHi8=;
 b=xV7h0BIZ+nkF+hdp36wy2L8f2dn7DUT4g06sK5d4Ami5tqnkiMfOeRgmU8ObnPpEPa
 Vlyu04uYu4So42I32xdPPlZ1+Asbi3mwx85PTvrftc7jTtpkIiYomq/EK71P+dMOsKHQ
 6OBu2vpLFuwlrVohdNQCWmLgcgGpYcuMMFiNmZQSTEx0zA5tzweQNCeeFbmzqJqSZbgc
 pOzeAu0pCOeqPA08uEuxI1FrESbVLCiAh3ROIG581RbrEIk/5nnjnTcNtETgtHCqjlSq
 eUSZhlLPgh5Xl4s6tgv/s/C/J/QAdwVtSDAsaMccvI4mUn2Ol2LjIQMylngtNBUkz1dk
 5GFQ==
X-Gm-Message-State: AJIora+F8akjSGhN4xxvT0OCco9FAJqYXTq8psKJwUxrTFdEbnk1PUIM
 pS9q5IUhkXZgNKNGnQpx2hUxG8uJpP3NH9dQiMp2lg==
X-Google-Smtp-Source: AGRyM1uDCBIex0FjkrZ9Hm2eYAgeZ4w4ouTKzMR2C5OgZNKSvhDW1z+ychAA823yXnj08nGwnW4dOoZ6a3ePvIY3gtY=
X-Received: by 2002:a81:8d08:0:b0:317:a4cd:d65d with SMTP id
 d8-20020a818d08000000b00317a4cdd65dmr9947355ywg.329.1655984494464; Thu, 23
 Jun 2022 04:41:34 -0700 (PDT)
MIME-Version: 1.0
References: <20220620175235.60881-1-richard.henderson@linaro.org>
 <20220620175235.60881-27-richard.henderson@linaro.org>
In-Reply-To: <20220620175235.60881-27-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 23 Jun 2022 12:41:23 +0100
Message-ID: <CAFEAcA932Ud1PH4Az=NVW02mR8Q_GNmsH-kvLTRZ_TmCR8=Psg@mail.gmail.com>
Subject: Re: [PATCH v3 26/51] target/arm: Implement SME LD1, ST1
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1132;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1132.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On Mon, 20 Jun 2022 at 19:13, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> We cannot reuse the SVE functions for LD[1-4] and ST[1-4],
> because those functions accept only a Zreg register number.
> For SME, we want to pass a pointer into ZA storage.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/helper-sme.h    |  82 +++++
>  target/arm/sme.decode      |   9 +
>  target/arm/sme_helper.c    | 615 +++++++++++++++++++++++++++++++++++++
>  target/arm/translate-sme.c |  69 +++++
>  4 files changed, 775 insertions(+)




> +/*
> + * FIXME: The ARMVectorReg elements are stored in host-endian 64-bit units.
> + * We do not have a defined ordering of the 64-bit units for host-endian
> + * 128-bit quantities.  For now, just leave the host words in little-endian
> + * order and hope for the best.
> + */

I don't understand this comment. The architecture ought to specify
what order the two halves of a 128-bit quantity ought to go in the
ZArray storage. If we can't guarantee that a host int128_t can be
handled in a way that does the right thing, then we just can't
use int128_t.

> +#define DO_LDQ(HNAME, VNAME, BE, HOST, TLB)                                 \
> +static inline void HNAME##_host(void *za, intptr_t off, void *host)         \
> +{                                                                           \
> +    uint64_t val0 = HOST(host), val1 = HOST(host + 8);                      \
> +    uint64_t *ptr = za + off;                                               \
> +    ptr[0] = BE ? val1 : val0, ptr[1] = BE ? val0 : val1;                   \
> +}                                                                           \
> +static inline void VNAME##_v_host(void *za, intptr_t off, void *host)       \
> +{                                                                           \
> +    HNAME##_host(za, off * sizeof(ARMVectorReg), host);                     \
> +}                                                                           \

> +/*
> + * Common helper for all contiguous predicated loads.
> + */
> +
> +static inline QEMU_ALWAYS_INLINE
> +void sme_ld1(CPUARMState *env, void *za, uint64_t *vg,
> +             const target_ulong addr, uint32_t desc, const uintptr_t ra,
> +             const int esz, uint32_t mtedesc, bool vertical,
> +             sve_ldst1_host_fn *host_fn,
> +             sve_ldst1_tlb_fn *tlb_fn,
> +             ClearFn *clr_fn,
> +             CopyFn *cpy_fn)

We now have several rather long functions that are
pretty complicated and pretty similar handling the various
SVE and SME loads and stores. Is there really no hope for
sharing code ?


> diff --git a/target/arm/translate-sme.c b/target/arm/translate-sme.c
> index d2a7232491..978af74d1d 100644
> --- a/target/arm/translate-sme.c
> +++ b/target/arm/translate-sme.c
> @@ -151,3 +151,72 @@ static bool trans_MOVA(DisasContext *s, arg_MOVA *a)
>
>      return true;
>  }
> +
> +static bool trans_LDST1(DisasContext *s, arg_LDST1 *a)
> +{
> +    typedef void GenLdSt1(TCGv_env, TCGv_ptr, TCGv_ptr, TCGv, TCGv_i32);
> +
> +    /*
> +     * Indexed by [esz][be][v][mte][st], which is (except for load/store)
> +     * also the order in which the elements appear in the function names,
> +     * and so how we must concatenate the pieces.
> +     */
> +
> +#define FN_LS(F)     { gen_helper_sme_ld1##F, gen_helper_sme_st1##F }
> +#define FN_MTE(F)    { FN_LS(F), FN_LS(F##_mte) }
> +#define FN_HV(F)     { FN_MTE(F##_h), FN_MTE(F##_v) }
> +#define FN_END(L, B) { FN_HV(L), FN_HV(B) }
> +
> +    static GenLdSt1 * const fns[5][2][2][2][2] = {
> +        FN_END(b, b),
> +        FN_END(h_le, h_be),
> +        FN_END(s_le, s_be),
> +        FN_END(d_le, d_be),
> +        FN_END(q_le, q_be),
> +    };
> +
> +#undef FN_LS
> +#undef FN_MTE
> +#undef FN_HV
> +#undef FN_END
> +
> +    TCGv_ptr t_za, t_pg;
> +    TCGv_i64 addr;
> +    int desc = 0;
> +    bool be = s->be_data == MO_BE;
> +    bool mte = s->mte_active[0];
> +
> +    if (!dc_isar_feature(aa64_sme, s)) {
> +        return false;
> +    }
> +    if (!sme_smza_enabled_check(s)) {
> +        return true;
> +    }
> +
> +    t_za = get_tile_rowcol(s, a->esz, a->rs, a->za_imm, a->v);
> +    t_pg = pred_full_reg_ptr(s, a->pg);
> +    addr = tcg_temp_new_i64();
> +
> +    tcg_gen_shli_i64(addr, cpu_reg(s, a->rn), a->esz);
> +    tcg_gen_add_i64(addr, addr, cpu_reg_sp(s, a->rm));

Aren't rm and rn the wrong way around here?  The pseudocode
says that rn is the base (can be SP, not scaled) and rm is
the offset (can be XZR, scaled by mbytes).

> +
> +    if (mte) {
> +        desc = FIELD_DP32(desc, MTEDESC, MIDX, get_mem_index(s));
> +        desc = FIELD_DP32(desc, MTEDESC, TBI, s->tbid);
> +        desc = FIELD_DP32(desc, MTEDESC, TCMA, s->tcma);
> +        desc = FIELD_DP32(desc, MTEDESC, WRITE, a->st);
> +        desc = FIELD_DP32(desc, MTEDESC, SIZEM1, (1 << a->esz) - 1);
> +        desc <<= SVE_MTEDESC_SHIFT;
> +    } else {
> +        addr = clean_data_tbi(s, addr);
> +    }
> +    desc = simd_desc(s->svl, s->svl, desc);
> +
> +    fns[a->esz][be][a->v][mte][a->st](cpu_env, t_za, t_pg, addr,
> +                                      tcg_constant_i32(desc));
> +
> +    tcg_temp_free_ptr(t_za);
> +    tcg_temp_free_ptr(t_pg);
> +    tcg_temp_free_i64(addr);
> +    return true;
> +}

thanks
-- PMM

