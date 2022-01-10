Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BF50488EA3
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Jan 2022 03:26:29 +0100 (CET)
Received: from localhost ([::1]:50186 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6kOC-0002ca-Oe
	for lists+qemu-devel@lfdr.de; Sun, 09 Jan 2022 21:26:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54828)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <venture@google.com>)
 id 1n6kMe-0001CO-GD
 for qemu-devel@nongnu.org; Sun, 09 Jan 2022 21:24:52 -0500
Received: from [2607:f8b0:4864:20::529] (port=34439
 helo=mail-pg1-x529.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <venture@google.com>)
 id 1n6kMa-0004bN-DI
 for qemu-devel@nongnu.org; Sun, 09 Jan 2022 21:24:52 -0500
Received: by mail-pg1-x529.google.com with SMTP id 201so1425012pge.1
 for <qemu-devel@nongnu.org>; Sun, 09 Jan 2022 18:24:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/omDBP84VGaKWQnpAPXpDRHqw1Ourdy4aZvEtvOegAw=;
 b=CxXHRI8YIuodIwLpJ2/ymkql1ePSMNsg3ip9FwJS5v6RA4JSWFK+RxIRqy/6kpfY2w
 32RWdQU8v/KpfXDyldpr45k2HBOZVO1vvSi3WL24TJjAC+w4QqSOh2oGCDnrtr0K3JnJ
 KFJRsUsvIZVecXDdqNLt+3CAoStC05f9ewCIcxlihFgFj0RUheu2TwFQyBeEPC07zcG4
 EiLD+xW5omuDNuQEA0b3PV+fX5bZt649yMnIYfldn+M37Wbf3YsnK5MRJ3vq1cU5Zwcm
 aQUijOnAPR8BQonArmFF7vWTi7FX7gDXfoSEaCUe+SXH/0ov/p1XYM5rDSo5iPv7x6Oh
 HFSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/omDBP84VGaKWQnpAPXpDRHqw1Ourdy4aZvEtvOegAw=;
 b=PzG+IDM01oIxNFTdehYvm955TlvZtkTMuZTed+ATIhLT7L03b6MhXzWHppdzsVFVI2
 QineGc/L8l/oU3uTonHp64raaGjJWnP+/MnxQEkGGcd1dQWmbUXvPA464rTI0Uv+S3tx
 0oTUIoyPzsMydBKjvGMfAIHhY3CJACrNTC0vZ0oe/ox63R6tJbfLvj+0QpDAzUHo66r4
 vu3BJ1Oi9MY364V1kJO0HJy9OINV34V5lMCXyRHDD+XDT8vXOFsp2HDyuyhQm9GWAbjq
 avz7qPf+ahs85boBb7io+DHB6LWOTqQRGZAEkeqV8kZG6mpwxzw2ACLgajFwwR4cLE/q
 +NMQ==
X-Gm-Message-State: AOAM533A5FlmPeJBNg7u+l3SQbQyk6ZFlFV3HpadsaertALdTQQyMBDp
 MHWNKsWJ92+TNVLwRChV+9QQHSl3MmUE0OB+t/z4ymLI5ag=
X-Google-Smtp-Source: ABdhPJxwn02S2HpJn3jzLaK8d1s3la6gmZDlPvzbxCm1Z7Ca8tUjfRVeobInLts4bTQItU5461IAJb9mGgwkTk0QDuc=
X-Received: by 2002:a05:6122:221d:: with SMTP id
 bb29mr15133748vkb.30.1641781066067; 
 Sun, 09 Jan 2022 18:17:46 -0800 (PST)
MIME-Version: 1.0
References: <20220108030451.3867815-1-venture@google.com>
In-Reply-To: <20220108030451.3867815-1-venture@google.com>
From: Patrick Venture <venture@google.com>
Date: Sun, 9 Jan 2022 18:17:34 -0800
Message-ID: <CAO=notwq9OWgPEymrb6OR0LXkH784qZPxzaO0X8UvgT+_-TizQ@mail.gmail.com>
Subject: Re: [PATCH] hw/sensor: Add SB-TSI Temperature Sensor Interface
To: Thomas Huth <thuth@redhat.com>, lvivier@redhat.com, 
 Paolo Bonzini <pbonzini@redhat.com>, Corey Minyard <cminyard@mvista.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>, Hao Wu <wuhaotsh@google.com>, 
 Doug Evans <dje@google.com>
Content-Type: multipart/alternative; boundary="0000000000003e682905d530f107"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::529
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=venture@google.com; helo=mail-pg1-x529.google.com
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

--0000000000003e682905d530f107
Content-Type: text/plain; charset="UTF-8"

