Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EA3549D69A
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Jan 2022 01:13:32 +0100 (CET)
Received: from localhost ([::1]:41784 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCsPq-0003Km-Lf
	for lists+qemu-devel@lfdr.de; Wed, 26 Jan 2022 19:13:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43618)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wuhaotsh@google.com>)
 id 1nCsNI-0001t6-7K
 for qemu-devel@nongnu.org; Wed, 26 Jan 2022 19:10:52 -0500
Received: from [2a00:1450:4864:20::235] (port=45634
 helo=mail-lj1-x235.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wuhaotsh@google.com>)
 id 1nCsNC-00050T-Fm
 for qemu-devel@nongnu.org; Wed, 26 Jan 2022 19:10:51 -0500
Received: by mail-lj1-x235.google.com with SMTP id t9so1805960lji.12
 for <qemu-devel@nongnu.org>; Wed, 26 Jan 2022 16:09:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=v3PcpF/p3ojt2JPEUQMu0EbqB0FhqOMKcXmq68SQB9s=;
 b=FbzlYx12Jyort2PtTvwvmgcnL3nWZuCguoeNqWitUhyGNiCkL+4FQjkDLIUTlenfoN
 9vuRPlEpxEa0lNVW2aefJEktAmD3zUufCT3OQzO7gmSm8c+vUTDqLbcu/oI11gQVqGN4
 0Ei9tGKnHBNXBEHXxp9eC8zb9mk15U9+dG2TvoWhAjaHXepG4A6VTlDBt3HjXT8sgCPE
 HDzmJAfiJZGESD5OmcYYeigwPceswxUR8UwGgBVl9gKpOvPYr8/OfbXdKlJwDS3lGLqn
 cVINBKryS8wEpGzZ8J8g1KUuOkkF+BT1jyggdWnhNIydLbHB/ACG9Jkc+qnPxk0SrF+2
 JaYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=v3PcpF/p3ojt2JPEUQMu0EbqB0FhqOMKcXmq68SQB9s=;
 b=A8/Ysdk9DgT7o0cAYWbRCNbFn/76myyuLvV2jnyr6quZNTfK8rZi7OVfSbBxH44Qe8
 4W7x72UfcF3MS+uk7eb2FfioprB9ceioWhWrXvPpH1DuM8RVhocq3rDk5GvS9E7yNDm1
 sWKm1+rgBGpeOZyHabnNbdDRdTHOtFyRubcN0d5gcuxsUuY3iENSqZEGsKy8tpwVZ4JA
 JFPrssdkB+WseDJFS75BcxbrYDChNXbSVdMtoR69afutPHCicuEc1Kztga6NK4IVqZ7b
 JRwXYurtfUDJKVmgLW8Yh6AKXzj/j7AtjITtEAUgnqk00M3GTzCaxidKnEqidlsv1mrw
 kYOg==
X-Gm-Message-State: AOAM531ASftE3LgiRRbgE62xi6rFPPCJ7V5wo8GT7eduCrAsjggObHvW
 akOu0v6g2SWFNbYZ8ZMOjk/KHVBCsdyq5pfdDwDQvA==
X-Google-Smtp-Source: ABdhPJwiakqHupiIQjsKGZCKxvNFv6LZKMYahgCtFKRS+c79H3WMsont2kwjXUh9t890p/FKOLXV3c9oTEU2GkDL8XQ=
X-Received: by 2002:a2e:2c11:: with SMTP id s17mr1086997ljs.424.1643242155309; 
 Wed, 26 Jan 2022 16:09:15 -0800 (PST)
MIME-Version: 1.0
References: <20220108030451.3867815-1-venture@google.com>
 <CAO=notwq9OWgPEymrb6OR0LXkH784qZPxzaO0X8UvgT+_-TizQ@mail.gmail.com>
 <20220117140524.GC34953@minyard.net>
 <CAO=notxchfjca97JVVnocc0o6d5iQDPz494m=epZzH6Ot_h2ag@mail.gmail.com>
In-Reply-To: <CAO=notxchfjca97JVVnocc0o6d5iQDPz494m=epZzH6Ot_h2ag@mail.gmail.com>
From: Hao Wu <wuhaotsh@google.com>
Date: Wed, 26 Jan 2022 16:09:03 -0800
Message-ID: <CAGcCb12g-zqBq1f-kXO0PfX6CmESi86RYoAvbBVsJju89KwSoA@mail.gmail.com>
Subject: Re: [PATCH] hw/sensor: Add SB-TSI Temperature Sensor Interface
To: Patrick Venture <venture@google.com>
Cc: Corey Minyard <cminyard@mvista.com>, Thomas Huth <thuth@redhat.com>, 
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 QEMU Developers <qemu-devel@nongnu.org>, Doug Evans <dje@google.com>
Content-Type: multipart/alternative; boundary="000000000000f34b3c05d685202d"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::235
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::235;
 envelope-from=wuhaotsh@google.com; helo=mail-lj1-x235.google.com
