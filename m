Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B262548A051
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Jan 2022 20:43:24 +0100 (CET)
Received: from localhost ([::1]:46494 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n70Zf-0002OA-QS
	for lists+qemu-devel@lfdr.de; Mon, 10 Jan 2022 14:43:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50782)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <venture@google.com>)
 id 1n70Xt-0001ee-Fj
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 14:41:34 -0500
Received: from [2607:f8b0:4864:20::933] (port=40646
 helo=mail-ua1-x933.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <venture@google.com>)
 id 1n70Xp-0000b6-Gl
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 14:41:32 -0500
Received: by mail-ua1-x933.google.com with SMTP id v12so25500759uar.7
 for <qemu-devel@nongnu.org>; Mon, 10 Jan 2022 11:41:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GqP/su/beT1urQyWA9UIp6KGtWIPbkfSKywXVWNIal4=;
 b=S/RoeBfBkeXKBZScVfFsaki/+nKjHHCvKHNVxrUoKVB0uE09EmnYmK/5piVKyqT/+I
 KZMT96KiLKs5BZxm8Vi2qGwn2NMS2IQtjSzV70WtpHIBD7RcJdO+LzFs+uMqVxnWXyVW
 NcsJ/oc/T3ZVQuGpSUTe95WsBNO5BBYecRQh7Vy2RucG7ogAbRlOfcEp2pgbbeu8CbSy
 R/pzdvNciFVhk4OpkrxTGAlCEzX0EiIkbfPuPrERDV5ZqqimEcPZxA6Nfql/MEv18Wam
 MN8K0/fbZDiTTxz6aZq5fRkC75Dp+68tbUhnroufIUAocIc1vOsWP7Ch9cS3ROmZltB9
 Ot2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GqP/su/beT1urQyWA9UIp6KGtWIPbkfSKywXVWNIal4=;
 b=0DuWvknmdd9CImv31HL7AEjru6NR1alzqVXYv1M7GuTDjCEF+7TL50E2XeUhGgF5UY
 Ky+0hgPHVxutKMeHRI5Kkant3Wdcato2E62FwHFoBZqJV51J+RrPGaMtjPeUFgv17xEV
 IXUmAPznAYAlP7t6EWUK87SthtC/KL2xE0l/DbPWmwy9tOLhl8Zql+JybLj7tbGdaMTl
 QdxT4SKUZgyL35+eu3fCnVi8kVP1orR7BKgwpRLg/yM5NBVfgViQs9uOaD7pDzrIPCfd
 qVK5N23oWkAkAJze6kQm5/TmTvwfd6wfa/kk+rIquS603Apk5348OZUUmxKOmGfR4kAq
 D5zw==
X-Gm-Message-State: AOAM531V4Y3H+XoBbnUc3QQOr9+gEszmLBluZzLXBhRekNdfH2iPMi19
 aXXtH8IkNMEJmh1vBLPVCZ0x/T0SPKlh0J9/EkNkVQ==
X-Google-Smtp-Source: ABdhPJzXu7t0g7e/6RAbiCnIdLK9sydXYm0zLrmQZpQegh9dr3uRupVx1rRzR8Us2z95v54Ccpud8LJnFfzZpn2sXvI=
X-Received: by 2002:a05:6102:1609:: with SMTP id
 cu9mr708619vsb.46.1641843682285; 
 Mon, 10 Jan 2022 11:41:22 -0800 (PST)
MIME-Version: 1.0
References: <20220108030451.3867815-1-venture@google.com>
 <eaea55f9-71f8-4810-70a7-63aadf252f20@amsat.org>
 <CAO=notwnL9WB_M-bZ+S-+5ruf5cm6Gyh9AEvN66owuyLWbsfRQ@mail.gmail.com>
 <6f80b5e2-66d4-a73a-3766-264825d05245@amsat.org>
In-Reply-To: <6f80b5e2-66d4-a73a-3766-264825d05245@amsat.org>
From: Patrick Venture <venture@google.com>
Date: Mon, 10 Jan 2022 11:41:11 -0800
Message-ID: <CAO=notzmTJ7a=gT0UpC9+8j_KwUdC8VSVRScpuEegTEeOtyBkA@mail.gmail.com>
Subject: Re: [PATCH] hw/sensor: Add SB-TSI Temperature Sensor Interface
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Cc: Thomas Huth <thuth@redhat.com>, lvivier@redhat.com, 
 Paolo Bonzini <pbonzini@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>, 
 Hao Wu <wuhaotsh@google.com>, Doug Evans <dje@google.com>,
 Corey Minyard <minyard@acm.org>