On Fri, Jan 7, 2022 at 7:04 PM Patrick Venture <venture@google.com> wrote:

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
>  8 files changed, 586 insertions(+)
>  create mode 100644 hw/sensor/tmp_sbtsi.c
>  create mode 100644 hw/sensor/trace-events
>  create mode 100644 hw/sensor/trace.h
>  create mode 100644 tests/qtest/tmp_sbtsi-test.c
>
> diff --git a/hw/sensor/Kconfig b/hw/sensor/Kconfig
> index 9c8a049b06..27f6f79c84 100644
> --- a/hw/sensor/Kconfig
> +++ b/hw/sensor/Kconfig
> @@ -21,3 +21,7 @@ config ADM1272
>  config MAX34451
>      bool
>      depends on I2C
> +
> +config AMDSBTSI
> +    bool
> +    depends on I2C
> diff --git a/hw/sensor/meson.build b/hw/sensor/meson.build
> index 059c4ca935..f7b0e645eb 100644
> --- a/hw/sensor/meson.build
> +++ b/hw/sensor/meson.build
> @@ -4,3 +4,4 @@ softmmu_ss.add(when: 'CONFIG_DPS310', if_true:
> files('dps310.c'))
>  softmmu_ss.add(when: 'CONFIG_EMC141X', if_true: files('emc141x.c'))
>  softmmu_ss.add(when: 'CONFIG_ADM1272', if_true: files('adm1272.c'))
>  softmmu_ss.add(when: 'CONFIG_MAX34451', if_true: files('max34451.c'))
> +softmmu_ss.add(when: 'CONFIG_AMDSBTSI', if_true: files('tmp_sbtsi.c'))
> diff --git a/hw/sensor/tmp_sbtsi.c b/hw/sensor/tmp_sbtsi.c
> new file mode 100644
> index 0000000000..b68c7ebf61
> --- /dev/null
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
> + * This program is distributed in the hope that it will be useful, but
> WITHOUT
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
> +#define SBTSI(obj) OBJECT_CHECK(SBTSIState, (obj), TYPE_SBTSI)
> +
> +/**
> + * SBTSIState:
> + * temperatures are in units of 0.125 degrees
> + * @temperature: Temperature
> + * @limit_low: Lowest temperature
> + * @limit_high: Highest temperature
> + * @status: The status register
> + * @config: The config register
> + * @alert_config: The config for alarm_l output.
> + * @addr: The address to read/write for the next cmd.
> + * @alarm: The alarm_l output pin (GPIO)
> + */
> +typedef struct SBTSIState {
> +    SMBusDevice parent;
> +
> +    uint32_t temperature;
> +    uint32_t limit_low;
> +    uint32_t limit_high;
> +    uint8_t status;
> +    uint8_t config;
> +    uint8_t alert_config;
> +    uint8_t addr;
> +    qemu_irq alarm;
> +} SBTSIState;
> +
> +/*
> + * SB-TSI registers only support SMBus byte data access. "_INT" registers
> are
> + * the integer part of a temperature value or limit, and "_DEC" registers
> are
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
> +
> +#define SBTSI_LIMIT_LOW_DEFAULT (0)
> +#define SBTSI_LIMIT_HIGH_DEFAULT (560)
> +#define SBTSI_MAN_DEFAULT (0)
> +#define SBTSI_REV_DEFAULT (4)
> +#define SBTSI_ALARM_L "alarm_l"
> +
> +/* The temperature we stored are in units of 0.125 degrees. */
> +#define SBTSI_TEMP_UNIT_IN_MILLIDEGREE 125
> +
> +/*
> + * The integer part and decimal of the temperature both 8 bits.
> + * Only the top 3 bits of the decimal parts are used.
> + * So the max temperature is (2^8-1) + (2^3-1)/8 = 255.875 degrees.
> + */
> +#define SBTSI_TEMP_MAX 255875
> +
> +/* The integer part of the temperature in terms of 0.125 degrees. */
> +static uint8_t get_temp_int(uint32_t temp)
> +{
> +    return temp >> 3;
> +}
> +
> +/*
> + * The decimal part of the temperature, in terms of 0.125 degrees.
> + * H/W store it in the top 3 bits so we shift it by 5.
> + */
> +static uint8_t get_temp_dec(uint32_t temp)
> +{
> +    return (temp & 0x7) << 5;
> +}
> +
> +/*
> + * Compute the temperature using the integer and decimal part,
> + * in terms of 0.125 degrees. The decimal part are only the top 3 bits
> + * so we shift it by 5 here.
> + */
> +static uint32_t compute_temp(uint8_t integer, uint8_t decimal)
> +{
> +    return (integer << 3) + (decimal >> 5);
> +}
> +
> +/* Compute new temp with new int part of the temperature. */
> +static uint32_t compute_temp_int(uint32_t temp, uint8_t integer)
> +{
> +    return compute_temp(integer, get_temp_dec(temp));
> +}
> +
> +/* Compute new temp with new dec part of the temperature. */
> +static uint32_t compute_temp_dec(uint32_t temp, uint8_t decimal)
> +{
> +    return compute_temp(get_temp_int(temp), decimal);
> +}
> +
> +/* The integer part of the temperature. */
> +static void sbtsi_update_status(SBTSIState *s)
> +{
> +    s->status = 0;
> +    if (s->alert_config & SBTSI_ALARM_EN) {
> +        if (s->temperature >= s->limit_high) {
> +            s->status |= SBTSI_STATUS_HIGH_ALERT;
> +        }
> +        if (s->temperature <= s->limit_low) {
> +            s->status |= SBTSI_STATUS_LOW_ALERT;
> +        }
> +    }
> +}
> +
> +static void sbtsi_update_alarm(SBTSIState *s)
> +{
> +    sbtsi_update_status(s);
> +    if (s->status != 0 && !(s->config & SBTSI_CONFIG_ALERT_MASK)) {
> +        qemu_irq_raise(s->alarm);
> +    } else {
> +        qemu_irq_lower(s->alarm);
> +    }
> +}
> +
> +static uint8_t sbtsi_read_byte(SMBusDevice *d)
> +{
> +    SBTSIState *s = SBTSI(d);
> +    uint8_t data = 0;
> +
> +    switch (s->addr) {
> +    case SBTSI_REG_TEMP_INT:
> +        data = get_temp_int(s->temperature);
> +        break;
> +
> +    case SBTSI_REG_TEMP_DEC:
> +        data = get_temp_dec(s->temperature);
> +        break;
> +
> +    case SBTSI_REG_TEMP_HIGH_INT:
> +        data = get_temp_int(s->limit_high);
> +        break;
> +
> +    case SBTSI_REG_TEMP_LOW_INT:
> +        data = get_temp_int(s->limit_low);
> +        break;
> +
> +    case SBTSI_REG_TEMP_HIGH_DEC:
> +        data = get_temp_dec(s->limit_high);
> +        break;
> +
> +    case SBTSI_REG_TEMP_LOW_DEC:
> +        data = get_temp_dec(s->limit_low);
> +        break;
> +
> +    case SBTSI_REG_CONFIG:
> +    case SBTSI_REG_CONFIG_WR:
> +        data = s->config;
> +        break;
> +
> +    case SBTSI_REG_STATUS:
> +        sbtsi_update_alarm(s);
> +        data = s->status;
> +        break;
> +
> +    case SBTSI_REG_ALERT_CONFIG:
> +        data = s->alert_config;
> +        break;
> +
> +    case SBTSI_REG_MAN:
> +        data = SBTSI_MAN_DEFAULT;
> +        break;
> +
> +    case SBTSI_REG_REV:
> +        data = SBTSI_REV_DEFAULT;
> +        break;
> +
> +    default:
> +        qemu_log_mask(LOG_GUEST_ERROR,
> +                "%s: reading from invalid reg: 0x%02x\n",
> +                __func__, s->addr);
> +        break;
> +    }
> +
> +    trace_tmp_sbtsi_read_data(s->addr, data);
> +    return data;
> +}
> +
> +static void sbtsi_write(SBTSIState *s, uint8_t data)
> +{
> +    trace_tmp_sbtsi_write_data(s->addr, data);
> +    switch (s->addr) {
> +    case SBTSI_REG_CONFIG_WR:
> +        s->config = data;
> +        break;
> +
> +    case SBTSI_REG_TEMP_HIGH_INT:
> +        s->limit_high = compute_temp_int(s->limit_high, data);
> +        break;
> +
> +    case SBTSI_REG_TEMP_LOW_INT:
> +        s->limit_low = compute_temp_int(s->limit_low, data);
> +        break;
> +
> +    case SBTSI_REG_TEMP_HIGH_DEC:
> +        s->limit_high = compute_temp_dec(s->limit_high, data);
> +        break;
> +
> +    case SBTSI_REG_TEMP_LOW_DEC:
> +        s->limit_low = compute_temp_dec(s->limit_low, data);
> +        break;
> +
> +    case SBTSI_REG_ALERT_CONFIG:
> +        s->alert_config = data;
> +        break;
> +
> +    case SBTSI_REG_TEMP_INT:
> +    case SBTSI_REG_TEMP_DEC:
> +    case SBTSI_REG_CONFIG:
> +    case SBTSI_REG_STATUS:
> +    case SBTSI_REG_MAN:
> +    case SBTSI_REG_REV:
> +        qemu_log_mask(LOG_GUEST_ERROR,
> +                "%s: writing to read only reg: 0x%02x data: 0x%02x\n",
> +                __func__, s->addr, data);
> +        break;
> +
> +    default:
> +        qemu_log_mask(LOG_GUEST_ERROR,
> +                "%s: writing to invalid reg: 0x%02x data: 0x%02x\n",
> +                __func__, s->addr, data);
> +        break;
> +    }
> +    sbtsi_update_alarm(s);
> +}
> +
> +static int sbtsi_write_data(SMBusDevice *d, uint8_t *buf, uint8_t len)
> +{
> +    SBTSIState *s = SBTSI(d);
> +
> +    if (len == 0) {
> +        qemu_log_mask(LOG_GUEST_ERROR, "%s: writing empty data\n",
> __func__);
> +        return -1;
> +    }
> +
> +    s->addr = buf[0];
> +    if (len > 1) {
> +        sbtsi_write(s, buf[1]);
> +        if (len > 2) {
> +            qemu_log_mask(LOG_GUEST_ERROR, "%s: extra data at end\n",
> __func__);
> +        }
> +    }
> +    return 0;
> +}
> +
> +/* Units are millidegrees. */
> +static void sbtsi_get_temperature(Object *obj, Visitor *v, const char
> *name,
> +                                  void *opaque, Error **errp)
> +{
> +    SBTSIState *s = SBTSI(obj);
> +    uint32_t temp = s->temperature * SBTSI_TEMP_UNIT_IN_MILLIDEGREE;
> +
> +    visit_type_uint32(v, name, &temp, errp);
> +}
> +
> +/* Units are millidegrees. */
> +static void sbtsi_set_temperature(Object *obj, Visitor *v, const char
> *name,
> +                                  void *opaque, Error **errp)
> +{
> +    SBTSIState *s = SBTSI(obj);
> +    uint32_t temp;
> +
> +    if (!visit_type_uint32(v, name, &temp, errp)) {
> +        return;
> +    }
> +    if (temp > SBTSI_TEMP_MAX) {
> +        error_setg(errp, "value %" PRIu32 ".%03" PRIu32 " C is out of
> range",
> +                   temp / 1000, temp % 1000);
> +        return;
> +    }
> +
> +    s->temperature = temp / SBTSI_TEMP_UNIT_IN_MILLIDEGREE;
> +    sbtsi_update_alarm(s);
> +}
> +
> +static int sbtsi_post_load(void *opaque, int version_id)
> +{
> +    SBTSIState *s = opaque;
> +
> +    sbtsi_update_alarm(s);
> +    return 0;
> +}
> +
> +static const VMStateDescription vmstate_sbtsi = {
> +    .name = "SBTSI",
> +    .version_id = 0,
> +    .minimum_version_id = 0,
> +    .post_load = sbtsi_post_load,
> +    .fields = (VMStateField[]) {
> +        VMSTATE_UINT32(temperature, SBTSIState),
> +        VMSTATE_UINT32(limit_low, SBTSIState),
> +        VMSTATE_UINT32(limit_high, SBTSIState),
> +        VMSTATE_UINT8(config, SBTSIState),
> +        VMSTATE_UINT8(status, SBTSIState),
> +        VMSTATE_UINT8(addr, SBTSIState),
> +        VMSTATE_END_OF_LIST()
> +    }
> +};
> +
> +static void sbtsi_enter_reset(Object *obj, ResetType type)
> +{
> +    SBTSIState *s = SBTSI(obj);
> +
> +    s->config = 0;
> +    s->limit_low = SBTSI_LIMIT_LOW_DEFAULT;
> +    s->limit_high = SBTSI_LIMIT_HIGH_DEFAULT;
> +}
> +
> +static void sbtsi_hold_reset(Object *obj)
> +{
> +    SBTSIState *s = SBTSI(obj);
> +
> +    qemu_irq_lower(s->alarm);
> +}
> +
> +static void sbtsi_init(Object *obj)
> +{
> +    SBTSIState *s = SBTSI(obj);
> +
> +    /* Current temperature in millidegrees. */
> +    object_property_add(obj, "temperature", "uint32",
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
> +}
> +
> +static const TypeInfo sbtsi_info = {
> +    .name          = TYPE_SBTSI,
> +    .parent        = TYPE_SMBUS_DEVICE,
> +    .instance_size = sizeof(SBTSIState),
> +    .instance_init = sbtsi_init,
> +    .class_init    = sbtsi_class_init,
> +};
> +
> +static void sbtsi_register_types(void)
> +{
> +    type_register_static(&sbtsi_info);
> +}
> +
> +type_init(sbtsi_register_types)
> diff --git a/hw/sensor/trace-events b/hw/sensor/trace-events
> new file mode 100644
> index 0000000000..21ab3809e2
> --- /dev/null
> +++ b/hw/sensor/trace-events
> @@ -0,0 +1,5 @@
> +# See docs/devel/tracing.rst for syntax documentation.
> +
> +# tmp_sbtsi.c
> +tmp_sbtsi_write_data(uint8_t addr, uint8_t value) "SBTSI write
> addr:0x%02x data: 0x%02x"
> +tmp_sbtsi_read_data(uint8_t addr, uint8_t value) "SBTSI read addr:0x%02x
> data: 0x%02x"
> diff --git a/hw/sensor/trace.h b/hw/sensor/trace.h
> new file mode 100644
> index 0000000000..e4721560b0
> --- /dev/null
> +++ b/hw/sensor/trace.h
> @@ -0,0 +1 @@
> +#include "trace/trace-hw_sensor.h"
> diff --git a/meson.build b/meson.build
> index 53065e96ec..f8ab0bf74e 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -2494,6 +2494,7 @@ if have_system
>      'hw/rtc',
>      'hw/s390x',
>      'hw/scsi',
> +    'hw/sensor',
>      'hw/sd',
>      'hw/sh4',
>      'hw/sparc',
> diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
> index 37e1eaa449..d1a8c38f74 100644
> --- a/tests/qtest/meson.build
> +++ b/tests/qtest/meson.build
> @@ -254,6 +254,7 @@ qos_test_ss.add(
>    'spapr-phb-test.c',
>    'tmp105-test.c',
>    'emc141x-test.c',
> +  'tmp_sbtsi-test.c',
>    'usb-hcd-ohci-test.c',
>    'virtio-test.c',
>    'virtio-blk-test.c',
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
> + * This program is distributed in the hope that it will be useful, but
> WITHOUT
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
> + * SB-TSI registers only support SMBus byte data access. "_INT" registers
> are
> + * the integer part of a temperature value or limit, and "_DEC" registers
> are
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
> +
> +/* The temperature stored are in units of 0.125 degrees. */
> +#define TEMP_UNIT_IN_MILLIDEGREE 125
> +#define LIMIT_LOW (10500)
> +#define LIMIT_HIGH (55125)
> +
> +static uint32_t qmp_sbtsi_get_temperature(const char *id)
> +{
> +    QDict *response;
> +    int ret;
> +
> +    response = qmp("{ 'execute': 'qom-get', 'arguments': { 'path': %s, "
> +                   "'property': 'temperature' } }", id);
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
> +                   "'property': 'temperature', 'value': %d } }", id,
> value);
> +    g_assert(qdict_haskey(response, "return"));
> +    qobject_unref(response);
> +}
> +
> +/*
> + * Compute the temperature using the integer and decimal part and return
> + * millidegrees. The decimal part are only the top 3 bits so we shift it
> by
> + * 5 here.
> + */
> +static uint32_t regs_to_temp(uint8_t integer, uint8_t decimal)
> +{
> +    return ((integer << 3) + (decimal >> 5)) * TEMP_UNIT_IN_MILLIDEGREE;
> +}
> +
> +/*
> + * Compute the integer and decimal parts of the temperature in
> millidegrees.
> + * H/W store the decimal in the top 3 bits so we shift it by 5.
> + */
> +static void temp_to_regs(uint32_t temp, uint8_t *integer, uint8_t
> *decimal)
> +{
> +    temp /= TEMP_UNIT_IN_MILLIDEGREE;
> +    *integer = temp >> 3;
> +    *decimal = (temp & 0x7) << 5;
> +}
> +
> +static void tx_rx(void *obj, void *data, QGuestAllocator *alloc)
> +{
> +    uint16_t value;
> +    uint8_t integer, decimal;
> +    QI2CDevice *i2cdev = (QI2CDevice *)obj;
> +
> +    /* Test default values */
> +    value = qmp_sbtsi_get_temperature(TEST_ID);
> +    g_assert_cmpuint(value, ==, 0);
> +
> +    integer = i2c_get8(i2cdev, REG_TEMP_INT);
> +    decimal = i2c_get8(i2cdev, REG_TEMP_DEC);
> +    g_assert_cmpuint(regs_to_temp(integer, decimal), ==, 0);
> +
> +    /* Test setting temperature */
> +    qmp_sbtsi_set_temperature(TEST_ID, 20000);
> +    value = qmp_sbtsi_get_temperature(TEST_ID);
> +    g_assert_cmpuint(value, ==, 20000);
> +
> +    integer = i2c_get8(i2cdev, REG_TEMP_INT);
> +    decimal = i2c_get8(i2cdev, REG_TEMP_DEC);
> +    g_assert_cmpuint(regs_to_temp(integer, decimal), ==, 20000);
> +
> +    /* Set alert mask in config */
> +    i2c_set8(i2cdev, REG_CONFIG_WR, CONFIG_ALERT_MASK);
> +    value = i2c_get8(i2cdev, REG_CONFIG);
> +    g_assert_cmphex(value, ==, CONFIG_ALERT_MASK);
> +    /* Enable alarm_en */
> +    i2c_set8(i2cdev, REG_ALERT_CONFIG, ALARM_EN);
> +    value = i2c_get8(i2cdev, REG_ALERT_CONFIG);
> +    g_assert_cmphex(value, ==, ALARM_EN);
> +
> +    /* Test setting limits */
> +    /* Limit low = 10.500 */
> +    temp_to_regs(LIMIT_LOW, &integer, &decimal);
> +    i2c_set8(i2cdev, REG_TEMP_LOW_INT, integer);
> +    i2c_set8(i2cdev, REG_TEMP_LOW_DEC, decimal);
> +    integer = i2c_get8(i2cdev, REG_TEMP_LOW_INT);
> +    decimal = i2c_get8(i2cdev, REG_TEMP_LOW_DEC);
> +    g_assert_cmpuint(regs_to_temp(integer, decimal), ==, LIMIT_LOW);
> +    /* Limit high = 55.125 */
> +    temp_to_regs(LIMIT_HIGH, &integer, &decimal);
> +    i2c_set8(i2cdev, REG_TEMP_HIGH_INT, integer);
> +    i2c_set8(i2cdev, REG_TEMP_HIGH_DEC, decimal);
> +    integer = i2c_get8(i2cdev, REG_TEMP_HIGH_INT);
> +    decimal = i2c_get8(i2cdev, REG_TEMP_HIGH_DEC);
> +    g_assert_cmpuint(regs_to_temp(integer, decimal), ==, LIMIT_HIGH);
> +    /* No alert is generated. */
> +    value = i2c_get8(i2cdev, REG_STATUS);
> +    g_assert_cmphex(value, ==, 0);
> +
> +    /* Test alert for low temperature */
> +    qmp_sbtsi_set_temperature(TEST_ID, LIMIT_LOW);
> +    value = i2c_get8(i2cdev, REG_STATUS);
> +    g_assert_cmphex(value, ==, STATUS_LOW_ALERT);
> +
> +    /* Test alert for high temperature */
> +    qmp_sbtsi_set_temperature(TEST_ID, LIMIT_HIGH);
> +    value = i2c_get8(i2cdev, REG_STATUS);
> +    g_assert_cmphex(value, ==, STATUS_HIGH_ALERT);
> +
> +    /* Disable alarm_en */
> +    i2c_set8(i2cdev, REG_ALERT_CONFIG, 0);
> +    value = i2c_get8(i2cdev, REG_ALERT_CONFIG);
> +    g_assert_cmphex(value, ==, 0);
> +    /* No alert when alarm_en is false. */
> +    value = i2c_get8(i2cdev, REG_STATUS);
> +    g_assert_cmphex(value, ==, 0);
> +}
> +
> +static void sbtsi_register_nodes(void)
> +{
> +    QOSGraphEdgeOptions opts = {
> +        .extra_device_opts = "id=" TEST_ID ",address=0x4c"
> +    };
> +    add_qi2c_address(&opts, &(QI2CAddress) { TEST_ADDR });
> +
> +    qos_node_create_driver("sbtsi", i2c_device_create);
> +    qos_node_consumes("sbtsi", "i2c-bus", &opts);
> +
> +    qos_add_test("tx-rx", "sbtsi", tx_rx, NULL);
> +}
> +libqos_init(sbtsi_register_nodes);
> --


+ Corey for i2c maintainer.  The new sensor directory is mostly if not
entirely i2c devices.  I didn't create a maintainer entry for this i2c
device, but I can if desired and send out a v2.


> 2.34.1.575.g55b058a8bb-goog
>
>

--0000000000003e682905d530f107
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, Jan 7, 2022 at 7:04 PM Patric=
k Venture &lt;<a href=3D"mailto:venture@google.com">venture@google.com</a>&=
gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">From:=
 Hao Wu &lt;<a href=3D"mailto:wuhaotsh@google.com" target=3D"_blank">wuhaot=
sh@google.com</a>&gt;<br>
<br>
SB Temperature Sensor Interface (SB-TSI) is an SMBus compatible<br>
interface that reports AMD SoC&#39;s Ttcl (normalized temperature),<br>
and resembles a typical 8-pin remote temperature sensor&#39;s I2C interface=
<br>
to BMC.<br>
<br>
This patch implements a basic AMD SB-TSI sensor that is<br>
compatible with the open-source data sheet from AMD and Linux<br>
kernel driver.<br>
<br>
Reference:<br>
Linux kernel driver:<br>
<a href=3D"https://lkml.org/lkml/2020/12/11/968" rel=3D"noreferrer" target=
=3D"_blank">https://lkml.org/lkml/2020/12/11/968</a><br>
Register Map:<br>
<a href=3D"https://developer.amd.com/wp-content/resources/56255_3_03.PDF" r=
el=3D"noreferrer" target=3D"_blank">https://developer.amd.com/wp-content/re=
sources/56255_3_03.PDF</a><br>
(Chapter 6)<br>
<br>
Signed-off-by: Hao Wu &lt;<a href=3D"mailto:wuhaotsh@google.com" target=3D"=
_blank">wuhaotsh@google.com</a>&gt;<br>
Reviewed-by: Doug Evans &lt;<a href=3D"mailto:dje@google.com" target=3D"_bl=
ank">dje@google.com</a>&gt;<br>
---<br>
=C2=A0hw/sensor/Kconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
=C2=A04 +<br>
=C2=A0hw/sensor/meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A01 +<br=
>
=C2=A0hw/sensor/tmp_sbtsi.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 393 ++++++++++++++=
+++++++++++++++++++++<br>
=C2=A0hw/sensor/trace-events=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A05 +<br=
>
=C2=A0hw/sensor/trace.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
=C2=A01 +<br>
=C2=A0meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 =C2=A01 +<br>
=C2=A0tests/qtest/meson.build=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A01 +<br>
=C2=A0tests/qtest/tmp_sbtsi-test.c | 180 ++++++++++++++++<br>
=C2=A08 files changed, 586 insertions(+)<br>
=C2=A0create mode 100644 hw/sensor/tmp_sbtsi.c<br>
=C2=A0create mode 100644 hw/sensor/trace-events<br>
=C2=A0create mode 100644 hw/sensor/trace.h<br>
=C2=A0create mode 100644 tests/qtest/tmp_sbtsi-test.c<br>
<br>
diff --git a/hw/sensor/Kconfig b/hw/sensor/Kconfig<br>
index 9c8a049b06..27f6f79c84 100644<br>
--- a/hw/sensor/Kconfig<br>
+++ b/hw/sensor/Kconfig<br>
@@ -21,3 +21,7 @@ config ADM1272<br>
=C2=A0config MAX34451<br>
=C2=A0 =C2=A0 =C2=A0bool<br>
=C2=A0 =C2=A0 =C2=A0depends on I2C<br>
+<br>
+config AMDSBTSI<br>
+=C2=A0 =C2=A0 bool<br>
+=C2=A0 =C2=A0 depends on I2C<br>
diff --git a/hw/sensor/meson.build b/hw/sensor/meson.build<br>
index 059c4ca935..f7b0e645eb 100644<br>
--- a/hw/sensor/meson.build<br>
+++ b/hw/sensor/meson.build<br>
@@ -4,3 +4,4 @@ softmmu_ss.add(when: &#39;CONFIG_DPS310&#39;, if_true: file=
s(&#39;dps310.c&#39;))<br>
=C2=A0softmmu_ss.add(when: &#39;CONFIG_EMC141X&#39;, if_true: files(&#39;em=
c141x.c&#39;))<br>
=C2=A0softmmu_ss.add(when: &#39;CONFIG_ADM1272&#39;, if_true: files(&#39;ad=
m1272.c&#39;))<br>
=C2=A0softmmu_ss.add(when: &#39;CONFIG_MAX34451&#39;, if_true: files(&#39;m=
ax34451.c&#39;))<br>
+softmmu_ss.add(when: &#39;CONFIG_AMDSBTSI&#39;, if_true: files(&#39;tmp_sb=
tsi.c&#39;))<br>
diff --git a/hw/sensor/tmp_sbtsi.c b/hw/sensor/tmp_sbtsi.c<br>
new file mode 100644<br>
index 0000000000..b68c7ebf61<br>
--- /dev/null<br>
+++ b/hw/sensor/tmp_sbtsi.c<br>
@@ -0,0 +1,393 @@<br>
+/*<br>
+ * AMD SBI Temperature Sensor Interface (SB-TSI)<br>
+ *<br>
+ * Copyright 2021 Google LLC<br>
+ *<br>
+ * This program is free software; you can redistribute it and/or modify it=
<br>
+ * under the terms of the GNU General Public License as published by the<b=
r>
+ * Free Software Foundation; either version 2 of the License, or<br>
+ * (at your option) any later version.<br>
+ *<br>
+ * This program is distributed in the hope that it will be useful, but WIT=
HOUT<br>
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or<b=
r>
+ * FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License<br=
>
+ * for more details.<br>
+ */<br>
+<br>
+#include &quot;qemu/osdep.h&quot;<br>
+#include &quot;hw/i2c/smbus_slave.h&quot;<br>
+#include &quot;hw/irq.h&quot;<br>
+#include &quot;migration/vmstate.h&quot;<br>
+#include &quot;qapi/error.h&quot;<br>
+#include &quot;qapi/visitor.h&quot;<br>
+#include &quot;qemu/log.h&quot;<br>
+#include &quot;qemu/module.h&quot;<br>
+#include &quot;trace.h&quot;<br>
+<br>
+#define TYPE_SBTSI &quot;sbtsi&quot;<br>
+#define SBTSI(obj) OBJECT_CHECK(SBTSIState, (obj), TYPE_SBTSI)<br>
+<br>
+/**<br>
+ * SBTSIState:<br>
+ * temperatures are in units of 0.125 degrees<br>
+ * @temperature: Temperature<br>
+ * @limit_low: Lowest temperature<br>
+ * @limit_high: Highest temperature<br>
+ * @status: The status register<br>
+ * @config: The config register<br>
+ * @alert_config: The config for alarm_l output.<br>
+ * @addr: The address to read/write for the next cmd.<br>
+ * @alarm: The alarm_l output pin (GPIO)<br>
+ */<br>
+typedef struct SBTSIState {<br>
+=C2=A0 =C2=A0 SMBusDevice parent;<br>
+<br>
+=C2=A0 =C2=A0 uint32_t temperature;<br>
+=C2=A0 =C2=A0 uint32_t limit_low;<br>
+=C2=A0 =C2=A0 uint32_t limit_high;<br>
+=C2=A0 =C2=A0 uint8_t status;<br>
+=C2=A0 =C2=A0 uint8_t config;<br>
+=C2=A0 =C2=A0 uint8_t alert_config;<br>
+=C2=A0 =C2=A0 uint8_t addr;<br>
+=C2=A0 =C2=A0 qemu_irq alarm;<br>
+} SBTSIState;<br>
+<br>
+/*<br>
+ * SB-TSI registers only support SMBus byte data access. &quot;_INT&quot; =
registers are<br>
+ * the integer part of a temperature value or limit, and &quot;_DEC&quot; =
registers are<br>
+ * corresponding decimal parts.<br>
+ */<br>
+#define SBTSI_REG_TEMP_INT=C2=A0 =C2=A0 =C2=A0 0x01 /* RO */<br>
+#define SBTSI_REG_STATUS=C2=A0 =C2=A0 =C2=A0 =C2=A0 0x02 /* RO */<br>
+#define SBTSI_REG_CONFIG=C2=A0 =C2=A0 =C2=A0 =C2=A0 0x03 /* RO */<br>
+#define SBTSI_REG_TEMP_HIGH_INT 0x07 /* RW */<br>
+#define SBTSI_REG_TEMP_LOW_INT=C2=A0 0x08 /* RW */<br>
+#define SBTSI_REG_CONFIG_WR=C2=A0 =C2=A0 =C2=A00x09 /* RW */<br>
+#define SBTSI_REG_TEMP_DEC=C2=A0 =C2=A0 =C2=A0 0x10 /* RO */<br>
+#define SBTSI_REG_TEMP_HIGH_DEC 0x13 /* RW */<br>
+#define SBTSI_REG_TEMP_LOW_DEC=C2=A0 0x14 /* RW */<br>
+#define SBTSI_REG_ALERT_CONFIG=C2=A0 0xBF /* RW */<br>
+#define SBTSI_REG_MAN=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00xFE /* RO *=
/<br>
+#define SBTSI_REG_REV=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00xFF /* RO *=
/<br>
+<br>
+#define SBTSI_STATUS_HIGH_ALERT BIT(4)<br>
+#define SBTSI_STATUS_LOW_ALERT=C2=A0 BIT(3)<br>
+#define SBTSI_CONFIG_ALERT_MASK BIT(7)<br>
+#define SBTSI_ALARM_EN=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 BIT(0)<br>
+<br>
+#define SBTSI_LIMIT_LOW_DEFAULT (0)<br>
+#define SBTSI_LIMIT_HIGH_DEFAULT (560)<br>
+#define SBTSI_MAN_DEFAULT (0)<br>
+#define SBTSI_REV_DEFAULT (4)<br>
+#define SBTSI_ALARM_L &quot;alarm_l&quot;<br>
+<br>
+/* The temperature we stored are in units of 0.125 degrees. */<br>
+#define SBTSI_TEMP_UNIT_IN_MILLIDEGREE 125<br>
+<br>
+/*<br>
+ * The integer part and decimal of the temperature both 8 bits.<br>
+ * Only the top 3 bits of the decimal parts are used.<br>
+ * So the max temperature is (2^8-1) + (2^3-1)/8 =3D 255.875 degrees.<br>
+ */<br>
+#define SBTSI_TEMP_MAX 255875<br>
+<br>
+/* The integer part of the temperature in terms of 0.125 degrees. */<br>
+static uint8_t get_temp_int(uint32_t temp)<br>
+{<br>
+=C2=A0 =C2=A0 return temp &gt;&gt; 3;<br>
+}<br>
+<br>
+/*<br>
+ * The decimal part of the temperature, in terms of 0.125 degrees.<br>
+ * H/W store it in the top 3 bits so we shift it by 5.<br>
+ */<br>
+static uint8_t get_temp_dec(uint32_t temp)<br>
+{<br>
+=C2=A0 =C2=A0 return (temp &amp; 0x7) &lt;&lt; 5;<br>
+}<br>
+<br>
+/*<br>
+ * Compute the temperature using the integer and decimal part,<br>
+ * in terms of 0.125 degrees. The decimal part are only the top 3 bits<br>
+ * so we shift it by 5 here.<br>
+ */<br>
+static uint32_t compute_temp(uint8_t integer, uint8_t decimal)<br>
+{<br>
+=C2=A0 =C2=A0 return (integer &lt;&lt; 3) + (decimal &gt;&gt; 5);<br>
+}<br>
+<br>
+/* Compute new temp with new int part of the temperature. */<br>
+static uint32_t compute_temp_int(uint32_t temp, uint8_t integer)<br>
+{<br>
+=C2=A0 =C2=A0 return compute_temp(integer, get_temp_dec(temp));<br>
+}<br>
+<br>
+/* Compute new temp with new dec part of the temperature. */<br>
+static uint32_t compute_temp_dec(uint32_t temp, uint8_t decimal)<br>
+{<br>
+=C2=A0 =C2=A0 return compute_temp(get_temp_int(temp), decimal);<br>
+}<br>
+<br>
+/* The integer part of the temperature. */<br>
+static void sbtsi_update_status(SBTSIState *s)<br>
+{<br>
+=C2=A0 =C2=A0 s-&gt;status =3D 0;<br>
+=C2=A0 =C2=A0 if (s-&gt;alert_config &amp; SBTSI_ALARM_EN) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (s-&gt;temperature &gt;=3D s-&gt;limit_high=
) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;status |=3D SBTSI_STATUS_H=
IGH_ALERT;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (s-&gt;temperature &lt;=3D s-&gt;limit_low)=
 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;status |=3D SBTSI_STATUS_L=
OW_ALERT;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 }<br>
+}<br>
+<br>
+static void sbtsi_update_alarm(SBTSIState *s)<br>
+{<br>
+=C2=A0 =C2=A0 sbtsi_update_status(s);<br>
+=C2=A0 =C2=A0 if (s-&gt;status !=3D 0 &amp;&amp; !(s-&gt;config &amp; SBTS=
I_CONFIG_ALERT_MASK)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_irq_raise(s-&gt;alarm);<br>
+=C2=A0 =C2=A0 } else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_irq_lower(s-&gt;alarm);<br>
+=C2=A0 =C2=A0 }<br>
+}<br>
+<br>
+static uint8_t sbtsi_read_byte(SMBusDevice *d)<br>
+{<br>
+=C2=A0 =C2=A0 SBTSIState *s =3D SBTSI(d);<br>
+=C2=A0 =C2=A0 uint8_t data =3D 0;<br>
+<br>
+=C2=A0 =C2=A0 switch (s-&gt;addr) {<br>
+=C2=A0 =C2=A0 case SBTSI_REG_TEMP_INT:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 data =3D get_temp_int(s-&gt;temperature);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+<br>
+=C2=A0 =C2=A0 case SBTSI_REG_TEMP_DEC:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 data =3D get_temp_dec(s-&gt;temperature);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+<br>
+=C2=A0 =C2=A0 case SBTSI_REG_TEMP_HIGH_INT:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 data =3D get_temp_int(s-&gt;limit_high);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+<br>
+=C2=A0 =C2=A0 case SBTSI_REG_TEMP_LOW_INT:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 data =3D get_temp_int(s-&gt;limit_low);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+<br>
+=C2=A0 =C2=A0 case SBTSI_REG_TEMP_HIGH_DEC:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 data =3D get_temp_dec(s-&gt;limit_high);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+<br>
+=C2=A0 =C2=A0 case SBTSI_REG_TEMP_LOW_DEC:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 data =3D get_temp_dec(s-&gt;limit_low);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+<br>
+=C2=A0 =C2=A0 case SBTSI_REG_CONFIG:<br>
+=C2=A0 =C2=A0 case SBTSI_REG_CONFIG_WR:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 data =3D s-&gt;config;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+<br>
+=C2=A0 =C2=A0 case SBTSI_REG_STATUS:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 sbtsi_update_alarm(s);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 data =3D s-&gt;status;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+<br>
+=C2=A0 =C2=A0 case SBTSI_REG_ALERT_CONFIG:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 data =3D s-&gt;alert_config;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+<br>
+=C2=A0 =C2=A0 case SBTSI_REG_MAN:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 data =3D SBTSI_MAN_DEFAULT;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+<br>
+=C2=A0 =C2=A0 case SBTSI_REG_REV:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 data =3D SBTSI_REV_DEFAULT;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+<br>
+=C2=A0 =C2=A0 default:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_log_mask(LOG_GUEST_ERROR,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;%s: reading =
from invalid reg: 0x%02x\n&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 __func__, s-&gt;ad=
dr);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 trace_tmp_sbtsi_read_data(s-&gt;addr, data);<br>
+=C2=A0 =C2=A0 return data;<br>
+}<br>
+<br>
+static void sbtsi_write(SBTSIState *s, uint8_t data)<br>
+{<br>
+=C2=A0 =C2=A0 trace_tmp_sbtsi_write_data(s-&gt;addr, data);<br>
+=C2=A0 =C2=A0 switch (s-&gt;addr) {<br>
+=C2=A0 =C2=A0 case SBTSI_REG_CONFIG_WR:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;config =3D data;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+<br>
+=C2=A0 =C2=A0 case SBTSI_REG_TEMP_HIGH_INT:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;limit_high =3D compute_temp_int(s-&gt;li=
mit_high, data);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+<br>
+=C2=A0 =C2=A0 case SBTSI_REG_TEMP_LOW_INT:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;limit_low =3D compute_temp_int(s-&gt;lim=
it_low, data);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+<br>
+=C2=A0 =C2=A0 case SBTSI_REG_TEMP_HIGH_DEC:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;limit_high =3D compute_temp_dec(s-&gt;li=
mit_high, data);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+<br>
+=C2=A0 =C2=A0 case SBTSI_REG_TEMP_LOW_DEC:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;limit_low =3D compute_temp_dec(s-&gt;lim=
it_low, data);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+<br>
+=C2=A0 =C2=A0 case SBTSI_REG_ALERT_CONFIG:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;alert_config =3D data;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+<br>
+=C2=A0 =C2=A0 case SBTSI_REG_TEMP_INT:<br>
+=C2=A0 =C2=A0 case SBTSI_REG_TEMP_DEC:<br>
+=C2=A0 =C2=A0 case SBTSI_REG_CONFIG:<br>
+=C2=A0 =C2=A0 case SBTSI_REG_STATUS:<br>
+=C2=A0 =C2=A0 case SBTSI_REG_MAN:<br>
+=C2=A0 =C2=A0 case SBTSI_REG_REV:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_log_mask(LOG_GUEST_ERROR,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;%s: writing =
to read only reg: 0x%02x data: 0x%02x\n&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 __func__, s-&gt;ad=
dr, data);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+<br>
+=C2=A0 =C2=A0 default:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_log_mask(LOG_GUEST_ERROR,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;%s: writing =
to invalid reg: 0x%02x data: 0x%02x\n&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 __func__, s-&gt;ad=
dr, data);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 sbtsi_update_alarm(s);<br>
+}<br>
+<br>
+static int sbtsi_write_data(SMBusDevice *d, uint8_t *buf, uint8_t len)<br>
+{<br>
+=C2=A0 =C2=A0 SBTSIState *s =3D SBTSI(d);<br>
+<br>
+=C2=A0 =C2=A0 if (len =3D=3D 0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_log_mask(LOG_GUEST_ERROR, &quot;%s: writi=
ng empty data\n&quot;, __func__);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return -1;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 s-&gt;addr =3D buf[0];<br>
+=C2=A0 =C2=A0 if (len &gt; 1) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 sbtsi_write(s, buf[1]);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (len &gt; 2) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_log_mask(LOG_GUEST_ERROR, &=
quot;%s: extra data at end\n&quot;, __func__);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 return 0;<br>
+}<br>
+<br>
+/* Units are millidegrees. */<br>
+static void sbtsi_get_temperature(Object *obj, Visitor *v, const char *nam=
e,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 void *opaque, Error **errp)<b=
r>
+{<br>
+=C2=A0 =C2=A0 SBTSIState *s =3D SBTSI(obj);<br>
+=C2=A0 =C2=A0 uint32_t temp =3D s-&gt;temperature * SBTSI_TEMP_UNIT_IN_MIL=
LIDEGREE;<br>
+<br>
+=C2=A0 =C2=A0 visit_type_uint32(v, name, &amp;temp, errp);<br>
+}<br>
+<br>
+/* Units are millidegrees. */<br>
+static void sbtsi_set_temperature(Object *obj, Visitor *v, const char *nam=
e,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 void *opaque, Error **errp)<b=
r>
+{<br>
+=C2=A0 =C2=A0 SBTSIState *s =3D SBTSI(obj);<br>
+=C2=A0 =C2=A0 uint32_t temp;<br>
+<br>
+=C2=A0 =C2=A0 if (!visit_type_uint32(v, name, &amp;temp, errp)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 if (temp &gt; SBTSI_TEMP_MAX) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg(errp, &quot;value %&quot; PRIu32 &q=
uot;.%03&quot; PRIu32 &quot; C is out of range&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0temp =
/ 1000, temp % 1000);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 s-&gt;temperature =3D temp / SBTSI_TEMP_UNIT_IN_MILLIDEGREE;=
<br>
+=C2=A0 =C2=A0 sbtsi_update_alarm(s);<br>
+}<br>
+<br>
+static int sbtsi_post_load(void *opaque, int version_id)<br>
+{<br>
+=C2=A0 =C2=A0 SBTSIState *s =3D opaque;<br>
+<br>
+=C2=A0 =C2=A0 sbtsi_update_alarm(s);<br>
+=C2=A0 =C2=A0 return 0;<br>
+}<br>
+<br>
+static const VMStateDescription vmstate_sbtsi =3D {<br>
+=C2=A0 =C2=A0 .name =3D &quot;SBTSI&quot;,<br>
+=C2=A0 =C2=A0 .version_id =3D 0,<br>
+=C2=A0 =C2=A0 .minimum_version_id =3D 0,<br>
+=C2=A0 =C2=A0 .post_load =3D sbtsi_post_load,<br>
+=C2=A0 =C2=A0 .fields =3D (VMStateField[]) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 VMSTATE_UINT32(temperature, SBTSIState),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 VMSTATE_UINT32(limit_low, SBTSIState),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 VMSTATE_UINT32(limit_high, SBTSIState),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 VMSTATE_UINT8(config, SBTSIState),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 VMSTATE_UINT8(status, SBTSIState),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 VMSTATE_UINT8(addr, SBTSIState),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 VMSTATE_END_OF_LIST()<br>
+=C2=A0 =C2=A0 }<br>
+};<br>
+<br>
+static void sbtsi_enter_reset(Object *obj, ResetType type)<br>
+{<br>
+=C2=A0 =C2=A0 SBTSIState *s =3D SBTSI(obj);<br>
+<br>
+=C2=A0 =C2=A0 s-&gt;config =3D 0;<br>
+=C2=A0 =C2=A0 s-&gt;limit_low =3D SBTSI_LIMIT_LOW_DEFAULT;<br>
+=C2=A0 =C2=A0 s-&gt;limit_high =3D SBTSI_LIMIT_HIGH_DEFAULT;<br>
+}<br>
+<br>
+static void sbtsi_hold_reset(Object *obj)<br>
+{<br>
+=C2=A0 =C2=A0 SBTSIState *s =3D SBTSI(obj);<br>
+<br>
+=C2=A0 =C2=A0 qemu_irq_lower(s-&gt;alarm);<br>
+}<br>
+<br>
+static void sbtsi_init(Object *obj)<br>
+{<br>
+=C2=A0 =C2=A0 SBTSIState *s =3D SBTSI(obj);<br>
+<br>
+=C2=A0 =C2=A0 /* Current temperature in millidegrees. */<br>
+=C2=A0 =C2=A0 object_property_add(obj, &quot;temperature&quot;, &quot;uint=
32&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 sbtsi_get_temperature, sbtsi_set_temperature,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 NULL, NULL);<br>
+=C2=A0 =C2=A0 qdev_init_gpio_out_named(DEVICE(obj), &amp;s-&gt;alarm, SBTS=
I_ALARM_L, 0);<br>
+}<br>
+<br>
+static void sbtsi_class_init(ObjectClass *klass, void *data)<br>
+{<br>
+=C2=A0 =C2=A0 ResettableClass *rc =3D RESETTABLE_CLASS(klass);<br>
+=C2=A0 =C2=A0 DeviceClass *dc =3D DEVICE_CLASS(klass);<br>
+=C2=A0 =C2=A0 SMBusDeviceClass *k =3D SMBUS_DEVICE_CLASS(klass);<br>
+<br>
+=C2=A0 =C2=A0 dc-&gt;desc =3D &quot;SB-TSI Temperature Sensor&quot;;<br>
+=C2=A0 =C2=A0 dc-&gt;vmsd =3D &amp;vmstate_sbtsi;<br>
+=C2=A0 =C2=A0 k-&gt;write_data =3D sbtsi_write_data;<br>
+=C2=A0 =C2=A0 k-&gt;receive_byte =3D sbtsi_read_byte;<br>
+=C2=A0 =C2=A0 rc-&gt;phases.enter =3D sbtsi_enter_reset;<br>
+=C2=A0 =C2=A0 rc-&gt;phases.hold =3D sbtsi_hold_reset;<br>
+}<br>
+<br>
+static const TypeInfo sbtsi_info =3D {<br>
+=C2=A0 =C2=A0 .name=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D TYPE_SBTSI,<br>
+=C2=A0 =C2=A0 .parent=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D TYPE_SMBUS_DEVICE,<br=
>
+=C2=A0 =C2=A0 .instance_size =3D sizeof(SBTSIState),<br>
+=C2=A0 =C2=A0 .instance_init =3D sbtsi_init,<br>
+=C2=A0 =C2=A0 .class_init=C2=A0 =C2=A0 =3D sbtsi_class_init,<br>
+};<br>
+<br>
+static void sbtsi_register_types(void)<br>
+{<br>
+=C2=A0 =C2=A0 type_register_static(&amp;sbtsi_info);<br>
+}<br>
+<br>
+type_init(sbtsi_register_types)<br>
diff --git a/hw/sensor/trace-events b/hw/sensor/trace-events<br>
new file mode 100644<br>
index 0000000000..21ab3809e2<br>
--- /dev/null<br>
+++ b/hw/sensor/trace-events<br>
@@ -0,0 +1,5 @@<br>
+# See docs/devel/tracing.rst for syntax documentation.<br>
+<br>
+# tmp_sbtsi.c<br>
+tmp_sbtsi_write_data(uint8_t addr, uint8_t value) &quot;SBTSI write addr:0=
x%02x data: 0x%02x&quot;<br>
+tmp_sbtsi_read_data(uint8_t addr, uint8_t value) &quot;SBTSI read addr:0x%=
02x data: 0x%02x&quot;<br>
diff --git a/hw/sensor/trace.h b/hw/sensor/trace.h<br>
new file mode 100644<br>
index 0000000000..e4721560b0<br>
--- /dev/null<br>
+++ b/hw/sensor/trace.h<br>
@@ -0,0 +1 @@<br>
+#include &quot;trace/trace-hw_sensor.h&quot;<br>
diff --git a/meson.build b/meson.build<br>
index 53065e96ec..f8ab0bf74e 100644<br>
--- a/meson.build<br>
+++ b/meson.build<br>
@@ -2494,6 +2494,7 @@ if have_system<br>
=C2=A0 =C2=A0 =C2=A0&#39;hw/rtc&#39;,<br>
=C2=A0 =C2=A0 =C2=A0&#39;hw/s390x&#39;,<br>
=C2=A0 =C2=A0 =C2=A0&#39;hw/scsi&#39;,<br>
+=C2=A0 =C2=A0 &#39;hw/sensor&#39;,<br>
=C2=A0 =C2=A0 =C2=A0&#39;hw/sd&#39;,<br>
=C2=A0 =C2=A0 =C2=A0&#39;hw/sh4&#39;,<br>
=C2=A0 =C2=A0 =C2=A0&#39;hw/sparc&#39;,<br>
diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build<br>
index 37e1eaa449..d1a8c38f74 100644<br>
--- a/tests/qtest/meson.build<br>
+++ b/tests/qtest/meson.build<br>
@@ -254,6 +254,7 @@ qos_test_ss.add(<br>
=C2=A0 =C2=A0&#39;spapr-phb-test.c&#39;,<br>
=C2=A0 =C2=A0&#39;tmp105-test.c&#39;,<br>
=C2=A0 =C2=A0&#39;emc141x-test.c&#39;,<br>
+=C2=A0 &#39;tmp_sbtsi-test.c&#39;,<br>
=C2=A0 =C2=A0&#39;usb-hcd-ohci-test.c&#39;,<br>
=C2=A0 =C2=A0&#39;virtio-test.c&#39;,<br>
=C2=A0 =C2=A0&#39;virtio-blk-test.c&#39;,<br>
diff --git a/tests/qtest/tmp_sbtsi-test.c b/tests/qtest/tmp_sbtsi-test.c<br=
>
new file mode 100644<br>
index 0000000000..7f5fafacc7<br>
--- /dev/null<br>
+++ b/tests/qtest/tmp_sbtsi-test.c<br>
@@ -0,0 +1,180 @@<br>
+/*<br>
+ * QTests for the SBTSI temperature sensor<br>
+ *<br>
+ * Copyright 2020 Google LLC<br>
+ *<br>
+ * This program is free software; you can redistribute it and/or modify it=
<br>
+ * under the terms of the GNU General Public License as published by the<b=
r>
+ * Free Software Foundation; either version 2 of the License, or<br>
+ * (at your option) any later version.<br>
+ *<br>
+ * This program is distributed in the hope that it will be useful, but WIT=
HOUT<br>
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or<b=
r>
+ * FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License<br=
>
+ * for more details.<br>
+ */<br>
+<br>
+#include &quot;qemu/osdep.h&quot;<br>
+<br>
+#include &quot;libqtest-single.h&quot;<br>
+#include &quot;libqos/qgraph.h&quot;<br>
+#include &quot;libqos/i2c.h&quot;<br>
+#include &quot;qapi/qmp/qdict.h&quot;<br>
+#include &quot;qemu/bitops.h&quot;<br>
+<br>
+#define TEST_ID=C2=A0 =C2=A0&quot;sbtsi-test&quot;<br>
+#define TEST_ADDR (0x4c)<br>
+<br>
+/*<br>
+ * SB-TSI registers only support SMBus byte data access. &quot;_INT&quot; =
registers are<br>
+ * the integer part of a temperature value or limit, and &quot;_DEC&quot; =
registers are<br>
+ * corresponding decimal parts.<br>
+ */<br>
+#define REG_TEMP_INT=C2=A0 =C2=A0 =C2=A0 0x01 /* RO */<br>
+#define REG_STATUS=C2=A0 =C2=A0 =C2=A0 =C2=A0 0x02 /* RO */<br>
+#define REG_CONFIG=C2=A0 =C2=A0 =C2=A0 =C2=A0 0x03 /* RO */<br>
+#define REG_TEMP_HIGH_INT 0x07 /* RW */<br>
+#define REG_TEMP_LOW_INT=C2=A0 0x08 /* RW */<br>
+#define REG_CONFIG_WR=C2=A0 =C2=A0 =C2=A00x09 /* RW */<br>
+#define REG_TEMP_DEC=C2=A0 =C2=A0 =C2=A0 0x10 /* RO */<br>
+#define REG_TEMP_HIGH_DEC 0x13 /* RW */<br>
+#define REG_TEMP_LOW_DEC=C2=A0 0x14 /* RW */<br>
+#define REG_ALERT_CONFIG=C2=A0 0xBF /* RW */<br>
+<br>
+#define STATUS_HIGH_ALERT BIT(4)<br>
+#define STATUS_LOW_ALERT=C2=A0 BIT(3)<br>
+#define CONFIG_ALERT_MASK BIT(7)<br>
+#define ALARM_EN=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 BIT(0)<br>
+<br>
+/* The temperature stored are in units of 0.125 degrees. */<br>
+#define TEMP_UNIT_IN_MILLIDEGREE 125<br>
+#define LIMIT_LOW (10500)<br>
+#define LIMIT_HIGH (55125)<br>
+<br>
+static uint32_t qmp_sbtsi_get_temperature(const char *id)<br>
+{<br>
+=C2=A0 =C2=A0 QDict *response;<br>
+=C2=A0 =C2=A0 int ret;<br>
+<br>
+=C2=A0 =C2=A0 response =3D qmp(&quot;{ &#39;execute&#39;: &#39;qom-get&#39=
;, &#39;arguments&#39;: { &#39;path&#39;: %s, &quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot=
;&#39;property&#39;: &#39;temperature&#39; } }&quot;, id);<br>
+=C2=A0 =C2=A0 g_assert(qdict_haskey(response, &quot;return&quot;));<br>
+=C2=A0 =C2=A0 ret =3D (uint32_t)qdict_get_int(response, &quot;return&quot;=
);<br>
+=C2=A0 =C2=A0 qobject_unref(response);<br>
+=C2=A0 =C2=A0 return ret;<br>
+}<br>
+<br>
+static void qmp_sbtsi_set_temperature(const char *id, uint32_t value)<br>
+{<br>
+=C2=A0 =C2=A0 QDict *response;<br>
+<br>
+=C2=A0 =C2=A0 response =3D qmp(&quot;{ &#39;execute&#39;: &#39;qom-set&#39=
;, &#39;arguments&#39;: { &#39;path&#39;: %s, &quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot=
;&#39;property&#39;: &#39;temperature&#39;, &#39;value&#39;: %d } }&quot;, =
id, value);<br>
+=C2=A0 =C2=A0 g_assert(qdict_haskey(response, &quot;return&quot;));<br>
+=C2=A0 =C2=A0 qobject_unref(response);<br>
+}<br>
+<br>
+/*<br>
+ * Compute the temperature using the integer and decimal part and return<b=
r>
+ * millidegrees. The decimal part are only the top 3 bits so we shift it b=
y<br>
+ * 5 here.<br>
+ */<br>
+static uint32_t regs_to_temp(uint8_t integer, uint8_t decimal)<br>
+{<br>
+=C2=A0 =C2=A0 return ((integer &lt;&lt; 3) + (decimal &gt;&gt; 5)) * TEMP_=
UNIT_IN_MILLIDEGREE;<br>
+}<br>
+<br>
+/*<br>
+ * Compute the integer and decimal parts of the temperature in millidegree=
s.<br>
+ * H/W store the decimal in the top 3 bits so we shift it by 5.<br>
+ */<br>
+static void temp_to_regs(uint32_t temp, uint8_t *integer, uint8_t *decimal=
)<br>
+{<br>
+=C2=A0 =C2=A0 temp /=3D TEMP_UNIT_IN_MILLIDEGREE;<br>
+=C2=A0 =C2=A0 *integer =3D temp &gt;&gt; 3;<br>
+=C2=A0 =C2=A0 *decimal =3D (temp &amp; 0x7) &lt;&lt; 5;<br>
+}<br>
+<br>
+static void tx_rx(void *obj, void *data, QGuestAllocator *alloc)<br>
+{<br>
+=C2=A0 =C2=A0 uint16_t value;<br>
+=C2=A0 =C2=A0 uint8_t integer, decimal;<br>
+=C2=A0 =C2=A0 QI2CDevice *i2cdev =3D (QI2CDevice *)obj;<br>
+<br>
+=C2=A0 =C2=A0 /* Test default values */<br>
+=C2=A0 =C2=A0 value =3D qmp_sbtsi_get_temperature(TEST_ID);<br>
+=C2=A0 =C2=A0 g_assert_cmpuint(value, =3D=3D, 0);<br>
+<br>
+=C2=A0 =C2=A0 integer =3D i2c_get8(i2cdev, REG_TEMP_INT);<br>
+=C2=A0 =C2=A0 decimal =3D i2c_get8(i2cdev, REG_TEMP_DEC);<br>
+=C2=A0 =C2=A0 g_assert_cmpuint(regs_to_temp(integer, decimal), =3D=3D, 0);=
<br>
+<br>
+=C2=A0 =C2=A0 /* Test setting temperature */<br>
+=C2=A0 =C2=A0 qmp_sbtsi_set_temperature(TEST_ID, 20000);<br>
+=C2=A0 =C2=A0 value =3D qmp_sbtsi_get_temperature(TEST_ID);<br>
+=C2=A0 =C2=A0 g_assert_cmpuint(value, =3D=3D, 20000);<br>
+<br>
+=C2=A0 =C2=A0 integer =3D i2c_get8(i2cdev, REG_TEMP_INT);<br>
+=C2=A0 =C2=A0 decimal =3D i2c_get8(i2cdev, REG_TEMP_DEC);<br>
+=C2=A0 =C2=A0 g_assert_cmpuint(regs_to_temp(integer, decimal), =3D=3D, 200=
00);<br>
+<br>
+=C2=A0 =C2=A0 /* Set alert mask in config */<br>
+=C2=A0 =C2=A0 i2c_set8(i2cdev, REG_CONFIG_WR, CONFIG_ALERT_MASK);<br>
+=C2=A0 =C2=A0 value =3D i2c_get8(i2cdev, REG_CONFIG);<br>
+=C2=A0 =C2=A0 g_assert_cmphex(value, =3D=3D, CONFIG_ALERT_MASK);<br>
+=C2=A0 =C2=A0 /* Enable alarm_en */<br>
+=C2=A0 =C2=A0 i2c_set8(i2cdev, REG_ALERT_CONFIG, ALARM_EN);<br>
+=C2=A0 =C2=A0 value =3D i2c_get8(i2cdev, REG_ALERT_CONFIG);<br>
+=C2=A0 =C2=A0 g_assert_cmphex(value, =3D=3D, ALARM_EN);<br>
+<br>
+=C2=A0 =C2=A0 /* Test setting limits */<br>
+=C2=A0 =C2=A0 /* Limit low =3D 10.500 */<br>
+=C2=A0 =C2=A0 temp_to_regs(LIMIT_LOW, &amp;integer, &amp;decimal);<br>
+=C2=A0 =C2=A0 i2c_set8(i2cdev, REG_TEMP_LOW_INT, integer);<br>
+=C2=A0 =C2=A0 i2c_set8(i2cdev, REG_TEMP_LOW_DEC, decimal);<br>
+=C2=A0 =C2=A0 integer =3D i2c_get8(i2cdev, REG_TEMP_LOW_INT);<br>
+=C2=A0 =C2=A0 decimal =3D i2c_get8(i2cdev, REG_TEMP_LOW_DEC);<br>
+=C2=A0 =C2=A0 g_assert_cmpuint(regs_to_temp(integer, decimal), =3D=3D, LIM=
IT_LOW);<br>
+=C2=A0 =C2=A0 /* Limit high =3D 55.125 */<br>
+=C2=A0 =C2=A0 temp_to_regs(LIMIT_HIGH, &amp;integer, &amp;decimal);<br>
+=C2=A0 =C2=A0 i2c_set8(i2cdev, REG_TEMP_HIGH_INT, integer);<br>
+=C2=A0 =C2=A0 i2c_set8(i2cdev, REG_TEMP_HIGH_DEC, decimal);<br>
+=C2=A0 =C2=A0 integer =3D i2c_get8(i2cdev, REG_TEMP_HIGH_INT);<br>
+=C2=A0 =C2=A0 decimal =3D i2c_get8(i2cdev, REG_TEMP_HIGH_DEC);<br>
+=C2=A0 =C2=A0 g_assert_cmpuint(regs_to_temp(integer, decimal), =3D=3D, LIM=
IT_HIGH);<br>
+=C2=A0 =C2=A0 /* No alert is generated. */<br>
+=C2=A0 =C2=A0 value =3D i2c_get8(i2cdev, REG_STATUS);<br>
+=C2=A0 =C2=A0 g_assert_cmphex(value, =3D=3D, 0);<br>
+<br>
+=C2=A0 =C2=A0 /* Test alert for low temperature */<br>
+=C2=A0 =C2=A0 qmp_sbtsi_set_temperature(TEST_ID, LIMIT_LOW);<br>
+=C2=A0 =C2=A0 value =3D i2c_get8(i2cdev, REG_STATUS);<br>
+=C2=A0 =C2=A0 g_assert_cmphex(value, =3D=3D, STATUS_LOW_ALERT);<br>
+<br>
+=C2=A0 =C2=A0 /* Test alert for high temperature */<br>
+=C2=A0 =C2=A0 qmp_sbtsi_set_temperature(TEST_ID, LIMIT_HIGH);<br>
+=C2=A0 =C2=A0 value =3D i2c_get8(i2cdev, REG_STATUS);<br>
+=C2=A0 =C2=A0 g_assert_cmphex(value, =3D=3D, STATUS_HIGH_ALERT);<br>
+<br>
+=C2=A0 =C2=A0 /* Disable alarm_en */<br>
+=C2=A0 =C2=A0 i2c_set8(i2cdev, REG_ALERT_CONFIG, 0);<br>
+=C2=A0 =C2=A0 value =3D i2c_get8(i2cdev, REG_ALERT_CONFIG);<br>
+=C2=A0 =C2=A0 g_assert_cmphex(value, =3D=3D, 0);<br>
+=C2=A0 =C2=A0 /* No alert when alarm_en is false. */<br>
+=C2=A0 =C2=A0 value =3D i2c_get8(i2cdev, REG_STATUS);<br>
+=C2=A0 =C2=A0 g_assert_cmphex(value, =3D=3D, 0);<br>
+}<br>
+<br>
+static void sbtsi_register_nodes(void)<br>
+{<br>
+=C2=A0 =C2=A0 QOSGraphEdgeOptions opts =3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .extra_device_opts =3D &quot;id=3D&quot; TEST_=
ID &quot;,address=3D0x4c&quot;<br>
+=C2=A0 =C2=A0 };<br>
+=C2=A0 =C2=A0 add_qi2c_address(&amp;opts, &amp;(QI2CAddress) { TEST_ADDR }=
);<br>
+<br>
+=C2=A0 =C2=A0 qos_node_create_driver(&quot;sbtsi&quot;, i2c_device_create)=
;<br>
+=C2=A0 =C2=A0 qos_node_consumes(&quot;sbtsi&quot;, &quot;i2c-bus&quot;, &a=
mp;opts);<br>
+<br>
+=C2=A0 =C2=A0 qos_add_test(&quot;tx-rx&quot;, &quot;sbtsi&quot;, tx_rx, NU=
LL);<br>
+}<br>
+libqos_init(sbtsi_register_nodes);<br>
-- </blockquote><div><br></div><div>+ Corey for i2c maintainer.=C2=A0 The n=
ew sensor directory is mostly if not entirely i2c devices.=C2=A0 I didn&#39=
;t create a maintainer entry for this i2c device, but I can if desired and =
send out a v2.<br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pa=
dding-left:1ex">
2.34.1.575.g55b058a8bb-goog<br>
<br>
</blockquote></div></div>

--0000000000003e682905d530f107--

