Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7422468DC61
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Feb 2023 16:02:00 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPPTI-0003OI-Jm; Tue, 07 Feb 2023 10:01:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pPPT9-0003GR-Qe
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 10:01:17 -0500
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pPPT5-0005zL-Ea
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 10:01:14 -0500
Received: by mail-pl1-x62d.google.com with SMTP id w5so5867695plg.8
 for <qemu-devel@nongnu.org>; Tue, 07 Feb 2023 07:01:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=6gcN7uAfBuE+Iv+Jv0N20LKfUBBCHJ1n+tuXKq5KP1o=;
 b=hJP1UBkxcahnGA6M/lSgOVKglDnAiMLViey4ej++byUt7CbXtDsXLt4r5OISLNYDOr
 oecE9iXoCOOhhOEWSZi7adE5/CYBtErxUEPZE+bfPcDIBIFqsMgIFbXnAL0M/6n43uj+
 V/So739jrQrcZ4TwalYx9WGvRHwMIxyA67JV5gUmrqjB6oOm877CYnBmhbY8/eYdCeWo
 LABzLAB4ohmN/eqKD78c65wMc8mjs59m6oCIZDlrsTHEu9lhlDMW4JGFThG5hNlo6Mjn
 yrPkaNccP5qD9FyM1uQrFDl7zNth5YSdmYgMGfUN2anyHWapxjl/N9F0eNL0wAukdSjU
 LtKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6gcN7uAfBuE+Iv+Jv0N20LKfUBBCHJ1n+tuXKq5KP1o=;
 b=TrmyDYAmruTvHBLZondgFjTDlQ/qcJoT2SZpqlp+94D0wWbMK8P1jDPfQ1gINK6ifv
 k0zz/ceF3Di8Qd6/PpqGjuzJXsq+yQMzhKrcZBkLCK8z389XQE+r930Ynkf1G0WIl4gC
 66524U79ohTMiVY4GI7KUM26XOVpeF6kvV2pqK7vqSScQ70MYBd74PoRkVivAWIwPolf
 jcjwsx10sIBDQ3pg9UPca2xRCgeMDB2uV1MAL+efeoSyIpD35xPiNwRMlsJAlfE5H/pp
 VSshpquhb6JOixVXb8An7Ot1AVYuYYiA5OzjFvuCBzKCRwFZ6BDNZCpVEJMrc/JP5vKZ
 0PXw==
X-Gm-Message-State: AO0yUKUEbtLssLst5NOrZ3YIYQG9gQJY2/u+PI6kQa1vddKKghx6Zqu5
 LR8KXCD+qh/uSNjOxmNka2IHpMloPSdwSKGM+3+xDg==
X-Google-Smtp-Source: AK7set9SpC4xaCNkxIEljrw6ZaIkPlglwmgHxvDa2oJfA4sZ7IIY7tQFF+vr1Vtr0AGA9UBO1ILVhQDPFS+yvN/d+NQ=
X-Received: by 2002:a17:90a:a38d:b0:230:81fc:db1b with SMTP id
 x13-20020a17090aa38d00b0023081fcdb1bmr2912034pjp.89.1675782068502; Tue, 07
 Feb 2023 07:01:08 -0800 (PST)
MIME-Version: 1.0
References: <20230124000027.3565716-1-richard.henderson@linaro.org>
 <20230124000027.3565716-8-richard.henderson@linaro.org>
In-Reply-To: <20230124000027.3565716-8-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 7 Feb 2023 15:00:57 +0000
Message-ID: <CAFEAcA8aRKL2Fh-CG3qYF+wH3rH1m79a-E9crUNSCWNQRF+KUg@mail.gmail.com>
Subject: Re: [PATCH 07/22] target/arm: Introduce ARMSecuritySpace
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, yier.jin@huawei.com, 
 jonathan.cameron@huawei.com, leonardo.garcia@linaro.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x62d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Tue, 24 Jan 2023 at 00:01, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Introduce both the enumeration and functions to retrieve
> the current state, and state outside of EL3.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/cpu.h    | 87 +++++++++++++++++++++++++++++++++++----------
>  target/arm/helper.c | 46 ++++++++++++++++++++++++
>  2 files changed, 115 insertions(+), 18 deletions(-)

> +/* Return true if @space is secure, in the pre-v9 sense. */
> +static inline bool arm_space_is_secure(ARMSecuritySpace space)
> +{
> +    return space == ARMSS_Secure || space == ARMSS_Root;
> +}


> +/**
> + * arm_is_secure:
> + * @env: cpu context
> + *
> + * Return true if the processor is in secure state.
> + */
>  static inline bool arm_is_secure(CPUARMState *env)
>  {
> -    if (arm_is_el3_or_mon(env)) {
> -        return true;
> -    }
> -    return arm_is_secure_below_el3(env);
> +    ARMSecuritySpace ss = arm_security_space(env);
> +    return ss == ARMSS_Secure || ss == ARMSS_Root;

maybe
  return arm_space_is_secure(arm_security_space(env));

?

>  }
>
>  /*
> @@ -2457,11 +2498,21 @@ static inline bool arm_is_el2_enabled(CPUARMState *env)
>  }
>
>  #else
> +static inline ARMSecuritySpace arm_security_space_below_el3(CPUARMState *env)
> +{
> +    return ARMSS_NonSecure;
> +}
> +
>  static inline bool arm_is_secure_below_el3(CPUARMState *env)
>  {
>      return false;
>  }
>
> +static inline ARMSecuritySpace arm_security_space(CPUARMState *env)
> +{
> +    return ARMSS_NonSecure;
> +}
> +
>  static inline bool arm_is_secure(CPUARMState *env)
>  {
>      return false;
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index 7bd15e9d17..bf78a1d74e 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -12280,3 +12280,49 @@ void aarch64_sve_change_el(CPUARMState *env, int old_el,
>      }
>  }
>  #endif
> +
> +#ifndef CONFIG_USER_ONLY
> +ARMSecuritySpace arm_security_space(CPUARMState *env)
> +{
> +    if (!arm_feature(env, ARM_FEATURE_EL3)) {

The old code had a comment
-        /* If EL3 is not supported then the secure state is implementation
-         * defined, in which case QEMU defaults to non-secure.
which should probably go here I guess.

(Though it's not quite so true for R-profile, where you
don't get to make the impdef choice: v8R-32 is always
NS, and v8R-64 always S. If we ever have to implement
the latter this will probably cause some mild pain.)


Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

