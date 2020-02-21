Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CDAA916828F
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Feb 2020 17:03:34 +0100 (CET)
Received: from localhost ([::1]:60346 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j5Am5-0002EJ-Te
	for lists+qemu-devel@lfdr.de; Fri, 21 Feb 2020 11:03:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43058)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1j5Akh-0001M4-7K
 for qemu-devel@nongnu.org; Fri, 21 Feb 2020 11:02:08 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1j5Akg-0003Lf-2d
 for qemu-devel@nongnu.org; Fri, 21 Feb 2020 11:02:07 -0500
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:38250)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1j5Akf-0003Iw-Sj
 for qemu-devel@nongnu.org; Fri, 21 Feb 2020 11:02:06 -0500
Received: by mail-ot1-x343.google.com with SMTP id z9so2430607oth.5
 for <qemu-devel@nongnu.org>; Fri, 21 Feb 2020 08:02:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=J28/tOlP+7rH2BnL/Yy1GCxAJTdCqqCEvoipiLxfW4M=;
 b=GEF31Fjae6YRCa3A4xniGwvUpw7+C7h8r0sK4ZG9t+OLdQbw1XqmbgH4j7JKayXr2/
 bxXFL3fhwJKs7BYsdpjugU68Tpjn83pJgd8qL9UkRRmBYVavVk+1R5TknCiVcTMntJHZ
 6HuLP+Wei6DqCqrGApIxfTJW9lRijhGMIRnL5DAsuihH4Gv6mE96dKZVGDDOHthmhs2D
 oC4eFsERR2qBUw6Lj6X5e8BZHxMATLgSAuwWXbv8IKB41Z1v4ip5yL0o5TEWOpZgzAht
 6AHOOs0J+PVqEKKVvZerTnNRJdhMNXAAS7ARqAN+JxhwraFawXPp/96zFOvEBLRLcnGN
 wEtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=J28/tOlP+7rH2BnL/Yy1GCxAJTdCqqCEvoipiLxfW4M=;
 b=lnGtj7Vj0lRNTVzEyrEGuH/zvZ9wgXpeJSivdJM5gHey+OwvqPL8fVD7+6MsqYt04a
 hoZzo3oYLyU8aHjpd/mWVWaURr09D41J0UfsrTPm2obASCopdiAGTbf742D1Fpbczhic
 nN6qpWMYmA+ZosaP/BIqRqWDuOu7SwEyOoWG9+myY36cTq+mwE8xbPv9Yl8c1BmxBV9g
 gb2KJDg2ZGKYWcY29z0UbysoHg/m4SVZy4Fsza1AmCIw4Yb0g3+aa858lm3fcT11axYp
 DrGbDnHg6ZBLgKJLTm1HI0ce08nIW0/Ic5LYKw0e3iHLBR4kqmuawTYjTwPRQyXEBcop
 jEOQ==
X-Gm-Message-State: APjAAAXJGdqC4nq8yHcNd5yFsFTCDYcKIZo6P2Q8fPb5AUg72xStkcjZ
 aoz7dhw1fc16rF3NG3nJH93Uj9NbAW/2Rw/YYmX7RF8S
X-Google-Smtp-Source: APXvYqwv4a0aFCvdorgeD/etjyRcRqMgv2Xk/2eYUt3yCX0LUynjPQ7Wt83wx3K2Zk8Rv1RbzLZ2WiZCod5IZqE40Hg=
X-Received: by 2002:a05:6830:13da:: with SMTP id
 e26mr26909759otq.97.1582300924886; 
 Fri, 21 Feb 2020 08:02:04 -0800 (PST)
MIME-Version: 1.0
References: <20200214181547.21408-1-richard.henderson@linaro.org>
 <20200214181547.21408-6-richard.henderson@linaro.org>
In-Reply-To: <20200214181547.21408-6-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 21 Feb 2020 16:01:53 +0000
Message-ID: <CAFEAcA_wiS0U7YiiUQ3cNe0ctTNK4uXOOteryDBWxiCoTuXR_g@mail.gmail.com>
Subject: Re: [PATCH 05/19] target/arm: Add isar_feature_aa32_simd_r16
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::343
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 14 Feb 2020 at 18:15, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Use this in the places that were checking ARM_FEATURE_VFP, and
> are obviously testing for the existance of the register set
> as opposed to testing for some particular instruction extension.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>


Some of these are OK, but some of them are wrong because they
are in shared aarch64/aarch32 codepaths, and an aarch64-only
CPU will return false to the _aa32_ isar_feature test.

In particular, 'make check' on an aarch64 KVM system will
currently error with "AArch64 CPUs must have both VFP and Neon or
neither" because we falsely decide it doesn't have VFP.
(We also somewhat dubiously enforce an ID-register consistency
check on a KVM CPU, but it wouldn't fail the check if we
were testing the right ID registers.)




> @@ -1260,7 +1260,7 @@ void arm_cpu_post_init(Object *obj)
>       * KVM does not currently allow us to lie to the guest about its
>       * ID/feature registers, so the guest always sees what the host has.
>       */
> -    if (arm_feature(&cpu->env, ARM_FEATURE_VFP)) {
> +    if (cpu_isar_feature(aa32_simd_r16, cpu)) {
>          cpu->has_vfp = true;
>          if (!kvm_enabled()) {
>              qdev_property_add_static(DEVICE(obj), &arm_cpu_has_vfp_property);

This needs to be an 'any' test.


> diff --git a/target/arm/machine.c b/target/arm/machine.c
> index 241890ac8c..7050bde459 100644
> --- a/target/arm/machine.c
> +++ b/target/arm/machine.c
> @@ -9,9 +9,8 @@
>  static bool vfp_needed(void *opaque)
>  {
>      ARMCPU *cpu = opaque;
> -    CPUARMState *env = &cpu->env;
>
> -    return arm_feature(env, ARM_FEATURE_VFP);
> +    return cpu_isar_feature(aa32_simd_r16, cpu);
>  }

So does this.

thanks
-- PMM

