Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A6952BC519
	for <lists+qemu-devel@lfdr.de>; Sun, 22 Nov 2020 11:35:07 +0100 (CET)
Received: from localhost ([::1]:44566 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kgmhw-0005Ea-Rg
	for lists+qemu-devel@lfdr.de; Sun, 22 Nov 2020 05:35:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50866)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangzhiqiang.bj@bytedance.com>)
 id 1kgmgu-0004h8-Ka
 for qemu-devel@nongnu.org; Sun, 22 Nov 2020 05:33:56 -0500
Received: from mail-oi1-x242.google.com ([2607:f8b0:4864:20::242]:45180)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wangzhiqiang.bj@bytedance.com>)
 id 1kgmgo-0005Fv-Iu
 for qemu-devel@nongnu.org; Sun, 22 Nov 2020 05:33:53 -0500
Received: by mail-oi1-x242.google.com with SMTP id l206so16223763oif.12
 for <qemu-devel@nongnu.org>; Sun, 22 Nov 2020 02:33:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=miRJaA2YxPXNGxlQwslFYA//x0JSWgBfx8qp4NgIgzA=;
 b=ojUpfyeW1d59eZpLypPSNEi/txC3vnnD9KdqkwtpiRct3pwHETnq+UGw4LYilCzABY
 GL+XGjhdKnTsuSNnWyEtlLdBB7N0EbbZp1cnPLsvobCdZBKPxJc/MMTxVG4j4iR+NAKV
 T1I8dOw9TlIUGAfbkMkzHpinJJPbKbZxd+yNrXMYhehQOAzCiVXkdKvNu9qTZf+GuKZN
 hYlkq1wy5+zeqBaO9cPuWqCHqQbv7wH/oF1CvLa3vGiUtTSQQRt5NnMNxb6zhG7tQ5NB
 rugrNokBgsdXn06/ZkHxgwuDCjKGw6zid/WaZK2PQH8YDpDkM9ioaEOYUHiadxJFQeFM
 MIHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=miRJaA2YxPXNGxlQwslFYA//x0JSWgBfx8qp4NgIgzA=;
 b=YKA/M+VHGq8Q0Me5gIwa2stWeugLrYWcbBJVOTlHorEjxpnCdUihxEYotBL0UXTG3n
 tWxw9sUrdev3rSezkmchQMkX9QleaFXhNrjl5JmlUHyImUUYwh/D0XfD38q/ffA4v2W2
 ndqAiRRGSesK0QoUv5nJdkwLHGnwuLBoDvGEg36ZFcXsRRf7AepoSURDx115DD3O91XB
 jXsZ11oaxthgSOk6nYvid/xrBxJtiQND2vqcG7IFTJTo1WNWIgFpBAHA3WIuK6IbfXMj
 OTV4kmBm6wwmjfJghCDlxEVUU5Gb6wW1b4M9hvHRgM487fF101mMEZCfvGiY/Vo0EUo+
 Rg4Q==
X-Gm-Message-State: AOAM530TlrZvNS5HI6wOz6du5gZEIzpe0VlH9UYmKwy/XVF9UlAgR++X
 Q8EQEhtbLB8MXDm5t25cm1VgdCKdATQN8TncTjOVig==
X-Google-Smtp-Source: ABdhPJyYKHiQLvqXkI2YGEBmFj7sP2Mhu/J3I/QsO2KEyB+uoKKUE+rlxE/wMVIKCQfL4v0bUJ5rSEq4Ec9qyLP2E/Y=
X-Received: by 2002:aca:5d05:: with SMTP id r5mr9981411oib.93.1606041227601;
 Sun, 22 Nov 2020 02:33:47 -0800 (PST)
MIME-Version: 1.0
References: <20201025131435.144-1-wangzhiqiang.bj@bytedance.com>
 <6793bb35-985c-be0f-bfb1-76017dafdd02@amsat.org>
In-Reply-To: <6793bb35-985c-be0f-bfb1-76017dafdd02@amsat.org>
From: John Wang <wangzhiqiang.bj@bytedance.com>
Date: Sun, 22 Nov 2020 18:33:36 +0800
Message-ID: <CAH0XSJvGLaY71D7PEfQpkXO-H3wsLsXWbHN8v4wH4g_AK8JgJw@mail.gmail.com>
Subject: Re: [Phishing Risk] [External] Re: [PATCH v3 1/2] hw/misc: add an
 EMC141{3,4} device model
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::242;
 envelope-from=wangzhiqiang.bj@bytedance.com; helo=mail-oi1-x242.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?B?6YOB6Zu3?= <yulei.sh@bytedance.com>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Lotus Xu <xuxiaohan@bytedance.com>, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Oct 26, 2020 at 5:08 AM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g> wrote:
>
> On 10/25/20 2:14 PM, John Wang wrote:
> > Largely inspired by the TMP421 temperature sensor, here is a model for
> > the EMC1413/EMC1414 temperature sensors.
> >
> > Specs can be found here :
> >    http://ww1.microchip.com/downloads/en/DeviceDoc/20005274A.pdf
> >
> > Signed-off-by: John Wang <wangzhiqiang.bj@bytedance.com>
> > ---
> > v3:
> >    - update the link to the spec
> >    - Rename emc1413.c to emc141x.c
> >    - Add sensors_count in EMC141XClass
> >    - Make emc1413_read/write easier to review :)
>
> Thanks for the update.
>
> > v2:
> >    - Remove DeviceInfo
> >    - commit message: TMP423 -> TMP421
> > ---
> >   hw/arm/Kconfig      |   1 +
> >   hw/misc/Kconfig     |   4 +
> >   hw/misc/emc141x.c   | 347 +++++++++++++++++++++++++++++++++++++++++++=
+
> >   hw/misc/meson.build |   1 +
> >   4 files changed, 353 insertions(+)
> >   create mode 100644 hw/misc/emc141x.c
> >
> > diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
> > index 7d040827af..3dd651a236 100644
> > --- a/hw/arm/Kconfig
> > +++ b/hw/arm/Kconfig
> > @@ -403,6 +403,7 @@ config ASPEED_SOC
> >       select SSI_M25P80
> >       select TMP105
> >       select TMP421
> > +    select EMC141X
> >       select UNIMP
> >
> >   config MPS2
> > diff --git a/hw/misc/Kconfig b/hw/misc/Kconfig
> > index 3185456110..169d087d3d 100644
> > --- a/hw/misc/Kconfig
> > +++ b/hw/misc/Kconfig
> > @@ -13,6 +13,10 @@ config TMP421
> >       bool
> >       depends on I2C
> >
> > +config EMC141X
> > +    bool
> > +    depends on I2C
> > +
> >   config ISA_DEBUG
> >       bool
> >       depends on ISA_BUS
> > diff --git a/hw/misc/emc141x.c b/hw/misc/emc141x.c
> > new file mode 100644
> > index 0000000000..a2bce74719
> > --- /dev/null
> > +++ b/hw/misc/emc141x.c
> > @@ -0,0 +1,347 @@
> > +/*
> > + * SMSC EMC141X temperature sensor.
> > + *
> > + * Copyright (c) 2020 Bytedance Corporation
> > + * Written by John Wang <wangzhiqiang.bj@bytedance.com>
> > + *
> > + * This program is free software; you can redistribute it and/or
> > + * modify it under the terms of the GNU General Public License as
> > + * published by the Free Software Foundation; either version 2 or
> > + * (at your option) version 3 of the License.
> > + *
> > + * This program is distributed in the hope that it will be useful,
> > + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> > + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> > + * GNU General Public License for more details.
> > + *
> > + * You should have received a copy of the GNU General Public License a=
long
> > + * with this program; if not, see <http://www.gnu.org/licenses/>.
> > + */
> > +
> > +#include "qemu/osdep.h"
> > +#include "hw/i2c/i2c.h"
> > +#include "migration/vmstate.h"
> > +#include "qapi/error.h"
> > +#include "qapi/visitor.h"
> > +#include "qemu/module.h"
> > +#include "qom/object.h"
> > +
> > +#define EMC1413_DEVICE_ID                0x21
> > +#define EMC1414_DEVICE_ID                0x25
> > +#define MANUFACTURER_ID                  0x5d
> > +#define REVISION                         0x04
> > +
> > +#define SENSORS_COUNT_MAX    4
> > +
> > +struct EMC141XState {
> > +    I2CSlave i2c;
>
> The QOM style name is 'parent_obj':
>
>         I2CSlave parent_obj;

will fix

>
> > +    uint8_t temperature[SENSORS_COUNT_MAX];
>
> What is the unit?
>
> > +    uint8_t min[SENSORS_COUNT_MAX];
> > +    uint8_t max[SENSORS_COUNT_MAX];
>
> min/max what? Temperature?
>
> What about (if the unit is milli Celsius):
>
>         struct {
>             uint8_t temp_min_mC;
>             uint8_t temp_current_mC;
>             uint8_t temp_max_mC;
>         } sensor[SENSORS_COUNT_MAX];
>
> Looking at the datasheet chapter 6.8 "Temperature Measurement
> Results  and  Data", it isn't in milli Celsius. See below in
> emc141x_get_temperature().
>
> So maybe:
>
>         struct {
>             uint8_t raw_temp_min;
>             uint8_t raw_temp_current;
>             uint8_t raw_temp_max;
>         } sensor[SENSORS_COUNT_MAX];

will fix

>
> > +    uint8_t len;
> > +    uint8_t data;
> > +    uint8_t pointer;
> > +};
> > +
> > +struct EMC141XClass {
> > +    I2CSlaveClass parent_class;
> > +    uint8_t model;
> > +    unsigned sensors_count;
> > +};
> > +
> > +#define TYPE_EMC141X "emc141x"
> > +OBJECT_DECLARE_TYPE(EMC141XState, EMC141XClass, EMC141X)
> > +
> > +
> > +/* the EMC141X registers */
> > +#define EMC141X_TEMP_HIGH0               0x00
> > +#define EMC141X_TEMP_HIGH1               0x01
> > +#define EMC141X_TEMP_HIGH2               0x23
> > +#define EMC141X_TEMP_HIGH3               0x2a
> > +#define EMC141X_TEMP_MAX_HIGH0           0x05
> > +#define EMC141X_TEMP_MIN_HIGH0           0x06
> > +#define EMC141X_TEMP_MAX_HIGH1           0x07
> > +#define EMC141X_TEMP_MIN_HIGH1           0x08
> > +#define EMC141X_TEMP_MAX_HIGH2           0x15
> > +#define EMC141X_TEMP_MIN_HIGH2           0x16
> > +#define EMC141X_TEMP_MAX_HIGH3           0x2c
> > +#define EMC141X_TEMP_MIN_HIGH3           0x2d
> > +#define EMC141X_DEVICE_ID                0xfd
> > +#define EMC141X_MANUFACTURER_ID          0xfe
> > +#define EMC141X_REVISION                 0xff
> > +
> > +static void emc141x_get_temperature(Object *obj, Visitor *v, const cha=
r *name,
> > +                                   void *opaque, Error **errp)
>
> Nitpicking, align is off ;)