Content-Type: multipart/alternative; boundary="000000000000762fca05d53f8528"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::933
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::933;
 envelope-from=venture@google.com; helo=mail-ua1-x933.google.com
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

--000000000000762fca05d53f8528
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 10, 2022 at 11:30 AM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.o=
rg>
wrote:

> On 1/10/22 18:14, Patrick Venture wrote:
> > On Mon, Jan 10, 2022 at 1:35 AM Philippe Mathieu-Daud=C3=A9 <f4bug@amsa=
t.org
> > <mailto:f4bug@amsat.org>> wrote:
> >
> >     Hi Patrick,
> >
> >     On 1/8/22 04:04, Patrick Venture wrote:
> >     > From: Hao Wu <wuhaotsh@google.com <mailto:wuhaotsh@google.com>>
> >     >
> >     > SB Temperature Sensor Interface (SB-TSI) is an SMBus compatible
> >     > interface that reports AMD SoC's Ttcl (normalized temperature),
> >     > and resembles a typical 8-pin remote temperature sensor's I2C
> >     interface
> >     > to BMC.
> >     >
> >     > This patch implements a basic AMD SB-TSI sensor that is
> >     > compatible with the open-source data sheet from AMD and Linux
> >     > kernel driver.
> >     >
> >     > Reference:
> >     > Linux kernel driver:
> >     > https://lkml.org/lkml/2020/12/11/968
> >     <https://lkml.org/lkml/2020/12/11/968>
> >     > Register Map:
> >     > https://developer.amd.com/wp-content/resources/56255_3_03.PDF
> >     <https://developer.amd.com/wp-content/resources/56255_3_03.PDF>
> >     > (Chapter 6)
> >     >
> >     > Signed-off-by: Hao Wu <wuhaotsh@google.com
> >     <mailto:wuhaotsh@google.com>>
> >     > Reviewed-by: Doug Evans <dje@google.com <mailto:dje@google.com>>
> >     > ---
> >     >  hw/sensor/Kconfig            |   4 +
> >     >  hw/sensor/meson.build        |   1 +
> >     >  hw/sensor/tmp_sbtsi.c        | 393
> >     +++++++++++++++++++++++++++++++++++
> >     >  hw/sensor/trace-events       |   5 +
> >     >  hw/sensor/trace.h            |   1 +
> >     >  meson.build                  |   1 +
> >
> >     >  tests/qtest/meson.build      |   1 +
> >     >  tests/qtest/tmp_sbtsi-test.c | 180 ++++++++++++++++
> >
> >     Up to Thomas for qtest, but I'd rather split in 2 patches since
> >     different set of maintainers / reviewers.
> >
> >     > +++ b/hw/sensor/tmp_sbtsi.c
> >     > @@ -0,0 +1,393 @@
> >     > +/*
> >     > + * AMD SBI Temperature Sensor Interface (SB-TSI)
> >     > + *
> >     > + * Copyright 2021 Google LLC
> >     > + *
> >     > + * This program is free software; you can redistribute it and/or
> >     modify it
> >     > + * under the terms of the GNU General Public License as publishe=
d
> >     by the
> >     > + * Free Software Foundation; either version 2 of the License, or
> >     > + * (at your option) any later version.
> >     > + *
> >     > + * This program is distributed in the hope that it will be
> >     useful, but WITHOUT
> >     > + * ANY WARRANTY; without even the implied warranty of
> >     MERCHANTABILITY or
> >     > + * FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public
> >     License
> >     > + * for more details.
> >     > + */
> >     > +
> >     > +#include "qemu/osdep.h"
> >     > +#include "hw/i2c/smbus_slave.h"
> >     > +#include "hw/irq.h"
> >     > +#include "migration/vmstate.h"
> >     > +#include "qapi/error.h"
> >     > +#include "qapi/visitor.h"
> >     > +#include "qemu/log.h"
> >     > +#include "qemu/module.h"
> >     > +#include "trace.h"
> >     > +
> >     > +#define TYPE_SBTSI "sbtsi"
> >
> >     If you add include/hw/sensor/sbtsi.h, please define the type there,
> ...
> >
> >     > +/*
> >     > + * SB-TSI registers only support SMBus byte data access. "_INT"
> >     registers are
> >     > + * the integer part of a temperature value or limit, and "_DEC"
> >     registers are
> >     > + * corresponding decimal parts.
> >     > + */
> >     > +#define SBTSI_REG_TEMP_INT      0x01 /* RO */
> >     > +#define SBTSI_REG_STATUS        0x02 /* RO */
> >     > +#define SBTSI_REG_CONFIG        0x03 /* RO */
> >     > +#define SBTSI_REG_TEMP_HIGH_INT 0x07 /* RW */
> >     > +#define SBTSI_REG_TEMP_LOW_INT  0x08 /* RW */
> >     > +#define SBTSI_REG_CONFIG_WR     0x09 /* RW */
> >     > +#define SBTSI_REG_TEMP_DEC      0x10 /* RO */
> >     > +#define SBTSI_REG_TEMP_HIGH_DEC 0x13 /* RW */
> >     > +#define SBTSI_REG_TEMP_LOW_DEC  0x14 /* RW */
> >     > +#define SBTSI_REG_ALERT_CONFIG  0xBF /* RW */
> >     > +#define SBTSI_REG_MAN           0xFE /* RO */
> >     > +#define SBTSI_REG_REV           0xFF /* RO */
> >     > +
> >     > +#define SBTSI_STATUS_HIGH_ALERT BIT(4)
> >     > +#define SBTSI_STATUS_LOW_ALERT  BIT(3)
> >     > +#define SBTSI_CONFIG_ALERT_MASK BIT(7)
> >     > +#define SBTSI_ALARM_EN          BIT(0)
> >
> >     beside these definitions can be share with qtests.
> >
> >     > +/* The temperature we stored are in units of 0.125 degrees. */
> >     > +#define SBTSI_TEMP_UNIT_IN_MILLIDEGREE 125
> >     > +
> >     > +/*
> >     > + * The integer part and decimal of the temperature both 8 bits.
> >     > + * Only the top 3 bits of the decimal parts are used.
> >     > + * So the max temperature is (2^8-1) + (2^3-1)/8 =3D 255.875
> degrees.
> >     > + */
> >     > +#define SBTSI_TEMP_MAX 255875
> >
> >     Nitpicking, use _IN_MILLIDEGREE suffix?
> >
> >
> > I haven't seen this suffix before, is this a style you'd like to start
> > seeing?
>
> Well you used it few lines earlier, in the previous definition:
> SBTSI_TEMP_UNIT_IN_MILLIDEGREE :)
>

