Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CA0F489E33
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Jan 2022 18:17:09 +0100 (CET)
Received: from localhost ([::1]:53124 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6yI8-0004Wg-38
	for lists+qemu-devel@lfdr.de; Mon, 10 Jan 2022 12:17:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40328)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <venture@google.com>)
 id 1n6yFa-0002WL-CL
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 12:14:30 -0500
Received: from [2607:f8b0:4864:20::92d] (port=34689
 helo=mail-ua1-x92d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <venture@google.com>)
 id 1n6yFW-0000RN-FY
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 12:14:29 -0500
Received: by mail-ua1-x92d.google.com with SMTP id y4so24737548uad.1
 for <qemu-devel@nongnu.org>; Mon, 10 Jan 2022 09:14:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=BZ2LeuzZ+Sc//YBRkaz2F19rRJOBCdVUTpxs3gHz0RE=;
 b=W6I/0ZKVNkv/IcFJi1tV3rEmHHs6fRzJXVbGqp8cSSBCryYuyYU7rFpFnVWJ7AWHw6
 SCMQ8jpg/kWJouetAZ5OQPxdnHl6FLRQmpWxW0hB/YHXUDsi3Bj5cigqnGlNzOMJWIh4
 ICz2sRQwCduR/PYH1eYmjneAJH2BLgrM46QVDS2WGH0bN2kSnWhKT+JHhtBramQtOcLs
 wf+MCqxShee7H5f2wpPOkWmZQ66aLcEGmkCm9uzbt1v0/zmUJ+jupqJ7+BZ05WE/DMJ5
 VzRAGdcM83u7OhGqfn8Sq5dR8p0zmmOpRgeIUWxSc8rsEzv0QMtEERyPE2SxoWj10rFI
 8FhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BZ2LeuzZ+Sc//YBRkaz2F19rRJOBCdVUTpxs3gHz0RE=;
 b=u285DAF1b9SxANEJqmO28hRF6foQyiulZpmhxuPcqenfKXvykg7lNRcnUKNEQIDjcq
 w2WMRwcCm9K4rzjVAAsSn/seSmeIpk0D1mFKbIcjxHQwvKoWEPYrb4dkX7h0MgUG0+g4
 SparJULYwTrm2PxMIHmqz+Pr1d9yfyTHrSP69wWZYer234CESMAnm4bm4QqsThCXt2JI
 /wbOuNZ08cAyhThL//47Y5kawTYxZBCZjUAnezVn8oocbxqQQJs1lYDvAnfJQeZKAZls
 PlSaac7TXmLcfC8rkAzx9mN6IdNntVJ9g3Tpe9NOYrrsecLjsch+mTlR579Vmrw5UWvB
 sqvA==
X-Gm-Message-State: AOAM53346SFx/0r4d91RlgmX9X1VtO1QE4pDmQ5FCAAk/9YKtcJ7sZXd
 cccYqDEYLP5Br+HemlzgjgSObfGLQlhm00iAvgxRHA==
X-Google-Smtp-Source: ABdhPJy49hQHm+kZauQA0v8OUbr1Fejf6OsDA08tEOq+Wz5NhPpDG9WZukjuwgKSq3Uwxd0yqPCq2EfdummUwkpficI=
X-Received: by 2002:a05:6130:30c:: with SMTP id
 ay12mr340311uab.15.1641834865107; 
 Mon, 10 Jan 2022 09:14:25 -0800 (PST)
MIME-Version: 1.0
References: <20220108030451.3867815-1-venture@google.com>
 <eaea55f9-71f8-4810-70a7-63aadf252f20@amsat.org>
In-Reply-To: <eaea55f9-71f8-4810-70a7-63aadf252f20@amsat.org>
From: Patrick Venture <venture@google.com>
Date: Mon, 10 Jan 2022 09:14:14 -0800
Message-ID: <CAO=notwnL9WB_M-bZ+S-+5ruf5cm6Gyh9AEvN66owuyLWbsfRQ@mail.gmail.com>
Subject: Re: [PATCH] hw/sensor: Add SB-TSI Temperature Sensor Interface
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Cc: Thomas Huth <thuth@redhat.com>, lvivier@redhat.com, 
 Paolo Bonzini <pbonzini@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>, 
 Hao Wu <wuhaotsh@google.com>, Doug Evans <dje@google.com>,
 Corey Minyard <minyard@acm.org>
