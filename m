Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3376C68CA83
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Feb 2023 00:26:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPAqt-0006Ub-DW; Mon, 06 Feb 2023 18:24:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wuhaotsh@google.com>)
 id 1pPAqr-0006UE-Id
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 18:24:45 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wuhaotsh@google.com>)
 id 1pPAqn-0004Uc-Oj
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 18:24:45 -0500
Received: by mail-wr1-x42c.google.com with SMTP id h16so11944646wrz.12
 for <qemu-devel@nongnu.org>; Mon, 06 Feb 2023 15:24:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Jycar1ys7NFcIFL7RY55B5xsdWchgTljs+5CkvUwMkI=;
 b=NQgrjhWxy6Xu0jA/YoqoPNs3SHy3tbrM5PKfAI9t+t6KFD3ABsWyXzjbNfNeskMNVA
 frE7hFGFhrgJ4gMpBYPDlguSZzabsCRkBgP/xdMMOjpNTWmj5dAufWlCH2MRmGLCsUol
 MTcZcfSeGAoIKXVuaXASdYlzn0dvlSBlTDwUokxZGnuOLVX9n7p3t9vfoNB3ZQYoijvW
 nFdEP3BfRaNwtUVtjGDYdki7t3KR4y2prIc7GKplm0mSeJtXsz2DAI91A6SKXYVW3ooz
 AYGsmPKOwF04cwH1rCh1xOSqxNxEbpfR1KoX8lihZ2NjqsO/Pj0KR8faEnIf0ea48Jj3
 Soqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Jycar1ys7NFcIFL7RY55B5xsdWchgTljs+5CkvUwMkI=;
 b=ZfeK0holLl8R/He28ShxmKlFGKrXfU4YTJOe61MaEKmgr7v511C2VPVvPuCRLA3SK+
 JDBKQSVd9pig1P3UXE+9LwPZX6FKNDR9XqCWRu+YN0PR0ounOC/lhVGg8Ro8ioOyU/N0
 WaLrdzBerh5lDIivEvW0GzdRiRVKH7P9miNs9kVg5L94xuRaIet0wkVYCEnH83M2dS6c
 dwlIEtV7BlT7NTbbRDalMGXDp8N1OPbJfnp+R1r2ehR/7lws8vQj7MDfFEwwR+kryEUa
 Oag3f3FC2iLLLV7W6sDVLeCg6TGb+vDgfIC5Zx/j63NhLbcr0GrDkXjQk31ospT5XaZJ
 Gwwg==
X-Gm-Message-State: AO0yUKXDheQycHn1SOrXBYWuxhZ07OkemodjpQop4QsDyOL3zc5x0Ox1
 pFalFhicKdrXPaZkrtEczYoUChtpAVDYKOaQ4YYFyg==
X-Google-Smtp-Source: AK7set+9C8UWVt6cMQYJwIHwrVnZdxLpIiT/pjKiY1QusgoFaAABEyym7cU5dUVeUVPCQCcLu+O5bHUbgjj4T7K+vXE=
X-Received: by 2002:a05:6000:50e:b0:2c3:e35a:19cd with SMTP id
 a14-20020a056000050e00b002c3e35a19cdmr13993wrf.364.1675725878153; Mon, 06 Feb
 2023 15:24:38 -0800 (PST)
MIME-Version: 1.0
References: <20220131222948.496588-1-venture@google.com>
 <20220131222948.496588-2-venture@google.com>
In-Reply-To: <20220131222948.496588-2-venture@google.com>
From: Hao Wu <wuhaotsh@google.com>
Date: Mon, 6 Feb 2023 15:24:26 -0800
Message-ID: <CAGcCb113A8y0zgXKvLjZEZJeMu-kDpJp0f5tUPyH--WfH36sLQ@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] hw/sensor: Add SB-TSI Temperature Sensor Interface
To: Patrick Venture <venture@google.com>
Cc: cminyard@mvista.com, thuth@redhat.com, lvivier@redhat.com, 
 pbonzini@redhat.com, f4bug@amsat.org, qemu-devel@nongnu.org, 
 Doug Evans <dje@google.com>