Ha, thanks! :) I didn't notice Hao had done that. I'll make it consistent.

>
> >     > +static void sbtsi_init(Object *obj)
> >     > +{
> >     > +    SBTSIState *s =3D SBTSI(obj);
> >     > +
> >     > +    /* Current temperature in millidegrees. */
> >     > +    object_property_add(obj, "temperature", "uint32",
> >
> >     Can we explicit as "temperature_uC"?
> >
> >
> > We can, but that's non-standard.  As I recall most temperature sensors
> > in hw/sensors are in millidegrees, but none have unit suffixes.
>
> I tend to agree, but this is not obvious to everybody.
>
> I once started sanitizing / enforcing this but never got there:
> https://www.mail-archive.com/qemu-block@nongnu.org/msg65192.html
>
> So I don't mind for your patch, if I keep looking at temp sensors
> I'll clean up on top later.
>

Thanks, it seems like the type of change that was best as sweeping vs a
one-off.


>
> >     > +                        sbtsi_get_temperature,
> sbtsi_set_temperature,
> >     > +                        NULL, NULL);
> >     > +    qdev_init_gpio_out_named(DEVICE(obj), &s->alarm,
> >     SBTSI_ALARM_L, 0);
> >     > +}
> >     > +
> >     > +static void sbtsi_class_init(ObjectClass *klass, void *data)
> >     > +{
> >     > +    ResettableClass *rc =3D RESETTABLE_CLASS(klass);
> >     > +    DeviceClass *dc =3D DEVICE_CLASS(klass);
> >     > +    SMBusDeviceClass *k =3D SMBUS_DEVICE_CLASS(klass);
> >     > +
> >     > +    dc->desc =3D "SB-TSI Temperature Sensor";
> >     > +    dc->vmsd =3D &vmstate_sbtsi;
> >     > +    k->write_data =3D sbtsi_write_data;
> >     > +    k->receive_byte =3D sbtsi_read_byte;
> >     > +    rc->phases.enter =3D sbtsi_enter_reset;
> >     > +    rc->phases.hold =3D sbtsi_hold_reset;
> >
> >     If my previous patch [*] were in, I'd have asked for:
> >
> >            set_bit(DEVICE_CATEGORY_SENSOR, dc->categories);
> >
> >     But since it isn't, I'll keep an eye on which goes in first.
> >
> >     [*]
> >     https://www.mail-archive.com/qemu-devel@nongnu.org/msg847088.html
> >     <https://www.mail-archive.com/qemu-devel@nongnu.org/msg847088.html>
> >
> >     > diff --git a/tests/qtest/tmp_sbtsi-test.c
> >     b/tests/qtest/tmp_sbtsi-test.c
> >     > new file mode 100644
> >     > index 0000000000..7f5fafacc7
> >     > --- /dev/null
> >     > +++ b/tests/qtest/tmp_sbtsi-test.c
> >     > @@ -0,0 +1,180 @@
> >     > +/*
> >     > + * QTests for the SBTSI temperature sensor
> >     > + *
> >     > + * Copyright 2020 Google LLC
> >     > + *
> >     > + * This program is free software; you can redistribute it and/or
> >     modify it
> >     > + * under the terms of the GNU General Public License as publishe=
d
> >     by the
> >     > + * Free Software Foundation; either version 2 of the License, or
> >     > + * (at your option) any later version.
> >     > + *
> >     > + * This program is distributed in the hope that it will be
> >     useful, but WITHOUT
> >     > + * ANY WARRANTY; without even the implied warranty of
> >     MERCHANTABILITY or
> >     > + * FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public
> >     License
> >     > + * for more details.
> >     > + */
> >     > +
> >     > +#include "qemu/osdep.h"
> >     > +
> >     > +#include "libqtest-single.h"
> >     > +#include "libqos/qgraph.h"
> >     > +#include "libqos/i2c.h"
> >     > +#include "qapi/qmp/qdict.h"
> >     > +#include "qemu/bitops.h"
> >     > +
> >     > +#define TEST_ID   "sbtsi-test"
> >     > +#define TEST_ADDR (0x4c)
> >     > +
> >     > +/*
> >     > + * SB-TSI registers only support SMBus byte data access. "_INT"
> >     registers are
> >     > + * the integer part of a temperature value or limit, and "_DEC"
> >     registers are
> >     > + * corresponding decimal parts.
> >     > + */
> >     > +#define REG_TEMP_INT      0x01 /* RO */
> >     > +#define REG_STATUS        0x02 /* RO */
> >     > +#define REG_CONFIG        0x03 /* RO */
> >     > +#define REG_TEMP_HIGH_INT 0x07 /* RW */
> >     > +#define REG_TEMP_LOW_INT  0x08 /* RW */
> >     > +#define REG_CONFIG_WR     0x09 /* RW */
> >     > +#define REG_TEMP_DEC      0x10 /* RO */
> >     > +#define REG_TEMP_HIGH_DEC 0x13 /* RW */
> >     > +#define REG_TEMP_LOW_DEC  0x14 /* RW */
> >     > +#define REG_ALERT_CONFIG  0xBF /* RW */
> >     > +
> >     > +#define STATUS_HIGH_ALERT BIT(4)
> >     > +#define STATUS_LOW_ALERT  BIT(3)
> >     > +#define CONFIG_ALERT_MASK BIT(7)
> >     > +#define ALARM_EN          BIT(0)
> >
> >     This is the part that could be shared in "include/hw/sensor/sbtsi.h=
".
> >
> >
> > Ack.
> >
> >
> >
> >     > +/* The temperature stored are in units of 0.125 degrees. */
> >     > +#define TEMP_UNIT_IN_MILLIDEGREE 125
> >     > +#define LIMIT_LOW (10500)
> >     > +#define LIMIT_HIGH (55125)
> >
> >     Nitpicking again, _IN_MILLIDEGREE suffix for coherency?
> >
> >     > +static uint32_t qmp_sbtsi_get_temperature(const char *id)
> >     > +{
> >     > +    QDict *response;
> >     > +    int ret;
> >     > +
> >     > +    response =3D qmp("{ 'execute': 'qom-get', 'arguments': {
> >     'path': %s, "
> >     > +                   "'property': 'temperature' } }", id);
> >
> >     If renamed earlier, here 'temperature_uC'.
> >
> >     > +    g_assert(qdict_haskey(response, "return"));
> >     > +    ret =3D (uint32_t)qdict_get_int(response, "return");
> >     > +    qobject_unref(response);
> >     > +    return ret;
> >     > +}
> >     > +
> >     > +static void qmp_sbtsi_set_temperature(const char *id, uint32_t
> value)
> >     > +{
> >     > +    QDict *response;
> >     > +
> >     > +    response =3D qmp("{ 'execute': 'qom-set', 'arguments': {
> >     'path': %s, "
> >     > +                   "'property': 'temperature', 'value': %d } }",
> >     id, value);
> >     > +    g_assert(qdict_haskey(response, "return"));
> >     > +    qobject_unref(response);
> >     > +}
> >
> >     Thanks,
> >
> >     Phil.
> >
> >
> > v2 will come with the header split.  I can split the qtests into a
> > separate patch.  Was your point because the patches are applied to
> > different staging trees?  Because I would think it ideal to have the
> > qtests and the corresponding code applied together so that it's easy to
> > know it's working.  If this isn't standard, I can definitely split them=
.
>
> If split, both patches certainly should be queued consecutively via the
> same tree. I asked the split because I'm OK to give a R-b tag for the
> hw/ part, but am not sure about the tests/ part. Possibly others would
> be OK to review the qtest but would be unsure about the hw/ part.
>

Ok, so split the patches into two commits in the same mailing thing.  That
makes sense.  I'll set that up for the v2.

--000000000000762fca05d53f8528
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, Jan 10, 2022 at 11:30 AM Phil=
ippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:f4bug@amsat.org">f4bug@amsat.=
org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x">On 1/10/22 18:14, Patrick Venture wrote:<br>
&gt; On Mon, Jan 10, 2022 at 1:35 AM Philippe Mathieu-Daud=C3=A9 &lt;<a hre=
f=3D"mailto:f4bug@amsat.org" target=3D"_blank">f4bug@amsat.org</a><br>
&gt; &lt;mailto:<a href=3D"mailto:f4bug@amsat.org" target=3D"_blank">f4bug@=
amsat.org</a>&gt;&gt; wrote:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Hi Patrick,<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0On 1/8/22 04:04, Patrick Venture wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; From: Hao Wu &lt;<a href=3D"mailto:wuhaotsh@go=
ogle.com" target=3D"_blank">wuhaotsh@google.com</a> &lt;mailto:<a href=3D"m=
ailto:wuhaotsh@google.com" target=3D"_blank">wuhaotsh@google.com</a>&gt;&gt=
;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; SB Temperature Sensor Interface (SB-TSI) is an=
 SMBus compatible<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; interface that reports AMD SoC&#39;s Ttcl (nor=
malized temperature),<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; and resembles a typical 8-pin remote temperatu=
re sensor&#39;s I2C<br>
&gt;=C2=A0 =C2=A0 =C2=A0interface<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; to BMC.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; This patch implements a basic AMD SB-TSI senso=
r that is<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; compatible with the open-source data sheet fro=
m AMD and Linux<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; kernel driver.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; Reference:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; Linux kernel driver:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; <a href=3D"https://lkml.org/lkml/2020/12/11/96=
8" rel=3D"noreferrer" target=3D"_blank">https://lkml.org/lkml/2020/12/11/96=
8</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://lkml.org/lkml/2020/12/11/968=
" rel=3D"noreferrer" target=3D"_blank">https://lkml.org/lkml/2020/12/11/968=
</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; Register Map:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; <a href=3D"https://developer.amd.com/wp-conten=
t/resources/56255_3_03.PDF" rel=3D"noreferrer" target=3D"_blank">https://de=
veloper.amd.com/wp-content/resources/56255_3_03.PDF</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://developer.amd.com/wp-content=
/resources/56255_3_03.PDF" rel=3D"noreferrer" target=3D"_blank">https://dev=
eloper.amd.com/wp-content/resources/56255_3_03.PDF</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; (Chapter 6)<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; Signed-off-by: Hao Wu &lt;<a href=3D"mailto:wu=
haotsh@google.com" target=3D"_blank">wuhaotsh@google.com</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:wuhaotsh@google.com" t=
arget=3D"_blank">wuhaotsh@google.com</a>&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; Reviewed-by: Doug Evans &lt;<a href=3D"mailto:=
dje@google.com" target=3D"_blank">dje@google.com</a> &lt;mailto:<a href=3D"=
mailto:dje@google.com" target=3D"_blank">dje@google.com</a>&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; ---<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 hw/sensor/Kconfig=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A04 +<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 hw/sensor/meson.build=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 |=C2=A0 =C2=A01 +<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 hw/sensor/tmp_sbtsi.c=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 | 393<br>
&gt;=C2=A0 =C2=A0 =C2=A0+++++++++++++++++++++++++++++++++++<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 hw/sensor/trace-events=C2=A0 =C2=A0 =C2=
=A0 =C2=A0|=C2=A0 =C2=A05 +<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 hw/sensor/trace.h=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A01 +<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A01 +<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 tests/qtest/meson.build=C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 =C2=A01 +<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 tests/qtest/tmp_sbtsi-test.c | 180 +++++=
+++++++++++<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Up to Thomas for qtest, but I&#39;d rather split in=
 2 patches since<br>
