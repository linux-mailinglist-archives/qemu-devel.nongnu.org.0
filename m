Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA430207B4
	for <lists+qemu-devel@lfdr.de>; Thu, 16 May 2019 15:11:50 +0200 (CEST)
Received: from localhost ([127.0.0.1]:55733 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hRGAn-0001Wq-QF
	for lists+qemu-devel@lfdr.de; Thu, 16 May 2019 09:11:49 -0400
Received: from eggs.gnu.org ([209.51.188.92]:33381)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1hRG5z-0006iQ-N8
	for qemu-devel@nongnu.org; Thu, 16 May 2019 09:06:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1hRG5v-0002lp-Qj
	for qemu-devel@nongnu.org; Thu, 16 May 2019 09:06:51 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:40655)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1hRG5u-0002j4-2I
	for qemu-devel@nongnu.org; Thu, 16 May 2019 09:06:47 -0400
Received: by mail-wr1-f65.google.com with SMTP id h4so3324767wre.7
	for <qemu-devel@nongnu.org>; Thu, 16 May 2019 06:06:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=GsOddZh3zccATsyz1DAbW69eJJy1KbDmxcnQ3lf24DM=;
	b=XtkcbW3lHukpwvGoTBM5U3WV1/nNc09/vF1qk5Ftgs0lyMtTH4AmTodJKWVHjMRsf9
	GUDrkkVI1cdETuJ76rodz2QFYONINpLAtzHKqaR1Txrlse+JXLyexUFpKy4bwH93kBBb
	Wnm6twZh1853FBK7MTQag5HlrvMtcd6AEEDvA5TYtj3TjBYg0yzkIRFeMcVzXux6MGvq
	fcLt8fAYLGDS+RvzPP5ceqWqepzSj3VxGhGtYwP13nMnJC3pDzqpTZs1jADyCBrcaxCP
	q6ou/k5XsviLMFWaX5Vd+9vlLD1CFbeUfOlD9MDZoPo9wXeTCg7abNSZs7vJtEk/c5Pr
	T1vA==
X-Gm-Message-State: APjAAAWfImCR+w5ymfx+rCf/8jNGsA5H/DLXfLd0iQVs9MDl6MlxB/KA
	BNmkZBory98qZCyYPF43kjXX4g==
X-Google-Smtp-Source: APXvYqzKz2u7fnTRCTZ++KPkaEhH566vj8wRENemurAj+QvTt8GjCQOr+c2ELmH8J8f9kyO7DQx7MA==
X-Received: by 2002:adf:8184:: with SMTP id 4mr31727774wra.27.1558012003094;
	Thu, 16 May 2019 06:06:43 -0700 (PDT)
Received: from [192.168.1.43] (228.red-83-52-173.dynamicip.rima-tde.net.
	[83.52.173.228]) by smtp.gmail.com with ESMTPSA id
	q24sm5464178wmc.18.2019.05.16.06.06.42
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Thu, 16 May 2019 06:06:42 -0700 (PDT)
To: Yoshinori Sato <ysato@users.sourceforge.jp>, qemu-devel@nongnu.org
References: <20190516055244.95559-1-ysato@users.sourceforge.jp>
	<20190516055244.95559-7-ysato@users.sourceforge.jp>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <51774705-41da-ea5b-d08d-62782dd1f872@redhat.com>
Date: Thu, 16 May 2019 15:06:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190516055244.95559-7-ysato@users.sourceforge.jp>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.221.65
Subject: Re: [Qemu-devel] [PATCH v13 06/12] hw/timer: RX62N internal timer
 modules
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, richard.henderson@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Yoshinori,

On 5/16/19 7:52 AM, Yoshinori Sato wrote:
> renesas_tmr: 8bit timer modules.
> renesas_cmt: 16bit compare match timer modules.
> This part use many renesas's CPU.
> Hardware manual.
> https://www.renesas.com/us/en/doc/products/mpumcu/doc/rx_family/r01uh0033ej0140_rx62n.pdf
> 
> Signed-off-by: Yoshinori Sato <ysato@users.sourceforge.jp>
> Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  include/hw/timer/renesas_cmt.h |  38 ++++
>  include/hw/timer/renesas_tmr.h |  50 +++++
>  hw/timer/renesas_cmt.c         | 275 +++++++++++++++++++++++++
>  hw/timer/renesas_tmr.c         | 455 +++++++++++++++++++++++++++++++++++++++++
>  hw/timer/Kconfig               |   6 +
>  hw/timer/Makefile.objs         |   3 +
>  6 files changed, 827 insertions(+)
>  create mode 100644 include/hw/timer/renesas_cmt.h
>  create mode 100644 include/hw/timer/renesas_tmr.h
>  create mode 100644 hw/timer/renesas_cmt.c
>  create mode 100644 hw/timer/renesas_tmr.c
> 
> diff --git a/include/hw/timer/renesas_cmt.h b/include/hw/timer/renesas_cmt.h
> new file mode 100644
> index 0000000000..acd25c6e0b
> --- /dev/null
> +++ b/include/hw/timer/renesas_cmt.h
> @@ -0,0 +1,38 @@
> +/*
> + * Renesas Compare-match timer Object
> + *
> + * Copyright (c) 2019 Yoshinori Sato
> + *
> + * This code is licensed under the GPL version 2 or later.
> + *
> + */
> +
> +#ifndef HW_RENESAS_CMT_H
> +#define HW_RENESAS_CMT_H
> +
> +#include "hw/sysbus.h"
> +
> +#define TYPE_RENESAS_CMT "renesas-cmt"
> +#define RCMT(obj) OBJECT_CHECK(RCMTState, (obj), TYPE_RENESAS_CMT)
> +
> +enum {
> +    CMT_CH = 2,
> +    CMT_NR_IRQ = 1 * CMT_CH,

Odd ;)

