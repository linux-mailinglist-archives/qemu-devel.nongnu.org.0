Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA95849EEC8
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Jan 2022 00:21:19 +0100 (CET)
Received: from localhost ([::1]:43508 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDE4s-0002TG-WB
	for lists+qemu-devel@lfdr.de; Thu, 27 Jan 2022 18:21:19 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59382)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <venture@google.com>)
 id 1nDE2f-0000D1-Uz
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 18:19:02 -0500
Received: from [2607:f8b0:4864:20::92b] (port=36841
 helo=mail-ua1-x92b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <venture@google.com>)
 id 1nDE2a-00005B-6b
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 18:19:01 -0500
Received: by mail-ua1-x92b.google.com with SMTP id u76so6709148uau.3
 for <qemu-devel@nongnu.org>; Thu, 27 Jan 2022 15:18:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=T4tB9cTY/FVe8aae9TovDLu+uTXGVwCxM3mdwjesPc4=;
 b=rmn3JdMSG+aV4YV3GkI3q9tlZhMhx1EcIGcTO8Oc7KsYRbozCVRj5JfGMnLccsU733
 fysIJAbShCvR6RkhuudjkTghUBdFCeq0rASdLPvsiVnVlC1axnZxDvncpbL/SKG3Ph2u
 3lCM6uvJcCx6C4tDPn8eaTKjH14BWWmNZdbFskwBbyCLHvYp/Be6/v/V7isf/VLW3Ps5
 n2QsEc4BBlQwAaqyAcp1PuuVDGjJ3lQpFAS/+Jrf5qfJt8Lm5rE983s/jOokakUNM6yp
 pjh3yjbxHT/bxxheVnoWHgq6dqFWnE36Pt8Yc31rmxcE/DmEllhLBHJSVQ3QC3V/cn0p
 oXbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=T4tB9cTY/FVe8aae9TovDLu+uTXGVwCxM3mdwjesPc4=;
 b=asEduGuOpSm+U9h8w12Z1lZAQhTmNziYHVhu3duNlcf1SwdtcFx8xFhf0DaAPlQvrb
 6Cu8ERJHB89FzT67zof+YHMjSRptnndm6Z9vSmxn3kJJYXj01vY4Ez9FPSvOADM74ff4
 WOzQsyzX8Vn3mD/5CymfVa14oh6FNpmtBRYPeZzrfR1SUkiOq2DTvQD2MoYJ61TZbGDK
 t0AMq9R43IYXPOJyN/c30ObD0CT9QZtsGilzsPKCkzFszk3doYWBcAfqMkFIMixhhssp
 /7nyFaT+PjdyoqXorkI3h/t3dwO9GTpE5J2XrAWYkWMm+s9dl6UWldOwBQRYoZ2ndVl2
 wpAw==
X-Gm-Message-State: AOAM531JUzI7snBjzqNbZ1O7HmlA0q82biDfM/KJSAHyt8Dh6o5PgEiW
 o8Duk36kIJzjcyxQDEh3/RnTHR2sr+nsCv8CI6FpkQ==
X-Google-Smtp-Source: ABdhPJytXxr4Y9PveD7qV2xFXKMKN9xJ7v8mMhAqiIDkVZIuLfkaVoNcjJ8hFfK2NN2b8U84zg1o4QNnF56Wpf799Vk=
X-Received: by 2002:ab0:166a:: with SMTP id l39mr3070003uae.68.1643325534806; 
 Thu, 27 Jan 2022 15:18:54 -0800 (PST)
MIME-Version: 1.0
References: <20220108030451.3867815-1-venture@google.com>
 <CAO=notwq9OWgPEymrb6OR0LXkH784qZPxzaO0X8UvgT+_-TizQ@mail.gmail.com>
 <20220117140524.GC34953@minyard.net>
 <CAO=notxchfjca97JVVnocc0o6d5iQDPz494m=epZzH6Ot_h2ag@mail.gmail.com>
 <CAGcCb12g-zqBq1f-kXO0PfX6CmESi86RYoAvbBVsJju89KwSoA@mail.gmail.com>
 <20220127145532.GI34953@minyard.net>
 <CAGcCb13uCD61Mk1Jbsb9GSCdAA-x71LeZ+kreU8pLnCsq6_NKA@mail.gmail.com>
In-Reply-To: <CAGcCb13uCD61Mk1Jbsb9GSCdAA-x71LeZ+kreU8pLnCsq6_NKA@mail.gmail.com>
From: Patrick Venture <venture@google.com>
Date: Thu, 27 Jan 2022 15:18:43 -0800
Message-ID: <CAO=notz9Lyr0NYoUOAiemWpxFb=T4C2DCxSU+hzdCLamDLGhAA@mail.gmail.com>
Subject: Re: [PATCH] hw/sensor: Add SB-TSI Temperature Sensor Interface
To: Hao Wu <wuhaotsh@google.com>
Cc: Corey Minyard <cminyard@mvista.com>, Thomas Huth <thuth@redhat.com>, 
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 QEMU Developers <qemu-devel@nongnu.org>, Doug Evans <dje@google.com>
Content-Type: multipart/alternative; boundary="000000000000c10c8505d6988a53"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::92b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::92b;
 envelope-from=venture@google.com; helo=mail-ua1-x92b.google.com
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

--000000000000c10c8505d6988a53
Content-Type: text/plain; charset="UTF-8"

On Thu, Jan 27, 2022 at 10:20 AM Hao Wu <wuhaotsh@google.com> wrote:

>
> On Thu, Jan 27, 2022 at 6:55 AM Corey Minyard <cminyard@mvista.com> wrote:
>
>> On Wed, Jan 26, 2022 at 04:09:03PM -0800, Hao Wu wrote:
>> > Hi,
>> >
>> > Sorry for the late reply. I'm not sure what "auto-increment" means here.
>>
>> The question is: When a value is read, does the address automatically
>> increment.  I2C devices very often do this.  If you do a multi-byte
>> read, they often will read the value from address 0, then from address
>> 1, etc.  Same for writes.
>>
> The datasheet does not suggest such behavior could happen.
>
>>
>> > The kernel driver at
>> > https://lkml.org/lkml/2020/12/11/968
>> > only has byte-size read/write operations, so I don't see a problem here.
>> > The values are extracted
>> > from the datasheet.
>>
>> The *Linux* kernel driver my only do byte-size operations, but other
>> kernels may work different, and the Linux kernel may change.  You have
>> to implement from the datasheet, not the device driver.
>>
> The implementation is already according to the datasheet.
>
>> Thanks,
>>
>> -corey
>>
>>
I have to send out a new patchset to include my signature block since I'm
sending a patch Hao wrote.  Laurent pointed this out to me in a different
patch series.

From this exchange, I don't think there are other changes for v2.  Please
let me know if that's false.

Thanks,
Patrick


