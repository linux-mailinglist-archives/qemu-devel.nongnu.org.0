Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CD4A44DADA
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Nov 2021 17:56:54 +0100 (CET)
Received: from localhost ([::1]:36786 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mlDNc-0001I5-QX
	for lists+qemu-devel@lfdr.de; Thu, 11 Nov 2021 11:56:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35908)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mlDMC-0000BI-Gd
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 11:55:24 -0500
Received: from [2a00:1450:4864:20::42e] (port=43647
 helo=mail-wr1-x42e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mlDMA-0000Hc-IQ
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 11:55:24 -0500
Received: by mail-wr1-x42e.google.com with SMTP id t30so10853091wra.10
 for <qemu-devel@nongnu.org>; Thu, 11 Nov 2021 08:55:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=iADQHamfW58+cC1f3g4SsWPLaacjHyMht9a/GpaxB/E=;
 b=PXIzLxxVFz6HcS5NOMSXLisrOJOnG59UkSmF0CgTvUTksJPa/30TNyL3y+KCDrdJpc
 UZAHwv7ODEizWdcKXUiez9Dek7Cc7izREjt7RNMdlQd//meYH4I/Po59ZxyI6cq3ld8n
 UKaL1S2scZX3MCPflChWnmyC4TC6wBac9XA63GIfKjSll6FNrtHWFkpkbkNhZjuPc+M4
 q/iRaosSrrJ6ZrOrZLed8Z5UEJ/RhAq9WfPu041jT4iNQ/F2GPs8pL1JItgyvJeokZLC
 1eSn7R3uQZ9UvJzVFXiaMk6fusW3Gp4vs8O4zyIIEDUeGIHINZ16Ws9158c8gLhokyQH
 P0qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iADQHamfW58+cC1f3g4SsWPLaacjHyMht9a/GpaxB/E=;
 b=uf27236BKA4OHzgT3EV/3Fatcxjs45FhGW0An5J+oBw0q0LMm0gLOqXd/E4W79jHya
 IImu8HDUrpeN0J/rQaDdr6r79VaJKOVr2WEP7hdHVRdvafOchY3wPv8daERG+jmJg3X+
 uGf/xR2n4ecw2JK+MVmKKLA/y0Mut8x0TkNNhf4D8F7RzFjHTrTnV/+8bckgy4NJgzKe
 kd9dM802hhRpQt+rklaGIqv8WMIPC11Qi349w+U5RBH73Rnr4Sv9+PatBQH8Q21p2opi
 e3vhIv/Nz+qWdC7nQPPAZH5xo6QAVbYqZVqVpppOW4P2xFQvSAH62DvUOcWaa9Mg7Bn1
 XcUw==
X-Gm-Message-State: AOAM532Flqj3dAVTazVPdbvISkITBr5+AhcpJ19lNreLX5a3uW0TBz4z
 AE+Pd8MiGgYrZD3ce8bCBNMxsBaatjaBmorfhAbKfA==
X-Google-Smtp-Source: ABdhPJy0PPv5fSAHpxrT8LFKBZANa72f9OmW7DIrD9SnLrRD09Y4d/oOVWpCo1OwGnJ6SXkXWeNpMglcD1G/sYWbHO8=
X-Received: by 2002:adf:e984:: with SMTP id h4mr10618461wrm.149.1636649720457; 
 Thu, 11 Nov 2021 08:55:20 -0800 (PST)
MIME-Version: 1.0
References: <20210812165341.40784-1-shashi.mallela@linaro.org>
 <20210812165341.40784-8-shashi.mallela@linaro.org>
 <CAFEAcA9WVu+kjfCWwfGQV00yKgmdFDCSUpxNOu1BEBM3AZCWXg@mail.gmail.com>
 <20210902124258.mqjhx7lqqvkczf6a@leviathan>
 <CAFEAcA-KeBzOCP1CHVWPHbHzG=KbS_HJmXoYo7B2VBz=oGSd3w@mail.gmail.com>
 <20211015122351.vc55mwzjbevl6wjy@leviathan>
 <CAFEAcA-Xe2u8n+og4TMyZSSvdBm8nrma3z4GkVjEJHPdJu8Fnw@mail.gmail.com>
 <20211109204249.usvfatm3frar3u7a@leviathan>
 <CAFEAcA98G_u74G7PQFVZ_FTirKtnO63WQhA5bV_zVJJXAzJang@mail.gmail.com>
 <20211109225251.gfr2mvm3jynvdsnk@leviathan>
In-Reply-To: <20211109225251.gfr2mvm3jynvdsnk@leviathan>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 11 Nov 2021 16:55:09 +0000
Message-ID: <CAFEAcA-0NFAM5j8CrUf+hPmCZBGOiAkk2f-n-pfqjsv+OwM38w@mail.gmail.com>
Subject: Re: [PATCH v8 07/10] hw/arm/sbsa-ref: add ITS support in SBSA GIC
To: Leif Lindholm <leif@nuviainc.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42e
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Shashi Mallela <shashi.mallela@linaro.org>,
 Radoslaw Biernacki <rad@semihalf.com>, QEMU Developers <qemu-devel@nongnu.org>,
 narmstrong@baylibre.com, Eric Auger <eric.auger@redhat.com>,
 qemu-arm <qemu-arm@nongnu.org>, Igor Mammedov <imammedo@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 9 Nov 2021 at 22:52, Leif Lindholm <leif@nuviainc.com> wrote:
>
> On Tue, Nov 09, 2021 at 21:21:46 +0000, Peter Maydell wrote:
> > The other thing we should nail down is how the user is going to
> > select which flavour of machine they want to provide. Three
> > options:
> >  (1) no control, QEMU just emulates whatever the newest flavour is.
> > User needs to go find a firmware image new enough to cope.
> >  (2) different flavours exposed as different machine types
> > (analogous to how we have musca-a and musca-b1, or raspi3ap and
> > raspi3b, for instance). Old user command lines keep working
> > because -M sbsa-ref doesn't change; the new stuff would be
> > available via -M sbsa-ref-2 or whatever.
> >  (3) different flavours exposed via a property
> > (so you would have -M sbsa-ref,machine-revision=2 or something).
> > If the revision defaults to 1 then old user setups still work
> > but everybody starts to have to cart around an extra command
> > line argument. If it defaults to "newest we know about" you
> > get the opposite set of tradeoffs.
>
> I'm leaning towards (1), at least while working towards a "complete"
> platform (when we may still add/change features, but not how those
> features are communicated to the firmware).

That's certainly the easiest on the QEMU side; you know the
userbase so would know whether that kind of compat break is
going to be OK with them.

Q1: who is going to write the code for this?

Q2: do we want to try to land "ITS in sbsa-ref" in 6.2? Given
we're in freeze we're quite short of time even if we handwave
the fact it's a new feature, not a bugfix, so I would lean
towards 'no'...

-- PMM