&gt;=C2=A0 =C2=A0 =C2=A0different set of maintainers / reviewers.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +++ b/hw/sensor/tmp_sbtsi.c<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; @@ -0,0 +1,393 @@<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +/*<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; + * AMD SBI Temperature Sensor Interface (SB-T=
SI)<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; + *<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; + * Copyright 2021 Google LLC<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; + *<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; + * This program is free software; you can red=
istribute it and/or<br>
&gt;=C2=A0 =C2=A0 =C2=A0modify it<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; + * under the terms of the GNU General Public =
License as published<br>
&gt;=C2=A0 =C2=A0 =C2=A0by the<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; + * Free Software Foundation; either version 2=
 of the License, or<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; + * (at your option) any later version.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; + *<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; + * This program is distributed in the hope th=
at it will be<br>
&gt;=C2=A0 =C2=A0 =C2=A0useful, but WITHOUT<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; + * ANY WARRANTY; without even the implied war=
ranty of<br>
&gt;=C2=A0 =C2=A0 =C2=A0MERCHANTABILITY or<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; + * FITNESS FOR A PARTICULAR PURPOSE. See the =
GNU General Public<br>
&gt;=C2=A0 =C2=A0 =C2=A0License<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; + * for more details.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; + */<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +#include &quot;qemu/osdep.h&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +#include &quot;hw/i2c/smbus_slave.h&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +#include &quot;hw/irq.h&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +#include &quot;migration/vmstate.h&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +#include &quot;qapi/error.h&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +#include &quot;qapi/visitor.h&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +#include &quot;qemu/log.h&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +#include &quot;qemu/module.h&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +#include &quot;trace.h&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +#define TYPE_SBTSI &quot;sbtsi&quot;<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0If you add include/hw/sensor/sbtsi.h, please define=
 the type there, ...<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +/*<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; + * SB-TSI registers only support SMBus byte d=
ata access. &quot;_INT&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0registers are<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; + * the integer part of a temperature value or=
 limit, and &quot;_DEC&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0registers are<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; + * corresponding decimal parts.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; + */<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +#define SBTSI_REG_TEMP_INT=C2=A0 =C2=A0 =C2=
