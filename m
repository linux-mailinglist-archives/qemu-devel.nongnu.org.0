Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BBE0691FC0
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Feb 2023 14:29:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQTSh-0000o1-Pu; Fri, 10 Feb 2023 08:29:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pQTSW-0000nY-0F
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 08:29:00 -0500
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pQTST-0005pS-Qo
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 08:28:59 -0500
Received: by mail-pf1-x430.google.com with SMTP id v3so3457114pfn.6
 for <qemu-devel@nongnu.org>; Fri, 10 Feb 2023 05:28:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=YD0SsNne1TI6VhFFbXP/zfcLWxYTwXyRY8QrhJ/xA68=;
 b=kf7tQ226E3R/2IQVb4KAZwCfENcMbrmMTf5BcLqnWS++p6RTfiK83Ju7O/b7gRx5sJ
 B3A4003himDm6A8R2RxyDFE69bnulLP9JOBXYdMFIKDxdI1S2XLZ4l/tkM1B7aJeS9tE
 6atkVf+X5cSWyShE8fhDFNYeEoaIT+ZeHQvU0D1k2xZt7VVTkT/JNEC0OxGnWpgMzOQg
 SBPmcgMm5ADoyjbcy+bI3iHPjZRtKr3c/OGegOmt1S4NNpVJ5Sez6W+X1Gn8bCdGxwAi
 vjn+DR1IOQn7+I2m0voSODU9EAmRnUJewl4mXqhfsTmzI4W8Bv748f/nzMQ6FX3AZYkX
 pfnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=YD0SsNne1TI6VhFFbXP/zfcLWxYTwXyRY8QrhJ/xA68=;
 b=L6SCABqQyYpTi8IFUqSNjL27Tom4U9Q+v4qWYM4mVaq6YyLJdYEXbi0HM4Jh89xVeQ
 SDHRcJm1DajpWWMD700ZSAD6Cyu7S07hBelc1OnUtuxbhe0CYpOhB3gwM/aKlXAWYSNV
 qgnp34oskv2WxvN9gFMUZbM5LKuBLeRDvl6nwpJC4S/A+rFSRZKQntmyXNlccRbuLdsO
 dCi34IFwrt/2VLQKg6Dvw+XQNEdWOjc2CIL9RcWDFGuwJVB3D2zkth7HWHqshCoR3chC
 3KZAT0g+FDY+AlUuHySkT412pySC71ANqdAbR/uUM1tIjtNi+362mqup8Maj8Cl/QW/p
 uj6g==
X-Gm-Message-State: AO0yUKW/PzKtzbnVtPWQqdYWGq3QoqGg9H/y+hTgcUCkpKrLYxv+rbC2
 GIpwbFNaBFj4uSCY9WhtVykBi1ra8P7SMjMWcSnOoQ==
X-Google-Smtp-Source: AK7set8wcshbZGiWRPSQtlfDjCFHbEy/GmcjWy5UlJz4zYcOdEBtnAfMtnrwVDuZwPl8oLsIh2OrunQ8eTmpcSutnjY=
X-Received: by 2002:a62:53c6:0:b0:58d:a84a:190b with SMTP id
 h189-20020a6253c6000000b0058da84a190bmr3321358pfb.48.1676035733441; Fri, 10
 Feb 2023 05:28:53 -0800 (PST)
MIME-Version: 1.0
References: <20230124000027.3565716-1-richard.henderson@linaro.org>
 <20230124000027.3565716-18-richard.henderson@linaro.org>
In-Reply-To: <20230124000027.3565716-18-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 10 Feb 2023 13:28:42 +0000
Message-ID: <CAFEAcA9-ufibbm_Fp0spGK+iQKLgGcJfED=+c__q37mQFwAWxw@mail.gmail.com>
Subject: Re: [PATCH 17/22] target/arm: Use get_phys_addr_with_struct for stage2
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, yier.jin@huawei.com, 
 jonathan.cameron@huawei.com, leonardo.garcia@linaro.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=peter.maydell@linaro.org; helo=mail-pf1-x430.google.com
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
> This fixes a bug in which we failed to initialize
> the result attributes properly after the memset.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/ptw.c | 13 +------------
>  1 file changed, 1 insertion(+), 12 deletions(-)
>
> diff --git a/target/arm/ptw.c b/target/arm/ptw.c
> index eaa47f6b62..3205339957 100644
> --- a/target/arm/ptw.c
> +++ b/target/arm/ptw.c
> @@ -32,12 +32,6 @@ typedef struct S1Translate {
>      void *out_host;
>  } S1Translate;
>
> -static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
> -                               uint64_t address,
> -                               MMUAccessType access_type,
> -                               GetPhysAddrResult *result, ARMMMUFaultInfo *fi)
> -    __attribute__((nonnull));

The definition of the function doesn't have the __attribute__,
so if we drop this forward declaration we need to move the attribute.

> -
>  static bool get_phys_addr_with_struct(CPUARMState *env, S1Translate *ptw,
>                                        target_ulong address,
>                                        MMUAccessType access_type,
> @@ -2854,12 +2848,7 @@ static bool get_phys_addr_twostage(CPUARMState *env, S1Translate *ptw,
>      cacheattrs1 = result->cacheattrs;
>      memset(result, 0, sizeof(*result));
>
> -    if (arm_feature(env, ARM_FEATURE_PMSA)) {
> -        ret = get_phys_addr_pmsav8(env, ipa, access_type,
> -                                   ptw->in_mmu_idx, s2walk_secure, result, fi);
> -    } else {
> -        ret = get_phys_addr_lpae(env, ptw, ipa, access_type, result, fi);
> -    }
> +    ret = get_phys_addr_with_struct(env, ptw, ipa, access_type, result, fi);
>      fi->s2addr = ipa;
>
>      /* Combine the S1 and S2 perms.  */

Does this do the right thing for PMSAv8 ? The code in get_phys_addr_twostage
sets up various things in ptw based on s2walk_secure, which (per previous
patch) is not really well defined for PMSA.

thanks
-- PMM