> >
>> > On Tue, Jan 18, 2022 at 9:10 AM Patrick Venture <venture@google.com>
>> wrote:
>> >
>> > >
>> > >
>> > > On Mon, Jan 17, 2022 at 6:05 AM Corey Minyard <cminyard@mvista.com>
>> wrote:
>> > >
>> > >> On Sun, Jan 09, 2022 at 06:17:34PM -0800, Patrick Venture wrote:
>> > >> > On Fri, Jan 7, 2022 at 7:04 PM Patrick Venture <venture@google.com
>> >
>> > >> wrote:
>> > >> >
>> > >> > > From: Hao Wu <wuhaotsh@google.com>
>> > >> > >
>> > >> > > SB Temperature Sensor Interface (SB-TSI) is an SMBus compatible
>> > >> > > interface that reports AMD SoC's Ttcl (normalized temperature),
>> > >> > > and resembles a typical 8-pin remote temperature sensor's I2C
>> > >> interface
>> > >> > > to BMC.
>> > >> > >
>> > >> > > This patch implements a basic AMD SB-TSI sensor that is
>> > >> > > compatible with the open-source data sheet from AMD and Linux
>> > >> > > kernel driver.
>> > >> > >
>> > >> > > Reference:
>> > >> > > Linux kernel driver:
>> > >> > > https://lkml.org/lkml/2020/12/11/968
>> > >> > > Register Map:
>> > >> > > https://developer.amd.com/wp-content/resources/56255_3_03.PDF
>> > >> > > (Chapter 6)
>> > >> > >
>> > >> > > Signed-off-by: Hao Wu <wuhaotsh@google.com>
>> > >> > > Reviewed-by: Doug Evans <dje@google.com>
>> > >> > > ---
>> > >> > >  hw/sensor/Kconfig            |   4 +
>> > >> > >  hw/sensor/meson.build        |   1 +
>> > >> > >  hw/sensor/tmp_sbtsi.c        | 393
>> > >> +++++++++++++++++++++++++++++++++++
>> > >> > >  hw/sensor/trace-events       |   5 +
>> > >> > >  hw/sensor/trace.h            |   1 +
>> > >> > >  meson.build                  |   1 +
>> > >> > >  tests/qtest/meson.build      |   1 +
>> > >> > >  tests/qtest/tmp_sbtsi-test.c | 180 ++++++++++++++++
>> > >> > >  8 files changed, 586 insertions(+)
>> > >> > >  create mode 100644 hw/sensor/tmp_sbtsi.c
>> > >> > >  create mode 100644 hw/sensor/trace-events
>> > >> > >  create mode 100644 hw/sensor/trace.h
>> > >> > >  create mode 100644 tests/qtest/tmp_sbtsi-test.c
>> > >> > >
>> > >> > > diff --git a/hw/sensor/Kconfig b/hw/sensor/Kconfig
>> > >> > > index 9c8a049b06..27f6f79c84 100644
>> > >> > > --- a/hw/sensor/Kconfig
>> > >> > > +++ b/hw/sensor/Kconfig
>> > >> > > @@ -21,3 +21,7 @@ config ADM1272
>> > >> > >  config MAX34451
>> > >> > >      bool
>> > >> > >      depends on I2C
>> > >> > > +
>> > >> > > +config AMDSBTSI
>> > >> > > +    bool
>> > >> > > +    depends on I2C
>> > >> > > diff --git a/hw/sensor/meson.build b/hw/sensor/meson.build
>> > >> > > index 059c4ca935..f7b0e645eb 100644
>> > >> > > --- a/hw/sensor/meson.build
>> > >> > > +++ b/hw/sensor/meson.build
>> > >> > > @@ -4,3 +4,4 @@ softmmu_ss.add(when: 'CONFIG_DPS310', if_true:
>> > >> > > files('dps310.c'))
>> > >> > >  softmmu_ss.add(when: 'CONFIG_EMC141X', if_true:
>> files('emc141x.c'))
>> > >> > >  softmmu_ss.add(when: 'CONFIG_ADM1272', if_true:
>> files('adm1272.c'))
>> > >> > >  softmmu_ss.add(when: 'CONFIG_MAX34451', if_true:
>> files('max34451.c'))
>> > >> > > +softmmu_ss.add(when: 'CONFIG_AMDSBTSI', if_true:
>> > >> files('tmp_sbtsi.c'))
>> > >> > > diff --git a/hw/sensor/tmp_sbtsi.c b/hw/sensor/tmp_sbtsi.c
>> > >> > > new file mode 100644
>> > >> > > index 0000000000..b68c7ebf61
>> > >> > > --- /dev/null
>> > >> > > +++ b/hw/sensor/tmp_sbtsi.c
>> > >> > > @@ -0,0 +1,393 @@
>> > >> > > +/*
>> > >> > > + * AMD SBI Temperature Sensor Interface (SB-TSI)
>> > >> > > + *
>> > >> > > + * Copyright 2021 Google LLC
>> > >> > > + *
>> > >> > > + * This program is free software; you can redistribute it and/or
>> > >> modify it
>> > >> > > + * under the terms of the GNU General Public License as
>> published by
>> > >> the
>> > >> > > + * Free Software Foundation; either version 2 of the License, or
>> > >> > > + * (at your option) any later version.
>> > >> > > + *
>> > >> > > + * This program is distributed in the hope that it will be
>> useful,
>> > >> but
>> > >> > > WITHOUT
>> > >> > > + * ANY WARRANTY; without even the implied warranty of
>> > >> MERCHANTABILITY or
>> > >> > > + * FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public
>> > >> License
>> > >> > > + * for more details.
>> > >> > > + */
>> > >> > > +
>> > >> > > +#include "qemu/osdep.h"
>> > >> > > +#include "hw/i2c/smbus_slave.h"
>> > >> > > +#include "hw/irq.h"
>> > >> > > +#include "migration/vmstate.h"
>> > >> > > +#include "qapi/error.h"
>> > >> > > +#include "qapi/visitor.h"
>> > >> > > +#include "qemu/log.h"
>> > >> > > +#include "qemu/module.h"
>> > >> > > +#include "trace.h"
>> > >> > > +
>> > >> > > +#define TYPE_SBTSI "sbtsi"
>> > >> > > +#define SBTSI(obj) OBJECT_CHECK(SBTSIState, (obj), TYPE_SBTSI)
>> > >> > > +
>> > >> > > +/**
>> > >> > > + * SBTSIState:
>> > >> > > + * temperatures are in units of 0.125 degrees
>> > >> > > + * @temperature: Temperature
>> > >> > > + * @limit_low: Lowest temperature
>> > >> > > + * @limit_high: Highest temperature
>> > >> > > + * @status: The status register
>> > >> > > + * @config: The config register
>> > >> > > + * @alert_config: The config for alarm_l output.
>> > >> > > + * @addr: The address to read/write for the next cmd.
>> > >> > > + * @alarm: The alarm_l output pin (GPIO)
>> > >> > > + */
>> > >> > > +typedef struct SBTSIState {
>> > >> > > +    SMBusDevice parent;
>> > >> > > +
>> > >> > > +    uint32_t temperature;
>> > >> > > +    uint32_t limit_low;
>> > >> > > +    uint32_t limit_high;
>> > >> > > +    uint8_t status;
>> > >> > > +    uint8_t config;
>> > >> > > +    uint8_t alert_config;
>> > >> > > +    uint8_t addr;
>> > >> > > +    qemu_irq alarm;
>> > >> > > +} SBTSIState;
>> > >> > > +
>> > >> > > +/*
>> > >> > > + * SB-TSI registers only support SMBus byte data access. "_INT"
>> > >> registers
>> > >> > > are
>> > >> > > + * the integer part of a temperature value or limit, and "_DEC"
>> > >> registers
>> > >> > > are
>> > >> > > + * corresponding decimal parts.
>> > >> > > + */
>> > >> > > +#define SBTSI_REG_TEMP_INT      0x01 /* RO */
>> > >> > > +#define SBTSI_REG_STATUS        0x02 /* RO */
>> > >> > > +#define SBTSI_REG_CONFIG        0x03 /* RO */
>> > >> > > +#define SBTSI_REG_TEMP_HIGH_INT 0x07 /* RW */
>> > >> > > +#define SBTSI_REG_TEMP_LOW_INT  0x08 /* RW */
>> > >> > > +#define SBTSI_REG_CONFIG_WR     0x09 /* RW */
>> > >> > > +#define SBTSI_REG_TEMP_DEC      0x10 /* RO */
>> > >> > > +#define SBTSI_REG_TEMP_HIGH_DEC 0x13 /* RW */
>> > >> > > +#define SBTSI_REG_TEMP_LOW_DEC  0x14 /* RW */
>> > >> > > +#define SBTSI_REG_ALERT_CONFIG  0xBF /* RW */
>> > >> > > +#define SBTSI_REG_MAN           0xFE /* RO */
>> > >> > > +#define SBTSI_REG_REV           0xFF /* RO */
>> > >> > > +
>> > >> > > +#define SBTSI_STATUS_HIGH_ALERT BIT(4)
>> > >> > > +#define SBTSI_STATUS_LOW_ALERT  BIT(3)
>> > >> > > +#define SBTSI_CONFIG_ALERT_MASK BIT(7)
>> > >> > > +#define SBTSI_ALARM_EN          BIT(0)
>> > >> > > +
>> > >> > > +#define SBTSI_LIMIT_LOW_DEFAULT (0)
>> > >> > > +#define SBTSI_LIMIT_HIGH_DEFAULT (560)
>> > >> > > +#define SBTSI_MAN_DEFAULT (0)
>> > >> > > +#define SBTSI_REV_DEFAULT (4)
>> > >> > > +#define SBTSI_ALARM_L "alarm_l"
>> > >> > > +
>> > >> > > +/* The temperature we stored are in units of 0.125 degrees. */
>> > >> > > +#define SBTSI_TEMP_UNIT_IN_MILLIDEGREE 125
>> > >> > > +
>> > >> > > +/*
>> > >> > > + * The integer part and decimal of the temperature both 8 bits.
>> > >> > > + * Only the top 3 bits of the decimal parts are used.
>> > >> > > + * So the max temperature is (2^8-1) + (2^3-1)/8 = 255.875
>> degrees.
>> > >> > > + */
>> > >> > > +#define SBTSI_TEMP_MAX 255875
>> > >> > > +
>> > >> > > +/* The integer part of the temperature in terms of 0.125
>> degrees. */
>> > >> > > +static uint8_t get_temp_int(uint32_t temp)
>> > >> > > +{
>> > >> > > +    return temp >> 3;
>> > >> > > +}
>> > >> > > +
>> > >> > > +/*
>> > >> > > + * The decimal part of the temperature, in terms of 0.125
>> degrees.
>> > >> > > + * H/W store it in the top 3 bits so we shift it by 5.
>> > >> > > + */
>> > >> > > +static uint8_t get_temp_dec(uint32_t temp)
>> > >> > > +{
>> > >> > > +    return (temp & 0x7) << 5;
>> > >> > > +}
>> > >> > > +
>> > >> > > +/*
>> > >> > > + * Compute the temperature using the integer and decimal part,
>> > >> > > + * in terms of 0.125 degrees. The decimal part are only the top
>> 3
>> > >> bits
>> > >> > > + * so we shift it by 5 here.
>> > >> > > + */
>> > >> > > +static uint32_t compute_temp(uint8_t integer, uint8_t decimal)
>> > >> > > +{
>> > >> > > +    return (integer << 3) + (decimal >> 5);
>> > >> > > +}
>> > >> > > +
>> > >> > > +/* Compute new temp with new int part of the temperature. */
>> > >> > > +static uint32_t compute_temp_int(uint32_t temp, uint8_t integer)
>> > >> > > +{
>> > >> > > +    return compute_temp(integer, get_temp_dec(temp));
>> > >> > > +}
>> > >> > > +
>> > >> > > +/* Compute new temp with new dec part of the temperature. */
>> > >> > > +static uint32_t compute_temp_dec(uint32_t temp, uint8_t decimal)
>> > >> > > +{
>> > >> > > +    return compute_temp(get_temp_int(temp), decimal);
>> > >> > > +}
>> > >> > > +
>> > >> > > +/* The integer part of the temperature. */
>> > >> > > +static void sbtsi_update_status(SBTSIState *s)
>> > >> > > +{
>> > >> > > +    s->status = 0;
>> > >> > > +    if (s->alert_config & SBTSI_ALARM_EN) {
>> > >> > > +        if (s->temperature >= s->limit_high) {
>> > >> > > +            s->status |= SBTSI_STATUS_HIGH_ALERT;
>> > >> > > +        }
>> > >> > > +        if (s->temperature <= s->limit_low) {
>> > >> > > +            s->status |= SBTSI_STATUS_LOW_ALERT;
>> > >> > > +        }
>> > >> > > +    }
>> > >> > > +}
>> > >> > > +
>> > >> > > +static void sbtsi_update_alarm(SBTSIState *s)
>> > >> > > +{
>> > >> > > +    sbtsi_update_status(s);
>> > >> > > +    if (s->status != 0 && !(s->config &
>> SBTSI_CONFIG_ALERT_MASK)) {
>> > >> > > +        qemu_irq_raise(s->alarm);
>> > >> > > +    } else {
>> > >> > > +        qemu_irq_lower(s->alarm);
>> > >> > > +    }
>> > >> > > +}
>> > >> > > +
>> > >> > > +static uint8_t sbtsi_read_byte(SMBusDevice *d)
>> > >> > > +{
>> > >> > > +    SBTSIState *s = SBTSI(d);
>> > >> > > +    uint8_t data = 0;
>> > >> > > +
>> > >> > > +    switch (s->addr) {
>> > >> > > +    case SBTSI_REG_TEMP_INT:
>> > >> > > +        data = get_temp_int(s->temperature);
>> > >> > > +        break;
>> > >> > > +
>> > >> > > +    case SBTSI_REG_TEMP_DEC:
>> > >> > > +        data = get_temp_dec(s->temperature);
>> > >> > > +        break;
>> > >> > > +
>> > >> > > +    case SBTSI_REG_TEMP_HIGH_INT:
>> > >> > > +        data = get_temp_int(s->limit_high);
>> > >> > > +        break;
>> > >> > > +
>> > >> > > +    case SBTSI_REG_TEMP_LOW_INT:
>> > >> > > +        data = get_temp_int(s->limit_low);
>> > >> > > +        break;
>> > >> > > +
>> > >> > > +    case SBTSI_REG_TEMP_HIGH_DEC:
>> > >> > > +        data = get_temp_dec(s->limit_high);
>> > >> > > +        break;
>> > >> > > +
>> > >> > > +    case SBTSI_REG_TEMP_LOW_DEC:
>> > >> > > +        data = get_temp_dec(s->limit_low);
>> > >> > > +        break;
>> > >> > > +
>> > >> > > +    case SBTSI_REG_CONFIG:
>> > >> > > +    case SBTSI_REG_CONFIG_WR:
>> > >> > > +        data = s->config;
>> > >> > > +        break;
>> > >> > > +
>> > >> > > +    case SBTSI_REG_STATUS:
>> > >> > > +        sbtsi_update_alarm(s);
>> > >> > > +        data = s->status;
>> > >> > > +        break;
>> > >> > > +
>> > >> > > +    case SBTSI_REG_ALERT_CONFIG:
>> > >> > > +        data = s->alert_config;
>> > >> > > +        break;
>> > >> > > +
>> > >> > > +    case SBTSI_REG_MAN:
>> > >> > > +        data = SBTSI_MAN_DEFAULT;
>> > >> > > +        break;
>> > >> > > +
>> > >> > > +    case SBTSI_REG_REV:
>> > >> > > +        data = SBTSI_REV_DEFAULT;
>> > >> > > +        break;
>> > >>
>> > >> Does this device do some sort of auto-increment on the address when
>> > >> reading/writing?
>> > >>
>> > >
>> > > +Hao Wu <wuhaotsh@google.com>   - Please take a look at the above
>> > > question.  I imagine it's a while since you've thought about it, but
>> please
>> > > double check :)
>> > > Thanks!
>> > >
>> > >
>> > >> Other than that possible issue, I don't see anything else, it's
>> pretty
>> > >> straightforward.
>> > >>
>> > >> > > +
>> > >> > > +    default:
>> > >> > > +        qemu_log_mask(LOG_GUEST_ERROR,
>> > >> > > +                "%s: reading from invalid reg: 0x%02x\n",
>> > >> > > +                __func__, s->addr);
>> > >> > > +        break;
>> > >> > > +    }
>> > >> > > +
>> > >> > > +    trace_tmp_sbtsi_read_data(s->addr, data);
>> > >> > > +    return data;
>> > >> > > +}
>> > >> > > +
>> > >> > > +static void sbtsi_write(SBTSIState *s, uint8_t data)
>> > >> > > +{
>> > >> > > +    trace_tmp_sbtsi_write_data(s->addr, data);
>> > >> > > +    switch (s->addr) {
>> > >> > > +    case SBTSI_REG_CONFIG_WR:
>> > >> > > +        s->config = data;
>> > >> > > +        break;
>> > >> > > +
>> > >> > > +    case SBTSI_REG_TEMP_HIGH_INT:
>> > >> > > +        s->limit_high = compute_temp_int(s->limit_high, data);
>> > >> > > +        break;
>> > >> > > +
>> > >> > > +    case SBTSI_REG_TEMP_LOW_INT:
>> > >> > > +        s->limit_low = compute_temp_int(s->limit_low, data);
>> > >> > > +        break;
>> > >> > > +
>> > >> > > +    case SBTSI_REG_TEMP_HIGH_DEC:
>> > >> > > +        s->limit_high = compute_temp_dec(s->limit_high, data);
>> > >> > > +        break;
>> > >> > > +
>> > >> > > +    case SBTSI_REG_TEMP_LOW_DEC:
>> > >> > > +        s->limit_low = compute_temp_dec(s->limit_low, data);
>> > >> > > +        break;
>> > >> > > +
>> > >> > > +    case SBTSI_REG_ALERT_CONFIG:
>> > >> > > +        s->alert_config = data;
>> > >> > > +        break;
>> > >> > > +
>> > >> > > +    case SBTSI_REG_TEMP_INT:
>> > >> > > +    case SBTSI_REG_TEMP_DEC:
>> > >> > > +    case SBTSI_REG_CONFIG:
>> > >> > > +    case SBTSI_REG_STATUS:
>> > >> > > +    case SBTSI_REG_MAN:
>> > >> > > +    case SBTSI_REG_REV:
>> > >> > > +        qemu_log_mask(LOG_GUEST_ERROR,
>> > >> > > +                "%s: writing to read only reg: 0x%02x data:
>> > >> 0x%02x\n",
>> > >> > > +                __func__, s->addr, data);
>> > >> > > +        break;
>> > >> > > +
>> > >> > > +    default:
>> > >> > > +        qemu_log_mask(LOG_GUEST_ERROR,
>> > >> > > +                "%s: writing to invalid reg: 0x%02x data:
>> 0x%02x\n",
>> > >> > > +                __func__, s->addr, data);
>> > >> > > +        break;
>> > >> > > +    }
>> > >> > > +    sbtsi_update_alarm(s);
>> > >> > > +}
>> > >> > > +
>> > >> > > +static int sbtsi_write_data(SMBusDevice *d, uint8_t *buf,
>> uint8_t
>> > >> len)
>> > >> > > +{
>> > >> > > +    SBTSIState *s = SBTSI(d);
>> > >> > > +
>> > >> > > +    if (len == 0) {
>> > >> > > +        qemu_log_mask(LOG_GUEST_ERROR, "%s: writing empty
>> data\n",
>> > >> > > __func__);
>> > >> > > +        return -1;
>> > >> > > +    }
>> > >> > > +
>> > >> > > +    s->addr = buf[0];
>> > >> > > +    if (len > 1) {
>> > >> > > +        sbtsi_write(s, buf[1]);
>> > >> > > +        if (len > 2) {
>> > >> > > +            qemu_log_mask(LOG_GUEST_ERROR, "%s: extra data at
>> end\n",
>> > >> > > __func__);
>> > >> > > +        }
>> > >> > > +    }
>> > >> > > +    return 0;
>> > >> > > +}
>> > >> > > +
>> > >> > > +/* Units are millidegrees. */
>> > >> > > +static void sbtsi_get_temperature(Object *obj, Visitor *v,
>> const char
>> > >> > > *name,
>> > >> > > +                                  void *opaque, Error **errp)
>> > >> > > +{
>> > >> > > +    SBTSIState *s = SBTSI(obj);
>> > >> > > +    uint32_t temp = s->temperature *
>> SBTSI_TEMP_UNIT_IN_MILLIDEGREE;
>> > >> > > +
>> > >> > > +    visit_type_uint32(v, name, &temp, errp);
>> > >> > > +}
>> > >> > > +
>> > >> > > +/* Units are millidegrees. */
>> > >> > > +static void sbtsi_set_temperature(Object *obj, Visitor *v,
>> const char
>> > >> > > *name,
>> > >> > > +                                  void *opaque, Error **errp)
>> > >> > > +{
>> > >> > > +    SBTSIState *s = SBTSI(obj);
>> > >> > > +    uint32_t temp;
>> > >> > > +
>> > >> > > +    if (!visit_type_uint32(v, name, &temp, errp)) {
>> > >> > > +        return;
>> > >> > > +    }
>> > >> > > +    if (temp > SBTSI_TEMP_MAX) {
>> > >> > > +        error_setg(errp, "value %" PRIu32 ".%03" PRIu32 " C is
>> out of
>> > >> > > range",
>> > >> > > +                   temp / 1000, temp % 1000);
>> > >> > > +        return;
>> > >> > > +    }
>> > >> > > +
>> > >> > > +    s->temperature = temp / SBTSI_TEMP_UNIT_IN_MILLIDEGREE;
>> > >> > > +    sbtsi_update_alarm(s);
>> > >> > > +}
>> > >> > > +
>> > >> > > +static int sbtsi_post_load(void *opaque, int version_id)
>> > >> > > +{
>> > >> > > +    SBTSIState *s = opaque;
>> > >> > > +
>> > >> > > +    sbtsi_update_alarm(s);
>> > >> > > +    return 0;
>> > >> > > +}
>> > >> > > +
>> > >> > > +static const VMStateDescription vmstate_sbtsi = {
>> > >> > > +    .name = "SBTSI",
>> > >> > > +    .version_id = 0,
>> > >> > > +    .minimum_version_id = 0,
>> > >> > > +    .post_load = sbtsi_post_load,
>> > >> > > +    .fields = (VMStateField[]) {
>> > >> > > +        VMSTATE_UINT32(temperature, SBTSIState),
>> > >> > > +        VMSTATE_UINT32(limit_low, SBTSIState),
>> > >> > > +        VMSTATE_UINT32(limit_high, SBTSIState),
>> > >> > > +        VMSTATE_UINT8(config, SBTSIState),
>> > >> > > +        VMSTATE_UINT8(status, SBTSIState),
>> > >> > > +        VMSTATE_UINT8(addr, SBTSIState),
>> > >> > > +        VMSTATE_END_OF_LIST()
>> > >> > > +    }
>> > >> > > +};
>> > >> > > +
>> > >> > > +static void sbtsi_enter_reset(Object *obj, ResetType type)
>> > >> > > +{
>> > >> > > +    SBTSIState *s = SBTSI(obj);
>> > >> > > +
>> > >> > > +    s->config = 0;
>> > >> > > +    s->limit_low = SBTSI_LIMIT_LOW_DEFAULT;
>> > >> > > +    s->limit_high = SBTSI_LIMIT_HIGH_DEFAULT;
>> > >> > > +}
>> > >> > > +
>> > >> > > +static void sbtsi_hold_reset(Object *obj)
>> > >> > > +{
>> > >> > > +    SBTSIState *s = SBTSI(obj);
>> > >> > > +
>> > >> > > +    qemu_irq_lower(s->alarm);
>> > >> > > +}
>> > >> > > +
>> > >> > > +static void sbtsi_init(Object *obj)
>> > >> > > +{
>> > >> > > +    SBTSIState *s = SBTSI(obj);
>> > >> > > +
>> > >> > > +    /* Current temperature in millidegrees. */
>> > >> > > +    object_property_add(obj, "temperature", "uint32",
>> > >> > > +                        sbtsi_get_temperature,
>> sbtsi_set_temperature,
>> > >> > > +                        NULL, NULL);
>> > >> > > +    qdev_init_gpio_out_named(DEVICE(obj), &s->alarm,
>> SBTSI_ALARM_L,
>> > >> 0);
>> > >> > > +}
>> > >> > > +
>> > >> > > +static void sbtsi_class_init(ObjectClass *klass, void *data)
>> > >> > > +{
>> > >> > > +    ResettableClass *rc = RESETTABLE_CLASS(klass);
>> > >> > > +    DeviceClass *dc = DEVICE_CLASS(klass);
>> > >> > > +    SMBusDeviceClass *k = SMBUS_DEVICE_CLASS(klass);
>> > >> > > +
>> > >> > > +    dc->desc = "SB-TSI Temperature Sensor";
>> > >> > > +    dc->vmsd = &vmstate_sbtsi;
>> > >> > > +    k->write_data = sbtsi_write_data;
>> > >> > > +    k->receive_byte = sbtsi_read_byte;
>> > >> > > +    rc->phases.enter = sbtsi_enter_reset;
>> > >> > > +    rc->phases.hold = sbtsi_hold_reset;
>> > >> > > +}
>> > >> > > +
>> > >> > > +static const TypeInfo sbtsi_info = {
>> > >> > > +    .name          = TYPE_SBTSI,
>> > >> > > +    .parent        = TYPE_SMBUS_DEVICE,
>> > >> > > +    .instance_size = sizeof(SBTSIState),
>> > >> > > +    .instance_init = sbtsi_init,
>> > >> > > +    .class_init    = sbtsi_class_init,
>> > >> > > +};
>> > >> > > +
>> > >> > > +static void sbtsi_register_types(void)
>> > >> > > +{
>> > >> > > +    type_register_static(&sbtsi_info);
>> > >> > > +}
>> > >> > > +
>> > >> > > +type_init(sbtsi_register_types)
>> > >> > > diff --git a/hw/sensor/trace-events b/hw/sensor/trace-events
>> > >> > > new file mode 100644
>> > >> > > index 0000000000..21ab3809e2
>> > >> > > --- /dev/null
>> > >> > > +++ b/hw/sensor/trace-events
>> > >> > > @@ -0,0 +1,5 @@
>> > >> > > +# See docs/devel/tracing.rst for syntax documentation.
>> > >> > > +
>> > >> > > +# tmp_sbtsi.c
>> > >> > > +tmp_sbtsi_write_data(uint8_t addr, uint8_t value) "SBTSI write
>> > >> > > addr:0x%02x data: 0x%02x"
>> > >> > > +tmp_sbtsi_read_data(uint8_t addr, uint8_t value) "SBTSI read
>> > >> addr:0x%02x
>> > >> > > data: 0x%02x"
>> > >> > > diff --git a/hw/sensor/trace.h b/hw/sensor/trace.h
>> > >> > > new file mode 100644
>> > >> > > index 0000000000..e4721560b0
>> > >> > > --- /dev/null
>> > >> > > +++ b/hw/sensor/trace.h
>> > >> > > @@ -0,0 +1 @@
>> > >> > > +#include "trace/trace-hw_sensor.h"
>> > >> > > diff --git a/meson.build b/meson.build
>> > >> > > index 53065e96ec..f8ab0bf74e 100644
>> > >> > > --- a/meson.build
>> > >> > > +++ b/meson.build
>> > >> > > @@ -2494,6 +2494,7 @@ if have_system
>> > >> > >      'hw/rtc',
>> > >> > >      'hw/s390x',
>> > >> > >      'hw/scsi',
>> > >> > > +    'hw/sensor',
>> > >> > >      'hw/sd',
>> > >> > >      'hw/sh4',
>> > >> > >      'hw/sparc',
>> > >> > > diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
>> > >> > > index 37e1eaa449..d1a8c38f74 100644
>> > >> > > --- a/tests/qtest/meson.build
>> > >> > > +++ b/tests/qtest/meson.build
>> > >> > > @@ -254,6 +254,7 @@ qos_test_ss.add(
>> > >> > >    'spapr-phb-test.c',
>> > >> > >    'tmp105-test.c',
>> > >> > >    'emc141x-test.c',
>> > >> > > +  'tmp_sbtsi-test.c',
>> > >> > >    'usb-hcd-ohci-test.c',
>> > >> > >    'virtio-test.c',
>> > >> > >    'virtio-blk-test.c',
>> > >> > > diff --git a/tests/qtest/tmp_sbtsi-test.c
>> > >> b/tests/qtest/tmp_sbtsi-test.c
>> > >> > > new file mode 100644
>> > >> > > index 0000000000..7f5fafacc7
>> > >> > > --- /dev/null
>> > >> > > +++ b/tests/qtest/tmp_sbtsi-test.c
>> > >> > > @@ -0,0 +1,180 @@
>> > >> > > +/*
>> > >> > > + * QTests for the SBTSI temperature sensor
>> > >> > > + *
>> > >> > > + * Copyright 2020 Google LLC
>> > >> > > + *
>> > >> > > + * This program is free software; you can redistribute it and/or
>> > >> modify it
>> > >> > > + * under the terms of the GNU General Public License as
>> published by
>> > >> the
>> > >> > > + * Free Software Foundation; either version 2 of the License, or
>> > >> > > + * (at your option) any later version.
>> > >> > > + *
>> > >> > > + * This program is distributed in the hope that it will be
>> useful,
>> > >> but
>> > >> > > WITHOUT
>> > >> > > + * ANY WARRANTY; without even the implied warranty of
>> > >> MERCHANTABILITY or
>> > >> > > + * FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public
>> > >> License
>> > >> > > + * for more details.
>> > >> > > + */
>> > >> > > +
>> > >> > > +#include "qemu/osdep.h"
>> > >> > > +
>> > >> > > +#include "libqtest-single.h"
>> > >> > > +#include "libqos/qgraph.h"
>> > >> > > +#include "libqos/i2c.h"
>> > >> > > +#include "qapi/qmp/qdict.h"
>> > >> > > +#include "qemu/bitops.h"
>> > >> > > +
>> > >> > > +#define TEST_ID   "sbtsi-test"
>> > >> > > +#define TEST_ADDR (0x4c)
>> > >> > > +
>> > >> > > +/*
>> > >> > > + * SB-TSI registers only support SMBus byte data access. "_INT"
>> > >> registers
>> > >> > > are
>> > >> > > + * the integer part of a temperature value or limit, and "_DEC"
>> > >> registers
>> > >> > > are
>> > >> > > + * corresponding decimal parts.
>> > >> > > + */
>> > >> > > +#define REG_TEMP_INT      0x01 /* RO */
>> > >> > > +#define REG_STATUS        0x02 /* RO */
>> > >> > > +#define REG_CONFIG        0x03 /* RO */
>> > >> > > +#define REG_TEMP_HIGH_INT 0x07 /* RW */
>> > >> > > +#define REG_TEMP_LOW_INT  0x08 /* RW */
>> > >> > > +#define REG_CONFIG_WR     0x09 /* RW */
>> > >> > > +#define REG_TEMP_DEC      0x10 /* RO */
>> > >> > > +#define REG_TEMP_HIGH_DEC 0x13 /* RW */
>> > >> > > +#define REG_TEMP_LOW_DEC  0x14 /* RW */
>> > >> > > +#define REG_ALERT_CONFIG  0xBF /* RW */
>> > >> > > +
>> > >> > > +#define STATUS_HIGH_ALERT BIT(4)
>> > >> > > +#define STATUS_LOW_ALERT  BIT(3)
>> > >> > > +#define CONFIG_ALERT_MASK BIT(7)
>> > >> > > +#define ALARM_EN          BIT(0)
>> > >> > > +
>> > >> > > +/* The temperature stored are in units of 0.125 degrees. */
>> > >> > > +#define TEMP_UNIT_IN_MILLIDEGREE 125
>> > >> > > +#define LIMIT_LOW (10500)
>> > >> > > +#define LIMIT_HIGH (55125)
>> > >> > > +
>> > >> > > +static uint32_t qmp_sbtsi_get_temperature(const char *id)
>> > >> > > +{
>> > >> > > +    QDict *response;
>> > >> > > +    int ret;
>> > >> > > +
>> > >> > > +    response = qmp("{ 'execute': 'qom-get', 'arguments': {
>> 'path':
>> > >> %s, "
>> > >> > > +                   "'property': 'temperature' } }", id);
>> > >> > > +    g_assert(qdict_haskey(response, "return"));
>> > >> > > +    ret = (uint32_t)qdict_get_int(response, "return");
>> > >> > > +    qobject_unref(response);
>> > >> > > +    return ret;
>> > >> > > +}
>> > >> > > +
>> > >> > > +static void qmp_sbtsi_set_temperature(const char *id, uint32_t
>> value)
>> > >> > > +{
>> > >> > > +    QDict *response;
>> > >> > > +
>> > >> > > +    response = qmp("{ 'execute': 'qom-set', 'arguments': {
>> 'path':
>> > >> %s, "
>> > >> > > +                   "'property': 'temperature', 'value': %d }
>> }", id,
>> > >> > > value);
>> > >> > > +    g_assert(qdict_haskey(response, "return"));
>> > >> > > +    qobject_unref(response);
>> > >> > > +}
>> > >> > > +
>> > >> > > +/*
>> > >> > > + * Compute the temperature using the integer and decimal part
>> and
>> > >> return
>> > >> > > + * millidegrees. The decimal part are only the top 3 bits so we
>> > >> shift it
>> > >> > > by
>> > >> > > + * 5 here.
>> > >> > > + */
>> > >> > > +static uint32_t regs_to_temp(uint8_t integer, uint8_t decimal)
>> > >> > > +{
>> > >> > > +    return ((integer << 3) + (decimal >> 5)) *
>> > >> TEMP_UNIT_IN_MILLIDEGREE;
>> > >> > > +}
>> > >> > > +
>> > >> > > +/*
>> > >> > > + * Compute the integer and decimal parts of the temperature in
>> > >> > > millidegrees.
>> > >> > > + * H/W store the decimal in the top 3 bits so we shift it by 5.
>> > >> > > + */
>> > >> > > +static void temp_to_regs(uint32_t temp, uint8_t *integer,
>> uint8_t
>> > >> > > *decimal)
>> > >> > > +{
>> > >> > > +    temp /= TEMP_UNIT_IN_MILLIDEGREE;
>> > >> > > +    *integer = temp >> 3;
>> > >> > > +    *decimal = (temp & 0x7) << 5;
>> > >> > > +}
>> > >> > > +
>> > >> > > +static void tx_rx(void *obj, void *data, QGuestAllocator *alloc)
>> > >> > > +{
>> > >> > > +    uint16_t value;
>> > >> > > +    uint8_t integer, decimal;
>> > >> > > +    QI2CDevice *i2cdev = (QI2CDevice *)obj;
>> > >> > > +
>> > >> > > +    /* Test default values */
>> > >> > > +    value = qmp_sbtsi_get_temperature(TEST_ID);
>> > >> > > +    g_assert_cmpuint(value, ==, 0);
>> > >> > > +
>> > >> > > +    integer = i2c_get8(i2cdev, REG_TEMP_INT);
>> > >> > > +    decimal = i2c_get8(i2cdev, REG_TEMP_DEC);
>> > >> > > +    g_assert_cmpuint(regs_to_temp(integer, decimal), ==, 0);
>> > >> > > +
>> > >> > > +    /* Test setting temperature */
>> > >> > > +    qmp_sbtsi_set_temperature(TEST_ID, 20000);
>> > >> > > +    value = qmp_sbtsi_get_temperature(TEST_ID);
>> > >> > > +    g_assert_cmpuint(value, ==, 20000);
>> > >> > > +
>> > >> > > +    integer = i2c_get8(i2cdev, REG_TEMP_INT);
>> > >> > > +    decimal = i2c_get8(i2cdev, REG_TEMP_DEC);
>> > >> > > +    g_assert_cmpuint(regs_to_temp(integer, decimal), ==, 20000);
>> > >> > > +
>> > >> > > +    /* Set alert mask in config */
>> > >> > > +    i2c_set8(i2cdev, REG_CONFIG_WR, CONFIG_ALERT_MASK);
>> > >> > > +    value = i2c_get8(i2cdev, REG_CONFIG);
>> > >> > > +    g_assert_cmphex(value, ==, CONFIG_ALERT_MASK);
>> > >> > > +    /* Enable alarm_en */
>> > >> > > +    i2c_set8(i2cdev, REG_ALERT_CONFIG, ALARM_EN);
>> > >> > > +    value = i2c_get8(i2cdev, REG_ALERT_CONFIG);
>> > >> > > +    g_assert_cmphex(value, ==, ALARM_EN);
>> > >> > > +
>> > >> > > +    /* Test setting limits */
>> > >> > > +    /* Limit low = 10.500 */
>> > >> > > +    temp_to_regs(LIMIT_LOW, &integer, &decimal);
>> > >> > > +    i2c_set8(i2cdev, REG_TEMP_LOW_INT, integer);
>> > >> > > +    i2c_set8(i2cdev, REG_TEMP_LOW_DEC, decimal);
>> > >> > > +    integer = i2c_get8(i2cdev, REG_TEMP_LOW_INT);
>> > >> > > +    decimal = i2c_get8(i2cdev, REG_TEMP_LOW_DEC);
>> > >> > > +    g_assert_cmpuint(regs_to_temp(integer, decimal), ==,
>> LIMIT_LOW);
>> > >> > > +    /* Limit high = 55.125 */
>> > >> > > +    temp_to_regs(LIMIT_HIGH, &integer, &decimal);
>> > >> > > +    i2c_set8(i2cdev, REG_TEMP_HIGH_INT, integer);
>> > >> > > +    i2c_set8(i2cdev, REG_TEMP_HIGH_DEC, decimal);
>> > >> > > +    integer = i2c_get8(i2cdev, REG_TEMP_HIGH_INT);
>> > >> > > +    decimal = i2c_get8(i2cdev, REG_TEMP_HIGH_DEC);
>> > >> > > +    g_assert_cmpuint(regs_to_temp(integer, decimal), ==,
>> LIMIT_HIGH);
>> > >> > > +    /* No alert is generated. */
>> > >> > > +    value = i2c_get8(i2cdev, REG_STATUS);
>> > >> > > +    g_assert_cmphex(value, ==, 0);
>> > >> > > +
>> > >> > > +    /* Test alert for low temperature */
>> > >> > > +    qmp_sbtsi_set_temperature(TEST_ID, LIMIT_LOW);
>> > >> > > +    value = i2c_get8(i2cdev, REG_STATUS);
>> > >> > > +    g_assert_cmphex(value, ==, STATUS_LOW_ALERT);
>> > >> > > +
>> > >> > > +    /* Test alert for high temperature */
>> > >> > > +    qmp_sbtsi_set_temperature(TEST_ID, LIMIT_HIGH);
>> > >> > > +    value = i2c_get8(i2cdev, REG_STATUS);
>> > >> > > +    g_assert_cmphex(value, ==, STATUS_HIGH_ALERT);
>> > >> > > +
>> > >> > > +    /* Disable alarm_en */
>> > >> > > +    i2c_set8(i2cdev, REG_ALERT_CONFIG, 0);
>> > >> > > +    value = i2c_get8(i2cdev, REG_ALERT_CONFIG);
>> > >> > > +    g_assert_cmphex(value, ==, 0);
>> > >> > > +    /* No alert when alarm_en is false. */
>> > >> > > +    value = i2c_get8(i2cdev, REG_STATUS);
>> > >> > > +    g_assert_cmphex(value, ==, 0);
>> > >> > > +}
>> > >> > > +
>> > >> > > +static void sbtsi_register_nodes(void)
>> > >> > > +{
>> > >> > > +    QOSGraphEdgeOptions opts = {
>> > >> > > +        .extra_device_opts = "id=" TEST_ID ",address=0x4c"
>> > >> > > +    };
>> > >> > > +    add_qi2c_address(&opts, &(QI2CAddress) { TEST_ADDR });
>> > >> > > +
>> > >> > > +    qos_node_create_driver("sbtsi", i2c_device_create);
>> > >> > > +    qos_node_consumes("sbtsi", "i2c-bus", &opts);
>> > >> > > +
>> > >> > > +    qos_add_test("tx-rx", "sbtsi", tx_rx, NULL);
>> > >> > > +}
>> > >> > > +libqos_init(sbtsi_register_nodes);
>> > >> > > --
>> > >> >
>> > >> >
>> > >> > + Corey for i2c maintainer.  The new sensor directory is mostly if
>> not
>> > >> > entirely i2c devices.  I didn't create a maintainer entry for this
>> i2c
>> > >> > device, but I can if desired and send out a v2.
>> > >>
>> > >> Yeah, I guess I should be maintainer there.  I'll queue up a change
>> for
>> > >> that.  Thanks.
>> > >>
>> > >> -corey
>> > >>
>> > >> >
>> > >> >
>> > >> > > 2.34.1.575.g55b058a8bb-goog
>> > >> > >
>> > >> > >
>> > >>
>> > >
>>
>

