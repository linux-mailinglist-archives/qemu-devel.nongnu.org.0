Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 308A45652C0
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jul 2022 12:51:58 +0200 (CEST)
Received: from localhost ([::1]:56346 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8JgL-00047E-Aw
	for lists+qemu-devel@lfdr.de; Mon, 04 Jul 2022 06:51:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60102)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o8JfL-0003QJ-MV
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 06:50:55 -0400
Received: from mail-yb1-xb2e.google.com ([2607:f8b0:4864:20::b2e]:39453)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o8JfJ-0000YP-Vc
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 06:50:55 -0400
Received: by mail-yb1-xb2e.google.com with SMTP id r3so16196560ybr.6
 for <qemu-devel@nongnu.org>; Mon, 04 Jul 2022 03:50:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=teX3JtsWdqWFpLEUvHVypMxznvPUBVE1YueoaKgE9Vk=;
 b=V8vyyXXkdKvdY3GqLrKfjtYCKmmibWXrPq+SB2UPwmaK8MFSliVMxLoQacnh1wmIX9
 yS3tndXztz/GqG2XpiDJi+blcgmesKp0aCX8xifigK3BV5PgzkspbPJfG8ujox8XyZq3
 qbl6NQ6Vr6B0MW2g1aIFX1wM5a5zLEXIvzrdxvR0staUsm/lIwy/khss4qPQSPmtPZxC
 GNAIVEU4kvKS+d30GPLBu5aA7Gz/xLKAXBS0NqssM4rXkuuUwxgr7nd5thRoIzY5sK2h
 bOviGZkRMNl5uFkfPmCB/jWzcQFnDzxt3dJBfL/ayZMz5Aw4FKLt6vYbo0T9T+iDvfV5
 dPqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=teX3JtsWdqWFpLEUvHVypMxznvPUBVE1YueoaKgE9Vk=;
 b=e+taIdZChOJcJ8NkBS/SwTLebhUJE+MZQpqwBUUCXb4DwTPt2HRWAptZzXeuGWPb2L
 cdqZysbfPSAkLLTiDM1uj/3cwsaPlBE/mKsgAkxt61jb/eVlBdKhmdY1evR7MurvBZYK
 Y266xhhXB2LbbsjFcR29XqcXLxIO0Un6zP8iNV3GgSeiaTt0KYJWzm6pckYG1M1UA82E
 TKLrIQj3tzUJZAemLxm7leOEZHvpxNTiUzhCxmdvN/EEcKO2doZ2JcXVK1WTIiLm7d4I
 DExoKVmIM6sx6LjiLivCO+3ij1FTrWa3ig5IWiEkJQMecdqsmcAaw44yHtz85eQH/MKV
 2NMg==
X-Gm-Message-State: AJIora+ZLuYTJCqAO9Y6Asp9hIHt5gq11j0stJzNIgEOGO4laqppDfPY
 z0CBJ0zjVXGFHytVwZEBHi7On8Gt1/1Ivg7AmBPeZQ==
X-Google-Smtp-Source: AGRyM1vN8XiFuDO030yYUo/P11VXYpMkpZ53DTueHtCyJGQ3qWBlLMECj5b8rom+fvPFoxu24AMX4c/ZKg4sHXMgJqM=
X-Received: by 2002:a05:6902:1183:b0:66e:4860:575d with SMTP id
 m3-20020a056902118300b0066e4860575dmr5381167ybu.479.1656931852865; Mon, 04
 Jul 2022 03:50:52 -0700 (PDT)
MIME-Version: 1.0
References: <20220628042117.368549-1-richard.henderson@linaro.org>
 <20220628042117.368549-24-richard.henderson@linaro.org>
In-Reply-To: <20220628042117.368549-24-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 4 Jul 2022 11:50:41 +0100
Message-ID: <CAFEAcA8=bihNgdeAsNGS-cymu7zjCG9nA5cYTm4TokR3h2XptQ@mail.gmail.com>
Subject: Re: [PATCH v4 23/45] target/arm: Implement SME ADDHA, ADDVA
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2e;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2e.google.com
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

