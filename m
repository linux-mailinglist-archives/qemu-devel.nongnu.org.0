Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FA7760CDDF
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Oct 2022 15:49:28 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onKG8-0004TB-Ig; Tue, 25 Oct 2022 09:46:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1onKFY-0003zg-0T
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 09:46:02 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1onKFV-00062a-7P
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 09:45:47 -0400
Received: by mail-pj1-x1035.google.com with SMTP id
 l22-20020a17090a3f1600b00212fbbcfb78so6790844pjc.3
 for <qemu-devel@nongnu.org>; Tue, 25 Oct 2022 06:45:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=+XP+l153SIayqg2yhp4Ib1WZkuwawgCykV+1+7UQgVQ=;
 b=gEfsO0ZDoD+3u1q7QiQ+N2TicmXIFHdqrNtGV2czUjhoQu2gDLmDF6qQCFpgy+Wzh1
 Jt2lXWmcykdbc1oWuL/ynEEmMXSO2HHnA5g8hwQdCW+LqCyZ5WkOiBwwaV7+fbEllMDV
 Xz37ED0TWqVPhxeZaxF+gRQR1Nq32JZVJh4XFeXqtBCPN9Az+WcVL/KQ9BbmYTxsTQtX
 FMPhXOvHe0pCIGMTIlAzFkXZS0OB5ked/nKgiXfp7X2lD1E8XSVhZ5e9qXz5Gz6HC9fe
 Ow0ea0cfseXAfhQDs5WRhDrvx/BReb9y/lVy6UbZE0KRcEnGxRvapQ13/OdrwIGEN8pX
 Vw3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+XP+l153SIayqg2yhp4Ib1WZkuwawgCykV+1+7UQgVQ=;
 b=E30fOOg2JN/xn3cD2g3qzfUJv2Y81B9CLeAIqqk70oMJ6qyAGdqbP7B/TogRLUplMK
 6f6KpGeLAI57e1XYkUrjgdVW+FNhPWAapWaHLr3M0zdDBNYfBCUH6R/OB4BP+RyWk+XF
 /OGP6MoTQciEiXEmVjmtYQPj1I7utD4nhVCQrcdgqbx+h2UaABsMAtqtqPzEvYYYQTBj
 roYOZ7LUrgWnKIl4Vf0mSTRJwcdWWFSW6T3xEdHXTn64QUkzhoqVl0TwUHrAwnQeT7kP
 9Gw9bOsPZiPfgw0SVkBgWfmRFzpoMgSXU1lxsvValbapWX9iQ0jdtu7P+5rPnVI4Mbg8
 w9zw==
X-Gm-Message-State: ACrzQf2IDyljstUOwsPnIOw0/QuBo3P2NUmqz7npTeeLES2PgjFoDJea
 iWaZEyvqJiJE9bYtiPnDEfxe0mKJJvKbokpoDyTVbg==
X-Google-Smtp-Source: AMsMyM7dZICj2Sa97rkif4JR1rcSE8ZJ4hVbwy9z6Z90u4atswovquSKa1GfrTgmtFTgyoJMD7E0d3ZfPojVmZC83w4=
X-Received: by 2002:a17:90b:1d04:b0:20b:cb40:4b3 with SMTP id
 on4-20020a17090b1d0400b0020bcb4004b3mr43906224pjb.215.1666705543414; Tue, 25
 Oct 2022 06:45:43 -0700 (PDT)
MIME-Version: 1.0
References: <20221019121537.255477-1-tkutergin@gmail.com>
In-Reply-To: <20221019121537.255477-1-tkutergin@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 25 Oct 2022 14:45:31 +0100
Message-ID: <CAFEAcA-6ZyWbRvy9VOFJd0RR1h3bk9GNNzH4Uh0pznzT6RkOnA@mail.gmail.com>
Subject: Re: [PATCH] target/arm: Fixed Privileged Access Never (PAN) for
 aarch32
To: Timofey Kutergin <tkutergin@gmail.com>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x1035.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Wed, 19 Oct 2022 at 13:15, Timofey Kutergin <tkutergin@gmail.com> wrote:
>
> - synchronize PSTATE.PAN with changes in CPSR.PAN in aarch32 mode
> - set PAN bit automatically on exception entry if SCTLR_SPAN bit
>   is set
> - throw permission fault during address translation when PAN is
>   enabled and kernel tries to access user acessible page
> - ignore SCTLR_XP bit for armv7 and armv8 (conflicts with SCTLR_SPAN).
>
> Signed-off-by: Timofey Kutergin <tkutergin@gmail.com>
> ---
>  target/arm/helper.c |  6 ++++++
>  target/arm/ptw.c    | 11 ++++++++++-
>  2 files changed, 16 insertions(+), 1 deletion(-)