--000000000000c10c8505d6988a53
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Jan 27, 2022 at 10:20 AM Hao =
Wu &lt;<a href=3D"mailto:wuhaotsh@google.com">wuhaotsh@google.com</a>&gt; w=
rote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=
=3D"ltr"><div dir=3D"ltr"></div><br><div class=3D"gmail_quote"><div dir=3D"=
ltr" class=3D"gmail_attr">On Thu, Jan 27, 2022 at 6:55 AM Corey Minyard &lt=
;<a href=3D"mailto:cminyard@mvista.com" target=3D"_blank">cminyard@mvista.c=
om</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">On Wed, Jan 26, 2022 at 04:09:03PM -0800, Hao Wu wrote:<br>
&gt; Hi,<br>
&gt; <br>
&gt; Sorry for the late reply. I&#39;m not sure what &quot;auto-increment&q=
uot; means here.<br>
<br>
The question is: When a value is read, does the address automatically<br>
increment.=C2=A0 I2C devices very often do this.=C2=A0 If you do a multi-by=
te<br>
read, they often will read the value from address 0, then from address<br>
1, etc.=C2=A0 Same for writes.<br></blockquote><div>The datasheet does not =
suggest such behavior could happen.=C2=A0</div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,2=
04);padding-left:1ex">
<br>
&gt; The kernel driver at<br>
&gt; <a href=3D"https://lkml.org/lkml/2020/12/11/968" rel=3D"noreferrer" ta=
rget=3D"_blank">https://lkml.org/lkml/2020/12/11/968</a><br>
&gt; only has byte-size read/write operations, so I don&#39;t see a problem=
 here.<br>
