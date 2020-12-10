Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 609092D57D8
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Dec 2020 11:06:13 +0100 (CET)
Received: from localhost ([::1]:38624 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knIpw-0004G3-4U
	for lists+qemu-devel@lfdr.de; Thu, 10 Dec 2020 05:06:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49338)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangzhiqiang.bj@bytedance.com>)
 id 1knIRm-0007I6-Ni
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 04:41:14 -0500
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243]:34415)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wangzhiqiang.bj@bytedance.com>)
 id 1knIRf-0005HE-HU
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 04:41:13 -0500
Received: by mail-oi1-x243.google.com with SMTP id s75so5095011oih.1
 for <qemu-devel@nongnu.org>; Thu, 10 Dec 2020 01:41:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=TWMy+vEzRfGjLz57DaLZWfTfKi01Gbapd5qFwY6zS2M=;
 b=ja12nSRr4rcfDkJJ3osFE8sJ+5tM/ZhPKp+O0/eZ79J/r+1kdJzIKZ85py0DB1SeBW
 fofLIWuIyAcHd2ym0k1yVRtKmEl/nfZwg/AGfN2QpG1nZn5lFtiFjGZDv4F4PU37cBSd
 c9BBW1FOucuJwhcs5qvi1Q+lS7JV8FBcIF0VBAOd4wYA53S9pRtsBDEqpMoSPrQs6HMI
 h5cCjUvFyMC9G0bc8zae/jGUwWgIum5XtiQoNOlQn3p58YtFhnjHj3MpN9ieFCLHTRsM
 sxnSgFSVoM6tE3AJBIWLIG1vGJTV8boi9OXl8wVNqHKiTWTEWl8nsDeKA1m1+tGXvt03
 4/Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=TWMy+vEzRfGjLz57DaLZWfTfKi01Gbapd5qFwY6zS2M=;
 b=rd9RyhDAc0EY5aOVxDgELzY0L65lWwAfDSFk4qhC+uGsqtTj+MB+BJxyLMkiY9HRsi
 9XYbEsSsTkIhKgMkOOS1DhNheBRUY3a/7tfpenKvTS5o9ZuvTJ4wKsHUsMljCYfXMrMk
 ma8KAcv5pFAAD+oxLO+DEaC9LrA6TAvQlXuz7mZ8tGC+3KaEq6qytqL/T4Cl6jUCeuFC
 EXGXArHXinf6SY0FSdIQAlr1e22bkq7fB6rxc+WhXhu8MdxCvm7+zwuFdMP4cMY0altb
 ZEhyP+65xkF6351kwhpSg5OodOlA8BPvdIerChMplYtljU8HXMgTEHshO80A8toTKTtn
 rHoQ==
X-Gm-Message-State: AOAM530ND25M7frWtgDfgFt8+txM+ciK1AI5oltqq9LOZ6SZYnAINuuS
 Rz3zUWkQn0EunDNJXzzZlSdoDdro049y/tgOBha7hA==
X-Google-Smtp-Source: ABdhPJyRjh8pXGiu5vgt02tV6i9rjO43JmnVALiUrEuY6lyOtzZnwvqth8j+D205n9OlKH2abNvCYV+WG/SiWlQ7cPg=
X-Received: by 2002:a05:6808:2cb:: with SMTP id
 a11mr4915395oid.93.1607593265092; 
 Thu, 10 Dec 2020 01:41:05 -0800 (PST)
MIME-Version: 1.0
References: <20201122105134.671-1-wangzhiqiang.bj@bytedance.com>
 <6ac8833e-9e45-9dff-af3b-e8b46bbd3fc5@kaod.org>
In-Reply-To: <6ac8833e-9e45-9dff-af3b-e8b46bbd3fc5@kaod.org>
From: John Wang <wangzhiqiang.bj@bytedance.com>
Date: Thu, 10 Dec 2020 17:40:54 +0800
Message-ID: <CAH0XSJu_ZCS0p6iztv9aqd6uf2S79N1G6--vTvNC0Oyp2SKsww@mail.gmail.com>
Subject: Re: [External] Re: [PATCH v4 1/2] hw/misc: add an EMC141{3,
 4} device model
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::243;
 envelope-from=wangzhiqiang.bj@bytedance.com; helo=mail-oi1-x243.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?B?6YOB6Zu3?= <yulei.sh@bytedance.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>, Joel Stanley <joel@jms.id.au>,
 Paolo Bonzini <pbonzini@redhat.com>, Lotus Xu <xuxiaohan@bytedance.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

