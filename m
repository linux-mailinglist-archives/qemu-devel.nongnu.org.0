Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2290A6B5CC4
	for <lists+qemu-devel@lfdr.de>; Sat, 11 Mar 2023 15:21:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pb04H-0003WT-3J; Sat, 11 Mar 2023 09:19:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <strahinjapjankovic@gmail.com>)
 id 1pb04C-0003Vg-BL; Sat, 11 Mar 2023 09:19:24 -0500
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <strahinjapjankovic@gmail.com>)
 id 1pb04A-0007B0-6Q; Sat, 11 Mar 2023 09:19:24 -0500
Received: by mail-ed1-x535.google.com with SMTP id y4so2353496edo.2;
 Sat, 11 Mar 2023 06:19:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678544359;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=77tdbtU6SaX7csBpW4Eecf7QEOc6bByYf+Fx5utizEQ=;
 b=p2xQmPGNfrFFlDyFlfp16+MTUw4RM3CgnuyqhloTGRz0HGIPQSfeMpE8xIoBpJfd5s
 aHdcQylIb1g9ayUQ90qThgP8U6rxWjZCKH0chnIugQ7XV6wkM6QkEccnYla6oGbNrCY+
 JIYpCslc6BiYSDAUFP3TyLyz2qwhmm/Afw7FZgwpbulUYrN2A6cewnLoeBwj0j9AErfc
 tE9Aal6/iCcXtQS/pMgYXElWVw+mBlpUEFz1wPde1NOed45CTefx9w1b9zS6JmDnEs/g
 JlAWspOLR/CJj9tokR2ncUtxlE6GID+IKsAlFZPYYOaNoh4zAJQjjLjD2Tdwi1b5zZ5u
 rtog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678544359;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=77tdbtU6SaX7csBpW4Eecf7QEOc6bByYf+Fx5utizEQ=;
 b=KEgznABC0OXu4m0zDqbCOwGRUwx80TXi4Vv0LdKBMDNOb/vy+aK98GEmY0H9ZSquBu
 rk4StUSG3uhRiJzSyTNz1fCdnOi0OjVwyVwlQuRIFzJa14QFMxcn3S3P+dDXkBPEUNuD
 Bf9WgGf6ylgDbu9DmrEuF385eWPwL+MzrTb8qmxDH5s5a9/o0GcvnLcI72CsbVwDqK9R
 KeQt/xhfQsE0xyMcgcYdr8PJzhB8loTZwMN0Aw+Ubm+1JFKd6hrIUCipi/UHb7ez/J5V
 47aFIC/MTXUAPQ2ghIxh0JU76yIH8XniohiBXGjAMHUOFMsvFMliEqzu3nhkDdHYzHZr
 D3Cw==
X-Gm-Message-State: AO0yUKXgTdXficod7AVlZTFb7pLCLGYRgtwliQ8GWK8o2Ocon05dslR/
 PiSMCbtd9wm0S7YKVzVs9Nva84uFwkjN4PHjpI0=
X-Google-Smtp-Source: AK7set/LRiYw4vaiDj/HMn2g7kJYHbVt9l4ZjWIWONdVEMXBPHbmAVb8Gv5JXrqSZMYGiyNCTvehWDj/DC0yxAIY/EI=
X-Received: by 2002:a17:906:3087:b0:878:4a24:1a5c with SMTP id
 7-20020a170906308700b008784a241a5cmr13584004ejv.6.1678544358651; Sat, 11 Mar
 2023 06:19:18 -0800 (PST)
MIME-Version: 1.0
References: <20230302114102.32236-1-qianfanguijin@163.com>
 <20230302114102.32236-9-qianfanguijin@163.com>
In-Reply-To: <20230302114102.32236-9-qianfanguijin@163.com>
From: Strahinja Jankovic <strahinjapjankovic@gmail.com>
Date: Sat, 11 Mar 2023 15:19:07 +0100
Message-ID: <CABtshVSvzLtNbBvdi72P7B1Vc5nN5YKk4iAkZR2-DsEZxvRhiQ@mail.gmail.com>
Subject: Re: [RFC PATCH v1 08/12] hw/misc: AXP221 PMU Emulation
To: qianfanguijin@163.com
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Peter Maydell <peter.maydell@linaro.org>,
 Beniamino Galvani <b.galvani@gmail.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Niek Linnenbank <nieklinnenbank@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=strahinjapjankovic@gmail.com; helo=mail-ed1-x535.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Hi,

Thank you for submitting the patch set for R40. I think Niek and Peter
covered the most important comments in the cover e-mail that you sent.


