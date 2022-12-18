Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E6E46504CB
	for <lists+qemu-devel@lfdr.de>; Sun, 18 Dec 2022 22:30:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p71Dc-0001wH-G1; Sun, 18 Dec 2022 16:29:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <strahinjapjankovic@gmail.com>)
 id 1p71Da-0001ve-1Z; Sun, 18 Dec 2022 16:29:10 -0500
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <strahinjapjankovic@gmail.com>)
 id 1p71DX-0004lt-RQ; Sun, 18 Dec 2022 16:29:09 -0500
Received: by mail-ej1-x62b.google.com with SMTP id x22so17429870ejs.11;
 Sun, 18 Dec 2022 13:29:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pR7CKCWdYvviAXpcjvekZj42UjXATm/fcHKvkFAaJdU=;
 b=GF+SE8TLfcIfmCL1QTot0FlGrPQjUx1l0C/H23SZUk4gcjIdJ+mdguZ6FW5iM6I3L0
 ElRTcZ3j5uRb41G2opTjgfNJ4nmPCiDHSH1dd5jlBgNHzRtGTPATjAxGINX3r1gyKAA8
 JfZRKAWELwSC4wqlljSZW90dA4pNm96oTJ36bIT/w055fxayunu/pLvSPeQeIORGJjUh
 9NbgFYI62QJWdIPsPj0igYQKEvfN7HOcuXgfEJQu32ktK7GIZQugNTYgbvfSlXy5tHHU
 mSIEty/cFtvWsmnofnciB4ey9rlH51kvtJR+fLAbixzg4SGJPQKhLh1/NIXlKqNwYXun
 kWOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pR7CKCWdYvviAXpcjvekZj42UjXATm/fcHKvkFAaJdU=;
 b=T3VPHr83dVK9hODfSQ7tE/kkn4ek7lK+iwK87/vx3431gjL7lEOPZuehp506jQ6Yu+
 93LgxMo23yrGBlkgOOeZyCrXQ7M8qDp6C8QKO0FZt+4dnei0XT2zYCT4hSeOKRYYytD7
 qAKxHVomIDrpDaFEy/P4g+2NBUuc1sUKQLOchc+TCUHrUZTykiNnS7w9ybl5cHyXHnXj
 VDoB2BlURzmdWbVLIn8Lip700P+aXud2q3alwNlwejTeA7+xQnvhcq8V5YtFyH8tAi88
 AvNSVRx+EuixzDVy6q5247Sl8vIGiBNeU/O7sNw+zqkq9ejAvp5P0xjeAUpTI3R2w6Ct
 TgRg==
X-Gm-Message-State: ANoB5pl+Gbqt59p1l0eYq7599HUhdNthELEwxgBH771Gkj+3yQgKzVj7
 C8DB+90qxgQJJ/VzboYEYdwkZgqZ6o0RvQskUJ7PpdCl+XmZcnms
X-Google-Smtp-Source: AA0mqf4086FAy12wGm6XcVzkknSNWYGGS2RNpWBIeuwE/Cd5xhDZXmx+lhHUW72rbG5tkYG6rx4E68LMaLASuwuyqtg=
X-Received: by 2002:a17:906:b34c:b0:7c0:a6d8:6a6b with SMTP id
 cd12-20020a170906b34c00b007c0a6d86a6bmr31343817ejb.194.1671398945754; Sun, 18
 Dec 2022 13:29:05 -0800 (PST)
MIME-Version: 1.0
References: <20221218211918.3592-1-strahinja.p.jankovic@gmail.com>
 <20221218211918.3592-5-strahinja.p.jankovic@gmail.com>
In-Reply-To: <20221218211918.3592-5-strahinja.p.jankovic@gmail.com>
From: Strahinja Jankovic <strahinjapjankovic@gmail.com>
Date: Sun, 18 Dec 2022 22:28:55 +0100
Message-ID: <CABtshVQkzuuu8i_CjATtLO7OWrZrGyxANsrf=eYyVbrE3yE_yA@mail.gmail.com>
Subject: Re: [PATCH v2 4/7] hw/misc: Allwinner AXP-209 Emulation
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Beniamino Galvani <b.galvani@gmail.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-arm@nongnu.org, 
 qemu-devel@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=strahinjapjankovic@gmail.com; helo=mail-ej1-x62b.google.com
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

I forgot to add Philippe Mathieu-Daud=C3=A9 in CC for this patch, so I'm
fixing it now.

Best regards,
Strahinja Jankovic

