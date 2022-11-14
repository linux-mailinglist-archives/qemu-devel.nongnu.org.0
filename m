Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C8321628EA9
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Nov 2022 01:48:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ouijj-000471-0l; Mon, 14 Nov 2022 18:19:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ouied-0001zn-Qr
 for qemu-devel@nongnu.org; Mon, 14 Nov 2022 18:14:15 -0500
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oud7I-0006lr-Cf
 for qemu-devel@nongnu.org; Mon, 14 Nov 2022 12:19:30 -0500
Received: by mail-pl1-x631.google.com with SMTP id 4so10689465pli.0
 for <qemu-devel@nongnu.org>; Mon, 14 Nov 2022 09:19:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sDtdL3XTK6IYBo7Wcx11EcbonlHYFN1Se95Qeah8Ldg=;
 b=NQ7BxiIvS018G2r77AKWk1AnMWLVjKDafy+w6gzskvgYivGcM8oV0z4ZC7lGBYtaMl
 ZAy758r7bwOxymgM+F11fPbJ/PxsZHXNDidp/hDtBmfA6ZSBrhQO9vM1upMkszrGuyZy
 2exoXtkSOwPyUyr72aE8ohWyhLX7YV+rnvbU4XQT+R3BqR0QdlqP5QPq3WMmu4BbZgMb
 vdQd8WIzvDNoBr7ssFdrfB9h45gy82wX1ZOCbU4bFFFwJcDn0hvTT7i+3CQb8Cqd559/
 rsXc9w8CLlrHYi6PhBZfYuDeAX2TjAL0Hwx+JDyTFzAvcCpU/Az8Q7iE6oYdB2vSTuXx
 jNwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sDtdL3XTK6IYBo7Wcx11EcbonlHYFN1Se95Qeah8Ldg=;
 b=0SAe4MLuuGyAl4TOX4ePtlQyQwH9GDzamZJUlnY1ENyks4abPrkZFIKlFXLMmRruZr
 bgG6ka+mWChaD66GSHT5NYOLYfpGcPeLMaNPTO5gOKwa7bgRNe3foIliMkx3/LcMFJW8
 sjnbBKQafcl3Kj9vkv+vwCeB/zvZeg+BN+hZ2w0mm28K/XHYzpWGWSCEwt5A2hc7aImm
 FmzGAqhCF7O3w3vi9QlMI4Af9oPqz2xQs2SW+nlApOOcu1ada01/b5JnY+Ui8YAZXlio
 X8P1k+YJyIJhAXBOY53y6WpExL3wOhTys2YK9HATtPXNS1uhFy5aHic60cyikfGhycyh
 gYMA==
X-Gm-Message-State: ANoB5pm7h+RY7tiqPaEsZmsTjwju9r+58GQ+Cp6ylCEa5ejJfgQbk8zJ
 0ihuKQHH2h/jXzV+qKGxeMLJdUeD7k3gHqgFrRtWaA==
X-Google-Smtp-Source: AA0mqf5d5sd4+SGmPMe39/jT7CqYwy140S+JW/7E23jV1wp/u+a8b5qKNvp9MSFcnBMQCZ1tm7L+UXFCxqVYuodvwnw=
X-Received: by 2002:a17:902:b186:b0:185:4ec3:c708 with SMTP id
 s6-20020a170902b18600b001854ec3c708mr260457plr.60.1668446366785; Mon, 14 Nov
 2022 09:19:26 -0800 (PST)
MIME-Version: 1.0
References: <20221023153659.121138-1-tobias.roehmel@rwth-aachen.de>
 <20221023153659.121138-5-tobias.roehmel@rwth-aachen.de>
In-Reply-To: <20221023153659.121138-5-tobias.roehmel@rwth-aachen.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 14 Nov 2022 17:19:15 +0000
Message-ID: <CAFEAcA-kCEySTWUGXwqA=aw4E+TBjbUaewsLe5ExtXj0xja0Vg@mail.gmail.com>
Subject: Re: [PATCH v4 4/7] target/arm: Enable TTBCR_EAE for ARMv8-R AArch32
To: tobias.roehmel@rwth-aachen.de
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x631.google.com
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

