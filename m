Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DB336E3EC0
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Apr 2023 07:05:08 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1poH2k-0000Uu-Km; Mon, 17 Apr 2023 01:04:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1poH2i-0000UW-Cb
 for qemu-devel@nongnu.org; Mon, 17 Apr 2023 01:04:44 -0400
Received: from mail-ua1-x92c.google.com ([2607:f8b0:4864:20::92c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1poH2g-0006jz-BD
 for qemu-devel@nongnu.org; Mon, 17 Apr 2023 01:04:44 -0400
Received: by mail-ua1-x92c.google.com with SMTP id o2so16088171uao.11
 for <qemu-devel@nongnu.org>; Sun, 16 Apr 2023 22:04:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681707881; x=1684299881;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XRgyV45sC3yFfGtjCWQa17KCYHQxLEGRUh0zUxU90rM=;
 b=XY3IDMY/HnUoYfIrhK7weRWOw3jTuDxmEj2vnVnmEeFNYSYSbWCEXvi26WZiFGHKue
 EgGZbJ3TYmY8YVg3iaB6b00BrIjJqXteOT3IxBPNdKVdWL8cjLS/1HRhdwzg6MpuPJlk
 3qYLMSD1yS8QeiyUphsyKvo/+YfMwuDdUEdpPwGgcVmwqvAtVAA/mZiMe2e9BTVizlWL
 BYWIJ+Y45+ZAltMIa1kHl9TxZS5ZQJe5qhReMtQ0QKDT//ADste+uyQ30wfxw+RRPNGO
 ELSdmwhrGgiFUIhyo7m4DgzOd9F6MRG/XEtISxh8YmyrmJuL+wzBjBfc+n2IaZlLaxVL
 DkjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681707881; x=1684299881;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XRgyV45sC3yFfGtjCWQa17KCYHQxLEGRUh0zUxU90rM=;
 b=lKDPf2+Ut0cI51/+LF5Qz6waTEb6+h5HxxOjBQmBfPnlAe5kwd2VCaLlbCqdC7UGD2
 VbNYaiEmf6DOw+qbwQkx2N3wLSpDFJ4NGRLw/NJB6dHy05kmc+TtiTSr+MXKJZ3mU2/K
 ovw08pAdXfhAoXrovrdNoNEhuzP7NMOG5I+uTf3Xb1zOGctgUQkvdT8nDaat3oZr4vap
 PUpZa3CNagJfo84o9YU5yShMvBhMlsygsFaxz6ARCje97uKj1ux7zc93F737LNHUPIPE
 mpmWV++5/lRB5ATlYK1qYz5oWL14EQmkfUJrXXHhCNq31K/sBL9uBSJTxrPYziuUsV1P
 1EKQ==
X-Gm-Message-State: AAQBX9fpPrYoIPIP3fqtc7b7j5sLIqvQNNEl3pUsoQbKv+C8weaZ86RN
 t2wOimH1qBaDXsmt4WgggOAXAdDZpXqVrn/hniiPjtDpmIHbyA==
X-Google-Smtp-Source: AKy350ZZXz/cGN7VG/Aoy7l9gQ85AcXk7KaFgPZ6xk4ltqGXX8HOaNviH/JtCxpNMeBh9NqjJc1qnHjggdkpQYXjH+Y=
X-Received: by 2002:a9f:314e:0:b0:68b:90f4:1d8c with SMTP id
 n14-20020a9f314e000000b0068b90f41d8cmr6911028uab.1.1681707881047; Sun, 16 Apr
 2023 22:04:41 -0700 (PDT)
MIME-Version: 1.0
References: <20230410174910.4806-1-jth@kernel.org>
 <20230410174910.4806-5-jth@kernel.org>
In-Reply-To: <20230410174910.4806-5-jth@kernel.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 17 Apr 2023 15:04:15 +1000
Message-ID: <CAKmqyKOJoTsq04G-nJB81v9u_K4JmXAPa49O3GqWiFPTtaEfPg@mail.gmail.com>
Subject: Re: [PATCH v3 4/4] wdt_z069: Add support for MEN 16z069 Watchdog
To: Johannes Thumshirn <jth@kernel.org>
Cc: qemu-devel@nongnu.org, Alistair Francis <alistair@alistair23.me>, 
 Javier Rodriguez <josejavier.rodriguez@duagon.com>, 
 =?UTF-8?Q?Jorge_Sanjuan_Garc=C3=ADa?= <Jorge.SanjuanGarcia@duagon.com>, 
 Peter Maydell <peter.maydell@linaro.org>,
 Dmitry Fomichev <dmitry.fomichev@wdc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::92c;
 envelope-from=alistair23@gmail.com; helo=mail-ua1-x92c.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Tue, Apr 11, 2023 at 3:50=E2=80=AFAM Johannes Thumshirn <jth@kernel.org>=
 wrote:
>
> Add 16z069 Watchdog over MEN Chameleon BUS emulation.
>
> Signed-off-by: Johannes Thumshirn <jth@kernel.org>
> ---
>  hw/watchdog/Kconfig     |   5 +
>  hw/watchdog/meson.build |   1 +
>  hw/watchdog/wdt_z069.c  | 218 ++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 224 insertions(+)
>  create mode 100644 hw/watchdog/wdt_z069.c
>
> diff --git a/hw/watchdog/Kconfig b/hw/watchdog/Kconfig
> index 66e1d029e3..a3f1196f66 100644
> --- a/hw/watchdog/Kconfig
> +++ b/hw/watchdog/Kconfig
> @@ -20,3 +20,8 @@ config WDT_IMX2
>
>  config WDT_SBSA
>      bool
> +
> +config WDT_Z069
> +    bool
> +    default y if MCB
> +    depends on MCB
> diff --git a/hw/watchdog/meson.build b/hw/watchdog/meson.build
> index 8974b5cf4c..7bc353774e 100644
> --- a/hw/watchdog/meson.build
> +++ b/hw/watchdog/meson.build
> @@ -6,4 +6,5 @@ softmmu_ss.add(when: 'CONFIG_WDT_DIAG288', if_true: files=
('wdt_diag288.c'))
>  softmmu_ss.add(when: 'CONFIG_ASPEED_SOC', if_true: files('wdt_aspeed.c')=
)
>  softmmu_ss.add(when: 'CONFIG_WDT_IMX2', if_true: files('wdt_imx2.c'))
>  softmmu_ss.add(when: 'CONFIG_WDT_SBSA', if_true: files('sbsa_gwdt.c'))
> +softmmu_ss.add(when: 'CONFIG_WDT_Z069', if_true: files('wdt_z069.c'))
>  specific_ss.add(when: 'CONFIG_PSERIES', if_true: files('spapr_watchdog.c=
'))
> diff --git a/hw/watchdog/wdt_z069.c b/hw/watchdog/wdt_z069.c
> new file mode 100644
> index 0000000000..b20ceab532
> --- /dev/null
> +++ b/hw/watchdog/wdt_z069.c
> @@ -0,0 +1,218 @@
> +/*
> + * QEMU MEN 16z069 Watchdog over MCB emulation
> + *
> + * Copyright (C) 2023 Johannes Thumshirn <jth@kernel.org>
> + *
> + * This code is licensed under the GPL version 2 or later. See the
> + * COPYING file in the top-level directory.
> + */
> +#include "qemu/osdep.h"
> +#include "qemu/module.h"
> +#include "qemu/timer.h"
> +#include "sysemu/watchdog.h"
> +#include "hw/mcb/mcb.h"
> +#include "migration/vmstate.h"
> +#include "hw/qdev-properties.h"
> +
> +/* #define Z069_DEBUG 1 */
> +
> +#ifdef Z069_DEBUG
> +#define z069_debug(fmt, ...)                                        \
> +    fprintf(stderr, "wdt_z069: %s: "fmt, __func__, ##__VA_ARGS__)
> +#else
> +#define z069_debug(fmt, ...)
> +#endif

Same comment from the previous versions about using traces instead of
macro prints

Alistair

> +
> +#define MEN_Z069_WTR 0x10
> +#define MEN_Z069_WTR_WDEN BIT(15)
> +#define MEN_Z069_WTR_WDET_MASK  0x7fff
> +#define MEN_Z069_WVR 0x14
> +
> +#define CLK_500(x) ((x) * 2) /* 500Hz in ms */
> +
> +typedef struct {
> +    /*< private >*/
> +    MCBDevice dev;
> +
> +    /*< public >*/
> +    QEMUTimer *timer;
> +
> +    bool enabled;
> +    unsigned int timeout;
> +
> +    MemoryRegion mmio;
> +
> +    /* Registers */
> +    uint16_t wtr;
> +    uint16_t wvr;
> +} MENZ069State;
> +
> +static void men_z069_wdt_enable(MENZ069State *s)
> +{
> +    z069_debug("next timeout will fire in +%dms\n", s->timeout);
> +    timer_mod(s->timer, qemu_clock_get_ms(QEMU_CLOCK_VIRTUAL) + s->timeo=
ut);
> +}
> +
> +static void men_z069_wdt_disable(MENZ069State *s)
> +{
> +    timer_del(s->timer);
> +}
> +
> +static uint64_t men_z069_wdt_read(void *opaque, hwaddr addr, unsigned si=
ze)
> +{
> +    MENZ069State *s =3D opaque;
> +    uint64_t ret;
> +
> +    switch (addr) {
> +    case MEN_Z069_WTR:
> +        ret =3D s->wtr;
> +        break;
> +    case MEN_Z069_WVR:
> +        ret =3D s->wvr;
> +        break;
> +    default:
> +        ret =3D 0UL;
> +        break;
> +    }
> +
> +    z069_debug("returning: 0x%"PRIx64" @ 0x%lx\n", ret, addr);
> +    return ret;
> +}
> +
> +static void men_z069_wdt_write(void *opaque, hwaddr addr, uint64_t v,
> +                               unsigned size)
> +{
> +    MENZ069State *s =3D opaque;
> +    bool old_ena =3D s->enabled;
> +    uint16_t val =3D v & 0xffff;
> +    uint16_t tout;
> +
> +    z069_debug("got: 0x%"PRIx64" @ 0x%lx\n", v, addr);
> +
> +    switch (addr) {
> +    case MEN_Z069_WTR:
> +        s->wtr =3D val;
> +        tout =3D val & MEN_Z069_WTR_WDET_MASK;
> +        s->timeout =3D CLK_500(tout);
> +        s->enabled =3D val & MEN_Z069_WTR_WDEN;
> +        z069_debug("new timeout: %u (0x%x) %u\n", tout, tout, s->timeout=
);
> +
> +        if (old_ena && !s->enabled) {
> +            men_z069_wdt_disable(s);
> +        } else if (!old_ena && s->enabled) {
> +            men_z069_wdt_enable(s);
> +        }
> +
> +        break;
> +    case MEN_Z069_WVR:
> +        /* The watchdog trigger value toggles between 0x5555 and 0xaaaa =
*/
> +        if (val =3D=3D (s->wvr ^ 0xffff)) {
> +            s->wvr =3D val;
> +            z069_debug("watchdog triggered, next timeout will fire in +%=
dms\n",
> +                       s->timeout);
> +            timer_mod(s->timer,
> +                      qemu_clock_get_ms(QEMU_CLOCK_VIRTUAL) + s->timeout=
);
> +        }
> +        break;
> +    default:
> +        break;
> +    }
> +    return;
> +}
> +
> +static const MemoryRegionOps men_z069_io_ops =3D {
> +    .read =3D men_z069_wdt_read,
> +    .write =3D men_z069_wdt_write,
> +    .endianness =3D DEVICE_LITTLE_ENDIAN,
> +    .valid =3D {
> +        .min_access_size =3D 4,
> +        .max_access_size =3D 4
> +    },
> +    .impl =3D {
> +        .min_access_size =3D 4,
> +        .max_access_size =3D 4
> +    },
> +};
> +
> +static void men_z069_timer_expired(void *opaque)
> +{
> +    MENZ069State *s =3D opaque;
> +
> +    watchdog_perform_action();
> +    timer_del(s->timer);
> +}
> +
> +static void men_z069_wdt_realize(DeviceState *dev, Error **errp)
> +{
> +    MCBDevice *mdev =3D MCB_DEVICE(dev);
> +    MENZ069State *s =3D DO_UPCAST(MENZ069State, dev, mdev);
> +    MCBus *bus =3D MCB_BUS(qdev_get_parent_bus(DEVICE(dev)));
> +
> +    mdev->gdd =3D mcb_new_chameleon_descriptor(bus, 69, mdev->rev,
> +                                             mdev->var, 0x18);
> +    if (!mdev->gdd) {
> +        return;
> +    }
> +
> +    s->wvr =3D 0x5555;
> +    s->wtr =3D 0x7fff;
> +    s->timeout =3D CLK_500(s->wtr & MEN_Z069_WTR_WDET_MASK);
> +    s->timer =3D timer_new_ms(QEMU_CLOCK_VIRTUAL,
> +                            men_z069_timer_expired, s);
> +
> +    memory_region_init_io(&s->mmio, OBJECT(s),
> +                          &men_z069_io_ops, s, "z069.wdt", 0x16);
> +    memory_region_add_subregion(&bus->mmio_region, mdev->gdd->offset,
> +                                &s->mmio);
> +}
> +
> +static void men_z069_wdt_unrealize(DeviceState *dev)
> +{
> +    MCBDevice *mdev =3D MCB_DEVICE(dev);
> +
> +    g_free(&mdev->gdd);
> +}
> +
> +static const VMStateDescription vmstate_z069_wdt =3D {
> +    .name =3D "z069-wdt",
> +    .version_id =3D 1,
> +    .minimum_version_id =3D 1,
> +    .fields =3D (VMStateField[]) {
> +        VMSTATE_MCB_DEVICE(dev, MENZ069State),
> +        VMSTATE_TIMER_PTR(timer, MENZ069State),
> +        VMSTATE_END_OF_LIST()
> +    }
> +};
> +
> +static Property men_z069_wdt_properties[] =3D {
> +    DEFINE_PROP_UINT8("rev", MENZ069State, dev.rev, 0),
> +    DEFINE_PROP_UINT8("var", MENZ069State, dev.var, 0),
> +    DEFINE_PROP_END_OF_LIST(),
> +};
> +
> +static void men_z069_wdt_class_intifn(ObjectClass *klass, void *data)
> +{
> +    DeviceClass *dc =3D DEVICE_CLASS(klass);
> +    MCBDeviceClass *mc =3D MCB_DEVICE_CLASS(klass);
> +
> +    mc->realize =3D men_z069_wdt_realize;
> +    mc->unrealize =3D men_z069_wdt_unrealize;
> +
> +    dc->desc =3D "MEN 16z069 Watchdog Timer";
> +    dc->vmsd =3D &vmstate_z069_wdt;
> +    device_class_set_props(dc, men_z069_wdt_properties);
> +}
> +
> +static const TypeInfo men_z069_wdt_info =3D {
> +    .name =3D "z069-wdt",
> +    .parent =3D TYPE_MCB_DEVICE,
> +    .instance_size =3D sizeof(MENZ069State),
> +    .class_init =3D men_z069_wdt_class_intifn,
> +};
> +
> +static void men_z069_wdt_register_types(void)
> +{
> +    type_register_static(&men_z069_wdt_info);
> +}
> +
> +type_init(men_z069_wdt_register_types);
> --
> 2.39.2
>
>