Content-Type: multipart/alternative; boundary="000000000000b616cb05f41055cc"
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=wuhaotsh@google.com; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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

--000000000000b616cb05f41055cc
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

It seems like this patch set is reviewed but never merged. Who should take
this patch set? What are our next steps for them?

Thanks!

On Mon, Jan 31, 2022 at 2:29 PM Patrick Venture <venture@google.com> wrote:

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
> Signed-off-by: Patrick Venture <venture@google.com>
> Reviewed-by: Doug Evans <dje@google.com>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> Acked-by: Corey Minyard <cminyard@mvista.com>
> ---
>  meson.build               |   1 +
>  hw/sensor/trace.h         |   1 +
>  include/hw/sensor/sbtsi.h |  45 +++++
>  hw/sensor/tmp_sbtsi.c     | 369 ++++++++++++++++++++++++++++++++++++++
>  hw/sensor/Kconfig         |   4 +
>  hw/sensor/meson.build     |   1 +
>  hw/sensor/trace-events    |   5 +
>  7 files changed, 426 insertions(+)
>  create mode 100644 hw/sensor/trace.h
>  create mode 100644 include/hw/sensor/sbtsi.h
>  create mode 100644 hw/sensor/tmp_sbtsi.c
>  create mode 100644 hw/sensor/trace-events
>
> diff --git a/meson.build b/meson.build
> index c1b1db1e28..3634214546 100644
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
> diff --git a/hw/sensor/trace.h b/hw/sensor/trace.h
> new file mode 100644
> index 0000000000..e4721560b0
> --- /dev/null
> +++ b/hw/sensor/trace.h
> @@ -0,0 +1 @@
> +#include "trace/trace-hw_sensor.h"
> diff --git a/include/hw/sensor/sbtsi.h b/include/hw/sensor/sbtsi.h
> new file mode 100644
> index 0000000000..9073f76ebb
> --- /dev/null
> +++ b/include/hw/sensor/sbtsi.h
> @@ -0,0 +1,45 @@
> +/*
> + * AMD SBI Temperature Sensor Interface (SB-TSI)
> + *
> + * Copyright 2021 Google LLC
> + *
> + * This program is free software; you can redistribute it and/or modify =
it
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
> +#ifndef QEMU_TMP_SBTSI_H
> +#define QEMU_TMP_SBTSI_H
> +
> +/*
> + * SB-TSI registers only support SMBus byte data access. "_INT" register=
s
> are
> + * the integer part of a temperature value or limit, and "_DEC" register=
s
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
> +/* The temperature we stored are in units of 0.125 degrees. */
> +#define SBTSI_TEMP_UNIT_IN_MILLIDEGREE 125
> +
> +#endif
> diff --git a/hw/sensor/tmp_sbtsi.c b/hw/sensor/tmp_sbtsi.c
> new file mode 100644
> index 0000000000..d5406844ef
> --- /dev/null
> +++ b/hw/sensor/tmp_sbtsi.c
> @@ -0,0 +1,369 @@
> +/*
> + * AMD SBI Temperature Sensor Interface (SB-TSI)
> + *
> + * Copyright 2021 Google LLC
> + *
> + * This program is free software; you can redistribute it and/or modify =
it
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
> +#include "hw/sensor/sbtsi.h"
> +#include "hw/irq.h"
> +#include "migration/vmstate.h"
> +#include "qapi/error.h"
> +#include "qapi/visitor.h"
> +#include "qemu/log.h"
> +#include "qemu/module.h"
> +#include "qom/object.h"
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
> +#define SBTSI_LIMIT_LOW_DEFAULT (0)
> +#define SBTSI_LIMIT_HIGH_DEFAULT (560)
> +#define SBTSI_MAN_DEFAULT (0)
> +#define SBTSI_REV_DEFAULT (4)
> +#define SBTSI_ALARM_L "alarm_l"
> +
> +/*
> + * The integer part and decimal of the temperature both 8 bits.
> + * Only the top 3 bits of the decimal parts are used.
> + * So the max temperature is (2^8-1) + (2^3-1)/8 =3D 255.875 degrees.
> + */
> +#define SBTSI_TEMP_MAX_IN_MILLIDEGREE 255875
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
> +    s->status =3D 0;
> +    if (s->alert_config & SBTSI_ALARM_EN) {
> +        if (s->temperature >=3D s->limit_high) {
> +            s->status |=3D SBTSI_STATUS_HIGH_ALERT;
> +        }
> +        if (s->temperature <=3D s->limit_low) {
> +            s->status |=3D SBTSI_STATUS_LOW_ALERT;
> +        }
> +    }
> +}
> +
> +static void sbtsi_update_alarm(SBTSIState *s)
> +{
> +    sbtsi_update_status(s);
> +    if (s->status !=3D 0 && !(s->config & SBTSI_CONFIG_ALERT_MASK)) {
> +        qemu_irq_raise(s->alarm);
> +    } else {
> +        qemu_irq_lower(s->alarm);
> +    }
> +}
> +
> +static uint8_t sbtsi_read_byte(SMBusDevice *d)
> +{
> +    SBTSIState *s =3D SBTSI(d);
> +    uint8_t data =3D 0;
> +
> +    switch (s->addr) {
> +    case SBTSI_REG_TEMP_INT:
> +        data =3D get_temp_int(s->temperature);
> +        break;
> +
> +    case SBTSI_REG_TEMP_DEC:
> +        data =3D get_temp_dec(s->temperature);
> +        break;
> +
> +    case SBTSI_REG_TEMP_HIGH_INT:
> +        data =3D get_temp_int(s->limit_high);
> +        break;
> +
> +    case SBTSI_REG_TEMP_LOW_INT:
> +        data =3D get_temp_int(s->limit_low);
> +        break;
> +
> +    case SBTSI_REG_TEMP_HIGH_DEC:
> +        data =3D get_temp_dec(s->limit_high);
> +        break;
> +
> +    case SBTSI_REG_TEMP_LOW_DEC:
> +        data =3D get_temp_dec(s->limit_low);
> +        break;
> +
> +    case SBTSI_REG_CONFIG:
> +    case SBTSI_REG_CONFIG_WR:
> +        data =3D s->config;
> +        break;
> +
> +    case SBTSI_REG_STATUS:
> +        sbtsi_update_alarm(s);
> +        data =3D s->status;
> +        break;
> +
> +    case SBTSI_REG_ALERT_CONFIG:
> +        data =3D s->alert_config;
> +        break;
> +
> +    case SBTSI_REG_MAN:
> +        data =3D SBTSI_MAN_DEFAULT;
> +        break;
> +
> +    case SBTSI_REG_REV:
> +        data =3D SBTSI_REV_DEFAULT;
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
> +        s->config =3D data;
> +        break;
> +
> +    case SBTSI_REG_TEMP_HIGH_INT:
> +        s->limit_high =3D compute_temp_int(s->limit_high, data);
> +        break;
> +
> +    case SBTSI_REG_TEMP_LOW_INT:
> +        s->limit_low =3D compute_temp_int(s->limit_low, data);
> +        break;
> +
> +    case SBTSI_REG_TEMP_HIGH_DEC:
> +        s->limit_high =3D compute_temp_dec(s->limit_high, data);
> +        break;
> +
> +    case SBTSI_REG_TEMP_LOW_DEC:
> +        s->limit_low =3D compute_temp_dec(s->limit_low, data);
> +        break;
> +
> +    case SBTSI_REG_ALERT_CONFIG:
> +        s->alert_config =3D data;
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
> +    SBTSIState *s =3D SBTSI(d);
> +
> +    if (len =3D=3D 0) {
> +        qemu_log_mask(LOG_GUEST_ERROR, "%s: writing empty data\n",
> __func__);
> +        return -1;
> +    }
> +
> +    s->addr =3D buf[0];
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
> +    SBTSIState *s =3D SBTSI(obj);
> +    uint32_t temp =3D s->temperature * SBTSI_TEMP_UNIT_IN_MILLIDEGREE;
> +
> +    visit_type_uint32(v, name, &temp, errp);
> +}
> +
> +/* Units are millidegrees. */
> +static void sbtsi_set_temperature(Object *obj, Visitor *v, const char
> *name,
> +                                  void *opaque, Error **errp)
> +{
> +    SBTSIState *s =3D SBTSI(obj);
> +    uint32_t temp;
> +
> +    if (!visit_type_uint32(v, name, &temp, errp)) {
> +        return;
> +    }
> +    if (temp > SBTSI_TEMP_MAX_IN_MILLIDEGREE) {
> +        error_setg(errp, "value %" PRIu32 ".%03" PRIu32 " C is out of
> range",
> +                   temp / 1000, temp % 1000);
> +        return;
> +    }
> +
> +    s->temperature =3D temp / SBTSI_TEMP_UNIT_IN_MILLIDEGREE;
> +    sbtsi_update_alarm(s);
> +}
> +
> +static int sbtsi_post_load(void *opaque, int version_id)
> +{
> +    SBTSIState *s =3D opaque;
> +
> +    sbtsi_update_alarm(s);
> +    return 0;
> +}
> +
> +static const VMStateDescription vmstate_sbtsi =3D {
> +    .name =3D "SBTSI",
> +    .version_id =3D 0,
> +    .minimum_version_id =3D 0,
> +    .post_load =3D sbtsi_post_load,
> +    .fields =3D (VMStateField[]) {
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
> +    SBTSIState *s =3D SBTSI(obj);
> +
> +    s->config =3D 0;
> +    s->limit_low =3D SBTSI_LIMIT_LOW_DEFAULT;
> +    s->limit_high =3D SBTSI_LIMIT_HIGH_DEFAULT;
> +}
> +
> +static void sbtsi_hold_reset(Object *obj)
> +{
> +    SBTSIState *s =3D SBTSI(obj);
> +
> +    qemu_irq_lower(s->alarm);
> +}
> +
> +static void sbtsi_init(Object *obj)
> +{
> +    SBTSIState *s =3D SBTSI(obj);
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
> +    ResettableClass *rc =3D RESETTABLE_CLASS(klass);
> +    DeviceClass *dc =3D DEVICE_CLASS(klass);
> +    SMBusDeviceClass *k =3D SMBUS_DEVICE_CLASS(klass);
> +
> +    dc->desc =3D "SB-TSI Temperature Sensor";
> +    dc->vmsd =3D &vmstate_sbtsi;
> +    k->write_data =3D sbtsi_write_data;
> +    k->receive_byte =3D sbtsi_read_byte;
> +    rc->phases.enter =3D sbtsi_enter_reset;
> +    rc->phases.hold =3D sbtsi_hold_reset;
> +}
> +
> +static const TypeInfo sbtsi_info =3D {
> +    .name          =3D TYPE_SBTSI,
> +    .parent        =3D TYPE_SMBUS_DEVICE,
> +    .instance_size =3D sizeof(SBTSIState),
> +    .instance_init =3D sbtsi_init,
> +    .class_init    =3D sbtsi_class_init,
> +};
> +
> +static void sbtsi_register_types(void)
> +{
> +    type_register_static(&sbtsi_info);
> +}
> +
> +type_init(sbtsi_register_types)
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
> --
> 2.34.1.575.g55b058a8bb-goog
>
>

--000000000000b616cb05f41055cc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<div><br></div><div>It seems like this patch set is rev=
iewed but never merged. Who should take this patch set? What are our next s=
teps for them?<br></div><div><br></div><div>Thanks!</div></div><br><div cla=
ss=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Jan 31, 20=
22 at 2:29 PM Patrick Venture &lt;<a href=3D"mailto:venture@google.com">ven=
ture@google.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pad=
ding-left:1ex">From: Hao Wu &lt;<a href=3D"mailto:wuhaotsh@google.com" targ=
et=3D"_blank">wuhaotsh@google.com</a>&gt;<br>
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
Signed-off-by: Patrick Venture &lt;<a href=3D"mailto:venture@google.com" ta=
rget=3D"_blank">venture@google.com</a>&gt;<br>
Reviewed-by: Doug Evans &lt;<a href=3D"mailto:dje@google.com" target=3D"_bl=
ank">dje@google.com</a>&gt;<br>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:f4bug@amsat.=
org" target=3D"_blank">f4bug@amsat.org</a>&gt;<br>
Acked-by: Corey Minyard &lt;<a href=3D"mailto:cminyard@mvista.com" target=
=3D"_blank">cminyard@mvista.com</a>&gt;<br>
---<br>
=C2=A0meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 =C2=A01 +<br>
=C2=A0hw/sensor/trace.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A01 +<=
br>
=C2=A0include/hw/sensor/sbtsi.h |=C2=A0 45 +++++<br>
=C2=A0hw/sensor/tmp_sbtsi.c=C2=A0 =C2=A0 =C2=A0| 369 ++++++++++++++++++++++=
++++++++++++++++<br>
=C2=A0hw/sensor/Kconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A04 +<=
br>
=C2=A0hw/sensor/meson.build=C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A01 +<br>
=C2=A0hw/sensor/trace-events=C2=A0 =C2=A0 |=C2=A0 =C2=A05 +<br>
=C2=A07 files changed, 426 insertions(+)<br>
=C2=A0create mode 100644 hw/sensor/trace.h<br>
=C2=A0create mode 100644 include/hw/sensor/sbtsi.h<br>
=C2=A0create mode 100644 hw/sensor/tmp_sbtsi.c<br>
=C2=A0create mode 100644 hw/sensor/trace-events<br>
<br>
diff --git a/meson.build b/meson.build<br>
index c1b1db1e28..3634214546 100644<br>
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
diff --git a/hw/sensor/trace.h b/hw/sensor/trace.h<br>
new file mode 100644<br>
index 0000000000..e4721560b0<br>
--- /dev/null<br>
+++ b/hw/sensor/trace.h<br>
@@ -0,0 +1 @@<br>
+#include &quot;trace/trace-hw_sensor.h&quot;<br>
diff --git a/include/hw/sensor/sbtsi.h b/include/hw/sensor/sbtsi.h<br>
new file mode 100644<br>
index 0000000000..9073f76ebb<br>
--- /dev/null<br>
+++ b/include/hw/sensor/sbtsi.h<br>
@@ -0,0 +1,45 @@<br>
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
+#ifndef QEMU_TMP_SBTSI_H<br>
+#define QEMU_TMP_SBTSI_H<br>
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
+/* The temperature we stored are in units of 0.125 degrees. */<br>
+#define SBTSI_TEMP_UNIT_IN_MILLIDEGREE 125<br>
+<br>
+#endif<br>
diff --git a/hw/sensor/tmp_sbtsi.c b/hw/sensor/tmp_sbtsi.c<br>
new file mode 100644<br>
index 0000000000..d5406844ef<br>
--- /dev/null<br>
+++ b/hw/sensor/tmp_sbtsi.c<br>
@@ -0,0 +1,369 @@<br>
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
+#include &quot;hw/sensor/sbtsi.h&quot;<br>
+#include &quot;hw/irq.h&quot;<br>
+#include &quot;migration/vmstate.h&quot;<br>
+#include &quot;qapi/error.h&quot;<br>
+#include &quot;qapi/visitor.h&quot;<br>
+#include &quot;qemu/log.h&quot;<br>
+#include &quot;qemu/module.h&quot;<br>
+#include &quot;qom/object.h&quot;<br>
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
+#define SBTSI_LIMIT_LOW_DEFAULT (0)<br>
+#define SBTSI_LIMIT_HIGH_DEFAULT (560)<br>
+#define SBTSI_MAN_DEFAULT (0)<br>
+#define SBTSI_REV_DEFAULT (4)<br>
+#define SBTSI_ALARM_L &quot;alarm_l&quot;<br>
+<br>
+/*<br>
+ * The integer part and decimal of the temperature both 8 bits.<br>
+ * Only the top 3 bits of the decimal parts are used.<br>
+ * So the max temperature is (2^8-1) + (2^3-1)/8 =3D 255.875 degrees.<br>
+ */<br>
+#define SBTSI_TEMP_MAX_IN_MILLIDEGREE 255875<br>
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
+=C2=A0 =C2=A0 if (temp &gt; SBTSI_TEMP_MAX_IN_MILLIDEGREE) {<br>
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
-- <br>
2.34.1.575.g55b058a8bb-goog<br>
<br>
</blockquote></div>

--000000000000b616cb05f41055cc--

