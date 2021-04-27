Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E8E336C5DC
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Apr 2021 14:12:41 +0200 (CEST)
Received: from localhost ([::1]:52948 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbMZz-00072K-NK
	for lists+qemu-devel@lfdr.de; Tue, 27 Apr 2021 08:12:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33200)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lbMTV-00052j-6I
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 08:05:57 -0400
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a]:45674)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lbMTT-0004o6-Ax
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 08:05:56 -0400
Received: by mail-ej1-x62a.google.com with SMTP id u3so10456657eja.12
 for <qemu-devel@nongnu.org>; Tue, 27 Apr 2021 05:05:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=T/Ah/2JvbBuYvoheSUmxbqbrJ6PWC/FbJSlGeZThUQU=;
 b=saVgiQZl8bwcb6kK9dqn/iRtzg/KZaVVQYiz6OG1IjXwtMRMfP/N+B1Z3nnDDOvhGW
 SSYVzaT7LgbBuhnPEWEHc5DpYMoTL2GJdcYGEo+NJED2q3jXr5zKfYL2jV7AFqDLLf0R
 0gn7f4hVlGD6u22WbPAkdkpjqG1zpsO43skKdqbZjQORu0GPabFbO3HEUVl7/uxWjUva
 Mk1Pecsl4Mbr+bF2l67eHnLXUz2L5bOeWtuW4PZHRdRYn7Lkb/5eMoerKfG+EdfehJfX
 3jqip0XsvcAKnplhBNOxn2yS3iuhflyItdVrFzj2Ycv2J9LMAeVg/r8Z1d6U0akg/cMi
 G4bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=T/Ah/2JvbBuYvoheSUmxbqbrJ6PWC/FbJSlGeZThUQU=;
 b=MatSg3nOeYZZKNACZKuSrXG9Sf3BfJU1aiJJG8XLSCTm6EcdTEiVJATtrYgowJE1fj
 03QcRaFlmEWiK6te5epNWrzyHA/wSdSDU7fQrR2E6qaMSPUa6TgyVHfoeylZ4dGxCDGT
 ki+KuKL9pAAHm2jqKu0srN+0/iEs+00T5NY9HbtuDU2sV/wh5VXByOK2Kwl8bE1P5mQO
 e85yv0xqu+kF6v5hDtpqyhGClDyAVAOH76aElXZUt/b53S7GOtqEIGJzkgpMdn/YgWuF
 LYovX1A/lKpG7+Va5vE69qqwj3pS6d6XR9hOP7pzHCRyFYLCsWbAh3Gb9lr2juG5l2uF
 mhRA==
X-Gm-Message-State: AOAM533i4yTV6yjtowcO+eg0laFFQUX9tHJtDuIkTyb1h8LJx4Xt8fdb
 mRtSvfkHC0l8ES95oQ/5hRNYWSa87+SsEwSMG+uAtA==
X-Google-Smtp-Source: ABdhPJyrKPI064K3GjiDDzrp0g5dIgG14Ar8rrJsJi147DTlYm49b0ryWb2xb6TMbJXR1exc0Cotw5uXaEN4EJ/KJg4=
X-Received: by 2002:a17:906:1dd3:: with SMTP id
 v19mr22665861ejh.4.1619525153741; 
 Tue, 27 Apr 2021 05:05:53 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1617281290.git.haibo.xu@linaro.org>
 <37df1b1872f15086dd1d066e53dc1eedaf114051.1617281290.git.haibo.xu@linaro.org>
 <20210427092423.q3ktw4kkd5xhapad@gator.home>
 <CAFEAcA9+VpFp70rwZ5rWEQX9TxPH558jCiSU6Z=qPnUfieSukA@mail.gmail.com>
 <20210427094924.pgivurjrgtzovcwa@gator.home>
In-Reply-To: <20210427094924.pgivurjrgtzovcwa@gator.home>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 27 Apr 2021 13:04:54 +0100
Message-ID: <CAFEAcA8kH0RsS993kwbsH9+ziCbxT5151LFGnnDkcy10EODEaQ@mail.gmail.com>
Subject: Re: [PATCH RESEND v2 5/6] target/arm/cpu: Enable 'el2' to work with
 host/max cpu
To: Andrew Jones <drjones@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Andrea Bolognani <abologna@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
 Haibo Xu <haibo.xu@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 27 Apr 2021 at 10:49, Andrew Jones <drjones@redhat.com> wrote:
>
> On Tue, Apr 27, 2021 at 10:38:00AM +0100, Peter Maydell wrote:
> > For new features added we want to use ID register bits. However,
> > a lot of older pre-existing features are keyed off ARM_FEATURE_FOO
> > flag bits. Trying to convert an ARM_FEATURE flag to use ID registers
> > isn't necessarily 100% trivial (for instance, the ARM_FEATURE flag
> > is always checkable regardless of AArch64 vs AArch32, but the ID
> > register checks often need to be split up into separate ones checking
> > the AArch32 or the AArch64 ID register value). So we aren't really
> > doing conversion of existing flags. (I did a few which were easy
> > because there were only a handful of checks of them.) As a side note,
> > some features really can't be checked in ID registers, like
> > ARM_FEATURE_V8_1M, so env->features is not going to go away completely.
> >
> > The only use of cpu->has_foo should be for the QOM property -- the
> > arm_cpu_realizefn() should look at it and then either clear the
> > ARM_FEATURE flag or update the ID register bits depending on
> > which one the feature is using.
> >
> > vms->virt is for the board code (and controls more things than
> > just whether the CPU itself has EL2).
> >
>
> Thanks for the summary, Peter. For this series, do you recommend
> attempting to convert from ARM_FEATURE_EL2 to feature bits first? Or keep
> the ARM_FEATURE flag?

I think we should stick with the ARM_FEATURE flag -- there are
enough uses of it that a conversion would be complicated and
I don't think we should tie this feature work up with that.

> Also, while I agree we can't use vms->virt for the
> same purposes as the CPU feature (however that's tracked), do you agree
> vms->virt should be true when the CPU feature is enabled?

It's the other way around -- setting vms->virt should cause the
board code to set the CPU feature. (Conceptually, the board
owns the CPU so it gets to decide what its configuration should
be. The CPU doesn't get to reach out and mess with the board config.)

thanks
-- PMM

