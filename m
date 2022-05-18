Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2241252C3E6
	for <lists+qemu-devel@lfdr.de>; Wed, 18 May 2022 22:01:02 +0200 (CEST)
Received: from localhost ([::1]:45090 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nrPqu-0007vW-Nh
	for lists+qemu-devel@lfdr.de; Wed, 18 May 2022 16:01:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34884)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nrPpU-0006zF-12
 for qemu-devel@nongnu.org; Wed, 18 May 2022 15:59:32 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631]:37831)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nrPpQ-0003rj-Hw
 for qemu-devel@nongnu.org; Wed, 18 May 2022 15:59:31 -0400
Received: by mail-pl1-x631.google.com with SMTP id m12so2788207plb.4
 for <qemu-devel@nongnu.org>; Wed, 18 May 2022 12:59:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=mvm3WSEXU8dywkSokoHIb0fQll81yGOj0XATyR73Qtg=;
 b=qGfiP92AMlR4pQh6ohgqh4hVT0cLP/3s49/oKnKeJNqatZRbGU/JgZfdELm0JxdMXm
 mlGa3fLT42jcQlDkVzkOiMHqKnyViRXZXxZV4/C8E7zPrgiET+RxJ+zfBCGcVmz498Ez
 t4zt1N4U4BaDiROgDz8bsz0bR5SXGDhhHsz/A1amH6IejPFvcrl3hDD+wVVWXnRx7imb
 2Zl8QdoSdtioqlvj0v54HZH0JmY3Qe2nX5Pwc5u6HlEwpyXJPx4G763nU/bHDE9ll4ot
 JSi7b7Y/7stPMNdh1ZDFsQTDrtTNNzQ1iWcypKTItmQj15N8tYVlWlZ1Dt4hs9pr1mtY
 SHkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=mvm3WSEXU8dywkSokoHIb0fQll81yGOj0XATyR73Qtg=;
 b=LbLyG9iECJAlLOo9PI5FsGQZzecjO+3iLkZkEJ3Ko8WIGk8n4a0lk9s30STNA9IqTD
 Nu/cmJi+C+RYGaDHm+ZINVhz3WVUOkoNHDQ7wN3rBsK6Z/V5T0OrE8lD32wJ2KqM2gDe
 wQ2LqeWB9FPrU1qUdHCYd1qtzZC3zmIfo3vr7i7u4uWGtvLKuNwMPcPLld5WpQDzo6db
 9CqhE66/wFHi2iB8rAAywVX1C1prDqt/9GAsUWxgd4VjcqzYwZCWSq+TBmqgmIME1Zua
 5TvHOQX/dF77Y8b9Td1C5GrfGWhFMQkeM3atlCJvw3Hz7angZX2BQwcD3HFhNr7GzwI/
 9wHQ==
X-Gm-Message-State: AOAM533UZv8hVeQiDugdLGdV1ZFC5/HWbb8+ActDST+vaoopB2lAboFP
 a5BB3kegC7/zaWCCAZX20MUyEQ==
X-Google-Smtp-Source: ABdhPJxIvJJ2rrHVLcpdC4Bhoga6stUCX5n1lQIvBF23gndRNOsHMZpTDNGwaUVGq0Z7qwvHEBAVFQ==
X-Received: by 2002:a17:902:e9d3:b0:161:aa01:b956 with SMTP id
 19-20020a170902e9d300b00161aa01b956mr1212454plk.110.1652903966820; 
 Wed, 18 May 2022 12:59:26 -0700 (PDT)
Received: from [192.168.1.6] ([71.212.142.129])
 by smtp.gmail.com with ESMTPSA id
 p127-20020a622985000000b0050dc76281c1sm2347436pfp.155.2022.05.18.12.59.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 May 2022 12:59:26 -0700 (PDT)
Message-ID: <5cb736a8-e502-e9b0-2e9f-a59546de4807@linaro.org>
Date: Wed, 18 May 2022 12:59:24 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v4 38/43] hw/loongarch: Add LoongArch ls7a rtc device
 support