> +};
> +
> +typedef struct RCMTState {
> +    SysBusDevice parent_obj;
> +
> +    uint64_t input_freq;
> +    MemoryRegion memory;
> +
> +    uint16_t cmstr;

You can declare a RCmtChannelState structure here {

> +    uint16_t cmcr[CMT_CH];
> +    uint16_t cmcnt[CMT_CH];
> +    uint16_t cmcor[CMT_CH];
> +    int64_t tick[CMT_CH];
> +    qemu_irq cmi[CMT_CH];
> +    QEMUTimer *timer[CMT_CH];

} of count CMT_CH:

       struct RCmtChannelState channel[CMT_CH];

So you can use the same timer callback using &channel[id] as opaque context.

> +} RCMTState;
> +
> +#endif
> diff --git a/include/hw/timer/renesas_tmr.h b/include/hw/timer/renesas_tmr.h
> new file mode 100644
> index 0000000000..de394e64d0
> --- /dev/null
> +++ b/include/hw/timer/renesas_tmr.h
> @@ -0,0 +1,50 @@
> +/*
> + * Renesas 8bit timer Object
> + *
> + * Copyright (c) 2018 Yoshinori Sato
> + *
> + * This code is licensed under the GPL version 2 or later.
> + *
> + */
> +
> +#ifndef HW_RENESAS_TMR_H
> +#define HW_RENESAS_TMR_H
> +
> +#include "hw/sysbus.h"
> +
> +#define TYPE_RENESAS_TMR "renesas-tmr"
> +#define RTMR(obj) OBJECT_CHECK(RTMRState, (obj), TYPE_RENESAS_TMR)
> +
> +enum timer_event {cmia = 0,
> +                  cmib = 1,
> +                  ovi = 2,
> +                  none = 3,
> +                  TMR_NR_EVENTS = 4};

This enum indentation seems screwed, I'm surprise checkpatch did not
complain.