&gt; The values are extracted<br>
&gt; from the datasheet.<br>
<br>
The *Linux* kernel driver my only do byte-size operations, but other<br>
kernels may work different, and the Linux kernel may change.=C2=A0 You have=
<br>
to implement from the datasheet, not the device driver.<br></blockquote><di=
v>The implementation is already according to the datasheet.</div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px s=
olid rgb(204,204,204);padding-left:1ex">
Thanks,<br>
<br>
-corey<br>
<br></blockquote></div></div></blockquote><div><br></div><div>I have to sen=
d out a new patchset to include my signature block since I&#39;m sending a =
patch Hao wrote.=C2=A0 Laurent pointed this out to me in a different patch =
series.</div><div><br></div><div>From this exchange, I don&#39;t think ther=
e are other changes for v2.=C2=A0 Please let me know if that&#39;s false.</=
div><div><br></div><div>Thanks,</div><div>Patrick</div><div>=C2=A0</div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div class=
=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
&gt; <br>
&gt; On Tue, Jan 18, 2022 at 9:10 AM Patrick Venture &lt;<a href=3D"mailto:=
venture@google.com" target=3D"_blank">venture@google.com</a>&gt; wrote:<br>
&gt; <br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; On Mon, Jan 17, 2022 at 6:05 AM Corey Minyard &lt;<a href=3D"mail=
to:cminyard@mvista.com" target=3D"_blank">cminyard@mvista.com</a>&gt; wrote=
:<br>
&gt; &gt;<br>
&gt; &gt;&gt; On Sun, Jan 09, 2022 at 06:17:34PM -0800, Patrick Venture wro=
te:<br>
&gt; &gt;&gt; &gt; On Fri, Jan 7, 2022 at 7:04 PM Patrick Venture &lt;<a hr=
ef=3D"mailto:venture@google.com" target=3D"_blank">venture@google.com</a>&g=
t;<br>
&gt; &gt;&gt; wrote:<br>
&gt; &gt;&gt; &gt;<br>
&gt; &gt;&gt; &gt; &gt; From: Hao Wu &lt;<a href=3D"mailto:wuhaotsh@google.=
com" target=3D"_blank">wuhaotsh@google.com</a>&gt;<br>
&gt; &gt;&gt; &gt; &gt;<br>
&gt; &gt;&gt; &gt; &gt; SB Temperature Sensor Interface (SB-TSI) is an SMBu=
s compatible<br>
&gt; &gt;&gt; &gt; &gt; interface that reports AMD SoC&#39;s Ttcl (normaliz=
ed temperature),<br>
&gt; &gt;&gt; &gt; &gt; and resembles a typical 8-pin remote temperature se=
nsor&#39;s I2C<br>
&gt; &gt;&gt; interface<br>
&gt; &gt;&gt; &gt; &gt; to BMC.<br>
&gt; &gt;&gt; &gt; &gt;<br>
&gt; &gt;&gt; &gt; &gt; This patch implements a basic AMD SB-TSI sensor tha=
t is<br>
&gt; &gt;&gt; &gt; &gt; compatible with the open-source data sheet from AMD=
 and Linux<br>