On Sun, Dec 18, 2022 at 10:19 PM Strahinja Jankovic
<strahinjapjankovic@gmail.com> wrote:
>
> This patch adds minimal support for AXP-209 PMU.
> Most important is chip ID since U-Boot SPL expects version 0x1. Besides
> the chip ID register, reset values for two more registers used by A10
> U-Boot SPL are covered.
>
> Signed-off-by: Strahinja Jankovic <strahinja.p.jankovic@gmail.com>
> ---
>  hw/arm/Kconfig              |   1 +
>  hw/misc/Kconfig             |   4 +
>  hw/misc/allwinner-axp-209.c | 238 ++++++++++++++++++++++++++++++++++++
>  hw/misc/meson.build         |   1 +
>  hw/misc/trace-events        |   5 +
>  5 files changed, 249 insertions(+)
>  create mode 100644 hw/misc/allwinner-axp-209.c
>
> diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
> index eefe1fd134..67c6e83fe6 100644
> --- a/hw/arm/Kconfig
> +++ b/hw/arm/Kconfig
> @@ -323,6 +323,7 @@ config ALLWINNER_A10
>      select ALLWINNER_A10_DRAMC
>      select ALLWINNER_EMAC
>      select ALLWINNER_I2C
> +    select ALLWINNER_AXP_209
>      select SERIAL
>      select UNIMP
>
> diff --git a/hw/misc/Kconfig b/hw/misc/Kconfig
> index 052fb54310..3855d937fd 100644
> --- a/hw/misc/Kconfig
> +++ b/hw/misc/Kconfig
> @@ -180,4 +180,8 @@ config ALLWINNER_A10_CCM
>  config ALLWINNER_A10_DRAMC
>      bool
>
> +config ALLWINNER_AXP_209
> +    bool
> +    depends on I2C
> +
>  source macio/Kconfig
> diff --git a/hw/misc/allwinner-axp-209.c b/hw/misc/allwinner-axp-209.c
> new file mode 100644
> index 0000000000..cf79175034
> --- /dev/null
> +++ b/hw/misc/allwinner-axp-209.c
> @@ -0,0 +1,238 @@
> +/*
> + * AXP-209 Emulation
> + *
> + * Copyright (C) 2022 Strahinja Jankovic <strahinja.p.jankovic@gmail.com=
>
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
> +#include "trace.h"
> +#include "hw/i2c/i2c.h"
> +#include "migration/vmstate.h"
> +
> +#define TYPE_AXP_209 "allwinner.axp209"
> +
> +#define AXP_209(obj) \
> +    OBJECT_CHECK(AXP209I2CState, (obj), TYPE_AXP_209)
> +
> +/* registers */
> +enum {
> +    REG_POWER_STATUS =3D 0x0u,
> +    REG_OPERATING_MODE,
> +    REG_OTG_VBUS_STATUS,
> +    REG_CHIP_VERSION,
> +    REG_DATA_CACHE_0,
> +    REG_DATA_CACHE_1,
> +    REG_DATA_CACHE_2,
> +    REG_DATA_CACHE_3,
> +    REG_DATA_CACHE_4,
> +    REG_DATA_CACHE_5,
> +    REG_DATA_CACHE_6,
> +    REG_DATA_CACHE_7,
> +    REG_DATA_CACHE_8,
> +    REG_DATA_CACHE_9,
> +    REG_DATA_CACHE_A,
> +    REG_DATA_CACHE_B,
> +    REG_POWER_OUTPUT_CTRL =3D 0x12u,
> +    REG_DC_DC2_OUT_V_CTRL =3D 0x23u,
> +    REG_DC_DC2_DVS_CTRL =3D 0x25u,
> +    REG_DC_DC3_OUT_V_CTRL =3D 0x27u,
> +    REG_LDO2_4_OUT_V_CTRL,
> +    REG_LDO3_OUT_V_CTRL,
> +    REG_VBUS_CH_MGMT =3D 0x30u,
> +    REG_SHUTDOWN_V_CTRL,
> +    REG_SHUTDOWN_CTRL,
> +    REG_CHARGE_CTRL_1,
> +    REG_CHARGE_CTRL_2,
> +    REG_SPARE_CHARGE_CTRL,
> +    REG_PEK_KEY_CTRL,
> +    REG_DC_DC_FREQ_SET,
> +    REG_CHR_TEMP_TH_SET,
> +    REG_CHR_HIGH_TEMP_TH_CTRL,
> +    REG_IPSOUT_WARN_L1,
> +    REG_IPSOUT_WARN_L2,
> +    REG_DISCHR_TEMP_TH_SET,
> +    REG_DISCHR_HIGH_TEMP_TH_CTRL,
> +    REG_IRQ_BANK_1_CTRL =3D 0x40u,
> +    REG_IRQ_BANK_2_CTRL,
> +    REG_IRQ_BANK_3_CTRL,
> +    REG_IRQ_BANK_4_CTRL,
> +    REG_IRQ_BANK_5_CTRL,
> +    REG_IRQ_BANK_1_STAT =3D 0x48u,
> +    REG_IRQ_BANK_2_STAT,
> +    REG_IRQ_BANK_3_STAT,
> +    REG_IRQ_BANK_4_STAT,
> +    REG_IRQ_BANK_5_STAT,
> +    REG_ADC_ACIN_V_H =3D 0x56u,
> +    REG_ADC_ACIN_V_L,
> +    REG_ADC_ACIN_CURR_H,
> +    REG_ADC_ACIN_CURR_L,
> +    REG_ADC_VBUS_V_H,
> +    REG_ADC_VBUS_V_L,
> +    REG_ADC_VBUS_CURR_H,
> +    REG_ADC_VBUS_CURR_L,
> +    REG_ADC_INT_TEMP_H,
> +    REG_ADC_INT_TEMP_L,
> +    REG_ADC_TEMP_SENS_V_H =3D 0x62u,
> +    REG_ADC_TEMP_SENS_V_L,
> +    REG_ADC_BAT_V_H =3D 0x78u,
> +    REG_ADC_BAT_V_L,
> +    REG_ADC_BAT_DISCHR_CURR_H,
> +    REG_ADC_BAT_DISCHR_CURR_L,
> +    REG_ADC_BAT_CHR_CURR_H,
> +    REG_ADC_BAT_CHR_CURR_L,
> +    REG_ADC_IPSOUT_V_H,
> +    REG_ADC_IPSOUT_V_L,
> +    REG_DC_DC_MOD_SEL =3D 0x80u,
> +    REG_ADC_EN_1,
> +    REG_ADC_EN_2,
> +    REG_ADC_SR_CTRL,
> +    REG_ADC_IN_RANGE,
> +    REG_GPIO1_ADC_IRQ_RISING_TH,
> +    REG_GPIO1_ADC_IRQ_FALLING_TH,
> +    REG_TIMER_CTRL =3D 0x8au,
> +    REG_VBUS_CTRL_MON_SRP,
> +    REG_OVER_TEMP_SHUTDOWN =3D 0x8fu,
> +    REG_GPIO0_FEAT_SET,
> +    REG_GPIO_OUT_HIGH_SET,
> +    REG_GPIO1_FEAT_SET,
> +    REG_GPIO2_FEAT_SET,
> +    REG_GPIO_SIG_STATE_SET_MON,
> +    REG_GPIO3_SET,
> +    REG_COULOMB_CNTR_CTRL =3D 0xb8u,
> +    REG_POWER_MEAS_RES,
> +    NR_REGS
> +};
> +
> +#define AXP_209_CHIP_VERSION_ID             (0x01)
> +#define AXP_209_DC_DC2_OUT_V_CTRL_RESET     (0x16)
> +#define AXP_209_IRQ_BANK_1_CTRL_RESET       (0xd8)
> +
> +/* A simple I2C slave which returns values of ID or CNT register. */
> +typedef struct AXP209I2CState {
> +    /*< private >*/
> +    I2CSlave i2c;
> +    /*< public >*/
> +    uint8_t regs[NR_REGS];  /* peripheral registers */
> +    uint8_t ptr;            /* current register index */
> +    uint8_t count;          /* counter used for tx/rx */
> +} AXP209I2CState;
> +
> +/* Reset all counters and load ID register */
> +static void axp_209_reset_enter(Object *obj, ResetType type)
> +{
> +    AXP209I2CState *s =3D AXP_209(obj);
> +
> +    memset(s->regs, 0, NR_REGS);
> +    s->ptr =3D 0;
> +    s->count =3D 0;
> +    s->regs[REG_CHIP_VERSION] =3D AXP_209_CHIP_VERSION_ID;
> +    s->regs[REG_DC_DC2_OUT_V_CTRL] =3D AXP_209_DC_DC2_OUT_V_CTRL_RESET;
> +    s->regs[REG_IRQ_BANK_1_CTRL] =3D AXP_209_IRQ_BANK_1_CTRL_RESET;
> +}
> +
> +/* Handle events from master. */
> +static int axp_209_event(I2CSlave *i2c, enum i2c_event event)
> +{
> +    AXP209I2CState *s =3D AXP_209(i2c);
> +
> +    s->count =3D 0;
> +
> +    return 0;
> +}
> +
> +/* Called when master requests read */
> +static uint8_t axp_209_rx(I2CSlave *i2c)
> +{
> +    AXP209I2CState *s =3D AXP_209(i2c);
> +    uint8_t ret =3D 0xff;
> +
> +    if (s->ptr < NR_REGS) {
> +        ret =3D s->regs[s->ptr++];
> +    }
> +
> +    trace_allwinner_axp_209_rx(s->ptr - 1, ret);
> +
> +    return ret;
> +}
> +
> +/*
> + * Called when master sends write.
> + * Update ptr with byte 0, then perform write with second byte.
> + */
> +static int axp_209_tx(I2CSlave *i2c, uint8_t data)
> +{
> +    AXP209I2CState *s =3D AXP_209(i2c);
> +
> +    if (s->count =3D=3D 0) {
> +        /* Store register address */
> +        s->ptr =3D data;
> +        s->count++;
> +        trace_allwinner_axp_209_select(data);
> +    } else {
> +        trace_allwinner_axp_209_tx(s->ptr, data);
> +        if (s->ptr =3D=3D REG_DC_DC2_OUT_V_CTRL) {
> +            s->regs[s->ptr++] =3D data;
> +        }
> +    }
> +
> +    return 0;
> +}
> +
> +static const VMStateDescription vmstate_axp_209 =3D {
> +    .name =3D TYPE_AXP_209,
> +    .version_id =3D 1,
> +    .fields =3D (VMStateField[]) {
> +        VMSTATE_UINT8_ARRAY(regs, AXP209I2CState, NR_REGS),
> +        VMSTATE_UINT8(count, AXP209I2CState),
> +        VMSTATE_UINT8(ptr, AXP209I2CState),
> +        VMSTATE_END_OF_LIST()
> +    }
> +};
> +
> +static void axp_209_class_init(ObjectClass *oc, void *data)
> +{
> +    DeviceClass *dc =3D DEVICE_CLASS(oc);
> +    I2CSlaveClass *isc =3D I2C_SLAVE_CLASS(oc);
> +    ResettableClass *rc =3D RESETTABLE_CLASS(oc);
> +
> +    rc->phases.enter =3D axp_209_reset_enter;
> +    dc->vmsd =3D &vmstate_axp_209;
> +    isc->event =3D axp_209_event;
> +    isc->recv =3D axp_209_rx;
> +    isc->send =3D axp_209_tx;
> +}
> +
> +static const TypeInfo axp_209_info =3D {
> +    .name =3D TYPE_AXP_209,
> +    .parent =3D TYPE_I2C_SLAVE,
> +    .instance_size =3D sizeof(AXP209I2CState),
> +    .class_init =3D axp_209_class_init
> +};
> +
> +static void axp_209_register_devices(void)
> +{
> +    type_register_static(&axp_209_info);
> +}
> +
> +type_init(axp_209_register_devices);
> diff --git a/hw/misc/meson.build b/hw/misc/meson.build
> index 9eaa0750b5..7d332851cb 100644
> --- a/hw/misc/meson.build
> +++ b/hw/misc/meson.build
> @@ -40,6 +40,7 @@ softmmu_ss.add(when: 'CONFIG_IVSHMEM_DEVICE', if_true: =
files('ivshmem.c'))
>
>  softmmu_ss.add(when: 'CONFIG_ALLWINNER_A10_CCM', if_true: files('allwinn=
er-a10-ccm.c'))
>  softmmu_ss.add(when: 'CONFIG_ALLWINNER_A10_DRAMC', if_true: files('allwi=
nner-a10-dramc.c'))
> +softmmu_ss.add(when: 'CONFIG_ALLWINNER_AXP_209', if_true: files('allwinn=
er-axp-209.c'))
>  softmmu_ss.add(when: 'CONFIG_ALLWINNER_H3', if_true: files('allwinner-h3=
-ccu.c'))
>  specific_ss.add(when: 'CONFIG_ALLWINNER_H3', if_true: files('allwinner-c=
pucfg.c'))
>  softmmu_ss.add(when: 'CONFIG_ALLWINNER_H3', if_true: files('allwinner-h3=
-dramc.c'))
> diff --git a/hw/misc/trace-events b/hw/misc/trace-events
> index c18bc0605e..f6a7a6901f 100644
> --- a/hw/misc/trace-events
> +++ b/hw/misc/trace-events
> @@ -1,5 +1,10 @@
>  # See docs/devel/tracing.rst for syntax documentation.
>
> +# allwinner-axp209.c
> +allwinner_axp_209_rx(uint8_t reg, uint8_t data) "Read reg 0x%" PRIx8 " :=
 0x%" PRIx8
> +allwinner_axp_209_select(uint8_t reg) "Accessing reg 0x%" PRIx8
> +allwinner_axp_209_tx(uint8_t reg, uint8_t data) "Write reg 0x%" PRIx8 " =
: 0x%" PRIx8
> +
>  # allwinner-cpucfg.c
>  allwinner_cpucfg_cpu_reset(uint8_t cpu_id, uint32_t reset_addr) "id %u, =
reset_addr 0x%" PRIx32
>  allwinner_cpucfg_read(uint64_t offset, uint64_t data, unsigned size) "of=
fset 0x%" PRIx64 " data 0x%" PRIx64 " size %" PRIu32
> --
> 2.30.2
>