X-Spam_score_int: -167
X-Spam_score: -16.8
X-Spam_bar: ----------------
X-Spam_report: (-16.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, HTML_MESSAGE=0.001, PDS_HP_HELO_NORDNS=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
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

--000000000000f34b3c05d685202d
Content-Type: text/plain; charset="UTF-8"

Hi,

Sorry for the late reply. I'm not sure what "auto-increment" means here.
The kernel driver at
https://lkml.org/lkml/2020/12/11/968
only has byte-size read/write operations, so I don't see a problem here.
The values are extracted
from the datasheet.

On Tue, Jan 18, 2022 at 9:10 AM Patrick Venture <venture@google.com> wrote:

>
>
> On Mon, Jan 17, 2022 at 6:05 AM Corey Minyard <cminyard@mvista.com> wrote:
>
>> On Sun, Jan 09, 2022 at 06:17:34PM -0800, Patrick Venture wrote:
>> > On Fri, Jan 7, 2022 at 7:04 PM Patrick Venture <venture@google.com>
>> wrote:
>> >
>> > > From: Hao Wu <wuhaotsh@google.com>
>> > >
>> > > SB Temperature Sensor Interface (SB-TSI) is an SMBus compatible
>> > > interface that reports AMD SoC's Ttcl (normalized temperature),
>> > > and resembles a typical 8-pin remote temperature sensor's I2C
>> interface
>> > > to BMC.
>> > >
>> > > This patch implements a basic AMD SB-TSI sensor that is
>> > > compatible with the open-source data sheet from AMD and Linux
>> > > kernel driver.
>> > >
>> > > Reference:
>> > > Linux kernel driver:
>> > > https://lkml.org/lkml/2020/12/11/968
>> > > Register Map:
>> > > https://developer.amd.com/wp-content/resources/56255_3_03.PDF
>> > > (Chapter 6)
>> > >
>> > > Signed-off-by: Hao Wu <wuhaotsh@google.com>
>> > > Reviewed-by: Doug Evans <dje@google.com>
>> > > ---
>> > >  hw/sensor/Kconfig            |   4 +
>> > >  hw/sensor/meson.build        |   1 +
>> > >  hw/sensor/tmp_sbtsi.c        | 393
>> +++++++++++++++++++++++++++++++++++
>> > >  hw/sensor/trace-events       |   5 +
>> > >  hw/sensor/trace.h            |   1 +
>> > >  meson.build                  |   1 +
>> > >  tests/qtest/meson.build      |   1 +
>> > >  tests/qtest/tmp_sbtsi-test.c | 180 ++++++++++++++++
>> > >  8 files changed, 586 insertions(+)
>> > >  create mode 100644 hw/sensor/tmp_sbtsi.c
>> > >  create mode 100644 hw/sensor/trace-events
>> > >  create mode 100644 hw/sensor/trace.h
>> > >  create mode 100644 tests/qtest/tmp_sbtsi-test.c
>> > >
>> > > diff --git a/hw/sensor/Kconfig b/hw/sensor/Kconfig
>> > > index 9c8a049b06..27f6f79c84 100644
>> > > --- a/hw/sensor/Kconfig
>> > > +++ b/hw/sensor/Kconfig
>> > > @@ -21,3 +21,7 @@ config ADM1272
>> > >  config MAX34451
>> > >      bool
>> > >      depends on I2C
>> > > +
>> > > +config AMDSBTSI
>> > > +    bool
>> > > +    depends on I2C
>> > > diff --git a/hw/sensor/meson.build b/hw/sensor/meson.build
>> > > index 059c4ca935..f7b0e645eb 100644
>> > > --- a/hw/sensor/meson.build
>> > > +++ b/hw/sensor/meson.build
>> > > @@ -4,3 +4,4 @@ softmmu_ss.add(when: 'CONFIG_DPS310', if_true:
>> > > files('dps310.c'))
>> > >  softmmu_ss.add(when: 'CONFIG_EMC141X', if_true: files('emc141x.c'))
>> > >  softmmu_ss.add(when: 'CONFIG_ADM1272', if_true: files('adm1272.c'))
>> > >  softmmu_ss.add(when: 'CONFIG_MAX34451', if_true: files('max34451.c'))
>> > > +softmmu_ss.add(when: 'CONFIG_AMDSBTSI', if_true:
>> files('tmp_sbtsi.c'))
>> > > diff --git a/hw/sensor/tmp_sbtsi.c b/hw/sensor/tmp_sbtsi.c
>> > > new file mode 100644
>> > > index 0000000000..b68c7ebf61
>> > > --- /dev/null
>> > > +++ b/hw/sensor/tmp_sbtsi.c
>> > > @@ -0,0 +1,393 @@
>> > > +/*
>> > > + * AMD SBI Temperature Sensor Interface (SB-TSI)
>> > > + *
>> > > + * Copyright 2021 Google LLC
>> > > + *
>> > > + * This program is free software; you can redistribute it and/or
>> modify it
>> > > + * under the terms of the GNU General Public License as published by
>> the
>> > > + * Free Software Foundation; either version 2 of the License, or
>> > > + * (at your option) any later version.
>> > > + *
>> > > + * This program is distributed in the hope that it will be useful,
>> but
>> > > WITHOUT
>> > > + * ANY WARRANTY; without even the implied warranty of
>> MERCHANTABILITY or
>> > > + * FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public
>> License
>> > > + * for more details.
>> > > + */
>> > > +
>> > > +#include "qemu/osdep.h"
>> > > +#include "hw/i2c/smbus_slave.h"
>> > > +#include "hw/irq.h"
>> > > +#include "migration/vmstate.h"
>> > > +#include "qapi/error.h"
>> > > +#include "qapi/visitor.h"
>> > > +#include "qemu/log.h"
>> > > +#include "qemu/module.h"
>> > > +#include "trace.h"
>> > > +
>> > > +#define TYPE_SBTSI "sbtsi"
>> > > +#define SBTSI(obj) OBJECT_CHECK(SBTSIState, (obj), TYPE_SBTSI)
>> > > +
>> > > +/**
>> > > + * SBTSIState:
>> > > + * temperatures are in units of 0.125 degrees
>> > > + * @temperature: Temperature
>> > > + * @limit_low: Lowest temperature
>> > > + * @limit_high: Highest temperature
>> > > + * @status: The status register
>> > > + * @config: The config register
>> > > + * @alert_config: The config for alarm_l output.
>> > > + * @addr: The address to read/write for the next cmd.
>> > > + * @alarm: The alarm_l output pin (GPIO)
>> > > + */
>> > > +typedef struct SBTSIState {
>> > > +    SMBusDevice parent;
>> > > +
>> > > +    uint32_t temperature;
>> > > +    uint32_t limit_low;
>> > > +    uint32_t limit_high;
>> > > +    uint8_t status;
>> > > +    uint8_t config;
>> > > +    uint8_t alert_config;
>> > > +    uint8_t addr;
>> > > +    qemu_irq alarm;
>> > > +} SBTSIState;
>> > > +
>> > > +/*
>> > > + * SB-TSI registers only support SMBus byte data access. "_INT"
>> registers
>> > > are
>> > > + * the integer part of a temperature value or limit, and "_DEC"
>> registers
>> > > are
>> > > + * corresponding decimal parts.
>> > > + */
>> > > +#define SBTSI_REG_TEMP_INT      0x01 /* RO */
>> > > +#define SBTSI_REG_STATUS        0x02 /* RO */
>> > > +#define SBTSI_REG_CONFIG        0x03 /* RO */
>> > > +#define SBTSI_REG_TEMP_HIGH_INT 0x07 /* RW */
>> > > +#define SBTSI_REG_TEMP_LOW_INT  0x08 /* RW */
>> > > +#define SBTSI_REG_CONFIG_WR     0x09 /* RW */
>> > > +#define SBTSI_REG_TEMP_DEC      0x10 /* RO */
>> > > +#define SBTSI_REG_TEMP_HIGH_DEC 0x13 /* RW */
>> > > +#define SBTSI_REG_TEMP_LOW_DEC  0x14 /* RW */
>> > > +#define SBTSI_REG_ALERT_CONFIG  0xBF /* RW */
>> > > +#define SBTSI_REG_MAN           0xFE /* RO */
>> > > +#define SBTSI_REG_REV           0xFF /* RO */
>> > > +
>> > > +#define SBTSI_STATUS_HIGH_ALERT BIT(4)
>> > > +#define SBTSI_STATUS_LOW_ALERT  BIT(3)
>> > > +#define SBTSI_CONFIG_ALERT_MASK BIT(7)
>> > > +#define SBTSI_ALARM_EN          BIT(0)
>> > > +
>> > > +#define SBTSI_LIMIT_LOW_DEFAULT (0)
>> > > +#define SBTSI_LIMIT_HIGH_DEFAULT (560)
>> > > +#define SBTSI_MAN_DEFAULT (0)
>> > > +#define SBTSI_REV_DEFAULT (4)
>> > > +#define SBTSI_ALARM_L "alarm_l"
>> > > +
>> > > +/* The temperature we stored are in units of 0.125 degrees. */
>> > > +#define SBTSI_TEMP_UNIT_IN_MILLIDEGREE 125
>> > > +
>> > > +/*
>> > > + * The integer part and decimal of the temperature both 8 bits.
>> > > + * Only the top 3 bits of the decimal parts are used.
>> > > + * So the max temperature is (2^8-1) + (2^3-1)/8 = 255.875 degrees.
>> > > + */
>> > > +#define SBTSI_TEMP_MAX 255875
>> > > +
>> > > +/* The integer part of the temperature in terms of 0.125 degrees. */
>> > > +static uint8_t get_temp_int(uint32_t temp)
>> > > +{
>> > > +    return temp >> 3;
>> > > +}
>> > > +
>> > > +/*
>> > > + * The decimal part of the temperature, in terms of 0.125 degrees.
>> > > + * H/W store it in the top 3 bits so we shift it by 5.
>> > > + */
>> > > +static uint8_t get_temp_dec(uint32_t temp)
>> > > +{
>> > > +    return (temp & 0x7) << 5;
>> > > +}
>> > > +
>> > > +/*
>> > > + * Compute the temperature using the integer and decimal part,
>> > > + * in terms of 0.125 degrees. The decimal part are only the top 3
>> bits
>> > > + * so we shift it by 5 here.
>> > > + */
>> > > +static uint32_t compute_temp(uint8_t integer, uint8_t decimal)
>> > > +{
>> > > +    return (integer << 3) + (decimal >> 5);
>> > > +}
>> > > +
>> > > +/* Compute new temp with new int part of the temperature. */
>> > > +static uint32_t compute_temp_int(uint32_t temp, uint8_t integer)
>> > > +{
>> > > +    return compute_temp(integer, get_temp_dec(temp));
>> > > +}
>> > > +
>> > > +/* Compute new temp with new dec part of the temperature. */
>> > > +static uint32_t compute_temp_dec(uint32_t temp, uint8_t decimal)
>> > > +{
>> > > +    return compute_temp(get_temp_int(temp), decimal);
>> > > +}
>> > > +
>> > > +/* The integer part of the temperature. */
>> > > +static void sbtsi_update_status(SBTSIState *s)
>> > > +{
>> > > +    s->status = 0;
>> > > +    if (s->alert_config & SBTSI_ALARM_EN) {
>> > > +        if (s->temperature >= s->limit_high) {
>> > > +            s->status |= SBTSI_STATUS_HIGH_ALERT;
>> > > +        }
>> > > +        if (s->temperature <= s->limit_low) {
>> > > +            s->status |= SBTSI_STATUS_LOW_ALERT;
>> > > +        }
>> > > +    }
>> > > +}
>> > > +
>> > > +static void sbtsi_update_alarm(SBTSIState *s)
>> > > +{
>> > > +    sbtsi_update_status(s);
>> > > +    if (s->status != 0 && !(s->config & SBTSI_CONFIG_ALERT_MASK)) {
>> > > +        qemu_irq_raise(s->alarm);
>> > > +    } else {
>> > > +        qemu_irq_lower(s->alarm);
>> > > +    }
>> > > +}
>> > > +
>> > > +static uint8_t sbtsi_read_byte(SMBusDevice *d)
>> > > +{
>> > > +    SBTSIState *s = SBTSI(d);
>> > > +    uint8_t data = 0;
>> > > +
>> > > +    switch (s->addr) {
>> > > +    case SBTSI_REG_TEMP_INT:
>> > > +        data = get_temp_int(s->temperature);
>> > > +        break;
>> > > +
>> > > +    case SBTSI_REG_TEMP_DEC:
>> > > +        data = get_temp_dec(s->temperature);
>> > > +        break;
>> > > +
>> > > +    case SBTSI_REG_TEMP_HIGH_INT:
>> > > +        data = get_temp_int(s->limit_high);
>> > > +        break;
>> > > +
>> > > +    case SBTSI_REG_TEMP_LOW_INT:
>> > > +        data = get_temp_int(s->limit_low);
>> > > +        break;
>> > > +
>> > > +    case SBTSI_REG_TEMP_HIGH_DEC:
>> > > +        data = get_temp_dec(s->limit_high);
>> > > +        break;
>> > > +
>> > > +    case SBTSI_REG_TEMP_LOW_DEC:
>> > > +        data = get_temp_dec(s->limit_low);
>> > > +        break;
>> > > +
>> > > +    case SBTSI_REG_CONFIG:
>> > > +    case SBTSI_REG_CONFIG_WR:
>> > > +        data = s->config;
>> > > +        break;
>> > > +
>> > > +    case SBTSI_REG_STATUS:
>> > > +        sbtsi_update_alarm(s);
>> > > +        data = s->status;
>> > > +        break;
>> > > +
>> > > +    case SBTSI_REG_ALERT_CONFIG:
>> > > +        data = s->alert_config;
>> > > +        break;
>> > > +
>> > > +    case SBTSI_REG_MAN:
>> > > +        data = SBTSI_MAN_DEFAULT;
>> > > +        break;
>> > > +
>> > > +    case SBTSI_REG_REV:
>> > > +        data = SBTSI_REV_DEFAULT;
>> > > +        break;
>>
>> Does this device do some sort of auto-increment on the address when
>> reading/writing?
>>
>
> +Hao Wu <wuhaotsh@google.com>   - Please take a look at the above
> question.  I imagine it's a while since you've thought about it, but please
> double check :)
> Thanks!
>
>
>> Other than that possible issue, I don't see anything else, it's pretty
>> straightforward.
>>
>> > > +
>> > > +    default:
>> > > +        qemu_log_mask(LOG_GUEST_ERROR,
>> > > +                "%s: reading from invalid reg: 0x%02x\n",
>> > > +                __func__, s->addr);
>> > > +        break;
>> > > +    }
>> > > +
>> > > +    trace_tmp_sbtsi_read_data(s->addr, data);
>> > > +    return data;
>> > > +}
>> > > +
>> > > +static void sbtsi_write(SBTSIState *s, uint8_t data)
>> > > +{
>> > > +    trace_tmp_sbtsi_write_data(s->addr, data);
>> > > +    switch (s->addr) {
>> > > +    case SBTSI_REG_CONFIG_WR:
>> > > +        s->config = data;
>> > > +        break;
>> > > +
>> > > +    case SBTSI_REG_TEMP_HIGH_INT:
>> > > +        s->limit_high = compute_temp_int(s->limit_high, data);
>> > > +        break;
>> > > +
>> > > +    case SBTSI_REG_TEMP_LOW_INT:
>> > > +        s->limit_low = compute_temp_int(s->limit_low, data);
>> > > +        break;
>> > > +
>> > > +    case SBTSI_REG_TEMP_HIGH_DEC:
>> > > +        s->limit_high = compute_temp_dec(s->limit_high, data);
>> > > +        break;
>> > > +
>> > > +    case SBTSI_REG_TEMP_LOW_DEC:
>> > > +        s->limit_low = compute_temp_dec(s->limit_low, data);
>> > > +        break;
>> > > +
>> > > +    case SBTSI_REG_ALERT_CONFIG:
>> > > +        s->alert_config = data;
>> > > +        break;
>> > > +
>> > > +    case SBTSI_REG_TEMP_INT:
>> > > +    case SBTSI_REG_TEMP_DEC:
>> > > +    case SBTSI_REG_CONFIG:
>> > > +    case SBTSI_REG_STATUS:
>> > > +    case SBTSI_REG_MAN:
>> > > +    case SBTSI_REG_REV:
>> > > +        qemu_log_mask(LOG_GUEST_ERROR,
>> > > +                "%s: writing to read only reg: 0x%02x data:
>> 0x%02x\n",
>> > > +                __func__, s->addr, data);
>> > > +        break;
>> > > +
>> > > +    default:
>> > > +        qemu_log_mask(LOG_GUEST_ERROR,
>> > > +                "%s: writing to invalid reg: 0x%02x data: 0x%02x\n",
>> > > +                __func__, s->addr, data);
>> > > +        break;
>> > > +    }
>> > > +    sbtsi_update_alarm(s);
>> > > +}
>> > > +
>> > > +static int sbtsi_write_data(SMBusDevice *d, uint8_t *buf, uint8_t
>> len)
>> > > +{
>> > > +    SBTSIState *s = SBTSI(d);
>> > > +
>> > > +    if (len == 0) {
>> > > +        qemu_log_mask(LOG_GUEST_ERROR, "%s: writing empty data\n",
>> > > __func__);
>> > > +        return -1;
>> > > +    }
>> > > +
>> > > +    s->addr = buf[0];
>> > > +    if (len > 1) {
>> > > +        sbtsi_write(s, buf[1]);
>> > > +        if (len > 2) {
>> > > +            qemu_log_mask(LOG_GUEST_ERROR, "%s: extra data at end\n",
>> > > __func__);
>> > > +        }
>> > > +    }
>> > > +    return 0;
>> > > +}
>> > > +
>> > > +/* Units are millidegrees. */
>> > > +static void sbtsi_get_temperature(Object *obj, Visitor *v, const char
>> > > *name,
>> > > +                                  void *opaque, Error **errp)
>> > > +{
>> > > +    SBTSIState *s = SBTSI(obj);
>> > > +    uint32_t temp = s->temperature * SBTSI_TEMP_UNIT_IN_MILLIDEGREE;
>> > > +
>> > > +    visit_type_uint32(v, name, &temp, errp);
>> > > +}
>> > > +
>> > > +/* Units are millidegrees. */
>> > > +static void sbtsi_set_temperature(Object *obj, Visitor *v, const char
>> > > *name,
>> > > +                                  void *opaque, Error **errp)
>> > > +{
>> > > +    SBTSIState *s = SBTSI(obj);
>> > > +    uint32_t temp;
>> > > +
>> > > +    if (!visit_type_uint32(v, name, &temp, errp)) {
>> > > +        return;
>> > > +    }
>> > > +    if (temp > SBTSI_TEMP_MAX) {
>> > > +        error_setg(errp, "value %" PRIu32 ".%03" PRIu32 " C is out of
>> > > range",
>> > > +                   temp / 1000, temp % 1000);
>> > > +        return;
>> > > +    }
>> > > +
>> > > +    s->temperature = temp / SBTSI_TEMP_UNIT_IN_MILLIDEGREE;
>> > > +    sbtsi_update_alarm(s);
>> > > +}
>> > > +
>> > > +static int sbtsi_post_load(void *opaque, int version_id)
>> > > +{
>> > > +    SBTSIState *s = opaque;
>> > > +
>> > > +    sbtsi_update_alarm(s);
>> > > +    return 0;
>> > > +}
>> > > +
>> > > +static const VMStateDescription vmstate_sbtsi = {
>> > > +    .name = "SBTSI",
>> > > +    .version_id = 0,
>> > > +    .minimum_version_id = 0,
>> > > +    .post_load = sbtsi_post_load,
>> > > +    .fields = (VMStateField[]) {
>> > > +        VMSTATE_UINT32(temperature, SBTSIState),
>> > > +        VMSTATE_UINT32(limit_low, SBTSIState),
>> > > +        VMSTATE_UINT32(limit_high, SBTSIState),
>> > > +        VMSTATE_UINT8(config, SBTSIState),
>> > > +        VMSTATE_UINT8(status, SBTSIState),
>> > > +        VMSTATE_UINT8(addr, SBTSIState),
>> > > +        VMSTATE_END_OF_LIST()
>> > > +    }
>> > > +};
>> > > +
>> > > +static void sbtsi_enter_reset(Object *obj, ResetType type)
>> > > +{
>> > > +    SBTSIState *s = SBTSI(obj);
>> > > +
>> > > +    s->config = 0;
>> > > +    s->limit_low = SBTSI_LIMIT_LOW_DEFAULT;
>> > > +    s->limit_high = SBTSI_LIMIT_HIGH_DEFAULT;
>> > > +}
>> > > +
>> > > +static void sbtsi_hold_reset(Object *obj)
>> > > +{
>> > > +    SBTSIState *s = SBTSI(obj);
>> > > +
>> > > +    qemu_irq_lower(s->alarm);
>> > > +}
>> > > +
>> > > +static void sbtsi_init(Object *obj)
>> > > +{
>> > > +    SBTSIState *s = SBTSI(obj);
>> > > +
>> > > +    /* Current temperature in millidegrees. */
>> > > +    object_property_add(obj, "temperature", "uint32",
>> > > +                        sbtsi_get_temperature, sbtsi_set_temperature,
>> > > +                        NULL, NULL);
>> > > +    qdev_init_gpio_out_named(DEVICE(obj), &s->alarm, SBTSI_ALARM_L,
>> 0);
>> > > +}
>> > > +
>> > > +static void sbtsi_class_init(ObjectClass *klass, void *data)
>> > > +{
>> > > +    ResettableClass *rc = RESETTABLE_CLASS(klass);
>> > > +    DeviceClass *dc = DEVICE_CLASS(klass);
>> > > +    SMBusDeviceClass *k = SMBUS_DEVICE_CLASS(klass);
>> > > +
>> > > +    dc->desc = "SB-TSI Temperature Sensor";
>> > > +    dc->vmsd = &vmstate_sbtsi;
>> > > +    k->write_data = sbtsi_write_data;
>> > > +    k->receive_byte = sbtsi_read_byte;
>> > > +    rc->phases.enter = sbtsi_enter_reset;
>> > > +    rc->phases.hold = sbtsi_hold_reset;
>> > > +}
>> > > +
>> > > +static const TypeInfo sbtsi_info = {
>> > > +    .name          = TYPE_SBTSI,
>> > > +    .parent        = TYPE_SMBUS_DEVICE,
>> > > +    .instance_size = sizeof(SBTSIState),
>> > > +    .instance_init = sbtsi_init,
>> > > +    .class_init    = sbtsi_class_init,
>> > > +};
>> > > +
>> > > +static void sbtsi_register_types(void)
>> > > +{
>> > > +    type_register_static(&sbtsi_info);
>> > > +}
>> > > +
>> > > +type_init(sbtsi_register_types)
>> > > diff --git a/hw/sensor/trace-events b/hw/sensor/trace-events
>> > > new file mode 100644
>> > > index 0000000000..21ab3809e2
>> > > --- /dev/null
>> > > +++ b/hw/sensor/trace-events
>> > > @@ -0,0 +1,5 @@
>> > > +# See docs/devel/tracing.rst for syntax documentation.
>> > > +
>> > > +# tmp_sbtsi.c
>> > > +tmp_sbtsi_write_data(uint8_t addr, uint8_t value) "SBTSI write
>> > > addr:0x%02x data: 0x%02x"
>> > > +tmp_sbtsi_read_data(uint8_t addr, uint8_t value) "SBTSI read
>> addr:0x%02x
>> > > data: 0x%02x"
>> > > diff --git a/hw/sensor/trace.h b/hw/sensor/trace.h
>> > > new file mode 100644
>> > > index 0000000000..e4721560b0
>> > > --- /dev/null
>> > > +++ b/hw/sensor/trace.h
>> > > @@ -0,0 +1 @@
>> > > +#include "trace/trace-hw_sensor.h"
>> > > diff --git a/meson.build b/meson.build
>> > > index 53065e96ec..f8ab0bf74e 100644
>> > > --- a/meson.build
>> > > +++ b/meson.build
>> > > @@ -2494,6 +2494,7 @@ if have_system
>> > >      'hw/rtc',
>> > >      'hw/s390x',
>> > >      'hw/scsi',
>> > > +    'hw/sensor',
>> > >      'hw/sd',
>> > >      'hw/sh4',
>> > >      'hw/sparc',
>> > > diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
>> > > index 37e1eaa449..d1a8c38f74 100644
>> > > --- a/tests/qtest/meson.build
>> > > +++ b/tests/qtest/meson.build
>> > > @@ -254,6 +254,7 @@ qos_test_ss.add(
>> > >    'spapr-phb-test.c',
>> > >    'tmp105-test.c',
>> > >    'emc141x-test.c',
>> > > +  'tmp_sbtsi-test.c',
>> > >    'usb-hcd-ohci-test.c',
>> > >    'virtio-test.c',
>> > >    'virtio-blk-test.c',
>> > > diff --git a/tests/qtest/tmp_sbtsi-test.c
>> b/tests/qtest/tmp_sbtsi-test.c
>> > > new file mode 100644
>> > > index 0000000000..7f5fafacc7
>> > > --- /dev/null
>> > > +++ b/tests/qtest/tmp_sbtsi-test.c
>> > > @@ -0,0 +1,180 @@
>> > > +/*
>> > > + * QTests for the SBTSI temperature sensor
>> > > + *
>> > > + * Copyright 2020 Google LLC
>> > > + *
>> > > + * This program is free software; you can redistribute it and/or
>> modify it
>> > > + * under the terms of the GNU General Public License as published by
>> the
>> > > + * Free Software Foundation; either version 2 of the License, or
>> > > + * (at your option) any later version.
>> > > + *
>> > > + * This program is distributed in the hope that it will be useful,
>> but
>> > > WITHOUT
>> > > + * ANY WARRANTY; without even the implied warranty of
>> MERCHANTABILITY or
>> > > + * FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public
>> License
>> > > + * for more details.
>> > > + */
>> > > +
>> > > +#include "qemu/osdep.h"
>> > > +
>> > > +#include "libqtest-single.h"
>> > > +#include "libqos/qgraph.h"
>> > > +#include "libqos/i2c.h"
>> > > +#include "qapi/qmp/qdict.h"
>> > > +#include "qemu/bitops.h"
>> > > +
>> > > +#define TEST_ID   "sbtsi-test"
>> > > +#define TEST_ADDR (0x4c)
>> > > +
>> > > +/*
>> > > + * SB-TSI registers only support SMBus byte data access. "_INT"
>> registers
>> > > are
>> > > + * the integer part of a temperature value or limit, and "_DEC"
>> registers
>> > > are
>> > > + * corresponding decimal parts.
>> > > + */
>> > > +#define REG_TEMP_INT      0x01 /* RO */
>> > > +#define REG_STATUS        0x02 /* RO */
>> > > +#define REG_CONFIG        0x03 /* RO */
>> > > +#define REG_TEMP_HIGH_INT 0x07 /* RW */
>> > > +#define REG_TEMP_LOW_INT  0x08 /* RW */
>> > > +#define REG_CONFIG_WR     0x09 /* RW */
>> > > +#define REG_TEMP_DEC      0x10 /* RO */
>> > > +#define REG_TEMP_HIGH_DEC 0x13 /* RW */
>> > > +#define REG_TEMP_LOW_DEC  0x14 /* RW */
>> > > +#define REG_ALERT_CONFIG  0xBF /* RW */
>> > > +
>> > > +#define STATUS_HIGH_ALERT BIT(4)
>> > > +#define STATUS_LOW_ALERT  BIT(3)
>> > > +#define CONFIG_ALERT_MASK BIT(7)
>> > > +#define ALARM_EN          BIT(0)
>> > > +
>> > > +/* The temperature stored are in units of 0.125 degrees. */
>> > > +#define TEMP_UNIT_IN_MILLIDEGREE 125
>> > > +#define LIMIT_LOW (10500)
>> > > +#define LIMIT_HIGH (55125)
>> > > +
>> > > +static uint32_t qmp_sbtsi_get_temperature(const char *id)
>> > > +{
>> > > +    QDict *response;
>> > > +    int ret;
>> > > +
>> > > +    response = qmp("{ 'execute': 'qom-get', 'arguments': { 'path':
>> %s, "
>> > > +                   "'property': 'temperature' } }", id);
>> > > +    g_assert(qdict_haskey(response, "return"));
>> > > +    ret = (uint32_t)qdict_get_int(response, "return");
>> > > +    qobject_unref(response);
>> > > +    return ret;
>> > > +}
>> > > +
>> > > +static void qmp_sbtsi_set_temperature(const char *id, uint32_t value)
>> > > +{
>> > > +    QDict *response;
>> > > +
>> > > +    response = qmp("{ 'execute': 'qom-set', 'arguments': { 'path':
>> %s, "
>> > > +                   "'property': 'temperature', 'value': %d } }", id,
>> > > value);
>> > > +    g_assert(qdict_haskey(response, "return"));
>> > > +    qobject_unref(response);
>> > > +}
>> > > +
>> > > +/*
>> > > + * Compute the temperature using the integer and decimal part and
>> return
>> > > + * millidegrees. The decimal part are only the top 3 bits so we
>> shift it
>> > > by
>> > > + * 5 here.
>> > > + */
>> > > +static uint32_t regs_to_temp(uint8_t integer, uint8_t decimal)
>> > > +{
>> > > +    return ((integer << 3) + (decimal >> 5)) *
>> TEMP_UNIT_IN_MILLIDEGREE;
>> > > +}
>> > > +
>> > > +/*
>> > > + * Compute the integer and decimal parts of the temperature in
>> > > millidegrees.
>> > > + * H/W store the decimal in the top 3 bits so we shift it by 5.
>> > > + */
>> > > +static void temp_to_regs(uint32_t temp, uint8_t *integer, uint8_t
>> > > *decimal)
>> > > +{
>> > > +    temp /= TEMP_UNIT_IN_MILLIDEGREE;
>> > > +    *integer = temp >> 3;
>> > > +    *decimal = (temp & 0x7) << 5;
>> > > +}
>> > > +
>> > > +static void tx_rx(void *obj, void *data, QGuestAllocator *alloc)
>> > > +{
>> > > +    uint16_t value;
>> > > +    uint8_t integer, decimal;
>> > > +    QI2CDevice *i2cdev = (QI2CDevice *)obj;
>> > > +
>> > > +    /* Test default values */
>> > > +    value = qmp_sbtsi_get_temperature(TEST_ID);
>> > > +    g_assert_cmpuint(value, ==, 0);
>> > > +
>> > > +    integer = i2c_get8(i2cdev, REG_TEMP_INT);
>> > > +    decimal = i2c_get8(i2cdev, REG_TEMP_DEC);
>> > > +    g_assert_cmpuint(regs_to_temp(integer, decimal), ==, 0);
>> > > +
>> > > +    /* Test setting temperature */
>> > > +    qmp_sbtsi_set_temperature(TEST_ID, 20000);
>> > > +    value = qmp_sbtsi_get_temperature(TEST_ID);
>> > > +    g_assert_cmpuint(value, ==, 20000);
>> > > +
>> > > +    integer = i2c_get8(i2cdev, REG_TEMP_INT);
>> > > +    decimal = i2c_get8(i2cdev, REG_TEMP_DEC);
>> > > +    g_assert_cmpuint(regs_to_temp(integer, decimal), ==, 20000);
>> > > +
>> > > +    /* Set alert mask in config */
>> > > +    i2c_set8(i2cdev, REG_CONFIG_WR, CONFIG_ALERT_MASK);
>> > > +    value = i2c_get8(i2cdev, REG_CONFIG);
>> > > +    g_assert_cmphex(value, ==, CONFIG_ALERT_MASK);
>> > > +    /* Enable alarm_en */
>> > > +    i2c_set8(i2cdev, REG_ALERT_CONFIG, ALARM_EN);
>> > > +    value = i2c_get8(i2cdev, REG_ALERT_CONFIG);
>> > > +    g_assert_cmphex(value, ==, ALARM_EN);
>> > > +
>> > > +    /* Test setting limits */
>> > > +    /* Limit low = 10.500 */
>> > > +    temp_to_regs(LIMIT_LOW, &integer, &decimal);
>> > > +    i2c_set8(i2cdev, REG_TEMP_LOW_INT, integer);
>> > > +    i2c_set8(i2cdev, REG_TEMP_LOW_DEC, decimal);
>> > > +    integer = i2c_get8(i2cdev, REG_TEMP_LOW_INT);
>> > > +    decimal = i2c_get8(i2cdev, REG_TEMP_LOW_DEC);
>> > > +    g_assert_cmpuint(regs_to_temp(integer, decimal), ==, LIMIT_LOW);
>> > > +    /* Limit high = 55.125 */
>> > > +    temp_to_regs(LIMIT_HIGH, &integer, &decimal);
>> > > +    i2c_set8(i2cdev, REG_TEMP_HIGH_INT, integer);
>> > > +    i2c_set8(i2cdev, REG_TEMP_HIGH_DEC, decimal);
>> > > +    integer = i2c_get8(i2cdev, REG_TEMP_HIGH_INT);
>> > > +    decimal = i2c_get8(i2cdev, REG_TEMP_HIGH_DEC);
>> > > +    g_assert_cmpuint(regs_to_temp(integer, decimal), ==, LIMIT_HIGH);
>> > > +    /* No alert is generated. */
>> > > +    value = i2c_get8(i2cdev, REG_STATUS);
>> > > +    g_assert_cmphex(value, ==, 0);
>> > > +
>> > > +    /* Test alert for low temperature */
>> > > +    qmp_sbtsi_set_temperature(TEST_ID, LIMIT_LOW);
>> > > +    value = i2c_get8(i2cdev, REG_STATUS);
>> > > +    g_assert_cmphex(value, ==, STATUS_LOW_ALERT);
>> > > +
>> > > +    /* Test alert for high temperature */
>> > > +    qmp_sbtsi_set_temperature(TEST_ID, LIMIT_HIGH);
>> > > +    value = i2c_get8(i2cdev, REG_STATUS);
>> > > +    g_assert_cmphex(value, ==, STATUS_HIGH_ALERT);
>> > > +
>> > > +    /* Disable alarm_en */
>> > > +    i2c_set8(i2cdev, REG_ALERT_CONFIG, 0);
>> > > +    value = i2c_get8(i2cdev, REG_ALERT_CONFIG);
>> > > +    g_assert_cmphex(value, ==, 0);
>> > > +    /* No alert when alarm_en is false. */
>> > > +    value = i2c_get8(i2cdev, REG_STATUS);
>> > > +    g_assert_cmphex(value, ==, 0);
>> > > +}
>> > > +
>> > > +static void sbtsi_register_nodes(void)
>> > > +{
>> > > +    QOSGraphEdgeOptions opts = {
>> > > +        .extra_device_opts = "id=" TEST_ID ",address=0x4c"
>> > > +    };
>> > > +    add_qi2c_address(&opts, &(QI2CAddress) { TEST_ADDR });
>> > > +
>> > > +    qos_node_create_driver("sbtsi", i2c_device_create);
>> > > +    qos_node_consumes("sbtsi", "i2c-bus", &opts);
>> > > +
>> > > +    qos_add_test("tx-rx", "sbtsi", tx_rx, NULL);
>> > > +}
>> > > +libqos_init(sbtsi_register_nodes);
>> > > --
>> >
>> >
>> > + Corey for i2c maintainer.  The new sensor directory is mostly if not
>> > entirely i2c devices.  I didn't create a maintainer entry for this i2c
>> > device, but I can if desired and send out a v2.
>>
>> Yeah, I guess I should be maintainer there.  I'll queue up a change for
>> that.  Thanks.
>>
>> -corey
>>
>> >
>> >
>> > > 2.34.1.575.g55b058a8bb-goog
>> > >
>> > >
>>
>

--000000000000f34b3c05d685202d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<div><br></div><div>Sorry=C2=A0for the late reply. I&#3=
9;m not sure what &quot;auto-increment&quot; means here. The kernel driver =
at</div><div><a href=3D"https://lkml.org/lkml/2020/12/11/968">https://lkml.=
org/lkml/2020/12/11/968</a><br></div><div>only has byte-size read/write ope=
rations, so I don&#39;t see a problem here. The values are extracted</div><=
div>from the datasheet.</div></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Tue, Jan 18, 2022 at 9:10 AM Patrick Ventu=
re &lt;<a href=3D"mailto:venture@google.com">venture@google.com</a>&gt; wro=
te:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"=
ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote"><div dir=3D"=
ltr" class=3D"gmail_attr">On Mon, Jan 17, 2022 at 6:05 AM Corey Minyard &lt=
;<a href=3D"mailto:cminyard@mvista.com" target=3D"_blank">cminyard@mvista.c=
om</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">On Sun, Jan 09, 2022 at 06:17:34PM -0800, Patrick Venture wrote:<br>
&gt; On Fri, Jan 7, 2022 at 7:04 PM Patrick Venture &lt;<a href=3D"mailto:v=
enture@google.com" target=3D"_blank">venture@google.com</a>&gt; wrote:<br>
&gt; <br>
&gt; &gt; From: Hao Wu &lt;<a href=3D"mailto:wuhaotsh@google.com" target=3D=
"_blank">wuhaotsh@google.com</a>&gt;<br>
&gt; &gt;<br>
&gt; &gt; SB Temperature Sensor Interface (SB-TSI) is an SMBus compatible<b=
r>
&gt; &gt; interface that reports AMD SoC&#39;s Ttcl (normalized temperature=
),<br>
&gt; &gt; and resembles a typical 8-pin remote temperature sensor&#39;s I2C=
 interface<br>