Content-Language: en-US
To: Xiaojuan Yang <yangxiaojuan@loongson.cn>, qemu-devel@nongnu.org
Cc: gaosong@loongson.cn, mark.cave-ayland@ilande.co.uk, mst@redhat.com,
 imammedo@redhat.com, ani@anisinha.ca
References: <20220517113023.3051143-1-yangxiaojuan@loongson.cn>
 <20220517113023.3051143-39-yangxiaojuan@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220517113023.3051143-39-yangxiaojuan@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 5/17/22 04:30, Xiaojuan Yang wrote:
> This patch add ls7a rtc device support.
> 
> Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
> Signed-off-by: Song Gao <gaosong@loongson.cn>
> ---
>   MAINTAINERS                |   1 +
>   hw/loongarch/Kconfig       |   1 +
>   hw/loongarch/loongson3.c   |   4 +
>   hw/rtc/Kconfig             |   3 +
>   hw/rtc/ls7a_rtc.c          | 526 +++++++++++++++++++++++++++++++++++++
>   hw/rtc/meson.build         |   1 +
>   include/hw/pci-host/ls7a.h |   4 +
>   7 files changed, 540 insertions(+)
>   create mode 100644 hw/rtc/ls7a_rtc.c
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 8c3cac8d20..6e03a8bca8 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1137,6 +1137,7 @@ F: include/hw/loongarch/virt.h
>   F: include/hw/intc/loongarch_*.h
>   F: hw/intc/loongarch_*.c
>   F: include/hw/pci-host/ls7a.h
> +F: hw/rtc/ls7a_rtc.c
>   
>   M68K Machines
>   -------------
> diff --git a/hw/loongarch/Kconfig b/hw/loongarch/Kconfig
> index 8552ff4bee..35b6680772 100644
> --- a/hw/loongarch/Kconfig
> +++ b/hw/loongarch/Kconfig
> @@ -13,3 +13,4 @@ config LOONGARCH_VIRT
>       select LOONGARCH_PCH_PIC
>       select LOONGARCH_PCH_MSI
>       select LOONGARCH_EXTIOI
> +    select LS7A_RTC
> diff --git a/hw/loongarch/loongson3.c b/hw/loongarch/loongson3.c
> index 7bc17113dc..2c04ddeadd 100644
> --- a/hw/loongarch/loongson3.c
> +++ b/hw/loongarch/loongson3.c
> @@ -97,6 +97,10 @@ static void loongarch_devices_init(DeviceState *pch_pic)
>        * Create some unimplemented devices to emulate this.
>        */
>       create_unimplemented_device("pci-dma-cfg", 0x1001041c, 0x4);
> +
> +    sysbus_create_simple("ls7a_rtc", LS7A_RTC_REG_BASE,
> +                         qdev_get_gpio_in(pch_pic,
> +                         LS7A_RTC_IRQ - PCH_PIC_IRQ_OFFSET));
>   }
>   
>   static void loongarch_irq_init(LoongArchMachineState *lams)
> diff --git a/hw/rtc/Kconfig b/hw/rtc/Kconfig
> index 730c272bc5..d0d8dda084 100644
> --- a/hw/rtc/Kconfig
> +++ b/hw/rtc/Kconfig
> @@ -27,3 +27,6 @@ config SUN4V_RTC
>   
>   config GOLDFISH_RTC
>       bool
> +
> +config LS7A_RTC
> +    bool
> diff --git a/hw/rtc/ls7a_rtc.c b/hw/rtc/ls7a_rtc.c
> new file mode 100644
> index 0000000000..398afdc8b0
> --- /dev/null
> +++ b/hw/rtc/ls7a_rtc.c
> @@ -0,0 +1,526 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +/*
> + * Loongarch LS7A Real Time Clock emulation
> + *
> + * Copyright (C) 2021 Loongson Technology Corporation Limited
> + */
> +
> +#include "qemu/osdep.h"
> +#include "hw/sysbus.h"
> +#include "hw/irq.h"
> +#include "include/hw/register.h"
> +#include "qemu/timer.h"
> +#include "sysemu/sysemu.h"
> +#include "qemu/cutils.h"
> +#include "qemu/log.h"
> +#include "migration/vmstate.h"
> +#include "hw/misc/unimp.h"
> +#include "sysemu/rtc.h"
> +#include "hw/registerfields.h"
> +
> +#define SYS_TOYTRIM        0x20
> +#define SYS_TOYWRITE0      0x24
> +#define SYS_TOYWRITE1      0x28
> +#define SYS_TOYREAD0       0x2C
> +#define SYS_TOYREAD1       0x30
> +#define SYS_TOYMATCH0      0x34
> +#define SYS_TOYMATCH1      0x38
> +#define SYS_TOYMATCH2      0x3C
> +#define SYS_RTCCTRL        0x40
> +#define SYS_RTCTRIM        0x60
> +#define SYS_RTCWRTIE0      0x64
> +#define SYS_RTCREAD0       0x68
> +#define SYS_RTCMATCH0      0x6C
> +#define SYS_RTCMATCH1      0x70
> +#define SYS_RTCMATCH2      0x74
> +
> +#define LS7A_RTC_FREQ     32768
> +#define TIMER_NUMS        3
> +/*
> + * Shift bits and filed mask
> + */
> +
> +FIELD(TOY, MON, 26, 6)
> +FIELD(TOY, DAY, 21, 5)
> +FIELD(TOY, HOUR, 16, 5)
> +FIELD(TOY, MIN, 10, 6)
> +FIELD(TOY, SEC, 4, 6)
> +FIELD(TOY, MSEC, 0, 4)
> +
> +FIELD(TOY_MATCH, YEAR, 26, 6)
> +FIELD(TOY_MATCH, MON, 22, 4)
> +FIELD(TOY_MATCH, DAY, 17, 5)
> +FIELD(TOY_MATCH, HOUR, 12, 5)
> +FIELD(TOY_MATCH, MIN, 6, 6)
> +FIELD(TOY_MATCH, SEC, 0, 6)
> +
> +FIELD(RTC_CTRL, RTCEN, 13, 1)
> +FIELD(RTC_CTRL, TOYEN, 11, 1)
> +FIELD(RTC_CTRL, EO, 8, 1)
> +
> +#define TYPE_LS7A_RTC "ls7a_rtc"
> +OBJECT_DECLARE_SIMPLE_TYPE(LS7ARtcState, LS7A_RTC)
> +
> +typedef struct LS7ARtcTimer {
> +    QEMUTimer *timer;
> +    int64_t save_offset;
> +    int64_t enable_offset;
> +    int32_t flag;
> +    LS7ARtcState *d;
> +} LS7ARtcTimer;
> +
> +struct LS7ARtcState {
> +    SysBusDevice parent_obj;
> +
> +    MemoryRegion iomem;
> +    /*
> +     * Needed to preserve the tick_count across migration, even if the
> +     * absolute value of the rtc_clock is different on the source and
> +     * destination.
> +     */
> +    int64_t offset_toy;
> +    int64_t offset_rtc;
> +    int64_t data;
> +    int tidx;
> +    uint32_t toymatch[3];
> +    uint32_t toytrim;
> +    uint32_t cntrctl;
> +    uint32_t rtctrim;
> +    uint32_t rtccount;
> +    uint32_t rtcmatch[3];
> +    LS7ARtcTimer toy_timer[TIMER_NUMS];
> +    LS7ARtcTimer rtc_timer[TIMER_NUMS];
> +    qemu_irq irq;
> +};
> +
> +static int64_t ls7a_rtc_ticks(void)
> +{
> +    return qemu_clock_get_ms(rtc_clock) * LS7A_RTC_FREQ / 1000;
> +}
> +
> +static uint64_t ls7a_rtc_read(void *opaque, hwaddr addr, unsigned size)
> +{
> +    LS7ARtcState *s = LS7A_RTC(opaque);
> +    struct tm tm;
> +    int val = 0;
> +
> +    switch (addr) {
> +    case SYS_TOYREAD0:
> +        qemu_get_timedate(&tm, s->offset_toy);
> +        val = FIELD_DP32(val, TOY, MON, tm.tm_mon + 1);
> +        val = FIELD_DP32(val, TOY, DAY, tm.tm_mday);
> +        val = FIELD_DP32(val, TOY, HOUR, tm.tm_hour);
> +        val = FIELD_DP32(val, TOY, MIN, tm.tm_min);
> +        val = FIELD_DP32(val, TOY, SEC, tm.tm_sec);
> +        break;
> +    case SYS_TOYREAD1:
> +        qemu_get_timedate(&tm, s->offset_toy);
> +        val = tm.tm_year;
> +        break;
> +    case SYS_TOYMATCH0:
> +        val = s->toymatch[0];
> +        break;
> +    case SYS_TOYMATCH1:
> +        val = s->toymatch[1];
> +        break;
> +    case SYS_TOYMATCH2:
> +        val = s->toymatch[2];
> +        break;
> +    case SYS_RTCCTRL:
> +        val = s->cntrctl;
> +        break;
> +    case SYS_RTCREAD0:
> +        val = ls7a_rtc_ticks() + s->offset_rtc;

I think that rtc_ticks should not apply when !(EO & RTCEN)?
I.e. the value in the register should not advance.

> +static void toymatch_write(LS7ARtcState *s, struct tm *tm, uint64_t val, int num)
> +{
> +    int64_t alarm_offset, year_diff, expire_time;
> +
> +    if (FIELD_EX32(s->cntrctl, RTC_CTRL, TOYEN) &&
> +        FIELD_EX32(s->cntrctl, RTC_CTRL, EO)) {
> +        s->toymatch[num] = val;

The write to the register should be successful, even if the TOY or the oscillator is disabled.

> +        alarm_offset = qemu_timedate_diff(tm) - s->offset_toy;
> +        if ((alarm_offset < 0) && (alarm_offset > -5)) {
> +            alarm_offset = 0;
> +        }

It might be handy to use unit suffixes on the variable names...

> +        expire_time = qemu_clock_get_ms(rtc_clock);
> +        expire_time += ((alarm_offset * 1000) + 100);

Why the +100?

> +static void rtcmatch_write(LS7ARtcState *s, uint64_t val, int num)
> +{
> +    uint64_t expire_time, time_offset;
> +    uint64_t now = ls7a_rtc_ticks();
> +    time_offset = val - now - s->offset_rtc;
> +    /* change ticks to ms */
> +    time_offset /= (LS7A_RTC_FREQ / 1000);
> +    expire_time = (now * 1000 / LS7A_RTC_FREQ) + time_offset;

Oof.  It's particularly hard to follow the unit changes in this sequence.  Can we please 
standardize on some unit?  Preferably nanoseconds, since that's what QEMUTimer uses 
natively (all of the ms and us stuff is just a wrapper for backward compatibility).

That would mean, here,

static void rtcmatch_write(LS7ARtcState *s, uint32_t val_ticks, int num)
{
     s->rtcmatch_ticks[num] = val_ticks;

     if (FIELD_EX32(s->cntrctl, RTC_CTRL, RTCEN) &&
         FIELD_EX32(s->cntrctl, RTC_CTRL, EO)) {
         uint64_t now_ns = qemu_clock_get_ns(rtc_clock);
         uint64_t val_ns = (uint64_t)val_ticks * NANOSECONDS_PER_SECOND / LS7A_RTC_FREQ;
         uint64_t expire_ns = now_ns + val_ns - s->offset_rtc_ns;

         timer_mod_ns(s->rtc_timer[num].timer, expire_ns);
    }
}

or something akin.  Although I think perhaps the whole IF should be within some sort of 
update function, because this timeout will want updating upon changes to offset_rtc_ns.

> +static void ls7a_stop_toymatch(LS7ARtcState *s)
> +{
> +    int i;
> +    uint64_t now;
> +
> +    now = qemu_clock_get_ms(rtc_clock);
> +    for (i = 0; i < TIMER_NUMS; i++) {
> +        if (s->toy_timer[i].flag) {
> +            s->toy_timer[i].enable_offset = s->toy_timer[i].timer->expire_time
> +                                            - now;
> +            timer_del(s->toy_timer[i].timer);

I don't think you need to check flag here, or update enable_offset.
Just an unconditional timer_del to stop the timer callback from firing.

> +static void ls7a_stop_rtcmatch(LS7ARtcState *s)
> +{
> +    int i;
> +    uint64_t now;
> +
> +    now = ls7a_rtc_ticks();
> +    for (i = 0; i < TIMER_NUMS; i++) {
> +        if (s->rtc_timer[i].flag) {
> +            s->rtc_timer[i].enable_offset = s->rtcmatch[i] -
> +                                            now - s->offset_rtc;
> +            timer_del(s->rtc_timer[i].timer);
> +        }

Likewise.

> +    switch (addr) {
> +    case SYS_TOYWRITE0:
> +        qemu_get_timedate(&tm, s->offset_toy);
> +        tm.tm_sec = FIELD_EX32(val, TOY, SEC);
> +        tm.tm_min = FIELD_EX32(val, TOY, MIN);
> +        tm.tm_hour = FIELD_EX32(val, TOY, HOUR);
> +        tm.tm_mday = FIELD_EX32(val, TOY, DAY);
> +        tm.tm_mon = FIELD_EX32(val, TOY, MON) - 1;
> +        s->offset_toy = qemu_timedate_diff(&tm);
> +    break;
> +    case SYS_TOYWRITE1:
> +        qemu_get_timedate(&tm, s->offset_toy);
> +        tm.tm_year = val;
> +        s->offset_toy = qemu_timedate_diff(&tm);
> +        break;

When the toy timers are enabled, you'll need to reinit them, because we want to match the 
value of the TOY clock and the TOYMATCH registers, and that differential time has just 
changed.

> +    case SYS_RTCCTRL:
> +        ctrl_old = s->cntrctl;
> +        ctrl_diff = ctrl_old ^ val;
> +        s->cntrctl = val;
> +        /* if EO changed */
> +        if (FIELD_EX32(ctrl_diff, RTC_CTRL, EO)) {
> +            /* enable EO */
> +            if (FIELD_EX32(val, RTC_CTRL, EO)) {
> +                /* if toy or rtc enabled now */
> +                if (FIELD_EX32(val, RTC_CTRL, TOYEN)) {
> +                    ls7a_start_toymatch(s);
> +                }
> +                if (FIELD_EX32(val, RTC_CTRL, RTCEN)) {
> +                    ls7a_start_rtcmatch(s);
> +                }
> +            } else {
> +                /* if EO disabled */
> +                if (FIELD_EX32(ctrl_old, RTC_CTRL, TOYEN)) {
> +                    ls7a_stop_toymatch(s);
> +                }
> +                if (FIELD_EX32(ctrl_old, RTC_CTRL, RTCEN)) {
> +                    ls7a_stop_rtcmatch(s);
> +                }
> +            }
> +        } else {
> +            /* EO not changed */
> +            if (FIELD_EX32(ctrl_diff, RTC_CTRL, TOYEN)) {
> +                /* enable TOYEN */
> +                if (FIELD_EX32(val, RTC_CTRL, TOYEN)) {
> +                    if (FIELD_EX32(val, RTC_CTRL, EO)) {
> +                        ls7a_start_toymatch(s);
> +                    }
> +                } else {
> +                /* disable TOYEN */
> +                    if (FIELD_EX32(ctrl_old, RTC_CTRL, EO)) {
> +                        /* if EO not enabled, rtc has already stopeed */
> +                        ls7a_stop_toymatch(s);
> +                    }
> +                }
> +            }
> +            if (FIELD_EX32(ctrl_diff, RTC_CTRL, RTCEN)) {
> +                /* enable RTCEN */
> +                if (FIELD_EX32(val, RTC_CTRL, RTCEN)) {
> +                    if (FIELD_EX32(val, RTC_CTRL, EO)) {
> +                        ls7a_start_rtcmatch(s);
> +                    }
> +                } else {
> +                /* disable RTCEN */
> +                    if (FIELD_EX32(ctrl_old, RTC_CTRL, EO)) {
> +                        /* if EO not enabled, rtc has already stopeed */
> +                        ls7a_stop_rtcmatch(s);
> +                    }
> +                }
> +            }
> +        }

This seems overly complicated.  I think you would do well to have some predicates:

static inline bool toy_enabled(LS7ARtcState *s)
{
     return FIELD_EX32(s->cntrctl, RTC_CTRL, TOYEN) &&
            FIELD_EX32(s->cntrctl, RTC_CTRL, EO);
}

and for the rtc.  Then

     old_toyen = toy_enabled(s);
     s->cntrctl = val;
     new_toyen = toy_enabled(s);

     if (old_toyen != new_toyen) {
         if (new_toyen) {
             toy_start(s);
         } else {
             toy_stop(s);
         }
     }

etc.

> +    case SYS_RTCWRTIE0:
> +        s->offset_rtc = val - ls7a_rtc_ticks();

This needs to behave differently when !rtc_enabled, and when rtc_enabled reinit the timers 
for RTCMATCHn, because the time differential has changed.

> +static int ls7a_rtc_pre_save(void *opaque)
> +{
> +    LS7ARtcState *s = LS7A_RTC(opaque);
> +    struct tm tm;
> +    int64_t year_diff, toy_val, rtc_val, rtc_diff, now;
> +    int i;
> +    now = ls7a_rtc_ticks();
> +    qemu_get_timedate(&tm, s->offset_toy);
> +    for (i = 0; i < TIMER_NUMS; i++) {
> +        if (s->toy_timer[i].flag) {
> +            toy_val = s->toymatch[i];
> +            tm.tm_sec = FIELD_EX32(toy_val, TOY_MATCH, SEC);
> +            tm.tm_min = FIELD_EX32(toy_val, TOY_MATCH, MIN);
> +            tm.tm_hour = FIELD_EX32(toy_val, TOY_MATCH, HOUR);
> +            tm.tm_mday = FIELD_EX32(toy_val, TOY_MATCH, DAY);
> +            tm.tm_mon = FIELD_EX32(toy_val, TOY_MATCH, MON) - 1;
> +            year_diff = FIELD_EX32(toy_val, TOY_MATCH, MON);
> +            year_diff = year_diff - (tm.tm_year & 0x3f);
> +            tm.tm_year = tm.tm_year + year_diff;
> +            s->toy_timer[i].save_offset = qemu_timedate_diff(&tm)
> +                                          - s->offset_toy;
> +        }
> +        if (s->rtc_timer[i].flag) {
> +            rtc_val = s->rtcmatch[i];
> +            rtc_diff = rtc_val - now - s->offset_rtc;
> +            s->rtc_timer[i].save_offset = rtc_diff;
> +        }
> +    }
> +    return 0;

I think this update should be what happens in toy_stop and rtc_stop -- saving the offset 
from "now" to the respective save_* variables.

> +static int ls7a_rtc_post_load(void *opaque, int version_id)
> +{
> +    LS7ARtcState *s = LS7A_RTC(opaque);
> +    int64_t expire_time;
> +    int i;
> +    uint64_t now, ticks;
> +
> +    now = qemu_clock_get_ms(rtc_clock);
> +    ticks = ls7a_rtc_ticks();
> +    for (i = 0; i < TIMER_NUMS; i++) {
> +        if (s->toy_timer[i].flag) {
> +            expire_time = now + (s->toy_timer[i].save_offset * 1000);
> +            timer_mod(s->toy_timer[i].timer, expire_time);
> +        }
> +        if (s->rtc_timer[i].flag) {
> +            expire_time = ticks + s->rtc_timer[i].save_offset;
> +            expire_time = (expire_time * 1000 / LS7A_RTC_FREQ);
> +            timer_mod(s->rtc_timer[i].timer, expire_time);
> +        }
> +    }
> +    return 0;

And here, you'd do

     if (toy_enabled(s)) {
         toy_start(s);
     }

etc.  At the moment you've failed to consider s->cntrctl here in post_load.


r~