=A0 0x01 /* RO */<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +#define SBTSI_REG_STATUS=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 0x02 /* RO */<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +#define SBTSI_REG_CONFIG=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 0x03 /* RO */<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +#define SBTSI_REG_TEMP_HIGH_INT 0x07 /* RW */=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +#define SBTSI_REG_TEMP_LOW_INT=C2=A0 0x08 /* =
RW */<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +#define SBTSI_REG_CONFIG_WR=C2=A0 =C2=A0 =C2=
=A00x09 /* RW */<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +#define SBTSI_REG_TEMP_DEC=C2=A0 =C2=A0 =C2=
=A0 0x10 /* RO */<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +#define SBTSI_REG_TEMP_HIGH_DEC 0x13 /* RW */=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +#define SBTSI_REG_TEMP_LOW_DEC=C2=A0 0x14 /* =
RW */<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +#define SBTSI_REG_ALERT_CONFIG=C2=A0 0xBF /* =
RW */<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +#define SBTSI_REG_MAN=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A00xFE /* RO */<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +#define SBTSI_REG_REV=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A00xFF /* RO */<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +#define SBTSI_STATUS_HIGH_ALERT BIT(4)<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +#define SBTSI_STATUS_LOW_ALERT=C2=A0 BIT(3)<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +#define SBTSI_CONFIG_ALERT_MASK BIT(7)<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +#define SBTSI_ALARM_EN=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 BIT(0)<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0beside these definitions can be share with qtests.<=
br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +/* The temperature we stored are in units of =
0.125 degrees. */<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +#define SBTSI_TEMP_UNIT_IN_MILLIDEGREE 125<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +/*<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; + * The integer part and decimal of the temper=
ature both 8 bits.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; + * Only the top 3 bits of the decimal parts a=
re used.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; + * So the max temperature is (2^8-1) + (2^3-1=
)/8 =3D 255.875 degrees.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; + */<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +#define SBTSI_TEMP_MAX 255875<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Nitpicking, use _IN_MILLIDEGREE suffix?<br>
&gt; <br>
&gt; <br>
&gt; I haven&#39;t seen this suffix before, is this a style you&#39;d like =
to start<br>
&gt; seeing?<br>
<br>
Well you used it few lines earlier, in the previous definition:<br>
SBTSI_TEMP_UNIT_IN_MILLIDEGREE :)<br></blockquote><div><br></div><div>Ha, t=
hanks! :) I didn&#39;t notice Hao had done that. I&#39;ll make it consisten=
t.=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +static void sbtsi_init(Object *obj)<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +{<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 SBTSIState *s =3D SBTSI(obj);<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 /* Current temperature in milli=
degrees. */<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 object_property_add(obj, &quot;=
temperature&quot;, &quot;uint32&quot;,<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Can we explicit as &quot;temperature_uC&quot;?<br>
&gt; <br>
&gt; <br>
&gt; We can, but that&#39;s non-standard.=C2=A0 As I recall most temperatur=
e sensors<br>
&gt; in hw/sensors are in millidegrees, but none have unit suffixes.<br>
<br>
I tend to agree, but this is not obvious to everybody.<br>
<br>
I once started sanitizing / enforcing this but never got there:<br>
<a href=3D"https://www.mail-archive.com/qemu-block@nongnu.org/msg65192.html=
" rel=3D"noreferrer" target=3D"_blank">https://www.mail-archive.com/qemu-bl=
ock@nongnu.org/msg65192.html</a><br>
<br>
So I don&#39;t mind for your patch, if I keep looking at temp sensors<br>
I&#39;ll clean up on top later.<br></blockquote><div><br></div><div>Thanks,=
 it seems like the type of change that was best as sweeping vs a one-off.</=
div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sbtsi_get_temperature, sbtsi_set_tem=
perature,<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 NULL, NULL);<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 qdev_init_gpio_out_named(DEVICE=
(obj), &amp;s-&gt;alarm,<br>
&gt;=C2=A0 =C2=A0 =C2=A0SBTSI_ALARM_L, 0);<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +}<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +static void sbtsi_class_init(ObjectClass *kla=
ss, void *data)<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +{<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 ResettableClass *rc =3D RESETTA=
BLE_CLASS(klass);<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 DeviceClass *dc =3D DEVICE_CLAS=
S(klass);<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 SMBusDeviceClass *k =3D SMBUS_D=
EVICE_CLASS(klass);<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 dc-&gt;desc =3D &quot;SB-TSI Te=
mperature Sensor&quot;;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 dc-&gt;vmsd =3D &amp;vmstate_sb=
tsi;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 k-&gt;write_data =3D sbtsi_writ=
e_data;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 k-&gt;receive_byte =3D sbtsi_re=
ad_byte;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 rc-&gt;phases.enter =3D sbtsi_e=
nter_reset;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 rc-&gt;phases.hold =3D sbtsi_ho=
ld_reset;<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0If my previous patch [*] were in, I&#39;d have aske=
d for:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0set_bit(DEVICE_CATEGORY_=
SENSOR, dc-&gt;categories);<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0But since it isn&#39;t, I&#39;ll keep an eye on whi=
ch goes in first.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0[*]<br>
&gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"https://www.mail-archive.com/qemu-devel@=
nongnu.org/msg847088.html" rel=3D"noreferrer" target=3D"_blank">https://www=
.mail-archive.com/qemu-devel@nongnu.org/msg847088.html</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://www.mail-archive.com/qemu-de=
vel@nongnu.org/msg847088.html" rel=3D"noreferrer" target=3D"_blank">https:/=
/www.mail-archive.com/qemu-devel@nongnu.org/msg847088.html</a>&gt;<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; diff --git a/tests/qtest/tmp_sbtsi-test.c<br>
&gt;=C2=A0 =C2=A0 =C2=A0b/tests/qtest/tmp_sbtsi-test.c<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; new file mode 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; index 0000000000..7f5fafacc7<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; --- /dev/null<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +++ b/tests/qtest/tmp_sbtsi-test.c<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; @@ -0,0 +1,180 @@<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +/*<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; + * QTests for the SBTSI temperature sensor<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; + *<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; + * Copyright 2020 Google LLC<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; + *<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; + * This program is free software; you can red=
istribute it and/or<br>
&gt;=C2=A0 =C2=A0 =C2=A0modify it<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; + * under the terms of the GNU General Public =
License as published<br>
&gt;=C2=A0 =C2=A0 =C2=A0by the<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; + * Free Software Foundation; either version 2=
 of the License, or<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; + * (at your option) any later version.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; + *<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; + * This program is distributed in the hope th=
at it will be<br>
&gt;=C2=A0 =C2=A0 =C2=A0useful, but WITHOUT<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; + * ANY WARRANTY; without even the implied war=
ranty of<br>
&gt;=C2=A0 =C2=A0 =C2=A0MERCHANTABILITY or<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; + * FITNESS FOR A PARTICULAR PURPOSE. See the =
GNU General Public<br>
&gt;=C2=A0 =C2=A0 =C2=A0License<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; + * for more details.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; + */<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +#include &quot;qemu/osdep.h&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +#include &quot;libqtest-single.h&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +#include &quot;libqos/qgraph.h&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +#include &quot;libqos/i2c.h&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +#include &quot;qapi/qmp/qdict.h&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +#include &quot;qemu/bitops.h&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +#define TEST_ID=C2=A0 =C2=A0&quot;sbtsi-test&=
quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +#define TEST_ADDR (0x4c)<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +/*<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; + * SB-TSI registers only support SMBus byte d=
ata access. &quot;_INT&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0registers are<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; + * the integer part of a temperature value or=
 limit, and &quot;_DEC&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0registers are<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; + * corresponding decimal parts.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; + */<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +#define REG_TEMP_INT=C2=A0 =C2=A0 =C2=A0 0x01=
 /* RO */<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +#define REG_STATUS=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 0x02 /* RO */<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +#define REG_CONFIG=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 0x03 /* RO */<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +#define REG_TEMP_HIGH_INT 0x07 /* RW */<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +#define REG_TEMP_LOW_INT=C2=A0 0x08 /* RW */<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +#define REG_CONFIG_WR=C2=A0 =C2=A0 =C2=A00x09=
 /* RW */<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +#define REG_TEMP_DEC=C2=A0 =C2=A0 =C2=A0 0x10=
 /* RO */<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +#define REG_TEMP_HIGH_DEC 0x13 /* RW */<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +#define REG_TEMP_LOW_DEC=C2=A0 0x14 /* RW */<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +#define REG_ALERT_CONFIG=C2=A0 0xBF /* RW */<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +#define STATUS_HIGH_ALERT BIT(4)<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +#define STATUS_LOW_ALERT=C2=A0 BIT(3)<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +#define CONFIG_ALERT_MASK BIT(7)<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +#define ALARM_EN=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 BIT(0)<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0This is the part that could be shared in &quot;incl=
ude/hw/sensor/sbtsi.h&quot;.<br>
&gt; <br>
&gt; <br>
&gt; Ack.<br>
&gt; =C2=A0<br>
&gt; <br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +/* The temperature stored are in units of 0.1=
25 degrees. */<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +#define TEMP_UNIT_IN_MILLIDEGREE 125<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +#define LIMIT_LOW (10500)<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +#define LIMIT_HIGH (55125)<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Nitpicking again, _IN_MILLIDEGREE suffix for cohere=
ncy?<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +static uint32_t qmp_sbtsi_get_temperature(con=
st char *id)<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +{<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 QDict *response;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 int ret;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 response =3D qmp(&quot;{ &#39;e=
xecute&#39;: &#39;qom-get&#39;, &#39;arguments&#39;: {<br>
&gt;=C2=A0 =C2=A0 =C2=A0&#39;path&#39;: %s, &quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0&quot;&#39;property&#39;: &#39;temperature&#39; } }=
&quot;, id);<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0If renamed earlier, here &#39;temperature_uC&#39;.<=
br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 g_assert(qdict_haskey(response,=
 &quot;return&quot;));<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 ret =3D (uint32_t)qdict_get_int=
(response, &quot;return&quot;);<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 qobject_unref(response);<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 return ret;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +}<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +static void qmp_sbtsi_set_temperature(const c=
har *id, uint32_t value)<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +{<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 QDict *response;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 response =3D qmp(&quot;{ &#39;e=
xecute&#39;: &#39;qom-set&#39;, &#39;arguments&#39;: {<br>
&gt;=C2=A0 =C2=A0 =C2=A0&#39;path&#39;: %s, &quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0&quot;&#39;property&#39;: &#39;temperature&#39;, &#=
39;value&#39;: %d } }&quot;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0id, value);<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 g_assert(qdict_haskey(response,=
 &quot;return&quot;));<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 qobject_unref(response);<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +}<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Thanks,<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Phil.<br>
&gt; <br>
&gt; <br>
&gt; v2 will come with the header split.=C2=A0 I can split the qtests into =
a<br>
&gt; separate patch.=C2=A0 Was your point because the patches are applied t=
o<br>
&gt; different staging trees?=C2=A0 Because I would think it ideal to have =
the<br>
&gt; qtests and the corresponding code applied together so that it&#39;s ea=
sy to<br>
&gt; know it&#39;s working.=C2=A0 If this isn&#39;t standard, I can definit=
ely split them.<br>
<br>
If split, both patches certainly should be queued consecutively via the<br>
same tree. I asked the split because I&#39;m OK to give a R-b tag for the<b=
r>
hw/ part, but am not sure about the tests/ part. Possibly others would<br>
be OK to review the qtest but would be unsure about the hw/ part.<br></bloc=
kquote><div><br></div><div>Ok, so split the patches into two commits in the=
 same mailing thing.=C2=A0 That makes sense.=C2=A0 I&#39;ll set that up for=
 the v2.</div><div>=C2=A0</div></div></div>

--000000000000762fca05d53f8528--