will fix ;)

>
> > +{
> > +    EMC141XState *s =3D EMC141X(obj);
> > +    EMC141XClass *sc =3D EMC141X_GET_CLASS(s);
> > +    int64_t value;
> > +    int tempid;
>
> Shouldn't it be unsigned?

yep=EF=BC=8C changed it to unsigned

>
> > +
> > +    if (sscanf(name, "temperature%d", &tempid) !=3D 1) {
>
> Format doesn't match. Using 'unsigned' is probably easier (%u).
>
> > +        error_setg(errp, "error reading %s: %s", name, g_strerror(errn=
o));
> > +        return;
> > +    }
> > +
> > +    if (tempid >=3D sc->sensors_count || tempid < 0) {
> > +        error_setg(errp, "error reading %s", name);
> > +        return;
> > +    }
> > +
> > +    value =3D s->temperature[tempid] * 1000;
>
> This is not what is described in "Table 6.2: Temperature Data Format",
> there is an offset and a step multiplier.

The EMC1413/1414 has two selectable temperature ranges. we use the
default one 0 - 127.
as described in Table 7.2

Reg 00(TEMP_HIGH0)  represents 0-127
Reg 29(TEMP_LOW0) represents 0 - 7/8(0.875)

I think we could care less about low-bit registers, and linux drivers
don't care either.
https://github.com/openbmc/linux/blob/dev-5.8/drivers/hwmon/emc1403.c#L43-L=
46

> Which makes me wonder how are you testing this?

I tested it under openbmc/linux.

1. with "aspeed: Add support for the g220a-bmc board" =EF=BC=8Cbuild the qe=
mu
2.  cd /sys/class/hwmon/hwmon2
3  cat temp1_input cat temp1_max  cat temp2_input .... saw that all
values are expected.

> We have very simple tests for the TMP105, see tests/qtest/tmp105-test.c,
> please add a similar test.

will add the UT.

>
> > +
> > +    visit_type_int(v, name, &value, errp);
> > +}
> > +
> ...

