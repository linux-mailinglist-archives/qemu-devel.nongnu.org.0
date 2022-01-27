Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 24D4449EADD
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Jan 2022 20:08:47 +0100 (CET)
Received: from localhost ([::1]:34758 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDA8N-0002Kl-JV
	for lists+qemu-devel@lfdr.de; Thu, 27 Jan 2022 14:08:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39620)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nDA1r-0006xN-ID
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 14:01:57 -0500
Received: from [2a00:1450:4864:20::334] (port=33518
 helo=mail-wm1-x334.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nDA1W-0004wD-Bm
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 14:01:51 -0500
Received: by mail-wm1-x334.google.com with SMTP id
 n12-20020a05600c3b8c00b0034eb13edb8eso3757596wms.0
 for <qemu-devel@nongnu.org>; Thu, 27 Jan 2022 11:00:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jQgzxtuA/4pNZ8F2DisKqhzE9DyFQaSbe7o93IXbdBg=;
 b=fuNWNSa0BMXY9K4ETo6au8x3iAPVVMRJbMDmbi33kU34cbwsjrfilrSIzP68Wb0WdR
 vI7QIF1gmTDdVkGW+WiKmrTMgLT4t7jqbVrcxbq0Wk/RizJUhH8dcvmusugDWAOta5kT
 H6uNd2KDXDorwUeZkAzJFyctNUcWuMH4aP5kDJqrW7+AZAXyIzmDpTdbim2sGoHW3reK
 EpAhqMkm+1y4WU7NFeskXUSAlkSX+WOnxpVoSmJn8fT+BsQMxWHEQp2YXZd3x2pjgbni
 8FJslBfSR+YoDqwh9LBFd2ySH7HZU2WLEqzEHsZiOSVkcP3gmdHpjEEZOywpu04IAhfH
 nM1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jQgzxtuA/4pNZ8F2DisKqhzE9DyFQaSbe7o93IXbdBg=;
 b=IWHf01X0kljpHgpU3qJMO3/Znw4flwzZvznRrsCEGjskseVZ6rjtkJGyfb5O3QuQvI
 oBtPyUUD3g7ZRxtQjvUBo98g3wy5LbTD1O4AB7NNouCGZwAb9UeMxpI65q4Zp0JmbBMC
 bDPxtX6j++u3ASacZ2J3+0UHx/rpwCXpBdHsU3yRB8hiw8jOfcI1ZG/SmYxygeBw1N6T
 5zwZgkhi4IoaaCXClRc00yosN1ZFp9BE5AySIOBaKiHktrg9D9lIFlM61qDjoOd/CnKB
 ZSV70KP2qzyaM++cL3/OgX4S5MJNLCe3mg23Ki548T698GfeceFKQjI9d1Rlkn6pnkud
 GNJQ==
X-Gm-Message-State: AOAM532ZuimSNABOlZ3XVshoYjTiTd4Yquij5gfC+l4y62rhDMHfh9YH
 9IVIOgsN+Uy8x5OX0+h+c6h1KOjVLfC3dFBA1IHq7g==
X-Google-Smtp-Source: ABdhPJz1TKJYlMV+shnCZXs2KqrvtzNdHcTfQe4hW6IygdpUunX7Tav8hDdJVm33ajjjOPg5REPiEI1YAWgB2k/uvYs=
X-Received: by 2002:a05:600c:4f13:: with SMTP id
 l19mr13340613wmq.126.1643310007944; 
 Thu, 27 Jan 2022 11:00:07 -0800 (PST)
MIME-Version: 1.0
References: <20220112002515.3991540-1-titusr@google.com>
In-Reply-To: <20220112002515.3991540-1-titusr@google.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 27 Jan 2022 18:59:56 +0000
Message-ID: <CAFEAcA-qHuN_nRj6k5Kb+YoPWsUa=ziBnxrM_H0it=tOaz43gQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] hw/sensor: add MAX31790 fan controller
To: Titus Rwantare <titusr@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::334
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: minyard@acm.org, venture@google.com, qemu-devel@nongnu.org, f4bug@amsat.org,
 Hao Wu <wuhaotsh@google.com>, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 12 Jan 2022 at 00:25, Titus Rwantare <titusr@google.com> wrote:
>
> Signed-off-by: Titus Rwantare <titusr@google.com>
> Reviewed-by: Hao Wu <wuhaotsh@google.com>