On Tue, 28 Jun 2022 at 05:36, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
> v4: Drop restrict.
> ---
>  target/arm/helper-sme.h    |  5 +++
>  target/arm/sme.decode      | 11 +++++
>  target/arm/sme_helper.c    | 90 ++++++++++++++++++++++++++++++++++++++
>  target/arm/translate-sme.c | 31 +++++++++++++
>  4 files changed, 137 insertions(+)


>  #undef DO_ST
> +
> +void HELPER(sme_addha_s)(void *vzda, void *vzn, void *vpn,
> +                         void *vpm, uint32_t desc)
> +{
> +    intptr_t row, col, oprsz = simd_oprsz(desc) / 4;
> +    uint64_t *pn = vpn, *pm = vpm;
> +    uint32_t *zda = vzda, *zn = vzn;
> +
> +    for (row = 0; row < oprsz; ) {
> +        uint64_t pa = pn[row >> 4];
> +        do {
> +            if (pa & 1) {
> +                for (col = 0; col < oprsz; ) {
> +                    uint64_t pb = pm[col >> 4];
> +                    do {
> +                        if (pb & 1) {
> +                            zda[row * sizeof(ARMVectorReg) + col] += zn[col];
> +                        }
> +                        pb >>= 4;
> +                    } while (++col & 15);
> +                }
> +            }
> +            pa >>= 4;
> +        } while (++row & 15);
> +    }
> +}
> +
> +void HELPER(sme_addha_d)(void *vzda, void *vzn, void *vpn,
> +                         void *vpm, uint32_t desc)
> +{
> +    intptr_t row, col, oprsz = simd_oprsz(desc) / 8;
> +    uint8_t *pn = vpn, *pm = vpm;
> +    uint64_t *zda = vzda, *zn = vzn;
> +
> +    for (row = 0; row < oprsz; ++row) {
> +        if (pn[H1(row)] & 1) {
> +            for (col = 0; col < oprsz; ++col) {
> +                if (pm[H1(col)] & 1) {
> +                    zda[row * sizeof(ARMVectorReg) + col] += zn[col];
> +                }
> +            }
> +        }
> +    }
> +}

These array index calculations look wrong again?
Should be 'row * (sizeof(ARMVectorReg) / 8) + col' or equivalent,
I think.

> +
> +void HELPER(sme_addva_s)(void *vzda, void *vzn, void *vpn,
> +                         void *vpm, uint32_t desc)
> +{
> +    intptr_t row, col, oprsz = simd_oprsz(desc) / 4;
> +    uint64_t *pn = vpn, *pm = vpm;
> +    uint32_t *zda = vzda, *zn = vzn;
> +
> +    for (row = 0; row < oprsz; ) {
> +        uint64_t pa = pn[row >> 4];
> +        do {
> +            if (pa & 1) {
> +                uint32_t zn_row = zn[row];
> +                for (col = 0; col < oprsz; ) {
> +                    uint64_t pb = pm[col >> 4];
> +                    do {
> +                        if (pb & 1) {
> +                            zda[row * sizeof(ARMVectorReg) + col] += zn_row;
> +                        }
> +                        pb >>= 4;
> +                    } while (++col & 15);
> +                }
> +            }
> +            pa >>= 4;
> +        } while (++row & 15);
> +    }
> +}
> +
> +void HELPER(sme_addva_d)(void *vzda, void *vzn, void *vpn,
> +                         void *vpm, uint32_t desc)
> +{
> +    intptr_t row, col, oprsz = simd_oprsz(desc) / 8;
> +    uint8_t *pn = vpn, *pm = vpm;
> +    uint64_t *zda = vzda, *zn = vzn;
> +
> +    for (row = 0; row < oprsz; ++row) {
> +        if (pn[H1(row)] & 1) {
> +            uint64_t zn_row = zn[row];
> +            for (col = 0; col < oprsz; ++col) {
> +                if (pm[H1(col)] & 1) {
> +                    zda[row * sizeof(ARMVectorReg) + col] += zn_row;
> +                }
> +            }
> +        }
> +    }
> +}

-- PMM

