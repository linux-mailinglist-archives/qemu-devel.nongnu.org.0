Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 536B748A048
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Jan 2022 20:39:13 +0100 (CET)
Received: from localhost ([::1]:43828 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n70Vb-0000FG-PY
	for lists+qemu-devel@lfdr.de; Mon, 10 Jan 2022 14:39:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47916)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n70NM-0003Pr-Q2
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 14:30:43 -0500
Received: from [2a00:1450:4864:20::434] (port=39440
 helo=mail-wr1-x434.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n70NK-00076C-E3
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 14:30:40 -0500
Received: by mail-wr1-x434.google.com with SMTP id s1so28782121wra.6
 for <qemu-devel@nongnu.org>; Mon, 10 Jan 2022 11:30:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=XkxWDJmKMpwAVZZ4jfxUH9zrKttCsJorCuCQIS/Kwk4=;
 b=KJp0Qmw7I17LakY9s0pB7kFCDmuJhTGHF5Ku9s0iZRpulk5GyPDApIcl/cAf6O5eux
 EjoHqEnFZiWwn2CzFzKg/1IoFqEYXB5gdVGS0i8rPXm2RCV6v0+Ew3sdMrhsaw5EJNCm
 bmvF0RqMBaktS/kdurlHxtQl4l4tESoVQEtNcmhgzhXFHiCxXgNaftnejNfGF8/5Sx78
 J7wN4JbiYYTXguUvEaP13wGTs78zHhFcPtQbuBIWk19IY9MRmTqXVXfB2GdB+EOrZzyq
 zzkMLnhVFjbZXKyHU5rLIgkXPNXpkP1QoMpbC5aiJ/vwiXJGF3oL05i9zTH8PKYkmOis
 F9wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=XkxWDJmKMpwAVZZ4jfxUH9zrKttCsJorCuCQIS/Kwk4=;
 b=dzIbg7vdGbhCFNsXoFGe3S0FSR6g/sx+l4f6QIaDZRAA2E9SxmcmeKD7Vf6GgIF25/
 WFpPwwCxCrxM3OI9ceCmwgff8CGoPve+Fq5Q8Kxs6eEP+OXwh6XGDKgt6JHdhsOKF78G
 QQQo5FwbCuelmq9oro6WCogLmjcLw7arxVv/hZ5YYaenofzaLBZqOd1DC0ySD7w2U+7i
 LkFkaODKXqYJufO79IB58dPpK1yXWynyuVCltERDX7HIZqIKUTqNUrbfQC6uPr2JIzfZ
 stvul8BC+8Y8YAuyArB8p7daUVy7FhbfG2QdboYT+z6Qj0VAzJznKykoKXfM/DpU+XiP
 lFbw==
X-Gm-Message-State: AOAM5324PCMaNYoXPCFi1NWGZwdStaino0Buy/7YJAhvkadP+pSDojou
 eje8p38t7UeyGw6SMFBOWhscHmvqbPrG1w==
X-Google-Smtp-Source: ABdhPJx7Q+5EdD5GXaqMVr+YYwcbamRZ9W6h4L1Z9pnQm+AIXnRyRPfAninmToL4t7+AHoBiX8cwUg==
X-Received: by 2002:a5d:58d5:: with SMTP id o21mr905578wrf.254.1641843035612; 
 Mon, 10 Jan 2022 11:30:35 -0800 (PST)
Received: from [192.168.1.40] (83.red-83-50-87.dynamicip.rima-tde.net.
 [83.50.87.83])
 by smtp.gmail.com with ESMTPSA id a24sm1376296wrc.114.2022.01.10.11.30.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Jan 2022 11:30:35 -0800 (PST)
Message-ID: <6f80b5e2-66d4-a73a-3766-264825d05245@amsat.org>
Date: Mon, 10 Jan 2022 20:30:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH] hw/sensor: Add SB-TSI Temperature Sensor Interface
Content-Language: en-US
To: Patrick Venture <venture@google.com>
References: <20220108030451.3867815-1-venture@google.com>
 <eaea55f9-71f8-4810-70a7-63aadf252f20@amsat.org>
 <CAO=notwnL9WB_M-bZ+S-+5ruf5cm6Gyh9AEvN66owuyLWbsfRQ@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <CAO=notwnL9WB_M-bZ+S-+5ruf5cm6Gyh9AEvN66owuyLWbsfRQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::434
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x434.google.com
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
Cc: lvivier@redhat.com, Thomas Huth <thuth@redhat.com>,
 Corey Minyard <minyard@acm.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Doug Evans <dje@google.com>, Hao Wu <wuhaotsh@google.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/10/22 18:14, Patrick Venture wrote:
> On Mon, Jan 10, 2022 at 1:35 AM Philippe Mathieu-Daudé <f4bug@amsat.org
> <mailto:f4bug@amsat.org>> wrote:
> 
>     Hi Patrick,
> 
>     On 1/8/22 04:04, Patrick Venture wrote:
>     > From: Hao Wu <wuhaotsh@google.com <mailto:wuhaotsh@google.com>>
>     >
>     > SB Temperature Sensor Interface (SB-TSI) is an SMBus compatible
>     > interface that reports AMD SoC's Ttcl (normalized temperature),
>     > and resembles a typical 8-pin remote temperature sensor's I2C
>     interface
>     > to BMC.
>     >
>     > This patch implements a basic AMD SB-TSI sensor that is
>     > compatible with the open-source data sheet from AMD and Linux
>     > kernel driver.
>     >
>     > Reference:
>     > Linux kernel driver:
>     > https://lkml.org/lkml/2020/12/11/968
>     <https://lkml.org/lkml/2020/12/11/968>
>     > Register Map:
>     > https://developer.amd.com/wp-content/resources/56255_3_03.PDF
>     <https://developer.amd.com/wp-content/resources/56255_3_03.PDF>
>     > (Chapter 6)
>     >
>     > Signed-off-by: Hao Wu <wuhaotsh@google.com
>     <mailto:wuhaotsh@google.com>>
>     > Reviewed-by: Doug Evans <dje@google.com <mailto:dje@google.com>>
>     > ---
>     >  hw/sensor/Kconfig            |   4 +
>     >  hw/sensor/meson.build        |   1 +
>     >  hw/sensor/tmp_sbtsi.c        | 393
>     +++++++++++++++++++++++++++++++++++
>     >  hw/sensor/trace-events       |   5 +
>     >  hw/sensor/trace.h            |   1 +
>     >  meson.build                  |   1 +
> 
>     >  tests/qtest/meson.build      |   1 +
>     >  tests/qtest/tmp_sbtsi-test.c | 180 ++++++++++++++++
> 
>     Up to Thomas for qtest, but I'd rather split in 2 patches since
>     different set of maintainers / reviewers.
> 
>     > +++ b/hw/sensor/tmp_sbtsi.c
>     > @@ -0,0 +1,393 @@
>     > +/*
>     > + * AMD SBI Temperature Sensor Interface (SB-TSI)
>     > + *
>     > + * Copyright 2021 Google LLC
>     > + *
>     > + * This program is free software; you can redistribute it and/or
>     modify it
>     > + * under the terms of the GNU General Public License as published
>     by the
>     > + * Free Software Foundation; either version 2 of the License, or
>     > + * (at your option) any later version.
>     > + *
>     > + * This program is distributed in the hope that it will be
>     useful, but WITHOUT
>     > + * ANY WARRANTY; without even the implied warranty of
>     MERCHANTABILITY or
>     > + * FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public
>     License
>     > + * for more details.
>     > + */
>     > +
>     > +#include "qemu/osdep.h"
>     > +#include "hw/i2c/smbus_slave.h"
>     > +#include "hw/irq.h"
>     > +#include "migration/vmstate.h"
>     > +#include "qapi/error.h"
>     > +#include "qapi/visitor.h"
>     > +#include "qemu/log.h"
>     > +#include "qemu/module.h"
>     > +#include "trace.h"
>     > +
>     > +#define TYPE_SBTSI "sbtsi"
> 
>     If you add include/hw/sensor/sbtsi.h, please define the type there, ...
> 
>     > +/*
>     > + * SB-TSI registers only support SMBus byte data access. "_INT"
>     registers are
>     > + * the integer part of a temperature value or limit, and "_DEC"
>     registers are
>     > + * corresponding decimal parts.
>     > + */
>     > +#define SBTSI_REG_TEMP_INT      0x01 /* RO */
>     > +#define SBTSI_REG_STATUS        0x02 /* RO */
>     > +#define SBTSI_REG_CONFIG        0x03 /* RO */
>     > +#define SBTSI_REG_TEMP_HIGH_INT 0x07 /* RW */
>     > +#define SBTSI_REG_TEMP_LOW_INT  0x08 /* RW */
>     > +#define SBTSI_REG_CONFIG_WR     0x09 /* RW */
>     > +#define SBTSI_REG_TEMP_DEC      0x10 /* RO */
>     > +#define SBTSI_REG_TEMP_HIGH_DEC 0x13 /* RW */
>     > +#define SBTSI_REG_TEMP_LOW_DEC  0x14 /* RW */
>     > +#define SBTSI_REG_ALERT_CONFIG  0xBF /* RW */
>     > +#define SBTSI_REG_MAN           0xFE /* RO */
>     > +#define SBTSI_REG_REV           0xFF /* RO */
>     > +
>     > +#define SBTSI_STATUS_HIGH_ALERT BIT(4)
>     > +#define SBTSI_STATUS_LOW_ALERT  BIT(3)
>     > +#define SBTSI_CONFIG_ALERT_MASK BIT(7)
>     > +#define SBTSI_ALARM_EN          BIT(0)
> 
>     beside these definitions can be share with qtests.
> 
>     > +/* The temperature we stored are in units of 0.125 degrees. */
>     > +#define SBTSI_TEMP_UNIT_IN_MILLIDEGREE 125
>     > +
>     > +/*
>     > + * The integer part and decimal of the temperature both 8 bits.
>     > + * Only the top 3 bits of the decimal parts are used.
>     > + * So the max temperature is (2^8-1) + (2^3-1)/8 = 255.875 degrees.
>     > + */
>     > +#define SBTSI_TEMP_MAX 255875
> 
>     Nitpicking, use _IN_MILLIDEGREE suffix?
> 
> 
> I haven't seen this suffix before, is this a style you'd like to start
> seeing?

