Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FBF54FBC89
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Apr 2022 14:54:02 +0200 (CEST)
Received: from localhost ([::1]:57050 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ndtYO-0004ex-RG
	for lists+qemu-devel@lfdr.de; Mon, 11 Apr 2022 08:54:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33956)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ndtXR-0003iu-0Q
 for qemu-devel@nongnu.org; Mon, 11 Apr 2022 08:53:01 -0400
Received: from mail-yw1-x112b.google.com ([2607:f8b0:4864:20::112b]:34334)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ndtXP-0001fp-AN
 for qemu-devel@nongnu.org; Mon, 11 Apr 2022 08:53:00 -0400
Received: by mail-yw1-x112b.google.com with SMTP id
 00721157ae682-2db2add4516so164111857b3.1
 for <qemu-devel@nongnu.org>; Mon, 11 Apr 2022 05:52:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=f9YlP9gMVhZXlztVtQ8f+n61sU3wzyo8SmdZuEe4WnM=;
 b=o/pNq/bJOuzMwbKzxpLsXvb7EOKOCsc8PlujBRxazC1XZMPUthIoHuJXDEi5U0DHte
 ensrHpCHFvhpfjNBCiC8E4Qtmkw+s6RvK/btjecoVJnHn07Cmgf24Nr2gCwOjOFpwXXI
 met+0n/R6Y3MdmM7xs6Lw1tVed+RMsFAYzIorxiJj+bBa0mu1/+ZPTtVvskKU7DR1EFi
 Lm50q4tqmhwlNgGSqHWruRM1g5OXYNNf0NTHneuVF08xAPugYJwj2HATmJyhZElpFMKO
 qjcRnp7/x9C25RGyesxNyphbLWPhlN8qa/HwGFbv1VhQtP6FRV87vvAVE38u9M3tIpAi
 D3EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=f9YlP9gMVhZXlztVtQ8f+n61sU3wzyo8SmdZuEe4WnM=;
 b=DvDw3F5p9HcDx0m8xWt6HJuIoT0LvOeBepfxv25m0Lc26umJ/Sh+SoQ4r/MrLgAzxo
 0cReMCcIj4Z+WdAO3dNEMJUybCiCacfC5IyHZKPG+c1hzSYAmRO9bY7rEta3uzWoo/AK
 zlgiStXGteTijgMLXWvndeO82VjuteqqV/JM6osx3LEz3I6kZPKU60k67FbdoZzBFMp8
 dH3RwEJKLK4ImlEQ1n1lu4aHYvJbvMLjWsann3MFfyJAQ8PLTrBh2Bp8J1DCP1ePIXgy
 d2TysRkhUE2BCLUwtJoISJNxQwOiRx740yLm6yp6bN4xP+p8pfvSRkHIWM7I8LR2JdmF
 AZRw==
X-Gm-Message-State: AOAM532F5lXgtlgzJtdHc+aAfDA67nJtxjNdpbMi0q28TCMi0i7EXB33
 jqLs1e30f45Q4Dug2ZHg54pcTvh55BG+joG8sG/9yA==
X-Google-Smtp-Source: ABdhPJy76/8Fy3jeYVtXTd63MdebYrduN8+mF/ncpnudCYkk+KamuEEJNl+wSia5Nsmpnb4X8rAIdz+FWnrlPmeO4IQ=
X-Received: by 2002:a81:106:0:b0:2d0:e682:8a7a with SMTP id
 6-20020a810106000000b002d0e6828a7amr26302146ywb.257.1649681578109; Mon, 11
 Apr 2022 05:52:58 -0700 (PDT)
MIME-Version: 1.0
References: <20220409000742.293691-1-richard.henderson@linaro.org>
 <20220409000742.293691-6-richard.henderson@linaro.org>
In-Reply-To: <20220409000742.293691-6-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 11 Apr 2022 13:52:47 +0100
Message-ID: <CAFEAcA8voyvBj2ERYKweChAkHMj+OjJSzGkLrQECuxf68RXdow@mail.gmail.com>
Subject: Re: [PATCH 05/16] target/arm: Split out arm32_max_features
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112b;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112b.google.com
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, 9 Apr 2022 at 01:14, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Share the code to set AArch32 max features so that we no
> longer have code drift between qemu{-system,}-{arm,aarch64}.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/internals.h |   2 +
>  target/arm/cpu64.c     |  51 +----------------
>  target/arm/cpu_tcg.c   | 121 ++++++++++++++++++++++-------------------
>  3 files changed, 70 insertions(+), 104 deletions(-)


> +/* Share AArch32 -cpu max features with AArch64. */
> +void arm32_max_features(ARMCPU *cpu)
> +{
> +    uint32_t t;
> +
> +    /* Break with true ARMv8 and add back old-style VFP short-vector support */
> +    t = cpu->isar.mvfr0;
> +    t = FIELD_DP32(t, MVFR0, FPSHVEC, 1);
> +    cpu->isar.mvfr0 = t;

So, we definitely want to enable short-vector support for
qemu-arm -cpu max, but I'm less convinced that we want to
enable it for qemu-system-arm -cpu max, and definitely don't
think we want to enable it for system-mode qemu-system-aarch64.
'max' for usermode has more of a flavour of "run as many binaries
as we can", especially since it's the default; 'max' for system
emulation mode is more "latest and greatest", which might imply
"some very old stuff is no longer available".

thanks
-- PMM

