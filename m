Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 916AB3B4A6D
	for <lists+qemu-devel@lfdr.de>; Sat, 26 Jun 2021 00:04:59 +0200 (CEST)
Received: from localhost ([::1]:40274 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwtwY-0006dj-KZ
	for lists+qemu-devel@lfdr.de; Fri, 25 Jun 2021 18:04:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39070)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <taylor.qemu@gmail.com>)
 id 1lwtum-0004yM-2k
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 18:03:08 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:36815)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <taylor.qemu@gmail.com>)
 id 1lwtud-0004jA-3x
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 18:03:07 -0400
Received: by mail-wr1-x432.google.com with SMTP id l12so11427548wrt.3
 for <qemu-devel@nongnu.org>; Fri, 25 Jun 2021 15:02:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/IDr1E7gQZbanI2SgiOVHits0QIuHyc0EPe/5IjzN5A=;
 b=VEwGyAq9FZEdcgheChBmoPHjTol0KnTN9RSnzr5MH8IhJ+FH/Xk4vZb3MOJA72fsrj
 gnKz+uMMvW1CwD86M5pLzw8i8U0ChZKo/Ac3PqttfFixuOlPQ381Iv9Jbny0xBotP/X4
 KFyiJoMuUEje4AvMdnyI6cdMY6sAvSznbv8cRlLFgEpr+daICLiYyvqTlAaccs80Cu/8
 ekInwrpFtPVlquMTl1XRZszZ6WqQwiS/wh55MVl/+w95Uzv2OhIEOXryuGIPoJ+sjuOG
 /vb/GO2cmxDy0+T1aem45F8Pg+RiiOiqtygcFhnT0pAl3uLifgaIdV3qkWKDui0CBlmx
 5rFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/IDr1E7gQZbanI2SgiOVHits0QIuHyc0EPe/5IjzN5A=;
 b=TGbOQl7PavYZ8wu29NEwLLXGZihLUGJybSJn4hCmYP33M7H15BPbGzWaT+zjiDuOk9
 Cw0OQgL9LlalmlO6JgdrdrRg1A4wDBH5RJRTvRKQibLpG4PQx/30GfPZTcW/oPiv0EzH
 d74xadp4cIlvwP0Yr9jZrrbkf4w68paFANcB1wxxwFVGvXHU4AD14+vTRra1Ep9dpueI
 GbK8sdYWozV1lQ6YKnpjXu3zn+/X5ww6LFQ/QglMXH5/vpc11DkpDgeE2Nw6Mv63I2DG
 HY1kIIRPggBHudJIQdSpF/bCxlB66eYFcRBy8Mm/M24p4udCkB8dK/XV39a85+JTEe0x
 eAvw==
X-Gm-Message-State: AOAM5338aJJT6SnG14IO9FH1cx2+zgHpeFrD+fUSbr56cEzceOk8HpKh
 P3LIFSPGmrzW2kbn6yzKBCzf/YwDO0MiNGJ0q5A=
X-Google-Smtp-Source: ABdhPJx3R95a7XpQgfA7z6P9axP9uObS1xetiSxJN/lmZA/Lpan5S7SXHaYDEsYIJ8y8h1PHm49/JkZcT/WEIbU31kc=
X-Received: by 2002:adf:f648:: with SMTP id x8mr13623371wrp.215.1624658576570; 
 Fri, 25 Jun 2021 15:02:56 -0700 (PDT)
MIME-Version: 1.0
References: <20210619093713.1845446-1-ale.qemu@rev.ng>
 <20210619093713.1845446-13-ale.qemu@rev.ng>
In-Reply-To: <20210619093713.1845446-13-ale.qemu@rev.ng>
From: Taylor Simpson <taylor.qemu@gmail.com>
Date: Fri, 25 Jun 2021 17:02:45 -0500
Message-ID: <CANji28ZibW3Q3YDBa_Cm7YGaFNpRxM1=-DFmczL1wYmFw=1moA@mail.gmail.com>
Subject: Re: [PATCH v5 12/14] target/hexagon: remove unused macros and
 functions
To: Alessandro Di Federico <ale.qemu@rev.ng>
Content-Type: multipart/alternative; boundary="000000000000567ced05c59e4d8c"
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=taylor.qemu@gmail.com; helo=mail-wr1-x432.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Alessandro Di Federico <ale@rev.ng>, bcain@quicinc.com,
 richard.henderson@linaro.org, qemu-devel@nongnu.org, babush@rev.ng,
 tsimpson@quicinc.com, nizzo@rev.ng, philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000567ced05c59e4d8c
Content-Type: text/plain; charset="UTF-8"

Don't do this.  Keeping these around makes it easy to fall back to the
helper implementations for debugging.  Also, some of them are needed for
future HVX support.

Thanks,
Taylor

On Sat, Jun 19, 2021 at 4:48 AM Alessandro Di Federico via <
qemu-devel@nongnu.org> wrote:

