Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 05B463BC1B0
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Jul 2021 18:30:18 +0200 (CEST)
Received: from localhost ([::1]:35832 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0RU9-00073U-0s
	for lists+qemu-devel@lfdr.de; Mon, 05 Jul 2021 12:30:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44486)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m0RQD-0003JF-Gb
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 12:26:13 -0400
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f]:45932)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m0RQB-0001nr-FH
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 12:26:13 -0400
Received: by mail-ej1-x62f.google.com with SMTP id hc16so29703324ejc.12
 for <qemu-devel@nongnu.org>; Mon, 05 Jul 2021 09:26:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xKqu47CKqwIqE8rX8QIYIgYDfyVbGFuzR4kKF3m9FwI=;
 b=zJEn7itCGpChb72P8X6JkXIVP4EsYGH/ZouM1MxioeyuHAnpS4HpEGBqULM+BJ4SL4
 fVqaIhZOQgeve/5/j22KKrIBhaRRBaLK92MGe/8KQTWE5dVGI+KkuzwgkiS9ID0/jr5z
 eKnDslf7FjmXzEHhgSKkZvEJxt4mbgOWDtJl7SrxXkSsuEdmsFhtIGjPp8XLr8fotk+4
 ZvWpebbyPmwbQoH5zlNq9ah3JoD3GKMnWl12s0Py9nFMnqb0tfWGjIwy9KPymKpAR4Md
 SbtENMjPgBi/0rcZIgnMVh1s0C5n+WjfD2BmlwC5QMEYZ2xQIFvmXCfmMvEHRq00GEAz
 NV0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xKqu47CKqwIqE8rX8QIYIgYDfyVbGFuzR4kKF3m9FwI=;
 b=hRuEdHnPwy07yCr1hKwh57joHW/JxPZJCqkuvzkTZjghLbwlYlbjahijEI4b8j2mEq
 spnD/bHMf9z6nbJZDlAppHI3rZSfqKTrJ6NRgpsMyY4Gr+P9ifdfAf6w56Omk/oBnznf
 E7C0i0hwm9Xd6dqGH3OJdXV7JAJtwn1e/mbV0FhrO/FdDSR99edxNt+rEPp8JWW9RJee
 0vAqnTO+bbadANdH/8x7Yo69WgKKJ1+DQfH14W0xeWTRh+7tqiNXKiLEdchDppSH3JnW
 dsuV2QMsCbxWiLHIevgcQAQiG/+aAhE9+bFt8YR0OCddWv2amsFirN+IpsBSqFi94Kv2
 HwMg==
X-Gm-Message-State: AOAM5336gf0qDhlBANA0VE8DGPVOOk3X6GKkITMBeWUMkyCYbXy4Y4zU
 5ToITe9WWH1hPJthc4b+4yTp7jyJ4jKFV4pA1XPclQ==
X-Google-Smtp-Source: ABdhPJw/xzZHGxiro51BdFCU3SJoz08pXPcAnwArsYqtB1UEEjYppR3R1/KSJRDRXJRJYIZzIFqjPlrxiUVyERwkAVM=
X-Received: by 2002:a17:907:7d91:: with SMTP id
 oz17mr14452591ejc.250.1625502369699; 
 Mon, 05 Jul 2021 09:26:09 -0700 (PDT)
MIME-Version: 1.0
References: <20210630153156.9421-1-shashi.mallela@linaro.org>
 <20210630153156.9421-2-shashi.mallela@linaro.org>
 <CAFEAcA_u=3f6sborqD9opCQv1kJHQm0+Gm1ytWx2zSzjXJTd1A@mail.gmail.com>
 <a0dca113df5b0470668095ed1f759fd7a6f102f7.camel@linaro.org>
In-Reply-To: <a0dca113df5b0470668095ed1f759fd7a6f102f7.camel@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 5 Jul 2021 17:25:31 +0100
Message-ID: <CAFEAcA_vuHRWRjg-aQ4yk4UT6h_9bPdTT4wJS5SMLyPdADZVaw@mail.gmail.com>
Subject: Re: [PATCH v5 01/10] hw/intc: GICv3 ITS initial framework
To: Shashi Mallela <shashi.mallela@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62f.google.com
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 Radoslaw Biernacki <rad@semihalf.com>, QEMU Developers <qemu-devel@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>, Igor Mammedov <imammedo@redhat.com>,
 Leif Lindholm <leif@nuviainc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 5 Jul 2021 at 16:55, <shashi.mallela@linaro.org> wrote:
>
> On Mon, 2021-07-05 at 15:58 +0100, Peter Maydell wrote:
> > On Wed, 30 Jun 2021 at 16:32, Shashi Mallela <
> > shashi.mallela@linaro.org> wrote:
> > > Added register definitions relevant to ITS,implemented overall
> > > ITS device framework with stubs for ITS control and translater
> > > regions read/write,extended ITS common to handle mmio init between
> > > existing kvm device and newer qemu device.
> > >
> > > Signed-off-by: Shashi Mallela <shashi.mallela@linaro.org>
> > > Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> > > +static void gicv3_arm_its_realize(DeviceState *dev, Error **errp)
> > > +{
> > > +    GICv3ITSState *s = ARM_GICV3_ITS_COMMON(dev);
> > > +
> > > +    gicv3_its_init_mmio(s, &gicv3_its_control_ops,
> > > &gicv3_its_translation_ops);
> > > +
> > > +    if (s->gicv3->cpu->gicr_typer & GICR_TYPER_PLPIS) {
> >
> > Can you remind me why we make this check, please? When would we
> > have created an ITS device but not have a GICv3 with LPI support?
> This check applies to GIC's physical LPI support only as against GIC's
> virtual LPI support.

Right, but when would we have a GIC with no physical LPI support
but an ITS is present ?

thanks
-- PMM