Hi; thanks for this patchset. For future revisions, could you
make sure you send a cover-letter for patchsets that have
more than one patch? It helps to keep the automated tooling
from getting confused.

> ---
>  MAINTAINERS                           |   8 +-
>  hw/arm/Kconfig                        |   1 +
>  hw/sensor/Kconfig                     |   4 +
>  hw/sensor/max31790_fan_ctrl.c         | 454 ++++++++++++++++++++++++++
>  hw/sensor/meson.build                 |   1 +
>  include/hw/sensor/max31790_fan_ctrl.h |  93 ++++++
>  6 files changed, 560 insertions(+), 1 deletion(-)
>  create mode 100644 hw/sensor/max31790_fan_ctrl.c
>  create mode 100644 include/hw/sensor/max31790_fan_ctrl.h
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index c98a61caee..0791b6be42 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2304,6 +2304,12 @@ F: hw/timer/mips_gictimer.c
>  F: include/hw/intc/mips_gic.h
>  F: include/hw/timer/mips_gictimer.h
>
> +MAX31790 Fan controller
> +M: Titus Rwantare <titusr@google.com>
> +S: Maintained
> +F: hw/sensor/max31790_fan_ctrl.c
> +F: include/hw/sensor/max31790_fan_ctrl.h
> +
>  Subsystems
>  ----------
>  Overall Audio backends
> @@ -2798,7 +2804,7 @@ R: Paolo Bonzini <pbonzini@redhat.com>
>  R: Bandan Das <bsd@redhat.com>
>  R: Stefan Hajnoczi <stefanha@redhat.com>
>  R: Thomas Huth <thuth@redhat.com>
> -R: Darren Kenny <darren.kenny@oracle.com>
> +R: Darren Kenny <darren.kenny@oracle.com>

Why did this line get changed ? It looks like maybe there was
a trailing space that got deleted. If you want to do that kind
of cleanup it's best done as a separate patch.

>  R: Qiuhao Li <Qiuhao.Li@outlook.com>
>  S: Maintained
>  F: tests/qtest/fuzz/
> diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
> index e652590943..00bfbaf1c4 100644
> --- a/hw/arm/Kconfig
> +++ b/hw/arm/Kconfig
> @@ -393,6 +393,7 @@ config NPCM7XX
>      select SMBUS
>      select AT24C  # EEPROM
>      select MAX34451
> +    select MAX31790
>      select PL310  # cache controller
>      select PMBUS
>      select SERIAL
> diff --git a/hw/sensor/Kconfig b/hw/sensor/Kconfig
> index 9c8a049b06..54d269d642 100644
> --- a/hw/sensor/Kconfig
> +++ b/hw/sensor/Kconfig
> @@ -21,3 +21,7 @@ config ADM1272
>  config MAX34451
>      bool
>      depends on I2C
> +
> +config MAX31790
> +    bool
> +    depends on I2C
> diff --git a/hw/sensor/max31790_fan_ctrl.c b/hw/sensor/max31790_fan_ctrl.c
> new file mode 100644
> index 0000000000..b5334c1130
> --- /dev/null
> +++ b/hw/sensor/max31790_fan_ctrl.c
> @@ -0,0 +1,454 @@
> +/*
> + * MAX31790 Fan controller
> + *
> + * Independently control 6 fans, up to 12 tachometer inputs,
> + * controlled through i2c
> + *
> + * This device model has read/write support for:
> + * - 9-bit pwm through i2c and qom/qmp
> + * - 11-bit tach_count through i2c
> + * - RPM through qom/qmp
> + *
> + * Copyright 2021 Google LLC
> + *
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + */
> +
> +#include "qemu/osdep.h"
> +#include "hw/sensor/max31790_fan_ctrl.h"
> +#include "hw/irq.h"
> +#include "hw/qdev-properties.h"
> +#include "migration/vmstate.h"
> +#include "qapi/visitor.h"
> +#include "qemu/log.h"
> +#include "qemu/module.h"
> +
> +static uint16_t max31790_get_sr(uint8_t fan_dynamics)
> +{
> +    uint16_t sr = 1 << ((fan_dynamics >> 5) & 0b111);
> +    return sr > 16 ? 32 : sr;
> +}
> +
> +static void max31790_place_bits(uint16_t *dest, uint16_t byte, uint8_t offset)
> +{
> +    uint16_t val = *dest;
> +    val &= ~(0x00FF << offset);
> +    val |= byte << offset;
> +    *dest = val;
> +}
> +
> +/*
> + * calculating fan speed
> + *  f_TOSC/4 is the clock, 8192Hz
> + *  NP = tachometer pulses per revolution (usually 2)
> + *  SR = number of periods(pulses) over which the clock ticks are counted
> + *  TACH Count = SR x 8192 x 60 / (NP x RPM)
> + *  RPM = SR x 8192 x 60 / (NP x TACH count)
> + *
> + *  RPM mode - desired tach count is written to TACH Target Count
> + *  PWM mode - desired duty cycle is written to PWMOUT Target Duty reg
> + */
> +static void max31790_calculate_tach_count(MAX31790State *ms, uint8_t id)
> +{
> +    uint32_t rpm;
> +    uint32_t sr = max31790_get_sr(ms->fan_dynamics[id]);
> +    ms->pwm_duty_cycle[id] = ms->pwmout[id] >> 7;
> +    rpm = (ms->max_rpm[id] * ms->pwm_duty_cycle[id]) / 0x1FF;
> +
> +    if (rpm) {
> +        ms->tach_count[id] = (sr * MAX31790_CLK_FREQ * 60) /
> +                             (MAX31790_PULSES_PER_REV * rpm);

This is all being done with 32-bit arithmetic. Is it definitely
never possible for it to overflow ?


> +    } else {
> +        ms->tach_count[id] = 0;
> +    }
> +
> +}
> +