On Sun, 23 Oct 2022 at 16:37, <tobias.roehmel@rwth-aachen.de> wrote:
>
> From: Tobias R=C3=B6hmel <tobias.roehmel@rwth-aachen.de>
>
> ARMv8-R AArch32 CPUs behave as if TTBCR.EAE is always 1 even
> tough they don't have the TTBCR register.
> See ARM Architecture Reference Manual Supplement - ARMv8, for the ARMv8-R
> AArch32 architecture profile Version:A.c section C1.2.
>
> Signed-off-by: Tobias R=C3=B6hmel <tobias.roehmel@rwth-aachen.de>
> ---
>  target/arm/debug_helper.c | 3 +++
>  target/arm/internals.h    | 4 ++++
>  target/arm/tlb_helper.c   | 3 +++
>  3 files changed, 10 insertions(+)
>
> diff --git a/target/arm/debug_helper.c b/target/arm/debug_helper.c
> index c21739242c..73665f988b 100644
> --- a/target/arm/debug_helper.c
> +++ b/target/arm/debug_helper.c
> @@ -437,6 +437,9 @@ static uint32_t arm_debug_exception_fsr(CPUARMState *=
env)
>
>      if (target_el =3D=3D 2 || arm_el_is_aa64(env, target_el)) {
>          using_lpae =3D true;
> +    } else if (arm_feature(env, ARM_FEATURE_PMSA)
> +            && arm_feature(env, ARM_FEATURE_V8)) {

Indentation looks wrong here. Generally the second line of a
multiline if (...) condition starts in the column after the '(',
so it lines up with the first part of the condition.

> +        using_lpae =3D true;
>      } else {
>          if (arm_feature(env, ARM_FEATURE_LPAE) &&
>              (env->cp15.tcr_el[target_el] & TTBCR_EAE)) {

For instance this is an example in the existing code.

We are inconsistent about whether we put operators like '&&' at
the end of the first line or beginning of the second line, so
pick whichever you like best, I guess.

> diff --git a/target/arm/internals.h b/target/arm/internals.h
> index 307a596505..e3699421b0 100644
> --- a/target/arm/internals.h
> +++ b/target/arm/internals.h
> @@ -253,6 +253,10 @@ unsigned int arm_pamax(ARMCPU *cpu);
>  static inline bool extended_addresses_enabled(CPUARMState *env)
>  {
>      uint64_t tcr =3D env->cp15.tcr_el[arm_is_secure(env) ? 3 : 1];
> +    if (arm_feature(env, ARM_FEATURE_PMSA)
> +     && arm_feature(env, ARM_FEATURE_V8)) {

Indentation is a bit odd here too.

> +        return true;
> +    }
>      return arm_el_is_aa64(env, 1) ||
>             (arm_feature(env, ARM_FEATURE_LPAE) && (tcr & TTBCR_EAE));
>  }
> diff --git a/target/arm/tlb_helper.c b/target/arm/tlb_helper.c
> index ad225b1cb2..a2047b0bc6 100644
> --- a/target/arm/tlb_helper.c
> +++ b/target/arm/tlb_helper.c
> @@ -18,6 +18,9 @@ bool regime_using_lpae_format(CPUARMState *env, ARMMMUI=
dx mmu_idx)
>      int el =3D regime_el(env, mmu_idx);
>      if (el =3D=3D 2 || arm_el_is_aa64(env, el)) {
>          return true;
> +    } else if (arm_feature(env, ARM_FEATURE_PMSA)
> +            && arm_feature(env, ARM_FEATURE_V8)) {
> +        return true;
>      }

Use an "if ()..." not an "else if" here to match the style
of the other check in this function.

>      if (arm_feature(env, ARM_FEATURE_LPAE)
>          && (regime_tcr(env, mmu_idx) & TTBCR_EAE)) {

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

