Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DF183EA494
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Aug 2021 14:24:55 +0200 (CEST)
Received: from localhost ([::1]:39314 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mE9lV-0008Gl-QR
	for lists+qemu-devel@lfdr.de; Thu, 12 Aug 2021 08:24:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53938)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mE9kN-0007NH-CC
 for qemu-devel@nongnu.org; Thu, 12 Aug 2021 08:23:43 -0400
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d]:38721)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mE9kL-0006um-2e
 for qemu-devel@nongnu.org; Thu, 12 Aug 2021 08:23:43 -0400
Received: by mail-ed1-x52d.google.com with SMTP id q3so5285796edt.5
 for <qemu-devel@nongnu.org>; Thu, 12 Aug 2021 05:23:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FB1Nqq2kM3Ah3RRR9gw4IQx5hqcTQ+AmfQ9BChqvCLk=;
 b=vLOvQOzXoAbNIb+fE1NWVy2WRB/Wh2E65jIRaxEw9BUdl+U4iGPFX/InomcpsfEw9+
 GS+FyVaJdV7/PCFvoBTSP2Hpz1E2X5VkqjuwVXsTU46AouGVL9+aogoomO+rEmo35QQX
 6XnATIFb2L7utiH64jKevz930LCThMUu60pQ5FIvPfXnF2E+hCaMFkWLgjOl6atH+2G2
 puS3erNzkTOB5AytROIILyY3+9ZMNJIx7eAgusOtu/INwFHY38SXQHU5x/RUDD7g9mIf
 n+RwcVwK+zRP7y+9iTXLND1sKw3bsJOVGUUfrLcjkdiFJasfO2EPyBruV8zt8jOBbqgL
 SpOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FB1Nqq2kM3Ah3RRR9gw4IQx5hqcTQ+AmfQ9BChqvCLk=;
 b=Wu86er+PRjVi2y+J0wANxIVaaAL68rQljt70RRh6DB8qBCeFAjovj6cbfedY0x5Xiz
 bWzf66MGojezFFG8CZf8x67gCf4L4xNiEuKB+owoZTTOzvDXFjDM6w8IQJWj2jts3dPh
 nOkUNlBgTQAs5htsYU7k0OQ5zUG8q99ZLHW3P8ovVZAGA/rTbthAshlh4m/UqekPOVpu
 zLw5SLEAU23JZoHP/koOs2woaD6NtnrV4zd9ZEexZUZTS1Q1e4N2Ootgkv4wOg4bDGDY
 g86JrOIFapvDPLKHZG6VLRqQE9XsLgC4xQH/R44u7+Q03exPaPzRGZmyj2J4uG8a3XZy
 7+dA==
X-Gm-Message-State: AOAM533P+RzLNr7mKQCCaL0Zr0gy9OdifwHQom1ecQOlVtvr9XwR8NnM
 ETHbZkZs0dYjTcCOOXkZu006qZJgtngb7emVHtqE2A==
X-Google-Smtp-Source: ABdhPJzAERrqIaulzirFmb3HPOihXoJqJp+ZsdjIvZK0Xkow4bEInzLSA0tbeJagPsm4255In99bfj1N6gZc3VBWkHI=
X-Received: by 2002:a50:f615:: with SMTP id c21mr5293629edn.146.1628771019034; 
 Thu, 12 Aug 2021 05:23:39 -0700 (PDT)
MIME-Version: 1.0
References: <20210812093356.1946-1-peter.maydell@linaro.org>
 <20210812093356.1946-10-peter.maydell@linaro.org>
 <6a0f3bcc-cb85-2f02-32f3-3ea85b0b9c43@crans.org>
In-Reply-To: <6a0f3bcc-cb85-2f02-32f3-3ea85b0b9c43@crans.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 12 Aug 2021 13:22:54 +0100
Message-ID: <CAFEAcA-byMR2cEj6FCcGRFztNLsW3_-LR3v5B5+VVy69xfAU8g@mail.gmail.com>
Subject: Re: [PATCH for-6.2 09/25] clock: Provide builtin multiplier/divider
To: Alexandre IOOSS <erdnaxe@crans.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Thu, 12 Aug 2021 at 13:08, Alexandre IOOSS <erdnaxe@crans.org> wrote:
>
>
> On 8/12/21 11:33 AM, Peter Maydell wrote:
> > It is quite common for a clock tree to involve possibly programmable
> > clock multipliers or dividers, where the frequency of a clock is for
> > instance divided by 8 to produce a slower clock to feed to a
> > particular device.
> >
> > Currently we provide no convenient mechanism for modelling this.  You
> > can implement it by having an input Clock and an output Clock, and
> > manually setting the period of the output clock in the period-changed
> > callback of the input clock, but that's quite clunky.
> >
> > This patch adds support in the Clock objects themselves for setting a
> > multiplier or divider.  The effect of setting this on a clock is that
> > when the clock's period is changed, all the children of the clock are
> > set to period * multiplier / divider, rather than being set to the
> > same period as the parent clock.
> >
> > Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> > ---
> >   docs/devel/clocks.rst   | 23 +++++++++++++++++++++++
> >   include/hw/clock.h      | 29 +++++++++++++++++++++++++++++
> >   hw/core/clock-vmstate.c | 24 +++++++++++++++++++++++-
> >   hw/core/clock.c         | 29 +++++++++++++++++++++++++----
> >   4 files changed, 100 insertions(+), 5 deletions(-)
> >
> > diff --git a/docs/devel/clocks.rst b/docs/devel/clocks.rst
> > index 956bd147ea0..430fbd842e5 100644
> > --- a/docs/devel/clocks.rst
> > +++ b/docs/devel/clocks.rst
> > @@ -260,6 +260,29 @@ clocks get the new clock period value: *Clock 2*, *Clock 3* and *Clock 4*.
> >   It is not possible to disconnect a clock or to change the clock connection
> >   after it is connected.
> >
> > +Clock multiplier and divider settings
> > +-------------------------------------
> > +
> > +By default, when clocks are connected together, the child
> > +clocks run with the same period as their source (parent) clock.
> > +The Clock API supports a built-in period multiplier/divider
> > +mechanism so you can configure a clock to make its children
> > +run at a different period from its own. If you call the
> > +``clock_set_mul_div()`` function you can specify the clock's
> > +multiplier and divider values. The children of that clock
> > +will all run with a period of ``parent_period * multiplier / divider``.
> > +For instance, if the clock has a frequency of 8MHz and you set its
> > +multiplier to 2 and its divider to 3, the child clocks will run
> > +at 12MHz.
> > +
> > +You can change the multiplier and divider of a clock at runtime,
> > +so you can use this to model clock controller devices which
> > +have guest-programmable frequency multipliers or dividers.
>
> This looks nice!
> Does this imply that if I am going to implement the STM32 RCC (Reset and
> Clock Controller) device, then I should use this new feature?

I haven't looked at the RCC spec in detail, but yeah, I'd expect
that you'd have a device with one (or perhaps more) input clocks
and a lot of output clocks, and as the guest writes to registers
that set divider/multiplier settings you'd use clock_set_mul_div()
to configure the appropriate output clocks.

-- PMM

