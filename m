Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C05E4569EDD
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jul 2022 11:53:08 +0200 (CEST)
Received: from localhost ([::1]:55448 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9OC3-0001Al-Af
	for lists+qemu-devel@lfdr.de; Thu, 07 Jul 2022 05:53:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54156)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o9O9n-0000Ay-4t
 for qemu-devel@nongnu.org; Thu, 07 Jul 2022 05:50:48 -0400
Received: from mail-yw1-x112a.google.com ([2607:f8b0:4864:20::112a]:46890)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o9O9l-0003IO-JQ
 for qemu-devel@nongnu.org; Thu, 07 Jul 2022 05:50:46 -0400
Received: by mail-yw1-x112a.google.com with SMTP id
 00721157ae682-31c89653790so113627297b3.13
 for <qemu-devel@nongnu.org>; Thu, 07 Jul 2022 02:50:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2+7wSShS7IOa9zHLBriGTQZefWIupB7YBUOj0bBdgqg=;
 b=gAbmPDEak+kQlzi1wzrYT7SfLIO6SFgfMN6bFM9kEDc2/MKlsLnAZi/5Rge/q/zT5/
 arw6TJvhRFYezNDzvuTeuW5guJ0piwaNxB4HyxF9DYpdR3Wr40+cpN8jG8XuPskfVRG+
 yJRdsZM4KUVaEi9RNttBJfQz3gB+u8YMHhDXppI9JrA34YaolRIEGQH6P3ck2Hcojwg1
 fkhhGXc8o/CB9Jgg695yL6udU1UdC//TPCXUhNq2HZM/DE/QvYosyCMCgQjP9wGINhww
 rZF/KTnXAKDSbbfYHFcN2Kn0aIm6jsMKV1dYz2vK/oX4bMqlJ3XHszpSo6HHa6L5FhGA
 unWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2+7wSShS7IOa9zHLBriGTQZefWIupB7YBUOj0bBdgqg=;
 b=YbUogLOuFM1Sz5KPLhOC4MPniyYdCra0UmBTmxrsgTaSZ/g83Ha4UWTmpbaepnVLjq
 aFVmx9+MaXMqWvdNMFD50NV5yvCmGwQBvhE98OLXy3j8jlVmsxIyp1lshPgZdHlcB+fr
 yh5ucmPHjmSbUoLm0eDdcfnMbCfH/BudwMOi1ZUEwtCs505SvWLGfgoAJj/i4AYuLtlU
 c6WLLkGBO5D/6GbnqQ+zf4LcNi7QqGp4+RXL5K6QdbKHcxV/mfUDsm+PcBeqf4XNEdfB
 eb/cpmz3X2kZPmCU676Po+UOwTbS80ZnwUU8yA6x8gWdCLcOWwuMQEy+cfJSvWC0i9vO
 sYxQ==
X-Gm-Message-State: AJIora9+hPm3He72grjZR98mEe7RAAKQD15HCmF9vwrEIsBHh95aia/S
 fFe4h2uCQeaR0fQ2hjZQS5D7jbFpnbVd3CyDGCZdxw==
X-Google-Smtp-Source: AGRyM1uDQ7H7m/D2aHlD9MsyDZrg53Pu932ulTt/09Zd1taBvKSsIoLcV4avMumUZ+Z9Mdk1XjCA+zi1MfehmIfwLLI=
X-Received: by 2002:a81:6585:0:b0:31c:b55b:dd36 with SMTP id
 z127-20020a816585000000b0031cb55bdd36mr19171030ywb.469.1657187444238; Thu, 07
 Jul 2022 02:50:44 -0700 (PDT)
MIME-Version: 1.0
References: <20220706082411.1664825-1-richard.henderson@linaro.org>
 <20220706082411.1664825-27-richard.henderson@linaro.org>
In-Reply-To: <20220706082411.1664825-27-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 7 Jul 2022 10:50:05 +0100
Message-ID: <CAFEAcA9pv2xH9mvydFK4zqB1viH1DebLB_s7bCYXDGqsCKatew@mail.gmail.com>
Subject: Re: [PATCH v5 26/45] target/arm: Implement FMOPA, FMOPS (widening)
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112a;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112a.google.com
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

On Wed, 6 Jul 2022 at 10:26, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>


> +static float32 f16_dotadd(float32 sum, uint32_t e1, uint32_t e2,
> +                          float_status *s_std, float_status *s_odd)
> +{
> +    float64 e1r = float16_to_float64(e1 & 0xffff, true, s_std);
> +    float64 e1c = float16_to_float64(e1 >> 16, true, s_std);
> +    float64 e2r = float16_to_float64(e2 & 0xffff, true, s_std);
> +    float64 e2c = float16_to_float64(e2 >> 16, true, s_std);
> +    float64 t64;
> +    float32 t32;
> +
> +    /*
> +     * The ARM pseudocode function FPDot performs both multiplies
> +     * and the add with a single rounding operation.  Emulate this
> +     * by performing the first multiply in round-to-odd, then doing
> +     * the second multiply as fused multiply-add, and rounding to
> +     * float32 all in one step.
> +     */

I guess if we find we're not producing quite bit-accurate results
we can come back and revisit this :-)

> +    t64 = float64_mul(e1r, e2r, s_odd);
> +    t64 = float64r32_muladd(e1c, e2c, t64, 0, s_std);
> +
> +    /* This conversion is exact, because we've already rounded. */
> +    t32 = float64_to_float32(t64, s_std);
> +
> +    /* The final accumulation step is not fused. */
> +    return float32_add(sum, t32, s_std);
> +}
> +
> +void HELPER(sme_fmopa_h)(void *vza, void *vzn, void *vzm, void *vpn,
> +                         void *vpm, void *vst, uint32_t desc)
> +{
> +    intptr_t row, col, oprsz = simd_maxsz(desc);
> +    uint32_t neg = simd_data(desc) << 15;
> +    uint16_t *pn = vpn, *pm = vpm;
> +    float_status fpst_odd, fpst_std = *(float_status *)vst;
> +
> +    set_default_nan_mode(true, &fpst_std);
> +    fpst_odd = fpst_std;
> +    set_float_rounding_mode(float_round_to_odd, &fpst_odd);
> +
> +    for (row = 0; row < oprsz; ) {
> +        uint16_t pa = pn[H2(row >> 4)];
> +        do {
> +            void *vza_row = vza + tile_vslice_offset(row);
> +            uint32_t n = *(uint32_t *)(vzn + row);

More missing H macros.

> +
> +            n = f16mop_adj_pair(n, pa, neg);
> +
> +            for (col = 0; col < oprsz; ) {
> +                uint16_t pb = pm[H2(col >> 4)];
> +                do {
> +                    if ((pa & 0b0101) == 0b0101 || (pb & 0b0101) == 0b0101) {

Wrong condition again?

> +                        uint32_t *a = vza_row + col;
> +                        uint32_t m = *(uint32_t *)(vzm + col);
> +
> +                        m = f16mop_adj_pair(m, pb, neg);
> +                        *a = f16_dotadd(*a, n, m, &fpst_std, &fpst_odd);
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

