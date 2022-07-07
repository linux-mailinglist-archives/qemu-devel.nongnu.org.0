Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C7B46569EC9
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jul 2022 11:44:41 +0200 (CEST)
Received: from localhost ([::1]:49248 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9O3s-00052B-H6
	for lists+qemu-devel@lfdr.de; Thu, 07 Jul 2022 05:44:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52690)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o9O2U-00049e-CP
 for qemu-devel@nongnu.org; Thu, 07 Jul 2022 05:43:14 -0400
Received: from mail-yw1-x1132.google.com ([2607:f8b0:4864:20::1132]:36370)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o9O2S-00023c-H1
 for qemu-devel@nongnu.org; Thu, 07 Jul 2022 05:43:14 -0400
Received: by mail-yw1-x1132.google.com with SMTP id
 00721157ae682-31caffa4a45so92835557b3.3
 for <qemu-devel@nongnu.org>; Thu, 07 Jul 2022 02:43:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=d3px6ppU1QpFYdnAU/tOdOALWEZdpB7TD3A5WxA0Hbo=;
 b=wxatWTuXZmzlOkWIlNeWpOZ2/qT7dF7W0iG8ncVzfDI6s9Y5D1M/zMpIyCm9cogl1W
 r22pXgp1O8bbpuZwI3O3N6ajATDkaiVW5HGS8PncVPhWGi9jBkr69iHpyRFehYtCeHbL
 NZzQnwouDgY65h9cg6PWJSOuxZOrgNceYvar7KFWcnmjHgz79QOk0KO9ULWL2C7Tpg/C
 sio0aG/IlQuCZ3bJHYg6IfWgM88HugV7wcOiTjvx8NgHOkF6AHKZV2+/w/18HizYsx8d
 C8F1P414TfNqsTfGH8FHCuvhiUl4iYGMDEtwaFr/F4Z6JYjNcZcVS4hL6R+8V6jFBhGJ
 bpjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=d3px6ppU1QpFYdnAU/tOdOALWEZdpB7TD3A5WxA0Hbo=;
 b=DBmLPiYmbm2PAvDa/EXFEPIla3sh1WANkme7/XvryPr7x7hiJQ+WSSdJHZ8rtjjqtm
 nHyduE5UWtBA8WILjQuv7x/MDUIYYWdElVe5TAGnGBsdNoQ7xWV6WsUqKWyGYudFG5yv
 INAlE652K/rufAAlxqYvZ28ADOulmsrHjUtsABKRye6LqAnv7tqJmJbl7yJiPu4N2lxj
 1wPhWJl5lDO1VQRZqSadfiYdHgyjPAQSGKnEn+mXr8kT1GTEyZV8j0zlTWtpYDoLU4ey
 3ED4LSf6+n8A2D7ZRwXmxgl8KkTOogIL+mdLyIVBmkrumD3RNBGP1UrcgjY0oNUrAiCv
 ttVQ==
X-Gm-Message-State: AJIora8uQzjd/6wHGd+Oi89ZFbu2exSRHv6BrDBKK0GsvYqxyffuiER6
 qDFbHi18pWC3jwjykwdnGZA/+BFnDOSjEnmROgdfFA==
X-Google-Smtp-Source: AGRyM1t82oDHOszl2C45Mb+2cwEeMLJ3AAyN92wBjeqx2e/+W4hvhx+uFtiyzUgBYcq6ml9uz7SN0TDuJmVphMGGGvw=
X-Received: by 2002:a81:f8f:0:b0:31c:bd9f:31ce with SMTP id
 137-20020a810f8f000000b0031cbd9f31cemr17974576ywp.347.1657186990643; Thu, 07
 Jul 2022 02:43:10 -0700 (PDT)
MIME-Version: 1.0
References: <20220706082411.1664825-1-richard.henderson@linaro.org>
 <20220706082411.1664825-26-richard.henderson@linaro.org>
In-Reply-To: <20220706082411.1664825-26-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 7 Jul 2022 10:42:32 +0100
Message-ID: <CAFEAcA8Ou2N9qJyvSy2wkpGtguCjJrA9YWoio4jsrv5VrNE3VQ@mail.gmail.com>
Subject: Re: [PATCH v5 25/45] target/arm: Implement BFMOPA, BFMOPS
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

