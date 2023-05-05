Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8888A6F82CE
	for <lists+qemu-devel@lfdr.de>; Fri,  5 May 2023 14:21:25 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puuQt-0004TH-0w; Fri, 05 May 2023 08:21:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1puuQl-0004RF-I1
 for qemu-devel@nongnu.org; Fri, 05 May 2023 08:21:00 -0400
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1puuQi-0000V5-UZ
 for qemu-devel@nongnu.org; Fri, 05 May 2023 08:20:59 -0400
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-50b37f3e664so2939269a12.1
 for <qemu-devel@nongnu.org>; Fri, 05 May 2023 05:20:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683289255; x=1685881255;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=KvoXJYNvX9n9momKDN8qbvYhgMMWdb947PQJo5DOJ+o=;
 b=Q6B0xKlY4mUHfgbC6MZuNVgV4FbsXVKxSG95DmrkJqiahUIoPCWDeB/SoqkG56jiYT
 Qpcu2xmmo+NorRlVB65ly5BVVFD3bQ3hf/Y8e/fTy3fUoxp16srmbiQ2+lkLQHFb6YdT
 0Z7lSQ96bd5u2ZyjbFo+YWmgjrzDtrRhY+I1eaX49YGtH6KT51jL/kLD4P23PSg7D4xd
 S2ou5OxtT1H/1reLZxutnLluE5T18bBAIuAPWtV4VLCuDJiEscuAzwY2SKCcOoyteN33
 85MceeZXVbQ2i14qn9Uj/+lb5eBNEDWOQpR33O7jZVaG7e2F2j47QAHMw7XJCbtVrHRR
 YtqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683289255; x=1685881255;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=KvoXJYNvX9n9momKDN8qbvYhgMMWdb947PQJo5DOJ+o=;
 b=J9jk7cYr0mSQ48PRFayvCGDvWnCfr0tJFyV5tZljlSj34+wnHPVvaDZn9t7O/t8Ht0
 ZishKeTwVWOLW0kvTTqeignw1Q4SPSxQgqZ6oJeubNin6PgOZP+Wyfwv479WSAM10fGD
 BgHy3w30LrIkOHg0qKfamD5H0g2mcXT2zfXiVJQkWBpHHNPWnhMtYyc7bwdrrM5WFH0H
 AvSR+yJQ3AThcKP2aC73JmieKRWyPUb5zd4A9/EYj+LipP88tJaUhjv7YdRo4Z4fI1aq
 0YZButUaEThfZb6U19a71kLZ8ec5Yxt65LcrueDBHIFdMMZ20bmeouPnvbOTLIpd47yb
 rWFA==
X-Gm-Message-State: AC+VfDzxjs63iWq0s+3qhe7Od4G0wUCwfx3SVfuVst7bVub0omkdk8cE
 7NDhIf5xlolVnUsendfBwDryhwd0Boa7pfE8eZlzyg==
X-Google-Smtp-Source: ACHHUZ6AXHQusOxsxAoAJcg1W+vcQdAijIWCq+H4GmbQgtV3SQBzI3dZKkZX63h67ifh+HzKG8dLiSrncpu1ACQl1Q8=
X-Received: by 2002:aa7:dc01:0:b0:506:b2a3:a8cd with SMTP id
 b1-20020aa7dc01000000b00506b2a3a8cdmr1053831edu.40.1683289255339; Fri, 05 May
 2023 05:20:55 -0700 (PDT)
MIME-Version: 1.0
References: <20230503070656.1746170-1-richard.henderson@linaro.org>
 <20230503070656.1746170-32-richard.henderson@linaro.org>
In-Reply-To: <20230503070656.1746170-32-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 5 May 2023 13:20:44 +0100
Message-ID: <CAFEAcA-kjRRTWNGaHV7joa-Snb33RoBwwpV+LPLW43_MXsXFrg@mail.gmail.com>
Subject: Re: [PATCH v4 31/57] tcg/sparc64: Rename tcg_out_movi_imm13 to
 tcg_out_movi_s13
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, git@xen0n.name, gaosong@loongson.cn, 
 philmd@linaro.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org, 
 qemu-s390x@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x529.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Wed, 3 May 2023 at 08:12, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Emphasize that the constant is signed.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/sparc64/tcg-target.c.inc | 30 +++++++++++++++---------------
>  1 file changed, 15 insertions(+), 15 deletions(-)

Commit message says we're just doing a rename, but...

> @@ -425,15 +425,15 @@ static void tcg_out_movi_int(TCGContext *s, TCGType type, TCGReg ret,
>      tcg_target_long hi, lo = (int32_t)arg;
>      tcg_target_long test, lsb;
>
> -    /* A 32-bit constant, or 32-bit zero-extended to 64-bits.  */
> -    if (type == TCG_TYPE_I32 || arg == (uint32_t)arg) {
> -        tcg_out_movi_imm32(s, ret, arg);
> +    /* A 13-bit constant sign-extended to 64-bits.  */
> +    if (check_fit_tl(arg, 13)) {
> +        tcg_out_movi_s13(s, ret, arg);
>          return;
>      }
>
> -    /* A 13-bit constant sign-extended to 64-bits.  */
> -    if (check_fit_tl(arg, 13)) {
> -        tcg_out_movi_imm13(s, ret, arg);
> +    /* A 32-bit constant, or 32-bit zero-extended to 64-bits.  */
> +    if (type == TCG_TYPE_I32 || arg == (uint32_t)arg) {
> +        tcg_out_movi_imm32(s, ret, arg);
>          return;
>      }

...the commit has other code changes. Should these be in some
other patch ?

thanks
-- PMM