Thanks for this patch. I think you've caught all the places
we aren't correctly implementing AArch32 PAN handling.

> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index dde64a487a..5299f67e3f 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -9052,6 +9052,11 @@ void cpsr_write(CPUARMState *env, uint32_t val, uint32_t mask,
>      }
>      mask &= ~CACHED_CPSR_BITS;
>      env->uncached_cpsr = (env->uncached_cpsr & ~mask) | (val & mask);
> +    if (env->uncached_cpsr & CPSR_PAN) {
> +        env->pstate |= PSTATE_PAN;
> +    } else {
> +        env->pstate &= ~PSTATE_PAN;
> +    }

This approach means we're storing the PAN bit in two places,
both in env->uncached_cpsr and in env->pstate. We don't do
this for any other bits as far as I can see. I think we should
either:
 (1) have the code that changes behaviour based on PAN look
     at either env->pstate or env->uncached_cpsr depending
     on whether we're AArch64 or AArch32
 (2) always store the state in env->pstate only, and handle
     this in read/write of the CPSR the same way we do with
     other "cached" bits

I think the intention of the current code is (1), and the
only place we get this wrong is in arm_mmu_idx_el(),
which is checking env->pstate only. (The other places that
directly check env->pstate are all in AArch64-only code,
and various AArch32-only bits of code already check
env->uncached_cpsr.) A function like

bool arm_pan_enabled(CPUARMState *env)
{
    if (is_a64(env)) {
        return env->pstate & PSTATE_PAN;
    } else {
        return env->uncached_cpsr & CPSR_PAN;
    }
}

and then using that in arm_mmu_idx_el() should I think
mean you don't need to change either cpsr_write() or
take_aarch32_exception().

>      if (rebuild_hflags) {
>          arm_rebuild_hflags(env);
>      }
> @@ -9592,6 +9597,7 @@ static void take_aarch32_exception(CPUARMState *env, int new_mode,
>                  /* ... the target is EL1 and SCTLR.SPAN is 0.  */
>                  if (!(env->cp15.sctlr_el[new_el] & SCTLR_SPAN)) {
>                      env->uncached_cpsr |= CPSR_PAN;
> +                    env->pstate |= PSTATE_PAN;
>                  }
>                  break;
>              }
> diff --git a/target/arm/ptw.c b/target/arm/ptw.c
> index 23f16f4ff7..204a73350f 100644
> --- a/target/arm/ptw.c
> +++ b/target/arm/ptw.c
> @@ -659,6 +659,13 @@ static bool get_phys_addr_v6(CPUARMState *env, uint32_t address,
>              goto do_fault;
>          }
>
> +        if (regime_is_pan(env, mmu_idx) && !regime_is_user(env, mmu_idx) &&
> +            simple_ap_to_rw_prot_is_user(ap >> 1, 1) &&
> +            access_type != MMU_INST_FETCH) {
> +            fi->type = ARMFault_Permission;
> +            goto do_fault;
> +        }

This assumes we're using the SCTLR.AFE==1 simplified
permissions model, but PAN should apply even if we're using the
old model. So we need a ap_to_rw_prot_is_user() to check the
permissions in that model.

The check is also being done before the Access fault check, but
the architecture says that Access faults take priority over
Permission faults.

> +
>          if (arm_feature(env, ARM_FEATURE_V6K) &&
>                  (regime_sctlr(env, mmu_idx) & SCTLR_AFE)) {
>              /* The simplified model uses AP[0] as an access control bit.  */
> @@ -2506,7 +2513,9 @@ bool get_phys_addr_with_secure(CPUARMState *env, target_ulong address,
>      if (regime_using_lpae_format(env, mmu_idx)) {
>          return get_phys_addr_lpae(env, address, access_type, mmu_idx,
>                                    is_secure, false, result, fi);
> -    } else if (regime_sctlr(env, mmu_idx) & SCTLR_XP) {
> +    } else if (arm_feature(env, ARM_FEATURE_V7) ||
> +               arm_feature(env, ARM_FEATURE_V8) || (

V8 always implies V7, so we only need to check V7 here.

> +               regime_sctlr(env, mmu_idx) & SCTLR_XP)) {
>          return get_phys_addr_v6(env, address, access_type, mmu_idx,
>                                  is_secure, result, fi);
>      } else {

thanks
-- PMM

