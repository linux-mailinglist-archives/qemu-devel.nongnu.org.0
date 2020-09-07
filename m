Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 50418260560
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Sep 2020 22:06:14 +0200 (CEST)
Received: from localhost ([::1]:36362 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kFNP3-0004RZ-6v
	for lists+qemu-devel@lfdr.de; Mon, 07 Sep 2020 16:06:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33084)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luc.michel@greensocs.com>)
 id 1kFNLp-0003Cz-8J; Mon, 07 Sep 2020 16:02:53 -0400
Received: from beetle.greensocs.com ([5.135.226.135]:47986)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luc.michel@greensocs.com>)
 id 1kFNLl-00088x-UF; Mon, 07 Sep 2020 16:02:52 -0400
Received: from [172.17.10.18] (unknown [172.17.10.18])
 by beetle.greensocs.com (Postfix) with ESMTPSA id 6ED1E21C31;
 Mon,  7 Sep 2020 20:02:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1599508964;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DPk0bO248uFw7H9Kh6cvLnYv7h9OzeFbdhJow0esSnQ=;
 b=fjz76fbruAbtymJ5ke4rAkNEmfzchRP0yuFvGOpgpv0sVP559j5Rw5HzzXHF8K5rX/CVC8
 nBKeAm5r3QGA7bRNiqL8a2Q+HMfB6qUmtep8xhXl0fiFrJ9SYbo2tDNwjgGbe7nXv4lQj8
 zst9h+Pen9m+VO+6mTT+O57MGIJquq4=
Subject: Re: [PATCH v4 1/8] hw/misc/led: Add a LED device
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20200907163257.46527-1-f4bug@amsat.org>
 <20200907163257.46527-2-f4bug@amsat.org>
From: Luc Michel <luc.michel@greensocs.com>
Message-ID: <451e8d25-ecb5-c3e2-64aa-8582f2f47a25@greensocs.com>
Date: Mon, 7 Sep 2020 22:03:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200907163257.46527-2-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=5.135.226.135;
 envelope-from=luc.michel@greensocs.com; helo=beetle.greensocs.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/07 16:02:46
X-ACL-Warn: Detected OS   = Linux 3.11 and newer
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.825,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>,
 Joaquin de Andres <me@xcancerberox.com.ar>, qemu-arm@nongnu.org,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Philippe,