> +enum {
> +    TMR_CH = 2,
> +    TMR_NR_IRQ = 3 * TMR_CH,
> +};
> +
> +typedef struct RTMRState {
> +    SysBusDevice parent_obj;
> +
> +    uint64_t input_freq;
> +    MemoryRegion memory;
> +
> +    uint8_t tcnt[TMR_CH];
> +    uint8_t tcora[TMR_CH];
> +    uint8_t tcorb[TMR_CH];
> +    uint8_t tcr[TMR_CH];
> +    uint8_t tccr[TMR_CH];
> +    uint8_t tcor[TMR_CH];
> +    uint8_t tcsr[TMR_CH];
> +    int64_t tick;
> +    int64_t div_round[TMR_CH];
> +    enum timer_event next[TMR_CH];
> +    qemu_irq cmia[TMR_CH];
> +    qemu_irq cmib[TMR_CH];
> +    qemu_irq ovi[TMR_CH];
> +    QEMUTimer *timer[TMR_CH];

Same 'ChannelState' structure comment applies here.

> +} RTMRState;
> +
> +#endif
> diff --git a/hw/timer/renesas_cmt.c b/hw/timer/renesas_cmt.c
> new file mode 100644
> index 0000000000..a2a2b92055
> --- /dev/null
> +++ b/hw/timer/renesas_cmt.c
> @@ -0,0 +1,275 @@
> +/*
> + * Renesas 16bit Compare-match timer
> + *
> + * Datasheet: RX62N Group, RX621 Group User's Manual: Hardware
> + * (Rev.1.40 R01UH0033EJ0140)
> + *
> + * Copyright (c) 2019 Yoshinori Sato
> + *
> + * This program is free software; you can redistribute it and/or modify it
> + * under the terms and conditions of the GNU General Public License,
> + * version 2 or later, as published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope it will be useful, but WITHOUT
> + * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
> + * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
> + * more details.
> + *
> + * You should have received a copy of the GNU General Public License along with
> + * this program.  If not, see <http://www.gnu.org/licenses/>.
> + */
> +
> +#include "qemu/osdep.h"
> +#include "qemu-common.h"
> +#include "qemu/log.h"
> +#include "qapi/error.h"
> +#include "qemu/timer.h"
> +#include "cpu.h"
> +#include "hw/hw.h"
> +#include "hw/sysbus.h"
> +#include "hw/registerfields.h"
> +#include "hw/timer/renesas_cmt.h"
> +#include "qemu/error-report.h"
> +
> +/*
> + *  +0 CMSTR - common control
> + *  +2 CMCR  - ch0
> + *  +4 CMCNT - ch0
> + *  +6 CMCOR - ch0
> + *  +8 CMCR  - ch1
> + * +10 CMCNT - ch1
> + * +12 CMCOR - ch1
> + * If we think that the address of CH 0 has an offset of +2,
> + * we can treat it with the same address as CH 1, so define it like that.
> + */
> +REG16(CMSTR, 0)
> +  FIELD(CMSTR, STR0, 0, 1)
> +  FIELD(CMSTR, STR1, 1, 1)
> +  FIELD(CMSTR, STR,  0, 2)
> +/* This addeess is channel offset */
> +REG16(CMCR, 0)
> +  FIELD(CMCR, CKS, 0, 2)
> +  FIELD(CMCR, CMIE, 6, 1)
> +REG16(CMCNT, 2)
> +REG16(CMCOR, 4)
> +
> +static void update_events(RCMTState *cmt, int ch)
> +{
> +    int64_t next_time;
> +
> +    if ((cmt->cmstr & (1 << ch)) == 0) {
> +        /* count disable, so not happened next event. */
> +        return ;
> +    }
> +    next_time = cmt->cmcor[ch] - cmt->cmcnt[ch];
> +    next_time *= NANOSECONDS_PER_SECOND;
> +    next_time /= cmt->input_freq;
> +    /*
> +     * CKS -> div rate
> +     *  0 -> 8 (1 << 3)
> +     *  1 -> 32 (1 << 5)
> +     *  2 -> 128 (1 << 7)
> +     *  3 -> 512 (1 << 9)
> +     */
> +    next_time *= 1 << (3 + FIELD_EX16(cmt->cmcr[ch], CMCR, CKS) * 2);
> +    next_time += qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
> +    timer_mod(cmt->timer[ch], next_time);
> +}
> +
> +static int64_t read_cmcnt(RCMTState *cmt, int ch)
> +{
> +    int64_t delta, now = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
> +
> +    if (cmt->cmstr & (1 << ch)) {
> +        delta = (now - cmt->tick[ch]);
> +        delta /= NANOSECONDS_PER_SECOND;
> +        delta /= cmt->input_freq;
> +        delta /= 1 << (3 + FIELD_EX16(cmt->cmcr[ch], CMCR, CKS) * 2);
> +        cmt->tick[ch] = now;
> +        return cmt->cmcnt[ch] + delta;
> +    } else {
> +        return cmt->cmcnt[ch];
> +    }
> +}
> +
> +static uint64_t cmt_read(void *opaque, hwaddr addr, unsigned size)
> +{
> +    hwaddr offset = addr & 0x0f;
> +    RCMTState *cmt = opaque;
> +    int ch = offset / 0x08;
> +    uint64_t ret;
> +
> +    if (offset == A_CMSTR) {
> +        ret = 0;
> +        ret = FIELD_DP16(ret, CMSTR, STR,
> +                         FIELD_EX16(cmt->cmstr, CMSTR, STR));
> +        return ret;
> +    } else {
> +        offset &= 0x07;
> +        if (ch == 0) {
> +            offset -= 0x02;
> +        }
> +        switch (offset) {
> +        case A_CMCR:
> +            ret = 0;
> +            ret = FIELD_DP16(ret, CMCR, CKS,
> +                             FIELD_EX16(cmt->cmstr, CMCR, CKS));
> +            ret = FIELD_DP16(ret, CMCR, CMIE,
> +                             FIELD_EX16(cmt->cmstr, CMCR, CMIE));
> +            return ret;
> +        case A_CMCNT:
> +            return read_cmcnt(cmt, ch);
> +        case A_CMCOR:
> +            return cmt->cmcor[ch];
> +        }
> +    }
> +    qemu_log_mask(LOG_UNIMP, "renesas_cmt: Register 0x%"
> +                  HWADDR_PRIX " not implemented\n", offset);
> +    return UINT64_MAX;
> +}
> +
> +static void start_stop(RCMTState *cmt, int ch, int st)
> +{
> +    if (st) {
> +        update_events(cmt, ch);
> +    } else {
> +        timer_del(cmt->timer[ch]);
> +    }
> +}
> +
> +static void cmt_write(void *opaque, hwaddr addr, uint64_t val, unsigned size)
> +{
> +    hwaddr offset = addr & 0x0f;
> +    RCMTState *cmt = opaque;
> +    int ch = offset / 0x08;
> +
> +    if (offset == A_CMSTR) {
> +        cmt->cmstr = FIELD_EX16(val, CMSTR, STR);
> +        start_stop(cmt, 0, FIELD_EX16(cmt->cmstr, CMSTR, STR0));
> +        start_stop(cmt, 1, FIELD_EX16(cmt->cmstr, CMSTR, STR1));
> +    } else {
> +        offset &= 0x07;
> +        if (ch == 0) {
> +            offset -= 0x02;
> +        }
> +        switch (offset) {
> +        case A_CMCR:
> +            cmt->cmcr[ch] = FIELD_DP16(cmt->cmcr[ch], CMCR, CKS,
> +                                       FIELD_EX16(val, CMCR, CKS));
> +            cmt->cmcr[ch] = FIELD_DP16(cmt->cmcr[ch], CMCR, CMIE,
> +                                       FIELD_EX16(val, CMCR, CMIE));
> +            break;
> +        case 2:
> +            cmt->cmcnt[ch] = val;
> +            break;
> +        case 4:
> +            cmt->cmcor[ch] = val;
> +            break;
> +        default:
> +            qemu_log_mask(LOG_UNIMP, "renesas_cmt: Register -0x%" HWADDR_PRIX
> +                          " not implemented\n", offset);
> +            return;
> +        }
> +        if (FIELD_EX16(cmt->cmstr, CMSTR, STR) & (1 << ch)) {
> +            update_events(cmt, ch);
> +        }
> +    }
> +}
> +
> +static const MemoryRegionOps cmt_ops = {
> +    .write = cmt_write,
> +    .read  = cmt_read,
> +    .endianness = DEVICE_NATIVE_ENDIAN,
> +    .impl = {
> +        .min_access_size = 2,
> +        .max_access_size = 2,
> +    },
> +};
> +
> +static void timer_events(RCMTState *cmt, int ch)
> +{
> +    cmt->cmcnt[ch] = 0;
> +    cmt->tick[ch] = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
> +    update_events(cmt, ch);
> +    if (FIELD_EX16(cmt->cmcr[ch], CMCR, CMIE)) {
> +        qemu_irq_pulse(cmt->cmi[ch]);
> +    }
> +}
> +
> +static void timer_event0(void *opaque)
> +{
> +    RCMTState *cmt = opaque;
> +
> +    timer_events(cmt, 0);
> +}
> +
> +static void timer_event1(void *opaque)
> +{
> +    RCMTState *cmt = opaque;
> +
> +    timer_events(cmt, 1);
> +}
> +
> +static void rcmt_reset(DeviceState *dev)
> +{
> +    RCMTState *cmt = RCMT(dev);
> +    cmt->cmstr = 0;
> +    cmt->cmcr[0] = cmt->cmcr[1] = 0;
> +    cmt->cmcnt[0] = cmt->cmcnt[1] = 0;
> +    cmt->cmcor[0] = cmt->cmcor[1] = 0xffff;
> +}
> +
> +static void rcmt_init(Object *obj)
> +{
> +    SysBusDevice *d = SYS_BUS_DEVICE(obj);
> +    RCMTState *cmt = RCMT(obj);
> +    int i;
> +
> +    memory_region_init_io(&cmt->memory, OBJECT(cmt), &cmt_ops,
> +                          cmt, "renesas-cmt", 0x10);
> +    sysbus_init_mmio(d, &cmt->memory);
> +
> +    for (i = 0; i < ARRAY_SIZE(cmt->cmi); i++) {
> +        sysbus_init_irq(d, &cmt->cmi[i]);
> +    }
> +    cmt->timer[0] = timer_new_ns(QEMU_CLOCK_VIRTUAL, timer_event0, cmt);
> +    cmt->timer[1] = timer_new_ns(QEMU_CLOCK_VIRTUAL, timer_event1, cmt);
> +}
> +
> +static const VMStateDescription vmstate_rcmt = {
> +    .name = "rx-cmt",
> +    .version_id = 1,
> +    .minimum_version_id = 1,
> +    .fields = (VMStateField[]) {
> +        VMSTATE_END_OF_LIST()
> +    }
> +};
> +
> +static Property rcmt_properties[] = {
> +    DEFINE_PROP_UINT64("input-freq", RCMTState, input_freq, 0),
> +    DEFINE_PROP_END_OF_LIST(),
> +};
> +
> +static void rcmt_class_init(ObjectClass *klass, void *data)
> +{
> +    DeviceClass *dc = DEVICE_CLASS(klass);
> +
> +    dc->props = rcmt_properties;
> +    dc->vmsd = &vmstate_rcmt;
> +    dc->reset = rcmt_reset;
> +}
> +
> +static const TypeInfo rcmt_info = {
> +    .name       = TYPE_RENESAS_CMT,
> +    .parent     = TYPE_SYS_BUS_DEVICE,
> +    .instance_size = sizeof(RCMTState),
> +    .instance_init = rcmt_init,
> +    .class_init = rcmt_class_init,
> +};
> +
> +static void rcmt_register_types(void)
> +{
> +    type_register_static(&rcmt_info);
> +}
> +
> +type_init(rcmt_register_types)
> diff --git a/hw/timer/renesas_tmr.c b/hw/timer/renesas_tmr.c
> new file mode 100644
> index 0000000000..aa12ca7726
> --- /dev/null
> +++ b/hw/timer/renesas_tmr.c
> @@ -0,0 +1,455 @@
> +/*
> + * Renesas 8bit timer
> + *
> + * Datasheet: RX62N Group, RX621 Group User's Manual: Hardware
> + * (Rev.1.40 R01UH0033EJ0140)
> + *
> + * Copyright (c) 2019 Yoshinori Sato
> + *
> + * This program is free software; you can redistribute it and/or modify it
> + * under the terms and conditions of the GNU General Public License,
> + * version 2 or later, as published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope it will be useful, but WITHOUT
> + * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
> + * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
> + * more details.
> + *
> + * You should have received a copy of the GNU General Public License along with
> + * this program.  If not, see <http://www.gnu.org/licenses/>.
> + */
> +
> +#include "qemu/osdep.h"
> +#include "qemu-common.h"
> +#include "qemu/log.h"
> +#include "qapi/error.h"
> +#include "qemu/timer.h"
> +#include "qemu/bitops.h"
> +#include "cpu.h"
> +#include "hw/hw.h"
> +#include "hw/sysbus.h"
> +#include "hw/registerfields.h"
> +#include "hw/timer/renesas_tmr.h"
> +#include "qemu/error-report.h"
> +
> +REG8(TCR, 0)
> +  FIELD(TCR, CCLR, 3, 2)
> +  FIELD(TCR, OVIE, 5, 1)
> +  FIELD(TCR, CMIEA, 6, 1)
> +  FIELD(TCR, CMIEB, 7, 1)
> +REG8(TCSR, 2)
> +  FIELD(TCSR, OSA, 0, 2)
> +  FIELD(TCSR, OSB, 2, 2)
> +  FIELD(TCSR, ADTE, 4, 2)
> +REG8(TCORA, 4)
> +REG8(TCORB, 6)
> +REG8(TCNT, 8)
> +REG8(TCCR, 10)
> +  FIELD(TCCR, CKS, 0, 3)
> +  FIELD(TCCR, CSS, 3, 2)
> +  FIELD(TCCR, TMRIS, 7, 1)
> +
> +#define INTERNAL  0x01
> +#define CASCADING 0x03
> +#define CCLR_A    0x01
> +#define CCLR_B    0x02
> +
> +static const int clkdiv[] = {0, 1, 2, 8, 32, 64, 1024, 8192};
> +
> +#define concat_reg(reg) ((reg[0] << 8) | reg[1])
> +static void update_events(RTMRState *tmr, int ch)
> +{
> +    uint16_t diff[TMR_NR_EVENTS], min;
> +    int64_t next_time;
> +    int i, event;
> +
> +    if (tmr->tccr[ch] == 0) {
> +        return ;
> +    }
> +    if (FIELD_EX8(tmr->tccr[ch], TCCR, CSS) == 0) {
> +        /* external clock mode */
> +        /* event not happened */
> +        return ;
> +    }
> +    if (FIELD_EX8(tmr->tccr[0], TCCR, CSS) == CASCADING) {
> +        /* cascading mode */
> +        if (ch == 1) {
> +            tmr->next[ch] = none;
> +            return ;
> +        }
> +        diff[cmia] = concat_reg(tmr->tcora) - concat_reg(tmr->tcnt);
> +        diff[cmib] = concat_reg(tmr->tcorb) - concat_reg(tmr->tcnt);
> +        diff[ovi] = 0x10000 - concat_reg(tmr->tcnt);
> +    } else {
> +        /* separate mode */
> +        diff[cmia] = tmr->tcora[ch] - tmr->tcnt[ch];
> +        diff[cmib] = tmr->tcorb[ch] - tmr->tcnt[ch];
> +        diff[ovi] = 0x100 - tmr->tcnt[ch];
> +    }
> +    /* Search for the most recently occurring event. */
> +    for (event = 0, min = diff[0], i = 1; i < none; i++) {
> +        if (min > diff[i]) {
> +            event = i;
> +            min = diff[i];
> +        }
> +    }
> +    tmr->next[ch] = event;
> +    next_time = diff[event];
> +    next_time *= clkdiv[FIELD_EX8(tmr->tccr[ch], TCCR, CKS)];
> +    next_time *= NANOSECONDS_PER_SECOND;
> +    next_time /= tmr->input_freq;
> +    next_time += qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
> +    timer_mod(tmr->timer[ch], next_time);
> +}
> +
> +
> +static inline int elapsed_time(RTMRState *tmr, int ch, int64_t delta)
> +{
> +    int divrate = clkdiv[FIELD_EX8(tmr->tccr[ch], TCCR, CKS)];
> +    int et;
> +
> +    tmr->div_round[ch] += delta;
> +    if (divrate > 0) {
> +        et = tmr->div_round[ch] / divrate;
> +        tmr->div_round[ch] %= divrate;
> +    } else {
> +        /* disble clock. so no update */
> +        et = 0;
> +    }
> +    return et;
> +}
> +static uint16_t read_tcnt(RTMRState *tmr, unsigned size, int ch)
> +{
> +    int64_t delta, now = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
> +    int elapsed, ovf = 0;
> +    uint16_t tcnt[2];
> +    uint32_t ret;
> +
> +    delta = (now - tmr->tick) * NANOSECONDS_PER_SECOND / tmr->input_freq;
> +    if (delta > 0) {
> +        tmr->tick = now;
> +
> +        if (FIELD_EX8(tmr->tccr[1], TCCR, CSS) == INTERNAL) {
> +            /* timer1 count update */
> +            elapsed = elapsed_time(tmr, 1, delta);
> +            if (elapsed >= 0x100) {
> +                ovf = elapsed >> 8;
> +            }
> +            tcnt[1] = tmr->tcnt[1] + (elapsed & 0xff);
> +        }
> +        switch (FIELD_EX8(tmr->tccr[0], TCCR, CSS)) {
> +        case INTERNAL:
> +            elapsed = elapsed_time(tmr, 0, delta);
> +            tcnt[0] = tmr->tcnt[0] + elapsed;
> +            break;
> +        case CASCADING:
> +            if (ovf > 0) {
> +                tcnt[0] = tmr->tcnt[0] + ovf;
> +            }
> +            break;
> +        }
> +    } else {
> +        tcnt[0] = tmr->tcnt[0];
> +        tcnt[1] = tmr->tcnt[1];
> +    }
> +    if (size == 1) {
> +        return tcnt[ch];
> +    } else {
> +        ret = 0;
> +        ret = deposit32(ret, 0, 8, tcnt[1]);
> +        ret = deposit32(ret, 8, 8, tcnt[0]);
> +        return ret;
> +    }
> +}
> +
> +static inline uint8_t read_tccr(uint8_t r)
> +{
> +    uint8_t tccr = 0;
> +    tccr = FIELD_DP8(tccr, TCCR, TMRIS,
> +                     FIELD_EX8(r, TCCR, TMRIS));
> +    tccr = FIELD_DP8(tccr, TCCR, CSS,
> +                     FIELD_EX8(r, TCCR, CSS));
> +    tccr = FIELD_DP8(tccr, TCCR, CKS,
> +                     FIELD_EX8(r, TCCR, CKS));
> +    return tccr;
> +}
> +
> +static uint64_t tmr_read(void *opaque, hwaddr addr, unsigned size)
> +{
> +    RTMRState *tmr = opaque;
> +    int ch = addr & 1;
> +    uint64_t ret;
> +
> +    if (size == 2 && (ch != 0 || addr == A_TCR || addr == A_TCSR)) {
> +        qemu_log_mask(LOG_GUEST_ERROR, "renesas_tmr: Invalid read size 0x%"
> +                      HWADDR_PRIX "\n", addr);
> +        return UINT64_MAX;
> +    }
> +    switch (addr & 0x0e) {
> +    case A_TCR:
> +        ret = 0;
> +        ret = FIELD_DP8(ret, TCR, CCLR,
> +                        FIELD_EX8(tmr->tcr[ch], TCR, CCLR));
> +        ret = FIELD_DP8(ret, TCR, OVIE,
> +                        FIELD_EX8(tmr->tcr[ch], TCR, OVIE));
> +        ret = FIELD_DP8(ret, TCR, CMIEA,
> +                        FIELD_EX8(tmr->tcr[ch], TCR, CMIEA));
> +        ret = FIELD_DP8(ret, TCR, CMIEB,
> +                        FIELD_EX8(tmr->tcr[ch], TCR, CMIEB));
> +        return ret;
> +    case A_TCSR:
> +        ret = 0;
> +        ret = FIELD_DP8(ret, TCSR, OSA,
> +                        FIELD_EX8(tmr->tcsr[ch], TCSR, OSA));
> +        ret = FIELD_DP8(ret, TCSR, OSB,
> +                        FIELD_EX8(tmr->tcsr[ch], TCSR, OSB));
> +        switch (ch) {
> +        case 0:
> +            ret = FIELD_DP8(ret, TCSR, ADTE,
> +                            FIELD_EX8(tmr->tcsr[ch], TCSR, ADTE));
> +            break;
> +        case 1: /* CH1 ADTE unimplement always 1 */
> +            ret = FIELD_DP8(ret, TCSR, ADTE, 1);
> +            break;
> +        }
> +        return ret;
> +    case A_TCORA:
> +        if (size == 1) {
> +            return tmr->tcora[ch];
> +        } else if (ch == 0) {
> +            return concat_reg(tmr->tcora);
> +        }
> +    case A_TCORB:
> +        if (size == 1) {
> +            return tmr->tcorb[ch];
> +        } else {
> +            return concat_reg(tmr->tcorb);
> +        }
> +    case A_TCNT:
> +        return read_tcnt(tmr, size, ch);
> +    case A_TCCR:
> +        if (size == 1) {
> +            return read_tccr(tmr->tccr[ch]);
> +        } else {
> +            return read_tccr(tmr->tccr[0]) << 8 | read_tccr(tmr->tccr[1]);
> +        }
> +    default:
> +        qemu_log_mask(LOG_UNIMP, "renesas_tmr: Register 0x%" HWADDR_PRIX
> +                      " not implemented\n", addr);
> +        break;
> +    }
> +    return UINT64_MAX;
> +}
> +
> +#define COUNT_WRITE(reg, val)                   \
> +    do {                                        \
> +        if (size == 1) {                        \
> +            tmr->reg[ch] = val;                 \
> +            update_events(tmr, ch);             \
> +        } else {                                \
> +            tmr->reg[0] = extract32(val, 8, 8); \
> +            tmr->reg[1] = extract32(val, 0, 8); \
> +            update_events(tmr, 0);              \
> +            update_events(tmr, 1);              \
> +        }                                       \
> +    } while (0)
> +
> +static void tmr_write(void *opaque, hwaddr addr, uint64_t val, unsigned size)
> +{
> +    RTMRState *tmr = opaque;
> +    int ch = addr & 1;
> +
> +    if (size == 2 && (ch != 0 || addr == A_TCR || addr == A_TCSR)) {
> +        qemu_log_mask(LOG_GUEST_ERROR,
> +                      "renesas_tmr: Invalid write size 0x%" HWADDR_PRIX
> +                      "\n", addr);
> +        return;
> +    }
> +    switch (addr & 0x0e) {
> +    case A_TCR:
> +        tmr->tcr[ch] = val;
> +        break;
> +    case A_TCSR:
> +        tmr->tcsr[ch] = val;
> +        break;
> +    case A_TCORA:
> +        COUNT_WRITE(tcora, val);
> +        break;
> +    case A_TCORB:
> +        COUNT_WRITE(tcorb, val);
> +        break;
> +    case A_TCNT:
> +        COUNT_WRITE(tcnt, val);
> +        break;
> +    case A_TCCR:
> +        COUNT_WRITE(tccr, val);
> +        break;
> +    default:
> +        qemu_log_mask(LOG_UNIMP, "renesas_tmr: Register 0x%" HWADDR_PRIX
> +                      " not implemented\n", addr);
> +        break;
> +    }
> +}
> +
> +static const MemoryRegionOps tmr_ops = {
> +    .write = tmr_write,
> +    .read  = tmr_read,
> +    .endianness = DEVICE_LITTLE_ENDIAN,
> +    .impl = {
> +        .min_access_size = 1,
> +        .max_access_size = 2,
> +    },
> +};
> +
> +static void timer_events(RTMRState *tmr, int ch);
> +
> +static uint16_t issue_event(RTMRState *tmr, int ch, int sz,
> +                        uint16_t tcnt, uint16_t tcora, uint16_t tcorb)
> +{
> +    uint16_t ret = tcnt;
> +
> +    switch (tmr->next[ch]) {
> +    case none:
> +        break;
> +    case cmia:
> +        if (tcnt >= tcora) {
> +            if (FIELD_EX8(tmr->tcr[ch], TCR, CCLR) == CCLR_A) {
> +                ret = tcnt - tcora;
> +            }
> +            if (FIELD_EX8(tmr->tcr[ch], TCR, CMIEA)) {
> +                qemu_irq_pulse(tmr->cmia[ch]);
> +            }
> +            if (sz == 8 && ch == 0 &&
> +                FIELD_EX8(tmr->tccr[1], TCCR, CSS) == CASCADING) {
> +                tmr->tcnt[1]++;
> +                timer_events(tmr, 1);
> +            }
> +        }
> +        break;
> +    case cmib:
> +        if (tcnt >= tcorb) {
> +            if (FIELD_EX8(tmr->tcr[ch], TCR, CCLR) == CCLR_B) {
> +                ret = tcnt - tcorb;
> +            }
> +            if (FIELD_EX8(tmr->tcr[ch], TCR, CMIEB)) {
> +                qemu_irq_pulse(tmr->cmib[ch]);
> +            }
> +        }
> +        break;
> +    case ovi:
> +        if ((tcnt >= (1 << sz)) && FIELD_EX8(tmr->tcr[ch], TCR, OVIE)) {
> +            qemu_irq_pulse(tmr->ovi[ch]);
> +        }
> +        break;
> +    default:
> +        g_assert_not_reached();
> +    }
> +    return ret;
> +}
> +
> +static void timer_events(RTMRState *tmr, int ch)
> +{
> +    uint16_t tcnt;
> +    tmr->tcnt[ch] = read_tcnt(tmr, 1, ch);
> +    if (FIELD_EX8(tmr->tccr[0], TCCR, CSS) != CASCADING) {
> +        tmr->tcnt[ch] = issue_event(tmr, ch, 8,
> +                                    tmr->tcnt[ch],
> +                                    tmr->tcora[ch], tmr->tcorb[ch]) & 0xff;
> +    } else {
> +        if (ch == 1) {
> +            return ;
> +        }
> +        tcnt = issue_event(tmr, ch, 16,
> +                           concat_reg(tmr->tcnt),
> +                           concat_reg(tmr->tcora),
> +                           concat_reg(tmr->tcorb));
> +        tmr->tcnt[0] = (tcnt >> 8) & 0xff;
> +        tmr->tcnt[1] = tcnt & 0xff;
> +    }
> +    update_events(tmr, ch);
> +}
> +
> +static void timer_event0(void *opaque)
> +{
> +    RTMRState *tmr = opaque;
> +
> +    timer_events(tmr, 0);
> +}
> +
> +static void timer_event1(void *opaque)
> +{
> +    RTMRState *tmr = opaque;
> +
> +    timer_events(tmr, 1);
> +}
> +
> +static void rtmr_reset(DeviceState *dev)
> +{
> +    RTMRState *tmr = RTMR(dev);
> +    tmr->tcr[0]   = tmr->tcr[1]   = 0x00;
> +    tmr->tcsr[0]  = 0x00;
> +    tmr->tcsr[1]  = 0x10;
> +    tmr->tcnt[0]  = tmr->tcnt[1]  = 0x00;
> +    tmr->tcora[0] = tmr->tcora[1] = 0xff;
> +    tmr->tcorb[0] = tmr->tcorb[1] = 0xff;
> +    tmr->tccr[0]  = tmr->tccr[1]  = 0x00;
> +    tmr->next[0]  = tmr->next[1]  = none;
> +    tmr->tick = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
> +}
> +
> +static void rtmr_init(Object *obj)
> +{
> +    SysBusDevice *d = SYS_BUS_DEVICE(obj);
> +    RTMRState *tmr = RTMR(obj);
> +    int i;
> +
> +    memory_region_init_io(&tmr->memory, OBJECT(tmr), &tmr_ops,
> +                          tmr, "renesas-tmr", 0x10);
> +    sysbus_init_mmio(d, &tmr->memory);
> +
> +    for (i = 0; i < ARRAY_SIZE(tmr->ovi); i++) {
> +        sysbus_init_irq(d, &tmr->cmia[i]);
> +        sysbus_init_irq(d, &tmr->cmib[i]);
> +        sysbus_init_irq(d, &tmr->ovi[i]);
> +    }
> +    tmr->timer[0] = timer_new_ns(QEMU_CLOCK_VIRTUAL, timer_event0, tmr);
> +    tmr->timer[1] = timer_new_ns(QEMU_CLOCK_VIRTUAL, timer_event1, tmr);
> +}
> +
> +static const VMStateDescription vmstate_rtmr = {
> +    .name = "rx-tmr",
> +    .version_id = 1,
> +    .minimum_version_id = 1,
> +    .fields = (VMStateField[]) {
> +        VMSTATE_END_OF_LIST()
> +    }
> +};
> +
> +static Property rtmr_properties[] = {
> +    DEFINE_PROP_UINT64("input-freq", RTMRState, input_freq, 0),
> +    DEFINE_PROP_END_OF_LIST(),
> +};
> +
> +static void rtmr_class_init(ObjectClass *klass, void *data)
> +{
> +    DeviceClass *dc = DEVICE_CLASS(klass);
> +
> +    dc->props = rtmr_properties;
> +    dc->vmsd = &vmstate_rtmr;
> +    dc->reset = rtmr_reset;
> +}
> +
> +static const TypeInfo rtmr_info = {
> +    .name       = TYPE_RENESAS_TMR,
> +    .parent     = TYPE_SYS_BUS_DEVICE,
> +    .instance_size = sizeof(RTMRState),
> +    .instance_init = rtmr_init,
> +    .class_init = rtmr_class_init,
> +};
> +
> +static void rtmr_register_types(void)
> +{
> +    type_register_static(&rtmr_info);
> +}
> +
> +type_init(rtmr_register_types)
> diff --git a/hw/timer/Kconfig b/hw/timer/Kconfig
> index 51921eb63f..2249458f42 100644
> --- a/hw/timer/Kconfig
> +++ b/hw/timer/Kconfig
> @@ -61,3 +61,9 @@ config CMSDK_APB_TIMER
>  config CMSDK_APB_DUALTIMER
>      bool
>      select PTIMER
> +
> +config RENESAS_TMR8
> +    bool
> +
> +config RENESAS_CMT
> +    bool
> diff --git a/hw/timer/Makefile.objs b/hw/timer/Makefile.objs
> index 0e9a4530f8..86a75bc8d8 100644
> --- a/hw/timer/Makefile.objs
> +++ b/hw/timer/Makefile.objs
> @@ -40,6 +40,9 @@ obj-$(CONFIG_MC146818RTC) += mc146818rtc.o
>  
>  obj-$(CONFIG_ALLWINNER_A10_PIT) += allwinner-a10-pit.o
>  
> +obj-$(CONFIG_RENESAS_TMR8) += renesas_tmr.o
> +obj-$(CONFIG_RENESAS_CMT) += renesas_cmt.o
> +
>  common-obj-$(CONFIG_STM32F2XX_TIMER) += stm32f2xx_timer.o
>  common-obj-$(CONFIG_ASPEED_SOC) += aspeed_timer.o
>  
> 

I haven't verified all the register bits checking with the datasheet,
except that, good work!
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

