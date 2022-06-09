Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 295875454B0
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jun 2022 21:12:29 +0200 (CEST)
Received: from localhost ([::1]:51256 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzNa0-00004v-6H
	for lists+qemu-devel@lfdr.de; Thu, 09 Jun 2022 15:12:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49562)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzLQ3-0006Rb-88
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 12:54:03 -0400
Received: from mail-yb1-xb2e.google.com ([2607:f8b0:4864:20::b2e]:41924)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzLQ0-0007Kr-J4
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 12:54:02 -0400
Received: by mail-yb1-xb2e.google.com with SMTP id e184so42760085ybf.8
 for <qemu-devel@nongnu.org>; Thu, 09 Jun 2022 09:54:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9NjmZq2FTkWs7bk8NVL+Z9nGi0I8flVKyKYjxY9T348=;
 b=jkcEP3U7fTX7lpSO32xjugMP2b2D6qSsZ1Hq5MfVZjraVu8v1KXwqoRYE6PSkxFjNt
 VhuU86O1DkUkBa6YpGsm6+pPdYqPkvFCVAfWRFHiGBxLqYmJmDTWP1XW9urS8oa6MEMa
 kehxVBda+oFN8xkrJdg7yEkVa8F154wn3OUMNMREjKbcSiLmLurB2Aw2qRctP/n6WFrX
 ke3jyF0q8aDARc6I16/+9aRy0LvdC9f5k8m/MZ0RxgsNyKzS6Z0xcNghe9YTr2C3l2sW
 AwqGOmnohf2ktBfUjUMcfN/M5LvWKUm3rNRcbhVUjSOzbL9sFoYOyEkaX3XrbpqnJuPb
 /9DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9NjmZq2FTkWs7bk8NVL+Z9nGi0I8flVKyKYjxY9T348=;
 b=2rDRb3PgGmFwmM80NZHVhkKWn8+IfhtbvZ0iO73oFYwb8J2sqnhlT9EylLYXu+Q8Xt
 n7x2h+tYBAZ1TG2agCCzjjS0yXztM2KqD9fr6V4BgY7Sp2nonPbc+pP381/gTTrzLeM1
 Luu/Y5G8NRJxmlh1/W1W6U5FhEojTT4MA7hqnKQAHq1IhjbMfuva62mvvmfprmxxKAGY
 qfcNweAe8PiuVXVTm9Yc5MojkOyoG9fPf8O6icd14T+82i5WMXSxBSO8bUOE8bxu/2Bj
 P2ERSMJ4yJxtOqdusCBkx1axTIKGqKo+j3eibew3qXgpWYQ0aFoXtsfNK1Yt+TiLFRJq
 ozwg==
X-Gm-Message-State: AOAM532P+9+YuUdhksytPZjrmYJGsId9KGhri71LIOKrNefSrWVzyPTU
 sP2KhUAE+xTtUhsc12Xd15PJcWjXVuDk/C+NULFyGg==
X-Google-Smtp-Source: ABdhPJyEPNfGC9dQPm8CkPfWozc77ij8w2opdkZbwbzD3kEIbuIdxCJFn54jU1bTNPgfP7zwl5sxbip5hIjB2SSo188=
X-Received: by 2002:a25:47d4:0:b0:65d:510e:c8de with SMTP id
 u203-20020a2547d4000000b0065d510ec8demr40746971yba.39.1654793639468; Thu, 09
 Jun 2022 09:53:59 -0700 (PDT)
MIME-Version: 1.0
References: <20220607024734.541321-1-richard.henderson@linaro.org>
 <20220607024734.541321-25-richard.henderson@linaro.org>
In-Reply-To: <20220607024734.541321-25-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 9 Jun 2022 17:53:49 +0100
Message-ID: <CAFEAcA9KR9_YicVwE0Ryp8BWzUe_-xOV78h=v9b5Hhpm+LZpCA@mail.gmail.com>
Subject: Re: [PATCH v2 24/25] target/arm: Rearrange Secure PL1 test in
 arm_debug_target_el
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

On Tue, 7 Jun 2022 at 04:06, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Not a bug, because arm_is_el2_enabled tests for secure,
> and SCR_EL3.EEL2 cannot be set for AArch32, however the
> ordering of the tests looks odd.  Mirror the structure
> over in exception_target_el().

I think the code is following the ordering in the
DebugTarget() and DebugTargetFrom() pseudocode (or else some other
equivalent function in an older version of the Arm ARM...)

> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/debug_helper.c | 30 ++++++++++++++++--------------
>  1 file changed, 16 insertions(+), 14 deletions(-)
>
> diff --git a/target/arm/debug_helper.c b/target/arm/debug_helper.c
> index b18a6bd3a2..59dfcb5d5c 100644
> --- a/target/arm/debug_helper.c
> +++ b/target/arm/debug_helper.c
> @@ -15,22 +15,24 @@
>  /* Return the Exception Level targeted by debug exceptions. */
>  static int arm_debug_target_el(CPUARMState *env)
>  {
> -    bool secure = arm_is_secure(env);
> -    bool route_to_el2 = false;
> -
> -    if (arm_is_el2_enabled(env)) {
> -        route_to_el2 = env->cp15.hcr_el2 & HCR_TGE ||
> -                       env->cp15.mdcr_el2 & MDCR_TDE;
> -    }
> -
> -    if (route_to_el2) {
> -        return 2;
> -    } else if (arm_feature(env, ARM_FEATURE_EL3) &&
> -               !arm_el_is_aa64(env, 3) && secure) {
> +    /*
> +     * No such thing as secure EL1 if EL3 is AArch32.
> +     * Remap Secure PL1 to EL3.
> +     */

I think you're also relying on there being no secure EL2
if EL3 is AArch32 (otherwise an exception from secure EL0
might need to be routed to secure EL2, not EL3).

> +    if (arm_is_secure(env) && !arm_el_is_aa64(env, 3)) {
>          return 3;
> -    } else {
> -        return 1;
>      }
> +
> +    /*
> +     * HCR.TGE redirects EL0 exceptions from EL1 to EL2.
> +     * MDCR.TDE redirects both EL0 and EL1 debug exceptions to EL2.
> +     */
> +    if (arm_is_el2_enabled(env) &&
> +        (env->cp15.hcr_el2 & HCR_TGE || env->cp15.mdcr_el2 & MDCR_TDE)) {
> +        return 2;
> +    }
> +
> +    return 1;
>  }

Anyway, if you prefer this way around
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

though I think there is usually some value in following
the pseudocode's arrangement.

thanks
-- PMM

