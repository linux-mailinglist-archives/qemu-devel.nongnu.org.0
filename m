Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ACC773D70CA
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Jul 2021 10:06:32 +0200 (CEST)
Received: from localhost ([::1]:49162 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m8I6h-00025K-Kw
	for lists+qemu-devel@lfdr.de; Tue, 27 Jul 2021 04:06:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37508)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1m8I2s-00014C-N5; Tue, 27 Jul 2021 04:02:34 -0400
Received: from mail-qt1-x836.google.com ([2607:f8b0:4864:20::836]:44645)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1m8I2q-0007Qb-NM; Tue, 27 Jul 2021 04:02:34 -0400
Received: by mail-qt1-x836.google.com with SMTP id g11so8914561qts.11;
 Tue, 27 Jul 2021 01:02:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=jN7UpphmA47gcdFkRfOr3Vi5bpHQ5t1x0cnEDH0ZD4I=;
 b=LoFRJWJJ8fZniC75MSkIyv3haIQZjGTdpYiKWLvoav8ydgC9MCCv0qcCXgTO3dmNvl
 vVgEtUYx5Y2/3E+v+qqp7TPd/1z4jjEx/hGudyjXLaN2U+VghTK1ua4KNDKJlTKej4S+
 WjPYukitquky3+il4uOge+XU0v45qMSzqKMQc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=jN7UpphmA47gcdFkRfOr3Vi5bpHQ5t1x0cnEDH0ZD4I=;
 b=GE7ZnltVCGL2FOFda0AJ4yOTY3WsbDHqSxZvZ2/VkOJ2KNM1YZjPmcuJN9f6Mppmky
 Rjjy/mrXK63Fmy++gB6+Yv5Mz2t5k4ZhIqe/dvKgFdZfAsPTSeFQgFdWmyESEaSkGzdJ
 INafMYtffCy366NSbhvOWyK9DSO2pThtzRoKYF0Exf9zVvjOvIAzkbHKsBjqCNl5UpPr
 eaO+yg65fPVA9XUD7TTuAPCXmK/63Y56w+PiWEDe+hXnINAK3UTirwIu6BYLCR+vw/IK
 xb01GmqTiSBAYKLmtXtQST3dNg7oVKQJVR5IuV3fKK48Nk7Ka26blzkr+mZh1A7iUDVC
 dW6Q==
X-Gm-Message-State: AOAM532tFxqEO5nfPmghmrUWxVeIF3JOFBGoHQo0kKdKy/j+bcnqJGgf
 55Le6dvYaS5T6P0CzMSF8UHcfSH7gn04URwfLqY=
X-Google-Smtp-Source: ABdhPJxNh1SxBz2aGPztYueoQTe5EuLZg+h/dA70HGIPjGzlNztT0CP0WAFhSVEfhVK35lNo1FqSqrBKqeBLpGMGAKo=
X-Received: by 2002:ac8:5289:: with SMTP id s9mr18200371qtn.385.1627372949921; 
 Tue, 27 Jul 2021 01:02:29 -0700 (PDT)
MIME-Version: 1.0
References: <20210713065854.134634-1-joel@jms.id.au>
 <20210713065854.134634-2-joel@jms.id.au>
 <7c5dd20c-4710-4bdb-605f-e35ed7bfb35a@kaod.org>
In-Reply-To: <7c5dd20c-4710-4bdb-605f-e35ed7bfb35a@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 27 Jul 2021 08:02:17 +0000
Message-ID: <CACPK8Xe=v4KRT1TqC8-DFWxqUoCak1MisWr84_9ug-xfXezWEA@mail.gmail.com>
Subject: Re: [SPAM] [PATCH v2 1/3] hw: aspeed_gpio: Fix memory size
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::836;
 envelope-from=joel.stan@gmail.com; helo=mail-qt1-x836.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Andrew Jeffery <andrew@aj.id.au>, Rashmica Gupta <rashmica.g@gmail.com>,
 qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 19 Jul 2021 at 16:02, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> On 7/13/21 8:58 AM, Joel Stanley wrote:
> > The macro used to calculate the maximum memory size of the MMIO region
> > had a mistake, causing all GPIO models to create a mapping of 0x9D8.
> > The intent was to have it be 0x9D8 - 0x800.
> >
> > This extra size doesn't matter on ast2400 and ast2500, which have a 4KB
> > region set aside for the GPIO controller.
> >
> > On the ast2600 the 3.3V and 1.8V GPIO controllers are 2KB apart, so the
> > regions would overlap. Worse was the 1.8V controller would map over the
> > top of the following perianal, which happens to be the RTC.
> >
> > The mmio region used by each device is a maximum of 2KB, so avoid the
> > calculations and hard code this as the maximum.
> >
> > Fixes: 36d737ee82b2 ("hw/gpio: Add in AST2600 specific implementation")
> > Signed-off-by: Joel Stanley <joel@jms.id.au>
>
> Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>

Cedric, Peter; can we please get this merged for 6.1? Without it the
RTC model is not functional on the ast2500.

The other patches in this series are cleanups that can wait for future rele=
ases.

Cheers,

Joel

>
> > ---
> >  hw/gpio/aspeed_gpio.c | 3 +--
> >  1 file changed, 1 insertion(+), 2 deletions(-)
> >
> > diff --git a/hw/gpio/aspeed_gpio.c b/hw/gpio/aspeed_gpio.c
> > index 6ae0116be70b..b3dec4448009 100644
> > --- a/hw/gpio/aspeed_gpio.c
> > +++ b/hw/gpio/aspeed_gpio.c
> > @@ -207,7 +207,6 @@
> >  #define GPIO_1_8V_MEM_SIZE            0x9D8
> >  #define GPIO_1_8V_REG_ARRAY_SIZE      ((GPIO_1_8V_MEM_SIZE - \
> >                                        GPIO_1_8V_REG_OFFSET) >> 2)
> > -#define GPIO_MAX_MEM_SIZE           MAX(GPIO_3_6V_MEM_SIZE, GPIO_1_8V_=
MEM_SIZE)
> >
> >  static int aspeed_evaluate_irq(GPIOSets *regs, int gpio_prev_high, int=
 gpio)
> >  {
> > @@ -849,7 +848,7 @@ static void aspeed_gpio_realize(DeviceState *dev, E=
rror **errp)
> >      }
> >
> >      memory_region_init_io(&s->iomem, OBJECT(s), &aspeed_gpio_ops, s,
> > -            TYPE_ASPEED_GPIO, GPIO_MAX_MEM_SIZE);
> > +            TYPE_ASPEED_GPIO, 0x800);
> >
> >      sysbus_init_mmio(sbd, &s->iomem);
> >  }
> >
>

