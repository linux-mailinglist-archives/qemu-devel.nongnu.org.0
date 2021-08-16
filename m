Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB0EC3ED0D8
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Aug 2021 11:08:11 +0200 (CEST)
Received: from localhost ([::1]:43274 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mFYbK-0004Hm-Pa
	for lists+qemu-devel@lfdr.de; Mon, 16 Aug 2021 05:08:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49956)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mFYZT-0003F9-N8
 for qemu-devel@nongnu.org; Mon, 16 Aug 2021 05:06:15 -0400
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d]:45008)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mFYZS-0002QZ-8H
 for qemu-devel@nongnu.org; Mon, 16 Aug 2021 05:06:15 -0400
Received: by mail-ej1-x62d.google.com with SMTP id bq25so20401487ejb.11
 for <qemu-devel@nongnu.org>; Mon, 16 Aug 2021 02:06:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=570zq5057BNW8LKnNeZBJKDm3+vx4OzvmFtgbEfvMsY=;
 b=NKwNNNhChDmg8xmqcGNmXNsFlOaXhAQDO4mJUpN75t7I2T140WtjrqyFwjO3HNregi
 edNlBsOoNzns3gNjkXM4yyfIFGFsqtaf14QWKYTBRSgFum8bD7n+pddDIr5+N7UGRdKw
 c1putTYFii8r64d/C/xCprNqYHrMMXtQxlPAlbhPsi8OLEz2LZMR+DRyYZ3vMilEycK4
 yZ9pwA+Q5/PsdZEE/RmYKn0r5JpOx8EQZbgq3PBM/JWIP4dW+dcfRPfrh12DyHINcZWu
 DRxqHU/NXFXQZ7qrTMYKw4eTsXi8j0szy1LNlIeVPyP8olHKVEJUe/qhhkw3joKeebNx
 Ntcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=570zq5057BNW8LKnNeZBJKDm3+vx4OzvmFtgbEfvMsY=;
 b=KHnl+uMtDtK+g9N9XBr9sv9xp1xqiPTB6Du4NdJ7BEQcsp7W1t7w1+4kNwifvRMwom
 AsTFKlgPLD9UPnqQtGAcC1Jkwi71vUfe7FVLwaqlSn4Zvt4NXHYaI9nUAZiBXanONtL5
 SlEJanEEDmTE+80DqA0AOlCAi9eOiVk2UnuVvHXtYIBYFZ78tdv8Ob9DQCtTjrnnaQxV
 YhRsRyl2m9Bhf2cb7p9kuj3ltd+4wkdbtemqt4F61RvhLwGtuv2LjqNgej5vRgSewChw
 /re19+xoqtlCU2rs0UU7j6PYznKr07xG5BKG6I1BjS9F7RbSyodyB7p+zGoxGLc45pke
 OXvA==
X-Gm-Message-State: AOAM531VCzCBP3LcF28MYQhsAN0fty6iKbQhgaC77pKWEdFGFk7ol1Jh
 R/YjRhWsYXseK7EcJ9mlvZgybMWfgfHE+9lSjO5aQg==
X-Google-Smtp-Source: ABdhPJxcuQkzkpFZYeh2DL2HcUztuPU8WX4AwM5FDJwT8EtnVvySwn3NN0V7zqlKdm61qlWpiTpqgtyFjJIKSWia2PM=
X-Received: by 2002:a17:906:aac7:: with SMTP id
 kt7mr15135542ejb.4.1629104772802; 
 Mon, 16 Aug 2021 02:06:12 -0700 (PDT)
MIME-Version: 1.0
References: <20210812093356.1946-1-peter.maydell@linaro.org>
 <20210812093356.1946-10-peter.maydell@linaro.org>
 <86d7a767-f53e-dfa2-3641-9e39512c0512@amsat.org>
In-Reply-To: <86d7a767-f53e-dfa2-3641-9e39512c0512@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 16 Aug 2021 10:05:27 +0100
Message-ID: <CAFEAcA8DNSS-0oXCDWeFNkin=mbNePS3CamnCgvvC+89KOWXTw@mail.gmail.com>
Subject: Re: [PATCH for-6.2 09/25] clock: Provide builtin multiplier/divider
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62d.google.com
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
 Joel Stanley <joel@jms.id.au>, Alexandre Iooss <erdnaxe@crans.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, 15 Aug 2021 at 17:32, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:
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
>
> This is super nice!
>
> > Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> > ---
> >  docs/devel/clocks.rst   | 23 +++++++++++++++++++++++
> >  include/hw/clock.h      | 29 +++++++++++++++++++++++++++++
> >  hw/core/clock-vmstate.c | 24 +++++++++++++++++++++++-
> >  hw/core/clock.c         | 29 +++++++++++++++++++++++++----
> >  4 files changed, 100 insertions(+), 5 deletions(-)
>
> > +void clock_set_mul_div(Clock *clk, uint32_t multiplier, uint32_t divid=
er)
> > +{
> > +    assert(divider !=3D 0);
>
> I only wonder if we shouldn't check clock_is_enabled() here.
> Maybe not assert, but at least report a GUEST_ERROR?

Setting the multiplier on a disabled clock doesn't seem like
an error to me. I would expect a common way for the guest to
program a clock-controller would be "first set the divider
and any other parameters; finally, enable the clock".

-- PMM

