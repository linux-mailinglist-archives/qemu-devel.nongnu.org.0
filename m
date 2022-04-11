Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1953A4FC27D
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Apr 2022 18:36:12 +0200 (CEST)
Received: from localhost ([::1]:46234 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ndx1P-0003Qd-7i
	for lists+qemu-devel@lfdr.de; Mon, 11 Apr 2022 12:36:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39774)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ndwyc-0007lk-4a
 for qemu-devel@nongnu.org; Mon, 11 Apr 2022 12:33:20 -0400
Received: from mail-yb1-xb33.google.com ([2607:f8b0:4864:20::b33]:37791)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ndwya-0000So-N8
 for qemu-devel@nongnu.org; Mon, 11 Apr 2022 12:33:17 -0400
Received: by mail-yb1-xb33.google.com with SMTP id g30so1600730ybe.4
 for <qemu-devel@nongnu.org>; Mon, 11 Apr 2022 09:33:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=HmM7RYJUuoF+aH+ErziRWCH/z/cehlNtCXMjRSt+j/A=;
 b=MAkBpn1g4rydyuEWV2d9gfFd2zxPdQ7wqTMwvubZtLsxjnYT+M9jOsDd3gNlUzd5JS
 P33nuFhuy1nK5K4eOYjjFkOQYHFhG/0zXpTA9s2XDGBg55jhUj9+uciUoBmjJ++nqy99
 oEkNxXobr6uZwBg4AofL8DO4GwotWptm4A1AeYCIug3SG0212+cR43dHNrotHlIrHc6c
 MVTWkm4hE0RgnDWttik7aUA3ABHnduX3rFEWeTRZ2a0wAgglu9hdWU4DFijk202vrj1W
 GCQhkBOlUtLVYgEeOV7ztUawLo99s4h1Hqa5uOC7GEhJJ3nBj7Um2ZnnqatzTt1vECZN
 ZmlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HmM7RYJUuoF+aH+ErziRWCH/z/cehlNtCXMjRSt+j/A=;
 b=1jITzq8ntbr3dFBHNTYoqxKSBHFt0h23djpiqyFVqF/MZqgEplCZou9hgXgkvkK/if
 u94PP3rwMs4olT3LQNbqbxB99774IaMv/SltDJnta1K2Ol3CJlH4uTIzbGoz60S+4cyY
 V3aYeV837GZnzQvEIx8JoJoQo/PK1HDOLbKcCF6Dq6uUFwbkr9pZE/BG7aWcX57LbKqj
 ZmL/YMBG8qhckjCMmfyua9Ouwfl5NXyUcSkYC2olUGo9NrZAtQ9rFMJ4y5hYBZPkjCiA
 zQ6aSchnEmwF/NIfqXjj8mwwkyAOWL9HaYLQ+4UBWCzOGU9oVklxrb1LQR851EqOwOmQ
 yL7Q==
X-Gm-Message-State: AOAM5309rFXtbUCWAus22bwbJg8Jk/fCrRihJY1v6tZj+MCSFII+zBxT
 HgxIJE1Nqvf9r1ST6Z32/0X4Teo5WjbPDBS2a5r6DQ==
X-Google-Smtp-Source: ABdhPJywx7n05+1WzGLhym+0wntwZ52bmX9jtNbB1k4LX9wXSQOlqRPeyok0v+p1IAcyqOo89K9DSNsAmOTOIK5r9Og=
X-Received: by 2002:a25:ae54:0:b0:641:1aaf:c89 with SMTP id
 g20-20020a25ae54000000b006411aaf0c89mr8930094ybe.479.1649694795377; Mon, 11
 Apr 2022 09:33:15 -0700 (PDT)
MIME-Version: 1.0
References: <20220409000742.293691-1-richard.henderson@linaro.org>
 <20220409000742.293691-17-richard.henderson@linaro.org>
In-Reply-To: <20220409000742.293691-17-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 11 Apr 2022 17:33:04 +0100
Message-ID: <CAFEAcA897adk1A_2x8Tq1CjCmLy0kGEi85WnYnqF6WiB=6dBuQ@mail.gmail.com>
Subject: Re: [PATCH 16/16] target/arm: Enable FEAT_IESB for -cpu max
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b33;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb33.google.com
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

On Sat, 9 Apr 2022 at 01:23, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> This feature is AArch64 only, and applies to physical SErrors,
> which QEMU does not implement, thus the feature is a nop.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/cpu64.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
> index 03c6707111..def0f1fdcb 100644
> --- a/target/arm/cpu64.c
> +++ b/target/arm/cpu64.c
> @@ -838,6 +838,7 @@ static void aarch64_max_initfn(Object *obj)
>      t = cpu->isar.id_aa64mmfr2;
>      t = FIELD_DP64(t, ID_AA64MMFR2, CNP, 1);      /* FEAT_TTCNP */
>      t = FIELD_DP64(t, ID_AA64MMFR2, UAO, 1);      /* FEAT_UAO */
> +    t = FIELD_DP64(t, ID_AA64MMFR2, IESB, 1);     /* FEAT_IESB */
>      t = FIELD_DP64(t, ID_AA64MMFR2, VARANGE, 1);  /* FEAT_LVA */
>      t = FIELD_DP64(t, ID_AA64MMFR2, ST, 1);       /* FEAT_TTST */
>      cpu->isar.id_aa64mmfr2 = t;
> --
> 2.25.1

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

