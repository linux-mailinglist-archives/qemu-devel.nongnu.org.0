Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E74EA6C90F4
	for <lists+qemu-devel@lfdr.de>; Sat, 25 Mar 2023 22:26:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pgBOQ-0005jE-Nt; Sat, 25 Mar 2023 17:25:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <strahinjapjankovic@gmail.com>)
 id 1pgBON-0005iU-Uo; Sat, 25 Mar 2023 17:25:40 -0400
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <strahinjapjankovic@gmail.com>)
 id 1pgBOL-0008Lt-61; Sat, 25 Mar 2023 17:25:39 -0400
Received: by mail-ed1-x529.google.com with SMTP id cn12so21281622edb.4;
 Sat, 25 Mar 2023 14:25:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1679779535;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Czl03zsxMG7vksUdBLSuneiprjNWyiqb2amGnmUhh6Q=;
 b=AnUl0w7pTvyE0LuqAL99Mw+m3wVmQmyu5zc9s+g2A6JomqmOJwEQ68+9dMl/suvfUr
 EY6/aMqlnqs+npbFvsw9pVDFdJSmhW7Cd/aLmYjyL2v2/A7C//PJ8Na4K2H84tmOqXsh
 EKhTS6OtSsVJFXxsR8jVne4d7yNKakl/PIID93jYEfiC7UEV4lLWv/7ZahLGY+2POU5o
 /lV96qWisGH7ph9mH6ZTwuQMT7XdMa61WuYCHtnHHA5Ap+VnsRLmpQezx3nM5KKGynnq
 8/06WgsGI6jyUC09jQSLj3mK7MPS7hReCLMkS6mdbxEIuM75EKMBDTwnbxWxkiOHaW2A
 27og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679779535;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Czl03zsxMG7vksUdBLSuneiprjNWyiqb2amGnmUhh6Q=;
 b=sWCNBPv19O7teptQvUEZhFOiuD4FVBRQrd1stiJJJaunbBrj9mSoCvGnro7cocfTP6
 FEqGGH7TG77yr3UAy2ZzD7W/yCNfAvDAdQ4GqJSsyvJbHKxIlqmUT86O1J87BdfdR2vO
 PlxIkeMDrGSUyEXW34EOsHJQ5Ud4wK8gZNB16+IC7Vcqtn3uYWUDMcF5HZTMjkCmiiuO
 XFTEkbpVZMubtpqa5iJGdkVOSa6u0tAr03LVxxLoOVP0YxN4t9Og0DOKr/teGyUW88QS
 Z7a40Os9UGuQ4WKAWFdj0nx6QnGo96Nkp84HNz5+xHPMETwtvnE8wRiH4b37tchjWOMp
 Korg==
X-Gm-Message-State: AO0yUKWKWgA4voISF8cX4RT/jiD+PG8CiSq+WEdeO/yyMxDwE2wZ0YSO
 wtt05ri2cIC07EIcmNuyAt63a4oC/iqSsEX25S06WUIP6pI=
X-Google-Smtp-Source: AK7set9iU/MTxRsU4YnKbwRYXMIrhuVl4+3uOEB2YhZwa+c2OJ53kNhlev/GF2SuuPy+edY1JdBOiFdsIAz8VHwxL98=
X-Received: by 2002:a17:906:ca41:b0:939:a51a:dc30 with SMTP id
 jx1-20020a170906ca4100b00939a51adc30mr7300803ejb.2.1679779535131; Sat, 25 Mar
 2023 14:25:35 -0700 (PDT)
MIME-Version: 1.0
References: <20230321102510.16754-1-qianfanguijin@163.com>
 <20230321102510.16754-6-qianfanguijin@163.com>
In-Reply-To: <20230321102510.16754-6-qianfanguijin@163.com>
From: Strahinja Jankovic <strahinjapjankovic@gmail.com>
Date: Sat, 25 Mar 2023 22:25:26 +0100
Message-ID: <CABtshVT3JvYShbwLD66Vk_jF7v2zV9fh1o46ejLdR4ma+k16og@mail.gmail.com>
Subject: Re: [PATCH v1 05/11] hw/misc: AXP221 PMU Emulation
To: qianfanguijin@163.com
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Peter Maydell <peter.maydell@linaro.org>,
 Beniamino Galvani <b.galvani@gmail.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Niek Linnenbank <nieklinnenbank@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=strahinjapjankovic@gmail.com; helo=mail-ed1-x529.google.com
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

On Tue, Mar 21, 2023 at 11:25=E2=80=AFAM <qianfanguijin@163.com> wrote:
>
> From: qianfan Zhao <qianfanguijin@163.com>
>
> This patch adds minimal support for AXP-221 PMU and connect it to
> bananapi M2U board.
>
> Signed-off-by: qianfan Zhao <qianfanguijin@163.com>

As I wrote in the RFC patch, I would suggest renaming the axp209.c
file to axp2xx_pmu.c and extending it with support for AXP-221.
The difference in emulated AXP-209 and AXP-221 is only in registers,
so they can share the functions.

Best regards,
Strahinja


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
> index 9e14c3427e..cf8fb083f8 100644
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
> index 96e35f1cdb..d407a2df50 100644
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