Content-Type: multipart/alternative; boundary="000000000000ea978605d53d77f9"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::92d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::92d;
 envelope-from=venture@google.com; helo=mail-ua1-x92d.google.com
X-Spam_score_int: -167
X-Spam_score: -16.8
X-Spam_bar: ----------------
X-Spam_report: (-16.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=no autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000ea978605d53d77f9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 10, 2022 at 1:35 AM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g>
wrote:

> Hi Patrick,
>
> On 1/8/22 04:04, Patrick Venture wrote:
> > From: Hao Wu <wuhaotsh@google.com>
> >
> > SB Temperature Sensor Interface (SB-TSI) is an SMBus compatible
> > interface that reports AMD SoC's Ttcl (normalized temperature),
> > and resembles a typical 8-pin remote temperature sensor's I2C interface
> > to BMC.
> >
> > This patch implements a basic AMD SB-TSI sensor that is
> > compatible with the open-source data sheet from AMD and Linux
> > kernel driver.
> >
> > Reference:
> > Linux kernel driver:
> > https://lkml.org/lkml/2020/12/11/968
> > Register Map:
> > https://developer.amd.com/wp-content/resources/56255_3_03.PDF
> > (Chapter 6)
> >
> > Signed-off-by: Hao Wu <wuhaotsh@google.com>
> > Reviewed-by: Doug Evans <dje@google.com>
> > ---
> >  hw/sensor/Kconfig            |   4 +
> >  hw/sensor/meson.build        |   1 +
> >  hw/sensor/tmp_sbtsi.c        | 393 +++++++++++++++++++++++++++++++++++
> >  hw/sensor/trace-events       |   5 +
> >  hw/sensor/trace.h            |   1 +
> >  meson.build                  |   1 +
>
> >  tests/qtest/meson.build      |   1 +
> >  tests/qtest/tmp_sbtsi-test.c | 180 ++++++++++++++++
>
> Up to Thomas for qtest, but I'd rather split in 2 patches since
> different set of maintainers / reviewers.
>
> > +++ b/hw/sensor/tmp_sbtsi.c
> > @@ -0,0 +1,393 @@
> > +/*
> > + * AMD SBI Temperature Sensor Interface (SB-TSI)
> > + *
> > + * Copyright 2021 Google LLC
> > + *
> > + * This program is free software; you can redistribute it and/or modif=
y
> it
> > + * under the terms of the GNU General Public License as published by t=
he
> > + * Free Software Foundation; either version 2 of the License, or
> > + * (at your option) any later version.
> > + *
> > + * This program is distributed in the hope that it will be useful, but
> WITHOUT
> > + * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY =
or
> > + * FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public Licens=
e
> > + * for more details.
> > + */
> > +
> > +#include "qemu/osdep.h"
> > +#include "hw/i2c/smbus_slave.h"
> > +#include "hw/irq.h"
> > +#include "migration/vmstate.h"
> > +#include "qapi/error.h"
> > +#include "qapi/visitor.h"
> > +#include "qemu/log.h"
> > +#include "qemu/module.h"
> > +#include "trace.h"
> > +
> > +#define TYPE_SBTSI "sbtsi"
>
> If you add include/hw/sensor/sbtsi.h, please define the type there, ...
>
> > +/*
> > + * SB-TSI registers only support SMBus byte data access. "_INT"
> registers are
> > + * the integer part of a temperature value or limit, and "_DEC"
> registers are
> > + * corresponding decimal parts.
> > + */
> > +#define SBTSI_REG_TEMP_INT      0x01 /* RO */
> > +#define SBTSI_REG_STATUS        0x02 /* RO */
> > +#define SBTSI_REG_CONFIG        0x03 /* RO */
> > +#define SBTSI_REG_TEMP_HIGH_INT 0x07 /* RW */
> > +#define SBTSI_REG_TEMP_LOW_INT  0x08 /* RW */
> > +#define SBTSI_REG_CONFIG_WR     0x09 /* RW */
> > +#define SBTSI_REG_TEMP_DEC      0x10 /* RO */
> > +#define SBTSI_REG_TEMP_HIGH_DEC 0x13 /* RW */
> > +#define SBTSI_REG_TEMP_LOW_DEC  0x14 /* RW */
> > +#define SBTSI_REG_ALERT_CONFIG  0xBF /* RW */
> > +#define SBTSI_REG_MAN           0xFE /* RO */
> > +#define SBTSI_REG_REV           0xFF /* RO */
> > +
> > +#define SBTSI_STATUS_HIGH_ALERT BIT(4)
> > +#define SBTSI_STATUS_LOW_ALERT  BIT(3)
> > +#define SBTSI_CONFIG_ALERT_MASK BIT(7)
> > +#define SBTSI_ALARM_EN          BIT(0)
>
> beside these definitions can be share with qtests.
>
> > +/* The temperature we stored are in units of 0.125 degrees. */
> > +#define SBTSI_TEMP_UNIT_IN_MILLIDEGREE 125
> > +
> > +/*
> > + * The integer part and decimal of the temperature both 8 bits.
> > + * Only the top 3 bits of the decimal parts are used.
> > + * So the max temperature is (2^8-1) + (2^3-1)/8 =3D 255.875 degrees.
> > + */
> > +#define SBTSI_TEMP_MAX 255875
>
> Nitpicking, use _IN_MILLIDEGREE suffix?
>

I haven't seen this suffix before, is this a style you'd like to start
seeing?


>
> > +static void sbtsi_init(Object *obj)
> > +{
> > +    SBTSIState *s =3D SBTSI(obj);
> > +
> > +    /* Current temperature in millidegrees. */
> > +    object_property_add(obj, "temperature", "uint32",
>
> Can we explicit as "temperature_uC"?
>

We can, but that's non-standard.  As I recall most temperature sensors in
hw/sensors are in millidegrees, but none have unit suffixes.


>
> > +                        sbtsi_get_temperature, sbtsi_set_temperature,
> > +                        NULL, NULL);
> > +    qdev_init_gpio_out_named(DEVICE(obj), &s->alarm, SBTSI_ALARM_L, 0)=
;
> > +}
> > +
> > +static void sbtsi_class_init(ObjectClass *klass, void *data)
> > +{
> > +    ResettableClass *rc =3D RESETTABLE_CLASS(klass);
> > +    DeviceClass *dc =3D DEVICE_CLASS(klass);
> > +    SMBusDeviceClass *k =3D SMBUS_DEVICE_CLASS(klass);
> > +
> > +    dc->desc =3D "SB-TSI Temperature Sensor";
> > +    dc->vmsd =3D &vmstate_sbtsi;
> > +    k->write_data =3D sbtsi_write_data;
> > +    k->receive_byte =3D sbtsi_read_byte;
> > +    rc->phases.enter =3D sbtsi_enter_reset;
> > +    rc->phases.hold =3D sbtsi_hold_reset;
>
> If my previous patch [*] were in, I'd have asked for:
>
>        set_bit(DEVICE_CATEGORY_SENSOR, dc->categories);
>
> But since it isn't, I'll keep an eye on which goes in first.
>
> [*] https://www.mail-archive.com/qemu-devel@nongnu.org/msg847088.html
>
> > diff --git a/tests/qtest/tmp_sbtsi-test.c b/tests/qtest/tmp_sbtsi-test.=
c
> > new file mode 100644
> > index 0000000000..7f5fafacc7
> > --- /dev/null
> > +++ b/tests/qtest/tmp_sbtsi-test.c
> > @@ -0,0 +1,180 @@
> > +/*
> > + * QTests for the SBTSI temperature sensor
> > + *
> > + * Copyright 2020 Google LLC
> > + *
> > + * This program is free software; you can redistribute it and/or modif=
y
> it
> > + * under the terms of the GNU General Public License as published by t=
he
> > + * Free Software Foundation; either version 2 of the License, or
> > + * (at your option) any later version.
> > + *
> > + * This program is distributed in the hope that it will be useful, but
> WITHOUT
> > + * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY =
or
> > + * FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public Licens=
e
> > + * for more details.
> > + */
> > +
> > +#include "qemu/osdep.h"
> > +
> > +#include "libqtest-single.h"
> > +#include "libqos/qgraph.h"
> > +#include "libqos/i2c.h"
> > +#include "qapi/qmp/qdict.h"
> > +#include "qemu/bitops.h"
> > +
> > +#define TEST_ID   "sbtsi-test"
> > +#define TEST_ADDR (0x4c)
> > +
> > +/*
> > + * SB-TSI registers only support SMBus byte data access. "_INT"
> registers are
> > + * the integer part of a temperature value or limit, and "_DEC"
> registers are
> > + * corresponding decimal parts.
> > + */
> > +#define REG_TEMP_INT      0x01 /* RO */
> > +#define REG_STATUS        0x02 /* RO */
> > +#define REG_CONFIG        0x03 /* RO */
> > +#define REG_TEMP_HIGH_INT 0x07 /* RW */
> > +#define REG_TEMP_LOW_INT  0x08 /* RW */
> > +#define REG_CONFIG_WR     0x09 /* RW */
> > +#define REG_TEMP_DEC      0x10 /* RO */
> > +#define REG_TEMP_HIGH_DEC 0x13 /* RW */
> > +#define REG_TEMP_LOW_DEC  0x14 /* RW */
> > +#define REG_ALERT_CONFIG  0xBF /* RW */
> > +
> > +#define STATUS_HIGH_ALERT BIT(4)
> > +#define STATUS_LOW_ALERT  BIT(3)
> > +#define CONFIG_ALERT_MASK BIT(7)
> > +#define ALARM_EN          BIT(0)
>
> This is the part that could be shared in "include/hw/sensor/sbtsi.h".
>

Ack.


>
> > +/* The temperature stored are in units of 0.125 degrees. */
> > +#define TEMP_UNIT_IN_MILLIDEGREE 125
> > +#define LIMIT_LOW (10500)
> > +#define LIMIT_HIGH (55125)
>
> Nitpicking again, _IN_MILLIDEGREE suffix for coherency?
>
> > +static uint32_t qmp_sbtsi_get_temperature(const char *id)
> > +{
> > +    QDict *response;
> > +    int ret;
> > +
> > +    response =3D qmp("{ 'execute': 'qom-get', 'arguments': { 'path': %=
s, "
> > +                   "'property': 'temperature' } }", id);
>
> If renamed earlier, here 'temperature_uC'.
>
> > +    g_assert(qdict_haskey(response, "return"));
> > +    ret =3D (uint32_t)qdict_get_int(response, "return");
> > +    qobject_unref(response);
> > +    return ret;
> > +}
> > +
> > +static void qmp_sbtsi_set_temperature(const char *id, uint32_t value)
> > +{
> > +    QDict *response;
> > +
> > +    response =3D qmp("{ 'execute': 'qom-set', 'arguments': { 'path': %=
s, "
> > +                   "'property': 'temperature', 'value': %d } }", id,
> value);
> > +    g_assert(qdict_haskey(response, "return"));
> > +    qobject_unref(response);
> > +}
>
> Thanks,
>
> Phil.
>

v2 will come with the header split.  I can split the qtests into a separate
patch.  Was your point because the patches are applied to different staging
trees?  Because I would think it ideal to have the qtests and the
corresponding code applied together so that it's easy to know it's
working.  If this isn't standard, I can definitely split them.

Patrick

--000000000000ea978605d53d77f9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, Jan 10, 2022 at 1:35 AM Phili=
ppe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:f4bug@amsat.org">f4bug@amsat.o=
rg</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">Hi Patrick,<br>
<br>
On 1/8/22 04:04, Patrick Venture wrote:<br>
&gt; From: Hao Wu &lt;<a href=3D"mailto:wuhaotsh@google.com" target=3D"_bla=
nk">wuhaotsh@google.com</a>&gt;<br>
&gt; <br>
&gt; SB Temperature Sensor Interface (SB-TSI) is an SMBus compatible<br>
&gt; interface that reports AMD SoC&#39;s Ttcl (normalized temperature),<br=
>
&gt; and resembles a typical 8-pin remote temperature sensor&#39;s I2C inte=
rface<br>
&gt; to BMC.<br>
&gt; <br>
&gt; This patch implements a basic AMD SB-TSI sensor that is<br>
&gt; compatible with the open-source data sheet from AMD and Linux<br>
&gt; kernel driver.<br>
&gt; <br>
&gt; Reference:<br>
&gt; Linux kernel driver:<br>
&gt; <a href=3D"https://lkml.org/lkml/2020/12/11/968" rel=3D"noreferrer" ta=
rget=3D"_blank">https://lkml.org/lkml/2020/12/11/968</a><br>
&gt; Register Map:<br>
&gt; <a href=3D"https://developer.amd.com/wp-content/resources/56255_3_03.P=
DF" rel=3D"noreferrer" target=3D"_blank">https://developer.amd.com/wp-conte=
nt/resources/56255_3_03.PDF</a><br>
&gt; (Chapter 6)<br>
&gt; <br>
&gt; Signed-off-by: Hao Wu &lt;<a href=3D"mailto:wuhaotsh@google.com" targe=
t=3D"_blank">wuhaotsh@google.com</a>&gt;<br>
&gt; Reviewed-by: Doug Evans &lt;<a href=3D"mailto:dje@google.com" target=
=3D"_blank">dje@google.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 hw/sensor/Kconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=
=A0 =C2=A04 +<br>
&gt;=C2=A0 hw/sensor/meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A01=
 +<br>
&gt;=C2=A0 hw/sensor/tmp_sbtsi.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 393 +++++++++=
++++++++++++++++++++++++++<br>
&gt;=C2=A0 hw/sensor/trace-events=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A05=
 +<br>
&gt;=C2=A0 hw/sensor/trace.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=
=A0 =C2=A01 +<br>
&gt;=C2=A0 meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 |=C2=A0 =C2=A01 +<br>
<br>
&gt;=C2=A0 tests/qtest/meson.build=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A01 +<br=
>
&gt;=C2=A0 tests/qtest/tmp_sbtsi-test.c | 180 ++++++++++++++++<br>
<br>
Up to Thomas for qtest, but I&#39;d rather split in 2 patches since<br>
different set of maintainers / reviewers.<br>
<br>
&gt; +++ b/hw/sensor/tmp_sbtsi.c<br>
&gt; @@ -0,0 +1,393 @@<br>
&gt; +/*<br>
&gt; + * AMD SBI Temperature Sensor Interface (SB-TSI)<br>
&gt; + *<br>
&gt; + * Copyright 2021 Google LLC<br>
&gt; + *<br>
&gt; + * This program is free software; you can redistribute it and/or modi=
fy it<br>
&gt; + * under the terms of the GNU General Public License as published by =
the<br>
&gt; + * Free Software Foundation; either version 2 of the License, or<br>
&gt; + * (at your option) any later version.<br>
&gt; + *<br>
&gt; + * This program is distributed in the hope that it will be useful, bu=
t WITHOUT<br>
&gt; + * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY=
 or<br>
&gt; + * FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public Licen=
se<br>
&gt; + * for more details.<br>
&gt; + */<br>
&gt; +<br>
&gt; +#include &quot;qemu/osdep.h&quot;<br>
&gt; +#include &quot;hw/i2c/smbus_slave.h&quot;<br>
&gt; +#include &quot;hw/irq.h&quot;<br>
&gt; +#include &quot;migration/vmstate.h&quot;<br>
&gt; +#include &quot;qapi/error.h&quot;<br>
&gt; +#include &quot;qapi/visitor.h&quot;<br>
&gt; +#include &quot;qemu/log.h&quot;<br>
&gt; +#include &quot;qemu/module.h&quot;<br>
&gt; +#include &quot;trace.h&quot;<br>
&gt; +<br>
&gt; +#define TYPE_SBTSI &quot;sbtsi&quot;<br>
<br>
If you add include/hw/sensor/sbtsi.h, please define the type there, ...<br>
<br>
&gt; +/*<br>
&gt; + * SB-TSI registers only support SMBus byte data access. &quot;_INT&q=
uot; registers are<br>
&gt; + * the integer part of a temperature value or limit, and &quot;_DEC&q=
uot; registers are<br>
&gt; + * corresponding decimal parts.<br>
&gt; + */<br>
&gt; +#define SBTSI_REG_TEMP_INT=C2=A0 =C2=A0 =C2=A0 0x01 /* RO */<br>
&gt; +#define SBTSI_REG_STATUS=C2=A0 =C2=A0 =C2=A0 =C2=A0 0x02 /* RO */<br>
&gt; +#define SBTSI_REG_CONFIG=C2=A0 =C2=A0 =C2=A0 =C2=A0 0x03 /* RO */<br>
&gt; +#define SBTSI_REG_TEMP_HIGH_INT 0x07 /* RW */<br>
&gt; +#define SBTSI_REG_TEMP_LOW_INT=C2=A0 0x08 /* RW */<br>
&gt; +#define SBTSI_REG_CONFIG_WR=C2=A0 =C2=A0 =C2=A00x09 /* RW */<br>
&gt; +#define SBTSI_REG_TEMP_DEC=C2=A0 =C2=A0 =C2=A0 0x10 /* RO */<br>
&gt; +#define SBTSI_REG_TEMP_HIGH_DEC 0x13 /* RW */<br>
&gt; +#define SBTSI_REG_TEMP_LOW_DEC=C2=A0 0x14 /* RW */<br>
&gt; +#define SBTSI_REG_ALERT_CONFIG=C2=A0 0xBF /* RW */<br>
&gt; +#define SBTSI_REG_MAN=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00xFE /*=
 RO */<br>
&gt; +#define SBTSI_REG_REV=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00xFF /*=
 RO */<br>
&gt; +<br>
&gt; +#define SBTSI_STATUS_HIGH_ALERT BIT(4)<br>
&gt; +#define SBTSI_STATUS_LOW_ALERT=C2=A0 BIT(3)<br>
&gt; +#define SBTSI_CONFIG_ALERT_MASK BIT(7)<br>
&gt; +#define SBTSI_ALARM_EN=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 BIT(0)<br>
<br>
beside these definitions can be share with qtests.<br>
<br>
&gt; +/* The temperature we stored are in units of 0.125 degrees. */<br>
&gt; +#define SBTSI_TEMP_UNIT_IN_MILLIDEGREE 125<br>
&gt; +<br>
&gt; +/*<br>
&gt; + * The integer part and decimal of the temperature both 8 bits.<br>
&gt; + * Only the top 3 bits of the decimal parts are used.<br>
&gt; + * So the max temperature is (2^8-1) + (2^3-1)/8 =3D 255.875 degrees.=
<br>
&gt; + */<br>
&gt; +#define SBTSI_TEMP_MAX 255875<br>
<br>
Nitpicking, use _IN_MILLIDEGREE suffix?<br></blockquote><div><br></div><div=
>I haven&#39;t seen this suffix before, is this a style you&#39;d like to s=
tart seeing?</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
<br>
&gt; +static void sbtsi_init(Object *obj)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 SBTSIState *s =3D SBTSI(obj);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 /* Current temperature in millidegrees. */<br>
&gt; +=C2=A0 =C2=A0 object_property_add(obj, &quot;temperature&quot;, &quot=
;uint32&quot;,<br>
<br>
Can we explicit as &quot;temperature_uC&quot;?<br></blockquote><div><br></d=
iv><div>We can, but that&#39;s non-standard.=C2=A0 As I recall most tempera=
ture sensors in hw/sensors are in millidegrees, but none have unit suffixes=
.</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 sbtsi_get_temperature, sbtsi_set_temperature,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 NULL, NULL);<br>
&gt; +=C2=A0 =C2=A0 qdev_init_gpio_out_named(DEVICE(obj), &amp;s-&gt;alarm,=
 SBTSI_ALARM_L, 0);<br>
&gt; +}<br>
&gt; +<br>
&gt; +static void sbtsi_class_init(ObjectClass *klass, void *data)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 ResettableClass *rc =3D RESETTABLE_CLASS(klass);<br>
&gt; +=C2=A0 =C2=A0 DeviceClass *dc =3D DEVICE_CLASS(klass);<br>
&gt; +=C2=A0 =C2=A0 SMBusDeviceClass *k =3D SMBUS_DEVICE_CLASS(klass);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 dc-&gt;desc =3D &quot;SB-TSI Temperature Sensor&quot;;<=
br>
&gt; +=C2=A0 =C2=A0 dc-&gt;vmsd =3D &amp;vmstate_sbtsi;<br>
&gt; +=C2=A0 =C2=A0 k-&gt;write_data =3D sbtsi_write_data;<br>
&gt; +=C2=A0 =C2=A0 k-&gt;receive_byte =3D sbtsi_read_byte;<br>
&gt; +=C2=A0 =C2=A0 rc-&gt;phases.enter =3D sbtsi_enter_reset;<br>
&gt; +=C2=A0 =C2=A0 rc-&gt;phases.hold =3D sbtsi_hold_reset;<br>
<br>
If my previous patch [*] were in, I&#39;d have asked for:<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0set_bit(DEVICE_CATEGORY_SENSOR, dc-&gt;categorie=
s);<br>
<br>
But since it isn&#39;t, I&#39;ll keep an eye on which goes in first.<br>
<br>
[*] <a href=3D"https://www.mail-archive.com/qemu-devel@nongnu.org/msg847088=
.html" rel=3D"noreferrer" target=3D"_blank">https://www.mail-archive.com/qe=
mu-devel@nongnu.org/msg847088.html</a><br>
<br>
&gt; diff --git a/tests/qtest/tmp_sbtsi-test.c b/tests/qtest/tmp_sbtsi-test=
.c<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..7f5fafacc7<br>
&gt; --- /dev/null<br>
&gt; +++ b/tests/qtest/tmp_sbtsi-test.c<br>
&gt; @@ -0,0 +1,180 @@<br>
&gt; +/*<br>
&gt; + * QTests for the SBTSI temperature sensor<br>
&gt; + *<br>
&gt; + * Copyright 2020 Google LLC<br>
&gt; + *<br>
&gt; + * This program is free software; you can redistribute it and/or modi=
fy it<br>
&gt; + * under the terms of the GNU General Public License as published by =
the<br>
&gt; + * Free Software Foundation; either version 2 of the License, or<br>
&gt; + * (at your option) any later version.<br>
&gt; + *<br>
&gt; + * This program is distributed in the hope that it will be useful, bu=
t WITHOUT<br>
&gt; + * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY=
 or<br>
&gt; + * FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public Licen=
se<br>
&gt; + * for more details.<br>
&gt; + */<br>
&gt; +<br>
&gt; +#include &quot;qemu/osdep.h&quot;<br>
&gt; +<br>
&gt; +#include &quot;libqtest-single.h&quot;<br>
&gt; +#include &quot;libqos/qgraph.h&quot;<br>
&gt; +#include &quot;libqos/i2c.h&quot;<br>
&gt; +#include &quot;qapi/qmp/qdict.h&quot;<br>
&gt; +#include &quot;qemu/bitops.h&quot;<br>
&gt; +<br>
&gt; +#define TEST_ID=C2=A0 =C2=A0&quot;sbtsi-test&quot;<br>
&gt; +#define TEST_ADDR (0x4c)<br>
&gt; +<br>
&gt; +/*<br>
&gt; + * SB-TSI registers only support SMBus byte data access. &quot;_INT&q=
uot; registers are<br>
&gt; + * the integer part of a temperature value or limit, and &quot;_DEC&q=
uot; registers are<br>
&gt; + * corresponding decimal parts.<br>
&gt; + */<br>
&gt; +#define REG_TEMP_INT=C2=A0 =C2=A0 =C2=A0 0x01 /* RO */<br>
&gt; +#define REG_STATUS=C2=A0 =C2=A0 =C2=A0 =C2=A0 0x02 /* RO */<br>
&gt; +#define REG_CONFIG=C2=A0 =C2=A0 =C2=A0 =C2=A0 0x03 /* RO */<br>
&gt; +#define REG_TEMP_HIGH_INT 0x07 /* RW */<br>
&gt; +#define REG_TEMP_LOW_INT=C2=A0 0x08 /* RW */<br>
&gt; +#define REG_CONFIG_WR=C2=A0 =C2=A0 =C2=A00x09 /* RW */<br>
&gt; +#define REG_TEMP_DEC=C2=A0 =C2=A0 =C2=A0 0x10 /* RO */<br>
&gt; +#define REG_TEMP_HIGH_DEC 0x13 /* RW */<br>
&gt; +#define REG_TEMP_LOW_DEC=C2=A0 0x14 /* RW */<br>
&gt; +#define REG_ALERT_CONFIG=C2=A0 0xBF /* RW */<br>
&gt; +<br>
&gt; +#define STATUS_HIGH_ALERT BIT(4)<br>
&gt; +#define STATUS_LOW_ALERT=C2=A0 BIT(3)<br>
&gt; +#define CONFIG_ALERT_MASK BIT(7)<br>
&gt; +#define ALARM_EN=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 BIT(0)<br>
<br>
This is the part that could be shared in &quot;include/hw/sensor/sbtsi.h&qu=
ot;.<br></blockquote><div><br></div><div>Ack.</div><div>=C2=A0</div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1p=
x solid rgb(204,204,204);padding-left:1ex">
<br>
&gt; +/* The temperature stored are in units of 0.125 degrees. */<br>
&gt; +#define TEMP_UNIT_IN_MILLIDEGREE 125<br>
&gt; +#define LIMIT_LOW (10500)<br>
&gt; +#define LIMIT_HIGH (55125)<br>
<br>
Nitpicking again, _IN_MILLIDEGREE suffix for coherency?<br>
<br>
&gt; +static uint32_t qmp_sbtsi_get_temperature(const char *id)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 QDict *response;<br>
&gt; +=C2=A0 =C2=A0 int ret;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 response =3D qmp(&quot;{ &#39;execute&#39;: &#39;qom-ge=
t&#39;, &#39;arguments&#39;: { &#39;path&#39;: %s, &quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
&quot;&#39;property&#39;: &#39;temperature&#39; } }&quot;, id);<br>
<br>
If renamed earlier, here &#39;temperature_uC&#39;.<br>
<br>
&gt; +=C2=A0 =C2=A0 g_assert(qdict_haskey(response, &quot;return&quot;));<b=
r>
&gt; +=C2=A0 =C2=A0 ret =3D (uint32_t)qdict_get_int(response, &quot;return&=
quot;);<br>
&gt; +=C2=A0 =C2=A0 qobject_unref(response);<br>
&gt; +=C2=A0 =C2=A0 return ret;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static void qmp_sbtsi_set_temperature(const char *id, uint32_t value)=
<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 QDict *response;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 response =3D qmp(&quot;{ &#39;execute&#39;: &#39;qom-se=
t&#39;, &#39;arguments&#39;: { &#39;path&#39;: %s, &quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
&quot;&#39;property&#39;: &#39;temperature&#39;, &#39;value&#39;: %d } }&qu=
ot;, id, value);<br>
&gt; +=C2=A0 =C2=A0 g_assert(qdict_haskey(response, &quot;return&quot;));<b=
r>
&gt; +=C2=A0 =C2=A0 qobject_unref(response);<br>
&gt; +}<br>
<br>
Thanks,<br>
<br>
Phil.<br></blockquote><div><br></div><div>v2 will come with the header spli=
t.=C2=A0 I can split the qtests into a separate patch.=C2=A0 Was your point=
 because the patches are applied to different staging trees?=C2=A0 Because =
I would think it ideal to have the qtests and the corresponding code applie=
d together so that it&#39;s easy to know it&#39;s working.=C2=A0 If this is=
n&#39;t standard, I can definitely split them.</div><div><br></div><div>Pat=
rick=C2=A0</div></div></div>

--000000000000ea978605d53d77f9--

