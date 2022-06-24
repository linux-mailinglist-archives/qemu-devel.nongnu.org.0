Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E92485599B4
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Jun 2022 14:34:22 +0200 (CEST)
Received: from localhost ([::1]:48638 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4iVx-0007KS-IL
	for lists+qemu-devel@lfdr.de; Fri, 24 Jun 2022 08:34:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51564)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o4iTl-0006CC-SE
 for qemu-devel@nongnu.org; Fri, 24 Jun 2022 08:32:05 -0400
Received: from mail-yw1-x112a.google.com ([2607:f8b0:4864:20::112a]:41908)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o4iTk-0000XP-67
 for qemu-devel@nongnu.org; Fri, 24 Jun 2022 08:32:05 -0400
Received: by mail-yw1-x112a.google.com with SMTP id
 00721157ae682-31780ad7535so23138797b3.8
 for <qemu-devel@nongnu.org>; Fri, 24 Jun 2022 05:32:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=A2zsBKlm84Kh8579BFURJASeL9cYA63ljvqLGC2kaLk=;
 b=VJQNmPSQs2oGlzftRyoYeEskz7FMXhCVvYlhFZg1T29dLcVU7qvJTXdXJHM3zx9VcF
 66UDyY/FfPmEu3NxQncV/Z9PyjNjIPQpCjI27l7OLx/ItzBjspdVQWk71lqtxfIEcyeX
 Z454J1Pwv3u/9vgIi4zwE/bO5oEQw9K3vbFKmQVqGXh+2SeqMsH4nx4Z8iCM2BRXfNSw
 rYKjgXH7d0ZaGeZs73QOF6xUKs7ncNGLUSZE9OLzvm9b2cucJeIqxgAadAgXcLzCT9n4
 Kn44hZ1tcIob8AXSawBbel14Ko5XdULJgtI676TQ0Npn6z2VUYvXptkRQAu0fmfk8jqU
 sdlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=A2zsBKlm84Kh8579BFURJASeL9cYA63ljvqLGC2kaLk=;
 b=XqnGuWSFFlbMu0HIoM2NmgmJALgeJXPehkBY2xrgqB0uLMHnUGuZahgBLsrcnsGhmf
 O9FEwWHzrcAIJ44IpfOQgQDBwL4lgtCjKbxoj9S6mCqNBOkr9EoT/uTm3a3og7tB3KlG
 A6csbDk/cghrYX/GSy1UiPnN/FTHm9MWsFGkWSU8VaGf2FQXtJVN2M11yVx/ef9Nf8vA
 Z4N84vXYdaz42hF6WV0O44tGidf7BYt3Ft5+TaPdq0xFxsTC776Y/d/ULk4WqUTSubRP
 yZefNTcr755aJMEMJlbf/DaZWJmtldTCQIgfXk0mTm2NqjK1D1y2EyXKSr10kM/853Me
 Kn2g==
X-Gm-Message-State: AJIora/vbGWgoEiQPJqrYBNggNjxepaOAnbngwPUO3coHS2YaHbe5kIW
 nhLMCf3WoKOPjlVHkF0UJLNARmHKkQqf3n1R9RY2og==
X-Google-Smtp-Source: AGRyM1vW/KuImiK2wM5wSMfUcpRNvjcOC7rBj1t/5yyRhKa71dgUuQjxr45tobGZgH/YvvHjxu8apChD2y9J8BtZPb4=
X-Received: by 2002:a81:1cc:0:b0:317:a0fa:7a61 with SMTP id
 195-20020a8101cc000000b00317a0fa7a61mr16743999ywb.10.1656073922661; Fri, 24
 Jun 2022 05:32:02 -0700 (PDT)
MIME-Version: 1.0
References: <20220620175235.60881-1-richard.henderson@linaro.org>
 <20220620175235.60881-31-richard.henderson@linaro.org>
In-Reply-To: <20220620175235.60881-31-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 24 Jun 2022 13:31:24 +0100
Message-ID: <CAFEAcA-y99PmUdPbdrWSj=_vUy35tRRFOJgkG2Lyg1A_iK6qRQ@mail.gmail.com>
Subject: Re: [PATCH v3 30/51] target/arm: Implement FMOPA, FMOPS (non-widening)
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

On Mon, 20 Jun 2022 at 19:07, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

> +void HELPER(sme_fmopa_s)(void *vza, void *vzn, void *vzm, void *vpn,
> +                         void *vpm, void *vst, uint32_t desc)
> +{
> +    intptr_t row, col, oprsz = simd_maxsz(desc);
> +    uint32_t neg = simd_data(desc) << 31;
> +    uint16_t *pn = vpn, *pm = vpm;
> +
> +    bool save_dn = get_default_nan_mode(vst);
> +    set_default_nan_mode(true, vst);
> +
> +    for (row = 0; row < oprsz; ) {
> +        uint16_t pa = pn[H2(row >> 4)];
> +        do {
> +            if (pa & 1) {
> +                void *vza_row = vza + row * sizeof(ARMVectorReg);
> +                uint32_t n = *(uint32_t *)(vzn + row) ^ neg;
> +
> +                for (col = 0; col < oprsz; ) {
> +                    uint16_t pb = pm[H2(col >> 4)];
> +                    do {
> +                        if (pb & 1) {
> +                            uint32_t *a = vza_row + col;
> +                            uint32_t *m = vzm + col;
> +                            *a = float32_muladd(n, *m, *a, 0, vst);
> +                        }
> +                        col += 4;
> +                        pb >>= 4;
> +                    } while (col & 15);
> +                }
> +            }
> +            row += 4;
> +            pa >>= 4;
> +        } while (row & 15);
> +    }

The code for the double version seems straightforward:
row counts from 0 up to the number of rows, and we
do something per row. Why is the single precision version
doing something with an unrolled loop here? It's confusing
that 'oprsz' in the two functions isn't the same thing --
in the double version we divide by the element size, but
here we don't.

> +
> +    set_default_nan_mode(save_dn, vst);
> +}
> +
> +void HELPER(sme_fmopa_d)(void *vza, void *vzn, void *vzm, void *vpn,
> +                         void *vpm, void *vst, uint32_t desc)
> +{
> +    intptr_t row, col, oprsz = simd_oprsz(desc) / 8;
> +    uint64_t neg = (uint64_t)simd_data(desc) << 63;
> +    uint64_t *za = vza, *zn = vzn, *zm = vzm;
> +    uint8_t *pn = vpn, *pm = vpm;
> +
> +    bool save_dn = get_default_nan_mode(vst);
> +    set_default_nan_mode(true, vst);
> +
> +    for (row = 0; row < oprsz; ++row) {
> +        if (pn[H1(row)] & 1) {
> +            uint64_t *za_row = &za[row * sizeof(ARMVectorReg)];
> +            uint64_t n = zn[row] ^ neg;
> +
> +            for (col = 0; col < oprsz; ++col) {
> +                if (pm[H1(col)] & 1) {
> +                    uint64_t *a = &za_row[col];
> +                    *a = float64_muladd(n, zm[col], *a, 0, vst);
> +                }
> +            }
> +        }
> +    }
> +
> +    set_default_nan_mode(save_dn, vst);
> +}

The pseudocode says that we ignore floating point exceptions
(ie do not accumulate them in the FPSR) -- it passes fpexc == false
to FPMulAdd(). Don't we need to do something special to arrange
for that ?

thanks
-- PMM