&gt; &gt; to BMC.<br>
&gt; &gt;<br>
&gt; &gt; This patch implements a basic AMD SB-TSI sensor that is<br>
&gt; &gt; compatible with the open-source data sheet from AMD and Linux<br>
&gt; &gt; kernel driver.<br>
&gt; &gt;<br>
&gt; &gt; Reference:<br>
&gt; &gt; Linux kernel driver:<br>
&gt; &gt; <a href=3D"https://lkml.org/lkml/2020/12/11/968" rel=3D"noreferre=
r" target=3D"_blank">https://lkml.org/lkml/2020/12/11/968</a><br>
&gt; &gt; Register Map:<br>
&gt; &gt; <a href=3D"https://developer.amd.com/wp-content/resources/56255_3=
_03.PDF" rel=3D"noreferrer" target=3D"_blank">https://developer.amd.com/wp-=
content/resources/56255_3_03.PDF</a><br>
&gt; &gt; (Chapter 6)<br>
&gt; &gt;<br>
&gt; &gt; Signed-off-by: Hao Wu &lt;<a href=3D"mailto:wuhaotsh@google.com" =
target=3D"_blank">wuhaotsh@google.com</a>&gt;<br>
&gt; &gt; Reviewed-by: Doug Evans &lt;<a href=3D"mailto:dje@google.com" tar=
get=3D"_blank">dje@google.com</a>&gt;<br>
&gt; &gt; ---<br>
&gt; &gt;=C2=A0 hw/sensor/Kconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
|=C2=A0 =C2=A04 +<br>
&gt; &gt;=C2=A0 hw/sensor/meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
=C2=A01 +<br>
&gt; &gt;=C2=A0 hw/sensor/tmp_sbtsi.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 393 ++++=
+++++++++++++++++++++++++++++++<br>
&gt; &gt;=C2=A0 hw/sensor/trace-events=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =
=C2=A05 +<br>
&gt; &gt;=C2=A0 hw/sensor/trace.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
|=C2=A0 =C2=A01 +<br>
&gt; &gt;=C2=A0 meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 |=C2=A0 =C2=A01 +<br>
&gt; &gt;=C2=A0 tests/qtest/meson.build=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A01=
 +<br>