> +        if ((ms->command + 1) % 8) {
> +            ms->command++;
> +        } else {
> +            ms->command -= 7;
> +        }

You could write this:
   ms->command = (ms->command & ~7) | ((ms->command + 1) & 7);

Maybe that's clearer, maybe not -- your choice whether to change it or not.


> +/* assumes that the fans have the same speed range (SR) */
> +static void max31790_get_rpm(Object *obj, Visitor *v, const char *name,
> +                             void *opaque, Error **errp)

For get/set functions for object properties, can you include
a comment somewhere that clearly describes what the property
is and what units are being used, please? (We really ought to
document this but we don't currently have a clear place for that;
for the moment at least we can write it down in the source code...)

> +{
> +    MAX31790State *ms = MAX31790(obj);
> +    uint16_t tach_count = *(uint16_t *)opaque;
> +    uint32_t sr = max31790_get_sr(ms->fan_dynamics[0]);
> +    uint16_t rpm;
> +
> +    max31790_update_tach_count(ms);
> +    tach_count >>= MAX31790_TACH_SHAMT;
> +
> +    if (tach_count) {
> +        rpm = (sr * MAX31790_CLK_FREQ * 60) /
> +              (MAX31790_PULSES_PER_REV * tach_count);

More 32-bit integer arithmetic, same "can this overflow"
question. It may be worth abstracting the "rpm-to-tach-count"
and "tach-count-to-rpm" calculations out into functions
(I think you used at least one of them open-coded earlier.)

> +    }
> +
> +    visit_type_uint16(v, name, &rpm, errp);
> +}