On 9/7/20 6:32 PM, Philippe Mathieu-Daudé wrote:
> Add a LED device which can be connected to a GPIO output.
> They can also be dimmed with PWM devices. For now we do
> not implement the dimmed mode, but in preparation of a
> future implementation, we start using the LED intensity.
> 
> LEDs are limited to a fixed set of colors.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>   include/hw/misc/led.h |  84 +++++++++++++++++++++++++
>   hw/misc/led.c         | 142 ++++++++++++++++++++++++++++++++++++++++++
>   MAINTAINERS           |   6 ++
>   hw/misc/Kconfig       |   3 +
>   hw/misc/meson.build   |   1 +
>   hw/misc/trace-events  |   3 +
>   6 files changed, 239 insertions(+)
>   create mode 100644 include/hw/misc/led.h
>   create mode 100644 hw/misc/led.c
> 
> diff --git a/include/hw/misc/led.h b/include/hw/misc/led.h
> new file mode 100644
> index 00000000000..1aaabbebafc
> --- /dev/null
> +++ b/include/hw/misc/led.h
> @@ -0,0 +1,84 @@
> +/*
> + * QEMU single LED device
> + *
> + * Copyright (C) 2020 Philippe Mathieu-Daudé <f4bug@amsat.org>
> + *
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + */
> +#ifndef HW_MISC_LED_H
> +#define HW_MISC_LED_H
> +
> +#include "hw/qdev-core.h"
> +
> +#define TYPE_LED "led"
> +#define LED(obj) OBJECT_CHECK(LEDState, (obj), TYPE_LED)
> +
> +/**
> + * LEDColor: Color of a LED
> + *
> + * This set is restricted to physically available LED colors.
> + *
> + * LED colors from 'Table 1. Product performance of LUXEON Rebel Color
> + * Line' of the 'DS68 LUXEON Rebel Color Line' datasheet available at:
> + * https://www.lumileds.com/products/color-leds/luxeon-rebel-color/
> + */
> +typedef enum {          /* Coarse wavelength range */
> +    LED_COLOR_VIOLET,   /* 425 nm */
> +    LED_COLOR_BLUE,     /* 475 nm */
> +    LED_COLOR_CYAN,     /* 500 nm */
> +    LED_COLOR_GREEN,    /* 535 nm */
> +    LED_COLOR_AMBER,    /* 590 nm */
> +    LED_COLOR_ORANGE,   /* 615 nm */
> +    LED_COLOR_RED,      /* 630 nm */
> +} LEDColor;
> +
> +typedef struct LEDState {
> +    /* Private */
> +    DeviceState parent_obj;
> +    /* Public */
> +
> +    uint8_t intensity_percent;
> +
> +    /* Properties */
> +    char *description;
> +    char *color;
> +} LEDState;
> +
> +/**
> + * led_set_intensity: set the intensity of a LED device
> + * @s: the LED object
> + * @intensity: intensity as percentage in range 0 to 100.
@intensity_percent

> + */
> +void led_set_intensity(LEDState *s, unsigned intensity_percent);
> +
> +/**
> + * led_get_intensity:
> + * @s: the LED object
> + *
> + * Returns: The LED intensity as percentage in range 0 to 100.
> + */
> +unsigned led_get_intensity(LEDState *s);
> +
> +/**
> + * led_set_intensity: set the state of a LED device
led_set_state

> + * @s: the LED object
> + * @is_on: boolean indicating whether the LED is emitting
@is_emitting

> + *
> + * This utility is meant for LED connected to GPIO.
> + */
> +void led_set_state(LEDState *s, bool is_emitting);
> +
> +/**
> + * led_create_simple: Create and realize a LED device
> + * @parent: the parent object
@parentobj

> + * @color: color of the LED
> + * @description: description of the LED (optional)
> + *
> + * Create the device state structure, initialize it, and
> + * drop the reference to it (the device is realized).
> + */
> +LEDState *led_create_simple(Object *parentobj,
> +                            LEDColor color,
> +                            const char *description);
> +
> +#endif /* HW_MISC_LED_H */
> diff --git a/hw/misc/led.c b/hw/misc/led.c
> new file mode 100644
> index 00000000000..f2140739b68
> --- /dev/null
> +++ b/hw/misc/led.c
> @@ -0,0 +1,142 @@
> +/*
> + * QEMU single LED device
> + *
> + * Copyright (C) 2020 Philippe Mathieu-Daudé <f4bug@amsat.org>
> + *
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + */
> +#include "qemu/osdep.h"
> +#include "qapi/error.h"
> +#include "migration/vmstate.h"
> +#include "hw/qdev-properties.h"
> +#include "hw/misc/led.h"
> +#include "trace.h"
> +
> +#define LED_INTENSITY_PERCENT_MAX   100
> +
> +static const char *led_color_name[] = {
> +    [LED_COLOR_VIOLET]  = "violet",
> +    [LED_COLOR_BLUE]    = "blue",
> +    [LED_COLOR_CYAN]    = "cyan",
> +    [LED_COLOR_GREEN]   = "green",
> +    [LED_COLOR_AMBER]   = "amber",
> +    [LED_COLOR_ORANGE]  = "orange",
> +    [LED_COLOR_RED]     = "red",
> +};
> +
> +static bool led_color_name_is_valid(const char *color_name)
> +{
> +    for (size_t i = 0; i < ARRAY_SIZE(led_color_name); i++) {
> +        if (led_color_name[i] && strcmp(color_name, led_color_name[i]) == 0) {

Why are you checking led_color_name[i] here?

Otherwise, seems good to me.

Reviewed-by: Luc Michel <luc.michel@greensocs.com>

> +            return true;
> +        }
> +    }
> +    return false;
> +}
> +
> +void led_set_intensity(LEDState *s, unsigned intensity_percent)
> +{
> +    if (intensity_percent > LED_INTENSITY_PERCENT_MAX) {
> +        intensity_percent = LED_INTENSITY_PERCENT_MAX;
> +    }
> +    trace_led_set_intensity(s->description, s->color, intensity_percent);
> +    s->intensity_percent = intensity_percent;
> +}
> +
> +unsigned led_get_intensity(LEDState *s)
> +{
> +    return s->intensity_percent;
> +}
> +
> +void led_set_state(LEDState *s, bool is_emitting)
> +{
> +    led_set_intensity(s, is_emitting ? LED_INTENSITY_PERCENT_MAX : 0);
> +}
> +
> +static void led_reset(DeviceState *dev)
> +{
> +    LEDState *s = LED(dev);
> +
> +    led_set_state(s, false);
> +}
> +
> +static const VMStateDescription vmstate_led = {
> +    .name = TYPE_LED,
> +    .version_id = 1,
> +    .minimum_version_id = 1,
> +    .fields = (VMStateField[]) {
> +        VMSTATE_UINT8(intensity_percent, LEDState),
> +        VMSTATE_END_OF_LIST()
> +    }
> +};
> +
> +static void led_realize(DeviceState *dev, Error **errp)
> +{
> +    LEDState *s = LED(dev);
> +
> +    if (s->color == NULL) {
> +        error_setg(errp, "property 'color' not specified");
> +        return;
> +    } else if (!led_color_name_is_valid(s->color)) {
> +        error_setg(errp, "property 'color' invalid or not supported");
> +        return;
> +    }
> +    if (s->description == NULL) {
> +        s->description = g_strdup("n/a");
> +    }
> +}
> +
> +static Property led_properties[] = {
> +    DEFINE_PROP_STRING("color", LEDState, color),
> +    DEFINE_PROP_STRING("description", LEDState, description),
> +    DEFINE_PROP_END_OF_LIST(),
> +};
> +
> +static void led_class_init(ObjectClass *klass, void *data)
> +{
> +    DeviceClass *dc = DEVICE_CLASS(klass);
> +
> +    dc->desc = "LED";
> +    dc->vmsd = &vmstate_led;
> +    dc->reset = led_reset;
> +    dc->realize = led_realize;
> +    set_bit(DEVICE_CATEGORY_DISPLAY, dc->categories);
> +    device_class_set_props(dc, led_properties);
> +}
> +
> +static const TypeInfo led_info = {
> +    .name = TYPE_LED,
> +    .parent = TYPE_DEVICE,
> +    .instance_size = sizeof(LEDState),
> +    .class_init = led_class_init
> +};
> +
> +static void led_register_types(void)
> +{
> +    type_register_static(&led_info);
> +}
> +
> +type_init(led_register_types)
> +
> +LEDState *led_create_simple(Object *parentobj,
> +                            LEDColor color,
> +                            const char *description)
> +{
> +    g_autofree char *name = NULL;
> +    DeviceState *dev;
> +
> +    dev = qdev_new(TYPE_LED);
> +    qdev_prop_set_string(dev, "color", led_color_name[color]);
> +    if (!description) {
> +        static unsigned undescribed_led_id;
> +        name = g_strdup_printf("undescribed-led-#%u", undescribed_led_id++);
> +    } else {
> +        qdev_prop_set_string(dev, "description", description);
> +        name = g_ascii_strdown(description, -1);
> +        name = g_strdelimit(name, " #", '-');
> +    }
> +    object_property_add_child(parentobj, name, OBJECT(dev));
> +    qdev_realize_and_unref(dev, NULL, &error_fatal);
> +
> +    return LED(dev);
> +}
> diff --git a/MAINTAINERS b/MAINTAINERS
> index b233da2a737..d040846b868 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1951,6 +1951,12 @@ F: docs/specs/vmgenid.txt
>   F: tests/qtest/vmgenid-test.c
>   F: stubs/vmgenid.c
>   
> +LED
> +M: Philippe Mathieu-Daudé <f4bug@amsat.org>
> +S: Maintained
> +F: include/hw/misc/led.h
> +F: hw/misc/led.c
> +
>   Unimplemented device
>   M: Peter Maydell <peter.maydell@linaro.org>
>   R: Philippe Mathieu-Daudé <f4bug@amsat.org>
> diff --git a/hw/misc/Kconfig b/hw/misc/Kconfig
> index 92c397ca07a..5c151fa3a83 100644
> --- a/hw/misc/Kconfig
> +++ b/hw/misc/Kconfig
> @@ -126,6 +126,9 @@ config AUX
>   config UNIMP
>       bool
>   
> +config LED
> +    bool
> +
>   config MAC_VIA
>       bool
>       select MOS6522
> diff --git a/hw/misc/meson.build b/hw/misc/meson.build
> index e1576b81cf9..26f6dd037dc 100644
> --- a/hw/misc/meson.build
> +++ b/hw/misc/meson.build
> @@ -11,6 +11,7 @@ softmmu_ss.add(when: 'CONFIG_TMP105', if_true: files('tmp105.c'))
>   softmmu_ss.add(when: 'CONFIG_TMP421', if_true: files('tmp421.c'))
>   softmmu_ss.add(when: 'CONFIG_UNIMP', if_true: files('unimp.c'))
>   softmmu_ss.add(when: 'CONFIG_EMPTY_SLOT', if_true: files('empty_slot.c'))
> +softmmu_ss.add(when: 'CONFIG_LED', if_true: files('led.c'))
>   
>   # ARM devices
>   softmmu_ss.add(when: 'CONFIG_PL310', if_true: files('arm_l2x0.c'))
> diff --git a/hw/misc/trace-events b/hw/misc/trace-events
> index 066752aa900..76c9ddb54fe 100644
> --- a/hw/misc/trace-events
> +++ b/hw/misc/trace-events
> @@ -214,6 +214,9 @@ via1_adb_poll(uint8_t data, const char *vadbint, int status, int index, int size
>   grlib_ahb_pnp_read(uint64_t addr, uint32_t value) "AHB PnP read addr:0x%03"PRIx64" data:0x%08x"
>   grlib_apb_pnp_read(uint64_t addr, uint32_t value) "APB PnP read addr:0x%03"PRIx64" data:0x%08x"
>   
> +# led.c
> +led_set_intensity(const char *color, const char *desc, uint8_t intensity_percent) "LED desc:'%s' color:%s intensity: %u%%"
> +
>   # pca9552.c
>   pca955x_gpio_status(const char *description, const char *buf) "%s GPIOs 0-15 [%s]"
>   pca955x_gpio_change(const char *description, unsigned id, unsigned prev_state, unsigned current_state) "%s GPIO id:%u status: %u -> %u"
> 

