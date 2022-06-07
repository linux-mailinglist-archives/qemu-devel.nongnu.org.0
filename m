Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D888053FB1D
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jun 2022 12:24:39 +0200 (CEST)
Received: from localhost ([::1]:59982 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyWO6-0000EO-V7
	for lists+qemu-devel@lfdr.de; Tue, 07 Jun 2022 06:24:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34514)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nyVyx-0003KX-By
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 05:58:39 -0400
Received: from mail-yw1-x112a.google.com ([2607:f8b0:4864:20::112a]:46340)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nyVyv-0004fs-Lg
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 05:58:38 -0400
Received: by mail-yw1-x112a.google.com with SMTP id
 00721157ae682-30c1c9b9b6cso169308697b3.13
 for <qemu-devel@nongnu.org>; Tue, 07 Jun 2022 02:58:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=158CzHbpaTbWJqQiRq3juohgXzQ6HLt89e6fhzrQJ2Q=;
 b=s4AtW5AFDmTl44w4YQ+vm27DJGHGdyDKDEJqx+zAC1odLJPwFL0OY+mNOoRFNC6wC3
 Y+kgJ7mnWKqjwncJ85+nk+W2lMzximpaefH2PGKE7DWPM4FjW9cZmvMu9gASo6ia4xK2
 Qb49SK9sLkIoPDG4SPd5wGolMzvpCQk+X3pZgos6BsLqrlK9jt/JQImcTXl0HXSFA4Qg
 bmqtWRmArVrq0oWE1nmzoLOnQ8p5cIc26E8F50U9kgpW8Xr7ZZvJy7PO/q2jEwQJCSf2
 UKYym/9DShU/rTSU+HZv/iVqUNgQGqmWZJhbtzmsbHdEc9OoMFwVnah+50mk89heMt3/
 BVkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=158CzHbpaTbWJqQiRq3juohgXzQ6HLt89e6fhzrQJ2Q=;
 b=GU5qLhH5tW3/HTUIG7Mx0pf/VMo58hIUi9nM4rN6MVWkMeC4xRWHsNOYEMEHZleKRa
 ux+SaS7Abjm5JESq6lklFTTG+zo8Vls2aj0llBYoHaCzQnmB+C7/LDbMVBZ5wY5AvGVE
 5j5H1ZF5wa6a5KHhpXxuryqxq18TGu2kSw6xeB8nMLHHkSkkTrLcrl62nxUCMw7aeHzx
 cgC+TUXZa09axYDQIA2djkvuuRRGuKjhI3Wu1quSM2/2MGpm/WwCUnHTd3f504b5b+jU
 PHF+KEyne96NR/DpxjiCT7YfKXP8FwfbflsM0j7HCaFS/7R3GNNJnxOQ4t8OYxZqPd0L
 MIdQ==
X-Gm-Message-State: AOAM530CcNKeKYTShllmHa/Ye8tI7eJr4gApUwGdZRxDULaHgyzLTnKx
 bo14NGa8DlNJplohRc31P1zYW0824kCeU/QKIsMj8g==
X-Google-Smtp-Source: ABdhPJxVKRNtD0ebVfXjJOG1aKENkd3BH49gkReMoXRXq/qqonM/nnesketHpDuda/woEMx/TJw7VHlQkbnKNCQzrNI=
X-Received: by 2002:a0d:fc83:0:b0:2e5:b0f4:c125 with SMTP id
 m125-20020a0dfc83000000b002e5b0f4c125mr31278848ywf.347.1654595916542; Tue, 07
 Jun 2022 02:58:36 -0700 (PDT)
MIME-Version: 1.0
References: <20220602214853.496211-1-richard.henderson@linaro.org>
 <20220602214853.496211-40-richard.henderson@linaro.org>
In-Reply-To: <20220602214853.496211-40-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 7 Jun 2022 10:58:26 +0100
Message-ID: <CAFEAcA-UeGqXp4wUSoR73pCUBm9_WEB_MeAKsdXQOvnK+ajWVg@mail.gmail.com>
Subject: Re: [PATCH 39/71] target/arm: Add SVL to TB flags
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

On Thu, 2 Jun 2022 at 23:18, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> We need SVL separate from VL for RDSVL at al, as well as

"et al"

> ZA storage loads and stores, which do not require PSTATE.SM.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/cpu.h           | 12 ++++++++++++
>  target/arm/translate.h     |  1 +
>  target/arm/helper.c        |  8 +++++++-
>  target/arm/translate-a64.c |  1 +
>  4 files changed, 21 insertions(+), 1 deletion(-)
>
> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> index e41a75a3a3..0c32c3afaa 100644
> --- a/target/arm/cpu.h
> +++ b/target/arm/cpu.h
> @@ -3292,6 +3292,7 @@ FIELD(TBFLAG_A64, MTE0_ACTIVE, 19, 1)
>  FIELD(TBFLAG_A64, SMEEXC_EL, 20, 2)
>  FIELD(TBFLAG_A64, PSTATE_SM, 22, 1)
>  FIELD(TBFLAG_A64, PSTATE_ZA, 23, 1)
> +FIELD(TBFLAG_A64, SVL, 24, 4)

Given that both SVE and SME start with an 'S', maybe
"SME_VL" would be less prone to confusion? On the other hand,
SVL is the architectural name, so maybe that's best.

>  /*
>   * Helpers for using the above.
> @@ -3337,6 +3338,17 @@ static inline int sve_vq_cached(CPUARMState *env)
>      return EX_TBFLAG_A64(env->hflags, VL) + 1;
>  }
>
> +/**
> + * sme_vq_cached
> + * @env: the cpu context
> + *
> + * Return the SVL cached within env->hflags, in units of quadwords.
> + */
> +static inline int sme_vq_cached(CPUARMState *env)

Same remark as earlier about not needing to put "cached" in the function name.

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

