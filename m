Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E53A353E5A7
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Jun 2022 18:13:52 +0200 (CEST)
Received: from localhost ([::1]:53102 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyFMW-0006KJ-2b
	for lists+qemu-devel@lfdr.de; Mon, 06 Jun 2022 12:13:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45016)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nyF7d-00084N-Ts
 for qemu-devel@nongnu.org; Mon, 06 Jun 2022 11:58:30 -0400
Received: from mail-yw1-x112b.google.com ([2607:f8b0:4864:20::112b]:38467)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nyF7c-00063p-6C
 for qemu-devel@nongnu.org; Mon, 06 Jun 2022 11:58:29 -0400
Received: by mail-yw1-x112b.google.com with SMTP id
 00721157ae682-2ff7b90e635so147691207b3.5
 for <qemu-devel@nongnu.org>; Mon, 06 Jun 2022 08:58:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=eKRfOqP25EiRc9vL44tKEywJYxx78TNx5KgYXH5Keeo=;
 b=VAg2MPjkVE97yViRFVGeMvOD/3FnRQsM1mEqZklU3V9+bDlukFK8G2wIkHYXShhj28
 wBsOaNRjNzPSS8t9IGZqvglzVCxAWLYAn0DnOd911+45bggpSeYoOj4QOc9sK/SEXnhq
 z+3Wx1es/6YO4wbs3rWuMYhxgw9pppticKiJJxj9HqNCajLvcTi+ioNqvO9zF2uDsOsi
 8U7xhVnWj9RCv6XpE53joCWpBZbQ7l8l+zi2+BR2zjKEAja1/9lhsCNYW0+ZhqruBzBH
 XlU0D/Tecpt80j/mkK2V1WtIsfFpakX8bqtqiMQOVMLlpflbmuc+bShvm8EPa0kf738F
 NmNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=eKRfOqP25EiRc9vL44tKEywJYxx78TNx5KgYXH5Keeo=;
 b=yq9hlYkANePSS9KcOciFl5f173tK7YfqO+iBWl/wTYGSr0czTXJy/HG9lR/RPRKfj5
 u7WfYOhjEaYZTVFB3xbZVvqJL/3GAcn4hKu9vQtyD0YfJX5JqAqgfC4tpPn6tJ3DHG9w
 MwhJwd2LOobWtqyeaMpo6u66BiIB2Au0pH8Vkf2F2231q0RRIjcwoDeKrGsWA0lP8TpV
 YMFoBFDc2QTXYmeJfEwHo8ht1/QIYa5wNWmbK9ZpJPm0vYO3xwfqZ79I5YVs+LGk1kmf
 CJo/V6rZaIDx1T6sDc7rvhJ9qXJUKIqw40adhbktp9fa7Zl/cB6Ue6Jyozt8dSjZ5cnI
 R6GQ==
X-Gm-Message-State: AOAM530XH+08m0La2iWtumdchgNl+1j2IOQ19gAhrG9jEruSLWCcNnHN
 Zh19JwW5igabqxGvCY12X6pwgk6BwrVSXscGTlFimQ==
X-Google-Smtp-Source: ABdhPJzj+doa+3deuKvS6sF1Y0adtpHp+sX5VrFJR0xiNcQmbUGcXa4oYTVE2eitAdL6O9VioRmsCDwpFlNUuRQeE6M=
X-Received: by 2002:a81:6904:0:b0:2fe:e670:318a with SMTP id
 e4-20020a816904000000b002fee670318amr26278980ywc.329.1654531106587; Mon, 06
 Jun 2022 08:58:26 -0700 (PDT)
MIME-Version: 1.0
References: <20220602214853.496211-1-richard.henderson@linaro.org>
 <20220602214853.496211-29-richard.henderson@linaro.org>
In-Reply-To: <20220602214853.496211-29-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 6 Jun 2022 16:58:16 +0100
Message-ID: <CAFEAcA_+-xbJkN8uBCL0UyJUmu+wrU1i5EMnwSu6pjC++gjg5Q@mail.gmail.com>
Subject: Re: [PATCH 28/71] target/arm: Add PSTATE.{SM,ZA} to TB flags
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 2 Jun 2022 at 23:22, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> These are required to determine if various insns
> are allowed to issue.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/cpu.h           | 2 ++
>  target/arm/translate.h     | 4 ++++
>  target/arm/helper.c        | 4 ++++
>  target/arm/translate-a64.c | 2 ++
>  4 files changed, 12 insertions(+)
>
> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> index 1ae1b7122b..9bd8058afe 100644
> --- a/target/arm/cpu.h
> +++ b/target/arm/cpu.h
> @@ -3284,6 +3284,8 @@ FIELD(TBFLAG_A64, TCMA, 16, 2)
>  FIELD(TBFLAG_A64, MTE_ACTIVE, 18, 1)
>  FIELD(TBFLAG_A64, MTE0_ACTIVE, 19, 1)
>  FIELD(TBFLAG_A64, SMEEXC_EL, 20, 2)
> +FIELD(TBFLAG_A64, PSTATE_SM, 22, 1)
> +FIELD(TBFLAG_A64, PSTATE_ZA, 23, 1)
>
>  /*
>   * Helpers for using the above.
> diff --git a/target/arm/translate.h b/target/arm/translate.h
> index a492e4217b..fbd6713572 100644
> --- a/target/arm/translate.h
> +++ b/target/arm/translate.h
> @@ -101,6 +101,10 @@ typedef struct DisasContext {
>      bool align_mem;
>      /* True if PSTATE.IL is set */
>      bool pstate_il;
> +    /* True if PSTATE.SM is set. */
> +    bool pstate_sm;
> +    /* True if PSTATE.ZA is set. */
> +    bool pstate_za;
>      /* True if MVE insns are definitely not predicated by VPR or LTPSIZE */
>      bool mve_no_pred;
>      /*
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index f852fd7644..3edecb56b6 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -13857,6 +13857,10 @@ static CPUARMTBFlags rebuild_hflags_a64(CPUARMState *env, int el, int fp_el,
>      }
>      if (cpu_isar_feature(aa64_sme, env_archcpu(env))) {
>          DP_TBFLAG_A64(flags, SMEEXC_EL, sme_exception_el(env, el));
> +        if (FIELD_EX64(env->svcr, SVCR, SM)) {
> +            DP_TBFLAG_A64(flags, PSTATE_SM, 1);
> +        }
> +        DP_TBFLAG_A64(flags, PSTATE_ZA, FIELD_EX64(env->svcr, SVCR, ZA));

Why did you write these two differently? Don't they do the same
thing (set the tb flag to the value of the bit in env->svcr) ?

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

