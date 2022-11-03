Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C485D617DD7
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Nov 2022 14:25:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqaCh-00017G-N8; Thu, 03 Nov 2022 09:24:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oqaCb-00014s-CX
 for qemu-devel@nongnu.org; Thu, 03 Nov 2022 09:24:15 -0400
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oqaCW-0007sA-BW
 for qemu-devel@nongnu.org; Thu, 03 Nov 2022 09:24:11 -0400
Received: by mail-pf1-x429.google.com with SMTP id g62so1564999pfb.10
 for <qemu-devel@nongnu.org>; Thu, 03 Nov 2022 06:24:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=dUcG8eu+T5Tt5XdWgqz+j2jbBEUf/7Mklz9kPc5OdLo=;
 b=RGpCTaBzvpkYFXhvgoJ1gc7Q1XsaTDqD59XgctYGpoejDpbxMbmJC7TQouCeCyBlI4
 RdFW66Enayqbg7POGPKteOtUv+Xe6npgccfLszruE8PHIALPHoaq/HVm77X7oJ2RnWpJ
 UqXHaz1I0UrTEMGd+x529JmmMD4EgA6E07s6OoVMWW0bA2njJ94FJepKCDeJC4vEwtiY
 otds3fU4iR5yzesLvPZKN1803wpwH3P4jt4TgR0ez71qhXVMw0YOX5fLzymj9tWicgmu
 SrUZXdPbJSgGFf1/LfvgSYZepZusZ6nLfRZnY7i0XWw+d/WN7+kkdSv+3AwvyZCehx9b
 +VPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=dUcG8eu+T5Tt5XdWgqz+j2jbBEUf/7Mklz9kPc5OdLo=;
 b=p9ovU2U2jPCkgS1kxFa/itoUBNurq3kwmvUDpyf9FuAO0sI4qzviq+w8D7vX0L5GE+
 yVW7hYVZClRurbQJQnZJbUCMigBTT3zs42Y4qtJXRPB6GWd7lSE0wuvtLvnsMcyz11cu
 tH1HvuHXUReynNXO/OtwgBxspVsHx1/ryxv5yjlnBDsZlBW7KBIg/Gml/9UZ4gA3dTtL
 kp7oxnRJ5LsEhurEZoqSGVxDrBODWPc3KBBJtKzQ1R5EHfTrhfpaielb5Ck8oEFiSyJ8
 0LzN3PrltChSjv3W7Io7e2E1QEQ++Nt7uX2WTTp5XYeCepzv7GUxu954YuRacdEfd3ye
 SipQ==
X-Gm-Message-State: ACrzQf2O5pGp97KKIwWFkuUcLSmUaAdjq+ABvrHCVGvg/VsXHw+AQeIW
 FjuS8VWVKCyAAvuPS8bPQu4PDXFc/dOOhCvXBnqXvg==
X-Google-Smtp-Source: AMsMyM4idyWCrwPSMcGGJsIAcWPZuAKo2KizW6H6aPw+cNvq1nLQbJNCpM6814C22yC4MFWdGU4DaPqo7ozRb/EUHvk=
X-Received: by 2002:a05:6a00:1595:b0:56d:e04d:e0ab with SMTP id
 u21-20020a056a00159500b0056de04de0abmr11944380pfk.51.1667481846147; Thu, 03
 Nov 2022 06:24:06 -0700 (PDT)
MIME-Version: 1.0
References: <20221102054706.1015830-1-richard.henderson@linaro.org>
 <CAFEAcA_meGSRv=Fa1D-F=a3VF=TnHHORGAZoi5aPOkVAbGPm4w@mail.gmail.com>
In-Reply-To: <CAFEAcA_meGSRv=Fa1D-F=a3VF=TnHHORGAZoi5aPOkVAbGPm4w@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 3 Nov 2022 13:23:55 +0000
Message-ID: <CAFEAcA_dfNpVKWorvprdywGEaquDDVfdRf2-RJHrAm0aKYKeBA@mail.gmail.com>
Subject: Re: [PATCH] target/arm: Two fixes for secure ptw
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, philmd@linaro.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=peter.maydell@linaro.org; helo=mail-pf1-x429.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Thu, 3 Nov 2022 at 13:19, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Wed, 2 Nov 2022 at 05:47, Richard Henderson
> <richard.henderson@linaro.org> wrote:
> >
> > Reversed the sense of non-secure in get_phys_addr_lpae,
> > and failed to initialize attrs.secure for ARMMMUIdx_Phys_S.
> >
> > Fixes: 48da29e4 ("target/arm: Add ptw_idx to S1Translate")
> > Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1293
> > Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> > ---
> >  target/arm/ptw.c | 15 ++++++++-------
> >  1 file changed, 8 insertions(+), 7 deletions(-)
> >
> > diff --git a/target/arm/ptw.c b/target/arm/ptw.c
> > index 58a7bbda50..df3573f150 100644
> > --- a/target/arm/ptw.c
> > +++ b/target/arm/ptw.c
> > @@ -1357,7 +1357,7 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
> >      descaddr |= (address >> (stride * (4 - level))) & indexmask;
> >      descaddr &= ~7ULL;
> >      nstable = extract32(tableattrs, 4, 1);
> > -    if (!nstable) {
> > +    if (nstable) {
> >          /*
> >           * Stage2_S -> Stage2 or Phys_S -> Phys_NS
> >           * Assert that the non-secure idx are even, and relative order.
> > @@ -2671,6 +2671,13 @@ static bool get_phys_addr_with_struct(CPUARMState *env, S1Translate *ptw,
> >      bool is_secure = ptw->in_secure;
> >      ARMMMUIdx s1_mmu_idx;
> >
> > +    /*
> > +     * The page table entries may downgrade secure to non-secure, but
> > +     * cannot upgrade an non-secure translation regime's attributes
> > +     * to secure.
> > +     */
> > +    result->f.attrs.secure = is_secure;
> > +
> >      switch (mmu_idx) {
> >      case ARMMMUIdx_Phys_S:
> >      case ARMMMUIdx_Phys_NS:
> > @@ -2712,12 +2719,6 @@ static bool get_phys_addr_with_struct(CPUARMState *env, S1Translate *ptw,
> >          break;
> >      }
> >
> > -    /*
> > -     * The page table entries may downgrade secure to non-secure, but
> > -     * cannot upgrade an non-secure translation regime's attributes
> > -     * to secure.
> > -     */
> > -    result->f.attrs.secure = is_secure;
> >      result->f.attrs.user = regime_is_user(env, mmu_idx);
>
> Do we also need to move this setting of attrs.user ?
> get_phys_addr_disabled() doesn't set that either.

I've applied this to target-arm.next for the moment anyway, since
it is definitely fixing an attrs.secure related bug. I can replace
that with a v2 or we can do a follow-on patch, depending whether
you get to this before or after I send out a pullreq.

thanks
-- PMM

