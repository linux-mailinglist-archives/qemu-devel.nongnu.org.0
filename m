Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C72E56901E
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jul 2022 18:57:34 +0200 (CEST)
Received: from localhost ([::1]:57056 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o98LF-0000as-Bb
	for lists+qemu-devel@lfdr.de; Wed, 06 Jul 2022 12:57:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50616)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o98IU-0007DN-4K
 for qemu-devel@nongnu.org; Wed, 06 Jul 2022 12:54:44 -0400
Received: from mail-yw1-x1131.google.com ([2607:f8b0:4864:20::1131]:36850)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o98II-0004RL-3e
 for qemu-devel@nongnu.org; Wed, 06 Jul 2022 12:54:41 -0400
Received: by mail-yw1-x1131.google.com with SMTP id
 00721157ae682-31caffa4a45so74584917b3.3
 for <qemu-devel@nongnu.org>; Wed, 06 Jul 2022 09:54:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vw8mdLuuEMPv584JDmqMvt5ubyIGjiXJjC5oKLTyb0w=;
 b=ui/CCp2iGMIyyLGpcMihdGOpTbx8d888tRFk84V9wmPJjwQACgnzJ/oj2DfdlZfdjU
 gAOKlLmet6nVKEPa3M+lI+sePzugpj3EHGqoKPjOIsQJ0wvos1uROBSbqWXZ/+rbTq/Z
 r8c3cuXmw787CjpooLQmciXEe8oJm3APbKuL8VZcb1wJDNGIIdhWqkpErj9qhPtGV97w
 u6B65eng3VBlDlavHLZ2XB/v+Kd2nhPLEkt4REHIlkjRvOSPxTqiQwQlCSPVAlILExCT
 PTo64WjflSaX0EPrQc9MVQ8gENyxm0KHEytBSnn/B96grEFcEHWEy/ol7DzKqDwEt02F
 o6tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vw8mdLuuEMPv584JDmqMvt5ubyIGjiXJjC5oKLTyb0w=;
 b=28RmNe2efYjWI9QAlIJN5u9SgVKoSiN9p4KQG8sgw6pUqTe/D5uGAYOSkxeuqu6Ch7
 IZhLhD3opPHTGfdK+1R2aqb+xutrPO06WOvuwPYM6zLvNKUrG27dAZLPBIrtZGNZxA0f
 kcXGGv3qCnXju5eg5wF8hqSchRch2Nlgses2IzvKwWR6NQnjOkVyAbb9DQL6RHLpJ3kd
 i7kzT+Q+8fbPZ5mCFcEjKpgj9aMDa0ssJPdL7BRUbUisu5FnVBslAdDvxoYYH+/08QQL
 ldkzwE+HnPqNCSMcsO+MKDSQJfX7WCgv1bsi+DPBlgaGNmzZOkdRRBPpf8vl2Mq+6cCV
 rsHw==
X-Gm-Message-State: AJIora8TYNpjLONCGhHsABu4snxosHMY7wVEKStYQ9nVyUFGhYxMHSp7
 2YY439LZKtPF5tigPmFgRpS4YPaa8ldgZeR3Hen34Q==
X-Google-Smtp-Source: AGRyM1sxSLYLWJjiw1D8KMkXgYhsvYmIvDPA9AEFLLAASTCfla0VY+an00xYt4dQmdBzYuwNy7X3L2F6ls5xns66tJY=
X-Received: by 2002:a81:8d08:0:b0:317:a4cd:d65d with SMTP id
 d8-20020a818d08000000b00317a4cdd65dmr45627155ywg.329.1657126468987; Wed, 06
 Jul 2022 09:54:28 -0700 (PDT)
MIME-Version: 1.0
References: <20220706082411.1664825-1-richard.henderson@linaro.org>
 <20220706082411.1664825-24-richard.henderson@linaro.org>
In-Reply-To: <20220706082411.1664825-24-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 6 Jul 2022 17:53:51 +0100
Message-ID: <CAFEAcA-UFwHkxtHEpEca2=HELeh8Ba9bHAvL3tFX5BDeGnwy=A@mail.gmail.com>
Subject: Re: [PATCH v5 23/45] target/arm: Implement SME ADDHA, ADDVA
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1131;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1131.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
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

On Wed, 6 Jul 2022 at 10:17, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

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
> +                            zda[tile_vslice_index(row) + col] += zn[col];

Doesn't this need some H macros to handle the bigendian case?
We process the predicate from architecturally least to most
significant, but because zda is a uint32_t* we don't handle
that in the same order I think. Similarly sme_addva_s().

> +                        }
> +                        pb >>= 4;
> +                    } while (++col & 15);
> +                }
> +            }
> +            pa >>= 4;
> +        } while (++row & 15);
> +    }
> +}

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