Well you used it few lines earlier, in the previous definition:
SBTSI_TEMP_UNIT_IN_MILLIDEGREE :)

>     > +static void sbtsi_init(Object *obj)
>     > +{
>     > +    SBTSIState *s = SBTSI(obj);
>     > +
>     > +    /* Current temperature in millidegrees. */
>     > +    object_property_add(obj, "temperature", "uint32",
> 
>     Can we explicit as "temperature_uC"?
> 
> 
> We can, but that's non-standard.  As I recall most temperature sensors
> in hw/sensors are in millidegrees, but none have unit suffixes.

I tend to agree, but this is not obvious to everybody.

I once started sanitizing / enforcing this but never got there:
https://www.mail-archive.com/qemu-block@nongnu.org/msg65192.html

So I don't mind for your patch, if I keep looking at temp sensors
I'll clean up on top later.

>     > +                        sbtsi_get_temperature, sbtsi_set_temperature,
>     > +                        NULL, NULL);
>     > +    qdev_init_gpio_out_named(DEVICE(obj), &s->alarm,
>     SBTSI_ALARM_L, 0);
>     > +}
>     > +
>     > +static void sbtsi_class_init(ObjectClass *klass, void *data)
>     > +{
>     > +    ResettableClass *rc = RESETTABLE_CLASS(klass);
>     > +    DeviceClass *dc = DEVICE_CLASS(klass);
>     > +    SMBusDeviceClass *k = SMBUS_DEVICE_CLASS(klass);
>     > +
>     > +    dc->desc = "SB-TSI Temperature Sensor";
>     > +    dc->vmsd = &vmstate_sbtsi;
>     > +    k->write_data = sbtsi_write_data;
>     > +    k->receive_byte = sbtsi_read_byte;
>     > +    rc->phases.enter = sbtsi_enter_reset;
>     > +    rc->phases.hold = sbtsi_hold_reset;
> 
>     If my previous patch [*] were in, I'd have asked for:
> 
>            set_bit(DEVICE_CATEGORY_SENSOR, dc->categories);
> 
>     But since it isn't, I'll keep an eye on which goes in first.
> 
>     [*]
>     https://www.mail-archive.com/qemu-devel@nongnu.org/msg847088.html
>     <https://www.mail-archive.com/qemu-devel@nongnu.org/msg847088.html>
> 
>     > diff --git a/tests/qtest/tmp_sbtsi-test.c
>     b/tests/qtest/tmp_sbtsi-test.c
>     > new file mode 100644
>     > index 0000000000..7f5fafacc7
>     > --- /dev/null
>     > +++ b/tests/qtest/tmp_sbtsi-test.c
>     > @@ -0,0 +1,180 @@
>     > +/*
>     > + * QTests for the SBTSI temperature sensor
>     > + *
>     > + * Copyright 2020 Google LLC
>     > + *
>     > + * This program is free software; you can redistribute it and/or
>     modify it
>     > + * under the terms of the GNU General Public License as published
>     by the
>     > + * Free Software Foundation; either version 2 of the License, or
>     > + * (at your option) any later version.
>     > + *
>     > + * This program is distributed in the hope that it will be
>     useful, but WITHOUT
>     > + * ANY WARRANTY; without even the implied warranty of
>     MERCHANTABILITY or
>     > + * FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public
>     License
>     > + * for more details.
>     > + */
>     > +
>     > +#include "qemu/osdep.h"
>     > +
>     > +#include "libqtest-single.h"
>     > +#include "libqos/qgraph.h"
>     > +#include "libqos/i2c.h"
>     > +#include "qapi/qmp/qdict.h"
>     > +#include "qemu/bitops.h"
>     > +
>     > +#define TEST_ID   "sbtsi-test"
>     > +#define TEST_ADDR (0x4c)
>     > +
>     > +/*
>     > + * SB-TSI registers only support SMBus byte data access. "_INT"
>     registers are
>     > + * the integer part of a temperature value or limit, and "_DEC"
>     registers are
>     > + * corresponding decimal parts.
>     > + */
>     > +#define REG_TEMP_INT      0x01 /* RO */
>     > +#define REG_STATUS        0x02 /* RO */
>     > +#define REG_CONFIG        0x03 /* RO */
>     > +#define REG_TEMP_HIGH_INT 0x07 /* RW */
>     > +#define REG_TEMP_LOW_INT  0x08 /* RW */
>     > +#define REG_CONFIG_WR     0x09 /* RW */
>     > +#define REG_TEMP_DEC      0x10 /* RO */
>     > +#define REG_TEMP_HIGH_DEC 0x13 /* RW */
>     > +#define REG_TEMP_LOW_DEC  0x14 /* RW */
>     > +#define REG_ALERT_CONFIG  0xBF /* RW */
>     > +
>     > +#define STATUS_HIGH_ALERT BIT(4)
>     > +#define STATUS_LOW_ALERT  BIT(3)
>     > +#define CONFIG_ALERT_MASK BIT(7)
>     > +#define ALARM_EN          BIT(0)
> 
>     This is the part that could be shared in "include/hw/sensor/sbtsi.h".
> 
> 
> Ack.
>  
> 
> 
>     > +/* The temperature stored are in units of 0.125 degrees. */
>     > +#define TEMP_UNIT_IN_MILLIDEGREE 125
>     > +#define LIMIT_LOW (10500)
>     > +#define LIMIT_HIGH (55125)
> 
>     Nitpicking again, _IN_MILLIDEGREE suffix for coherency?
> 
>     > +static uint32_t qmp_sbtsi_get_temperature(const char *id)
>     > +{
>     > +    QDict *response;
>     > +    int ret;
>     > +
>     > +    response = qmp("{ 'execute': 'qom-get', 'arguments': {
>     'path': %s, "
>     > +                   "'property': 'temperature' } }", id);
> 
>     If renamed earlier, here 'temperature_uC'.
> 
>     > +    g_assert(qdict_haskey(response, "return"));
>     > +    ret = (uint32_t)qdict_get_int(response, "return");
>     > +    qobject_unref(response);
>     > +    return ret;
>     > +}
>     > +
>     > +static void qmp_sbtsi_set_temperature(const char *id, uint32_t value)
>     > +{
>     > +    QDict *response;
>     > +
>     > +    response = qmp("{ 'execute': 'qom-set', 'arguments': {
>     'path': %s, "
>     > +                   "'property': 'temperature', 'value': %d } }",
>     id, value);
>     > +    g_assert(qdict_haskey(response, "return"));
>     > +    qobject_unref(response);
>     > +}
> 
>     Thanks,
> 
>     Phil.
> 
> 
> v2 will come with the header split.  I can split the qtests into a
> separate patch.  Was your point because the patches are applied to
> different staging trees?  Because I would think it ideal to have the
> qtests and the corresponding code applied together so that it's easy to
> know it's working.  If this isn't standard, I can definitely split them.

If split, both patches certainly should be queued consecutively via the
same tree. I asked the split because I'm OK to give a R-b tag for the
hw/ part, but am not sure about the tests/ part. Possibly others would
be OK to review the qtest but would be unsure about the hw/ part.

