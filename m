Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E6C393EA355
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Aug 2021 13:13:19 +0200 (CEST)
Received: from localhost ([::1]:54476 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mE8eF-0000yU-1I
	for lists+qemu-devel@lfdr.de; Thu, 12 Aug 2021 07:13:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38062)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mE8bc-0006m0-Gi
 for qemu-devel@nongnu.org; Thu, 12 Aug 2021 07:10:39 -0400
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633]:42702)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mE8bZ-0006J5-3R
 for qemu-devel@nongnu.org; Thu, 12 Aug 2021 07:10:36 -0400
Received: by mail-ej1-x633.google.com with SMTP id b10so2291943eju.9
 for <qemu-devel@nongnu.org>; Thu, 12 Aug 2021 04:10:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=BnMZ5/l7Xa/tJLNjzFQ5kQZ8kLnP3BLkYUUjoj+0CGc=;
 b=ps2ertKXjz+RMOrkCBHhS6x4p+M8UHT6xvZfpm4VntieGrVuGZmGEEcGZXeMvtQzFV
 fH7eWdc/ZQZyNXkMzAsfUXp54Wczl8GJSq19b8JAGAzJ+wfYWvPNwKXyidJ9marEyikI
 VwgihyaGhlw7XMrDgtc76TUfnFJc3bfVU/OFmLT21gXgpknJOi8lJqoKaXdENBNcA9re
 3fxZ8iNIlCPEszcdcrZ8CZe9MsPB7c5r3AaPtg0UHQ32kgtpw0jJzsOZOI8aNXUm5Ipz
 hrpnlcmw77xWHYehckalRI8RPhVxl5mm/CXhKx+QG6BWQ39YaxLb1uZYtSinuLkppSmO
 XhFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BnMZ5/l7Xa/tJLNjzFQ5kQZ8kLnP3BLkYUUjoj+0CGc=;
 b=dCS75dWP/nkrL95v/hOPQA+cQOMnHnwVBcBcsUZsVTMATZkQj3CXOLqlHXxhDOZTiW
 pjQo0u9+pXGDZg4Ix7S96THh2zFD65y3FttvAPB6jsoUlhUp1RABlon5stBrO1VkwQuW
 ElAUP4+sTcF5TWhj/EaZQJzkkxx04JXngBRsIpSduI2UFP4HDdMLGoMwrBtf3FeiBh5g
 /ENNcqODmbJZx8t6GC4Yx6PhxsIVq1WRawCVEisz82ZqWb7H+vN6rFQIGF/5CAjj3vJO
 A2nuzndaJV2aRpsXOpno2ld6nymOHjJzl+nW52SlGdhXzciizhxj1fFQpctxtmUnFOSa
 u2MQ==
X-Gm-Message-State: AOAM533n5QOXm4QPTZlEoQ1xZ6fTR250ukQZBuG++xJAeVU3V9MOHzdm
 MHh5El30H0+fqnfCoq5vemmRBIcQIHoKjEG4fGan+Q==
X-Google-Smtp-Source: ABdhPJw8RJc4HeUPsh+oqPvifYaciljG2dVLQX/vb2fA+3Z3e2oqXGw2/5j180xoLQiK6Mh9dik77evVfzppNgJ2z5s=
X-Received: by 2002:a17:906:a108:: with SMTP id
 t8mr3059428ejy.407.1628766630791; 
 Thu, 12 Aug 2021 04:10:30 -0700 (PDT)
MIME-Version: 1.0
References: <20210812093356.1946-1-peter.maydell@linaro.org>
 <20210812093356.1946-2-peter.maydell@linaro.org>
 <d712c8dc-1976-c197-2ecb-75cf35ac1f29@crans.org>
In-Reply-To: <d712c8dc-1976-c197-2ecb-75cf35ac1f29@crans.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 12 Aug 2021 12:09:45 +0100
Message-ID: <CAFEAcA_QHYhFnNknzEe_jY=3tvQyYZg6ozG2f7270rg9yFrfFw@mail.gmail.com>
Subject: Re: [PATCH for-6.2 01/25] arm: Move M-profile RAS register block into
 its own device
To: Alexandre IOOSS <erdnaxe@crans.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x633.google.com
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