&gt; &gt;=C2=A0 tests/qtest/tmp_sbtsi-test.c | 180 ++++++++++++++++<br>
&gt; &gt;=C2=A0 8 files changed, 586 insertions(+)<br>
&gt; &gt;=C2=A0 create mode 100644 hw/sensor/tmp_sbtsi.c<br>
&gt; &gt;=C2=A0 create mode 100644 hw/sensor/trace-events<br>
&gt; &gt;=C2=A0 create mode 100644 hw/sensor/trace.h<br>
&gt; &gt;=C2=A0 create mode 100644 tests/qtest/tmp_sbtsi-test.c<br>
&gt; &gt;<br>
&gt; &gt; diff --git a/hw/sensor/Kconfig b/hw/sensor/Kconfig<br>
&gt; &gt; index 9c8a049b06..27f6f79c84 100644<br>
&gt; &gt; --- a/hw/sensor/Kconfig<br>
&gt; &gt; +++ b/hw/sensor/Kconfig<br>
&gt; &gt; @@ -21,3 +21,7 @@ config ADM1272<br>
&gt; &gt;=C2=A0 config MAX34451<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 bool<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 depends on I2C<br>
&gt; &gt; +<br>
&gt; &gt; +config AMDSBTSI<br>
&gt; &gt; +=C2=A0 =C2=A0 bool<br>
&gt; &gt; +=C2=A0 =C2=A0 depends on I2C<br>
&gt; &gt; diff --git a/hw/sensor/meson.build b/hw/sensor/meson.build<br>
&gt; &gt; index 059c4ca935..f7b0e645eb 100644<br>
&gt; &gt; --- a/hw/sensor/meson.build<br>
&gt; &gt; +++ b/hw/sensor/meson.build<br>
&gt; &gt; @@ -4,3 +4,4 @@ softmmu_ss.add(when: &#39;CONFIG_DPS310&#39;, if_=
true:<br>
&gt; &gt; files(&#39;dps310.c&#39;))<br>
&gt; &gt;=C2=A0 softmmu_ss.add(when: &#39;CONFIG_EMC141X&#39;, if_true: fil=
es(&#39;emc141x.c&#39;))<br>
&gt; &gt;=C2=A0 softmmu_ss.add(when: &#39;CONFIG_ADM1272&#39;, if_true: fil=
es(&#39;adm1272.c&#39;))<br>
&gt; &gt;=C2=A0 softmmu_ss.add(when: &#39;CONFIG_MAX34451&#39;, if_true: fi=
les(&#39;max34451.c&#39;))<br>
&gt; &gt; +softmmu_ss.add(when: &#39;CONFIG_AMDSBTSI&#39;, if_true: files(&=
#39;tmp_sbtsi.c&#39;))<br>
&gt; &gt; diff --git a/hw/sensor/tmp_sbtsi.c b/hw/sensor/tmp_sbtsi.c<br>
&gt; &gt; new file mode 100644<br>
&gt; &gt; index 0000000000..b68c7ebf61<br>
&gt; &gt; --- /dev/null<br>
&gt; &gt; +++ b/hw/sensor/tmp_sbtsi.c<br>
&gt; &gt; @@ -0,0 +1,393 @@<br>
&gt; &gt; +/*<br>
&gt; &gt; + * AMD SBI Temperature Sensor Interface (SB-TSI)<br>
&gt; &gt; + *<br>
&gt; &gt; + * Copyright 2021 Google LLC<br>
&gt; &gt; + *<br>
&gt; &gt; + * This program is free software; you can redistribute it and/or=
 modify it<br>
&gt; &gt; + * under the terms of the GNU General Public License as publishe=
d by the<br>
&gt; &gt; + * Free Software Foundation; either version 2 of the License, or=
<br>
&gt; &gt; + * (at your option) any later version.<br>
&gt; &gt; + *<br>
&gt; &gt; + * This program is distributed in the hope that it will be usefu=
l, but<br>
&gt; &gt; WITHOUT<br>
&gt; &gt; + * ANY WARRANTY; without even the implied warranty of MERCHANTAB=
ILITY or<br>
&gt; &gt; + * FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public =
License<br>
&gt; &gt; + * for more details.<br>
&gt; &gt; + */<br>
&gt; &gt; +<br>
&gt; &gt; +#include &quot;qemu/osdep.h&quot;<br>
&gt; &gt; +#include &quot;hw/i2c/smbus_slave.h&quot;<br>
&gt; &gt; +#include &quot;hw/irq.h&quot;<br>
&gt; &gt; +#include &quot;migration/vmstate.h&quot;<br>
&gt; &gt; +#include &quot;qapi/error.h&quot;<br>
&gt; &gt; +#include &quot;qapi/visitor.h&quot;<br>
&gt; &gt; +#include &quot;qemu/log.h&quot;<br>
&gt; &gt; +#include &quot;qemu/module.h&quot;<br>
&gt; &gt; +#include &quot;trace.h&quot;<br>
&gt; &gt; +<br>
&gt; &gt; +#define TYPE_SBTSI &quot;sbtsi&quot;<br>
&gt; &gt; +#define SBTSI(obj) OBJECT_CHECK(SBTSIState, (obj), TYPE_SBTSI)<b=
r>
&gt; &gt; +<br>
&gt; &gt; +/**<br>
&gt; &gt; + * SBTSIState:<br>
&gt; &gt; + * temperatures are in units of 0.125 degrees<br>
&gt; &gt; + * @temperature: Temperature<br>
&gt; &gt; + * @limit_low: Lowest temperature<br>
&gt; &gt; + * @limit_high: Highest temperature<br>
&gt; &gt; + * @status: The status register<br>
&gt; &gt; + * @config: The config register<br>
&gt; &gt; + * @alert_config: The config for alarm_l output.<br>
&gt; &gt; + * @addr: The address to read/write for the next cmd.<br>
&gt; &gt; + * @alarm: The alarm_l output pin (GPIO)<br>
&gt; &gt; + */<br>
&gt; &gt; +typedef struct SBTSIState {<br>
&gt; &gt; +=C2=A0 =C2=A0 SMBusDevice parent;<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0 uint32_t temperature;<br>
&gt; &gt; +=C2=A0 =C2=A0 uint32_t limit_low;<br>
&gt; &gt; +=C2=A0 =C2=A0 uint32_t limit_high;<br>
&gt; &gt; +=C2=A0 =C2=A0 uint8_t status;<br>
&gt; &gt; +=C2=A0 =C2=A0 uint8_t config;<br>
&gt; &gt; +=C2=A0 =C2=A0 uint8_t alert_config;<br>
&gt; &gt; +=C2=A0 =C2=A0 uint8_t addr;<br>
&gt; &gt; +=C2=A0 =C2=A0 qemu_irq alarm;<br>
&gt; &gt; +} SBTSIState;<br>
&gt; &gt; +<br>
&gt; &gt; +/*<br>
&gt; &gt; + * SB-TSI registers only support SMBus byte data access. &quot;_=
INT&quot; registers<br>
&gt; &gt; are<br>
&gt; &gt; + * the integer part of a temperature value or limit, and &quot;_=
DEC&quot; registers<br>
&gt; &gt; are<br>
&gt; &gt; + * corresponding decimal parts.<br>
&gt; &gt; + */<br>
&gt; &gt; +#define SBTSI_REG_TEMP_INT=C2=A0 =C2=A0 =C2=A0 0x01 /* RO */<br>
&gt; &gt; +#define SBTSI_REG_STATUS=C2=A0 =C2=A0 =C2=A0 =C2=A0 0x02 /* RO *=
/<br>
&gt; &gt; +#define SBTSI_REG_CONFIG=C2=A0 =C2=A0 =C2=A0 =C2=A0 0x03 /* RO *=
/<br>
&gt; &gt; +#define SBTSI_REG_TEMP_HIGH_INT 0x07 /* RW */<br>
&gt; &gt; +#define SBTSI_REG_TEMP_LOW_INT=C2=A0 0x08 /* RW */<br>
&gt; &gt; +#define SBTSI_REG_CONFIG_WR=C2=A0 =C2=A0 =C2=A00x09 /* RW */<br>
&gt; &gt; +#define SBTSI_REG_TEMP_DEC=C2=A0 =C2=A0 =C2=A0 0x10 /* RO */<br>
&gt; &gt; +#define SBTSI_REG_TEMP_HIGH_DEC 0x13 /* RW */<br>
&gt; &gt; +#define SBTSI_REG_TEMP_LOW_DEC=C2=A0 0x14 /* RW */<br>
&gt; &gt; +#define SBTSI_REG_ALERT_CONFIG=C2=A0 0xBF /* RW */<br>
&gt; &gt; +#define SBTSI_REG_MAN=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x=
FE /* RO */<br>
&gt; &gt; +#define SBTSI_REG_REV=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x=
FF /* RO */<br>
&gt; &gt; +<br>
&gt; &gt; +#define SBTSI_STATUS_HIGH_ALERT BIT(4)<br>
&gt; &gt; +#define SBTSI_STATUS_LOW_ALERT=C2=A0 BIT(3)<br>
&gt; &gt; +#define SBTSI_CONFIG_ALERT_MASK BIT(7)<br>
&gt; &gt; +#define SBTSI_ALARM_EN=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 BIT(0)<=
br>
&gt; &gt; +<br>
&gt; &gt; +#define SBTSI_LIMIT_LOW_DEFAULT (0)<br>
&gt; &gt; +#define SBTSI_LIMIT_HIGH_DEFAULT (560)<br>
&gt; &gt; +#define SBTSI_MAN_DEFAULT (0)<br>
&gt; &gt; +#define SBTSI_REV_DEFAULT (4)<br>
&gt; &gt; +#define SBTSI_ALARM_L &quot;alarm_l&quot;<br>
&gt; &gt; +<br>
&gt; &gt; +/* The temperature we stored are in units of 0.125 degrees. */<b=
r>
&gt; &gt; +#define SBTSI_TEMP_UNIT_IN_MILLIDEGREE 125<br>
&gt; &gt; +<br>
&gt; &gt; +/*<br>
&gt; &gt; + * The integer part and decimal of the temperature both 8 bits.<=
br>
&gt; &gt; + * Only the top 3 bits of the decimal parts are used.<br>
&gt; &gt; + * So the max temperature is (2^8-1) + (2^3-1)/8 =3D 255.875 deg=
rees.<br>
&gt; &gt; + */<br>
&gt; &gt; +#define SBTSI_TEMP_MAX 255875<br>
&gt; &gt; +<br>
&gt; &gt; +/* The integer part of the temperature in terms of 0.125 degrees=
. */<br>
&gt; &gt; +static uint8_t get_temp_int(uint32_t temp)<br>
&gt; &gt; +{<br>
&gt; &gt; +=C2=A0 =C2=A0 return temp &gt;&gt; 3;<br>
&gt; &gt; +}<br>
&gt; &gt; +<br>
&gt; &gt; +/*<br>
&gt; &gt; + * The decimal part of the temperature, in terms of 0.125 degree=
s.<br>
&gt; &gt; + * H/W store it in the top 3 bits so we shift it by 5.<br>
&gt; &gt; + */<br>
&gt; &gt; +static uint8_t get_temp_dec(uint32_t temp)<br>
&gt; &gt; +{<br>
&gt; &gt; +=C2=A0 =C2=A0 return (temp &amp; 0x7) &lt;&lt; 5;<br>
&gt; &gt; +}<br>
&gt; &gt; +<br>
&gt; &gt; +/*<br>
&gt; &gt; + * Compute the temperature using the integer and decimal part,<b=
r>
&gt; &gt; + * in terms of 0.125 degrees. The decimal part are only the top =
3 bits<br>
&gt; &gt; + * so we shift it by 5 here.<br>
&gt; &gt; + */<br>
&gt; &gt; +static uint32_t compute_temp(uint8_t integer, uint8_t decimal)<b=
r>
&gt; &gt; +{<br>
&gt; &gt; +=C2=A0 =C2=A0 return (integer &lt;&lt; 3) + (decimal &gt;&gt; 5)=
;<br>
&gt; &gt; +}<br>
&gt; &gt; +<br>
&gt; &gt; +/* Compute new temp with new int part of the temperature. */<br>
&gt; &gt; +static uint32_t compute_temp_int(uint32_t temp, uint8_t integer)=
<br>
&gt; &gt; +{<br>
&gt; &gt; +=C2=A0 =C2=A0 return compute_temp(integer, get_temp_dec(temp));<=
br>
&gt; &gt; +}<br>
&gt; &gt; +<br>
&gt; &gt; +/* Compute new temp with new dec part of the temperature. */<br>
&gt; &gt; +static uint32_t compute_temp_dec(uint32_t temp, uint8_t decimal)=
<br>
&gt; &gt; +{<br>
&gt; &gt; +=C2=A0 =C2=A0 return compute_temp(get_temp_int(temp), decimal);<=
br>
&gt; &gt; +}<br>
&gt; &gt; +<br>
&gt; &gt; +/* The integer part of the temperature. */<br>
&gt; &gt; +static void sbtsi_update_status(SBTSIState *s)<br>
&gt; &gt; +{<br>
&gt; &gt; +=C2=A0 =C2=A0 s-&gt;status =3D 0;<br>
&gt; &gt; +=C2=A0 =C2=A0 if (s-&gt;alert_config &amp; SBTSI_ALARM_EN) {<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (s-&gt;temperature &gt;=3D s-&gt;=
limit_high) {<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;status |=3D SBTS=
I_STATUS_HIGH_ALERT;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (s-&gt;temperature &lt;=3D s-&gt;=
limit_low) {<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;status |=3D SBTS=
I_STATUS_LOW_ALERT;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; &gt; +=C2=A0 =C2=A0 }<br>
&gt; &gt; +}<br>
&gt; &gt; +<br>
&gt; &gt; +static void sbtsi_update_alarm(SBTSIState *s)<br>
&gt; &gt; +{<br>
&gt; &gt; +=C2=A0 =C2=A0 sbtsi_update_status(s);<br>
&gt; &gt; +=C2=A0 =C2=A0 if (s-&gt;status !=3D 0 &amp;&amp; !(s-&gt;config =
&amp; SBTSI_CONFIG_ALERT_MASK)) {<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_irq_raise(s-&gt;alarm);<br>
&gt; &gt; +=C2=A0 =C2=A0 } else {<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_irq_lower(s-&gt;alarm);<br>
&gt; &gt; +=C2=A0 =C2=A0 }<br>
&gt; &gt; +}<br>
&gt; &gt; +<br>
&gt; &gt; +static uint8_t sbtsi_read_byte(SMBusDevice *d)<br>
&gt; &gt; +{<br>
&gt; &gt; +=C2=A0 =C2=A0 SBTSIState *s =3D SBTSI(d);<br>
&gt; &gt; +=C2=A0 =C2=A0 uint8_t data =3D 0;<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0 switch (s-&gt;addr) {<br>
&gt; &gt; +=C2=A0 =C2=A0 case SBTSI_REG_TEMP_INT:<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 data =3D get_temp_int(s-&gt;temperat=
ure);<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0 case SBTSI_REG_TEMP_DEC:<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 data =3D get_temp_dec(s-&gt;temperat=
ure);<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0 case SBTSI_REG_TEMP_HIGH_INT:<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 data =3D get_temp_int(s-&gt;limit_hi=
gh);<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0 case SBTSI_REG_TEMP_LOW_INT:<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 data =3D get_temp_int(s-&gt;limit_lo=
w);<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0 case SBTSI_REG_TEMP_HIGH_DEC:<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 data =3D get_temp_dec(s-&gt;limit_hi=
gh);<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0 case SBTSI_REG_TEMP_LOW_DEC:<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 data =3D get_temp_dec(s-&gt;limit_lo=
w);<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0 case SBTSI_REG_CONFIG:<br>
&gt; &gt; +=C2=A0 =C2=A0 case SBTSI_REG_CONFIG_WR:<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 data =3D s-&gt;config;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0 case SBTSI_REG_STATUS:<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 sbtsi_update_alarm(s);<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 data =3D s-&gt;status;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0 case SBTSI_REG_ALERT_CONFIG:<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 data =3D s-&gt;alert_config;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0 case SBTSI_REG_MAN:<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 data =3D SBTSI_MAN_DEFAULT;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0 case SBTSI_REG_REV:<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 data =3D SBTSI_REV_DEFAULT;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
<br>
Does this device do some sort of auto-increment on the address when<br>
reading/writing?<br></blockquote><div><br></div><div><a class=3D"gmail_plus=
reply" id=3D"gmail-m_-1086656079872489756plusReplyChip-0" href=3D"mailto:wu=
haotsh@google.com" target=3D"_blank">+Hao Wu</a>=C2=A0=C2=A0 - Please take =
a look at the above question.=C2=A0 I imagine it&#39;s a while since you&#3=
9;ve thought about it, but please double check :)</div><div>Thanks!</div><d=
iv><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Other than that possible issue, I don&#39;t see anything else, it&#39;s pre=
tty<br>
straightforward.<br>
<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0 default:<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_log_mask(LOG_GUEST_ERROR,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;%s=
: reading from invalid reg: 0x%02x\n&quot;,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 __func__=
, s-&gt;addr);<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; &gt; +=C2=A0 =C2=A0 }<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0 trace_tmp_sbtsi_read_data(s-&gt;addr, data);<br>
&gt; &gt; +=C2=A0 =C2=A0 return data;<br>
&gt; &gt; +}<br>
&gt; &gt; +<br>
&gt; &gt; +static void sbtsi_write(SBTSIState *s, uint8_t data)<br>
&gt; &gt; +{<br>
&gt; &gt; +=C2=A0 =C2=A0 trace_tmp_sbtsi_write_data(s-&gt;addr, data);<br>
&gt; &gt; +=C2=A0 =C2=A0 switch (s-&gt;addr) {<br>
&gt; &gt; +=C2=A0 =C2=A0 case SBTSI_REG_CONFIG_WR:<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;config =3D data;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0 case SBTSI_REG_TEMP_HIGH_INT:<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;limit_high =3D compute_temp_in=
t(s-&gt;limit_high, data);<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0 case SBTSI_REG_TEMP_LOW_INT:<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;limit_low =3D compute_temp_int=
(s-&gt;limit_low, data);<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0 case SBTSI_REG_TEMP_HIGH_DEC:<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;limit_high =3D compute_temp_de=
c(s-&gt;limit_high, data);<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0 case SBTSI_REG_TEMP_LOW_DEC:<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;limit_low =3D compute_temp_dec=
(s-&gt;limit_low, data);<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0 case SBTSI_REG_ALERT_CONFIG:<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;alert_config =3D data;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0 case SBTSI_REG_TEMP_INT:<br>
&gt; &gt; +=C2=A0 =C2=A0 case SBTSI_REG_TEMP_DEC:<br>
&gt; &gt; +=C2=A0 =C2=A0 case SBTSI_REG_CONFIG:<br>
&gt; &gt; +=C2=A0 =C2=A0 case SBTSI_REG_STATUS:<br>
&gt; &gt; +=C2=A0 =C2=A0 case SBTSI_REG_MAN:<br>
&gt; &gt; +=C2=A0 =C2=A0 case SBTSI_REG_REV:<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_log_mask(LOG_GUEST_ERROR,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;%s=
: writing to read only reg: 0x%02x data: 0x%02x\n&quot;,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 __func__=
, s-&gt;addr, data);<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0 default:<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_log_mask(LOG_GUEST_ERROR,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;%s=
: writing to invalid reg: 0x%02x data: 0x%02x\n&quot;,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 __func__=
, s-&gt;addr, data);<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; &gt; +=C2=A0 =C2=A0 }<br>
&gt; &gt; +=C2=A0 =C2=A0 sbtsi_update_alarm(s);<br>
&gt; &gt; +}<br>
&gt; &gt; +<br>
&gt; &gt; +static int sbtsi_write_data(SMBusDevice *d, uint8_t *buf, uint8_=
t len)<br>
&gt; &gt; +{<br>
&gt; &gt; +=C2=A0 =C2=A0 SBTSIState *s =3D SBTSI(d);<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0 if (len =3D=3D 0) {<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_log_mask(LOG_GUEST_ERROR, &quot=
;%s: writing empty data\n&quot;,<br>
&gt; &gt; __func__);<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return -1;<br>
&gt; &gt; +=C2=A0 =C2=A0 }<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0 s-&gt;addr =3D buf[0];<br>
&gt; &gt; +=C2=A0 =C2=A0 if (len &gt; 1) {<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 sbtsi_write(s, buf[1]);<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (len &gt; 2) {<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_log_mask(LOG_GUES=
T_ERROR, &quot;%s: extra data at end\n&quot;,<br>
&gt; &gt; __func__);<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; &gt; +=C2=A0 =C2=A0 }<br>
&gt; &gt; +=C2=A0 =C2=A0 return 0;<br>
&gt; &gt; +}<br>
&gt; &gt; +<br>
&gt; &gt; +/* Units are millidegrees. */<br>
&gt; &gt; +static void sbtsi_get_temperature(Object *obj, Visitor *v, const=
 char<br>
&gt; &gt; *name,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 void *opaque, Error=
 **errp)<br>
&gt; &gt; +{<br>
&gt; &gt; +=C2=A0 =C2=A0 SBTSIState *s =3D SBTSI(obj);<br>
&gt; &gt; +=C2=A0 =C2=A0 uint32_t temp =3D s-&gt;temperature * SBTSI_TEMP_U=
NIT_IN_MILLIDEGREE;<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0 visit_type_uint32(v, name, &amp;temp, errp);<br>
&gt; &gt; +}<br>
&gt; &gt; +<br>
&gt; &gt; +/* Units are millidegrees. */<br>
&gt; &gt; +static void sbtsi_set_temperature(Object *obj, Visitor *v, const=
 char<br>
&gt; &gt; *name,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 void *opaque, Error=
 **errp)<br>
&gt; &gt; +{<br>
&gt; &gt; +=C2=A0 =C2=A0 SBTSIState *s =3D SBTSI(obj);<br>
&gt; &gt; +=C2=A0 =C2=A0 uint32_t temp;<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0 if (!visit_type_uint32(v, name, &amp;temp, errp)) =
{<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
&gt; &gt; +=C2=A0 =C2=A0 }<br>
&gt; &gt; +=C2=A0 =C2=A0 if (temp &gt; SBTSI_TEMP_MAX) {<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg(errp, &quot;value %&quot;=
 PRIu32 &quot;.%03&quot; PRIu32 &quot; C is out of<br>
&gt; &gt; range&quot;,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0temp / 1000, temp % 1000);<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
&gt; &gt; +=C2=A0 =C2=A0 }<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0 s-&gt;temperature =3D temp / SBTSI_TEMP_UNIT_IN_MI=
LLIDEGREE;<br>
&gt; &gt; +=C2=A0 =C2=A0 sbtsi_update_alarm(s);<br>
&gt; &gt; +}<br>
&gt; &gt; +<br>
&gt; &gt; +static int sbtsi_post_load(void *opaque, int version_id)<br>
&gt; &gt; +{<br>
&gt; &gt; +=C2=A0 =C2=A0 SBTSIState *s =3D opaque;<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0 sbtsi_update_alarm(s);<br>
&gt; &gt; +=C2=A0 =C2=A0 return 0;<br>
&gt; &gt; +}<br>
&gt; &gt; +<br>
&gt; &gt; +static const VMStateDescription vmstate_sbtsi =3D {<br>
&gt; &gt; +=C2=A0 =C2=A0 .name =3D &quot;SBTSI&quot;,<br>
&gt; &gt; +=C2=A0 =C2=A0 .version_id =3D 0,<br>
&gt; &gt; +=C2=A0 =C2=A0 .minimum_version_id =3D 0,<br>
&gt; &gt; +=C2=A0 =C2=A0 .post_load =3D sbtsi_post_load,<br>
&gt; &gt; +=C2=A0 =C2=A0 .fields =3D (VMStateField[]) {<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 VMSTATE_UINT32(temperature, SBTSISta=
te),<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 VMSTATE_UINT32(limit_low, SBTSIState=
),<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 VMSTATE_UINT32(limit_high, SBTSIStat=
e),<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 VMSTATE_UINT8(config, SBTSIState),<b=
r>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 VMSTATE_UINT8(status, SBTSIState),<b=
r>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 VMSTATE_UINT8(addr, SBTSIState),<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 VMSTATE_END_OF_LIST()<br>
&gt; &gt; +=C2=A0 =C2=A0 }<br>
&gt; &gt; +};<br>
&gt; &gt; +<br>
&gt; &gt; +static void sbtsi_enter_reset(Object *obj, ResetType type)<br>
&gt; &gt; +{<br>
&gt; &gt; +=C2=A0 =C2=A0 SBTSIState *s =3D SBTSI(obj);<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0 s-&gt;config =3D 0;<br>
&gt; &gt; +=C2=A0 =C2=A0 s-&gt;limit_low =3D SBTSI_LIMIT_LOW_DEFAULT;<br>
&gt; &gt; +=C2=A0 =C2=A0 s-&gt;limit_high =3D SBTSI_LIMIT_HIGH_DEFAULT;<br>
&gt; &gt; +}<br>
&gt; &gt; +<br>
&gt; &gt; +static void sbtsi_hold_reset(Object *obj)<br>
&gt; &gt; +{<br>
&gt; &gt; +=C2=A0 =C2=A0 SBTSIState *s =3D SBTSI(obj);<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0 qemu_irq_lower(s-&gt;alarm);<br>
&gt; &gt; +}<br>
&gt; &gt; +<br>
&gt; &gt; +static void sbtsi_init(Object *obj)<br>
&gt; &gt; +{<br>
&gt; &gt; +=C2=A0 =C2=A0 SBTSIState *s =3D SBTSI(obj);<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0 /* Current temperature in millidegrees. */<br>
&gt; &gt; +=C2=A0 =C2=A0 object_property_add(obj, &quot;temperature&quot;, =
&quot;uint32&quot;,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 sbtsi_get_temperature, sbtsi_set_temperature,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 NULL, NULL);<br>
&gt; &gt; +=C2=A0 =C2=A0 qdev_init_gpio_out_named(DEVICE(obj), &amp;s-&gt;a=
larm, SBTSI_ALARM_L, 0);<br>
&gt; &gt; +}<br>
&gt; &gt; +<br>
&gt; &gt; +static void sbtsi_class_init(ObjectClass *klass, void *data)<br>
&gt; &gt; +{<br>
&gt; &gt; +=C2=A0 =C2=A0 ResettableClass *rc =3D RESETTABLE_CLASS(klass);<b=
r>
&gt; &gt; +=C2=A0 =C2=A0 DeviceClass *dc =3D DEVICE_CLASS(klass);<br>
&gt; &gt; +=C2=A0 =C2=A0 SMBusDeviceClass *k =3D SMBUS_DEVICE_CLASS(klass);=
<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0 dc-&gt;desc =3D &quot;SB-TSI Temperature Sensor&qu=
ot;;<br>
&gt; &gt; +=C2=A0 =C2=A0 dc-&gt;vmsd =3D &amp;vmstate_sbtsi;<br>
&gt; &gt; +=C2=A0 =C2=A0 k-&gt;write_data =3D sbtsi_write_data;<br>
&gt; &gt; +=C2=A0 =C2=A0 k-&gt;receive_byte =3D sbtsi_read_byte;<br>
&gt; &gt; +=C2=A0 =C2=A0 rc-&gt;phases.enter =3D sbtsi_enter_reset;<br>
&gt; &gt; +=C2=A0 =C2=A0 rc-&gt;phases.hold =3D sbtsi_hold_reset;<br>
&gt; &gt; +}<br>
&gt; &gt; +<br>
&gt; &gt; +static const TypeInfo sbtsi_info =3D {<br>
&gt; &gt; +=C2=A0 =C2=A0 .name=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D TYPE_S=
BTSI,<br>
&gt; &gt; +=C2=A0 =C2=A0 .parent=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D TYPE_SMBUS_=
DEVICE,<br>
&gt; &gt; +=C2=A0 =C2=A0 .instance_size =3D sizeof(SBTSIState),<br>
&gt; &gt; +=C2=A0 =C2=A0 .instance_init =3D sbtsi_init,<br>
&gt; &gt; +=C2=A0 =C2=A0 .class_init=C2=A0 =C2=A0 =3D sbtsi_class_init,<br>
&gt; &gt; +};<br>
&gt; &gt; +<br>
&gt; &gt; +static void sbtsi_register_types(void)<br>
&gt; &gt; +{<br>
&gt; &gt; +=C2=A0 =C2=A0 type_register_static(&amp;sbtsi_info);<br>
&gt; &gt; +}<br>
&gt; &gt; +<br>
&gt; &gt; +type_init(sbtsi_register_types)<br>
&gt; &gt; diff --git a/hw/sensor/trace-events b/hw/sensor/trace-events<br>
&gt; &gt; new file mode 100644<br>
&gt; &gt; index 0000000000..21ab3809e2<br>
&gt; &gt; --- /dev/null<br>
&gt; &gt; +++ b/hw/sensor/trace-events<br>
&gt; &gt; @@ -0,0 +1,5 @@<br>
&gt; &gt; +# See docs/devel/tracing.rst for syntax documentation.<br>
&gt; &gt; +<br>
&gt; &gt; +# tmp_sbtsi.c<br>
&gt; &gt; +tmp_sbtsi_write_data(uint8_t addr, uint8_t value) &quot;SBTSI wr=
ite<br>
&gt; &gt; addr:0x%02x data: 0x%02x&quot;<br>
&gt; &gt; +tmp_sbtsi_read_data(uint8_t addr, uint8_t value) &quot;SBTSI rea=
d addr:0x%02x<br>
&gt; &gt; data: 0x%02x&quot;<br>
&gt; &gt; diff --git a/hw/sensor/trace.h b/hw/sensor/trace.h<br>
&gt; &gt; new file mode 100644<br>
&gt; &gt; index 0000000000..e4721560b0<br>
&gt; &gt; --- /dev/null<br>
&gt; &gt; +++ b/hw/sensor/trace.h<br>
&gt; &gt; @@ -0,0 +1 @@<br>
&gt; &gt; +#include &quot;trace/trace-hw_sensor.h&quot;<br>
&gt; &gt; diff --git a/meson.build b/meson.build<br>
&gt; &gt; index 53065e96ec..f8ab0bf74e 100644<br>
&gt; &gt; --- a/meson.build<br>
&gt; &gt; +++ b/meson.build<br>
&gt; &gt; @@ -2494,6 +2494,7 @@ if have_system<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &#39;hw/rtc&#39;,<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &#39;hw/s390x&#39;,<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &#39;hw/scsi&#39;,<br>
&gt; &gt; +=C2=A0 =C2=A0 &#39;hw/sensor&#39;,<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &#39;hw/sd&#39;,<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &#39;hw/sh4&#39;,<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &#39;hw/sparc&#39;,<br>
&gt; &gt; diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build<br=
>
&gt; &gt; index 37e1eaa449..d1a8c38f74 100644<br>
&gt; &gt; --- a/tests/qtest/meson.build<br>
&gt; &gt; +++ b/tests/qtest/meson.build<br>
&gt; &gt; @@ -254,6 +254,7 @@ qos_test_ss.add(<br>
&gt; &gt;=C2=A0 =C2=A0 &#39;spapr-phb-test.c&#39;,<br>
&gt; &gt;=C2=A0 =C2=A0 &#39;tmp105-test.c&#39;,<br>
&gt; &gt;=C2=A0 =C2=A0 &#39;emc141x-test.c&#39;,<br>
&gt; &gt; +=C2=A0 &#39;tmp_sbtsi-test.c&#39;,<br>
&gt; &gt;=C2=A0 =C2=A0 &#39;usb-hcd-ohci-test.c&#39;,<br>
&gt; &gt;=C2=A0 =C2=A0 &#39;virtio-test.c&#39;,<br>
&gt; &gt;=C2=A0 =C2=A0 &#39;virtio-blk-test.c&#39;,<br>
&gt; &gt; diff --git a/tests/qtest/tmp_sbtsi-test.c b/tests/qtest/tmp_sbtsi=
-test.c<br>
&gt; &gt; new file mode 100644<br>
&gt; &gt; index 0000000000..7f5fafacc7<br>
&gt; &gt; --- /dev/null<br>
&gt; &gt; +++ b/tests/qtest/tmp_sbtsi-test.c<br>
&gt; &gt; @@ -0,0 +1,180 @@<br>
&gt; &gt; +/*<br>
&gt; &gt; + * QTests for the SBTSI temperature sensor<br>
&gt; &gt; + *<br>
&gt; &gt; + * Copyright 2020 Google LLC<br>
&gt; &gt; + *<br>
&gt; &gt; + * This program is free software; you can redistribute it and/or=
 modify it<br>
&gt; &gt; + * under the terms of the GNU General Public License as publishe=
d by the<br>
&gt; &gt; + * Free Software Foundation; either version 2 of the License, or=
<br>
&gt; &gt; + * (at your option) any later version.<br>
&gt; &gt; + *<br>
&gt; &gt; + * This program is distributed in the hope that it will be usefu=
l, but<br>
&gt; &gt; WITHOUT<br>
&gt; &gt; + * ANY WARRANTY; without even the implied warranty of MERCHANTAB=
ILITY or<br>
&gt; &gt; + * FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public =
License<br>
&gt; &gt; + * for more details.<br>
&gt; &gt; + */<br>
&gt; &gt; +<br>
&gt; &gt; +#include &quot;qemu/osdep.h&quot;<br>
&gt; &gt; +<br>
&gt; &gt; +#include &quot;libqtest-single.h&quot;<br>
&gt; &gt; +#include &quot;libqos/qgraph.h&quot;<br>
&gt; &gt; +#include &quot;libqos/i2c.h&quot;<br>
&gt; &gt; +#include &quot;qapi/qmp/qdict.h&quot;<br>
&gt; &gt; +#include &quot;qemu/bitops.h&quot;<br>
&gt; &gt; +<br>
&gt; &gt; +#define TEST_ID=C2=A0 =C2=A0&quot;sbtsi-test&quot;<br>
&gt; &gt; +#define TEST_ADDR (0x4c)<br>
&gt; &gt; +<br>
&gt; &gt; +/*<br>
&gt; &gt; + * SB-TSI registers only support SMBus byte data access. &quot;_=
INT&quot; registers<br>
&gt; &gt; are<br>
&gt; &gt; + * the integer part of a temperature value or limit, and &quot;_=
DEC&quot; registers<br>
&gt; &gt; are<br>
&gt; &gt; + * corresponding decimal parts.<br>
&gt; &gt; + */<br>
&gt; &gt; +#define REG_TEMP_INT=C2=A0 =C2=A0 =C2=A0 0x01 /* RO */<br>
&gt; &gt; +#define REG_STATUS=C2=A0 =C2=A0 =C2=A0 =C2=A0 0x02 /* RO */<br>
&gt; &gt; +#define REG_CONFIG=C2=A0 =C2=A0 =C2=A0 =C2=A0 0x03 /* RO */<br>
&gt; &gt; +#define REG_TEMP_HIGH_INT 0x07 /* RW */<br>
&gt; &gt; +#define REG_TEMP_LOW_INT=C2=A0 0x08 /* RW */<br>
&gt; &gt; +#define REG_CONFIG_WR=C2=A0 =C2=A0 =C2=A00x09 /* RW */<br>
&gt; &gt; +#define REG_TEMP_DEC=C2=A0 =C2=A0 =C2=A0 0x10 /* RO */<br>
&gt; &gt; +#define REG_TEMP_HIGH_DEC 0x13 /* RW */<br>
&gt; &gt; +#define REG_TEMP_LOW_DEC=C2=A0 0x14 /* RW */<br>
&gt; &gt; +#define REG_ALERT_CONFIG=C2=A0 0xBF /* RW */<br>
&gt; &gt; +<br>
&gt; &gt; +#define STATUS_HIGH_ALERT BIT(4)<br>
&gt; &gt; +#define STATUS_LOW_ALERT=C2=A0 BIT(3)<br>
&gt; &gt; +#define CONFIG_ALERT_MASK BIT(7)<br>
&gt; &gt; +#define ALARM_EN=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 BIT(0)<br>
&gt; &gt; +<br>
&gt; &gt; +/* The temperature stored are in units of 0.125 degrees. */<br>
&gt; &gt; +#define TEMP_UNIT_IN_MILLIDEGREE 125<br>
&gt; &gt; +#define LIMIT_LOW (10500)<br>
&gt; &gt; +#define LIMIT_HIGH (55125)<br>
&gt; &gt; +<br>
&gt; &gt; +static uint32_t qmp_sbtsi_get_temperature(const char *id)<br>
&gt; &gt; +{<br>
&gt; &gt; +=C2=A0 =C2=A0 QDict *response;<br>
&gt; &gt; +=C2=A0 =C2=A0 int ret;<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0 response =3D qmp(&quot;{ &#39;execute&#39;: &#39;q=
om-get&#39;, &#39;arguments&#39;: { &#39;path&#39;: %s, &quot;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0&quot;&#39;property&#39;: &#39;temperature&#39; } }&quot;, id);<br>
&gt; &gt; +=C2=A0 =C2=A0 g_assert(qdict_haskey(response, &quot;return&quot;=
));<br>
&gt; &gt; +=C2=A0 =C2=A0 ret =3D (uint32_t)qdict_get_int(response, &quot;re=
turn&quot;);<br>
&gt; &gt; +=C2=A0 =C2=A0 qobject_unref(response);<br>
&gt; &gt; +=C2=A0 =C2=A0 return ret;<br>
&gt; &gt; +}<br>
&gt; &gt; +<br>
&gt; &gt; +static void qmp_sbtsi_set_temperature(const char *id, uint32_t v=
alue)<br>
&gt; &gt; +{<br>
&gt; &gt; +=C2=A0 =C2=A0 QDict *response;<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0 response =3D qmp(&quot;{ &#39;execute&#39;: &#39;q=
om-set&#39;, &#39;arguments&#39;: { &#39;path&#39;: %s, &quot;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0&quot;&#39;property&#39;: &#39;temperature&#39;, &#39;value&#39;: %d =
} }&quot;, id,<br>
&gt; &gt; value);<br>
&gt; &gt; +=C2=A0 =C2=A0 g_assert(qdict_haskey(response, &quot;return&quot;=
));<br>
&gt; &gt; +=C2=A0 =C2=A0 qobject_unref(response);<br>
&gt; &gt; +}<br>
&gt; &gt; +<br>
&gt; &gt; +/*<br>
&gt; &gt; + * Compute the temperature using the integer and decimal part an=
d return<br>
&gt; &gt; + * millidegrees. The decimal part are only the top 3 bits so we =
shift it<br>
&gt; &gt; by<br>
&gt; &gt; + * 5 here.<br>
&gt; &gt; + */<br>
&gt; &gt; +static uint32_t regs_to_temp(uint8_t integer, uint8_t decimal)<b=
r>
&gt; &gt; +{<br>
&gt; &gt; +=C2=A0 =C2=A0 return ((integer &lt;&lt; 3) + (decimal &gt;&gt; 5=
)) * TEMP_UNIT_IN_MILLIDEGREE;<br>
&gt; &gt; +}<br>
&gt; &gt; +<br>
&gt; &gt; +/*<br>
&gt; &gt; + * Compute the integer and decimal parts of the temperature in<b=
r>
&gt; &gt; millidegrees.<br>
&gt; &gt; + * H/W store the decimal in the top 3 bits so we shift it by 5.<=
br>
&gt; &gt; + */<br>
&gt; &gt; +static void temp_to_regs(uint32_t temp, uint8_t *integer, uint8_=
t<br>
&gt; &gt; *decimal)<br>
&gt; &gt; +{<br>
&gt; &gt; +=C2=A0 =C2=A0 temp /=3D TEMP_UNIT_IN_MILLIDEGREE;<br>
&gt; &gt; +=C2=A0 =C2=A0 *integer =3D temp &gt;&gt; 3;<br>
&gt; &gt; +=C2=A0 =C2=A0 *decimal =3D (temp &amp; 0x7) &lt;&lt; 5;<br>
&gt; &gt; +}<br>
&gt; &gt; +<br>
&gt; &gt; +static void tx_rx(void *obj, void *data, QGuestAllocator *alloc)=
<br>
&gt; &gt; +{<br>
&gt; &gt; +=C2=A0 =C2=A0 uint16_t value;<br>
&gt; &gt; +=C2=A0 =C2=A0 uint8_t integer, decimal;<br>
&gt; &gt; +=C2=A0 =C2=A0 QI2CDevice *i2cdev =3D (QI2CDevice *)obj;<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0 /* Test default values */<br>
&gt; &gt; +=C2=A0 =C2=A0 value =3D qmp_sbtsi_get_temperature(TEST_ID);<br>
&gt; &gt; +=C2=A0 =C2=A0 g_assert_cmpuint(value, =3D=3D, 0);<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0 integer =3D i2c_get8(i2cdev, REG_TEMP_INT);<br>
&gt; &gt; +=C2=A0 =C2=A0 decimal =3D i2c_get8(i2cdev, REG_TEMP_DEC);<br>
&gt; &gt; +=C2=A0 =C2=A0 g_assert_cmpuint(regs_to_temp(integer, decimal), =
=3D=3D, 0);<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0 /* Test setting temperature */<br>
&gt; &gt; +=C2=A0 =C2=A0 qmp_sbtsi_set_temperature(TEST_ID, 20000);<br>
&gt; &gt; +=C2=A0 =C2=A0 value =3D qmp_sbtsi_get_temperature(TEST_ID);<br>
&gt; &gt; +=C2=A0 =C2=A0 g_assert_cmpuint(value, =3D=3D, 20000);<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0 integer =3D i2c_get8(i2cdev, REG_TEMP_INT);<br>
&gt; &gt; +=C2=A0 =C2=A0 decimal =3D i2c_get8(i2cdev, REG_TEMP_DEC);<br>
&gt; &gt; +=C2=A0 =C2=A0 g_assert_cmpuint(regs_to_temp(integer, decimal), =
=3D=3D, 20000);<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0 /* Set alert mask in config */<br>
&gt; &gt; +=C2=A0 =C2=A0 i2c_set8(i2cdev, REG_CONFIG_WR, CONFIG_ALERT_MASK)=
;<br>
&gt; &gt; +=C2=A0 =C2=A0 value =3D i2c_get8(i2cdev, REG_CONFIG);<br>
&gt; &gt; +=C2=A0 =C2=A0 g_assert_cmphex(value, =3D=3D, CONFIG_ALERT_MASK);=
<br>
&gt; &gt; +=C2=A0 =C2=A0 /* Enable alarm_en */<br>
&gt; &gt; +=C2=A0 =C2=A0 i2c_set8(i2cdev, REG_ALERT_CONFIG, ALARM_EN);<br>
&gt; &gt; +=C2=A0 =C2=A0 value =3D i2c_get8(i2cdev, REG_ALERT_CONFIG);<br>
&gt; &gt; +=C2=A0 =C2=A0 g_assert_cmphex(value, =3D=3D, ALARM_EN);<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0 /* Test setting limits */<br>
&gt; &gt; +=C2=A0 =C2=A0 /* Limit low =3D 10.500 */<br>
&gt; &gt; +=C2=A0 =C2=A0 temp_to_regs(LIMIT_LOW, &amp;integer, &amp;decimal=
);<br>
&gt; &gt; +=C2=A0 =C2=A0 i2c_set8(i2cdev, REG_TEMP_LOW_INT, integer);<br>
&gt; &gt; +=C2=A0 =C2=A0 i2c_set8(i2cdev, REG_TEMP_LOW_DEC, decimal);<br>
&gt; &gt; +=C2=A0 =C2=A0 integer =3D i2c_get8(i2cdev, REG_TEMP_LOW_INT);<br=
>
&gt; &gt; +=C2=A0 =C2=A0 decimal =3D i2c_get8(i2cdev, REG_TEMP_LOW_DEC);<br=
>
&gt; &gt; +=C2=A0 =C2=A0 g_assert_cmpuint(regs_to_temp(integer, decimal), =
=3D=3D, LIMIT_LOW);<br>
&gt; &gt; +=C2=A0 =C2=A0 /* Limit high =3D 55.125 */<br>
&gt; &gt; +=C2=A0 =C2=A0 temp_to_regs(LIMIT_HIGH, &amp;integer, &amp;decima=
l);<br>
&gt; &gt; +=C2=A0 =C2=A0 i2c_set8(i2cdev, REG_TEMP_HIGH_INT, integer);<br>
&gt; &gt; +=C2=A0 =C2=A0 i2c_set8(i2cdev, REG_TEMP_HIGH_DEC, decimal);<br>
&gt; &gt; +=C2=A0 =C2=A0 integer =3D i2c_get8(i2cdev, REG_TEMP_HIGH_INT);<b=
r>
&gt; &gt; +=C2=A0 =C2=A0 decimal =3D i2c_get8(i2cdev, REG_TEMP_HIGH_DEC);<b=
r>
&gt; &gt; +=C2=A0 =C2=A0 g_assert_cmpuint(regs_to_temp(integer, decimal), =
=3D=3D, LIMIT_HIGH);<br>
&gt; &gt; +=C2=A0 =C2=A0 /* No alert is generated. */<br>
&gt; &gt; +=C2=A0 =C2=A0 value =3D i2c_get8(i2cdev, REG_STATUS);<br>
&gt; &gt; +=C2=A0 =C2=A0 g_assert_cmphex(value, =3D=3D, 0);<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0 /* Test alert for low temperature */<br>
&gt; &gt; +=C2=A0 =C2=A0 qmp_sbtsi_set_temperature(TEST_ID, LIMIT_LOW);<br>
&gt; &gt; +=C2=A0 =C2=A0 value =3D i2c_get8(i2cdev, REG_STATUS);<br>
&gt; &gt; +=C2=A0 =C2=A0 g_assert_cmphex(value, =3D=3D, STATUS_LOW_ALERT);<=
br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0 /* Test alert for high temperature */<br>
&gt; &gt; +=C2=A0 =C2=A0 qmp_sbtsi_set_temperature(TEST_ID, LIMIT_HIGH);<br=
>
&gt; &gt; +=C2=A0 =C2=A0 value =3D i2c_get8(i2cdev, REG_STATUS);<br>
&gt; &gt; +=C2=A0 =C2=A0 g_assert_cmphex(value, =3D=3D, STATUS_HIGH_ALERT);=
<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0 /* Disable alarm_en */<br>
&gt; &gt; +=C2=A0 =C2=A0 i2c_set8(i2cdev, REG_ALERT_CONFIG, 0);<br>
&gt; &gt; +=C2=A0 =C2=A0 value =3D i2c_get8(i2cdev, REG_ALERT_CONFIG);<br>
&gt; &gt; +=C2=A0 =C2=A0 g_assert_cmphex(value, =3D=3D, 0);<br>
&gt; &gt; +=C2=A0 =C2=A0 /* No alert when alarm_en is false. */<br>
&gt; &gt; +=C2=A0 =C2=A0 value =3D i2c_get8(i2cdev, REG_STATUS);<br>
&gt; &gt; +=C2=A0 =C2=A0 g_assert_cmphex(value, =3D=3D, 0);<br>
&gt; &gt; +}<br>
&gt; &gt; +<br>
&gt; &gt; +static void sbtsi_register_nodes(void)<br>
&gt; &gt; +{<br>
&gt; &gt; +=C2=A0 =C2=A0 QOSGraphEdgeOptions opts =3D {<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 .extra_device_opts =3D &quot;id=3D&q=
uot; TEST_ID &quot;,address=3D0x4c&quot;<br>
&gt; &gt; +=C2=A0 =C2=A0 };<br>
&gt; &gt; +=C2=A0 =C2=A0 add_qi2c_address(&amp;opts, &amp;(QI2CAddress) { T=
EST_ADDR });<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0 qos_node_create_driver(&quot;sbtsi&quot;, i2c_devi=
ce_create);<br>
&gt; &gt; +=C2=A0 =C2=A0 qos_node_consumes(&quot;sbtsi&quot;, &quot;i2c-bus=
&quot;, &amp;opts);<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0 qos_add_test(&quot;tx-rx&quot;, &quot;sbtsi&quot;,=
 tx_rx, NULL);<br>
&gt; &gt; +}<br>
&gt; &gt; +libqos_init(sbtsi_register_nodes);<br>
&gt; &gt; --<br>
&gt; <br>
&gt; <br>
&gt; + Corey for i2c maintainer.=C2=A0 The new sensor directory is mostly i=
f not<br>
&gt; entirely i2c devices.=C2=A0 I didn&#39;t create a maintainer entry for=
 this i2c<br>
&gt; device, but I can if desired and send out a v2.<br>
<br>
Yeah, I guess I should be maintainer there.=C2=A0 I&#39;ll queue up a chang=
e for<br>
that.=C2=A0 Thanks.<br>
<br>
-corey<br>
<br>
&gt; <br>
&gt; <br>
&gt; &gt; 2.34.1.575.g55b058a8bb-goog<br>
&gt; &gt;<br>
&gt; &gt;<br>
</blockquote></div></div>
</blockquote></div>

--000000000000f34b3c05d685202d--

