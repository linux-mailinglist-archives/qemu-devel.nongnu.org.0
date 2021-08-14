Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D06753EC1EC
	for <lists+qemu-devel@lfdr.de>; Sat, 14 Aug 2021 12:13:30 +0200 (CEST)
Received: from localhost ([::1]:39780 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mEqfR-0004iK-FY
	for lists+qemu-devel@lfdr.de; Sat, 14 Aug 2021 06:13:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40038)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mEqeg-0003qz-4w
 for qemu-devel@nongnu.org; Sat, 14 Aug 2021 06:12:42 -0400
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a]:39508)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mEqee-0002ln-HE
 for qemu-devel@nongnu.org; Sat, 14 Aug 2021 06:12:41 -0400
Received: by mail-ej1-x62a.google.com with SMTP id go31so22888382ejc.6
 for <qemu-devel@nongnu.org>; Sat, 14 Aug 2021 03:12:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wpgIkZjJO+lMhdFQh9t2dEkZ0bnLDW/oEauAxawUiQg=;
 b=ZxpZcUlr2yHzL2EJrBbLpJI+pY0KpSXJgLmjA+22ffqsLM5Nmu+akm9q5mCSmb9GnS
 SMnF0jvp1hGEcpdMTUg4qz0CekRRvmWKP5iFyBMFpJL/+H/EOvfNtTemFNrdAXLHSD1Q
 dbJaA/A9/lpZDDfrdoRI2NEComXtWxo4ifoQmjS/5Ip0SCKI1Uyi2XY+y6J97gURsHpz
 6MHzFPOGBPKexw7YMKa33zEXm0IWIRlsf8KV2kZGLW1NGkzotljooModIJJU3SXmkzgG
 DzxZkpWuNAudkIvbKWDWjT35ijmtDtcZmbRAEMXGYQIBPSzPiqrcyyxzgEzY5qBlrPH1
 +tXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wpgIkZjJO+lMhdFQh9t2dEkZ0bnLDW/oEauAxawUiQg=;
 b=IwxtWzuEMjT8qmwGaoncfNrLFLnCL+u1p2xpg30KCQyU6yDhqtWItpFN4fo0iS03t1
 crBmXgPx5jq1hFI5aqbrYfjVZkMWQPvHEYvZZi10W11eg5AWo6CMVHyRewUw0wn+4vJm
 fbXdW1n5NNPCOmbVLYkLsvl2nrQOHmZogU7M3Q0HylkzPLDdjTIsa/8+DsIbvcWq9vpg
 +9maI7VhhvFZILEWX7x6ncJh1l/tn3mEu9Ivd7C9N43ri1P3rSRiJJcu0eaXtjyI2SJs
 VmUTeckhldEJ0c8Ib46Z6Di8rzPGN5jj/4mQ+yu7nOssZMkac9rQjDzYYzQI9zaw4Xtb
 zkSw==
X-Gm-Message-State: AOAM533IL8ZvZBffxAoAefikC8Gdcqn20mjHk//kJvJmfILzt+xhKEQm
 SI1znrpWSxPneqwiiLPi9ANaXWBxBBC1I8ofgLeMIQ==
X-Google-Smtp-Source: ABdhPJwM73zIvVQRrh/nm1M76Q2UyagbQhyPPCiuvKC2DbP/7LKL82MY2P9+vnr/wmuB99M9puYiDfb2tNilP7O5IHI=
X-Received: by 2002:a17:906:e8d:: with SMTP id
 p13mr3219119ejf.85.1628935958342; 
 Sat, 14 Aug 2021 03:12:38 -0700 (PDT)
MIME-Version: 1.0
References: <20210812093356.1946-1-peter.maydell@linaro.org>
 <20210812093356.1946-20-peter.maydell@linaro.org>
 <df2e95e5-3898-7dd9-a571-34326bb799b1@crans.org>
In-Reply-To: <df2e95e5-3898-7dd9-a571-34326bb799b1@crans.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 14 Aug 2021 11:11:53 +0100
Message-ID: <CAFEAcA_fFHpxo5Oscj0a-_xOd9+WM0Ea79Zt3e1VFWAd4EwP3A@mail.gmail.com>
Subject: Re: [PATCH for-6.2 19/25] hw/arm/msf2: Use Clock input to MSF2_SOC
 instead of m3clk property
To: Alexandre IOOSS <erdnaxe@crans.org>
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
Cc: Damien Hedde <damien.hedde@greensocs.com>, Luc Michel <luc@lmichel.fr>,
 Alistair Francis <alistair@alistair23.me>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
 Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, 14 Aug 2021 at 10:20, Alexandre IOOSS <erdnaxe@crans.org> wrote:
>
>
> On 8/12/21 11:33 AM, Peter Maydell wrote:
> > Instead of passing the MSF2 SoC an integer property specifying the
> > CPU clock rate, pass it a Clock instead.  This lets us wire that
> > clock up to the armv7m object.
> >
> > Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

> > @@ -72,7 +74,10 @@ static void emcraft_sf2_s2s010_init(MachineState *machine)
> >        * in Libero. CPU clock is divided by APB0 and APB1 divisors for
> >        * peripherals. Emcraft's SoM kit comes with these settings by default.
> >        */
> > -    qdev_prop_set_uint32(dev, "m3clk", 142 * 1000000);
> > +    /* This clock doesn't need migration because it is fixed-frequency */
> > +    m3clk = clock_new(OBJECT(machine), "m3clk");
> > +    clock_set_hz(m3clk, 142 * 1000000);
>
> Maybe something could be added in the commit message to say that M3_CLK
> is changed from 100MHz to 142MHz.

I'm not sure what you mean here? This commit doesn't change the frequency:
we previously set the m3clk property to "142 * 1000000" and now we set the
clock's hz setting to the same thing.

The old m3clk property had a default value of 100 * 1000000, but nothing
ever used that because the only user of the device (this board code)
set the property explicitly to some value. With the new Clock-based
setup there is no default value at all, because the board code must
always connect a clock, and will set its frequency to whatever is
right for that board.

-- PMM

