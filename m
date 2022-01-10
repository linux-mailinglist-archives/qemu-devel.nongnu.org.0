Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B48EE489564
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Jan 2022 10:38:07 +0100 (CET)
Received: from localhost ([::1]:37652 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6r7u-0004Cp-C4
	for lists+qemu-devel@lfdr.de; Mon, 10 Jan 2022 04:38:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58292)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n6r5l-0002Oo-Db
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 04:35:53 -0500
Received: from [2a00:1450:4864:20::330] (port=53140
 helo=mail-wm1-x330.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n6r5j-0005dc-EG
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 04:35:53 -0500
Received: by mail-wm1-x330.google.com with SMTP id v123so8288449wme.2
 for <qemu-devel@nongnu.org>; Mon, 10 Jan 2022 01:35:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=a5Jy+TDvIJrKikaikQbWP1xjV8oX6XegLz4pd0eh/7A=;
 b=FDQeh5I9qAVLlo+4ZV6y0QSV9yp6ginnmjVgCYdGdI/nuDiLa2KlUjr0cxYNckgUt/
 Q9IhN4A+UQbeNjTQ9o6sm2pF28KD+5epzOPE7tkyRWlPZmLQ6ptaD8NsMtguEun5NADH
 Gvs8mJMdhkvpiHRCWZ3TU5wZAM6K0Go+vdsgX+Q8ANlkg0518RiAiCb3mk/LgxoZEdg5
 QMzUprnsHtSGAO9eZZ3mlNYh/EIZHNj0fTkxBzcuYqWf+88nMjA3Q3DhlT1/07NwDZyo
 7r4Rpi4GagG9z8VVWMyuu+Ok1npcoUFsTNFEdUqaBPkO5KhbIzuB+X/WIkL24Nm3mVgb
 fJog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=a5Jy+TDvIJrKikaikQbWP1xjV8oX6XegLz4pd0eh/7A=;
 b=LDM3Iuo+WcJbLjXcoW1mPpPcLg0YjqQS1GYFzusaPF2TCvQho5m7oVzZVDQwS/4/g0
 P2fZvJStarz3Af6UErUEjOOE+m1LVSLnlwbjqbA9KFEvRldwNoWUkN0fBVBf9eC1luou
 iVBhc4VRwAT6l+842/r0fInivPb9dNc0S7xSA6eJsVBACJ6+dQcfVq9nRo6X4ozBPtdz
 oP6oWBf2BkB8wOpLj5r7xs1L+QPCNNJ5muM9nN32/C5FLikMOZjaykoOMY7b3QTjX/AA
 WMCiJqjPrzxmZyabW2YzA2wPcTYqxkSTsCPVGQ6rinVyHNtnwsUn4OVAUUhlLaSKgeSq
 NyDQ==
X-Gm-Message-State: AOAM530VoTu1tYZ1dZ9VXfNAXB6b4JbOO3ZabVBTJGvuSD60JEl9A8Vt
 5iAyeMaAdvxm1uOcUqa6ftI=
X-Google-Smtp-Source: ABdhPJyo5FOnzZjhfiaKagFgd4QB/WnT2oyPnZc2mkY4B6jV1WDmEQ4Zi5N/lqCM7FM3bRZ7p0bSMw==
X-Received: by 2002:a7b:ce90:: with SMTP id q16mr6465051wmj.13.1641807347733; 
 Mon, 10 Jan 2022 01:35:47 -0800 (PST)
Received: from [192.168.1.40] (83.red-83-50-87.dynamicip.rima-tde.net.
 [83.50.87.83])
 by smtp.gmail.com with ESMTPSA id c16sm2131702wrw.41.2022.01.10.01.35.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Jan 2022 01:35:47 -0800 (PST)
Message-ID: <eaea55f9-71f8-4810-70a7-63aadf252f20@amsat.org>
Date: Mon, 10 Jan 2022 10:35:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH] hw/sensor: Add SB-TSI Temperature Sensor Interface
Content-Language: en-US
To: Patrick Venture <venture@google.com>, thuth@redhat.com,
 lvivier@redhat.com, pbonzini@redhat.com
References: <20220108030451.3867815-1-venture@google.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20220108030451.3867815-1-venture@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::330
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x330.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Hao Wu <wuhaotsh@google.com>, qemu-devel@nongnu.org,
 Corey Minyard <minyard@acm.org>, Doug Evans <dje@google.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Patrick,