ping :)

I'm sorry I had a break(v3 -> v4)  for a while to do something else

On Mon, Nov 23, 2020 at 8:21 PM C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> On 11/22/20 11:51 AM, John Wang wrote:
> > Largely inspired by the TMP421 temperature sensor, here is a model for
> > the EMC1413/EMC1414 temperature sensors.
> >
> > Specs can be found here :
> >   http://ww1.microchip.com/downloads/en/DeviceDoc/20005274A.pdf
> >
> > Signed-off-by: John Wang <wangzhiqiang.bj@bytedance.com>
>
> Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>
>
> Thanks,
>
> C.
>
> > ---
> > v4:
> >   -Fix QOM style name
> >   -Add unittest
> > v3:
> >   - update the link to the spec
> >   - Rename emc1413.c to emc141x.c
> >   - Add sensors_count in EMC141XClass
> >   - Make emc1413_read/write easier to review :)
> > v2:
> >   - Remove DeviceInfo
> >   - commit message: TMP423 -> TMP421
> > ---
> >  hw/arm/Kconfig                 |   1 +
> >  hw/misc/Kconfig                |   4 +
> >  hw/misc/emc141x.c              | 326 +++++++++++++++++++++++++++++++++
> >  hw/misc/meson.build            |   1 +
> >  include/hw/misc/emc141x_regs.h |  37 ++++
> >  tests/qtest/emc141x-test.c     |  81 ++++++++
> >  tests/qtest/meson.build        |   1 +
> >  7 files changed, 451 insertions(+)
> >  create mode 100644 hw/misc/emc141x.c
> >  create mode 100644 include/hw/misc/emc141x_regs.h
> >  create mode 100644 tests/qtest/emc141x-test.c
> >
> > diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
> > index e69a9009cf..eb8a8844cf 100644
> > --- a/hw/arm/Kconfig
> > +++ b/hw/arm/Kconfig
> > @@ -407,6 +407,7 @@ config ASPEED_SOC
> >      select SSI_M25P80
> >      select TMP105
> >      select TMP421
> > +    select EMC141X
> >      select UNIMP
> >      select LED
> >
> > diff --git a/hw/misc/Kconfig b/hw/misc/Kconfig
> > index dc44dc14f6..cf18ac08e6 100644
> > --- a/hw/misc/Kconfig
> > +++ b/hw/misc/Kconfig
> > @@ -13,6 +13,10 @@ config TMP421
> >      bool
> >      depends on I2C
> >
> > +config EMC141X
> > +    bool
> > +    depends on I2C
> > +
> >  config ISA_DEBUG
> >      bool
> >      depends on ISA_BUS
> > diff --git a/hw/misc/emc141x.c b/hw/misc/emc141x.c
> > new file mode 100644
> > index 0000000000..f7c53d48a4
> > --- /dev/null
> > +++ b/hw/misc/emc141x.c
> > @@ -0,0 +1,326 @@
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
> > +#include "hw/misc/emc141x_regs.h"
> > +
> > +#define SENSORS_COUNT_MAX    4
> > +
> > +struct EMC141XState {
> > +    I2CSlave parent_obj;
> > +    struct {
> > +        uint8_t raw_temp_min;
> > +        uint8_t raw_temp_current;
> > +        uint8_t raw_temp_max;
> > +    } sensor[SENSORS_COUNT_MAX];
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
> > +static void emc141x_get_temperature(Object *obj, Visitor *v, const cha=
r *name,
> > +                                    void *opaque, Error **errp)
> > +{
> > +    EMC141XState *s =3D EMC141X(obj);
> > +    EMC141XClass *sc =3D EMC141X_GET_CLASS(s);
> > +    int64_t value;
> > +    unsigned tempid;
> > +
> > +    if (sscanf(name, "temperature%u", &tempid) !=3D 1) {
> > +        error_setg(errp, "error reading %s: %s", name, g_strerror(errn=
o));
> > +        return;
> > +    }
> > +
> > +    if (tempid >=3D sc->sensors_count) {
> > +        error_setg(errp, "error reading %s", name);
> > +        return;
> > +    }
> > +
> > +    value =3D s->sensor[tempid].raw_temp_current * 1000;
> > +
> > +    visit_type_int(v, name, &value, errp);
> > +}
> > +
> > +static void emc141x_set_temperature(Object *obj, Visitor *v, const cha=
r *name,
> > +                                    void *opaque, Error **errp)
> > +{
> > +    EMC141XState *s =3D EMC141X(obj);
> > +    EMC141XClass *sc =3D EMC141X_GET_CLASS(s);
> > +    int64_t temp;
> > +    unsigned tempid;
> > +
> > +    if (!visit_type_int(v, name, &temp, errp)) {
> > +        return;
> > +    }
> > +
> > +    if (sscanf(name, "temperature%u", &tempid) !=3D 1) {
> > +        error_setg(errp, "error reading %s: %s", name, g_strerror(errn=
o));
> > +        return;
> > +    }
> > +
> > +    if (tempid >=3D sc->sensors_count) {
> > +        error_setg(errp, "error reading %s", name);
> > +        return;
> > +    }
> > +
> > +    s->sensor[tempid].raw_temp_current =3D temp / 1000;
> > +}
> > +
> > +static void emc141x_read(EMC141XState *s)
> > +{
> > +    EMC141XClass *sc =3D EMC141X_GET_CLASS(s);
> > +    switch (s->pointer) {
> > +    case EMC141X_DEVICE_ID:
> > +        s->data =3D sc->model;
> > +        break;
> > +    case EMC141X_MANUFACTURER_ID:
> > +        s->data =3D MANUFACTURER_ID;
> > +        break;
> > +    case EMC141X_REVISION:
> > +        s->data =3D REVISION;
> > +        break;
> > +    case EMC141X_TEMP_HIGH0:
> > +        s->data =3D s->sensor[0].raw_temp_current;
> > +        break;
> > +    case EMC141X_TEMP_HIGH1:
> > +        s->data =3D s->sensor[1].raw_temp_current;
> > +        break;
> > +    case EMC141X_TEMP_HIGH2:
> > +        s->data =3D s->sensor[2].raw_temp_current;
> > +        break;
> > +    case EMC141X_TEMP_HIGH3:
> > +        s->data =3D s->sensor[3].raw_temp_current;
> > +        break;
> > +    case EMC141X_TEMP_MAX_HIGH0:
> > +        s->data =3D s->sensor[0].raw_temp_max;
> > +        break;
> > +    case EMC141X_TEMP_MAX_HIGH1:
> > +        s->data =3D s->sensor[1].raw_temp_max;
> > +        break;
> > +    case EMC141X_TEMP_MAX_HIGH2:
> > +        s->data =3D s->sensor[2].raw_temp_max;
> > +        break;
> > +    case EMC141X_TEMP_MAX_HIGH3:
> > +        s->data =3D s->sensor[3].raw_temp_max;
> > +        break;
> > +    case EMC141X_TEMP_MIN_HIGH0:
> > +        s->data =3D s->sensor[0].raw_temp_min;
> > +        break;
> > +    case EMC141X_TEMP_MIN_HIGH1:
> > +        s->data =3D s->sensor[1].raw_temp_min;
> > +        break;
> > +    case EMC141X_TEMP_MIN_HIGH2:
> > +        s->data =3D s->sensor[2].raw_temp_min;
> > +        break;
> > +    case EMC141X_TEMP_MIN_HIGH3:
> > +        s->data =3D s->sensor[3].raw_temp_min;
> > +        break;
> > +    default:
> > +        s->data =3D 0;
> > +    }
> > +}
> > +
> > +static void emc141x_write(EMC141XState *s)
> > +{
> > +    switch (s->pointer) {
> > +    case EMC141X_TEMP_MAX_HIGH0:
> > +        s->sensor[0].raw_temp_max =3D s->data;
> > +        break;
> > +    case EMC141X_TEMP_MAX_HIGH1:
> > +        s->sensor[1].raw_temp_max =3D s->data;
> > +        break;
> > +    case EMC141X_TEMP_MAX_HIGH2:
> > +        s->sensor[2].raw_temp_max =3D s->data;
> > +        break;
> > +    case EMC141X_TEMP_MAX_HIGH3:
> > +        s->sensor[3].raw_temp_max =3D s->data;
> > +        break;
> > +    case EMC141X_TEMP_MIN_HIGH0:
> > +        s->sensor[0].raw_temp_min =3D s->data;
> > +        break;
> > +    case EMC141X_TEMP_MIN_HIGH1:
> > +        s->sensor[1].raw_temp_min =3D s->data;
> > +        break;
> > +    case EMC141X_TEMP_MIN_HIGH2:
> > +        s->sensor[2].raw_temp_min =3D s->data;
> > +        break;
> > +    case EMC141X_TEMP_MIN_HIGH3:
> > +        s->sensor[3].raw_temp_min =3D s->data;
> > +        break;
> > +    default:
> > +        s->data =3D 0;
> > +    }
> > +}
> > +
> > +static uint8_t emc141x_rx(I2CSlave *i2c)
> > +{
> > +    EMC141XState *s =3D EMC141X(i2c);
> > +
> > +    if (s->len =3D=3D 0) {
> > +        s->len++;
> > +        return s->data;
> > +    } else {
> > +        return 0xff;
> > +    }
> > +}
> > +
> > +static int emc141x_tx(I2CSlave *i2c, uint8_t data)
> > +{
> > +    EMC141XState *s =3D EMC141X(i2c);
> > +
> > +    if (s->len =3D=3D 0) {
> > +        /* first byte is the reg pointer */
> > +        s->pointer =3D data;
> > +        s->len++;
> > +    } else if (s->len =3D=3D 1) {
> > +        s->data =3D data;
> > +        emc141x_write(s);
> > +    }
> > +
> > +    return 0;
> > +}
> > +
> > +static int emc141x_event(I2CSlave *i2c, enum i2c_event event)
> > +{
> > +    EMC141XState *s =3D EMC141X(i2c);
> > +
> > +    if (event =3D=3D I2C_START_RECV) {
> > +        emc141x_read(s);
> > +    }
> > +
> > +    s->len =3D 0;
> > +    return 0;
> > +}
> > +
> > +static const VMStateDescription vmstate_emc141x =3D {
> > +    .name =3D "EMC141X",
> > +    .version_id =3D 0,
> > +    .minimum_version_id =3D 0,
> > +    .fields =3D (VMStateField[]) {
> > +        VMSTATE_UINT8(len, EMC141XState),
> > +        VMSTATE_UINT8(data, EMC141XState),
> > +        VMSTATE_UINT8(pointer, EMC141XState),
> > +        VMSTATE_I2C_SLAVE(parent_obj, EMC141XState),
> > +        VMSTATE_END_OF_LIST()
> > +    }
> > +};
> > +
> > +static void emc141x_reset(DeviceState *dev)
> > +{
> > +    EMC141XState *s =3D EMC141X(dev);
> > +    int i;
> > +
> > +    for (i =3D 0; i < SENSORS_COUNT_MAX; i++) {
> > +        s->sensor[i].raw_temp_max =3D 0x55;
> > +    }
> > +    s->pointer =3D 0;
> > +    s->len =3D 0;
> > +}
> > +
> > +static void emc141x_initfn(Object *obj)
> > +{
> > +    object_property_add(obj, "temperature0", "int",
> > +                        emc141x_get_temperature,
> > +                        emc141x_set_temperature, NULL, NULL);
> > +    object_property_add(obj, "temperature1", "int",
> > +                        emc141x_get_temperature,
> > +                        emc141x_set_temperature, NULL, NULL);
> > +    object_property_add(obj, "temperature2", "int",
> > +                        emc141x_get_temperature,
> > +                        emc141x_set_temperature, NULL, NULL);
> > +    object_property_add(obj, "temperature3", "int",
> > +                        emc141x_get_temperature,
> > +                        emc141x_set_temperature, NULL, NULL);
> > +}
> > +
> > +static void emc141x_class_init(ObjectClass *klass, void *data)
> > +{
> > +    DeviceClass *dc =3D DEVICE_CLASS(klass);
> > +    I2CSlaveClass *k =3D I2C_SLAVE_CLASS(klass);
> > +
> > +    dc->reset =3D emc141x_reset;
> > +    k->event =3D emc141x_event;
> > +    k->recv =3D emc141x_rx;
> > +    k->send =3D emc141x_tx;
> > +    dc->vmsd =3D &vmstate_emc141x;
> > +}
> > +
> > +static void emc1413_class_init(ObjectClass *klass, void *data)
> > +{
> > +    EMC141XClass *ec =3D EMC141X_CLASS(klass);
> > +
> > +    emc141x_class_init(klass, data);
> > +    ec->model =3D EMC1413_DEVICE_ID;
> > +    ec->sensors_count =3D 3;
> > +}
> > +
> > +static void emc1414_class_init(ObjectClass *klass, void *data)
> > +{
> > +    EMC141XClass *ec =3D EMC141X_CLASS(klass);
> > +
> > +    emc141x_class_init(klass, data);
> > +    ec->model =3D EMC1414_DEVICE_ID;
> > +    ec->sensors_count =3D 4;
> > +}
> > +
> > +static const TypeInfo emc141x_info =3D {
> > +    .name          =3D TYPE_EMC141X,
> > +    .parent        =3D TYPE_I2C_SLAVE,
> > +    .instance_size =3D sizeof(EMC141XState),
> > +    .class_size    =3D sizeof(EMC141XClass),
> > +    .instance_init =3D emc141x_initfn,
> > +    .abstract      =3D true,
> > +};
> > +
> > +static const TypeInfo emc1413_info =3D {
> > +    .name          =3D "emc1413",
> > +    .parent        =3D TYPE_EMC141X,
> > +    .class_init    =3D emc1413_class_init,
> > +};
> > +
> > +static const TypeInfo emc1414_info =3D {
> > +    .name          =3D "emc1414",
> > +    .parent        =3D TYPE_EMC141X,
> > +    .class_init    =3D emc1414_class_init,
> > +};
> > +
> > +static void emc141x_register_types(void)
> > +{
> > +    type_register_static(&emc141x_info);
> > +    type_register_static(&emc1413_info);
> > +    type_register_static(&emc1414_info);
> > +}
> > +
> > +type_init(emc141x_register_types)
> > diff --git a/hw/misc/meson.build b/hw/misc/meson.build
> > index 1cd48e8a0f..ce15ffceb9 100644
> > --- a/hw/misc/meson.build
> > +++ b/hw/misc/meson.build
> > @@ -9,6 +9,7 @@ softmmu_ss.add(when: 'CONFIG_PCI_TESTDEV', if_true: fil=
es('pci-testdev.c'))
> >  softmmu_ss.add(when: 'CONFIG_SGA', if_true: files('sga.c'))
> >  softmmu_ss.add(when: 'CONFIG_TMP105', if_true: files('tmp105.c'))
> >  softmmu_ss.add(when: 'CONFIG_TMP421', if_true: files('tmp421.c'))
> > +softmmu_ss.add(when: 'CONFIG_EMC141X', if_true: files('emc141x.c'))
> >  softmmu_ss.add(when: 'CONFIG_UNIMP', if_true: files('unimp.c'))
> >  softmmu_ss.add(when: 'CONFIG_EMPTY_SLOT', if_true: files('empty_slot.c=
'))
> >  softmmu_ss.add(when: 'CONFIG_LED', if_true: files('led.c'))
> > diff --git a/include/hw/misc/emc141x_regs.h b/include/hw/misc/emc141x_r=
egs.h
> > new file mode 100644
> > index 0000000000..0560fb7c5c
> > --- /dev/null
> > +++ b/include/hw/misc/emc141x_regs.h
> > @@ -0,0 +1,37 @@
> > +/*
> > + * SMSC EMC141X temperature sensor.
> > + *
> > + * Browse the data sheet:
> > + *
> > + *    http://ww1.microchip.com/downloads/en/DeviceDoc/20005274A.pdf
> > + *
> > + * This work is licensed under the terms of the GNU GPL, version 2 or
> > + * later. See the COPYING file in the top-level directory.
> > + */
> > +
> > +#ifndef TMP105_REGS_H
> > +#define TMP105_REGS_H
> > +
> > +#define EMC1413_DEVICE_ID                0x21
> > +#define EMC1414_DEVICE_ID                0x25
> > +#define MANUFACTURER_ID                  0x5d
> > +#define REVISION                         0x04
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
> > +#endif
> > diff --git a/tests/qtest/emc141x-test.c b/tests/qtest/emc141x-test.c
> > new file mode 100644
> > index 0000000000..714058806a
> > --- /dev/null
> > +++ b/tests/qtest/emc141x-test.c
> > @@ -0,0 +1,81 @@
> > +/*
> > + * QTest testcase for the EMC141X temperature sensor
> > + *
> > + * This work is licensed under the terms of the GNU GPL, version 2 or =
later.
> > + * See the COPYING file in the top-level directory.
> > + */
> > +
> > +#include "qemu/osdep.h"
> > +
> > +#include "libqtest-single.h"
> > +#include "libqos/qgraph.h"
> > +#include "libqos/i2c.h"
> > +#include "qapi/qmp/qdict.h"
> > +#include "hw/misc/emc141x_regs.h"
> > +
> > +#define EMC1414_TEST_ID   "emc1414-test"
> > +
> > +static int qmp_emc1414_get_temperature(const char *id)
> > +{
> > +    QDict *response;
> > +    int ret;
> > +
> > +    response =3D qmp("{ 'execute': 'qom-get', 'arguments': { 'path': %=
s, "
> > +                   "'property': 'temperature0' } }", id);
> > +    g_assert(qdict_haskey(response, "return"));
> > +    ret =3D qdict_get_int(response, "return");
> > +    qobject_unref(response);
> > +    return ret;
> > +}
> > +
> > +static void qmp_emc1414_set_temperature(const char *id, int value)
> > +{
> > +    QDict *response;
> > +
> > +    response =3D qmp("{ 'execute': 'qom-set', 'arguments': { 'path': %=
s, "
> > +                   "'property': 'temperature0', 'value': %d } }", id, =
value);
> > +    g_assert(qdict_haskey(response, "return"));
> > +    qobject_unref(response);
> > +}
> > +
> > +static void send_and_receive(void *obj, void *data, QGuestAllocator *a=
lloc)
> > +{
> > +    uint16_t value;
> > +    QI2CDevice *i2cdev =3D (QI2CDevice *)obj;
> > +
> > +    value =3D qmp_emc1414_get_temperature(EMC1414_TEST_ID);
> > +    g_assert_cmpuint(value, =3D=3D, 0);
> > +
> > +    value =3D i2c_get8(i2cdev, EMC141X_TEMP_HIGH0);
> > +    g_assert_cmphex(value, =3D=3D, 0);
> > +
> > +    /* The default max value is 85C, 0x55=3D85 */
> > +    value =3D i2c_get8(i2cdev, EMC141X_TEMP_MAX_HIGH0);
> > +    g_assert_cmphex(value, =3D=3D, 0x55);
> > +
> > +    value =3D i2c_get8(i2cdev, EMC141X_TEMP_MIN_HIGH0);
> > +    g_assert_cmphex(value, =3D=3D, 0);
> > +
> > +    /* 3000mc =3D 30C */
> > +    qmp_emc1414_set_temperature(EMC1414_TEST_ID, 30000);
> > +    value =3D qmp_emc1414_get_temperature(EMC1414_TEST_ID);
> > +    g_assert_cmpuint(value, =3D=3D, 30000);
> > +
> > +    value =3D i2c_get8(i2cdev, EMC141X_TEMP_HIGH0);
> > +    g_assert_cmphex(value, =3D=3D, 30);
> > +
> > +}
> > +
> > +static void emc1414_register_nodes(void)
> > +{
> > +    QOSGraphEdgeOptions opts =3D {
> > +        .extra_device_opts =3D "id=3D" EMC1414_TEST_ID ",address=3D0x7=
0"
> > +    };
> > +    add_qi2c_address(&opts, &(QI2CAddress) { 0x70 });
> > +
> > +    qos_node_create_driver("emc1414", i2c_device_create);
> > +    qos_node_consumes("emc1414", "i2c-bus", &opts);
> > +
> > +    qos_add_test("tx-rx", "emc1414", send_and_receive, NULL);
> > +}
> > +libqos_init(emc1414_register_nodes);
> > diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
> > index c19f1c8503..d776befd6e 100644
> > --- a/tests/qtest/meson.build
> > +++ b/tests/qtest/meson.build
> > @@ -188,6 +188,7 @@ qos_test_ss.add(
> >    'sdhci-test.c',
> >    'spapr-phb-test.c',
> >    'tmp105-test.c',
> > +  'emc141x-test.c',
> >    'usb-hcd-ohci-test.c',
> >    'virtio-test.c',
> >    'virtio-blk-test.c',
> >
>