On Thu, 12 Aug 2021 at 12:08, Alexandre IOOSS <erdnaxe@crans.org> wrote:
>
>
>
> On 8/12/21 11:33 AM, Peter Maydell wrote:
> > Currently we implement the RAS register block within the NVIC device.
> > It isn't really very tightly coupled with the NVIC proper, so instead
> > move it out into a sysbus device of its own and have the top level
> > ARMv7M container create it and map it into memory at the right
> > address.
> >
> > Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> > ---
> >   include/hw/arm/armv7m.h       |  2 +
> >   include/hw/intc/armv7m_nvic.h |  1 -
> >   include/hw/misc/armv7m_ras.h  | 37 ++++++++++++++
> >   hw/arm/armv7m.c               | 12 +++++
> >   hw/intc/armv7m_nvic.c         | 56 ---------------------
> >   hw/misc/armv7m_ras.c          | 93 +++++++++++++++++++++++++++++++++++
> >   MAINTAINERS                   |  2 +
> >   hw/misc/meson.build           |  2 +
> >   8 files changed, 148 insertions(+), 57 deletions(-)
> >   create mode 100644 include/hw/misc/armv7m_ras.h
> >   create mode 100644 hw/misc/armv7m_ras.c
> >
> > diff --git a/include/hw/arm/armv7m.h b/include/hw/arm/armv7m.h
> > index bc6733c5184..4cae0d7eeaa 100644
> > --- a/include/hw/arm/armv7m.h
> > +++ b/include/hw/arm/armv7m.h
> > @@ -12,6 +12,7 @@
> >
> >   #include "hw/sysbus.h"
> >   #include "hw/intc/armv7m_nvic.h"
> > +#include "hw/misc/armv7m_ras.h"
> >   #include "target/arm/idau.h"
> >   #include "qom/object.h"
> >
> > @@ -58,6 +59,7 @@ struct ARMv7MState {
> >       NVICState nvic;
> >       BitBandState bitband[ARMV7M_NUM_BITBANDS];
> >       ARMCPU *cpu;
> > +    ARMv7MRAS ras;
> >
> >       /* MemoryRegion we pass to the CPU, with our devices layered on
> >        * top of the ones the board provides in board_memory.
> > diff --git a/include/hw/intc/armv7m_nvic.h b/include/hw/intc/armv7m_nvic.h
> > index 39c71e15936..33b6d8810c7 100644
> > --- a/include/hw/intc/armv7m_nvic.h
> > +++ b/include/hw/intc/armv7m_nvic.h
> > @@ -83,7 +83,6 @@ struct NVICState {
> >       MemoryRegion sysreg_ns_mem;
> >       MemoryRegion systickmem;
> >       MemoryRegion systick_ns_mem;
> > -    MemoryRegion ras_mem;
> >       MemoryRegion container;
> >       MemoryRegion defaultmem;
> >
> > diff --git a/include/hw/misc/armv7m_ras.h b/include/hw/misc/armv7m_ras.h
> > new file mode 100644
> > index 00000000000..f8773e65b14
> > --- /dev/null
> > +++ b/include/hw/misc/armv7m_ras.h
> > @@ -0,0 +1,37 @@
> > +/*
> > + * Arm M-profile RAS block
> > + *
> > + * Copyright (c) 2021 Linaro Limited
> > + *
> > + *  This program is free software; you can redistribute it and/or modify
> > + *  it under the terms of the GNU General Public License version 2 or
> > + *  (at your option) any later version.
> > + */
>
> Maybe it would be a good idea here to change to "Arm M-profile RAS
> (Reliability, Availability, and Serviceability) block" to define the
> acronym at least once in the device code?

Yeah, we could perhaps put a comment in there somewhere.
Though really you need to look in the spec to understand
what the block is doing, at which point you'll find out what
the register block is for.

> > +static void armv7m_ras_class_init(ObjectClass *klass, void *data)
> > +{
> > +    /* This device has no state: no need for vmstate or reset */
> > +}
> > +
> > +static const TypeInfo armv7m_ras_info = {
> > +    .name = TYPE_ARMV7M_RAS,
> > +    .parent = TYPE_SYS_BUS_DEVICE,
> > +    .instance_size = sizeof(ARMv7MRAS),
> > +    .instance_init = armv7m_ras_init,
> > +    .class_init = armv7m_ras_class_init,
> > +};
>
> Pure curiosity: is `.class_init` defined because it needs to be defined
> or is it only a good practise in QEMU code to always define it?

It's optional, and in this case it's only there because it makes
a place to put the comment, I guess.

-- PMM

