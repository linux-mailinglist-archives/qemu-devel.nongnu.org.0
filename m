Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 92D2468FA55
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Feb 2023 23:41:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPt75-0004kX-Su; Wed, 08 Feb 2023 17:40:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <titusr@google.com>) id 1pPt74-0004j4-H5
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 17:40:26 -0500
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <titusr@google.com>) id 1pPt72-0001gJ-JE
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 17:40:26 -0500
Received: by mail-wr1-x432.google.com with SMTP id j23so107061wra.0
 for <qemu-devel@nongnu.org>; Wed, 08 Feb 2023 14:40:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=aX3QGVpjjZv9v5vvRb11j0eFEHT2YcamYu+zEmxeIfU=;
 b=OW3IGl2QlWmFHJcv/cYfo0gHbNRzR3JoCWc+dI5vQ3O/Tb8NaZ4l7jADWXCdl7FfFG
 QgytSSZOLYmBPxOdvg9unRoGGSfSy3Xff5gvEWCOSxWOPSzpdVeiY8URjgQFqF6un8Fg
 og3uvuTC+ahsXi76j9ahzYIy32pxfLhL8HEQdPKa6WTvYxcqa2aNR76g/8kqz1btDKYF
 qj9metQXlc682zG07YJ0RYpo/6MfLsHAEuZb34AztRdwW1JqOuRNxnmaQDVOmAArjH8l
 z2rbKW3FA0Fw2rWRC6TTg9rzWIgUPjttaKdz0Rl/A8tXP9g0hxrE0Rdh1dQTxAUtbf7C
 KZhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=aX3QGVpjjZv9v5vvRb11j0eFEHT2YcamYu+zEmxeIfU=;
 b=voGHkcurQ9ZkZfVHcdr5uJv7CACIyFAMjNktve6rAoIZxtTPUai3kBv5v0i21oivzR
 PHb2dWyKPszg27chfViCCcIOFLvZF5esawlY7pnFyuDx0ckpF0qLy4aDOqffdyEGHzwf
 KUSv7Jp8XZU2Q3j+wrGfnc24qdojMgca3u7hpXKFSvdpSyLxRYJe/7P1cGdTvajiwZw9
 miVEfaY3QOYsHJ+PxDjfRwGpdKihM/YYXysc24RICiN/Jg5CRJ/eBJRTV5qYbuIBVrTA
 v1EEaXhhLEwfJ0k6tWJH7ObneGf0Yy6xFXTd0NLqzGNEGpDdIwwD7vDA+0Mg50bDwawy
 r9iQ==
X-Gm-Message-State: AO0yUKWRIxZtne09IJ2h9WFxBrPMAc8DIeORgfmpDbMM5WyT9pX7iyDf
 sGFgv2VcbBiV1Wvx9gugN8307q8W6nmjMQoAMqQiRg==
X-Google-Smtp-Source: AK7set/BtQuAYMLdlpHBA7C/ka1aOo1D7ULWvc9+q2cBgJZ1EvDY01zG4+fX3aTdCxyv2XoaIaqoMvx3+iQ6HgQkeHs=
X-Received: by 2002:adf:f287:0:b0:2c3:f119:66b4 with SMTP id
 k7-20020adff287000000b002c3f11966b4mr423341wro.615.1675896021911; Wed, 08 Feb
 2023 14:40:21 -0800 (PST)
MIME-Version: 1.0
References: <20230206194936.168843-1-titusr@google.com>
 <20230206194936.168843-2-titusr@google.com>
 <CACPK8Xc=w9n-Q-K7iJQF8QSSzSW1e1S=dfuqrQvRp=SOCwQfHw@mail.gmail.com>
In-Reply-To: <CACPK8Xc=w9n-Q-K7iJQF8QSSzSW1e1S=dfuqrQvRp=SOCwQfHw@mail.gmail.com>
From: Titus Rwantare <titusr@google.com>
Date: Wed, 8 Feb 2023 14:40:00 -0800
Message-ID: <CAMvPwGqmSF4YDgt6-3W8m_yUDM6O+gcvQNLFQntexZt++R1Ldg@mail.gmail.com>
Subject: Re: [PATCH 1/3] hw/gpio: add PCA6414 i2c GPIO expander
To: Joel Stanley <joel@jms.id.au>
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Hao Wu <wuhaotsh@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=titusr@google.com; helo=mail-wr1-x432.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Mon, 6 Feb 2023 at 19:43, Joel Stanley <joel@jms.id.au> wrote:
>
> On Mon, 6 Feb 2023 at 19:51, Titus Rwantare <titusr@google.com> wrote:
> >
> > This is a simple i2c device that allows i2c capable devices to have
> > GPIOs.
>
> Nice.
>
> In Linux this is supported by a driver called pca953x.  Would it make
> sense to name your model similarly (both the file and the prefixes you
> use)?
>
> If we do that then it looks like other devices from the same family
> could be easily supported. (I'm not suggesting you do that work up
> front)