&gt; &gt;&gt; &gt; &gt; kernel driver.<br>
&gt; &gt;&gt; &gt; &gt;<br>
&gt; &gt;&gt; &gt; &gt; Reference:<br>
&gt; &gt;&gt; &gt; &gt; Linux kernel driver:<br>
&gt; &gt;&gt; &gt; &gt; <a href=3D"https://lkml.org/lkml/2020/12/11/968" re=
l=3D"noreferrer" target=3D"_blank">https://lkml.org/lkml/2020/12/11/968</a>=
<br>
&gt; &gt;&gt; &gt; &gt; Register Map:<br>
&gt; &gt;&gt; &gt; &gt; <a href=3D"https://developer.amd.com/wp-content/res=
ources/56255_3_03.PDF" rel=3D"noreferrer" target=3D"_blank">https://develop=
er.amd.com/wp-content/resources/56255_3_03.PDF</a><br>
&gt; &gt;&gt; &gt; &gt; (Chapter 6)<br>
&gt; &gt;&gt; &gt; &gt;<br>
&gt; &gt;&gt; &gt; &gt; Signed-off-by: Hao Wu &lt;<a href=3D"mailto:wuhaots=
h@google.com" target=3D"_blank">wuhaotsh@google.com</a>&gt;<br>
&gt; &gt;&gt; &gt; &gt; Reviewed-by: Doug Evans &lt;<a href=3D"mailto:dje@g=
oogle.com" target=3D"_blank">dje@google.com</a>&gt;<br>
&gt; &gt;&gt; &gt; &gt; ---<br>
&gt; &gt;&gt; &gt; &gt;=C2=A0 hw/sensor/Kconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 =C2=A04 +<br>
&gt; &gt;&gt; &gt; &gt;=C2=A0 hw/sensor/meson.build=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 =C2=A01 +<br>
&gt; &gt;&gt; &gt; &gt;=C2=A0 hw/sensor/tmp_sbtsi.c=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 | 393<br>
&gt; &gt;&gt; +++++++++++++++++++++++++++++++++++<br>
&gt; &gt;&gt; &gt; &gt;=C2=A0 hw/sensor/trace-events=C2=A0 =C2=A0 =C2=A0 =
=C2=A0|=C2=A0 =C2=A05 +<br>
&gt; &gt;&gt; &gt; &gt;=C2=A0 hw/sensor/trace.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 =C2=A01 +<br>
&gt; &gt;&gt; &gt; &gt;=C2=A0 meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A01 +<br>
&gt; &gt;&gt; &gt; &gt;=C2=A0 tests/qtest/meson.build=C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 =C2=A01 +<br>
&gt; &gt;&gt; &gt; &gt;=C2=A0 tests/qtest/tmp_sbtsi-test.c | 180 ++++++++++=
++++++<br>
&gt; &gt;&gt; &gt; &gt;=C2=A0 8 files changed, 586 insertions(+)<br>
&gt; &gt;&gt; &gt; &gt;=C2=A0 create mode 100644 hw/sensor/tmp_sbtsi.c<br>
&gt; &gt;&gt; &gt; &gt;=C2=A0 create mode 100644 hw/sensor/trace-events<br>
&gt; &gt;&gt; &gt; &gt;=C2=A0 create mode 100644 hw/sensor/trace.h<br>
&gt; &gt;&gt; &gt; &gt;=C2=A0 create mode 100644 tests/qtest/tmp_sbtsi-test=
.c<br>
&gt; &gt;&gt; &gt; &gt;<br>
&gt; &gt;&gt; &gt; &gt; diff --git a/hw/sensor/Kconfig b/hw/sensor/Kconfig<=
br>
&gt; &gt;&gt; &gt; &gt; index 9c8a049b06..27f6f79c84 100644<br>
&gt; &gt;&gt; &gt; &gt; --- a/hw/sensor/Kconfig<br>
&gt; &gt;&gt; &gt; &gt; +++ b/hw/sensor/Kconfig<br>
&gt; &gt;&gt; &gt; &gt; @@ -21,3 +21,7 @@ config ADM1272<br>
&gt; &gt;&gt; &gt; &gt;=C2=A0 config MAX34451<br>
&gt; &gt;&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 bool<br>
&gt; &gt;&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 depends on I2C<br>
&gt; &gt;&gt; &gt; &gt; +<br>
&gt; &gt;&gt; &gt; &gt; +config AMDSBTSI<br>
&gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 bool<br>
&gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 depends on I2C<br>
&gt; &gt;&gt; &gt; &gt; diff --git a/hw/sensor/meson.build b/hw/sensor/meso=
n.build<br>
&gt; &gt;&gt; &gt; &gt; index 059c4ca935..f7b0e645eb 100644<br>
&gt; &gt;&gt; &gt; &gt; --- a/hw/sensor/meson.build<br>
&gt; &gt;&gt; &gt; &gt; +++ b/hw/sensor/meson.build<br>
&gt; &gt;&gt; &gt; &gt; @@ -4,3 +4,4 @@ softmmu_ss.add(when: &#39;CONFIG_DP=
S310&#39;, if_true:<br>
&gt; &gt;&gt; &gt; &gt; files(&#39;dps310.c&#39;))<br>
&gt; &gt;&gt; &gt; &gt;=C2=A0 softmmu_ss.add(when: &#39;CONFIG_EMC141X&#39;=
, if_true: files(&#39;emc141x.c&#39;))<br>
&gt; &gt;&gt; &gt; &gt;=C2=A0 softmmu_ss.add(when: &#39;CONFIG_ADM1272&#39;=
, if_true: files(&#39;adm1272.c&#39;))<br>
&gt; &gt;&gt; &gt; &gt;=C2=A0 softmmu_ss.add(when: &#39;CONFIG_MAX34451&#39=
;, if_true: files(&#39;max34451.c&#39;))<br>
&gt; &gt;&gt; &gt; &gt; +softmmu_ss.add(when: &#39;CONFIG_AMDSBTSI&#39;, if=
_true:<br>
&gt; &gt;&gt; files(&#39;tmp_sbtsi.c&#39;))<br>
&gt; &gt;&gt; &gt; &gt; diff --git a/hw/sensor/tmp_sbtsi.c b/hw/sensor/tmp_=
sbtsi.c<br>
&gt; &gt;&gt; &gt; &gt; new file mode 100644<br>
&gt; &gt;&gt; &gt; &gt; index 0000000000..b68c7ebf61<br>
&gt; &gt;&gt; &gt; &gt; --- /dev/null<br>
&gt; &gt;&gt; &gt; &gt; +++ b/hw/sensor/tmp_sbtsi.c<br>
&gt; &gt;&gt; &gt; &gt; @@ -0,0 +1,393 @@<br>
&gt; &gt;&gt; &gt; &gt; +/*<br>
&gt; &gt;&gt; &gt; &gt; + * AMD SBI Temperature Sensor Interface (SB-TSI)<b=
r>
&gt; &gt;&gt; &gt; &gt; + *<br>
&gt; &gt;&gt; &gt; &gt; + * Copyright 2021 Google LLC<br>
&gt; &gt;&gt; &gt; &gt; + *<br>
&gt; &gt;&gt; &gt; &gt; + * This program is free software; you can redistri=
bute it and/or<br>
&gt; &gt;&gt; modify it<br>
&gt; &gt;&gt; &gt; &gt; + * under the terms of the GNU General Public Licen=
se as published by<br>
&gt; &gt;&gt; the<br>
&gt; &gt;&gt; &gt; &gt; + * Free Software Foundation; either version 2 of t=
he License, or<br>
&gt; &gt;&gt; &gt; &gt; + * (at your option) any later version.<br>
&gt; &gt;&gt; &gt; &gt; + *<br>
&gt; &gt;&gt; &gt; &gt; + * This program is distributed in the hope that it=
 will be useful,<br>
&gt; &gt;&gt; but<br>
&gt; &gt;&gt; &gt; &gt; WITHOUT<br>
&gt; &gt;&gt; &gt; &gt; + * ANY WARRANTY; without even the implied warranty=
 of<br>
&gt; &gt;&gt; MERCHANTABILITY or<br>
&gt; &gt;&gt; &gt; &gt; + * FITNESS FOR A PARTICULAR PURPOSE. See the GNU G=
eneral Public<br>
&gt; &gt;&gt; License<br>
&gt; &gt;&gt; &gt; &gt; + * for more details.<br>
&gt; &gt;&gt; &gt; &gt; + */<br>
&gt; &gt;&gt; &gt; &gt; +<br>
&gt; &gt;&gt; &gt; &gt; +#include &quot;qemu/osdep.h&quot;<br>
&gt; &gt;&gt; &gt; &gt; +#include &quot;hw/i2c/smbus_slave.h&quot;<br>
&gt; &gt;&gt; &gt; &gt; +#include &quot;hw/irq.h&quot;<br>
&gt; &gt;&gt; &gt; &gt; +#include &quot;migration/vmstate.h&quot;<br>
&gt; &gt;&gt; &gt; &gt; +#include &quot;qapi/error.h&quot;<br>
&gt; &gt;&gt; &gt; &gt; +#include &quot;qapi/visitor.h&quot;<br>
&gt; &gt;&gt; &gt; &gt; +#include &quot;qemu/log.h&quot;<br>
&gt; &gt;&gt; &gt; &gt; +#include &quot;qemu/module.h&quot;<br>
&gt; &gt;&gt; &gt; &gt; +#include &quot;trace.h&quot;<br>
&gt; &gt;&gt; &gt; &gt; +<br>
&gt; &gt;&gt; &gt; &gt; +#define TYPE_SBTSI &quot;sbtsi&quot;<br>
&gt; &gt;&gt; &gt; &gt; +#define SBTSI(obj) OBJECT_CHECK(SBTSIState, (obj),=
 TYPE_SBTSI)<br>
&gt; &gt;&gt; &gt; &gt; +<br>
&gt; &gt;&gt; &gt; &gt; +/**<br>
&gt; &gt;&gt; &gt; &gt; + * SBTSIState:<br>
&gt; &gt;&gt; &gt; &gt; + * temperatures are in units of 0.125 degrees<br>
&gt; &gt;&gt; &gt; &gt; + * @temperature: Temperature<br>
&gt; &gt;&gt; &gt; &gt; + * @limit_low: Lowest temperature<br>
&gt; &gt;&gt; &gt; &gt; + * @limit_high: Highest temperature<br>
&gt; &gt;&gt; &gt; &gt; + * @status: The status register<br>
&gt; &gt;&gt; &gt; &gt; + * @config: The config register<br>
&gt; &gt;&gt; &gt; &gt; + * @alert_config: The config for alarm_l output.<b=
r>
&gt; &gt;&gt; &gt; &gt; + * @addr: The address to read/write for the next c=
md.<br>
&gt; &gt;&gt; &gt; &gt; + * @alarm: The alarm_l output pin (GPIO)<br>
&gt; &gt;&gt; &gt; &gt; + */<br>
&gt; &gt;&gt; &gt; &gt; +typedef struct SBTSIState {<br>
&gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 SMBusDevice parent;<br>
&gt; &gt;&gt; &gt; &gt; +<br>
&gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 uint32_t temperature;<br>
&gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 uint32_t limit_low;<br>
&gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 uint32_t limit_high;<br>
&gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 uint8_t status;<br>
&gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 uint8_t config;<br>
&gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 uint8_t alert_config;<br>
&gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 uint8_t addr;<br>
&gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 qemu_irq alarm;<br>
&gt; &gt;&gt; &gt; &gt; +} SBTSIState;<br>
&gt; &gt;&gt; &gt; &gt; +<br>
&gt; &gt;&gt; &gt; &gt; +/*<br>
&gt; &gt;&gt; &gt; &gt; + * SB-TSI registers only support SMBus byte data a=
ccess. &quot;_INT&quot;<br>
&gt; &gt;&gt; registers<br>
&gt; &gt;&gt; &gt; &gt; are<br>
&gt; &gt;&gt; &gt; &gt; + * the integer part of a temperature value or limi=
t, and &quot;_DEC&quot;<br>
&gt; &gt;&gt; registers<br>
&gt; &gt;&gt; &gt; &gt; are<br>
&gt; &gt;&gt; &gt; &gt; + * corresponding decimal parts.<br>
&gt; &gt;&gt; &gt; &gt; + */<br>
&gt; &gt;&gt; &gt; &gt; +#define SBTSI_REG_TEMP_INT=C2=A0 =C2=A0 =C2=A0 0x0=
1 /* RO */<br>
&gt; &gt;&gt; &gt; &gt; +#define SBTSI_REG_STATUS=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 0x02 /* RO */<br>
&gt; &gt;&gt; &gt; &gt; +#define SBTSI_REG_CONFIG=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 0x03 /* RO */<br>
&gt; &gt;&gt; &gt; &gt; +#define SBTSI_REG_TEMP_HIGH_INT 0x07 /* RW */<br>
&gt; &gt;&gt; &gt; &gt; +#define SBTSI_REG_TEMP_LOW_INT=C2=A0 0x08 /* RW */=
<br>
&gt; &gt;&gt; &gt; &gt; +#define SBTSI_REG_CONFIG_WR=C2=A0 =C2=A0 =C2=A00x0=
9 /* RW */<br>
&gt; &gt;&gt; &gt; &gt; +#define SBTSI_REG_TEMP_DEC=C2=A0 =C2=A0 =C2=A0 0x1=
0 /* RO */<br>
&gt; &gt;&gt; &gt; &gt; +#define SBTSI_REG_TEMP_HIGH_DEC 0x13 /* RW */<br>
&gt; &gt;&gt; &gt; &gt; +#define SBTSI_REG_TEMP_LOW_DEC=C2=A0 0x14 /* RW */=
<br>
&gt; &gt;&gt; &gt; &gt; +#define SBTSI_REG_ALERT_CONFIG=C2=A0 0xBF /* RW */=
<br>
&gt; &gt;&gt; &gt; &gt; +#define SBTSI_REG_MAN=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A00xFE /* RO */<br>
&gt; &gt;&gt; &gt; &gt; +#define SBTSI_REG_REV=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A00xFF /* RO */<br>
&gt; &gt;&gt; &gt; &gt; +<br>
&gt; &gt;&gt; &gt; &gt; +#define SBTSI_STATUS_HIGH_ALERT BIT(4)<br>
&gt; &gt;&gt; &gt; &gt; +#define SBTSI_STATUS_LOW_ALERT=C2=A0 BIT(3)<br>
&gt; &gt;&gt; &gt; &gt; +#define SBTSI_CONFIG_ALERT_MASK BIT(7)<br>
&gt; &gt;&gt; &gt; &gt; +#define SBTSI_ALARM_EN=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 BIT(0)<br>
&gt; &gt;&gt; &gt; &gt; +<br>
&gt; &gt;&gt; &gt; &gt; +#define SBTSI_LIMIT_LOW_DEFAULT (0)<br>
&gt; &gt;&gt; &gt; &gt; +#define SBTSI_LIMIT_HIGH_DEFAULT (560)<br>
&gt; &gt;&gt; &gt; &gt; +#define SBTSI_MAN_DEFAULT (0)<br>
&gt; &gt;&gt; &gt; &gt; +#define SBTSI_REV_DEFAULT (4)<br>
&gt; &gt;&gt; &gt; &gt; +#define SBTSI_ALARM_L &quot;alarm_l&quot;<br>
&gt; &gt;&gt; &gt; &gt; +<br>
&gt; &gt;&gt; &gt; &gt; +/* The temperature we stored are in units of 0.125=
 degrees. */<br>
&gt; &gt;&gt; &gt; &gt; +#define SBTSI_TEMP_UNIT_IN_MILLIDEGREE 125<br>
&gt; &gt;&gt; &gt; &gt; +<br>
&gt; &gt;&gt; &gt; &gt; +/*<br>
&gt; &gt;&gt; &gt; &gt; + * The integer part and decimal of the temperature=
 both 8 bits.<br>
&gt; &gt;&gt; &gt; &gt; + * Only the top 3 bits of the decimal parts are us=
ed.<br>
&gt; &gt;&gt; &gt; &gt; + * So the max temperature is (2^8-1) + (2^3-1)/8 =
=3D 255.875 degrees.<br>
&gt; &gt;&gt; &gt; &gt; + */<br>
&gt; &gt;&gt; &gt; &gt; +#define SBTSI_TEMP_MAX 255875<br>
&gt; &gt;&gt; &gt; &gt; +<br>
&gt; &gt;&gt; &gt; &gt; +/* The integer part of the temperature in terms of=
 0.125 degrees. */<br>
&gt; &gt;&gt; &gt; &gt; +static uint8_t get_temp_int(uint32_t temp)<br>
&gt; &gt;&gt; &gt; &gt; +{<br>
&gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 return temp &gt;&gt; 3;<br>
&gt; &gt;&gt; &gt; &gt; +}<br>
&gt; &gt;&gt; &gt; &gt; +<br>
&gt; &gt;&gt; &gt; &gt; +/*<br>
&gt; &gt;&gt; &gt; &gt; + * The decimal part of the temperature, in terms o=
f 0.125 degrees.<br>
&gt; &gt;&gt; &gt; &gt; + * H/W store it in the top 3 bits so we shift it b=
y 5.<br>
&gt; &gt;&gt; &gt; &gt; + */<br>
&gt; &gt;&gt; &gt; &gt; +static uint8_t get_temp_dec(uint32_t temp)<br>
&gt; &gt;&gt; &gt; &gt; +{<br>
&gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 return (temp &amp; 0x7) &lt;&lt; 5;<=
br>
&gt; &gt;&gt; &gt; &gt; +}<br>
&gt; &gt;&gt; &gt; &gt; +<br>
&gt; &gt;&gt; &gt; &gt; +/*<br>
&gt; &gt;&gt; &gt; &gt; + * Compute the temperature using the integer and d=
ecimal part,<br>
&gt; &gt;&gt; &gt; &gt; + * in terms of 0.125 degrees. The decimal part are=
 only the top 3<br>
&gt; &gt;&gt; bits<br>
&gt; &gt;&gt; &gt; &gt; + * so we shift it by 5 here.<br>
&gt; &gt;&gt; &gt; &gt; + */<br>
&gt; &gt;&gt; &gt; &gt; +static uint32_t compute_temp(uint8_t integer, uint=
8_t decimal)<br>
&gt; &gt;&gt; &gt; &gt; +{<br>
&gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 return (integer &lt;&lt; 3) + (decim=
al &gt;&gt; 5);<br>
&gt; &gt;&gt; &gt; &gt; +}<br>
&gt; &gt;&gt; &gt; &gt; +<br>
&gt; &gt;&gt; &gt; &gt; +/* Compute new temp with new int part of the tempe=
rature. */<br>
&gt; &gt;&gt; &gt; &gt; +static uint32_t compute_temp_int(uint32_t temp, ui=
nt8_t integer)<br>
&gt; &gt;&gt; &gt; &gt; +{<br>
&gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 return compute_temp(integer, get_tem=
p_dec(temp));<br>
&gt; &gt;&gt; &gt; &gt; +}<br>
&gt; &gt;&gt; &gt; &gt; +<br>
&gt; &gt;&gt; &gt; &gt; +/* Compute new temp with new dec part of the tempe=
rature. */<br>
&gt; &gt;&gt; &gt; &gt; +static uint32_t compute_temp_dec(uint32_t temp, ui=
nt8_t decimal)<br>
&gt; &gt;&gt; &gt; &gt; +{<br>
&gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 return compute_temp(get_temp_int(tem=
p), decimal);<br>
&gt; &gt;&gt; &gt; &gt; +}<br>
&gt; &gt;&gt; &gt; &gt; +<br>
&gt; &gt;&gt; &gt; &gt; +/* The integer part of the temperature. */<br>
&gt; &gt;&gt; &gt; &gt; +static void sbtsi_update_status(SBTSIState *s)<br>
&gt; &gt;&gt; &gt; &gt; +{<br>
&gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 s-&gt;status =3D 0;<br>
&gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 if (s-&gt;alert_config &amp; SBTSI_A=
LARM_EN) {<br>
&gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (s-&gt;temperature =
&gt;=3D s-&gt;limit_high) {<br>
&gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;st=
atus |=3D SBTSI_STATUS_HIGH_ALERT;<br>
&gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (s-&gt;temperature =
&lt;=3D s-&gt;limit_low) {<br>
&gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;st=
atus |=3D SBTSI_STATUS_LOW_ALERT;<br>
&gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 }<br>
&gt; &gt;&gt; &gt; &gt; +}<br>
&gt; &gt;&gt; &gt; &gt; +<br>
&gt; &gt;&gt; &gt; &gt; +static void sbtsi_update_alarm(SBTSIState *s)<br>
&gt; &gt;&gt; &gt; &gt; +{<br>
&gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 sbtsi_update_status(s);<br>
&gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 if (s-&gt;status !=3D 0 &amp;&amp; !=
(s-&gt;config &amp; SBTSI_CONFIG_ALERT_MASK)) {<br>
&gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_irq_raise(s-&gt;a=
larm);<br>
&gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 } else {<br>
&gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_irq_lower(s-&gt;a=
larm);<br>
&gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 }<br>
&gt; &gt;&gt; &gt; &gt; +}<br>
&gt; &gt;&gt; &gt; &gt; +<br>
&gt; &gt;&gt; &gt; &gt; +static uint8_t sbtsi_read_byte(SMBusDevice *d)<br>
&gt; &gt;&gt; &gt; &gt; +{<br>
&gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 SBTSIState *s =3D SBTSI(d);<br>
&gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 uint8_t data =3D 0;<br>
&gt; &gt;&gt; &gt; &gt; +<br>
&gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 switch (s-&gt;addr) {<br>
&gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 case SBTSI_REG_TEMP_INT:<br>
&gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 data =3D get_temp_int(=
s-&gt;temperature);<br>
&gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; &gt;&gt; &gt; &gt; +<br>
&gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 case SBTSI_REG_TEMP_DEC:<br>
&gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 data =3D get_temp_dec(=
s-&gt;temperature);<br>
&gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; &gt;&gt; &gt; &gt; +<br>
&gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 case SBTSI_REG_TEMP_HIGH_INT:<br>
&gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 data =3D get_temp_int(=
s-&gt;limit_high);<br>
&gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; &gt;&gt; &gt; &gt; +<br>
&gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 case SBTSI_REG_TEMP_LOW_INT:<br>
&gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 data =3D get_temp_int(=
s-&gt;limit_low);<br>
&gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; &gt;&gt; &gt; &gt; +<br>
&gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 case SBTSI_REG_TEMP_HIGH_DEC:<br>
&gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 data =3D get_temp_dec(=
s-&gt;limit_high);<br>
&gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; &gt;&gt; &gt; &gt; +<br>
&gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 case SBTSI_REG_TEMP_LOW_DEC:<br>
&gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 data =3D get_temp_dec(=
s-&gt;limit_low);<br>
&gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; &gt;&gt; &gt; &gt; +<br>
&gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 case SBTSI_REG_CONFIG:<br>
&gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 case SBTSI_REG_CONFIG_WR:<br>
&gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 data =3D s-&gt;config;=
<br>
&gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; &gt;&gt; &gt; &gt; +<br>
&gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 case SBTSI_REG_STATUS:<br>
&gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 sbtsi_update_alarm(s);=
<br>
&gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 data =3D s-&gt;status;=
<br>
&gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; &gt;&gt; &gt; &gt; +<br>
&gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 case SBTSI_REG_ALERT_CONFIG:<br>
&gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 data =3D s-&gt;alert_c=
onfig;<br>
&gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; &gt;&gt; &gt; &gt; +<br>
&gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 case SBTSI_REG_MAN:<br>
&gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 data =3D SBTSI_MAN_DEF=
AULT;<br>
&gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; &gt;&gt; &gt; &gt; +<br>
&gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 case SBTSI_REG_REV:<br>
&gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 data =3D SBTSI_REV_DEF=
AULT;<br>
&gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; Does this device do some sort of auto-increment on the addres=
s when<br>
&gt; &gt;&gt; reading/writing?<br>
&gt; &gt;&gt;<br>
&gt; &gt;<br>
&gt; &gt; +Hao Wu &lt;<a href=3D"mailto:wuhaotsh@google.com" target=3D"_bla=
nk">wuhaotsh@google.com</a>&gt;=C2=A0 =C2=A0- Please take a look at the abo=
ve<br>
&gt; &gt; question.=C2=A0 I imagine it&#39;s a while since you&#39;ve thoug=
ht about it, but please<br>
&gt; &gt; double check :)<br>
&gt; &gt; Thanks!<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt;&gt; Other than that possible issue, I don&#39;t see anything else=
, it&#39;s pretty<br>
&gt; &gt;&gt; straightforward.<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; &gt; &gt; +<br>
&gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 default:<br>
&gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_log_mask(LOG_GUES=
T_ERROR,<br>
&gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 &quot;%s: reading from invalid reg: 0x%02x\n&quot;,<br>
&gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 __func__, s-&gt;addr);<br>
&gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 }<br>
&gt; &gt;&gt; &gt; &gt; +<br>
&gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 trace_tmp_sbtsi_read_data(s-&gt;addr=
, data);<br>
&gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 return data;<br>
&gt; &gt;&gt; &gt; &gt; +}<br>
&gt; &gt;&gt; &gt; &gt; +<br>
&gt; &gt;&gt; &gt; &gt; +static void sbtsi_write(SBTSIState *s, uint8_t dat=
a)<br>
&gt; &gt;&gt; &gt; &gt; +{<br>
&gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 trace_tmp_sbtsi_write_data(s-&gt;add=
r, data);<br>
&gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 switch (s-&gt;addr) {<br>
&gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 case SBTSI_REG_CONFIG_WR:<br>
&gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;config =3D data;=
<br>
&gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; &gt;&gt; &gt; &gt; +<br>
&gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 case SBTSI_REG_TEMP_HIGH_INT:<br>
&gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;limit_high =3D c=
ompute_temp_int(s-&gt;limit_high, data);<br>
&gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; &gt;&gt; &gt; &gt; +<br>
&gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 case SBTSI_REG_TEMP_LOW_INT:<br>
&gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;limit_low =3D co=
mpute_temp_int(s-&gt;limit_low, data);<br>
&gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; &gt;&gt; &gt; &gt; +<br>
&gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 case SBTSI_REG_TEMP_HIGH_DEC:<br>
&gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;limit_high =3D c=
ompute_temp_dec(s-&gt;limit_high, data);<br>
&gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; &gt;&gt; &gt; &gt; +<br>
&gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 case SBTSI_REG_TEMP_LOW_DEC:<br>
&gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;limit_low =3D co=
mpute_temp_dec(s-&gt;limit_low, data);<br>
&gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; &gt;&gt; &gt; &gt; +<br>
&gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 case SBTSI_REG_ALERT_CONFIG:<br>
&gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;alert_config =3D=
 data;<br>
&gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; &gt;&gt; &gt; &gt; +<br>
&gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 case SBTSI_REG_TEMP_INT:<br>
&gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 case SBTSI_REG_TEMP_DEC:<br>
&gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 case SBTSI_REG_CONFIG:<br>
&gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 case SBTSI_REG_STATUS:<br>
&gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 case SBTSI_REG_MAN:<br>
&gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 case SBTSI_REG_REV:<br>
&gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_log_mask(LOG_GUES=
T_ERROR,<br>
&gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 &quot;%s: writing to read only reg: 0x%02x data:<br>
&gt; &gt;&gt; 0x%02x\n&quot;,<br>
&gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 __func__, s-&gt;addr, data);<br>
&gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; &gt;&gt; &gt; &gt; +<br>
&gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 default:<br>
&gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_log_mask(LOG_GUES=
T_ERROR,<br>
&gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 &quot;%s: writing to invalid reg: 0x%02x data: 0x%02x\n&quot;,<br>
&gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 __func__, s-&gt;addr, data);<br>
&gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 }<br>
&gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 sbtsi_update_alarm(s);<br>
&gt; &gt;&gt; &gt; &gt; +}<br>
&gt; &gt;&gt; &gt; &gt; +<br>
&gt; &gt;&gt; &gt; &gt; +static int sbtsi_write_data(SMBusDevice *d, uint8_=
t *buf, uint8_t<br>
&gt; &gt;&gt; len)<br>
&gt; &gt;&gt; &gt; &gt; +{<br>
&gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 SBTSIState *s =3D SBTSI(d);<br>
&gt; &gt;&gt; &gt; &gt; +<br>
&gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 if (len =3D=3D 0) {<br>
&gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_log_mask(LOG_GUES=
T_ERROR, &quot;%s: writing empty data\n&quot;,<br>
&gt; &gt;&gt; &gt; &gt; __func__);<br>
&gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return -1;<br>
&gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 }<br>
&gt; &gt;&gt; &gt; &gt; +<br>
&gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 s-&gt;addr =3D buf[0];<br>
&gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 if (len &gt; 1) {<br>
&gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 sbtsi_write(s, buf[1])=
;<br>
&gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (len &gt; 2) {<br>
&gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_log=
_mask(LOG_GUEST_ERROR, &quot;%s: extra data at end\n&quot;,<br>
&gt; &gt;&gt; &gt; &gt; __func__);<br>
&gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 }<br>
&gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 return 0;<br>
&gt; &gt;&gt; &gt; &gt; +}<br>
&gt; &gt;&gt; &gt; &gt; +<br>
&gt; &gt;&gt; &gt; &gt; +/* Units are millidegrees. */<br>
&gt; &gt;&gt; &gt; &gt; +static void sbtsi_get_temperature(Object *obj, Vis=
itor *v, const char<br>
&gt; &gt;&gt; &gt; &gt; *name,<br>
&gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 void =
*opaque, Error **errp)<br>
&gt; &gt;&gt; &gt; &gt; +{<br>
&gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 SBTSIState *s =3D SBTSI(obj);<br>
&gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 uint32_t temp =3D s-&gt;temperature =
* SBTSI_TEMP_UNIT_IN_MILLIDEGREE;<br>
&gt; &gt;&gt; &gt; &gt; +<br>
&gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 visit_type_uint32(v, name, &amp;temp=
, errp);<br>
&gt; &gt;&gt; &gt; &gt; +}<br>
&gt; &gt;&gt; &gt; &gt; +<br>
&gt; &gt;&gt; &gt; &gt; +/* Units are millidegrees. */<br>
&gt; &gt;&gt; &gt; &gt; +static void sbtsi_set_temperature(Object *obj, Vis=
itor *v, const char<br>
&gt; &gt;&gt; &gt; &gt; *name,<br>
&gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 void =
*opaque, Error **errp)<br>
&gt; &gt;&gt; &gt; &gt; +{<br>
&gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 SBTSIState *s =3D SBTSI(obj);<br>
&gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 uint32_t temp;<br>
&gt; &gt;&gt; &gt; &gt; +<br>
&gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 if (!visit_type_uint32(v, name, &amp=
;temp, errp)) {<br>
&gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
&gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 }<br>
&gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 if (temp &gt; SBTSI_TEMP_MAX) {<br>
&gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg(errp, &quot=
;value %&quot; PRIu32 &quot;.%03&quot; PRIu32 &quot; C is out of<br>
&gt; &gt;&gt; &gt; &gt; range&quot;,<br>
&gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0temp / 1000, temp % 1000);<br>
&gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
&gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 }<br>
&gt; &gt;&gt; &gt; &gt; +<br>
&gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 s-&gt;temperature =3D temp / SBTSI_T=
EMP_UNIT_IN_MILLIDEGREE;<br>
&gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 sbtsi_update_alarm(s);<br>
&gt; &gt;&gt; &gt; &gt; +}<br>
&gt; &gt;&gt; &gt; &gt; +<br>
&gt; &gt;&gt; &gt; &gt; +static int sbtsi_post_load(void *opaque, int versi=
on_id)<br>
&gt; &gt;&gt; &gt; &gt; +{<br>
&gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 SBTSIState *s =3D opaque;<br>
&gt; &gt;&gt; &gt; &gt; +<br>
&gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 sbtsi_update_alarm(s);<br>
&gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 return 0;<br>
&gt; &gt;&gt; &gt; &gt; +}<br>
&gt; &gt;&gt; &gt; &gt; +<br>
&gt; &gt;&gt; &gt; &gt; +static const VMStateDescription vmstate_sbtsi =3D =
{<br>
&gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 .name =3D &quot;SBTSI&quot;,<br>
&gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 .version_id =3D 0,<br>
&gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 .minimum_version_id =3D 0,<br>
&gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 .post_load =3D sbtsi_post_load,<br>
&gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 .fields =3D (VMStateField[]) {<br>
&gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 VMSTATE_UINT32(tempera=
ture, SBTSIState),<br>
&gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 VMSTATE_UINT32(limit_l=
ow, SBTSIState),<br>
&gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 VMSTATE_UINT32(limit_h=
igh, SBTSIState),<br>
&gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 VMSTATE_UINT8(config, =
SBTSIState),<br>
&gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 VMSTATE_UINT8(status, =
SBTSIState),<br>
&gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 VMSTATE_UINT8(addr, SB=
TSIState),<br>
&gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 VMSTATE_END_OF_LIST()<=
br>
&gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 }<br>
&gt; &gt;&gt; &gt; &gt; +};<br>
&gt; &gt;&gt; &gt; &gt; +<br>
&gt; &gt;&gt; &gt; &gt; +static void sbtsi_enter_reset(Object *obj, ResetTy=
pe type)<br>
&gt; &gt;&gt; &gt; &gt; +{<br>
&gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 SBTSIState *s =3D SBTSI(obj);<br>
&gt; &gt;&gt; &gt; &gt; +<br>
&gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 s-&gt;config =3D 0;<br>
&gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 s-&gt;limit_low =3D SBTSI_LIMIT_LOW_=
DEFAULT;<br>
&gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 s-&gt;limit_high =3D SBTSI_LIMIT_HIG=
H_DEFAULT;<br>
&gt; &gt;&gt; &gt; &gt; +}<br>
&gt; &gt;&gt; &gt; &gt; +<br>
&gt; &gt;&gt; &gt; &gt; +static void sbtsi_hold_reset(Object *obj)<br>
&gt; &gt;&gt; &gt; &gt; +{<br>
&gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 SBTSIState *s =3D SBTSI(obj);<br>
&gt; &gt;&gt; &gt; &gt; +<br>
&gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 qemu_irq_lower(s-&gt;alarm);<br>
&gt; &gt;&gt; &gt; &gt; +}<br>
&gt; &gt;&gt; &gt; &gt; +<br>
&gt; &gt;&gt; &gt; &gt; +static void sbtsi_init(Object *obj)<br>
&gt; &gt;&gt; &gt; &gt; +{<br>
&gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 SBTSIState *s =3D SBTSI(obj);<br>
&gt; &gt;&gt; &gt; &gt; +<br>
&gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 /* Current temperature in millidegre=
es. */<br>
&gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 object_property_add(obj, &quot;tempe=
rature&quot;, &quot;uint32&quot;,<br>
&gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sbtsi_get_temperature, sbtsi_set_tempera=
ture,<br>
&gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 NULL, NULL);<br>
&gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 qdev_init_gpio_out_named(DEVICE(obj)=
, &amp;s-&gt;alarm, SBTSI_ALARM_L,<br>
&gt; &gt;&gt; 0);<br>
&gt; &gt;&gt; &gt; &gt; +}<br>
&gt; &gt;&gt; &gt; &gt; +<br>
&gt; &gt;&gt; &gt; &gt; +static void sbtsi_class_init(ObjectClass *klass, v=
oid *data)<br>
&gt; &gt;&gt; &gt; &gt; +{<br>
&gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 ResettableClass *rc =3D RESETTABLE_C=
LASS(klass);<br>
&gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 DeviceClass *dc =3D DEVICE_CLASS(kla=
ss);<br>
&gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 SMBusDeviceClass *k =3D SMBUS_DEVICE=
_CLASS(klass);<br>
&gt; &gt;&gt; &gt; &gt; +<br>
&gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 dc-&gt;desc =3D &quot;SB-TSI Tempera=
ture Sensor&quot;;<br>
&gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 dc-&gt;vmsd =3D &amp;vmstate_sbtsi;<=
br>
&gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 k-&gt;write_data =3D sbtsi_write_dat=
a;<br>
&gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 k-&gt;receive_byte =3D sbtsi_read_by=
te;<br>
&gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 rc-&gt;phases.enter =3D sbtsi_enter_=
reset;<br>
&gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 rc-&gt;phases.hold =3D sbtsi_hold_re=
set;<br>
&gt; &gt;&gt; &gt; &gt; +}<br>
&gt; &gt;&gt; &gt; &gt; +<br>
&gt; &gt;&gt; &gt; &gt; +static const TypeInfo sbtsi_info =3D {<br>
&gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 .name=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =3D TYPE_SBTSI,<br>
&gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 .parent=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=3D TYPE_SMBUS_DEVICE,<br>
&gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 .instance_size =3D sizeof(SBTSIState=
),<br>
&gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 .instance_init =3D sbtsi_init,<br>
&gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 .class_init=C2=A0 =C2=A0 =3D sbtsi_c=
lass_init,<br>
&gt; &gt;&gt; &gt; &gt; +};<br>
&gt; &gt;&gt; &gt; &gt; +<br>
&gt; &gt;&gt; &gt; &gt; +static void sbtsi_register_types(void)<br>
&gt; &gt;&gt; &gt; &gt; +{<br>
&gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 type_register_static(&amp;sbtsi_info=
);<br>
&gt; &gt;&gt; &gt; &gt; +}<br>
&gt; &gt;&gt; &gt; &gt; +<br>
&gt; &gt;&gt; &gt; &gt; +type_init(sbtsi_register_types)<br>
&gt; &gt;&gt; &gt; &gt; diff --git a/hw/sensor/trace-events b/hw/sensor/tra=
ce-events<br>
&gt; &gt;&gt; &gt; &gt; new file mode 100644<br>
&gt; &gt;&gt; &gt; &gt; index 0000000000..21ab3809e2<br>
&gt; &gt;&gt; &gt; &gt; --- /dev/null<br>
&gt; &gt;&gt; &gt; &gt; +++ b/hw/sensor/trace-events<br>
&gt; &gt;&gt; &gt; &gt; @@ -0,0 +1,5 @@<br>
&gt; &gt;&gt; &gt; &gt; +# See docs/devel/tracing.rst for syntax documentat=
ion.<br>
&gt; &gt;&gt; &gt; &gt; +<br>
&gt; &gt;&gt; &gt; &gt; +# tmp_sbtsi.c<br>
&gt; &gt;&gt; &gt; &gt; +tmp_sbtsi_write_data(uint8_t addr, uint8_t value) =
&quot;SBTSI write<br>
&gt; &gt;&gt; &gt; &gt; addr:0x%02x data: 0x%02x&quot;<br>
&gt; &gt;&gt; &gt; &gt; +tmp_sbtsi_read_data(uint8_t addr, uint8_t value) &=
quot;SBTSI read<br>
&gt; &gt;&gt; addr:0x%02x<br>
&gt; &gt;&gt; &gt; &gt; data: 0x%02x&quot;<br>
&gt; &gt;&gt; &gt; &gt; diff --git a/hw/sensor/trace.h b/hw/sensor/trace.h<=
br>
&gt; &gt;&gt; &gt; &gt; new file mode 100644<br>
&gt; &gt;&gt; &gt; &gt; index 0000000000..e4721560b0<br>
&gt; &gt;&gt; &gt; &gt; --- /dev/null<br>
&gt; &gt;&gt; &gt; &gt; +++ b/hw/sensor/trace.h<br>
&gt; &gt;&gt; &gt; &gt; @@ -0,0 +1 @@<br>
&gt; &gt;&gt; &gt; &gt; +#include &quot;trace/trace-hw_sensor.h&quot;<br>
&gt; &gt;&gt; &gt; &gt; diff --git a/meson.build b/meson.build<br>
&gt; &gt;&gt; &gt; &gt; index 53065e96ec..f8ab0bf74e 100644<br>
&gt; &gt;&gt; &gt; &gt; --- a/meson.build<br>
&gt; &gt;&gt; &gt; &gt; +++ b/meson.build<br>
&gt; &gt;&gt; &gt; &gt; @@ -2494,6 +2494,7 @@ if have_system<br>
&gt; &gt;&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 &#39;hw/rtc&#39;,<br>
&gt; &gt;&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 &#39;hw/s390x&#39;,<br>
&gt; &gt;&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 &#39;hw/scsi&#39;,<br>
&gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 &#39;hw/sensor&#39;,<br>
&gt; &gt;&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 &#39;hw/sd&#39;,<br>
&gt; &gt;&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 &#39;hw/sh4&#39;,<br>
&gt; &gt;&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 &#39;hw/sparc&#39;,<br>
&gt; &gt;&gt; &gt; &gt; diff --git a/tests/qtest/meson.build b/tests/qtest/=
meson.build<br>
&gt; &gt;&gt; &gt; &gt; index 37e1eaa449..d1a8c38f74 100644<br>
&gt; &gt;&gt; &gt; &gt; --- a/tests/qtest/meson.build<br>
&gt; &gt;&gt; &gt; &gt; +++ b/tests/qtest/meson.build<br>
&gt; &gt;&gt; &gt; &gt; @@ -254,6 +254,7 @@ qos_test_ss.add(<br>
&gt; &gt;&gt; &gt; &gt;=C2=A0 =C2=A0 &#39;spapr-phb-test.c&#39;,<br>
&gt; &gt;&gt; &gt; &gt;=C2=A0 =C2=A0 &#39;tmp105-test.c&#39;,<br>
&gt; &gt;&gt; &gt; &gt;=C2=A0 =C2=A0 &#39;emc141x-test.c&#39;,<br>
&gt; &gt;&gt; &gt; &gt; +=C2=A0 &#39;tmp_sbtsi-test.c&#39;,<br>
&gt; &gt;&gt; &gt; &gt;=C2=A0 =C2=A0 &#39;usb-hcd-ohci-test.c&#39;,<br>
&gt; &gt;&gt; &gt; &gt;=C2=A0 =C2=A0 &#39;virtio-test.c&#39;,<br>
&gt; &gt;&gt; &gt; &gt;=C2=A0 =C2=A0 &#39;virtio-blk-test.c&#39;,<br>
&gt; &gt;&gt; &gt; &gt; diff --git a/tests/qtest/tmp_sbtsi-test.c<br>
&gt; &gt;&gt; b/tests/qtest/tmp_sbtsi-test.c<br>
&gt; &gt;&gt; &gt; &gt; new file mode 100644<br>
&gt; &gt;&gt; &gt; &gt; index 0000000000..7f5fafacc7<br>
&gt; &gt;&gt; &gt; &gt; --- /dev/null<br>
&gt; &gt;&gt; &gt; &gt; +++ b/tests/qtest/tmp_sbtsi-test.c<br>
&gt; &gt;&gt; &gt; &gt; @@ -0,0 +1,180 @@<br>
&gt; &gt;&gt; &gt; &gt; +/*<br>
&gt; &gt;&gt; &gt; &gt; + * QTests for the SBTSI temperature sensor<br>
&gt; &gt;&gt; &gt; &gt; + *<br>
&gt; &gt;&gt; &gt; &gt; + * Copyright 2020 Google LLC<br>
&gt; &gt;&gt; &gt; &gt; + *<br>
&gt; &gt;&gt; &gt; &gt; + * This program is free software; you can redistri=
bute it and/or<br>
&gt; &gt;&gt; modify it<br>
&gt; &gt;&gt; &gt; &gt; + * under the terms of the GNU General Public Licen=
se as published by<br>
&gt; &gt;&gt; the<br>
&gt; &gt;&gt; &gt; &gt; + * Free Software Foundation; either version 2 of t=
he License, or<br>
&gt; &gt;&gt; &gt; &gt; + * (at your option) any later version.<br>
&gt; &gt;&gt; &gt; &gt; + *<br>
&gt; &gt;&gt; &gt; &gt; + * This program is distributed in the hope that it=
 will be useful,<br>
&gt; &gt;&gt; but<br>
&gt; &gt;&gt; &gt; &gt; WITHOUT<br>
&gt; &gt;&gt; &gt; &gt; + * ANY WARRANTY; without even the implied warranty=
 of<br>
&gt; &gt;&gt; MERCHANTABILITY or<br>
&gt; &gt;&gt; &gt; &gt; + * FITNESS FOR A PARTICULAR PURPOSE. See the GNU G=
eneral Public<br>
&gt; &gt;&gt; License<br>
&gt; &gt;&gt; &gt; &gt; + * for more details.<br>
&gt; &gt;&gt; &gt; &gt; + */<br>
&gt; &gt;&gt; &gt; &gt; +<br>
&gt; &gt;&gt; &gt; &gt; +#include &quot;qemu/osdep.h&quot;<br>
&gt; &gt;&gt; &gt; &gt; +<br>
&gt; &gt;&gt; &gt; &gt; +#include &quot;libqtest-single.h&quot;<br>
&gt; &gt;&gt; &gt; &gt; +#include &quot;libqos/qgraph.h&quot;<br>
&gt; &gt;&gt; &gt; &gt; +#include &quot;libqos/i2c.h&quot;<br>
&gt; &gt;&gt; &gt; &gt; +#include &quot;qapi/qmp/qdict.h&quot;<br>
&gt; &gt;&gt; &gt; &gt; +#include &quot;qemu/bitops.h&quot;<br>
&gt; &gt;&gt; &gt; &gt; +<br>
&gt; &gt;&gt; &gt; &gt; +#define TEST_ID=C2=A0 =C2=A0&quot;sbtsi-test&quot;=
<br>
&gt; &gt;&gt; &gt; &gt; +#define TEST_ADDR (0x4c)<br>
&gt; &gt;&gt; &gt; &gt; +<br>
&gt; &gt;&gt; &gt; &gt; +/*<br>
&gt; &gt;&gt; &gt; &gt; + * SB-TSI registers only support SMBus byte data a=
ccess. &quot;_INT&quot;<br>
&gt; &gt;&gt; registers<br>
&gt; &gt;&gt; &gt; &gt; are<br>
&gt; &gt;&gt; &gt; &gt; + * the integer part of a temperature value or limi=
t, and &quot;_DEC&quot;<br>
&gt; &gt;&gt; registers<br>
&gt; &gt;&gt; &gt; &gt; are<br>
&gt; &gt;&gt; &gt; &gt; + * corresponding decimal parts.<br>
&gt; &gt;&gt; &gt; &gt; + */<br>
&gt; &gt;&gt; &gt; &gt; +#define REG_TEMP_INT=C2=A0 =C2=A0 =C2=A0 0x01 /* R=
O */<br>
&gt; &gt;&gt; &gt; &gt; +#define REG_STATUS=C2=A0 =C2=A0 =C2=A0 =C2=A0 0x02=
 /* RO */<br>
&gt; &gt;&gt; &gt; &gt; +#define REG_CONFIG=C2=A0 =C2=A0 =C2=A0 =C2=A0 0x03=
 /* RO */<br>
&gt; &gt;&gt; &gt; &gt; +#define REG_TEMP_HIGH_INT 0x07 /* RW */<br>
&gt; &gt;&gt; &gt; &gt; +#define REG_TEMP_LOW_INT=C2=A0 0x08 /* RW */<br>
&gt; &gt;&gt; &gt; &gt; +#define REG_CONFIG_WR=C2=A0 =C2=A0 =C2=A00x09 /* R=
W */<br>
&gt; &gt;&gt; &gt; &gt; +#define REG_TEMP_DEC=C2=A0 =C2=A0 =C2=A0 0x10 /* R=
O */<br>
&gt; &gt;&gt; &gt; &gt; +#define REG_TEMP_HIGH_DEC 0x13 /* RW */<br>
&gt; &gt;&gt; &gt; &gt; +#define REG_TEMP_LOW_DEC=C2=A0 0x14 /* RW */<br>
&gt; &gt;&gt; &gt; &gt; +#define REG_ALERT_CONFIG=C2=A0 0xBF /* RW */<br>
&gt; &gt;&gt; &gt; &gt; +<br>
&gt; &gt;&gt; &gt; &gt; +#define STATUS_HIGH_ALERT BIT(4)<br>
&gt; &gt;&gt; &gt; &gt; +#define STATUS_LOW_ALERT=C2=A0 BIT(3)<br>
&gt; &gt;&gt; &gt; &gt; +#define CONFIG_ALERT_MASK BIT(7)<br>
&gt; &gt;&gt; &gt; &gt; +#define ALARM_EN=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 BIT(0)<br>
&gt; &gt;&gt; &gt; &gt; +<br>
&gt; &gt;&gt; &gt; &gt; +/* The temperature stored are in units of 0.125 de=
grees. */<br>
&gt; &gt;&gt; &gt; &gt; +#define TEMP_UNIT_IN_MILLIDEGREE 125<br>
&gt; &gt;&gt; &gt; &gt; +#define LIMIT_LOW (10500)<br>
&gt; &gt;&gt; &gt; &gt; +#define LIMIT_HIGH (55125)<br>
&gt; &gt;&gt; &gt; &gt; +<br>
&gt; &gt;&gt; &gt; &gt; +static uint32_t qmp_sbtsi_get_temperature(const ch=
ar *id)<br>
&gt; &gt;&gt; &gt; &gt; +{<br>
&gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 QDict *response;<br>
&gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 int ret;<br>
&gt; &gt;&gt; &gt; &gt; +<br>
&gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 response =3D qmp(&quot;{ &#39;execut=
e&#39;: &#39;qom-get&#39;, &#39;arguments&#39;: { &#39;path&#39;:<br>
&gt; &gt;&gt; %s, &quot;<br>
&gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0&quot;&#39;property&#39;: &#39;temperature&#39; } }&quo=
t;, id);<br>
&gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 g_assert(qdict_haskey(response, &quo=
t;return&quot;));<br>
&gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 ret =3D (uint32_t)qdict_get_int(resp=
onse, &quot;return&quot;);<br>
&gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 qobject_unref(response);<br>
&gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 return ret;<br>
&gt; &gt;&gt; &gt; &gt; +}<br>
&gt; &gt;&gt; &gt; &gt; +<br>
&gt; &gt;&gt; &gt; &gt; +static void qmp_sbtsi_set_temperature(const char *=
id, uint32_t value)<br>
&gt; &gt;&gt; &gt; &gt; +{<br>
&gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 QDict *response;<br>
&gt; &gt;&gt; &gt; &gt; +<br>
&gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 response =3D qmp(&quot;{ &#39;execut=
e&#39;: &#39;qom-set&#39;, &#39;arguments&#39;: { &#39;path&#39;:<br>
&gt; &gt;&gt; %s, &quot;<br>
&gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0&quot;&#39;property&#39;: &#39;temperature&#39;, &#39;v=
alue&#39;: %d } }&quot;, id,<br>
&gt; &gt;&gt; &gt; &gt; value);<br>
&gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 g_assert(qdict_haskey(response, &quo=
t;return&quot;));<br>
&gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 qobject_unref(response);<br>
&gt; &gt;&gt; &gt; &gt; +}<br>
&gt; &gt;&gt; &gt; &gt; +<br>
&gt; &gt;&gt; &gt; &gt; +/*<br>
&gt; &gt;&gt; &gt; &gt; + * Compute the temperature using the integer and d=
ecimal part and<br>
&gt; &gt;&gt; return<br>
&gt; &gt;&gt; &gt; &gt; + * millidegrees. The decimal part are only the top=
 3 bits so we<br>
&gt; &gt;&gt; shift it<br>
&gt; &gt;&gt; &gt; &gt; by<br>
&gt; &gt;&gt; &gt; &gt; + * 5 here.<br>
&gt; &gt;&gt; &gt; &gt; + */<br>
&gt; &gt;&gt; &gt; &gt; +static uint32_t regs_to_temp(uint8_t integer, uint=
8_t decimal)<br>
&gt; &gt;&gt; &gt; &gt; +{<br>
&gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 return ((integer &lt;&lt; 3) + (deci=
mal &gt;&gt; 5)) *<br>
&gt; &gt;&gt; TEMP_UNIT_IN_MILLIDEGREE;<br>
&gt; &gt;&gt; &gt; &gt; +}<br>
&gt; &gt;&gt; &gt; &gt; +<br>
&gt; &gt;&gt; &gt; &gt; +/*<br>
&gt; &gt;&gt; &gt; &gt; + * Compute the integer and decimal parts of the te=
mperature in<br>
&gt; &gt;&gt; &gt; &gt; millidegrees.<br>
&gt; &gt;&gt; &gt; &gt; + * H/W store the decimal in the top 3 bits so we s=
hift it by 5.<br>
&gt; &gt;&gt; &gt; &gt; + */<br>
&gt; &gt;&gt; &gt; &gt; +static void temp_to_regs(uint32_t temp, uint8_t *i=
nteger, uint8_t<br>
&gt; &gt;&gt; &gt; &gt; *decimal)<br>
&gt; &gt;&gt; &gt; &gt; +{<br>
&gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 temp /=3D TEMP_UNIT_IN_MILLIDEGREE;<=
br>
&gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 *integer =3D temp &gt;&gt; 3;<br>
&gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 *decimal =3D (temp &amp; 0x7) &lt;&l=
t; 5;<br>
&gt; &gt;&gt; &gt; &gt; +}<br>
&gt; &gt;&gt; &gt; &gt; +<br>
&gt; &gt;&gt; &gt; &gt; +static void tx_rx(void *obj, void *data, QGuestAll=
ocator *alloc)<br>
&gt; &gt;&gt; &gt; &gt; +{<br>
&gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 uint16_t value;<br>
&gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 uint8_t integer, decimal;<br>
&gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 QI2CDevice *i2cdev =3D (QI2CDevice *=
)obj;<br>
&gt; &gt;&gt; &gt; &gt; +<br>
&gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 /* Test default values */<br>
&gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 value =3D qmp_sbtsi_get_temperature(=
TEST_ID);<br>
&gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 g_assert_cmpuint(value, =3D=3D, 0);<=
br>
&gt; &gt;&gt; &gt; &gt; +<br>
&gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 integer =3D i2c_get8(i2cdev, REG_TEM=
P_INT);<br>
&gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 decimal =3D i2c_get8(i2cdev, REG_TEM=
P_DEC);<br>
&gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 g_assert_cmpuint(regs_to_temp(intege=
r, decimal), =3D=3D, 0);<br>
&gt; &gt;&gt; &gt; &gt; +<br>
&gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 /* Test setting temperature */<br>
&gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 qmp_sbtsi_set_temperature(TEST_ID, 2=
0000);<br>
&gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 value =3D qmp_sbtsi_get_temperature(=
TEST_ID);<br>
&gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 g_assert_cmpuint(value, =3D=3D, 2000=
0);<br>
&gt; &gt;&gt; &gt; &gt; +<br>
&gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 integer =3D i2c_get8(i2cdev, REG_TEM=
P_INT);<br>
&gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 decimal =3D i2c_get8(i2cdev, REG_TEM=
P_DEC);<br>
&gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 g_assert_cmpuint(regs_to_temp(intege=
r, decimal), =3D=3D, 20000);<br>
&gt; &gt;&gt; &gt; &gt; +<br>
&gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 /* Set alert mask in config */<br>
&gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 i2c_set8(i2cdev, REG_CONFIG_WR, CONF=
IG_ALERT_MASK);<br>
&gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 value =3D i2c_get8(i2cdev, REG_CONFI=
G);<br>
&gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 g_assert_cmphex(value, =3D=3D, CONFI=
G_ALERT_MASK);<br>
&gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 /* Enable alarm_en */<br>
&gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 i2c_set8(i2cdev, REG_ALERT_CONFIG, A=
LARM_EN);<br>
&gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 value =3D i2c_get8(i2cdev, REG_ALERT=
_CONFIG);<br>
&gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 g_assert_cmphex(value, =3D=3D, ALARM=
_EN);<br>
&gt; &gt;&gt; &gt; &gt; +<br>
&gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 /* Test setting limits */<br>
&gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 /* Limit low =3D 10.500 */<br>
&gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 temp_to_regs(LIMIT_LOW, &amp;integer=
, &amp;decimal);<br>
&gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 i2c_set8(i2cdev, REG_TEMP_LOW_INT, i=
nteger);<br>
&gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 i2c_set8(i2cdev, REG_TEMP_LOW_DEC, d=
ecimal);<br>
&gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 integer =3D i2c_get8(i2cdev, REG_TEM=
P_LOW_INT);<br>
&gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 decimal =3D i2c_get8(i2cdev, REG_TEM=
P_LOW_DEC);<br>
&gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 g_assert_cmpuint(regs_to_temp(intege=
r, decimal), =3D=3D, LIMIT_LOW);<br>
&gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 /* Limit high =3D 55.125 */<br>
&gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 temp_to_regs(LIMIT_HIGH, &amp;intege=
r, &amp;decimal);<br>
&gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 i2c_set8(i2cdev, REG_TEMP_HIGH_INT, =
integer);<br>
&gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 i2c_set8(i2cdev, REG_TEMP_HIGH_DEC, =
decimal);<br>
&gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 integer =3D i2c_get8(i2cdev, REG_TEM=
P_HIGH_INT);<br>
&gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 decimal =3D i2c_get8(i2cdev, REG_TEM=
P_HIGH_DEC);<br>
&gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 g_assert_cmpuint(regs_to_temp(intege=
r, decimal), =3D=3D, LIMIT_HIGH);<br>
&gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 /* No alert is generated. */<br>
&gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 value =3D i2c_get8(i2cdev, REG_STATU=
S);<br>
&gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 g_assert_cmphex(value, =3D=3D, 0);<b=
r>
&gt; &gt;&gt; &gt; &gt; +<br>
&gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 /* Test alert for low temperature */=
<br>
&gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 qmp_sbtsi_set_temperature(TEST_ID, L=
IMIT_LOW);<br>
&gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 value =3D i2c_get8(i2cdev, REG_STATU=
S);<br>
&gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 g_assert_cmphex(value, =3D=3D, STATU=
S_LOW_ALERT);<br>
&gt; &gt;&gt; &gt; &gt; +<br>
&gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 /* Test alert for high temperature *=
/<br>
&gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 qmp_sbtsi_set_temperature(TEST_ID, L=
IMIT_HIGH);<br>
&gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 value =3D i2c_get8(i2cdev, REG_STATU=
S);<br>
&gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 g_assert_cmphex(value, =3D=3D, STATU=
S_HIGH_ALERT);<br>
&gt; &gt;&gt; &gt; &gt; +<br>
&gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 /* Disable alarm_en */<br>
&gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 i2c_set8(i2cdev, REG_ALERT_CONFIG, 0=
);<br>
&gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 value =3D i2c_get8(i2cdev, REG_ALERT=
_CONFIG);<br>
&gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 g_assert_cmphex(value, =3D=3D, 0);<b=
r>
&gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 /* No alert when alarm_en is false. =
*/<br>
&gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 value =3D i2c_get8(i2cdev, REG_STATU=
S);<br>
&gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 g_assert_cmphex(value, =3D=3D, 0);<b=
r>
&gt; &gt;&gt; &gt; &gt; +}<br>
&gt; &gt;&gt; &gt; &gt; +<br>
&gt; &gt;&gt; &gt; &gt; +static void sbtsi_register_nodes(void)<br>
&gt; &gt;&gt; &gt; &gt; +{<br>
&gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 QOSGraphEdgeOptions opts =3D {<br>
&gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 .extra_device_opts =3D=
 &quot;id=3D&quot; TEST_ID &quot;,address=3D0x4c&quot;<br>
&gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 };<br>
&gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 add_qi2c_address(&amp;opts, &amp;(QI=
2CAddress) { TEST_ADDR });<br>
&gt; &gt;&gt; &gt; &gt; +<br>
&gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 qos_node_create_driver(&quot;sbtsi&q=
uot;, i2c_device_create);<br>
&gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 qos_node_consumes(&quot;sbtsi&quot;,=
 &quot;i2c-bus&quot;, &amp;opts);<br>
&gt; &gt;&gt; &gt; &gt; +<br>
&gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 qos_add_test(&quot;tx-rx&quot;, &quo=
t;sbtsi&quot;, tx_rx, NULL);<br>
&gt; &gt;&gt; &gt; &gt; +}<br>
&gt; &gt;&gt; &gt; &gt; +libqos_init(sbtsi_register_nodes);<br>
&gt; &gt;&gt; &gt; &gt; --<br>
&gt; &gt;&gt; &gt;<br>
&gt; &gt;&gt; &gt;<br>
&gt; &gt;&gt; &gt; + Corey for i2c maintainer.=C2=A0 The new sensor directo=
ry is mostly if not<br>
&gt; &gt;&gt; &gt; entirely i2c devices.=C2=A0 I didn&#39;t create a mainta=
iner entry for this i2c<br>
&gt; &gt;&gt; &gt; device, but I can if desired and send out a v2.<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; Yeah, I guess I should be maintainer there.=C2=A0 I&#39;ll qu=
eue up a change for<br>
&gt; &gt;&gt; that.=C2=A0 Thanks.<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; -corey<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; &gt;<br>
&gt; &gt;&gt; &gt;<br>
&gt; &gt;&gt; &gt; &gt; 2.34.1.575.g55b058a8bb-goog<br>
&gt; &gt;&gt; &gt; &gt;<br>
&gt; &gt;&gt; &gt; &gt;<br>
&gt; &gt;&gt;<br>
&gt; &gt;<br>
</blockquote></div></div>
</blockquote></div></div>

--000000000000c10c8505d6988a53--