> +static void max31790_init(Object *obj)
> +{
> +    MAX31790State *ms = MAX31790(obj);
> +
> +    ms->global_config = MAX31790_GLOBAL_CONFIG_DEFAULT;
> +    ms->pwm_freq = MAX31790_PWM_FREQ_DEFAULT;
> +    ms->failed_fan_opts_seq_strt = MAX31790_FAILED_FAN_OPTS_SEQ_STRT_DEFAULT;
> +
> +    for (int i = 0; i < MAX31790_NUM_FANS; i++) {
> +        ms->max_rpm[i] = MAX31790_MAX_RPM_DEFAULT;
> +        ms->fan_config[i] = 0;
> +        ms->fan_dynamics[i] = MAX31790_FAN_DYNAMICS_DEFAULT;
> +        ms->pwmout[i] = MAX31790_PWMOUT_DEFAULT;
> +        ms->target_count[i] = MAX31790_TARGET_COUNT_DEFAULT;
> +    }

A lot of this looks like it's initialization of guest-writeable
data. For guest-writeable data:
 * initialize it in a reset method, not in device init
 * you need to migrate it, which means it needs a line in
   a VMStateDescription

> +    max31790_update_tach_count(ms);
> +    for (int i = 0; i < MAX31790_NUM_FANS; i++) {
> +        object_property_add(obj, "target_rpm[*]", "uint16",
> +                            max31790_get_rpm,
> +                            max31790_set_rpm, NULL, &ms->target_count[i]);
> +
> +        /* 9-bit PWM on this device */
> +        object_property_add(obj, "pwm[*]", "uint16",
> +                            max31790_get,
> +                            max31790_set, NULL, &ms->pwmout[i]);
> +
> +        /* used to calculate rpm for a given pwm duty cycle */
> +        object_property_add(obj, "max_rpm[*]", "uint16",
> +                            max31790_get,
> +                            max31790_set, NULL, &ms->max_rpm[i]);
> +    }
> +}
> +
> +static void max31790_class_init(ObjectClass *klass, void *data)
> +{
> +    DeviceClass *dc = DEVICE_CLASS(klass);
> +    I2CSlaveClass *k = I2C_SLAVE_CLASS(klass);
> +
> +    dc->desc = "Maxim MAX31790 fan controller";
> +
> +    k->event = max31790_event;
> +    k->recv = max31790_recv;
> +    k->send = max31790_send;
> +}
> +
> +static const TypeInfo max31790_info = {
> +    .name = TYPE_MAX31790,
> +    .parent = TYPE_I2C_SLAVE,
> +    .instance_size = sizeof(MAX31790State),
> +    .instance_init = max31790_init,
> +    .class_init = max31790_class_init,
> +};
> +
> +static void max31790_register_types(void)
> +{
> +    type_register_static(&max31790_info);
> +}
> +
> +type_init(max31790_register_types)
> diff --git a/hw/sensor/meson.build b/hw/sensor/meson.build
> index 059c4ca935..4ce68cfc89 100644
> --- a/hw/sensor/meson.build
> +++ b/hw/sensor/meson.build
> @@ -4,3 +4,4 @@ softmmu_ss.add(when: 'CONFIG_DPS310', if_true: files('dps310.c'))
>  softmmu_ss.add(when: 'CONFIG_EMC141X', if_true: files('emc141x.c'))
>  softmmu_ss.add(when: 'CONFIG_ADM1272', if_true: files('adm1272.c'))
>  softmmu_ss.add(when: 'CONFIG_MAX34451', if_true: files('max34451.c'))
> +softmmu_ss.add(when: 'CONFIG_MAX31790', if_true: files('max31790_fan_ctrl.c'))
> diff --git a/include/hw/sensor/max31790_fan_ctrl.h b/include/hw/sensor/max31790_fan_ctrl.h
> new file mode 100644
> index 0000000000..74ff7bb5a0
> --- /dev/null
> +++ b/include/hw/sensor/max31790_fan_ctrl.h
> @@ -0,0 +1,93 @@
> +/*
> + * Max 31790 Fan controller
> + *
> + * Independently control 6 fans, up to 12 tachometer inputs,
> + * controlled through i2c
> + *
> + * Copyright 2021 Google LLC
> + *
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + */
> +
> +#ifndef MAX31790_FAN_CTRL_H
> +#define MAX31790_FAN_CTRL_H
> +
> +#include "hw/i2c/i2c.h"
> +#include "qom/object.h"
> +
> +#define MAX31790_NUM_FANS 6
> +#define MAX31790_NUM_TACHS 12
> +
> +typedef struct MAX31790State {
> +    I2CSlave parent;
> +
> +    /* Registers */
> +    uint8_t global_config;
> +    uint8_t pwm_freq;
> +    uint8_t fan_config[MAX31790_NUM_FANS];
> +    uint8_t fan_dynamics[MAX31790_NUM_FANS];
> +    uint8_t fan_fault_status_2;
> +    uint8_t fan_fault_status_1;
> +    uint8_t fan_fault_mask_2;
> +    uint8_t fan_fault_mask_1;
> +    uint8_t failed_fan_opts_seq_strt;
> +    uint16_t tach_count[MAX31790_NUM_TACHS];
> +    uint16_t pwm_duty_cycle[MAX31790_NUM_FANS];
> +    uint16_t pwmout[MAX31790_NUM_FANS];
> +    uint16_t target_count[MAX31790_NUM_FANS];
> +    uint8_t window[MAX31790_NUM_FANS];
> +
> +    /* config */
> +    uint16_t max_rpm[MAX31790_NUM_FANS];
> +
> +    /* i2c transaction state */
> +    uint8_t command;
> +    bool i2c_cmd_event;
> +    bool cmd_is_new;
> +} MAX31790State;
> +
> +#define TYPE_MAX31790 "max31790"
> +#define MAX31790(obj) OBJECT_CHECK(MAX31790State, (obj), TYPE_MAX31790)