On 1/8/22 04:04, Patrick Venture wrote:
> From: Hao Wu <wuhaotsh@google.com>
> 
> SB Temperature Sensor Interface (SB-TSI) is an SMBus compatible
> interface that reports AMD SoC's Ttcl (normalized temperature),
> and resembles a typical 8-pin remote temperature sensor's I2C interface
> to BMC.
> 
> This patch implements a basic AMD SB-TSI sensor that is
> compatible with the open-source data sheet from AMD and Linux
> kernel driver.
> 
> Reference:
> Linux kernel driver:
> https://lkml.org/lkml/2020/12/11/968
> Register Map:
> https://developer.amd.com/wp-content/resources/56255_3_03.PDF
> (Chapter 6)
> 
> Signed-off-by: Hao Wu <wuhaotsh@google.com>
> Reviewed-by: Doug Evans <dje@google.com>
> ---
>  hw/sensor/Kconfig            |   4 +
>  hw/sensor/meson.build        |   1 +
>  hw/sensor/tmp_sbtsi.c        | 393 +++++++++++++++++++++++++++++++++++
>  hw/sensor/trace-events       |   5 +
>  hw/sensor/trace.h            |   1 +
>  meson.build                  |   1 +

>  tests/qtest/meson.build      |   1 +
>  tests/qtest/tmp_sbtsi-test.c | 180 ++++++++++++++++

Up to Thomas for qtest, but I'd rather split in 2 patches since
different set of maintainers / reviewers.

> +++ b/hw/sensor/tmp_sbtsi.c
> @@ -0,0 +1,393 @@
> +/*
> + * AMD SBI Temperature Sensor Interface (SB-TSI)
> + *
> + * Copyright 2021 Google LLC
> + *
> + * This program is free software; you can redistribute it and/or modify it
> + * under the terms of the GNU General Public License as published by the
> + * Free Software Foundation; either version 2 of the License, or
> + * (at your option) any later version.
> + *
> + * This program is distributed in the hope that it will be useful, but WITHOUT
> + * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
> + * FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License
> + * for more details.
> + */
> +
> +#include "qemu/osdep.h"
> +#include "hw/i2c/smbus_slave.h"
> +#include "hw/irq.h"
> +#include "migration/vmstate.h"
> +#include "qapi/error.h"
> +#include "qapi/visitor.h"
> +#include "qemu/log.h"
> +#include "qemu/module.h"
> +#include "trace.h"
> +
> +#define TYPE_SBTSI "sbtsi"

If you add include/hw/sensor/sbtsi.h, please define the type there, ...

> +/*
> + * SB-TSI registers only support SMBus byte data access. "_INT" registers are
> + * the integer part of a temperature value or limit, and "_DEC" registers are
> + * corresponding decimal parts.
> + */
> +#define SBTSI_REG_TEMP_INT      0x01 /* RO */
> +#define SBTSI_REG_STATUS        0x02 /* RO */
> +#define SBTSI_REG_CONFIG        0x03 /* RO */
> +#define SBTSI_REG_TEMP_HIGH_INT 0x07 /* RW */
> +#define SBTSI_REG_TEMP_LOW_INT  0x08 /* RW */
> +#define SBTSI_REG_CONFIG_WR     0x09 /* RW */
> +#define SBTSI_REG_TEMP_DEC      0x10 /* RO */
> +#define SBTSI_REG_TEMP_HIGH_DEC 0x13 /* RW */
> +#define SBTSI_REG_TEMP_LOW_DEC  0x14 /* RW */
> +#define SBTSI_REG_ALERT_CONFIG  0xBF /* RW */
> +#define SBTSI_REG_MAN           0xFE /* RO */
> +#define SBTSI_REG_REV           0xFF /* RO */
> +
> +#define SBTSI_STATUS_HIGH_ALERT BIT(4)
> +#define SBTSI_STATUS_LOW_ALERT  BIT(3)
> +#define SBTSI_CONFIG_ALERT_MASK BIT(7)
> +#define SBTSI_ALARM_EN          BIT(0)

beside these definitions can be share with qtests.

> +/* The temperature we stored are in units of 0.125 degrees. */
> +#define SBTSI_TEMP_UNIT_IN_MILLIDEGREE 125
> +
> +/*
> + * The integer part and decimal of the temperature both 8 bits.
> + * Only the top 3 bits of the decimal parts are used.
> + * So the max temperature is (2^8-1) + (2^3-1)/8 = 255.875 degrees.
> + */
> +#define SBTSI_TEMP_MAX 255875

Nitpicking, use _IN_MILLIDEGREE suffix?

