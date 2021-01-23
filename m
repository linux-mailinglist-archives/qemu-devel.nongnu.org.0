Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BFB313018B4
	for <lists+qemu-devel@lfdr.de>; Sat, 23 Jan 2021 23:35:14 +0100 (CET)
Received: from localhost ([::1]:45552 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l3RUv-0001Qx-Bb
	for lists+qemu-devel@lfdr.de; Sat, 23 Jan 2021 17:35:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56440)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l3RTD-0000tG-PM
 for qemu-devel@nongnu.org; Sat, 23 Jan 2021 17:33:27 -0500
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530]:43258)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l3RT9-0008Ng-KE
 for qemu-devel@nongnu.org; Sat, 23 Jan 2021 17:33:27 -0500
Received: by mail-ed1-x530.google.com with SMTP id n6so10806784edt.10
 for <qemu-devel@nongnu.org>; Sat, 23 Jan 2021 14:33:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=k6PQhW4EYLzIlCo6lg0umTAHut46nCuQ35nQrOa/c3c=;
 b=NDDkSPpSq7FA8zpaMRFKfvUg03qv41eJVBDiMErZn4hfkQtRL3G++FXZAy4drrM1Kz
 JY+00pbFoTwI2QpXOlyOlGgE3X5pjkLO2XAarw/BU4OwQYdKp0AGxLFdE1hPyMl90kzR
 Kt7YOQzIxuD9BkVxJsHt8jBuxMtysw3ae2J9x9SJDTix5iTehIyrMJeX0Au8NVj4wWwz
 hWkW5D0H3sGTLde2bGl6zDwdT0nIRf6+rkaKfYprZoEdVouwvbrG8is7nKvAKCgZr8Vr
 l+tSlfkEp14CloSnwmfWmKCgYu8tD0ygKQsJ3FCe1TFLvX5m2NpUXj8zK4MSJXYCOrO3
 3BOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=k6PQhW4EYLzIlCo6lg0umTAHut46nCuQ35nQrOa/c3c=;
 b=muOrPRLOc5wlXv126fj1mcjrgNRwL773RpS2132S8NQbWYU7Q3W2PC2FlxXFGZRUcU
 XmVFBLNG4uUeupD3McI05zDxolzYpCXqOb3MNN3igIgyY0M8Tbiqrm09wbPKjbZevi3t
 Cb3Z//L6WJKMainjCWH3wDROp87WRYCuxgBWXbCaPQa1Z4eEcc76TURyr3Q1a6XsbhiU
 ZbCH3AMR0ja7Q+0o5T4ywelHo77Jwjn4kcz8HNh8bOTmojdFJmCt/9AJ/kDqA3g28qUW
 Zre9iSupD3Ka4AO3azClt3Im41GvNWpKZV4mxni77V+/rG3oRVd28r4NhNJ7GT48aN6N
 WxIA==
X-Gm-Message-State: AOAM532lhRWiEEuKU/n2zwhxegtho7J0X1EXlNl8GehvBtJuZ8acYrED
 4ZNkbO+C0FSJv5LpHZJMQ1fYYtE0uR2Ti4mAv4jYCA==
X-Google-Smtp-Source: ABdhPJyY6aVpfz5XudC7MmStlEZE6aip65dythDerYNjUa1mMW+fXEOUGXsUcoM3DmDagHG0xP76JQbPS359MNx7kIM=
X-Received: by 2002:a05:6402:1383:: with SMTP id b3mr983edv.100.1611441201244; 
 Sat, 23 Jan 2021 14:33:21 -0800 (PST)
MIME-Version: 1.0
References: <20210121190622.22000-1-peter.maydell@linaro.org>
 <20210121190622.22000-23-peter.maydell@linaro.org>
 <20210123203115.5wz66nu5z3faj3no@sekoia-pc.home.lmichel.fr>
In-Reply-To: <20210123203115.5wz66nu5z3faj3no@sekoia-pc.home.lmichel.fr>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 23 Jan 2021 22:33:10 +0000
Message-ID: <CAFEAcA-jStKa6KGFjBAVA1QMF9158W9NheGwK_-RP7dAgpmrAQ@mail.gmail.com>
Subject: Re: [PATCH 22/25] hw/arm/armsse: Use Clock to set system_clock_scale
To: Luc Michel <luc@lmichel.fr>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x530.google.com
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
Cc: Damien Hedde <damien.hedde@greensocs.com>, qemu-arm <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, 23 Jan 2021 at 20:30, Luc Michel <luc@lmichel.fr> wrote:
>
> On 19:06 Thu 21 Jan     , Peter Maydell wrote:
> > Use the MAINCLK Clock input to set the system_clock_scale variable
> > rather than using the mainclk_frq property.
> >
> > Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> > ---
> > At some point we should make the SysTick take a Clock itself so
> > that we can get rid of the system_clock_scale global entirely.
> > (In fact we want two Clocks: one that is the CPU clock and one
> > for the 'external reference clock' whose period is currently
> > hardcoded at 1000ns in systick_scale()...)
> > ---
> >  hw/arm/armsse.c | 21 +++++++++++++++++----
> >  1 file changed, 17 insertions(+), 4 deletions(-)
> >
> > diff --git a/hw/arm/armsse.c b/hw/arm/armsse.c
> > index 4349ce9bfdb..1da0c1be4c7 100644
> > --- a/hw/arm/armsse.c
> > +++ b/hw/arm/armsse.c
> > @@ -232,6 +232,16 @@ static void armsse_forward_sec_resp_cfg(ARMSSE *s)
> >      qdev_connect_gpio_out(dev_splitter, 2, s->sec_resp_cfg_in);
> >  }
> >
> > +static void armsse_mainclk_update(void *opaque)
> > +{
> > +    ARMSSE *s = ARM_SSE(opaque);
> > +    /*
> > +     * Set system_clock_scale from our Clock input; this is what
> > +     * controls the tick rate of the CPU SysTick timer.
> > +     */
> > +    system_clock_scale = clock_ticks_to_ns(s->mainclk, 1);
> > +}
> > +
> I think you forgot to connect this callback to the clock itself (the
> `qdev_init_clock_in` call in `armsse_init`).

Whoops, yes :-) As it happens all ARMSSE users are fixed-frequency
so this doesn't make a guest-visible difference, but it was
definitely my intention that this was a clock update callback.

> Moreover on a clock change event, shouldn't the SysTick timer be
> recomputed?

Systick correctly handles the system_clock_scale global being changed
at runtime, so once this callback is actually wired up to its Clock
that should just work.

thanks
-- PMM