Prefer the OBJECT_DECLARE_SIMPLE_TYPE() macro rather than
hand-defining a cast macro. (It also provides the typedef for
you, so you only need to define the struct, without the "typedef"
keyword.)

> +
> +#define MAX31790_REG_GLOBAL_CONFIG             0x00                 /* R/W */
> +#define MAX31790_REG_PWM_FREQ                  0x01                 /* R/W */
> +#define MAX31790_REG_FAN_CONFIG(ch)           (0x02 + (ch))         /* R/W */
> +#define MAX31790_REG_FAN_DYNAMICS(ch)         (0x08 + (ch))         /* R/W */
> +#define MAX31790_REG_FAN_FAULT_STATUS_2        0x10                 /* R/W */
> +#define MAX31790_REG_FAN_FAULT_STATUS_1        0x11                 /* R/W */
> +#define MAX31790_REG_FAN_FAULT_MASK_2          0x12                 /* R/W */
> +#define MAX31790_REG_FAN_FAULT_MASK_1          0x13                 /* R/W */
> +#define MAX31790_REG_FAILED_FAN_OPTS_SEQ_STRT  0x14                 /* R/W */
> +#define MAX31790_REG_TACH_COUNT_MSB(ch)       (0x18 + (ch) * 2)     /* R */
> +#define MAX31790_REG_TACH_COUNT_LSB(ch)       (0x19 + (ch) * 2)     /* R */
> +#define MAX31790_REG_PWM_DUTY_CYCLE_MSB(ch)   (0x30 + (ch) * 2)     /* R */
> +#define MAX31790_REG_PWM_DUTY_CYCLE_LSB(ch)   (0x31 + (ch) * 2)     /* R */
> +#define MAX31790_REG_PWMOUT_MSB(ch)           (0x40 + (ch) * 2)     /* R/W */
> +#define MAX31790_REG_PWMOUT_LSB(ch)           (0x41 + (ch) * 2)     /* R/W */
> +#define MAX31790_REG_TARGET_COUNT_MSB(ch)     (0x50 + (ch) * 2)     /* R/W */
> +#define MAX31790_REG_TARGET_COUNT_LSB(ch)     (0x51 + (ch) * 2)     /* R/W */
> +#define MAX31790_REG_WINDOW(ch)               (0x60 + (ch))         /* R/W */
> +
> +#define MAX31790_GLOBAL_CONFIG_DEFAULT                0x20
> +#define MAX31790_PWM_FREQ_DEFAULT                     0x44 /* 125Hz */
> +#define MAX31790_FAN_DYNAMICS_DEFAULT                 0x4C
> +#define MAX31790_FAILED_FAN_OPTS_SEQ_STRT_DEFAULT     0x45
> +#define MAX31790_PWMOUT_DEFAULT                       (128 << 7) /* 25% */
> +#define MAX31790_TARGET_COUNT_DEFAULT                 0x3D60
> +
> +/* Fan Config register bits */
> +#define MAX31790_FAN_CFG_RPM_MODE             BIT(7)
> +#define MAX31790_FAN_CFG_MONITOR_ONLY         BIT(4)
> +#define MAX31790_FAN_CFG_TACH_INPUT_EN        BIT(3)
> +#define MAX31790_FAN_CFG_TACH_INPUT           BIT(0)
> +
> +/* Tachometer calculation constants */
> +#define MAX31790_PULSES_PER_REV             2
> +#define MAX31790_SR_DEFAULT                 4
> +#define MAX31790_CLK_FREQ                   8192
> +#define MAX31790_MAX_RPM_DEFAULT            16500
> +
> +/* reg alignment amounts */
> +#define MAX31790_PWM_SHAMT                  7
> +#define MAX31790_TACH_SHAMT                 5
> +#endif

Consider whether some of these constants would be better in the .c file.

thanks
-- PMM