> +static void sbtsi_init(Object *obj)
> +{
> +    SBTSIState *s = SBTSI(obj);
> +
> +    /* Current temperature in millidegrees. */
> +    object_property_add(obj, "temperature", "uint32",

Can we explicit as "temperature_uC"?

> +                        sbtsi_get_temperature, sbtsi_set_temperature,
> +                        NULL, NULL);
> +    qdev_init_gpio_out_named(DEVICE(obj), &s->alarm, SBTSI_ALARM_L, 0);
> +}
> +
> +static void sbtsi_class_init(ObjectClass *klass, void *data)
> +{
> +    ResettableClass *rc = RESETTABLE_CLASS(klass);
> +    DeviceClass *dc = DEVICE_CLASS(klass);
> +    SMBusDeviceClass *k = SMBUS_DEVICE_CLASS(klass);
> +
> +    dc->desc = "SB-TSI Temperature Sensor";
> +    dc->vmsd = &vmstate_sbtsi;
> +    k->write_data = sbtsi_write_data;
> +    k->receive_byte = sbtsi_read_byte;
> +    rc->phases.enter = sbtsi_enter_reset;
> +    rc->phases.hold = sbtsi_hold_reset;

If my previous patch [*] were in, I'd have asked for:

       set_bit(DEVICE_CATEGORY_SENSOR, dc->categories);

But since it isn't, I'll keep an eye on which goes in first.

[*] https://www.mail-archive.com/qemu-devel@nongnu.org/msg847088.html

> diff --git a/tests/qtest/tmp_sbtsi-test.c b/tests/qtest/tmp_sbtsi-test.c
> new file mode 100644
> index 0000000000..7f5fafacc7
> --- /dev/null
> +++ b/tests/qtest/tmp_sbtsi-test.c
> @@ -0,0 +1,180 @@
> +/*
> + * QTests for the SBTSI temperature sensor
> + *
> + * Copyright 2020 Google LLC
> + *
> + * This program is free software; you can redistribute it and/or modify it
> + * under the terms of the GNU General Public License as published by the
> + * Free Software Foundation; either version 2 of the License, or
> + * (at your option) any later version.
> + *
> + * This program is distributed in the hope that it will be useful, but WITHOUT
> + * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
> + * FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License
> + * for more details.
> + */
> +
> +#include "qemu/osdep.h"
> +
> +#include "libqtest-single.h"
> +#include "libqos/qgraph.h"
> +#include "libqos/i2c.h"
> +#include "qapi/qmp/qdict.h"
> +#include "qemu/bitops.h"
> +
> +#define TEST_ID   "sbtsi-test"
> +#define TEST_ADDR (0x4c)
> +
> +/*
> + * SB-TSI registers only support SMBus byte data access. "_INT" registers are
> + * the integer part of a temperature value or limit, and "_DEC" registers are
> + * corresponding decimal parts.
> + */
> +#define REG_TEMP_INT      0x01 /* RO */
> +#define REG_STATUS        0x02 /* RO */
> +#define REG_CONFIG        0x03 /* RO */
> +#define REG_TEMP_HIGH_INT 0x07 /* RW */
> +#define REG_TEMP_LOW_INT  0x08 /* RW */
> +#define REG_CONFIG_WR     0x09 /* RW */
> +#define REG_TEMP_DEC      0x10 /* RO */
> +#define REG_TEMP_HIGH_DEC 0x13 /* RW */
> +#define REG_TEMP_LOW_DEC  0x14 /* RW */
> +#define REG_ALERT_CONFIG  0xBF /* RW */
> +
> +#define STATUS_HIGH_ALERT BIT(4)
> +#define STATUS_LOW_ALERT  BIT(3)
> +#define CONFIG_ALERT_MASK BIT(7)
> +#define ALARM_EN          BIT(0)

This is the part that could be shared in "include/hw/sensor/sbtsi.h".

> +/* The temperature stored are in units of 0.125 degrees. */
> +#define TEMP_UNIT_IN_MILLIDEGREE 125
> +#define LIMIT_LOW (10500)
> +#define LIMIT_HIGH (55125)

Nitpicking again, _IN_MILLIDEGREE suffix for coherency?

> +static uint32_t qmp_sbtsi_get_temperature(const char *id)
> +{
> +    QDict *response;
> +    int ret;
> +
> +    response = qmp("{ 'execute': 'qom-get', 'arguments': { 'path': %s, "
> +                   "'property': 'temperature' } }", id);

If renamed earlier, here 'temperature_uC'.

> +    g_assert(qdict_haskey(response, "return"));
> +    ret = (uint32_t)qdict_get_int(response, "return");
> +    qobject_unref(response);
> +    return ret;
> +}
> +
> +static void qmp_sbtsi_set_temperature(const char *id, uint32_t value)
> +{
> +    QDict *response;
> +
> +    response = qmp("{ 'execute': 'qom-set', 'arguments': { 'path': %s, "
> +                   "'property': 'temperature', 'value': %d } }", id, value);
> +    g_assert(qdict_haskey(response, "return"));
> +    qobject_unref(response);
> +}

Thanks,

Phil.