On Thu, Mar 2, 2023 at 12:41=E2=80=AFPM <qianfanguijin@163.com> wrote:
>
> From: qianfan Zhao <qianfanguijin@163.com>
>
> This patch adds minimal support for AXP-221 PMU and connect it to
> bananapi M2U board.
>
> Signed-off-by: qianfan Zhao <qianfanguijin@163.com>

I would just like to suggest merging the AXP-221 PMU implementation
with the AXP-209 (perhaps into axp2xx_pmu.c), since behavior and
functionality of both devices is the same.
From what I can see, the difference is only in the register map and
reset values, so the functions can be shared.

Other than that, great work!

I hope I will have more time when you submit the patches without the
RFC tag, so I can help with the review.

Best regards,
Strahinja Jankovic



> ---
>  hw/arm/Kconfig        |   1 +
>  hw/arm/bananapi_m2u.c |   5 ++
>  hw/misc/Kconfig       |   4 +
>  hw/misc/axp221.c      | 196 ++++++++++++++++++++++++++++++++++++++++++
>  hw/misc/meson.build   |   1 +
>  hw/misc/trace-events  |   5 ++
>  6 files changed, 212 insertions(+)
>  create mode 100644 hw/misc/axp221.c
>
> diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
> index 8eabedce43..5d2c10cb18 100644
> --- a/hw/arm/Kconfig
> +++ b/hw/arm/Kconfig
> @@ -347,6 +347,7 @@ config ALLWINNER_H3
>  config ALLWINNER_R40
>      bool
>      select ALLWINNER_A10_PIT
> +    select AXP221_PMU
>      select SERIAL
>      select ARM_TIMER
>      select ARM_GIC
> diff --git a/hw/arm/bananapi_m2u.c b/hw/arm/bananapi_m2u.c
> index 1b6241719d..bdee12efd3 100644
> --- a/hw/arm/bananapi_m2u.c
> +++ b/hw/arm/bananapi_m2u.c
> @@ -22,6 +22,7 @@
>  #include "exec/address-spaces.h"
>  #include "qapi/error.h"
>  #include "hw/boards.h"
> +#include "hw/i2c/i2c.h"
>  #include "hw/qdev-properties.h"
>  #include "hw/arm/allwinner-r40.h"
>
> @@ -91,6 +92,10 @@ static void bpim2u_init(MachineState *machine)
>                       &bootroom_loaded);
>      mmc_attach_drive(r40, &r40->mmc3, 3, false, NULL);
>
> +    /* Connect AXP221 */
> +    i2c =3D I2C_BUS(qdev_get_child_bus(DEVICE(&r40->i2c0), "i2c"));
> +    i2c_slave_create_simple(i2c, "axp221_pmu", 0x34);
> +
>      /* SDRAM */
>      memory_region_add_subregion(get_system_memory(), r40->memmap[AW_R40_=
DEV_SDRAM],
>                                  machine->ram);
> diff --git a/hw/misc/Kconfig b/hw/misc/Kconfig
> index 2ef5781ef8..f66ac390b1 100644
> --- a/hw/misc/Kconfig
> +++ b/hw/misc/Kconfig
> @@ -180,4 +180,8 @@ config AXP209_PMU
>      bool
>      depends on I2C
>
> +config AXP221_PMU
> +    bool
> +    depends on I2C
> +
>  source macio/Kconfig
> diff --git a/hw/misc/axp221.c b/hw/misc/axp221.c
> new file mode 100644
> index 0000000000..47784bb085
> --- /dev/null
> +++ b/hw/misc/axp221.c
> @@ -0,0 +1,196 @@
> +/*
> + * AXP-221/221s PMU Emulation
> + *
> + * Copyright (C) 2023 qianfan Zhao <qianfanguijin@163.com>
> + *
> + * Permission is hereby granted, free of charge, to any person obtaining=
 a
> + * copy of this software and associated documentation files (the "Softwa=
re"),
> + * to deal in the Software without restriction, including without limita=
tion
> + * the rights to use, copy, modify, merge, publish, distribute, sublicen=
se,
> + * and/or sell copies of the Software, and to permit persons to whom the
> + * Software is furnished to do so, subject to the following conditions:
> + *
> + * The above copyright notice and this permission notice shall be includ=
ed in
> + * all copies or substantial portions of the Software.
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRE=
SS OR
> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILI=
TY,
> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHA=
LL THE
> + * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHE=
R
> + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISI=
NG
> + * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
> + * DEALINGS IN THE SOFTWARE.
> + *
> + * SPDX-License-Identifier: MIT
> + */
> +
> +#include "qemu/osdep.h"
> +#include "qemu/log.h"
> +#include "qemu/bitops.h"
> +#include "trace.h"
> +#include "hw/i2c/i2c.h"
> +#include "migration/vmstate.h"
> +
> +#define TYPE_AXP221_PMU "axp221_pmu"
> +
> +#define AXP221(obj) \
> +    OBJECT_CHECK(AXP221I2CState, (obj), TYPE_AXP221_PMU)
> +
> +#define NR_REGS                         0xff
> +
> +/* A simple I2C slave which returns values of ID or CNT register. */
> +typedef struct AXP221I2CState {
> +    /*< private >*/
> +    I2CSlave i2c;
> +    /*< public >*/
> +    uint8_t regs[NR_REGS];  /* peripheral registers */
> +    uint8_t ptr;            /* current register index */
> +    uint8_t count;          /* counter used for tx/rx */
> +} AXP221I2CState;
> +
> +#define AXP221_PWR_STATUS_ACIN_PRESENT          BIT(7)
> +#define AXP221_PWR_STATUS_ACIN_AVAIL            BIT(6)
> +#define AXP221_PWR_STATUS_VBUS_PRESENT          BIT(5)
> +#define AXP221_PWR_STATUS_VBUS_USED             BIT(4)
> +#define AXP221_PWR_STATUS_BAT_CHARGING          BIT(2)
> +#define AXP221_PWR_STATUS_ACIN_VBUS_POWERED     BIT(1)
> +
> +/* Reset all counters and load ID register */
> +static void axp221_reset_enter(Object *obj, ResetType type)
> +{
> +    AXP221I2CState *s =3D AXP221(obj);
> +
> +    memset(s->regs, 0, NR_REGS);
> +    s->ptr =3D 0;
> +    s->count =3D 0;
> +
> +    /* input power status register */
> +    s->regs[0x00] =3D AXP221_PWR_STATUS_ACIN_PRESENT
> +                    | AXP221_PWR_STATUS_ACIN_AVAIL
> +                    | AXP221_PWR_STATUS_ACIN_VBUS_POWERED;
> +
> +    s->regs[0x01] =3D 0x00; /* no battery is connected */
> +
> +    /* CHIPID register, no documented on datasheet, but it is checked in
> +     * u-boot spl. I had read it from AXP221s and got 0x06 value.
> +     * So leave 06h here.
> +     */
> +    s->regs[0x03] =3D 0x06;
> +
> +    s->regs[0x10] =3D 0xbf;
> +    s->regs[0x13] =3D 0x01;
> +    s->regs[0x30] =3D 0x60;
> +    s->regs[0x31] =3D 0x03;
> +    s->regs[0x32] =3D 0x43;
> +    s->regs[0x33] =3D 0xc6;
> +    s->regs[0x34] =3D 0x45;
> +    s->regs[0x35] =3D 0x0e;
> +    s->regs[0x36] =3D 0x5d;
> +    s->regs[0x37] =3D 0x08;
> +    s->regs[0x38] =3D 0xa5;
> +    s->regs[0x39] =3D 0x1f;
> +    s->regs[0x3c] =3D 0xfc;
> +    s->regs[0x3d] =3D 0x16;
> +    s->regs[0x80] =3D 0x80;
> +    s->regs[0x82] =3D 0xe0;
> +    s->regs[0x84] =3D 0x32;
> +    s->regs[0x8f] =3D 0x01;
> +
> +    s->regs[0x90] =3D 0x07;
> +    s->regs[0x91] =3D 0x1f;
> +    s->regs[0x92] =3D 0x07;
> +    s->regs[0x93] =3D 0x1f;
> +
> +    s->regs[0x40] =3D 0xd8;
> +    s->regs[0x41] =3D 0xff;
> +    s->regs[0x42] =3D 0x03;
> +    s->regs[0x43] =3D 0x03;
> +
> +    s->regs[0xb8] =3D 0xc0;
> +    s->regs[0xb9] =3D 0x64;
> +    s->regs[0xe6] =3D 0xa0;
> +}
> +
> +/* Handle events from master. */
> +static int axp221_event(I2CSlave *i2c, enum i2c_event event)
> +{
> +    AXP221I2CState *s =3D AXP221(i2c);
> +
> +    s->count =3D 0;
> +
> +    return 0;
> +}
> +
> +/* Called when master requests read */
> +static uint8_t axp221_rx(I2CSlave *i2c)
> +{
> +    AXP221I2CState *s =3D AXP221(i2c);
> +    uint8_t ret =3D 0xff;
> +
> +    if (s->ptr < NR_REGS) {
> +        ret =3D s->regs[s->ptr];
> +        trace_axp221_rx(s->ptr, ret);
> +        s->ptr++;
> +    }
> +
> +    return ret;
> +}
> +
> +/*
> + * Called when master sends write.
> + * Update ptr with byte 0, then perform write with second byte.
> + */
> +static int axp221_tx(I2CSlave *i2c, uint8_t data)
> +{
> +    AXP221I2CState *s =3D AXP221(i2c);
> +
> +    if (s->count =3D=3D 0) {
> +        /* Store register address */
> +        s->ptr =3D data;
> +        s->count++;
> +        trace_axp221_select(data);
> +    } else {
> +        trace_axp221_tx(s->ptr, data);
> +        s->regs[s->ptr++] =3D data;
> +    }
> +
> +    return 0;
> +}
> +
> +static const VMStateDescription vmstate_axp221 =3D {
> +    .name =3D TYPE_AXP221_PMU,
> +    .version_id =3D 1,
> +    .fields =3D (VMStateField[]) {
> +        VMSTATE_UINT8_ARRAY(regs, AXP221I2CState, NR_REGS),
> +        VMSTATE_UINT8(count, AXP221I2CState),
> +        VMSTATE_UINT8(ptr, AXP221I2CState),
> +        VMSTATE_END_OF_LIST()
> +    }
> +};
> +
> +static void axp221_class_init(ObjectClass *oc, void *data)
> +{
> +    DeviceClass *dc =3D DEVICE_CLASS(oc);
> +    I2CSlaveClass *isc =3D I2C_SLAVE_CLASS(oc);
> +    ResettableClass *rc =3D RESETTABLE_CLASS(oc);
> +
> +    rc->phases.enter =3D axp221_reset_enter;
> +    dc->vmsd =3D &vmstate_axp221;
> +    isc->event =3D axp221_event;
> +    isc->recv =3D axp221_rx;
> +    isc->send =3D axp221_tx;
> +}
> +
> +static const TypeInfo axp221_info =3D {
> +    .name =3D TYPE_AXP221_PMU,
> +    .parent =3D TYPE_I2C_SLAVE,
> +    .instance_size =3D sizeof(AXP221I2CState),
> +    .class_init =3D axp221_class_init
> +};
> +
> +static void axp221_register_devices(void)
> +{
> +    type_register_static(&axp221_info);
> +}
> +
> +type_init(axp221_register_devices);
> diff --git a/hw/misc/meson.build b/hw/misc/meson.build
> index b19b44841a..6b81670641 100644
> --- a/hw/misc/meson.build
> +++ b/hw/misc/meson.build
> @@ -46,6 +46,7 @@ softmmu_ss.add(when: 'CONFIG_ALLWINNER_H3', if_true: fi=
les('allwinner-h3-sysctrl
>  softmmu_ss.add(when: 'CONFIG_ALLWINNER_H3', if_true: files('allwinner-si=
d.c'))
>  softmmu_ss.add(when: 'CONFIG_ALLWINNER_R40', if_true: files('allwinner-r=
40-ccu.c'))
>  softmmu_ss.add(when: 'CONFIG_AXP209_PMU', if_true: files('axp209.c'))
> +softmmu_ss.add(when: 'CONFIG_AXP221_PMU', if_true: files('axp221.c'))
>  softmmu_ss.add(when: 'CONFIG_REALVIEW', if_true: files('arm_sysctl.c'))
>  softmmu_ss.add(when: 'CONFIG_NSERIES', if_true: files('cbus.c'))
>  softmmu_ss.add(when: 'CONFIG_ECCMEMCTL', if_true: files('eccmemctl.c'))
> diff --git a/hw/misc/trace-events b/hw/misc/trace-events
> index c47876a902..63b072d2d8 100644
> --- a/hw/misc/trace-events
> +++ b/hw/misc/trace-events
> @@ -28,6 +28,11 @@ axp209_rx(uint8_t reg, uint8_t data) "Read reg 0x%" PR=
Ix8 " : 0x%" PRIx8
>  axp209_select(uint8_t reg) "Accessing reg 0x%" PRIx8
>  axp209_tx(uint8_t reg, uint8_t data) "Write reg 0x%" PRIx8 " : 0x%" PRIx=
8
>
> +# axp221.c
> +axp221_rx(uint8_t reg, uint8_t data) "Read reg 0x%" PRIx8 " : 0x%" PRIx8
> +axp221_select(uint8_t reg) "Accessing reg 0x%" PRIx8
> +axp221_tx(uint8_t reg, uint8_t data) "Write reg 0x%" PRIx8 " : 0x%" PRIx=
8
> +
>  # eccmemctl.c
>  ecc_mem_writel_mer(uint32_t val) "Write memory enable 0x%08x"
>  ecc_mem_writel_mdr(uint32_t val) "Write memory delay 0x%08x"
> --
> 2.25.1
>