> From: Paolo Montesel <babush@rev.ng>
>
> Signed-off-by: Alessandro Di Federico <ale@rev.ng>
> Signed-off-by: Paolo Montesel <babush@rev.ng>
> ---
>  target/hexagon/gen_tcg.h   | 528 -------------------------------------
>  target/hexagon/genptr.c    |  98 -------
>  target/hexagon/macros.h    | 200 +-------------
>  target/hexagon/op_helper.c | 119 ---------
>  4 files changed, 9 insertions(+), 936 deletions(-)
>
> diff --git a/target/hexagon/gen_tcg.h b/target/hexagon/gen_tcg.h
> index 18fcdbc7e4..f1dd1b64c1 100644
> --- a/target/hexagon/gen_tcg.h
> +++ b/target/hexagon/gen_tcg.h
> @@ -43,381 +43,6 @@
>   *     _pcr      post increment circular register  r0 =
> memw(r1++I:circ(m0))
>   */
>
> -/* Macros for complex addressing modes */
> -#define GET_EA_ap \
> -    do { \
> -        fEA_IMM(UiV); \
> -        tcg_gen_movi_tl(ReV, UiV); \
> -    } while (0)
> -#define GET_EA_pr \
> -    do { \
> -        fEA_REG(RxV); \
> -        fPM_M(RxV, MuV); \
> -    } while (0)
> -#define GET_EA_pbr \
> -    do { \
> -        gen_helper_fbrev(EA, RxV); \
> -        tcg_gen_add_tl(RxV, RxV, MuV); \
> -    } while (0)
> -#define GET_EA_pi \
> -    do { \
> -        fEA_REG(RxV); \
> -        fPM_I(RxV, siV); \
> -    } while (0)
> -#define GET_EA_pci \
> -    do { \
> -        TCGv tcgv_siV = tcg_const_tl(siV); \
> -        tcg_gen_mov_tl(EA, RxV); \
> -        gen_helper_fcircadd(RxV, RxV, tcgv_siV, MuV, \
> -                            hex_gpr[HEX_REG_CS0 + MuN]); \
> -        tcg_temp_free(tcgv_siV); \
> -    } while (0)
> -#define GET_EA_pcr(SHIFT) \
> -    do { \
> -        TCGv ireg = tcg_temp_new(); \
> -        tcg_gen_mov_tl(EA, RxV); \
> -        gen_read_ireg(ireg, MuV, (SHIFT)); \
> -        gen_helper_fcircadd(RxV, RxV, ireg, MuV, hex_gpr[HEX_REG_CS0 +
> MuN]); \
> -        tcg_temp_free(ireg); \
> -    } while (0)
> -
> -/* Instructions with multiple definitions */
> -#define fGEN_TCG_LOAD_AP(RES, SIZE, SIGN) \
> -    do { \
> -        fMUST_IMMEXT(UiV); \
> -        fEA_IMM(UiV); \
> -        fLOAD(1, SIZE, SIGN, EA, RES); \
> -        tcg_gen_movi_tl(ReV, UiV); \
> -    } while (0)
> -
> -#define fGEN_TCG_L4_loadrub_ap(SHORTCODE) \
> -    fGEN_TCG_LOAD_AP(RdV, 1, u)
> -#define fGEN_TCG_L4_loadrb_ap(SHORTCODE) \
> -    fGEN_TCG_LOAD_AP(RdV, 1, s)
> -#define fGEN_TCG_L4_loadruh_ap(SHORTCODE) \
> -    fGEN_TCG_LOAD_AP(RdV, 2, u)
> -#define fGEN_TCG_L4_loadrh_ap(SHORTCODE) \
> -    fGEN_TCG_LOAD_AP(RdV, 2, s)
> -#define fGEN_TCG_L4_loadri_ap(SHORTCODE) \
> -    fGEN_TCG_LOAD_AP(RdV, 4, u)
> -#define fGEN_TCG_L4_loadrd_ap(SHORTCODE) \
> -    fGEN_TCG_LOAD_AP(RddV, 8, u)
> -
> -#define fGEN_TCG_L2_loadrub_pci(SHORTCODE)    SHORTCODE
> -#define fGEN_TCG_L2_loadrb_pci(SHORTCODE)     SHORTCODE
> -#define fGEN_TCG_L2_loadruh_pci(SHORTCODE)    SHORTCODE
> -#define fGEN_TCG_L2_loadrh_pci(SHORTCODE)     SHORTCODE
> -#define fGEN_TCG_L2_loadri_pci(SHORTCODE)     SHORTCODE
> -#define fGEN_TCG_L2_loadrd_pci(SHORTCODE)     SHORTCODE
> -
> -#define fGEN_TCG_LOAD_pcr(SHIFT, LOAD) \
> -    do { \
> -        TCGv ireg = tcg_temp_new(); \
> -        tcg_gen_mov_tl(EA, RxV); \
> -        gen_read_ireg(ireg, MuV, SHIFT); \
> -        gen_helper_fcircadd(RxV, RxV, ireg, MuV, hex_gpr[HEX_REG_CS0 +
> MuN]); \
> -        LOAD; \
> -        tcg_temp_free(ireg); \
> -    } while (0)
> -
> -#define fGEN_TCG_L2_loadrub_pcr(SHORTCODE) \
> -      fGEN_TCG_LOAD_pcr(0, fLOAD(1, 1, u, EA, RdV))
> -#define fGEN_TCG_L2_loadrb_pcr(SHORTCODE) \
> -      fGEN_TCG_LOAD_pcr(0, fLOAD(1, 1, s, EA, RdV))
> -#define fGEN_TCG_L2_loadruh_pcr(SHORTCODE) \
> -      fGEN_TCG_LOAD_pcr(1, fLOAD(1, 2, u, EA, RdV))
> -#define fGEN_TCG_L2_loadrh_pcr(SHORTCODE) \
> -      fGEN_TCG_LOAD_pcr(1, fLOAD(1, 2, s, EA, RdV))
> -#define fGEN_TCG_L2_loadri_pcr(SHORTCODE) \
> -      fGEN_TCG_LOAD_pcr(2, fLOAD(1, 4, u, EA, RdV))
> -#define fGEN_TCG_L2_loadrd_pcr(SHORTCODE) \
> -      fGEN_TCG_LOAD_pcr(3, fLOAD(1, 8, u, EA, RddV))
> -
> -#define fGEN_TCG_L2_loadrub_pr(SHORTCODE)      SHORTCODE
> -#define fGEN_TCG_L2_loadrub_pbr(SHORTCODE)     SHORTCODE
> -#define fGEN_TCG_L2_loadrub_pi(SHORTCODE)      SHORTCODE
> -#define fGEN_TCG_L2_loadrb_pr(SHORTCODE)       SHORTCODE
> -#define fGEN_TCG_L2_loadrb_pbr(SHORTCODE)      SHORTCODE
> -#define fGEN_TCG_L2_loadrb_pi(SHORTCODE)       SHORTCODE
> -#define fGEN_TCG_L2_loadruh_pr(SHORTCODE)      SHORTCODE
> -#define fGEN_TCG_L2_loadruh_pbr(SHORTCODE)     SHORTCODE
> -#define fGEN_TCG_L2_loadruh_pi(SHORTCODE)      SHORTCODE
> -#define fGEN_TCG_L2_loadrh_pr(SHORTCODE)       SHORTCODE
> -#define fGEN_TCG_L2_loadrh_pbr(SHORTCODE)      SHORTCODE
> -#define fGEN_TCG_L2_loadrh_pi(SHORTCODE)       SHORTCODE
> -#define fGEN_TCG_L2_loadri_pr(SHORTCODE)       SHORTCODE
> -#define fGEN_TCG_L2_loadri_pbr(SHORTCODE)      SHORTCODE
> -#define fGEN_TCG_L2_loadri_pi(SHORTCODE)       SHORTCODE
> -#define fGEN_TCG_L2_loadrd_pr(SHORTCODE)       SHORTCODE
> -#define fGEN_TCG_L2_loadrd_pbr(SHORTCODE)      SHORTCODE
> -#define fGEN_TCG_L2_loadrd_pi(SHORTCODE)       SHORTCODE
> -
> -/*
> - * These instructions load 2 bytes and places them in
> - * two halves of the destination register.
> - * The GET_EA macro determines the addressing mode.
> - * The SIGN argument determines whether to zero-extend or
> - * sign-extend.
> - */
> -#define fGEN_TCG_loadbXw2(GET_EA, SIGN) \
> -    do { \
> -        TCGv tmp = tcg_temp_new(); \
> -        TCGv byte = tcg_temp_new(); \
> -        GET_EA; \
> -        fLOAD(1, 2, u, EA, tmp); \
> -        tcg_gen_movi_tl(RdV, 0); \
> -        for (int i = 0; i < 2; i++) { \
> -            gen_set_half(i, RdV, gen_get_byte(byte, i, tmp, (SIGN))); \
> -        } \
> -        tcg_temp_free(tmp); \
> -        tcg_temp_free(byte); \
> -    } while (0)
> -
> -#define fGEN_TCG_L2_loadbzw2_io(SHORTCODE) \
> -    fGEN_TCG_loadbXw2(fEA_RI(RsV, siV), false)
> -#define fGEN_TCG_L4_loadbzw2_ur(SHORTCODE) \
> -    fGEN_TCG_loadbXw2(fEA_IRs(UiV, RtV, uiV), false)
> -#define fGEN_TCG_L2_loadbsw2_io(SHORTCODE) \
> -    fGEN_TCG_loadbXw2(fEA_RI(RsV, siV), true)
> -#define fGEN_TCG_L4_loadbsw2_ur(SHORTCODE) \
> -    fGEN_TCG_loadbXw2(fEA_IRs(UiV, RtV, uiV), true)
> -#define fGEN_TCG_L4_loadbzw2_ap(SHORTCODE) \
> -    fGEN_TCG_loadbXw2(GET_EA_ap, false)
> -#define fGEN_TCG_L2_loadbzw2_pr(SHORTCODE) \
> -    fGEN_TCG_loadbXw2(GET_EA_pr, false)
> -#define fGEN_TCG_L2_loadbzw2_pbr(SHORTCODE) \
> -    fGEN_TCG_loadbXw2(GET_EA_pbr, false)
> -#define fGEN_TCG_L2_loadbzw2_pi(SHORTCODE) \
> -    fGEN_TCG_loadbXw2(GET_EA_pi, false)
> -#define fGEN_TCG_L4_loadbsw2_ap(SHORTCODE) \
> -    fGEN_TCG_loadbXw2(GET_EA_ap, true)
> -#define fGEN_TCG_L2_loadbsw2_pr(SHORTCODE) \
> -    fGEN_TCG_loadbXw2(GET_EA_pr, true)
> -#define fGEN_TCG_L2_loadbsw2_pbr(SHORTCODE) \
> -    fGEN_TCG_loadbXw2(GET_EA_pbr, true)
> -#define fGEN_TCG_L2_loadbsw2_pi(SHORTCODE) \
> -    fGEN_TCG_loadbXw2(GET_EA_pi, true)
> -#define fGEN_TCG_L2_loadbzw2_pci(SHORTCODE) \
> -    fGEN_TCG_loadbXw2(GET_EA_pci, false)
> -#define fGEN_TCG_L2_loadbsw2_pci(SHORTCODE) \
> -    fGEN_TCG_loadbXw2(GET_EA_pci, true)
> -#define fGEN_TCG_L2_loadbzw2_pcr(SHORTCODE) \
> -    fGEN_TCG_loadbXw2(GET_EA_pcr(1), false)
> -#define fGEN_TCG_L2_loadbsw2_pcr(SHORTCODE) \
> -    fGEN_TCG_loadbXw2(GET_EA_pcr(1), true)
> -
> -/*
> - * These instructions load 4 bytes and places them in
> - * four halves of the destination register pair.
> - * The GET_EA macro determines the addressing mode.
> - * The SIGN argument determines whether to zero-extend or
> - * sign-extend.
> - */
> -#define fGEN_TCG_loadbXw4(GET_EA, SIGN) \
> -    do { \
> -        TCGv tmp = tcg_temp_new(); \
> -        TCGv byte = tcg_temp_new(); \
> -        GET_EA; \
> -        fLOAD(1, 4, u, EA, tmp);  \
> -        tcg_gen_movi_i64(RddV, 0); \
> -        for (int i = 0; i < 4; i++) { \
> -            gen_set_half_i64(i, RddV, gen_get_byte(byte, i, tmp,
> (SIGN)));  \
> -        }  \
> -        tcg_temp_free(tmp); \
> -        tcg_temp_free(byte); \
> -    } while (0)
> -
> -#define fGEN_TCG_L2_loadbzw4_io(SHORTCODE) \
> -    fGEN_TCG_loadbXw4(fEA_RI(RsV, siV), false)
> -#define fGEN_TCG_L4_loadbzw4_ur(SHORTCODE) \
> -    fGEN_TCG_loadbXw4(fEA_IRs(UiV, RtV, uiV), false)
> -#define fGEN_TCG_L2_loadbsw4_io(SHORTCODE) \
> -    fGEN_TCG_loadbXw4(fEA_RI(RsV, siV), true)
> -#define fGEN_TCG_L4_loadbsw4_ur(SHORTCODE) \
> -    fGEN_TCG_loadbXw4(fEA_IRs(UiV, RtV, uiV), true)
> -#define fGEN_TCG_L2_loadbzw4_pci(SHORTCODE) \
> -    fGEN_TCG_loadbXw4(GET_EA_pci, false)
> -#define fGEN_TCG_L2_loadbsw4_pci(SHORTCODE) \
> -    fGEN_TCG_loadbXw4(GET_EA_pci, true)
> -#define fGEN_TCG_L2_loadbzw4_pcr(SHORTCODE) \
> -    fGEN_TCG_loadbXw4(GET_EA_pcr(2), false)
> -#define fGEN_TCG_L2_loadbsw4_pcr(SHORTCODE) \
> -    fGEN_TCG_loadbXw4(GET_EA_pcr(2), true)
> -#define fGEN_TCG_L4_loadbzw4_ap(SHORTCODE) \
> -    fGEN_TCG_loadbXw4(GET_EA_ap, false)
> -#define fGEN_TCG_L2_loadbzw4_pr(SHORTCODE) \
> -    fGEN_TCG_loadbXw4(GET_EA_pr, false)
> -#define fGEN_TCG_L2_loadbzw4_pbr(SHORTCODE) \
> -    fGEN_TCG_loadbXw4(GET_EA_pbr, false)
> -#define fGEN_TCG_L2_loadbzw4_pi(SHORTCODE) \
> -    fGEN_TCG_loadbXw4(GET_EA_pi, false)
> -#define fGEN_TCG_L4_loadbsw4_ap(SHORTCODE) \
> -    fGEN_TCG_loadbXw4(GET_EA_ap, true)
> -#define fGEN_TCG_L2_loadbsw4_pr(SHORTCODE) \
> -    fGEN_TCG_loadbXw4(GET_EA_pr, true)
> -#define fGEN_TCG_L2_loadbsw4_pbr(SHORTCODE) \
> -    fGEN_TCG_loadbXw4(GET_EA_pbr, true)
> -#define fGEN_TCG_L2_loadbsw4_pi(SHORTCODE) \
> -    fGEN_TCG_loadbXw4(GET_EA_pi, true)
> -
> -/*
> - * These instructions load a half word, shift the destination right by 16
> bits
> - * and place the loaded value in the high half word of the destination
> pair.
> - * The GET_EA macro determines the addressing mode.
> - */
> -#define fGEN_TCG_loadalignh(GET_EA) \
> -    do { \
> -        TCGv tmp = tcg_temp_new(); \
> -        TCGv_i64 tmp_i64 = tcg_temp_new_i64(); \
> -        GET_EA;  \
> -        fLOAD(1, 2, u, EA, tmp);  \
> -        tcg_gen_extu_i32_i64(tmp_i64, tmp); \
> -        tcg_gen_shri_i64(RyyV, RyyV, 16); \
> -        tcg_gen_deposit_i64(RyyV, RyyV, tmp_i64, 48, 16); \
> -        tcg_temp_free(tmp); \
> -        tcg_temp_free_i64(tmp_i64); \
> -    } while (0)
> -
> -#define fGEN_TCG_L4_loadalignh_ur(SHORTCODE) \
> -    fGEN_TCG_loadalignh(fEA_IRs(UiV, RtV, uiV))
> -#define fGEN_TCG_L2_loadalignh_io(SHORTCODE) \
> -    fGEN_TCG_loadalignh(fEA_RI(RsV, siV))
> -#define fGEN_TCG_L2_loadalignh_pci(SHORTCODE) \
> -    fGEN_TCG_loadalignh(GET_EA_pci)
> -#define fGEN_TCG_L2_loadalignh_pcr(SHORTCODE) \
> -    fGEN_TCG_loadalignh(GET_EA_pcr(1))
> -#define fGEN_TCG_L4_loadalignh_ap(SHORTCODE) \
> -    fGEN_TCG_loadalignh(GET_EA_ap)
> -#define fGEN_TCG_L2_loadalignh_pr(SHORTCODE) \
> -    fGEN_TCG_loadalignh(GET_EA_pr)
> -#define fGEN_TCG_L2_loadalignh_pbr(SHORTCODE) \
> -    fGEN_TCG_loadalignh(GET_EA_pbr)
> -#define fGEN_TCG_L2_loadalignh_pi(SHORTCODE) \
> -    fGEN_TCG_loadalignh(GET_EA_pi)
> -
> -/* Same as above, but loads a byte instead of half word */
> -#define fGEN_TCG_loadalignb(GET_EA) \
> -    do { \
> -        TCGv tmp = tcg_temp_new(); \
> -        TCGv_i64 tmp_i64 = tcg_temp_new_i64(); \
> -        GET_EA;  \
> -        fLOAD(1, 1, u, EA, tmp);  \
> -        tcg_gen_extu_i32_i64(tmp_i64, tmp); \
> -        tcg_gen_shri_i64(RyyV, RyyV, 8); \
> -        tcg_gen_deposit_i64(RyyV, RyyV, tmp_i64, 56, 8); \
> -        tcg_temp_free(tmp); \
> -        tcg_temp_free_i64(tmp_i64); \
> -    } while (0)
> -
> -#define fGEN_TCG_L2_loadalignb_io(SHORTCODE) \
> -    fGEN_TCG_loadalignb(fEA_RI(RsV, siV))
> -#define fGEN_TCG_L4_loadalignb_ur(SHORTCODE) \
> -    fGEN_TCG_loadalignb(fEA_IRs(UiV, RtV, uiV))
> -#define fGEN_TCG_L2_loadalignb_pci(SHORTCODE) \
> -    fGEN_TCG_loadalignb(GET_EA_pci)
> -#define fGEN_TCG_L2_loadalignb_pcr(SHORTCODE) \
> -    fGEN_TCG_loadalignb(GET_EA_pcr(0))
> -#define fGEN_TCG_L4_loadalignb_ap(SHORTCODE) \
> -    fGEN_TCG_loadalignb(GET_EA_ap)
> -#define fGEN_TCG_L2_loadalignb_pr(SHORTCODE) \
> -    fGEN_TCG_loadalignb(GET_EA_pr)
> -#define fGEN_TCG_L2_loadalignb_pbr(SHORTCODE) \
> -    fGEN_TCG_loadalignb(GET_EA_pbr)
> -#define fGEN_TCG_L2_loadalignb_pi(SHORTCODE) \
> -    fGEN_TCG_loadalignb(GET_EA_pi)
> -
> -/*
> - * Predicated loads
> - * Here is a primer to understand the tag names
> - *
> - * Predicate used
> - *      t        true "old" value                  if (p0) r0 =
> memb(r2+#0)
> - *      f        false "old" value                 if (!p0) r0 =
> memb(r2+#0)
> - *      tnew     true "new" value                  if (p0.new) r0 =
> memb(r2+#0)
> - *      fnew     false "new" value                 if (!p0.new) r0 =
> memb(r2+#0)
> - */
> -#define fGEN_TCG_PRED_LOAD(GET_EA, PRED, SIZE, SIGN) \
> -    do { \
> -        TCGv LSB = tcg_temp_local_new(); \
> -        TCGLabel *label = gen_new_label(); \
> -        GET_EA; \
> -        PRED;  \
> -        PRED_LOAD_CANCEL(LSB, EA); \
> -        tcg_gen_movi_tl(RdV, 0); \
> -        tcg_gen_brcondi_tl(TCG_COND_EQ, LSB, 0, label); \
> -            fLOAD(1, SIZE, SIGN, EA, RdV); \
> -        gen_set_label(label); \
> -        tcg_temp_free(LSB); \
> -    } while (0)
> -
> -#define fGEN_TCG_L2_ploadrubt_pi(SHORTCODE) \
> -    fGEN_TCG_PRED_LOAD(GET_EA_pi, fLSBOLD(PtV), 1, u)
> -#define fGEN_TCG_L2_ploadrubf_pi(SHORTCODE) \
> -    fGEN_TCG_PRED_LOAD(GET_EA_pi, fLSBOLDNOT(PtV), 1, u)
> -#define fGEN_TCG_L2_ploadrubtnew_pi(SHORTCODE) \
> -    fGEN_TCG_PRED_LOAD(GET_EA_pi, fLSBNEW(PtN), 1, u)
> -#define fGEN_TCG_L2_ploadrubfnew_pi(SHORTCODE) \
> -    fGEN_TCG_PRED_LOAD(GET_EA_pi, fLSBNEWNOT(PtN), 1, u)
> -#define fGEN_TCG_L2_ploadrbt_pi(SHORTCODE) \
> -    fGEN_TCG_PRED_LOAD(GET_EA_pi, fLSBOLD(PtV), 1, s)
> -#define fGEN_TCG_L2_ploadrbf_pi(SHORTCODE) \
> -    fGEN_TCG_PRED_LOAD(GET_EA_pi, fLSBOLDNOT(PtV), 1, s)
> -#define fGEN_TCG_L2_ploadrbtnew_pi(SHORTCODE) \
> -    fGEN_TCG_PRED_LOAD(GET_EA_pi, fLSBNEW(PtN), 1, s)
> -#define fGEN_TCG_L2_ploadrbfnew_pi(SHORTCODE) \
> -    fGEN_TCG_PRED_LOAD({ fEA_REG(RxV); fPM_I(RxV, siV); }, \
> -                       fLSBNEWNOT(PtN), 1, s)
> -
> -#define fGEN_TCG_L2_ploadruht_pi(SHORTCODE) \
> -    fGEN_TCG_PRED_LOAD(GET_EA_pi, fLSBOLD(PtV), 2, u)
> -#define fGEN_TCG_L2_ploadruhf_pi(SHORTCODE) \
> -    fGEN_TCG_PRED_LOAD(GET_EA_pi, fLSBOLDNOT(PtV), 2, u)
> -#define fGEN_TCG_L2_ploadruhtnew_pi(SHORTCODE) \
> -    fGEN_TCG_PRED_LOAD(GET_EA_pi, fLSBNEW(PtN), 2, u)
> -#define fGEN_TCG_L2_ploadruhfnew_pi(SHORTCODE) \
> -    fGEN_TCG_PRED_LOAD(GET_EA_pi, fLSBNEWNOT(PtN), 2, u)
> -#define fGEN_TCG_L2_ploadrht_pi(SHORTCODE) \
> -    fGEN_TCG_PRED_LOAD(GET_EA_pi, fLSBOLD(PtV), 2, s)
> -#define fGEN_TCG_L2_ploadrhf_pi(SHORTCODE) \
> -    fGEN_TCG_PRED_LOAD(GET_EA_pi, fLSBOLDNOT(PtV), 2, s)
> -#define fGEN_TCG_L2_ploadrhtnew_pi(SHORTCODE) \
> -    fGEN_TCG_PRED_LOAD(GET_EA_pi, fLSBNEW(PtN), 2, s)
> -#define fGEN_TCG_L2_ploadrhfnew_pi(SHORTCODE) \
> -    fGEN_TCG_PRED_LOAD(GET_EA_pi, fLSBNEWNOT(PtN), 2, s)
> -
> -#define fGEN_TCG_L2_ploadrit_pi(SHORTCODE) \
> -    fGEN_TCG_PRED_LOAD(GET_EA_pi, fLSBOLD(PtV), 4, u)
> -#define fGEN_TCG_L2_ploadrif_pi(SHORTCODE) \
> -    fGEN_TCG_PRED_LOAD(GET_EA_pi, fLSBOLDNOT(PtV), 4, u)
> -#define fGEN_TCG_L2_ploadritnew_pi(SHORTCODE) \
> -    fGEN_TCG_PRED_LOAD(GET_EA_pi, fLSBNEW(PtN), 4, u)
> -#define fGEN_TCG_L2_ploadrifnew_pi(SHORTCODE) \
> -    fGEN_TCG_PRED_LOAD(GET_EA_pi, fLSBNEWNOT(PtN), 4, u)
> -
> -/* Predicated loads into a register pair */
> -#define fGEN_TCG_PRED_LOAD_PAIR(GET_EA, PRED) \
> -    do { \
> -        TCGv LSB = tcg_temp_local_new(); \
> -        TCGLabel *label = gen_new_label(); \
> -        GET_EA; \
> -        PRED;  \
> -        PRED_LOAD_CANCEL(LSB, EA); \
> -        tcg_gen_movi_i64(RddV, 0); \
> -        tcg_gen_brcondi_tl(TCG_COND_EQ, LSB, 0, label); \
> -            fLOAD(1, 8, u, EA, RddV); \
> -        gen_set_label(label); \
> -        tcg_temp_free(LSB); \
> -    } while (0)
> -
> -#define fGEN_TCG_L2_ploadrdt_pi(SHORTCODE) \
> -    fGEN_TCG_PRED_LOAD_PAIR(GET_EA_pi, fLSBOLD(PtV))
> -#define fGEN_TCG_L2_ploadrdf_pi(SHORTCODE) \
> -    fGEN_TCG_PRED_LOAD_PAIR(GET_EA_pi, fLSBOLDNOT(PtV))
> -#define fGEN_TCG_L2_ploadrdtnew_pi(SHORTCODE) \
> -    fGEN_TCG_PRED_LOAD_PAIR(GET_EA_pi, fLSBNEW(PtN))
> -#define fGEN_TCG_L2_ploadrdfnew_pi(SHORTCODE) \
> -    fGEN_TCG_PRED_LOAD_PAIR(GET_EA_pi, fLSBNEWNOT(PtN))
> -
>  /* load-locked and store-locked */
>  #define fGEN_TCG_L2_loadw_locked(SHORTCODE) \
>      SHORTCODE
> @@ -428,95 +53,6 @@
>  #define fGEN_TCG_S4_stored_locked(SHORTCODE) \
>      do { SHORTCODE; READ_PREG(PdV, PdN); } while (0)
>
> -#define fGEN_TCG_STORE(SHORTCODE) \
> -    do { \
> -        TCGv HALF = tcg_temp_new(); \
> -        TCGv BYTE = tcg_temp_new(); \
> -        SHORTCODE; \
> -        tcg_temp_free(HALF); \
> -        tcg_temp_free(BYTE); \
> -    } while (0)
> -
> -#define fGEN_TCG_STORE_pcr(SHIFT, STORE) \
> -    do { \
> -        TCGv ireg = tcg_temp_new(); \
> -        TCGv HALF = tcg_temp_new(); \
> -        TCGv BYTE = tcg_temp_new(); \
> -        tcg_gen_mov_tl(EA, RxV); \
> -        gen_read_ireg(ireg, MuV, SHIFT); \
> -        gen_helper_fcircadd(RxV, RxV, ireg, MuV, hex_gpr[HEX_REG_CS0 +
> MuN]); \
> -        STORE; \
> -        tcg_temp_free(ireg); \
> -        tcg_temp_free(HALF); \
> -        tcg_temp_free(BYTE); \
> -    } while (0)
> -
> -#define fGEN_TCG_S2_storerb_pbr(SHORTCODE) \
> -    fGEN_TCG_STORE(SHORTCODE)
> -#define fGEN_TCG_S2_storerb_pci(SHORTCODE) \
> -    fGEN_TCG_STORE(SHORTCODE)
> -#define fGEN_TCG_S2_storerb_pcr(SHORTCODE) \
> -    fGEN_TCG_STORE_pcr(0, fSTORE(1, 1, EA, fGETBYTE(0, RtV)))
> -
> -#define fGEN_TCG_S2_storerh_pbr(SHORTCODE) \
> -    fGEN_TCG_STORE(SHORTCODE)
> -#define fGEN_TCG_S2_storerh_pci(SHORTCODE) \
> -    fGEN_TCG_STORE(SHORTCODE)
> -#define fGEN_TCG_S2_storerh_pcr(SHORTCODE) \
> -    fGEN_TCG_STORE_pcr(1, fSTORE(1, 2, EA, fGETHALF(0, RtV)))
> -
> -#define fGEN_TCG_S2_storerf_pbr(SHORTCODE) \
> -    fGEN_TCG_STORE(SHORTCODE)
> -#define fGEN_TCG_S2_storerf_pci(SHORTCODE) \
> -    fGEN_TCG_STORE(SHORTCODE)
> -#define fGEN_TCG_S2_storerf_pcr(SHORTCODE) \
> -    fGEN_TCG_STORE_pcr(1, fSTORE(1, 2, EA, fGETHALF(1, RtV)))
> -
> -#define fGEN_TCG_S2_storeri_pbr(SHORTCODE) \
> -    fGEN_TCG_STORE(SHORTCODE)
> -#define fGEN_TCG_S2_storeri_pci(SHORTCODE) \
> -    fGEN_TCG_STORE(SHORTCODE)
> -#define fGEN_TCG_S2_storeri_pcr(SHORTCODE) \
> -    fGEN_TCG_STORE_pcr(2, fSTORE(1, 4, EA, RtV))
> -
> -#define fGEN_TCG_S2_storerd_pbr(SHORTCODE) \
> -    fGEN_TCG_STORE(SHORTCODE)
> -#define fGEN_TCG_S2_storerd_pci(SHORTCODE) \
> -    fGEN_TCG_STORE(SHORTCODE)
> -#define fGEN_TCG_S2_storerd_pcr(SHORTCODE) \
> -    fGEN_TCG_STORE_pcr(3, fSTORE(1, 8, EA, RttV))
> -
> -#define fGEN_TCG_S2_storerbnew_pbr(SHORTCODE) \
> -    fGEN_TCG_STORE(SHORTCODE)
> -#define fGEN_TCG_S2_storerbnew_pci(SHORTCODE) \
> -    fGEN_TCG_STORE(SHORTCODE)
> -#define fGEN_TCG_S2_storerbnew_pcr(SHORTCODE) \
> -    fGEN_TCG_STORE_pcr(0, fSTORE(1, 1, EA, fGETBYTE(0, NtN)))
> -
> -#define fGEN_TCG_S2_storerhnew_pbr(SHORTCODE) \
> -    fGEN_TCG_STORE(SHORTCODE)
> -#define fGEN_TCG_S2_storerhnew_pci(SHORTCODE) \
> -    fGEN_TCG_STORE(SHORTCODE)
> -#define fGEN_TCG_S2_storerhnew_pcr(SHORTCODE) \
> -    fGEN_TCG_STORE_pcr(1, fSTORE(1, 2, EA, fGETHALF(0, NtN)))
> -
> -#define fGEN_TCG_S2_storerinew_pbr(SHORTCODE) \
> -    fGEN_TCG_STORE(SHORTCODE)
> -#define fGEN_TCG_S2_storerinew_pci(SHORTCODE) \
> -    fGEN_TCG_STORE(SHORTCODE)
> -#define fGEN_TCG_S2_storerinew_pcr(SHORTCODE) \
> -    fGEN_TCG_STORE_pcr(2, fSTORE(1, 4, EA, NtN))
> -
> -/*
> - * Mathematical operations with more than one definition require
> - * special handling
> - */
> -#define fGEN_TCG_A5_ACS(SHORTCODE) \
> -    do { \
> -        gen_helper_vacsh_pred(PeV, cpu_env, RxxV, RssV, RttV); \
> -        gen_helper_vacsh_val(RxxV, cpu_env, RxxV, RssV, RttV); \
> -    } while (0)
> -
>  /*
>   * Approximate reciprocal
>   * r3,p1 = sfrecipa(r0, r1)
> @@ -549,70 +85,6 @@
>          tcg_temp_free_i64(tmp); \
>      } while (0)
>
> -/*
> - * Add or subtract with carry.
> - * Predicate register is used as an extra input and output.
> - * r5:4 = add(r1:0, r3:2, p1):carry
> - */
> -#define fGEN_TCG_A4_addp_c(SHORTCODE) \
> -    do { \
> -        TCGv_i64 carry = tcg_temp_new_i64(); \
> -        TCGv_i64 zero = tcg_const_i64(0); \
> -        tcg_gen_extu_i32_i64(carry, PxV); \
> -        tcg_gen_andi_i64(carry, carry, 1); \
> -        tcg_gen_add2_i64(RddV, carry, RssV, zero, carry, zero); \
> -        tcg_gen_add2_i64(RddV, carry, RddV, carry, RttV, zero); \
> -        tcg_gen_extrl_i64_i32(PxV, carry); \
> -        gen_8bitsof(PxV, PxV); \
> -        tcg_temp_free_i64(carry); \
> -        tcg_temp_free_i64(zero); \
> -    } while (0)
> -
> -/* r5:4 = sub(r1:0, r3:2, p1):carry */
> -#define fGEN_TCG_A4_subp_c(SHORTCODE) \
> -    do { \
> -        TCGv_i64 carry = tcg_temp_new_i64(); \
> -        TCGv_i64 zero = tcg_const_i64(0); \
> -        TCGv_i64 not_RttV = tcg_temp_new_i64(); \
> -        tcg_gen_extu_i32_i64(carry, PxV); \
> -        tcg_gen_andi_i64(carry, carry, 1); \
> -        tcg_gen_not_i64(not_RttV, RttV); \
> -        tcg_gen_add2_i64(RddV, carry, RssV, zero, carry, zero); \
> -        tcg_gen_add2_i64(RddV, carry, RddV, carry, not_RttV, zero); \
> -        tcg_gen_extrl_i64_i32(PxV, carry); \
> -        gen_8bitsof(PxV, PxV); \
> -        tcg_temp_free_i64(carry); \
> -        tcg_temp_free_i64(zero); \
> -        tcg_temp_free_i64(not_RttV); \
> -    } while (0)
> -
> -/*
> - * Compare each of the 8 unsigned bytes
> - * The minimum is placed in each byte of the destination.
> - * Each bit of the predicate is set true if the bit from the first operand
> - * is greater than the bit from the second operand.
> - * r5:4,p1 = vminub(r1:0, r3:2)
> - */
> -#define fGEN_TCG_A6_vminub_RdP(SHORTCODE) \
> -    do { \
> -        TCGv left = tcg_temp_new(); \
> -        TCGv right = tcg_temp_new(); \
> -        TCGv tmp = tcg_temp_new(); \
> -        tcg_gen_movi_tl(PeV, 0); \
> -        tcg_gen_movi_i64(RddV, 0); \
> -        for (int i = 0; i < 8; i++) { \
> -            gen_get_byte_i64(left, i, RttV, false); \
> -            gen_get_byte_i64(right, i, RssV, false); \
> -            tcg_gen_setcond_tl(TCG_COND_GT, tmp, left, right); \
> -            tcg_gen_deposit_tl(PeV, PeV, tmp, i, 1); \
> -            tcg_gen_umin_tl(tmp, left, right); \
> -            gen_set_byte_i64(i, RddV, tmp); \
> -        } \
> -        tcg_temp_free(left); \
> -        tcg_temp_free(right); \
> -        tcg_temp_free(tmp); \
> -    } while (0)
> -
>  /* Floating point */
>  #define fGEN_TCG_F2_conv_sf2df(SHORTCODE) \
>      gen_helper_conv_sf2df(RddV, cpu_env, RsV)
> diff --git a/target/hexagon/genptr.c b/target/hexagon/genptr.c
> index cf45c28f58..0e8378ac57 100644
> --- a/target/hexagon/genptr.c
> +++ b/target/hexagon/genptr.c
> @@ -274,61 +274,6 @@ static inline void
> gen_write_ctrl_reg_pair(DisasContext *ctx, int reg_num,
>      }
>  }
>
> -static TCGv gen_get_byte(TCGv result, int N, TCGv src, bool sign)
> -{
> -    if (sign) {
> -        tcg_gen_sextract_tl(result, src, N * 8, 8);
> -    } else {
> -        tcg_gen_extract_tl(result, src, N * 8, 8);
> -    }
> -    return result;
> -}
> -
> -static TCGv gen_get_byte_i64(TCGv result, int N, TCGv_i64 src, bool sign)
> -{
> -    TCGv_i64 res64 = tcg_temp_new_i64();
> -    if (sign) {
> -        tcg_gen_sextract_i64(res64, src, N * 8, 8);
> -    } else {
> -        tcg_gen_extract_i64(res64, src, N * 8, 8);
> -    }
> -    tcg_gen_extrl_i64_i32(result, res64);
> -    tcg_temp_free_i64(res64);
> -
> -    return result;
> -}
> -
> -static inline TCGv gen_get_half(TCGv result, int N, TCGv src, bool sign)
> -{
> -    if (sign) {
> -        tcg_gen_sextract_tl(result, src, N * 16, 16);
> -    } else {
> -        tcg_gen_extract_tl(result, src, N * 16, 16);
> -    }
> -    return result;
> -}
> -
> -static inline void gen_set_half(int N, TCGv result, TCGv src)
> -{
> -    tcg_gen_deposit_tl(result, result, src, N * 16, 16);
> -}
> -
> -static inline void gen_set_half_i64(int N, TCGv_i64 result, TCGv src)
> -{
> -    TCGv_i64 src64 = tcg_temp_new_i64();
> -    tcg_gen_extu_i32_i64(src64, src);
> -    tcg_gen_deposit_i64(result, result, src64, N * 16, 16);
> -    tcg_temp_free_i64(src64);
> -}
> -
> -static void gen_set_byte_i64(int N, TCGv_i64 result, TCGv src)
> -{
> -    TCGv_i64 src64 = tcg_temp_new_i64();
> -    tcg_gen_extu_i32_i64(src64, src);
> -    tcg_gen_deposit_i64(result, result, src64, N * 8, 8);
> -    tcg_temp_free_i64(src64);
> -}
> -
>  static inline void gen_load_locked4u(TCGv dest, TCGv vaddr, int mem_index)
>  {
>      tcg_gen_qemu_ld32u(dest, vaddr, mem_index);
> @@ -417,42 +362,18 @@ void gen_store1(TCGv_env cpu_env, TCGv vaddr, TCGv
> src, DisasContext *ctx,
>      gen_store32(ctx, vaddr, src, 1, slot);
>  }
>
> -static inline void gen_store1i(TCGv_env cpu_env, TCGv vaddr, int32_t src,
> -                               DisasContext *ctx, int slot)
> -{
> -    TCGv tmp = tcg_const_tl(src);
> -    gen_store1(cpu_env, vaddr, tmp, ctx, slot);
> -    tcg_temp_free(tmp);
> -}
> -
>  void gen_store2(TCGv_env cpu_env, TCGv vaddr, TCGv src, DisasContext *ctx,
>                  unsigned slot)
>  {
>      gen_store32(ctx, vaddr, src, 2, slot);
>  }
>
> -static inline void gen_store2i(TCGv_env cpu_env, TCGv vaddr, int32_t src,
> -                               DisasContext *ctx, int slot)
> -{
> -    TCGv tmp = tcg_const_tl(src);
> -    gen_store2(cpu_env, vaddr, tmp, ctx, slot);
> -    tcg_temp_free(tmp);
> -}
> -
>  void gen_store4(TCGv_env cpu_env, TCGv vaddr, TCGv src, DisasContext *ctx,
>                  unsigned slot)
>  {
>      gen_store32(ctx, vaddr, src, 4, slot);
>  }
>
> -static inline void gen_store4i(TCGv_env cpu_env, TCGv vaddr, int32_t src,
> -                               DisasContext *ctx, int slot)
> -{
> -    TCGv tmp = tcg_const_tl(src);
> -    gen_store4(cpu_env, vaddr, tmp, ctx, slot);
> -    tcg_temp_free(tmp);
> -}
> -
>  void gen_store8(TCGv_env cpu_env, TCGv vaddr, TCGv_i64 src, DisasContext
> *ctx,
>                  unsigned slot)
>  {
> @@ -462,25 +383,6 @@ void gen_store8(TCGv_env cpu_env, TCGv vaddr,
> TCGv_i64 src, DisasContext *ctx,
>      ctx->store_width[slot] = 8;
>  }
>
> -static inline void gen_store8i(TCGv_env cpu_env, TCGv vaddr, int64_t src,
> -                               DisasContext *ctx, int slot)
> -{
> -    TCGv_i64 tmp = tcg_const_i64(src);
> -    gen_store8(cpu_env, vaddr, tmp, ctx, slot);
> -    tcg_temp_free_i64(tmp);
> -}
> -
> -static TCGv gen_8bitsof(TCGv result, TCGv value)
> -{
> -    TCGv zero = tcg_const_tl(0);
> -    TCGv ones = tcg_const_tl(0xff);
> -    tcg_gen_movcond_tl(TCG_COND_NE, result, value, zero, ones, zero);
> -    tcg_temp_free(zero);
> -    tcg_temp_free(ones);
> -
> -    return result;
> -}
> -
>  void gen_set_usr_field(int field, TCGv val)
>  {
>      tcg_gen_deposit_tl(hex_gpr[HEX_REG_USR], hex_gpr[HEX_REG_USR], val,
> diff --git a/target/hexagon/macros.h b/target/hexagon/macros.h
> index 7d09501844..56d33dc144 100644
> --- a/target/hexagon/macros.h
> +++ b/target/hexagon/macros.h
> @@ -67,105 +67,7 @@
>                   reg_field_info[FIELD].offset, (VAL))
>  #endif
>
> -#ifdef QEMU_GENERATE
> -/*
> - * Section 5.5 of the Hexagon V67 Programmer's Reference Manual
> - *
> - * Slot 1 store with slot 0 load
> - * A slot 1 store operation with a slot 0 load operation can appear in a
> packet.
> - * The packet attribute :mem_noshuf inhibits the instruction reordering
> that
> - * would otherwise be done by the assembler. For example:
> - *     {
> - *         memw(R5) = R2 // slot 1 store
> - *         R3 = memh(R6) // slot 0 load
> - *     }:mem_noshuf
> - * Unlike most packetized operations, these memory operations are not
> executed
> - * in parallel (Section 3.3.1). Instead, the store instruction in Slot 1
> - * effectively executes first, followed by the load instruction in Slot
> 0. If
> - * the addresses of the two operations are overlapping, the load will
> receive
> - * the newly stored data. This feature is supported in processor versions
> - * V65 or greater.
> - *
> - *
> - * For qemu, we look for a load in slot 0 when there is  a store in slot 1
> - * in the same packet.  When we see this, we call a helper that merges the
> - * bytes from the store buffer with the value loaded from memory.
> - */
> -#define CHECK_NOSHUF \
> -    do { \
> -        if (insn->slot == 0 && pkt->pkt_has_store_s1) { \
> -            process_store(ctx, pkt, 1); \
> -        } \
> -    } while (0)
> -
> -#define MEM_LOAD1s(DST, VA) \
> -    do { \
> -        CHECK_NOSHUF; \
> -        tcg_gen_qemu_ld8s(DST, VA, ctx->mem_idx); \
> -    } while (0)
> -#define MEM_LOAD1u(DST, VA) \
> -    do { \
> -        CHECK_NOSHUF; \
> -        tcg_gen_qemu_ld8u(DST, VA, ctx->mem_idx); \
> -    } while (0)
> -#define MEM_LOAD2s(DST, VA) \
> -    do { \
> -        CHECK_NOSHUF; \
> -        tcg_gen_qemu_ld16s(DST, VA, ctx->mem_idx); \
> -    } while (0)
> -#define MEM_LOAD2u(DST, VA) \
> -    do { \
> -        CHECK_NOSHUF; \
> -        tcg_gen_qemu_ld16u(DST, VA, ctx->mem_idx); \
> -    } while (0)
> -#define MEM_LOAD4s(DST, VA) \
> -    do { \
> -        CHECK_NOSHUF; \
> -        tcg_gen_qemu_ld32s(DST, VA, ctx->mem_idx); \
> -    } while (0)
> -#define MEM_LOAD4u(DST, VA) \
> -    do { \
> -        CHECK_NOSHUF; \
> -        tcg_gen_qemu_ld32s(DST, VA, ctx->mem_idx); \
> -    } while (0)
> -#define MEM_LOAD8u(DST, VA) \
> -    do { \
> -        CHECK_NOSHUF; \
> -        tcg_gen_qemu_ld64(DST, VA, ctx->mem_idx); \
> -    } while (0)
> -
> -#define MEM_STORE1_FUNC(X) \
> -    __builtin_choose_expr(TYPE_INT(X), \
> -        gen_store1i, \
> -        __builtin_choose_expr(TYPE_TCGV(X), \
> -            gen_store1, (void)0))
> -#define MEM_STORE1(VA, DATA, SLOT) \
> -    MEM_STORE1_FUNC(DATA)(cpu_env, VA, DATA, ctx, SLOT)
> -
> -#define MEM_STORE2_FUNC(X) \
> -    __builtin_choose_expr(TYPE_INT(X), \
> -        gen_store2i, \
> -        __builtin_choose_expr(TYPE_TCGV(X), \
> -            gen_store2, (void)0))
> -#define MEM_STORE2(VA, DATA, SLOT) \
> -    MEM_STORE2_FUNC(DATA)(cpu_env, VA, DATA, ctx, SLOT)
> -
> -#define MEM_STORE4_FUNC(X) \
> -    __builtin_choose_expr(TYPE_INT(X), \
> -        gen_store4i, \
> -        __builtin_choose_expr(TYPE_TCGV(X), \
> -            gen_store4, (void)0))
> -#define MEM_STORE4(VA, DATA, SLOT) \
> -    MEM_STORE4_FUNC(DATA)(cpu_env, VA, DATA, ctx, SLOT)
> -
> -#define MEM_STORE8_FUNC(X) \
> -    __builtin_choose_expr(TYPE_INT(X), \
> -        gen_store8i, \
> -        __builtin_choose_expr(TYPE_TCGV_I64(X), \
> -            gen_store8, (void)0))
> -#define MEM_STORE8(VA, DATA, SLOT) \
> -    MEM_STORE8_FUNC(DATA)(cpu_env, VA, DATA, ctx, SLOT)
> -#else
> +#ifndef QEMU_GENERATE
>  #define MEM_LOAD1s(VA) ((int8_t)mem_load1(env, slot, VA))
>  #define MEM_LOAD1u(VA) ((uint8_t)mem_load1(env, slot, VA))
>  #define MEM_LOAD2s(VA) ((int16_t)mem_load2(env, slot, VA))
> @@ -194,26 +96,6 @@ static inline void gen_cancel(unsigned slot)
>
>  #define LOAD_CANCEL(EA) do { CANCEL; } while (0)
>
> -#ifdef QEMU_GENERATE
> -static inline void gen_pred_cancel(TCGv pred, unsigned slot_num)
> - {
> -    TCGv slot_mask = tcg_const_tl(1 << slot_num);
> -    TCGv tmp = tcg_temp_new();
> -    TCGv zero = tcg_const_tl(0);
> -    TCGv one = tcg_const_tl(1);
> -    tcg_gen_or_tl(slot_mask, hex_slot_cancelled, slot_mask);
> -    tcg_gen_andi_tl(tmp, pred, 1);
> -    tcg_gen_movcond_tl(TCG_COND_EQ, hex_slot_cancelled, tmp, zero,
> -                       slot_mask, hex_slot_cancelled);
> -    tcg_temp_free(slot_mask);
> -    tcg_temp_free(tmp);
> -    tcg_temp_free(zero);
> -    tcg_temp_free(one);
> -}
> -#define PRED_LOAD_CANCEL(PRED, EA) \
> -    gen_pred_cancel(PRED, insn->is_endloop ? 4 : insn->slot)
> -#endif
> -
>  #define STORE_CANCEL(EA) { env->slot_cancelled |= (1 << slot); }
>
>  #define fMAX(A, B) (((A) > (B)) ? (A) : (B))
> @@ -241,41 +123,17 @@ static inline void gen_pred_cancel(TCGv pred,
> unsigned slot_num)
>
>  #define f8BITSOF(VAL) ((VAL) ? 0xff : 0x00)
>
> -#ifdef QEMU_GENERATE
> -#define fLSBOLD(VAL) tcg_gen_andi_tl(LSB, (VAL), 1)
> -#else
> +#ifndef QEMU_GENERATE
>  #define fLSBOLD(VAL)  ((VAL) & 1)
>  #endif
>
> -#ifdef QEMU_GENERATE
> -#define fLSBNEW(PVAL)   tcg_gen_mov_tl(LSB, (PVAL))
> -#define fLSBNEW0        tcg_gen_mov_tl(LSB, hex_new_pred_value[0])
> -#define fLSBNEW1        tcg_gen_mov_tl(LSB, hex_new_pred_value[1])
> -#else
> +#ifndef QEMU_GENERATE
>  #define fLSBNEW(PVAL)   (PVAL)
>  #define fLSBNEW0        new_pred_value(env, 0)
>  #define fLSBNEW1        new_pred_value(env, 1)
>  #endif
>
> -#ifdef QEMU_GENERATE
> -static inline void gen_logical_not(TCGv dest, TCGv src)
> -{
> -    TCGv one = tcg_const_tl(1);
> -    TCGv zero = tcg_const_tl(0);
> -
> -    tcg_gen_movcond_tl(TCG_COND_NE, dest, src, zero, zero, one);
> -
> -    tcg_temp_free(one);
> -    tcg_temp_free(zero);
> -}
> -#define fLSBOLDNOT(VAL) \
> -    do { \
> -        tcg_gen_andi_tl(LSB, (VAL), 1); \
> -        tcg_gen_xori_tl(LSB, LSB, 1); \
> -    } while (0)
> -#define fLSBNEWNOT(PNUM) \
> -    gen_logical_not(LSB, (PNUM))
> -#else
> +#ifndef QEMU_GENERATE
>  #define fLSBNEWNOT(PNUM) (!fLSBNEW(PNUM))
>  #define fLSBOLDNOT(VAL) (!fLSBOLD(VAL))
>  #define fLSBNEW0NOT (!fLSBNEW0)
> @@ -481,21 +339,7 @@ static inline TCGv gen_read_ireg(TCGv result, TCGv
> val, int shift)
>  #define fCAST8S_16S(A) (int128_exts64(A))
>  #define fCAST16S_8S(A) (int128_getlo(A))
>
> -#ifdef QEMU_GENERATE
> -#define fEA_RI(REG, IMM) tcg_gen_addi_tl(EA, REG, IMM)
> -#define fEA_RRs(REG, REG2, SCALE) \
> -    do { \
> -        TCGv tmp = tcg_temp_new(); \
> -        tcg_gen_shli_tl(tmp, REG2, SCALE); \
> -        tcg_gen_add_tl(EA, REG, tmp); \
> -        tcg_temp_free(tmp); \
> -    } while (0)
> -#define fEA_IRs(IMM, REG, SCALE) \
> -    do { \
> -        tcg_gen_shli_tl(EA, REG, SCALE); \
> -        tcg_gen_addi_tl(EA, EA, IMM); \
> -    } while (0)
> -#else
> +#ifndef QEMU_GENERATE
>  #define fEA_RI(REG, IMM) \
>      do { \
>          EA = REG + IMM; \
> @@ -511,18 +355,7 @@ static inline TCGv gen_read_ireg(TCGv result, TCGv
> val, int shift)
>  #endif
>
>  #ifdef QEMU_GENERATE
> -#define fEA_IMM(IMM) tcg_gen_movi_tl(EA, IMM)
>  #define fEA_REG(REG) tcg_gen_mov_tl(EA, REG)
> -#define fEA_BREVR(REG)      gen_helper_fbrev(EA, REG)
> -#define fPM_I(REG, IMM)     tcg_gen_addi_tl(REG, REG, IMM)
> -#define fPM_M(REG, MVAL)    tcg_gen_add_tl(REG, REG, MVAL)
> -#define fPM_CIRI(REG, IMM, MVAL) \
> -    do { \
> -        TCGv tcgv_siV = tcg_const_tl(siV); \
> -        gen_helper_fcircadd(REG, REG, tcgv_siV, MuV, \
> -                            hex_gpr[HEX_REG_CS0 + MuN]); \
> -        tcg_temp_free(tcgv_siV); \
> -    } while (0)
>  #else
>  #define fEA_IMM(IMM)        do { EA = (IMM); } while (0)
>  #define fEA_REG(REG)        do { EA = (REG); } while (0)
> @@ -574,9 +407,7 @@ static inline TCGv gen_read_ireg(TCGv result, TCGv
> val, int shift)
>  #define fASHIFTL(SRC, SHAMT, REGSTYPE) \
>      (((SHAMT) >= (sizeof(SRC) * 8)) ? 0 : (fCAST##REGSTYPE##s(SRC) <<
> (SHAMT)))
>
> -#ifdef QEMU_GENERATE
> -#define fLOAD(NUM, SIZE, SIGN, EA, DST) MEM_LOAD##SIZE##SIGN(DST, EA)
> -#else
> +#ifndef QEMU_GENERATE
>  #define fLOAD(NUM, SIZE, SIGN, EA, DST) \
>      DST = (size##SIZE##SIGN##_t)MEM_LOAD##SIZE##SIGN(EA)
>  #endif
> @@ -599,9 +430,7 @@ static inline TCGv gen_read_ireg(TCGv result, TCGv
> val, int shift)
>      gen_load_locked##SIZE##SIGN(DST, EA, ctx->mem_idx);
>  #endif
>
> -#ifdef QEMU_GENERATE
> -#define fSTORE(NUM, SIZE, EA, SRC) MEM_STORE##SIZE(EA, SRC, insn->slot)
> -#else
> +#ifndef QEMU_GENERATE
>  #define fSTORE(NUM, SIZE, EA, SRC) MEM_STORE##SIZE(EA, SRC, slot)
>  #endif
>
> @@ -610,15 +439,7 @@ static inline TCGv gen_read_ireg(TCGv result, TCGv
> val, int shift)
>      gen_store_conditional##SIZE(env, ctx, PdN, PRED, EA, SRC);
>  #endif
>
> -#ifdef QEMU_GENERATE
> -#define GETBYTE_FUNC(X) \
> -    __builtin_choose_expr(TYPE_TCGV(X), \
> -        gen_get_byte, \
> -        __builtin_choose_expr(TYPE_TCGV_I64(X), \
> -            gen_get_byte_i64, (void)0))
> -#define fGETBYTE(N, SRC) GETBYTE_FUNC(SRC)(BYTE, N, SRC, true)
> -#define fGETUBYTE(N, SRC) GETBYTE_FUNC(SRC)(BYTE, N, SRC, false)
> -#else
> +#ifndef QEMU_GENERATE
>  #define fGETBYTE(N, SRC) ((int8_t)((SRC >> ((N) * 8)) & 0xff))
>  #define fGETUBYTE(N, SRC) ((uint8_t)((SRC >> ((N) * 8)) & 0xff))
>  #endif
> @@ -629,10 +450,7 @@ static inline TCGv gen_read_ireg(TCGv result, TCGv
> val, int shift)
>          (((uint64_t)((VAL) & 0x0ffLL)) << ((N) * 8)); \
>      } while (0)
>
> -#ifdef QEMU_GENERATE
> -#define fGETHALF(N, SRC)  gen_get_half(HALF, N, SRC, true)
> -#define fGETUHALF(N, SRC) gen_get_half(HALF, N, SRC, false)
> -#else
> +#ifndef QEMU_GENERATE
>  #define fGETHALF(N, SRC) ((int16_t)((SRC >> ((N) * 16)) & 0xffff))
>  #define fGETUHALF(N, SRC) ((uint16_t)((SRC >> ((N) * 16)) & 0xffff))
>  #endif
> diff --git a/target/hexagon/op_helper.c b/target/hexagon/op_helper.c
> index 63dd685658..496975a394 100644
> --- a/target/hexagon/op_helper.c
> +++ b/target/hexagon/op_helper.c
> @@ -45,23 +45,6 @@ void QEMU_NORETURN
> HELPER(raise_exception)(CPUHexagonState *env, uint32_t excp)
>      do_raise_exception_err(env, excp, 0);
>  }
>
> -static void log_reg_write(CPUHexagonState *env, int rnum,
> -                          target_ulong val, uint32_t slot)
> -{
> -    HEX_DEBUG_LOG("log_reg_write[%d] = " TARGET_FMT_ld " (0x"
> TARGET_FMT_lx ")",
> -                  rnum, val, val);
> -    if (val == env->gpr[rnum]) {
> -        HEX_DEBUG_LOG(" NO CHANGE");
> -    }
> -    HEX_DEBUG_LOG("\n");
> -
> -    env->new_value[rnum] = val;
> -    if (HEX_DEBUG) {
> -        /* Do this so HELPER(debug_commit_end) will know */
> -        env->reg_written[rnum] = 1;
> -    }
> -}
> -
>  static void log_pred_write(CPUHexagonState *env, int pnum, target_ulong
> val)
>  {
>      HEX_DEBUG_LOG("log_pred_write[%d] = " TARGET_FMT_ld
> @@ -77,46 +60,6 @@ static void log_pred_write(CPUHexagonState *env, int
> pnum, target_ulong val)
>      }
>  }
>
> -static void log_store32(CPUHexagonState *env, target_ulong addr,
> -                        target_ulong val, int width, int slot)
> -{
> -    HEX_DEBUG_LOG("log_store%d(0x" TARGET_FMT_lx
> -                  ", %" PRId32 " [0x08%" PRIx32 "])\n",
> -                  width, addr, val, val);
> -    env->mem_log_stores[slot].va = addr;
> -    env->mem_log_stores[slot].width = width;
> -    env->mem_log_stores[slot].data32 = val;
> -}
> -
> -static void log_store64(CPUHexagonState *env, target_ulong addr,
> -                        int64_t val, int width, int slot)
> -{
> -    HEX_DEBUG_LOG("log_store%d(0x" TARGET_FMT_lx
> -                  ", %" PRId64 " [0x016%" PRIx64 "])\n",
> -                   width, addr, val, val);
> -    env->mem_log_stores[slot].va = addr;
> -    env->mem_log_stores[slot].width = width;
> -    env->mem_log_stores[slot].data64 = val;
> -}
> -
> -static void write_new_pc(CPUHexagonState *env, target_ulong addr)
> -{
> -    HEX_DEBUG_LOG("write_new_pc(0x" TARGET_FMT_lx ")\n", addr);
> -
> -    /*
> -     * If more than one branch is taken in a packet, only the first one
> -     * is actually done.
> -     */
> -    if (env->branch_taken) {
> -        HEX_DEBUG_LOG("INFO: multiple branches taken in same packet, "
> -                      "ignoring the second one\n");
> -    } else {
> -        fCHECK_PCALIGN(addr);
> -        env->branch_taken = 1;
> -        env->next_PC = addr;
> -    }
> -}
> -
>  /* Handy place to set a breakpoint */
>  void HELPER(debug_start_packet)(CPUHexagonState *env)
>  {
> @@ -128,11 +71,6 @@ void HELPER(debug_start_packet)(CPUHexagonState *env)
>      }
>  }
>
> -static int32_t new_pred_value(CPUHexagonState *env, int pnum)
> -{
> -    return env->new_pred_value[pnum];
> -}
> -
>  /* Checks for bookkeeping errors between disassembly context and runtime
> */
>  void HELPER(debug_check_store_width)(CPUHexagonState *env, int slot, int
> check)
>  {
> @@ -380,57 +318,6 @@ int32_t HELPER(vacsh_pred)(CPUHexagonState *env,
>      return PeV;
>  }
>
> -/*
> - * mem_noshuf
> - * Section 5.5 of the Hexagon V67 Programmer's Reference Manual
> - *
> - * If the load is in slot 0 and there is a store in slot1 (that
> - * wasn't cancelled), we have to do the store first.
> - */
> -static void check_noshuf(CPUHexagonState *env, uint32_t slot)
> -{
> -    if (slot == 0 && env->pkt_has_store_s1 &&
> -        ((env->slot_cancelled & (1 << 1)) == 0)) {
> -        HELPER(commit_store)(env, 1);
> -    }
> -}
> -
> -static uint8_t mem_load1(CPUHexagonState *env, uint32_t slot,
> -                         target_ulong vaddr)
> -{
> -    uint8_t retval;
> -    check_noshuf(env, slot);
> -    get_user_u8(retval, vaddr);
> -    return retval;
> -}
> -
> -static uint16_t mem_load2(CPUHexagonState *env, uint32_t slot,
> -                          target_ulong vaddr)
> -{
> -    uint16_t retval;
> -    check_noshuf(env, slot);
> -    get_user_u16(retval, vaddr);
> -    return retval;
> -}
> -
> -static uint32_t mem_load4(CPUHexagonState *env, uint32_t slot,
> -                          target_ulong vaddr)
> -{
> -    uint32_t retval;
> -    check_noshuf(env, slot);
> -    get_user_u32(retval, vaddr);
> -    return retval;
> -}
> -
> -static uint64_t mem_load8(CPUHexagonState *env, uint32_t slot,
> -                          target_ulong vaddr)
> -{
> -    uint64_t retval;
> -    check_noshuf(env, slot);
> -    get_user_u64(retval, vaddr);
> -    return retval;
> -}
> -
>  /* Floating point */
>  float64 HELPER(conv_sf2df)(CPUHexagonState *env, float32 RsV)
>  {
> @@ -1172,12 +1059,6 @@ float64 HELPER(dfmpyhh)(CPUHexagonState *env,
> float64 RxxV,
>      return RxxV;
>  }
>
> -static void cancel_slot(CPUHexagonState *env, uint32_t slot)
> -{
> -    HEX_DEBUG_LOG("Slot %d cancelled\n", slot);
> -    env->slot_cancelled |= (1 << slot);
> -}
> -
>  /* These macros can be referenced in the generated helper functions */
>  #define warn(...) /* Nothing */
>  #define fatal(...) g_assert_not_reached();
> --
> 2.31.1
>
>
>

--000000000000567ced05c59e4d8c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Don&#39;t do this.=C2=A0 Keeping these around makes i=
t easy to fall back to the helper implementations for debugging.=C2=A0 Also=
, some of them are needed for future HVX support.</div><div><br></div><div>=
Thanks,</div><div>Taylor<br></div></div><br><div class=3D"gmail_quote"><div=
 dir=3D"ltr" class=3D"gmail_attr">On Sat, Jun 19, 2021 at 4:48 AM Alessandr=
o Di Federico via &lt;<a href=3D"mailto:qemu-devel@nongnu.org">qemu-devel@n=
ongnu.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">From: Paolo Montesel &lt;babush@rev.ng&gt;<br>
<br>
Signed-off-by: Alessandro Di Federico &lt;ale@rev.ng&gt;<br>
Signed-off-by: Paolo Montesel &lt;babush@rev.ng&gt;<br>
---<br>
=C2=A0target/hexagon/gen_tcg.h=C2=A0 =C2=A0| 528 --------------------------=
-----------<br>
=C2=A0target/hexagon/genptr.c=C2=A0 =C2=A0 |=C2=A0 98 -------<br>
=C2=A0target/hexagon/macros.h=C2=A0 =C2=A0 | 200 +-------------<br>
=C2=A0target/hexagon/op_helper.c | 119 ---------<br>
=C2=A04 files changed, 9 insertions(+), 936 deletions(-)<br>
<br>
diff --git a/target/hexagon/gen_tcg.h b/target/hexagon/gen_tcg.h<br>
index 18fcdbc7e4..f1dd1b64c1 100644<br>
--- a/target/hexagon/gen_tcg.h<br>
+++ b/target/hexagon/gen_tcg.h<br>
@@ -43,381 +43,6 @@<br>
=C2=A0 *=C2=A0 =C2=A0 =C2=A0_pcr=C2=A0 =C2=A0 =C2=A0 post increment circula=
r register=C2=A0 r0 =3D memw(r1++I:circ(m0))<br>
=C2=A0 */<br>
<br>
-/* Macros for complex addressing modes */<br>
-#define GET_EA_ap \<br>
-=C2=A0 =C2=A0 do { \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 fEA_IMM(UiV); \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 tcg_gen_movi_tl(ReV, UiV); \<br>
-=C2=A0 =C2=A0 } while (0)<br>
-#define GET_EA_pr \<br>
-=C2=A0 =C2=A0 do { \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 fEA_REG(RxV); \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 fPM_M(RxV, MuV); \<br>
-=C2=A0 =C2=A0 } while (0)<br>
-#define GET_EA_pbr \<br>
-=C2=A0 =C2=A0 do { \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 gen_helper_fbrev(EA, RxV); \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 tcg_gen_add_tl(RxV, RxV, MuV); \<br>
-=C2=A0 =C2=A0 } while (0)<br>
-#define GET_EA_pi \<br>
-=C2=A0 =C2=A0 do { \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 fEA_REG(RxV); \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 fPM_I(RxV, siV); \<br>
-=C2=A0 =C2=A0 } while (0)<br>
-#define GET_EA_pci \<br>
-=C2=A0 =C2=A0 do { \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 TCGv tcgv_siV =3D tcg_const_tl(siV); \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 tcg_gen_mov_tl(EA, RxV); \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 gen_helper_fcircadd(RxV, RxV, tcgv_siV, MuV, \=
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 hex_gpr[HEX_REG_CS0 + MuN]); \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 tcg_temp_free(tcgv_siV); \<br>
-=C2=A0 =C2=A0 } while (0)<br>
-#define GET_EA_pcr(SHIFT) \<br>
-=C2=A0 =C2=A0 do { \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 TCGv ireg =3D tcg_temp_new(); \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 tcg_gen_mov_tl(EA, RxV); \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 gen_read_ireg(ireg, MuV, (SHIFT)); \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 gen_helper_fcircadd(RxV, RxV, ireg, MuV, hex_g=
pr[HEX_REG_CS0 + MuN]); \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 tcg_temp_free(ireg); \<br>
-=C2=A0 =C2=A0 } while (0)<br>
-<br>
-/* Instructions with multiple definitions */<br>
-#define fGEN_TCG_LOAD_AP(RES, SIZE, SIGN) \<br>
-=C2=A0 =C2=A0 do { \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 fMUST_IMMEXT(UiV); \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 fEA_IMM(UiV); \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 fLOAD(1, SIZE, SIGN, EA, RES); \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 tcg_gen_movi_tl(ReV, UiV); \<br>
-=C2=A0 =C2=A0 } while (0)<br>
-<br>
-#define fGEN_TCG_L4_loadrub_ap(SHORTCODE) \<br>
-=C2=A0 =C2=A0 fGEN_TCG_LOAD_AP(RdV, 1, u)<br>
-#define fGEN_TCG_L4_loadrb_ap(SHORTCODE) \<br>
-=C2=A0 =C2=A0 fGEN_TCG_LOAD_AP(RdV, 1, s)<br>
-#define fGEN_TCG_L4_loadruh_ap(SHORTCODE) \<br>
-=C2=A0 =C2=A0 fGEN_TCG_LOAD_AP(RdV, 2, u)<br>
-#define fGEN_TCG_L4_loadrh_ap(SHORTCODE) \<br>
-=C2=A0 =C2=A0 fGEN_TCG_LOAD_AP(RdV, 2, s)<br>
-#define fGEN_TCG_L4_loadri_ap(SHORTCODE) \<br>
-=C2=A0 =C2=A0 fGEN_TCG_LOAD_AP(RdV, 4, u)<br>
-#define fGEN_TCG_L4_loadrd_ap(SHORTCODE) \<br>
-=C2=A0 =C2=A0 fGEN_TCG_LOAD_AP(RddV, 8, u)<br>
-<br>
-#define fGEN_TCG_L2_loadrub_pci(SHORTCODE)=C2=A0 =C2=A0 SHORTCODE<br>
-#define fGEN_TCG_L2_loadrb_pci(SHORTCODE)=C2=A0 =C2=A0 =C2=A0SHORTCODE<br>
-#define fGEN_TCG_L2_loadruh_pci(SHORTCODE)=C2=A0 =C2=A0 SHORTCODE<br>
-#define fGEN_TCG_L2_loadrh_pci(SHORTCODE)=C2=A0 =C2=A0 =C2=A0SHORTCODE<br>
-#define fGEN_TCG_L2_loadri_pci(SHORTCODE)=C2=A0 =C2=A0 =C2=A0SHORTCODE<br>
-#define fGEN_TCG_L2_loadrd_pci(SHORTCODE)=C2=A0 =C2=A0 =C2=A0SHORTCODE<br>
-<br>
-#define fGEN_TCG_LOAD_pcr(SHIFT, LOAD) \<br>
-=C2=A0 =C2=A0 do { \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 TCGv ireg =3D tcg_temp_new(); \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 tcg_gen_mov_tl(EA, RxV); \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 gen_read_ireg(ireg, MuV, SHIFT); \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 gen_helper_fcircadd(RxV, RxV, ireg, MuV, hex_g=
pr[HEX_REG_CS0 + MuN]); \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 LOAD; \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 tcg_temp_free(ireg); \<br>
-=C2=A0 =C2=A0 } while (0)<br>
-<br>
-#define fGEN_TCG_L2_loadrub_pcr(SHORTCODE) \<br>
-=C2=A0 =C2=A0 =C2=A0 fGEN_TCG_LOAD_pcr(0, fLOAD(1, 1, u, EA, RdV))<br>
-#define fGEN_TCG_L2_loadrb_pcr(SHORTCODE) \<br>
-=C2=A0 =C2=A0 =C2=A0 fGEN_TCG_LOAD_pcr(0, fLOAD(1, 1, s, EA, RdV))<br>
-#define fGEN_TCG_L2_loadruh_pcr(SHORTCODE) \<br>
-=C2=A0 =C2=A0 =C2=A0 fGEN_TCG_LOAD_pcr(1, fLOAD(1, 2, u, EA, RdV))<br>
-#define fGEN_TCG_L2_loadrh_pcr(SHORTCODE) \<br>
-=C2=A0 =C2=A0 =C2=A0 fGEN_TCG_LOAD_pcr(1, fLOAD(1, 2, s, EA, RdV))<br>
-#define fGEN_TCG_L2_loadri_pcr(SHORTCODE) \<br>
-=C2=A0 =C2=A0 =C2=A0 fGEN_TCG_LOAD_pcr(2, fLOAD(1, 4, u, EA, RdV))<br>
-#define fGEN_TCG_L2_loadrd_pcr(SHORTCODE) \<br>
-=C2=A0 =C2=A0 =C2=A0 fGEN_TCG_LOAD_pcr(3, fLOAD(1, 8, u, EA, RddV))<br>
-<br>
-#define fGEN_TCG_L2_loadrub_pr(SHORTCODE)=C2=A0 =C2=A0 =C2=A0 SHORTCODE<br=
>
-#define fGEN_TCG_L2_loadrub_pbr(SHORTCODE)=C2=A0 =C2=A0 =C2=A0SHORTCODE<br=
>
-#define fGEN_TCG_L2_loadrub_pi(SHORTCODE)=C2=A0 =C2=A0 =C2=A0 SHORTCODE<br=
>
-#define fGEN_TCG_L2_loadrb_pr(SHORTCODE)=C2=A0 =C2=A0 =C2=A0 =C2=A0SHORTCO=
DE<br>
-#define fGEN_TCG_L2_loadrb_pbr(SHORTCODE)=C2=A0 =C2=A0 =C2=A0 SHORTCODE<br=
>
-#define fGEN_TCG_L2_loadrb_pi(SHORTCODE)=C2=A0 =C2=A0 =C2=A0 =C2=A0SHORTCO=
DE<br>
-#define fGEN_TCG_L2_loadruh_pr(SHORTCODE)=C2=A0 =C2=A0 =C2=A0 SHORTCODE<br=
>
-#define fGEN_TCG_L2_loadruh_pbr(SHORTCODE)=C2=A0 =C2=A0 =C2=A0SHORTCODE<br=
>
-#define fGEN_TCG_L2_loadruh_pi(SHORTCODE)=C2=A0 =C2=A0 =C2=A0 SHORTCODE<br=
>
-#define fGEN_TCG_L2_loadrh_pr(SHORTCODE)=C2=A0 =C2=A0 =C2=A0 =C2=A0SHORTCO=
DE<br>
-#define fGEN_TCG_L2_loadrh_pbr(SHORTCODE)=C2=A0 =C2=A0 =C2=A0 SHORTCODE<br=
>
-#define fGEN_TCG_L2_loadrh_pi(SHORTCODE)=C2=A0 =C2=A0 =C2=A0 =C2=A0SHORTCO=
DE<br>
-#define fGEN_TCG_L2_loadri_pr(SHORTCODE)=C2=A0 =C2=A0 =C2=A0 =C2=A0SHORTCO=
DE<br>
-#define fGEN_TCG_L2_loadri_pbr(SHORTCODE)=C2=A0 =C2=A0 =C2=A0 SHORTCODE<br=
>
-#define fGEN_TCG_L2_loadri_pi(SHORTCODE)=C2=A0 =C2=A0 =C2=A0 =C2=A0SHORTCO=
DE<br>
-#define fGEN_TCG_L2_loadrd_pr(SHORTCODE)=C2=A0 =C2=A0 =C2=A0 =C2=A0SHORTCO=
DE<br>
-#define fGEN_TCG_L2_loadrd_pbr(SHORTCODE)=C2=A0 =C2=A0 =C2=A0 SHORTCODE<br=
>
-#define fGEN_TCG_L2_loadrd_pi(SHORTCODE)=C2=A0 =C2=A0 =C2=A0 =C2=A0SHORTCO=
DE<br>
-<br>
-/*<br>
- * These instructions load 2 bytes and places them in<br>
- * two halves of the destination register.<br>
- * The GET_EA macro determines the addressing mode.<br>
- * The SIGN argument determines whether to zero-extend or<br>
- * sign-extend.<br>
- */<br>
-#define fGEN_TCG_loadbXw2(GET_EA, SIGN) \<br>
-=C2=A0 =C2=A0 do { \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 TCGv tmp =3D tcg_temp_new(); \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 TCGv byte =3D tcg_temp_new(); \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 GET_EA; \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 fLOAD(1, 2, u, EA, tmp); \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 tcg_gen_movi_tl(RdV, 0); \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 for (int i =3D 0; i &lt; 2; i++) { \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 gen_set_half(i, RdV, gen_get_byt=
e(byte, i, tmp, (SIGN))); \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 } \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 tcg_temp_free(tmp); \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 tcg_temp_free(byte); \<br>
-=C2=A0 =C2=A0 } while (0)<br>
-<br>
-#define fGEN_TCG_L2_loadbzw2_io(SHORTCODE) \<br>
-=C2=A0 =C2=A0 fGEN_TCG_loadbXw2(fEA_RI(RsV, siV), false)<br>
-#define fGEN_TCG_L4_loadbzw2_ur(SHORTCODE) \<br>
-=C2=A0 =C2=A0 fGEN_TCG_loadbXw2(fEA_IRs(UiV, RtV, uiV), false)<br>
-#define fGEN_TCG_L2_loadbsw2_io(SHORTCODE) \<br>
-=C2=A0 =C2=A0 fGEN_TCG_loadbXw2(fEA_RI(RsV, siV), true)<br>
-#define fGEN_TCG_L4_loadbsw2_ur(SHORTCODE) \<br>
-=C2=A0 =C2=A0 fGEN_TCG_loadbXw2(fEA_IRs(UiV, RtV, uiV), true)<br>
-#define fGEN_TCG_L4_loadbzw2_ap(SHORTCODE) \<br>
-=C2=A0 =C2=A0 fGEN_TCG_loadbXw2(GET_EA_ap, false)<br>
-#define fGEN_TCG_L2_loadbzw2_pr(SHORTCODE) \<br>
-=C2=A0 =C2=A0 fGEN_TCG_loadbXw2(GET_EA_pr, false)<br>
-#define fGEN_TCG_L2_loadbzw2_pbr(SHORTCODE) \<br>
-=C2=A0 =C2=A0 fGEN_TCG_loadbXw2(GET_EA_pbr, false)<br>
-#define fGEN_TCG_L2_loadbzw2_pi(SHORTCODE) \<br>
-=C2=A0 =C2=A0 fGEN_TCG_loadbXw2(GET_EA_pi, false)<br>
-#define fGEN_TCG_L4_loadbsw2_ap(SHORTCODE) \<br>
-=C2=A0 =C2=A0 fGEN_TCG_loadbXw2(GET_EA_ap, true)<br>
-#define fGEN_TCG_L2_loadbsw2_pr(SHORTCODE) \<br>
-=C2=A0 =C2=A0 fGEN_TCG_loadbXw2(GET_EA_pr, true)<br>
-#define fGEN_TCG_L2_loadbsw2_pbr(SHORTCODE) \<br>
-=C2=A0 =C2=A0 fGEN_TCG_loadbXw2(GET_EA_pbr, true)<br>
-#define fGEN_TCG_L2_loadbsw2_pi(SHORTCODE) \<br>
-=C2=A0 =C2=A0 fGEN_TCG_loadbXw2(GET_EA_pi, true)<br>
-#define fGEN_TCG_L2_loadbzw2_pci(SHORTCODE) \<br>
-=C2=A0 =C2=A0 fGEN_TCG_loadbXw2(GET_EA_pci, false)<br>
-#define fGEN_TCG_L2_loadbsw2_pci(SHORTCODE) \<br>
-=C2=A0 =C2=A0 fGEN_TCG_loadbXw2(GET_EA_pci, true)<br>
-#define fGEN_TCG_L2_loadbzw2_pcr(SHORTCODE) \<br>
-=C2=A0 =C2=A0 fGEN_TCG_loadbXw2(GET_EA_pcr(1), false)<br>
-#define fGEN_TCG_L2_loadbsw2_pcr(SHORTCODE) \<br>
-=C2=A0 =C2=A0 fGEN_TCG_loadbXw2(GET_EA_pcr(1), true)<br>
-<br>
-/*<br>
- * These instructions load 4 bytes and places them in<br>
- * four halves of the destination register pair.<br>
- * The GET_EA macro determines the addressing mode.<br>
- * The SIGN argument determines whether to zero-extend or<br>
- * sign-extend.<br>
- */<br>
-#define fGEN_TCG_loadbXw4(GET_EA, SIGN) \<br>
-=C2=A0 =C2=A0 do { \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 TCGv tmp =3D tcg_temp_new(); \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 TCGv byte =3D tcg_temp_new(); \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 GET_EA; \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 fLOAD(1, 4, u, EA, tmp);=C2=A0 \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 tcg_gen_movi_i64(RddV, 0); \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 for (int i =3D 0; i &lt; 4; i++) { \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 gen_set_half_i64(i, RddV, gen_ge=
t_byte(byte, i, tmp, (SIGN)));=C2=A0 \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 }=C2=A0 \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 tcg_temp_free(tmp); \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 tcg_temp_free(byte); \<br>
-=C2=A0 =C2=A0 } while (0)<br>
-<br>
-#define fGEN_TCG_L2_loadbzw4_io(SHORTCODE) \<br>
-=C2=A0 =C2=A0 fGEN_TCG_loadbXw4(fEA_RI(RsV, siV), false)<br>
-#define fGEN_TCG_L4_loadbzw4_ur(SHORTCODE) \<br>
-=C2=A0 =C2=A0 fGEN_TCG_loadbXw4(fEA_IRs(UiV, RtV, uiV), false)<br>
-#define fGEN_TCG_L2_loadbsw4_io(SHORTCODE) \<br>
-=C2=A0 =C2=A0 fGEN_TCG_loadbXw4(fEA_RI(RsV, siV), true)<br>
-#define fGEN_TCG_L4_loadbsw4_ur(SHORTCODE) \<br>
-=C2=A0 =C2=A0 fGEN_TCG_loadbXw4(fEA_IRs(UiV, RtV, uiV), true)<br>
-#define fGEN_TCG_L2_loadbzw4_pci(SHORTCODE) \<br>
-=C2=A0 =C2=A0 fGEN_TCG_loadbXw4(GET_EA_pci, false)<br>
-#define fGEN_TCG_L2_loadbsw4_pci(SHORTCODE) \<br>
-=C2=A0 =C2=A0 fGEN_TCG_loadbXw4(GET_EA_pci, true)<br>
-#define fGEN_TCG_L2_loadbzw4_pcr(SHORTCODE) \<br>
-=C2=A0 =C2=A0 fGEN_TCG_loadbXw4(GET_EA_pcr(2), false)<br>
-#define fGEN_TCG_L2_loadbsw4_pcr(SHORTCODE) \<br>
-=C2=A0 =C2=A0 fGEN_TCG_loadbXw4(GET_EA_pcr(2), true)<br>
-#define fGEN_TCG_L4_loadbzw4_ap(SHORTCODE) \<br>
-=C2=A0 =C2=A0 fGEN_TCG_loadbXw4(GET_EA_ap, false)<br>
-#define fGEN_TCG_L2_loadbzw4_pr(SHORTCODE) \<br>
-=C2=A0 =C2=A0 fGEN_TCG_loadbXw4(GET_EA_pr, false)<br>
-#define fGEN_TCG_L2_loadbzw4_pbr(SHORTCODE) \<br>
-=C2=A0 =C2=A0 fGEN_TCG_loadbXw4(GET_EA_pbr, false)<br>
-#define fGEN_TCG_L2_loadbzw4_pi(SHORTCODE) \<br>
-=C2=A0 =C2=A0 fGEN_TCG_loadbXw4(GET_EA_pi, false)<br>
-#define fGEN_TCG_L4_loadbsw4_ap(SHORTCODE) \<br>
-=C2=A0 =C2=A0 fGEN_TCG_loadbXw4(GET_EA_ap, true)<br>
-#define fGEN_TCG_L2_loadbsw4_pr(SHORTCODE) \<br>
-=C2=A0 =C2=A0 fGEN_TCG_loadbXw4(GET_EA_pr, true)<br>
-#define fGEN_TCG_L2_loadbsw4_pbr(SHORTCODE) \<br>
-=C2=A0 =C2=A0 fGEN_TCG_loadbXw4(GET_EA_pbr, true)<br>
-#define fGEN_TCG_L2_loadbsw4_pi(SHORTCODE) \<br>
-=C2=A0 =C2=A0 fGEN_TCG_loadbXw4(GET_EA_pi, true)<br>
-<br>
-/*<br>
- * These instructions load a half word, shift the destination right by 16 =
bits<br>
- * and place the loaded value in the high half word of the destination pai=
r.<br>
- * The GET_EA macro determines the addressing mode.<br>
- */<br>
-#define fGEN_TCG_loadalignh(GET_EA) \<br>
-=C2=A0 =C2=A0 do { \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 TCGv tmp =3D tcg_temp_new(); \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 TCGv_i64 tmp_i64 =3D tcg_temp_new_i64(); \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 GET_EA;=C2=A0 \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 fLOAD(1, 2, u, EA, tmp);=C2=A0 \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 tcg_gen_extu_i32_i64(tmp_i64, tmp); \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 tcg_gen_shri_i64(RyyV, RyyV, 16); \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 tcg_gen_deposit_i64(RyyV, RyyV, tmp_i64, 48, 1=
6); \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 tcg_temp_free(tmp); \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 tcg_temp_free_i64(tmp_i64); \<br>
-=C2=A0 =C2=A0 } while (0)<br>
-<br>
-#define fGEN_TCG_L4_loadalignh_ur(SHORTCODE) \<br>
-=C2=A0 =C2=A0 fGEN_TCG_loadalignh(fEA_IRs(UiV, RtV, uiV))<br>
-#define fGEN_TCG_L2_loadalignh_io(SHORTCODE) \<br>
-=C2=A0 =C2=A0 fGEN_TCG_loadalignh(fEA_RI(RsV, siV))<br>
-#define fGEN_TCG_L2_loadalignh_pci(SHORTCODE) \<br>
-=C2=A0 =C2=A0 fGEN_TCG_loadalignh(GET_EA_pci)<br>
-#define fGEN_TCG_L2_loadalignh_pcr(SHORTCODE) \<br>
-=C2=A0 =C2=A0 fGEN_TCG_loadalignh(GET_EA_pcr(1))<br>
-#define fGEN_TCG_L4_loadalignh_ap(SHORTCODE) \<br>
-=C2=A0 =C2=A0 fGEN_TCG_loadalignh(GET_EA_ap)<br>
-#define fGEN_TCG_L2_loadalignh_pr(SHORTCODE) \<br>
-=C2=A0 =C2=A0 fGEN_TCG_loadalignh(GET_EA_pr)<br>
-#define fGEN_TCG_L2_loadalignh_pbr(SHORTCODE) \<br>
-=C2=A0 =C2=A0 fGEN_TCG_loadalignh(GET_EA_pbr)<br>
-#define fGEN_TCG_L2_loadalignh_pi(SHORTCODE) \<br>
-=C2=A0 =C2=A0 fGEN_TCG_loadalignh(GET_EA_pi)<br>
-<br>
-/* Same as above, but loads a byte instead of half word */<br>
-#define fGEN_TCG_loadalignb(GET_EA) \<br>
-=C2=A0 =C2=A0 do { \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 TCGv tmp =3D tcg_temp_new(); \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 TCGv_i64 tmp_i64 =3D tcg_temp_new_i64(); \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 GET_EA;=C2=A0 \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 fLOAD(1, 1, u, EA, tmp);=C2=A0 \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 tcg_gen_extu_i32_i64(tmp_i64, tmp); \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 tcg_gen_shri_i64(RyyV, RyyV, 8); \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 tcg_gen_deposit_i64(RyyV, RyyV, tmp_i64, 56, 8=
); \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 tcg_temp_free(tmp); \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 tcg_temp_free_i64(tmp_i64); \<br>
-=C2=A0 =C2=A0 } while (0)<br>
-<br>
-#define fGEN_TCG_L2_loadalignb_io(SHORTCODE) \<br>
-=C2=A0 =C2=A0 fGEN_TCG_loadalignb(fEA_RI(RsV, siV))<br>
-#define fGEN_TCG_L4_loadalignb_ur(SHORTCODE) \<br>
-=C2=A0 =C2=A0 fGEN_TCG_loadalignb(fEA_IRs(UiV, RtV, uiV))<br>
-#define fGEN_TCG_L2_loadalignb_pci(SHORTCODE) \<br>
-=C2=A0 =C2=A0 fGEN_TCG_loadalignb(GET_EA_pci)<br>
-#define fGEN_TCG_L2_loadalignb_pcr(SHORTCODE) \<br>
-=C2=A0 =C2=A0 fGEN_TCG_loadalignb(GET_EA_pcr(0))<br>
-#define fGEN_TCG_L4_loadalignb_ap(SHORTCODE) \<br>
-=C2=A0 =C2=A0 fGEN_TCG_loadalignb(GET_EA_ap)<br>
-#define fGEN_TCG_L2_loadalignb_pr(SHORTCODE) \<br>
-=C2=A0 =C2=A0 fGEN_TCG_loadalignb(GET_EA_pr)<br>
-#define fGEN_TCG_L2_loadalignb_pbr(SHORTCODE) \<br>
-=C2=A0 =C2=A0 fGEN_TCG_loadalignb(GET_EA_pbr)<br>
-#define fGEN_TCG_L2_loadalignb_pi(SHORTCODE) \<br>
-=C2=A0 =C2=A0 fGEN_TCG_loadalignb(GET_EA_pi)<br>
-<br>
-/*<br>
- * Predicated loads<br>
- * Here is a primer to understand the tag names<br>
- *<br>
- * Predicate used<br>
- *=C2=A0 =C2=A0 =C2=A0 t=C2=A0 =C2=A0 =C2=A0 =C2=A0 true &quot;old&quot; v=
alue=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (p0) =
r0 =3D memb(r2+#0)<br>
- *=C2=A0 =C2=A0 =C2=A0 f=C2=A0 =C2=A0 =C2=A0 =C2=A0 false &quot;old&quot; =
value=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!p0)=
 r0 =3D memb(r2+#0)<br>
- *=C2=A0 =C2=A0 =C2=A0 tnew=C2=A0 =C2=A0 =C2=A0true &quot;new&quot; value=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (p0.new) =
r0 =3D memb(r2+#0)<br>
- *=C2=A0 =C2=A0 =C2=A0 fnew=C2=A0 =C2=A0 =C2=A0false &quot;new&quot; value=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!p0.new) =
r0 =3D memb(r2+#0)<br>
- */<br>
-#define fGEN_TCG_PRED_LOAD(GET_EA, PRED, SIZE, SIGN) \<br>
-=C2=A0 =C2=A0 do { \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 TCGv LSB =3D tcg_temp_local_new(); \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 TCGLabel *label =3D gen_new_label(); \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 GET_EA; \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 PRED;=C2=A0 \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 PRED_LOAD_CANCEL(LSB, EA); \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 tcg_gen_movi_tl(RdV, 0); \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 tcg_gen_brcondi_tl(TCG_COND_EQ, LSB, 0, label)=
; \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fLOAD(1, SIZE, SIGN, EA, RdV); \=
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 gen_set_label(label); \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 tcg_temp_free(LSB); \<br>
-=C2=A0 =C2=A0 } while (0)<br>
-<br>
-#define fGEN_TCG_L2_ploadrubt_pi(SHORTCODE) \<br>
-=C2=A0 =C2=A0 fGEN_TCG_PRED_LOAD(GET_EA_pi, fLSBOLD(PtV), 1, u)<br>
-#define fGEN_TCG_L2_ploadrubf_pi(SHORTCODE) \<br>
-=C2=A0 =C2=A0 fGEN_TCG_PRED_LOAD(GET_EA_pi, fLSBOLDNOT(PtV), 1, u)<br>
-#define fGEN_TCG_L2_ploadrubtnew_pi(SHORTCODE) \<br>
-=C2=A0 =C2=A0 fGEN_TCG_PRED_LOAD(GET_EA_pi, fLSBNEW(PtN), 1, u)<br>
-#define fGEN_TCG_L2_ploadrubfnew_pi(SHORTCODE) \<br>
-=C2=A0 =C2=A0 fGEN_TCG_PRED_LOAD(GET_EA_pi, fLSBNEWNOT(PtN), 1, u)<br>
-#define fGEN_TCG_L2_ploadrbt_pi(SHORTCODE) \<br>
-=C2=A0 =C2=A0 fGEN_TCG_PRED_LOAD(GET_EA_pi, fLSBOLD(PtV), 1, s)<br>
-#define fGEN_TCG_L2_ploadrbf_pi(SHORTCODE) \<br>
-=C2=A0 =C2=A0 fGEN_TCG_PRED_LOAD(GET_EA_pi, fLSBOLDNOT(PtV), 1, s)<br>
-#define fGEN_TCG_L2_ploadrbtnew_pi(SHORTCODE) \<br>
-=C2=A0 =C2=A0 fGEN_TCG_PRED_LOAD(GET_EA_pi, fLSBNEW(PtN), 1, s)<br>
-#define fGEN_TCG_L2_ploadrbfnew_pi(SHORTCODE) \<br>
-=C2=A0 =C2=A0 fGEN_TCG_PRED_LOAD({ fEA_REG(RxV); fPM_I(RxV, siV); }, \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0fLSBNEWNOT(PtN), 1, s)<br>
-<br>
-#define fGEN_TCG_L2_ploadruht_pi(SHORTCODE) \<br>
-=C2=A0 =C2=A0 fGEN_TCG_PRED_LOAD(GET_EA_pi, fLSBOLD(PtV), 2, u)<br>
-#define fGEN_TCG_L2_ploadruhf_pi(SHORTCODE) \<br>
-=C2=A0 =C2=A0 fGEN_TCG_PRED_LOAD(GET_EA_pi, fLSBOLDNOT(PtV), 2, u)<br>
-#define fGEN_TCG_L2_ploadruhtnew_pi(SHORTCODE) \<br>
-=C2=A0 =C2=A0 fGEN_TCG_PRED_LOAD(GET_EA_pi, fLSBNEW(PtN), 2, u)<br>
-#define fGEN_TCG_L2_ploadruhfnew_pi(SHORTCODE) \<br>
-=C2=A0 =C2=A0 fGEN_TCG_PRED_LOAD(GET_EA_pi, fLSBNEWNOT(PtN), 2, u)<br>
-#define fGEN_TCG_L2_ploadrht_pi(SHORTCODE) \<br>
-=C2=A0 =C2=A0 fGEN_TCG_PRED_LOAD(GET_EA_pi, fLSBOLD(PtV), 2, s)<br>
-#define fGEN_TCG_L2_ploadrhf_pi(SHORTCODE) \<br>
-=C2=A0 =C2=A0 fGEN_TCG_PRED_LOAD(GET_EA_pi, fLSBOLDNOT(PtV), 2, s)<br>
-#define fGEN_TCG_L2_ploadrhtnew_pi(SHORTCODE) \<br>
-=C2=A0 =C2=A0 fGEN_TCG_PRED_LOAD(GET_EA_pi, fLSBNEW(PtN), 2, s)<br>
-#define fGEN_TCG_L2_ploadrhfnew_pi(SHORTCODE) \<br>
-=C2=A0 =C2=A0 fGEN_TCG_PRED_LOAD(GET_EA_pi, fLSBNEWNOT(PtN), 2, s)<br>
-<br>
-#define fGEN_TCG_L2_ploadrit_pi(SHORTCODE) \<br>
-=C2=A0 =C2=A0 fGEN_TCG_PRED_LOAD(GET_EA_pi, fLSBOLD(PtV), 4, u)<br>
-#define fGEN_TCG_L2_ploadrif_pi(SHORTCODE) \<br>
-=C2=A0 =C2=A0 fGEN_TCG_PRED_LOAD(GET_EA_pi, fLSBOLDNOT(PtV), 4, u)<br>
-#define fGEN_TCG_L2_ploadritnew_pi(SHORTCODE) \<br>
-=C2=A0 =C2=A0 fGEN_TCG_PRED_LOAD(GET_EA_pi, fLSBNEW(PtN), 4, u)<br>
-#define fGEN_TCG_L2_ploadrifnew_pi(SHORTCODE) \<br>
-=C2=A0 =C2=A0 fGEN_TCG_PRED_LOAD(GET_EA_pi, fLSBNEWNOT(PtN), 4, u)<br>
-<br>
-/* Predicated loads into a register pair */<br>
-#define fGEN_TCG_PRED_LOAD_PAIR(GET_EA, PRED) \<br>
-=C2=A0 =C2=A0 do { \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 TCGv LSB =3D tcg_temp_local_new(); \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 TCGLabel *label =3D gen_new_label(); \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 GET_EA; \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 PRED;=C2=A0 \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 PRED_LOAD_CANCEL(LSB, EA); \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 tcg_gen_movi_i64(RddV, 0); \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 tcg_gen_brcondi_tl(TCG_COND_EQ, LSB, 0, label)=
; \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fLOAD(1, 8, u, EA, RddV); \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 gen_set_label(label); \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 tcg_temp_free(LSB); \<br>
-=C2=A0 =C2=A0 } while (0)<br>
-<br>
-#define fGEN_TCG_L2_ploadrdt_pi(SHORTCODE) \<br>
-=C2=A0 =C2=A0 fGEN_TCG_PRED_LOAD_PAIR(GET_EA_pi, fLSBOLD(PtV))<br>
-#define fGEN_TCG_L2_ploadrdf_pi(SHORTCODE) \<br>
-=C2=A0 =C2=A0 fGEN_TCG_PRED_LOAD_PAIR(GET_EA_pi, fLSBOLDNOT(PtV))<br>
-#define fGEN_TCG_L2_ploadrdtnew_pi(SHORTCODE) \<br>
-=C2=A0 =C2=A0 fGEN_TCG_PRED_LOAD_PAIR(GET_EA_pi, fLSBNEW(PtN))<br>
-#define fGEN_TCG_L2_ploadrdfnew_pi(SHORTCODE) \<br>
-=C2=A0 =C2=A0 fGEN_TCG_PRED_LOAD_PAIR(GET_EA_pi, fLSBNEWNOT(PtN))<br>
-<br>
=C2=A0/* load-locked and store-locked */<br>
=C2=A0#define fGEN_TCG_L2_loadw_locked(SHORTCODE) \<br>
=C2=A0 =C2=A0 =C2=A0SHORTCODE<br>
@@ -428,95 +53,6 @@<br>
=C2=A0#define fGEN_TCG_S4_stored_locked(SHORTCODE) \<br>
=C2=A0 =C2=A0 =C2=A0do { SHORTCODE; READ_PREG(PdV, PdN); } while (0)<br>
<br>
-#define fGEN_TCG_STORE(SHORTCODE) \<br>
-=C2=A0 =C2=A0 do { \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 TCGv HALF =3D tcg_temp_new(); \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 TCGv BYTE =3D tcg_temp_new(); \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 SHORTCODE; \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 tcg_temp_free(HALF); \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 tcg_temp_free(BYTE); \<br>
-=C2=A0 =C2=A0 } while (0)<br>
-<br>
-#define fGEN_TCG_STORE_pcr(SHIFT, STORE) \<br>
-=C2=A0 =C2=A0 do { \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 TCGv ireg =3D tcg_temp_new(); \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 TCGv HALF =3D tcg_temp_new(); \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 TCGv BYTE =3D tcg_temp_new(); \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 tcg_gen_mov_tl(EA, RxV); \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 gen_read_ireg(ireg, MuV, SHIFT); \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 gen_helper_fcircadd(RxV, RxV, ireg, MuV, hex_g=
pr[HEX_REG_CS0 + MuN]); \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 STORE; \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 tcg_temp_free(ireg); \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 tcg_temp_free(HALF); \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 tcg_temp_free(BYTE); \<br>
-=C2=A0 =C2=A0 } while (0)<br>
-<br>
-#define fGEN_TCG_S2_storerb_pbr(SHORTCODE) \<br>
-=C2=A0 =C2=A0 fGEN_TCG_STORE(SHORTCODE)<br>
-#define fGEN_TCG_S2_storerb_pci(SHORTCODE) \<br>
-=C2=A0 =C2=A0 fGEN_TCG_STORE(SHORTCODE)<br>
-#define fGEN_TCG_S2_storerb_pcr(SHORTCODE) \<br>
-=C2=A0 =C2=A0 fGEN_TCG_STORE_pcr(0, fSTORE(1, 1, EA, fGETBYTE(0, RtV)))<br=
>
-<br>
-#define fGEN_TCG_S2_storerh_pbr(SHORTCODE) \<br>
-=C2=A0 =C2=A0 fGEN_TCG_STORE(SHORTCODE)<br>
-#define fGEN_TCG_S2_storerh_pci(SHORTCODE) \<br>
-=C2=A0 =C2=A0 fGEN_TCG_STORE(SHORTCODE)<br>
-#define fGEN_TCG_S2_storerh_pcr(SHORTCODE) \<br>
-=C2=A0 =C2=A0 fGEN_TCG_STORE_pcr(1, fSTORE(1, 2, EA, fGETHALF(0, RtV)))<br=
>
-<br>
-#define fGEN_TCG_S2_storerf_pbr(SHORTCODE) \<br>
-=C2=A0 =C2=A0 fGEN_TCG_STORE(SHORTCODE)<br>
-#define fGEN_TCG_S2_storerf_pci(SHORTCODE) \<br>
-=C2=A0 =C2=A0 fGEN_TCG_STORE(SHORTCODE)<br>
-#define fGEN_TCG_S2_storerf_pcr(SHORTCODE) \<br>
-=C2=A0 =C2=A0 fGEN_TCG_STORE_pcr(1, fSTORE(1, 2, EA, fGETHALF(1, RtV)))<br=
>
-<br>
-#define fGEN_TCG_S2_storeri_pbr(SHORTCODE) \<br>
-=C2=A0 =C2=A0 fGEN_TCG_STORE(SHORTCODE)<br>
-#define fGEN_TCG_S2_storeri_pci(SHORTCODE) \<br>
-=C2=A0 =C2=A0 fGEN_TCG_STORE(SHORTCODE)<br>
-#define fGEN_TCG_S2_storeri_pcr(SHORTCODE) \<br>
-=C2=A0 =C2=A0 fGEN_TCG_STORE_pcr(2, fSTORE(1, 4, EA, RtV))<br>
-<br>
-#define fGEN_TCG_S2_storerd_pbr(SHORTCODE) \<br>
-=C2=A0 =C2=A0 fGEN_TCG_STORE(SHORTCODE)<br>
-#define fGEN_TCG_S2_storerd_pci(SHORTCODE) \<br>
-=C2=A0 =C2=A0 fGEN_TCG_STORE(SHORTCODE)<br>
-#define fGEN_TCG_S2_storerd_pcr(SHORTCODE) \<br>
-=C2=A0 =C2=A0 fGEN_TCG_STORE_pcr(3, fSTORE(1, 8, EA, RttV))<br>
-<br>
-#define fGEN_TCG_S2_storerbnew_pbr(SHORTCODE) \<br>
-=C2=A0 =C2=A0 fGEN_TCG_STORE(SHORTCODE)<br>
-#define fGEN_TCG_S2_storerbnew_pci(SHORTCODE) \<br>
-=C2=A0 =C2=A0 fGEN_TCG_STORE(SHORTCODE)<br>
-#define fGEN_TCG_S2_storerbnew_pcr(SHORTCODE) \<br>
-=C2=A0 =C2=A0 fGEN_TCG_STORE_pcr(0, fSTORE(1, 1, EA, fGETBYTE(0, NtN)))<br=
>
-<br>
-#define fGEN_TCG_S2_storerhnew_pbr(SHORTCODE) \<br>
-=C2=A0 =C2=A0 fGEN_TCG_STORE(SHORTCODE)<br>
-#define fGEN_TCG_S2_storerhnew_pci(SHORTCODE) \<br>
-=C2=A0 =C2=A0 fGEN_TCG_STORE(SHORTCODE)<br>
-#define fGEN_TCG_S2_storerhnew_pcr(SHORTCODE) \<br>
-=C2=A0 =C2=A0 fGEN_TCG_STORE_pcr(1, fSTORE(1, 2, EA, fGETHALF(0, NtN)))<br=
>
-<br>
-#define fGEN_TCG_S2_storerinew_pbr(SHORTCODE) \<br>
-=C2=A0 =C2=A0 fGEN_TCG_STORE(SHORTCODE)<br>
-#define fGEN_TCG_S2_storerinew_pci(SHORTCODE) \<br>
-=C2=A0 =C2=A0 fGEN_TCG_STORE(SHORTCODE)<br>
-#define fGEN_TCG_S2_storerinew_pcr(SHORTCODE) \<br>
-=C2=A0 =C2=A0 fGEN_TCG_STORE_pcr(2, fSTORE(1, 4, EA, NtN))<br>
-<br>
-/*<br>
- * Mathematical operations with more than one definition require<br>
- * special handling<br>
- */<br>
-#define fGEN_TCG_A5_ACS(SHORTCODE) \<br>
-=C2=A0 =C2=A0 do { \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 gen_helper_vacsh_pred(PeV, cpu_env, RxxV, RssV=
, RttV); \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 gen_helper_vacsh_val(RxxV, cpu_env, RxxV, RssV=
, RttV); \<br>
-=C2=A0 =C2=A0 } while (0)<br>
-<br>
=C2=A0/*<br>
=C2=A0 * Approximate reciprocal<br>
=C2=A0 * r3,p1 =3D sfrecipa(r0, r1)<br>
@@ -549,70 +85,6 @@<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tcg_temp_free_i64(tmp); \<br>
=C2=A0 =C2=A0 =C2=A0} while (0)<br>
<br>
-/*<br>
- * Add or subtract with carry.<br>
- * Predicate register is used as an extra input and output.<br>
- * r5:4 =3D add(r1:0, r3:2, p1):carry<br>
- */<br>
-#define fGEN_TCG_A4_addp_c(SHORTCODE) \<br>
-=C2=A0 =C2=A0 do { \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 TCGv_i64 carry =3D tcg_temp_new_i64(); \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 TCGv_i64 zero =3D tcg_const_i64(0); \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 tcg_gen_extu_i32_i64(carry, PxV); \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 tcg_gen_andi_i64(carry, carry, 1); \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 tcg_gen_add2_i64(RddV, carry, RssV, zero, carr=
y, zero); \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 tcg_gen_add2_i64(RddV, carry, RddV, carry, Rtt=
V, zero); \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 tcg_gen_extrl_i64_i32(PxV, carry); \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 gen_8bitsof(PxV, PxV); \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 tcg_temp_free_i64(carry); \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 tcg_temp_free_i64(zero); \<br>
-=C2=A0 =C2=A0 } while (0)<br>
-<br>
-/* r5:4 =3D sub(r1:0, r3:2, p1):carry */<br>
-#define fGEN_TCG_A4_subp_c(SHORTCODE) \<br>
-=C2=A0 =C2=A0 do { \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 TCGv_i64 carry =3D tcg_temp_new_i64(); \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 TCGv_i64 zero =3D tcg_const_i64(0); \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 TCGv_i64 not_RttV =3D tcg_temp_new_i64(); \<br=
>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 tcg_gen_extu_i32_i64(carry, PxV); \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 tcg_gen_andi_i64(carry, carry, 1); \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 tcg_gen_not_i64(not_RttV, RttV); \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 tcg_gen_add2_i64(RddV, carry, RssV, zero, carr=
y, zero); \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 tcg_gen_add2_i64(RddV, carry, RddV, carry, not=
_RttV, zero); \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 tcg_gen_extrl_i64_i32(PxV, carry); \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 gen_8bitsof(PxV, PxV); \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 tcg_temp_free_i64(carry); \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 tcg_temp_free_i64(zero); \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 tcg_temp_free_i64(not_RttV); \<br>
-=C2=A0 =C2=A0 } while (0)<br>
-<br>
-/*<br>
- * Compare each of the 8 unsigned bytes<br>
- * The minimum is placed in each byte of the destination.<br>
- * Each bit of the predicate is set true if the bit from the first operand=
<br>
- * is greater than the bit from the second operand.<br>
- * r5:4,p1 =3D vminub(r1:0, r3:2)<br>
- */<br>
-#define fGEN_TCG_A6_vminub_RdP(SHORTCODE) \<br>
-=C2=A0 =C2=A0 do { \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 TCGv left =3D tcg_temp_new(); \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 TCGv right =3D tcg_temp_new(); \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 TCGv tmp =3D tcg_temp_new(); \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 tcg_gen_movi_tl(PeV, 0); \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 tcg_gen_movi_i64(RddV, 0); \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 for (int i =3D 0; i &lt; 8; i++) { \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 gen_get_byte_i64(left, i, RttV, =
false); \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 gen_get_byte_i64(right, i, RssV,=
 false); \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tcg_gen_setcond_tl(TCG_COND_GT, =
tmp, left, right); \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tcg_gen_deposit_tl(PeV, PeV, tmp=
, i, 1); \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tcg_gen_umin_tl(tmp, left, right=
); \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 gen_set_byte_i64(i, RddV, tmp); =
\<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 } \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 tcg_temp_free(left); \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 tcg_temp_free(right); \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 tcg_temp_free(tmp); \<br>
-=C2=A0 =C2=A0 } while (0)<br>
-<br>
=C2=A0/* Floating point */<br>
=C2=A0#define fGEN_TCG_F2_conv_sf2df(SHORTCODE) \<br>
=C2=A0 =C2=A0 =C2=A0gen_helper_conv_sf2df(RddV, cpu_env, RsV)<br>
diff --git a/target/hexagon/genptr.c b/target/hexagon/genptr.c<br>
index cf45c28f58..0e8378ac57 100644<br>
--- a/target/hexagon/genptr.c<br>
+++ b/target/hexagon/genptr.c<br>
@@ -274,61 +274,6 @@ static inline void gen_write_ctrl_reg_pair(DisasContex=
t *ctx, int reg_num,<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0}<br>
<br>
-static TCGv gen_get_byte(TCGv result, int N, TCGv src, bool sign)<br>
-{<br>
-=C2=A0 =C2=A0 if (sign) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 tcg_gen_sextract_tl(result, src, N * 8, 8);<br=
>
-=C2=A0 =C2=A0 } else {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 tcg_gen_extract_tl(result, src, N * 8, 8);<br>
-=C2=A0 =C2=A0 }<br>
-=C2=A0 =C2=A0 return result;<br>
-}<br>
-<br>
-static TCGv gen_get_byte_i64(TCGv result, int N, TCGv_i64 src, bool sign)<=
br>
-{<br>
-=C2=A0 =C2=A0 TCGv_i64 res64 =3D tcg_temp_new_i64();<br>
-=C2=A0 =C2=A0 if (sign) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 tcg_gen_sextract_i64(res64, src, N * 8, 8);<br=
>
-=C2=A0 =C2=A0 } else {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 tcg_gen_extract_i64(res64, src, N * 8, 8);<br>
-=C2=A0 =C2=A0 }<br>
-=C2=A0 =C2=A0 tcg_gen_extrl_i64_i32(result, res64);<br>
-=C2=A0 =C2=A0 tcg_temp_free_i64(res64);<br>
-<br>
-=C2=A0 =C2=A0 return result;<br>
-}<br>
-<br>
-static inline TCGv gen_get_half(TCGv result, int N, TCGv src, bool sign)<b=
r>
-{<br>
-=C2=A0 =C2=A0 if (sign) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 tcg_gen_sextract_tl(result, src, N * 16, 16);<=
br>
-=C2=A0 =C2=A0 } else {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 tcg_gen_extract_tl(result, src, N * 16, 16);<b=
r>
-=C2=A0 =C2=A0 }<br>
-=C2=A0 =C2=A0 return result;<br>
-}<br>
-<br>
-static inline void gen_set_half(int N, TCGv result, TCGv src)<br>
-{<br>
-=C2=A0 =C2=A0 tcg_gen_deposit_tl(result, result, src, N * 16, 16);<br>
-}<br>
-<br>
-static inline void gen_set_half_i64(int N, TCGv_i64 result, TCGv src)<br>
-{<br>
-=C2=A0 =C2=A0 TCGv_i64 src64 =3D tcg_temp_new_i64();<br>
-=C2=A0 =C2=A0 tcg_gen_extu_i32_i64(src64, src);<br>
-=C2=A0 =C2=A0 tcg_gen_deposit_i64(result, result, src64, N * 16, 16);<br>
-=C2=A0 =C2=A0 tcg_temp_free_i64(src64);<br>
-}<br>
-<br>
-static void gen_set_byte_i64(int N, TCGv_i64 result, TCGv src)<br>
-{<br>
-=C2=A0 =C2=A0 TCGv_i64 src64 =3D tcg_temp_new_i64();<br>
-=C2=A0 =C2=A0 tcg_gen_extu_i32_i64(src64, src);<br>
-=C2=A0 =C2=A0 tcg_gen_deposit_i64(result, result, src64, N * 8, 8);<br>
-=C2=A0 =C2=A0 tcg_temp_free_i64(src64);<br>
-}<br>
-<br>
=C2=A0static inline void gen_load_locked4u(TCGv dest, TCGv vaddr, int mem_i=
ndex)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0tcg_gen_qemu_ld32u(dest, vaddr, mem_index);<br>
@@ -417,42 +362,18 @@ void gen_store1(TCGv_env cpu_env, TCGv vaddr, TCGv sr=
c, DisasContext *ctx,<br>
=C2=A0 =C2=A0 =C2=A0gen_store32(ctx, vaddr, src, 1, slot);<br>
=C2=A0}<br>
<br>
-static inline void gen_store1i(TCGv_env cpu_env, TCGv vaddr, int32_t src,<=
br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DisasContext *ctx, int slot)<br>
-{<br>
-=C2=A0 =C2=A0 TCGv tmp =3D tcg_const_tl(src);<br>
-=C2=A0 =C2=A0 gen_store1(cpu_env, vaddr, tmp, ctx, slot);<br>
-=C2=A0 =C2=A0 tcg_temp_free(tmp);<br>
-}<br>
-<br>
=C2=A0void gen_store2(TCGv_env cpu_env, TCGv vaddr, TCGv src, DisasContext =
*ctx,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned slot=
)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0gen_store32(ctx, vaddr, src, 2, slot);<br>
=C2=A0}<br>
<br>
-static inline void gen_store2i(TCGv_env cpu_env, TCGv vaddr, int32_t src,<=
br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DisasContext *ctx, int slot)<br>
-{<br>
-=C2=A0 =C2=A0 TCGv tmp =3D tcg_const_tl(src);<br>
-=C2=A0 =C2=A0 gen_store2(cpu_env, vaddr, tmp, ctx, slot);<br>
-=C2=A0 =C2=A0 tcg_temp_free(tmp);<br>
-}<br>
-<br>
=C2=A0void gen_store4(TCGv_env cpu_env, TCGv vaddr, TCGv src, DisasContext =
*ctx,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned slot=
)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0gen_store32(ctx, vaddr, src, 4, slot);<br>
=C2=A0}<br>
<br>
-static inline void gen_store4i(TCGv_env cpu_env, TCGv vaddr, int32_t src,<=
br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DisasContext *ctx, int slot)<br>
-{<br>
-=C2=A0 =C2=A0 TCGv tmp =3D tcg_const_tl(src);<br>
-=C2=A0 =C2=A0 gen_store4(cpu_env, vaddr, tmp, ctx, slot);<br>
-=C2=A0 =C2=A0 tcg_temp_free(tmp);<br>
-}<br>
-<br>
=C2=A0void gen_store8(TCGv_env cpu_env, TCGv vaddr, TCGv_i64 src, DisasCont=
ext *ctx,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned slot=
)<br>
=C2=A0{<br>
@@ -462,25 +383,6 @@ void gen_store8(TCGv_env cpu_env, TCGv vaddr, TCGv_i64=
 src, DisasContext *ctx,<br>
=C2=A0 =C2=A0 =C2=A0ctx-&gt;store_width[slot] =3D 8;<br>
=C2=A0}<br>
<br>
-static inline void gen_store8i(TCGv_env cpu_env, TCGv vaddr, int64_t src,<=
br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DisasContext *ctx, int slot)<br>
-{<br>
-=C2=A0 =C2=A0 TCGv_i64 tmp =3D tcg_const_i64(src);<br>
-=C2=A0 =C2=A0 gen_store8(cpu_env, vaddr, tmp, ctx, slot);<br>
-=C2=A0 =C2=A0 tcg_temp_free_i64(tmp);<br>
-}<br>
-<br>
-static TCGv gen_8bitsof(TCGv result, TCGv value)<br>
-{<br>
-=C2=A0 =C2=A0 TCGv zero =3D tcg_const_tl(0);<br>
-=C2=A0 =C2=A0 TCGv ones =3D tcg_const_tl(0xff);<br>
-=C2=A0 =C2=A0 tcg_gen_movcond_tl(TCG_COND_NE, result, value, zero, ones, z=
ero);<br>
-=C2=A0 =C2=A0 tcg_temp_free(zero);<br>
-=C2=A0 =C2=A0 tcg_temp_free(ones);<br>
-<br>
-=C2=A0 =C2=A0 return result;<br>
-}<br>
-<br>
=C2=A0void gen_set_usr_field(int field, TCGv val)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0tcg_gen_deposit_tl(hex_gpr[HEX_REG_USR], hex_gpr[HEX_RE=
G_USR], val,<br>
diff --git a/target/hexagon/macros.h b/target/hexagon/macros.h<br>
index 7d09501844..56d33dc144 100644<br>
--- a/target/hexagon/macros.h<br>
+++ b/target/hexagon/macros.h<br>
@@ -67,105 +67,7 @@<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 reg_field_in=
fo[FIELD].offset, (VAL))<br>
=C2=A0#endif<br>
<br>
-#ifdef QEMU_GENERATE<br>
-/*<br>
- * Section 5.5 of the Hexagon V67 Programmer&#39;s Reference Manual<br>
- *<br>
- * Slot 1 store with slot 0 load<br>
- * A slot 1 store operation with a slot 0 load operation can appear in a p=
acket.<br>
- * The packet attribute :mem_noshuf inhibits the instruction reordering th=
at<br>
- * would otherwise be done by the assembler. For example:<br>
- *=C2=A0 =C2=A0 =C2=A0{<br>
- *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0memw(R5) =3D R2 // slot 1 store<br>
- *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0R3 =3D memh(R6) // slot 0 load<br>
- *=C2=A0 =C2=A0 =C2=A0}:mem_noshuf<br>
- * Unlike most packetized operations, these memory operations are not exec=
uted<br>
- * in parallel (Section 3.3.1). Instead, the store instruction in Slot 1<b=
r>
- * effectively executes first, followed by the load instruction in Slot 0.=
 If<br>
- * the addresses of the two operations are overlapping, the load will rece=
ive<br>
- * the newly stored data. This feature is supported in processor versions<=
br>
- * V65 or greater.<br>
- *<br>
- *<br>
- * For qemu, we look for a load in slot 0 when there is=C2=A0 a store in s=
lot 1<br>
- * in the same packet.=C2=A0 When we see this, we call a helper that merge=
s the<br>
- * bytes from the store buffer with the value loaded from memory.<br>
- */<br>
-#define CHECK_NOSHUF \<br>
-=C2=A0 =C2=A0 do { \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (insn-&gt;slot =3D=3D 0 &amp;&amp; pkt-&gt;=
pkt_has_store_s1) { \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 process_store(ctx, pkt, 1); \<br=
>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 } \<br>
-=C2=A0 =C2=A0 } while (0)<br>
-<br>
-#define MEM_LOAD1s(DST, VA) \<br>
-=C2=A0 =C2=A0 do { \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 CHECK_NOSHUF; \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 tcg_gen_qemu_ld8s(DST, VA, ctx-&gt;mem_idx); \=
<br>
-=C2=A0 =C2=A0 } while (0)<br>
-#define MEM_LOAD1u(DST, VA) \<br>
-=C2=A0 =C2=A0 do { \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 CHECK_NOSHUF; \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 tcg_gen_qemu_ld8u(DST, VA, ctx-&gt;mem_idx); \=
<br>
-=C2=A0 =C2=A0 } while (0)<br>
-#define MEM_LOAD2s(DST, VA) \<br>
-=C2=A0 =C2=A0 do { \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 CHECK_NOSHUF; \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 tcg_gen_qemu_ld16s(DST, VA, ctx-&gt;mem_idx); =
\<br>
-=C2=A0 =C2=A0 } while (0)<br>
-#define MEM_LOAD2u(DST, VA) \<br>
-=C2=A0 =C2=A0 do { \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 CHECK_NOSHUF; \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 tcg_gen_qemu_ld16u(DST, VA, ctx-&gt;mem_idx); =
\<br>
-=C2=A0 =C2=A0 } while (0)<br>
-#define MEM_LOAD4s(DST, VA) \<br>
-=C2=A0 =C2=A0 do { \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 CHECK_NOSHUF; \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 tcg_gen_qemu_ld32s(DST, VA, ctx-&gt;mem_idx); =
\<br>
-=C2=A0 =C2=A0 } while (0)<br>
-#define MEM_LOAD4u(DST, VA) \<br>
-=C2=A0 =C2=A0 do { \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 CHECK_NOSHUF; \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 tcg_gen_qemu_ld32s(DST, VA, ctx-&gt;mem_idx); =
\<br>
-=C2=A0 =C2=A0 } while (0)<br>
-#define MEM_LOAD8u(DST, VA) \<br>
-=C2=A0 =C2=A0 do { \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 CHECK_NOSHUF; \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 tcg_gen_qemu_ld64(DST, VA, ctx-&gt;mem_idx); \=
<br>
-=C2=A0 =C2=A0 } while (0)<br>
-<br>
-#define MEM_STORE1_FUNC(X) \<br>
-=C2=A0 =C2=A0 __builtin_choose_expr(TYPE_INT(X), \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 gen_store1i, \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 __builtin_choose_expr(TYPE_TCGV(X), \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 gen_store1, (void)0))<br>
-#define MEM_STORE1(VA, DATA, SLOT) \<br>
-=C2=A0 =C2=A0 MEM_STORE1_FUNC(DATA)(cpu_env, VA, DATA, ctx, SLOT)<br>
-<br>
-#define MEM_STORE2_FUNC(X) \<br>
-=C2=A0 =C2=A0 __builtin_choose_expr(TYPE_INT(X), \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 gen_store2i, \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 __builtin_choose_expr(TYPE_TCGV(X), \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 gen_store2, (void)0))<br>
-#define MEM_STORE2(VA, DATA, SLOT) \<br>
-=C2=A0 =C2=A0 MEM_STORE2_FUNC(DATA)(cpu_env, VA, DATA, ctx, SLOT)<br>
-<br>
-#define MEM_STORE4_FUNC(X) \<br>
-=C2=A0 =C2=A0 __builtin_choose_expr(TYPE_INT(X), \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 gen_store4i, \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 __builtin_choose_expr(TYPE_TCGV(X), \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 gen_store4, (void)0))<br>
-#define MEM_STORE4(VA, DATA, SLOT) \<br>
-=C2=A0 =C2=A0 MEM_STORE4_FUNC(DATA)(cpu_env, VA, DATA, ctx, SLOT)<br>
-<br>
-#define MEM_STORE8_FUNC(X) \<br>
-=C2=A0 =C2=A0 __builtin_choose_expr(TYPE_INT(X), \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 gen_store8i, \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 __builtin_choose_expr(TYPE_TCGV_I64(X), \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 gen_store8, (void)0))<br>
-#define MEM_STORE8(VA, DATA, SLOT) \<br>
-=C2=A0 =C2=A0 MEM_STORE8_FUNC(DATA)(cpu_env, VA, DATA, ctx, SLOT)<br>
-#else<br>
+#ifndef QEMU_GENERATE<br>
=C2=A0#define MEM_LOAD1s(VA) ((int8_t)mem_load1(env, slot, VA))<br>
=C2=A0#define MEM_LOAD1u(VA) ((uint8_t)mem_load1(env, slot, VA))<br>
=C2=A0#define MEM_LOAD2s(VA) ((int16_t)mem_load2(env, slot, VA))<br>
@@ -194,26 +96,6 @@ static inline void gen_cancel(unsigned slot)<br>
<br>
=C2=A0#define LOAD_CANCEL(EA) do { CANCEL; } while (0)<br>
<br>
-#ifdef QEMU_GENERATE<br>
-static inline void gen_pred_cancel(TCGv pred, unsigned slot_num)<br>
- {<br>
-=C2=A0 =C2=A0 TCGv slot_mask =3D tcg_const_tl(1 &lt;&lt; slot_num);<br>
-=C2=A0 =C2=A0 TCGv tmp =3D tcg_temp_new();<br>
-=C2=A0 =C2=A0 TCGv zero =3D tcg_const_tl(0);<br>
-=C2=A0 =C2=A0 TCGv one =3D tcg_const_tl(1);<br>
-=C2=A0 =C2=A0 tcg_gen_or_tl(slot_mask, hex_slot_cancelled, slot_mask);<br>
-=C2=A0 =C2=A0 tcg_gen_andi_tl(tmp, pred, 1);<br>
-=C2=A0 =C2=A0 tcg_gen_movcond_tl(TCG_COND_EQ, hex_slot_cancelled, tmp, zer=
o,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0slot_mask, hex_slot_cancelled);<br>
-=C2=A0 =C2=A0 tcg_temp_free(slot_mask);<br>
-=C2=A0 =C2=A0 tcg_temp_free(tmp);<br>
-=C2=A0 =C2=A0 tcg_temp_free(zero);<br>
-=C2=A0 =C2=A0 tcg_temp_free(one);<br>
-}<br>
-#define PRED_LOAD_CANCEL(PRED, EA) \<br>
-=C2=A0 =C2=A0 gen_pred_cancel(PRED, insn-&gt;is_endloop ? 4 : insn-&gt;slo=
t)<br>
-#endif<br>
-<br>
=C2=A0#define STORE_CANCEL(EA) { env-&gt;slot_cancelled |=3D (1 &lt;&lt; sl=
ot); }<br>
<br>
=C2=A0#define fMAX(A, B) (((A) &gt; (B)) ? (A) : (B))<br>
@@ -241,41 +123,17 @@ static inline void gen_pred_cancel(TCGv pred, unsigne=
d slot_num)<br>
<br>
=C2=A0#define f8BITSOF(VAL) ((VAL) ? 0xff : 0x00)<br>
<br>
-#ifdef QEMU_GENERATE<br>
-#define fLSBOLD(VAL) tcg_gen_andi_tl(LSB, (VAL), 1)<br>
-#else<br>
+#ifndef QEMU_GENERATE<br>
=C2=A0#define fLSBOLD(VAL)=C2=A0 ((VAL) &amp; 1)<br>
=C2=A0#endif<br>
<br>
-#ifdef QEMU_GENERATE<br>
-#define fLSBNEW(PVAL)=C2=A0 =C2=A0tcg_gen_mov_tl(LSB, (PVAL))<br>
-#define fLSBNEW0=C2=A0 =C2=A0 =C2=A0 =C2=A0 tcg_gen_mov_tl(LSB, hex_new_pr=
ed_value[0])<br>
-#define fLSBNEW1=C2=A0 =C2=A0 =C2=A0 =C2=A0 tcg_gen_mov_tl(LSB, hex_new_pr=
ed_value[1])<br>
-#else<br>
+#ifndef QEMU_GENERATE<br>
=C2=A0#define fLSBNEW(PVAL)=C2=A0 =C2=A0(PVAL)<br>
=C2=A0#define fLSBNEW0=C2=A0 =C2=A0 =C2=A0 =C2=A0 new_pred_value(env, 0)<br=
>
=C2=A0#define fLSBNEW1=C2=A0 =C2=A0 =C2=A0 =C2=A0 new_pred_value(env, 1)<br=
>
=C2=A0#endif<br>
<br>
-#ifdef QEMU_GENERATE<br>
-static inline void gen_logical_not(TCGv dest, TCGv src)<br>
-{<br>
-=C2=A0 =C2=A0 TCGv one =3D tcg_const_tl(1);<br>
-=C2=A0 =C2=A0 TCGv zero =3D tcg_const_tl(0);<br>
-<br>
-=C2=A0 =C2=A0 tcg_gen_movcond_tl(TCG_COND_NE, dest, src, zero, zero, one);=
<br>
-<br>
-=C2=A0 =C2=A0 tcg_temp_free(one);<br>
-=C2=A0 =C2=A0 tcg_temp_free(zero);<br>
-}<br>
-#define fLSBOLDNOT(VAL) \<br>
-=C2=A0 =C2=A0 do { \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 tcg_gen_andi_tl(LSB, (VAL), 1); \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 tcg_gen_xori_tl(LSB, LSB, 1); \<br>
-=C2=A0 =C2=A0 } while (0)<br>
-#define fLSBNEWNOT(PNUM) \<br>
-=C2=A0 =C2=A0 gen_logical_not(LSB, (PNUM))<br>
-#else<br>
+#ifndef QEMU_GENERATE<br>
=C2=A0#define fLSBNEWNOT(PNUM) (!fLSBNEW(PNUM))<br>
=C2=A0#define fLSBOLDNOT(VAL) (!fLSBOLD(VAL))<br>
=C2=A0#define fLSBNEW0NOT (!fLSBNEW0)<br>
@@ -481,21 +339,7 @@ static inline TCGv gen_read_ireg(TCGv result, TCGv val=
, int shift)<br>
=C2=A0#define fCAST8S_16S(A) (int128_exts64(A))<br>
=C2=A0#define fCAST16S_8S(A) (int128_getlo(A))<br>
<br>
-#ifdef QEMU_GENERATE<br>
-#define fEA_RI(REG, IMM) tcg_gen_addi_tl(EA, REG, IMM)<br>
-#define fEA_RRs(REG, REG2, SCALE) \<br>
-=C2=A0 =C2=A0 do { \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 TCGv tmp =3D tcg_temp_new(); \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 tcg_gen_shli_tl(tmp, REG2, SCALE); \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 tcg_gen_add_tl(EA, REG, tmp); \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 tcg_temp_free(tmp); \<br>
-=C2=A0 =C2=A0 } while (0)<br>
-#define fEA_IRs(IMM, REG, SCALE) \<br>
-=C2=A0 =C2=A0 do { \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 tcg_gen_shli_tl(EA, REG, SCALE); \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 tcg_gen_addi_tl(EA, EA, IMM); \<br>
-=C2=A0 =C2=A0 } while (0)<br>
-#else<br>
+#ifndef QEMU_GENERATE<br>
=C2=A0#define fEA_RI(REG, IMM) \<br>
=C2=A0 =C2=A0 =C2=A0do { \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0EA =3D REG + IMM; \<br>
@@ -511,18 +355,7 @@ static inline TCGv gen_read_ireg(TCGv result, TCGv val=
, int shift)<br>
=C2=A0#endif<br>
<br>
=C2=A0#ifdef QEMU_GENERATE<br>
-#define fEA_IMM(IMM) tcg_gen_movi_tl(EA, IMM)<br>
=C2=A0#define fEA_REG(REG) tcg_gen_mov_tl(EA, REG)<br>
-#define fEA_BREVR(REG)=C2=A0 =C2=A0 =C2=A0 gen_helper_fbrev(EA, REG)<br>
-#define fPM_I(REG, IMM)=C2=A0 =C2=A0 =C2=A0tcg_gen_addi_tl(REG, REG, IMM)<=
br>
-#define fPM_M(REG, MVAL)=C2=A0 =C2=A0 tcg_gen_add_tl(REG, REG, MVAL)<br>
-#define fPM_CIRI(REG, IMM, MVAL) \<br>
-=C2=A0 =C2=A0 do { \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 TCGv tcgv_siV =3D tcg_const_tl(siV); \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 gen_helper_fcircadd(REG, REG, tcgv_siV, MuV, \=
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 hex_gpr[HEX_REG_CS0 + MuN]); \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 tcg_temp_free(tcgv_siV); \<br>
-=C2=A0 =C2=A0 } while (0)<br>
=C2=A0#else<br>
=C2=A0#define fEA_IMM(IMM)=C2=A0 =C2=A0 =C2=A0 =C2=A0 do { EA =3D (IMM); } =
while (0)<br>
=C2=A0#define fEA_REG(REG)=C2=A0 =C2=A0 =C2=A0 =C2=A0 do { EA =3D (REG); } =
while (0)<br>
@@ -574,9 +407,7 @@ static inline TCGv gen_read_ireg(TCGv result, TCGv val,=
 int shift)<br>
=C2=A0#define fASHIFTL(SRC, SHAMT, REGSTYPE) \<br>
=C2=A0 =C2=A0 =C2=A0(((SHAMT) &gt;=3D (sizeof(SRC) * 8)) ? 0 : (fCAST##REGS=
TYPE##s(SRC) &lt;&lt; (SHAMT)))<br>
<br>
-#ifdef QEMU_GENERATE<br>
-#define fLOAD(NUM, SIZE, SIGN, EA, DST) MEM_LOAD##SIZE##SIGN(DST, EA)<br>
-#else<br>
+#ifndef QEMU_GENERATE<br>
=C2=A0#define fLOAD(NUM, SIZE, SIGN, EA, DST) \<br>
=C2=A0 =C2=A0 =C2=A0DST =3D (size##SIZE##SIGN##_t)MEM_LOAD##SIZE##SIGN(EA)<=
br>
=C2=A0#endif<br>
@@ -599,9 +430,7 @@ static inline TCGv gen_read_ireg(TCGv result, TCGv val,=
 int shift)<br>
=C2=A0 =C2=A0 =C2=A0gen_load_locked##SIZE##SIGN(DST, EA, ctx-&gt;mem_idx);<=
br>
=C2=A0#endif<br>
<br>
-#ifdef QEMU_GENERATE<br>
-#define fSTORE(NUM, SIZE, EA, SRC) MEM_STORE##SIZE(EA, SRC, insn-&gt;slot)=
<br>
-#else<br>
+#ifndef QEMU_GENERATE<br>
=C2=A0#define fSTORE(NUM, SIZE, EA, SRC) MEM_STORE##SIZE(EA, SRC, slot)<br>
=C2=A0#endif<br>
<br>
@@ -610,15 +439,7 @@ static inline TCGv gen_read_ireg(TCGv result, TCGv val=
, int shift)<br>
=C2=A0 =C2=A0 =C2=A0gen_store_conditional##SIZE(env, ctx, PdN, PRED, EA, SR=
C);<br>
=C2=A0#endif<br>
<br>
-#ifdef QEMU_GENERATE<br>
-#define GETBYTE_FUNC(X) \<br>
-=C2=A0 =C2=A0 __builtin_choose_expr(TYPE_TCGV(X), \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 gen_get_byte, \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 __builtin_choose_expr(TYPE_TCGV_I64(X), \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 gen_get_byte_i64, (void)0))<br>
-#define fGETBYTE(N, SRC) GETBYTE_FUNC(SRC)(BYTE, N, SRC, true)<br>
-#define fGETUBYTE(N, SRC) GETBYTE_FUNC(SRC)(BYTE, N, SRC, false)<br>
-#else<br>
+#ifndef QEMU_GENERATE<br>
=C2=A0#define fGETBYTE(N, SRC) ((int8_t)((SRC &gt;&gt; ((N) * 8)) &amp; 0xf=
f))<br>
=C2=A0#define fGETUBYTE(N, SRC) ((uint8_t)((SRC &gt;&gt; ((N) * 8)) &amp; 0=
xff))<br>
=C2=A0#endif<br>
@@ -629,10 +450,7 @@ static inline TCGv gen_read_ireg(TCGv result, TCGv val=
, int shift)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(((uint64_t)((VAL) &amp; 0x0ffLL)) &lt;&l=
t; ((N) * 8)); \<br>
=C2=A0 =C2=A0 =C2=A0} while (0)<br>
<br>
-#ifdef QEMU_GENERATE<br>
-#define fGETHALF(N, SRC)=C2=A0 gen_get_half(HALF, N, SRC, true)<br>
-#define fGETUHALF(N, SRC) gen_get_half(HALF, N, SRC, false)<br>
-#else<br>
+#ifndef QEMU_GENERATE<br>
=C2=A0#define fGETHALF(N, SRC) ((int16_t)((SRC &gt;&gt; ((N) * 16)) &amp; 0=
xffff))<br>
=C2=A0#define fGETUHALF(N, SRC) ((uint16_t)((SRC &gt;&gt; ((N) * 16)) &amp;=
 0xffff))<br>