Thanks to NXP's naming, pca<number> could mean anything, so I opted
for i2c_gpio.
For example, we use pca954{3,6,8} i2c muxes that are entirely unrelated.
Looking at the driver, most of the devices there seem like they would
work with this qemu model. Someone more familiar would need to
validate them.

> >  hw/gpio/pca_i2c_gpio.c          | 362 ++++++++++++++++++++++++++++++++
> >  hw/gpio/trace-events            |   5 +
> >  hw/i2c/Kconfig                  |   4 +
> >  include/hw/gpio/pca_i2c_gpio.h  |  72 +++++++
> >  tests/qtest/meson.build         |   1 +
> >  tests/qtest/pca_i2c_gpio-test.c | 169 +++++++++++++++
> >  8 files changed, 615 insertions(+)
> >  create mode 100644 hw/gpio/pca_i2c_gpio.c
> >  create mode 100644 include/hw/gpio/pca_i2c_gpio.h
> >  create mode 100644 tests/qtest/pca_i2c_gpio-test.c
> >
> > diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
> > index 2d157de9b8..1b533ddd76 100644
> > --- a/hw/arm/Kconfig
> > +++ b/hw/arm/Kconfig
> > @@ -418,6 +418,7 @@ config NPCM7XX
> >      select SSI
> >      select UNIMP
> >      select PCA954X
> > +    select PCA_I2C_GPIO
> >
> >  config FSL_IMX25
> >      bool
> > diff --git a/hw/gpio/meson.build b/hw/gpio/meson.build
> > index b726e6d27a..1e5b602002 100644
> > --- a/hw/gpio/meson.build
> > +++ b/hw/gpio/meson.build
> > @@ -12,3 +12,4 @@ softmmu_ss.add(when: 'CONFIG_OMAP', if_true: files('omap_gpio.c'))
> >  softmmu_ss.add(when: 'CONFIG_RASPI', if_true: files('bcm2835_gpio.c'))
> >  softmmu_ss.add(when: 'CONFIG_ASPEED_SOC', if_true: files('aspeed_gpio.c'))
> >  softmmu_ss.add(when: 'CONFIG_SIFIVE_GPIO', if_true: files('sifive_gpio.c'))
> > +softmmu_ss.add(when: 'CONFIG_PCA_I2C_GPIO', if_true: files('pca_i2c_gpio.c'))
> > diff --git a/hw/gpio/pca_i2c_gpio.c b/hw/gpio/pca_i2c_gpio.c
> > new file mode 100644
> > index 0000000000..afae497a22
> > --- /dev/null
> > +++ b/hw/gpio/pca_i2c_gpio.c
> > @@ -0,0 +1,362 @@
> > +/*
> > + * NXP PCA I2C GPIO Expanders
> > + *
> > + * Low-voltage translating 16-bit I2C/SMBus GPIO expander with interrupt output,
> > + * reset, and configuration registers
> > + *
> > + * Datasheet: https://www.nxp.com/docs/en/data-sheet/PCA6416A.pdf
>
> +1
>
> > + *
> > + * Copyright 2023 Google LLC
> > + *
> > + * SPDX-License-Identifier: GPL-2.0-or-later
> > + *
> > + * These devices, by default, are configured to input only. The configuration is
> > + * settable through qom/qmp, or i2c.To set some pins as inputs before boot, use
> > + * the following in the board file of the machine:
> > + *      object_property_set_uint(Object *obj, const char *name,
> > + *                               uint64_t value, Error **errp);
> > + * specifying name as "gpio_config" and the value as a bitfield of the inputs
> > + * e.g. for the pca6416, a value of 0xFFF0, sets pins 0-3 as outputs and
> > + * 4-15 as inputs.
> > + * This value can also be set at runtime through qmp externally, or by
> > + * writing to the config register using i2c.
>
> Nice docs. I'm sure someone else will tell you if there's a better
> spot, but I like that you've written this down.

Thanks,
-Titus