On Wed, 6 Jul 2022 at 10:36, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/helper-sme.h    |  2 ++
>  target/arm/sme.decode      |  2 ++
>  target/arm/sme_helper.c    | 52 ++++++++++++++++++++++++++++++++++++++
>  target/arm/translate-sme.c | 30 ++++++++++++++++++++++
>  4 files changed, 86 insertions(+)
>
> diff --git a/target/arm/helper-sme.h b/target/arm/helper-sme.h
> index f50d0fe1d6..1d68fb8c74 100644
> --- a/target/arm/helper-sme.h
> +++ b/target/arm/helper-sme.h
> @@ -125,3 +125,5 @@ DEF_HELPER_FLAGS_7(sme_fmopa_s, TCG_CALL_NO_RWG,
>                     void, ptr, ptr, ptr, ptr, ptr, ptr, i32)
>  DEF_HELPER_FLAGS_7(sme_fmopa_d, TCG_CALL_NO_RWG,
>                     void, ptr, ptr, ptr, ptr, ptr, ptr, i32)
> +DEF_HELPER_FLAGS_6(sme_bfmopa, TCG_CALL_NO_RWG,
> +                   void, ptr, ptr, ptr, ptr, ptr, i32)
> diff --git a/target/arm/sme.decode b/target/arm/sme.decode
> index ba4774d174..afd9c0dffd 100644
> --- a/target/arm/sme.decode
> +++ b/target/arm/sme.decode
> @@ -73,3 +73,5 @@ ADDVA_d         11000000 11 01000 1 ... ... ..... 00 ...        @adda_64
>
>  FMOPA_s         10000000 100 ..... ... ... ..... . 00 ..        @op_32
>  FMOPA_d         10000000 110 ..... ... ... ..... . 0 ...        @op_64
> +
> +BFMOPA          10000001 100 ..... ... ... ..... . 00 ..        @op_32
> diff --git a/target/arm/sme_helper.c b/target/arm/sme_helper.c
> index 78ba34f3d2..4b437bb913 100644
> --- a/target/arm/sme_helper.c
> +++ b/target/arm/sme_helper.c
> @@ -981,3 +981,55 @@ void HELPER(sme_fmopa_d)(void *vza, void *vzn, void *vzm, void *vpn,
>          }
>      }
>  }
> +
> +/*
> + * Alter PAIR as needed for controlling predicates being false,
> + * and for NEG on an enabled row element.
> + */
> +static inline uint32_t f16mop_adj_pair(uint32_t pair, uint32_t pg, uint32_t neg)
> +{
> +    pair ^= neg;

You seem to be negating element 1 of row and col ('neg' here is
1 << 15 unless I've misread something, and it gets passed to
the calls for both the row and column data), but the pseudocode
says we want to negate element 0 and element 1 of row, and not
negate the col elements.

> +    if (!(pg & 1)) {
> +        pair &= 0xffff0000u;
> +    }
> +    if (!(pg & 4)) {
> +        pair &= 0x0000ffffu;
> +    }

The pseudocode sets the element to 0 if it is not
predicated, and then applies the negation second.

> +    return pair;
> +}
> +
> +void HELPER(sme_bfmopa)(void *vza, void *vzn, void *vzm, void *vpn,
> +                        void *vpm, uint32_t desc)
> +{
> +    intptr_t row, col, oprsz = simd_maxsz(desc);
> +    uint32_t neg = simd_data(desc) << 15;
> +    uint16_t *pn = vpn, *pm = vpm;
> +
> +    for (row = 0; row < oprsz; ) {
> +        uint16_t pa = pn[H2(row >> 4)];
> +        do {
> +            void *vza_row = vza + tile_vslice_offset(row);
> +            uint32_t n = *(uint32_t *)(vzn + row);

More missing H macros ?

> +
> +            n = f16mop_adj_pair(n, pa, neg);
> +
> +            for (col = 0; col < oprsz; ) {
> +                uint16_t pb = pm[H2(col >> 4)];
> +                do {
> +                    if ((pa & 0b0101) == 0b0101 || (pb & 0b0101) == 0b0101) {

The pseudocode test for "do we do anything" is
 (prow_0 && pcol_0) || (prow_1 && pcol_1)

but isn't this C expression doing
 (prow_0 && prow_1) || (pcol_0 && pcol_1) ?

> +                        uint32_t *a = vza_row + col;
> +                        uint32_t m = *(uint32_t *)(vzm + col);
> +
> +                        m = f16mop_adj_pair(m, pb, neg);
> +                        *a = bfdotadd(*a, n, m);
> +
> +                        col += 4;
> +                        pb >>= 4;
> +                    }
> +                } while (col & 15);
> +            }
> +            row += 4;
> +            pa >>= 4;
> +        } while (row & 15);
> +    }
> +}

thanks
-- PMM