=C2=A0#endif<br>
diff --git a/target/hexagon/op_helper.c b/target/hexagon/op_helper.c<br>
index 63dd685658..496975a394 100644<br>
--- a/target/hexagon/op_helper.c<br>
+++ b/target/hexagon/op_helper.c<br>
@@ -45,23 +45,6 @@ void QEMU_NORETURN HELPER(raise_exception)(CPUHexagonSta=
te *env, uint32_t excp)<br>
=C2=A0 =C2=A0 =C2=A0do_raise_exception_err(env, excp, 0);<br>
=C2=A0}<br>
<br>
-static void log_reg_write(CPUHexagonState *env, int rnum,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 target_ulong val, uint32_t slot)<br>
-{<br>
-=C2=A0 =C2=A0 HEX_DEBUG_LOG(&quot;log_reg_write[%d] =3D &quot; TARGET_FMT_=
ld &quot; (0x&quot; TARGET_FMT_lx &quot;)&quot;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rnum, val, =
val);<br>
-=C2=A0 =C2=A0 if (val =3D=3D env-&gt;gpr[rnum]) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 HEX_DEBUG_LOG(&quot; NO CHANGE&quot;);<br>
-=C2=A0 =C2=A0 }<br>
-=C2=A0 =C2=A0 HEX_DEBUG_LOG(&quot;\n&quot;);<br>
-<br>
-=C2=A0 =C2=A0 env-&gt;new_value[rnum] =3D val;<br>
-=C2=A0 =C2=A0 if (HEX_DEBUG) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Do this so HELPER(debug_commit_end) will kn=
ow */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 env-&gt;reg_written[rnum] =3D 1;<br>
-=C2=A0 =C2=A0 }<br>
-}<br>
-<br>
=C2=A0static void log_pred_write(CPUHexagonState *env, int pnum, target_ulo=
ng val)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0HEX_DEBUG_LOG(&quot;log_pred_write[%d] =3D &quot; TARGE=
T_FMT_ld<br>
@@ -77,46 +60,6 @@ static void log_pred_write(CPUHexagonState *env, int pnu=
m, target_ulong val)<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0}<br>
<br>
-static void log_store32(CPUHexagonState *env, target_ulong addr,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 target_ulong val, int width, int slot)<br>
-{<br>
-=C2=A0 =C2=A0 HEX_DEBUG_LOG(&quot;log_store%d(0x&quot; TARGET_FMT_lx<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;, %&q=
uot; PRId32 &quot; [0x08%&quot; PRIx32 &quot;])\n&quot;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 width, addr=
, val, val);<br>
-=C2=A0 =C2=A0 env-&gt;mem_log_stores[slot].va =3D addr;<br>
-=C2=A0 =C2=A0 env-&gt;mem_log_stores[slot].width =3D width;<br>
-=C2=A0 =C2=A0 env-&gt;mem_log_stores[slot].data32 =3D val;<br>
-}<br>
-<br>
-static void log_store64(CPUHexagonState *env, target_ulong addr,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 int64_t val, int width, int slot)<br>
-{<br>
-=C2=A0 =C2=A0 HEX_DEBUG_LOG(&quot;log_store%d(0x&quot; TARGET_FMT_lx<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;, %&q=
uot; PRId64 &quot; [0x016%&quot; PRIx64 &quot;])\n&quot;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0width=
, addr, val, val);<br>
-=C2=A0 =C2=A0 env-&gt;mem_log_stores[slot].va =3D addr;<br>
-=C2=A0 =C2=A0 env-&gt;mem_log_stores[slot].width =3D width;<br>
-=C2=A0 =C2=A0 env-&gt;mem_log_stores[slot].data64 =3D val;<br>
-}<br>
-<br>
-static void write_new_pc(CPUHexagonState *env, target_ulong addr)<br>
-{<br>
-=C2=A0 =C2=A0 HEX_DEBUG_LOG(&quot;write_new_pc(0x&quot; TARGET_FMT_lx &quo=
t;)\n&quot;, addr);<br>
-<br>
-=C2=A0 =C2=A0 /*<br>
-=C2=A0 =C2=A0 =C2=A0* If more than one branch is taken in a packet, only t=
he first one<br>
-=C2=A0 =C2=A0 =C2=A0* is actually done.<br>
-=C2=A0 =C2=A0 =C2=A0*/<br>
-=C2=A0 =C2=A0 if (env-&gt;branch_taken) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 HEX_DEBUG_LOG(&quot;INFO: multiple branches ta=
ken in same packet, &quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 &quot;ignoring the second one\n&quot;);<br>
-=C2=A0 =C2=A0 } else {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 fCHECK_PCALIGN(addr);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 env-&gt;branch_taken =3D 1;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 env-&gt;next_PC =3D addr;<br>
-=C2=A0 =C2=A0 }<br>
-}<br>
-<br>
=C2=A0/* Handy place to set a breakpoint */<br>
=C2=A0void HELPER(debug_start_packet)(CPUHexagonState *env)<br>
=C2=A0{<br>
@@ -128,11 +71,6 @@ void HELPER(debug_start_packet)(CPUHexagonState *env)<b=
r>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0}<br>
<br>
-static int32_t new_pred_value(CPUHexagonState *env, int pnum)<br>
-{<br>
-=C2=A0 =C2=A0 return env-&gt;new_pred_value[pnum];<br>
-}<br>
-<br>
=C2=A0/* Checks for bookkeeping errors between disassembly context and runt=
ime */<br>
=C2=A0void HELPER(debug_check_store_width)(CPUHexagonState *env, int slot, =
int check)<br>
=C2=A0{<br>
@@ -380,57 +318,6 @@ int32_t HELPER(vacsh_pred)(CPUHexagonState *env,<br>
=C2=A0 =C2=A0 =C2=A0return PeV;<br>
=C2=A0}<br>
<br>
-/*<br>
- * mem_noshuf<br>
- * Section 5.5 of the Hexagon V67 Programmer&#39;s Reference Manual<br>
- *<br>
- * If the load is in slot 0 and there is a store in slot1 (that<br>
- * wasn&#39;t cancelled), we have to do the store first.<br>
- */<br>
-static void check_noshuf(CPUHexagonState *env, uint32_t slot)<br>
-{<br>
-=C2=A0 =C2=A0 if (slot =3D=3D 0 &amp;&amp; env-&gt;pkt_has_store_s1 &amp;&=
amp;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 ((env-&gt;slot_cancelled &amp; (1 &lt;&lt; 1))=
 =3D=3D 0)) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 HELPER(commit_store)(env, 1);<br>
-=C2=A0 =C2=A0 }<br>
-}<br>
-<br>
-static uint8_t mem_load1(CPUHexagonState *env, uint32_t slot,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0target_ulong vaddr)<br>
-{<br>
-=C2=A0 =C2=A0 uint8_t retval;<br>
-=C2=A0 =C2=A0 check_noshuf(env, slot);<br>
-=C2=A0 =C2=A0 get_user_u8(retval, vaddr);<br>
-=C2=A0 =C2=A0 return retval;<br>
-}<br>
-<br>
-static uint16_t mem_load2(CPUHexagonState *env, uint32_t slot,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 target_ulong vaddr)<br>
-{<br>
-=C2=A0 =C2=A0 uint16_t retval;<br>
-=C2=A0 =C2=A0 check_noshuf(env, slot);<br>
-=C2=A0 =C2=A0 get_user_u16(retval, vaddr);<br>
-=C2=A0 =C2=A0 return retval;<br>
-}<br>
-<br>
-static uint32_t mem_load4(CPUHexagonState *env, uint32_t slot,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 target_ulong vaddr)<br>
-{<br>
-=C2=A0 =C2=A0 uint32_t retval;<br>
-=C2=A0 =C2=A0 check_noshuf(env, slot);<br>
-=C2=A0 =C2=A0 get_user_u32(retval, vaddr);<br>
-=C2=A0 =C2=A0 return retval;<br>
-}<br>
-<br>
-static uint64_t mem_load8(CPUHexagonState *env, uint32_t slot,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 target_ulong vaddr)<br>
-{<br>
-=C2=A0 =C2=A0 uint64_t retval;<br>
-=C2=A0 =C2=A0 check_noshuf(env, slot);<br>
-=C2=A0 =C2=A0 get_user_u64(retval, vaddr);<br>
-=C2=A0 =C2=A0 return retval;<br>
-}<br>
-<br>
=C2=A0/* Floating point */<br>
=C2=A0float64 HELPER(conv_sf2df)(CPUHexagonState *env, float32 RsV)<br>
=C2=A0{<br>
@@ -1172,12 +1059,6 @@ float64 HELPER(dfmpyhh)(CPUHexagonState *env, float6=
4 RxxV,<br>
=C2=A0 =C2=A0 =C2=A0return RxxV;<br>
=C2=A0}<br>
<br>
-static void cancel_slot(CPUHexagonState *env, uint32_t slot)<br>
-{<br>
-=C2=A0 =C2=A0 HEX_DEBUG_LOG(&quot;Slot %d cancelled\n&quot;, slot);<br>
-=C2=A0 =C2=A0 env-&gt;slot_cancelled |=3D (1 &lt;&lt; slot);<br>
-}<br>
-<br>
=C2=A0/* These macros can be referenced in the generated helper functions *=
/<br>
=C2=A0#define warn(...) /* Nothing */<br>
=C2=A0#define fatal(...) g_assert_not_reached();<br>
-- <br>
2.31.1<br>
<br>
<br>
</blockquote></div>

--000000000000567ced05c59e4d8c--

