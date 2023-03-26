Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 236616C97AA
	for <lists+qemu-devel@lfdr.de>; Sun, 26 Mar 2023 21:55:17 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pgWQd-0004KY-Ki; Sun, 26 Mar 2023 15:53:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <strahinjapjankovic@gmail.com>)
 id 1pgWQa-0004Jo-9i; Sun, 26 Mar 2023 15:53:20 -0400
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <strahinjapjankovic@gmail.com>)
 id 1pgWQW-0005ya-PK; Sun, 26 Mar 2023 15:53:19 -0400
Received: by mail-ed1-x52f.google.com with SMTP id x3so27559968edb.10;
 Sun, 26 Mar 2023 12:53:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1679860394;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hCKqsdNR2Z8xpxkWmoWdDOhWxJ7EHvZGCmkgzOBIPlM=;
 b=HLzoNxqyaB2Y5YHqyzHPLnG6b/8mQJGfZgLFQVVzR5/0cCPrloITTzwdnXdTLtdmc9
 ug046TPf1LbC8WhaV47XcedxzN78AGlwRQt4g9yyD/y4nGaF7T4bjsF5XXY3/hty3Uxu
 /CLyy1CNJ6g+hI5QigLw5BEa4FiVR+H2yI1bUpH97PryAENBAeVX2Vg6hqMXgrLS2jCt
 KLK6LzNbn+cF9cyEwaJrS9w1PUiDoIs/G9YDKBsdATUZTllJArAFJggtbXb32ZmgdwAg
 y8RqMJo1N0NmaH/5R3AU0dpPlQXL7G++sXWvvsw+iPCxR/v8YqxZZ0bmohyAi9YPSRoW
 1IVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679860394;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hCKqsdNR2Z8xpxkWmoWdDOhWxJ7EHvZGCmkgzOBIPlM=;
 b=5QKMHsAIjmGgw+BmnmAxumtdNEDFOjrjpy38f6D2wRhiqqHP35nlVksesrVOb/kKUv
 uPKuTLNp2aZcYKsZo5xSPIW6iwJJxfVy6gAdBlCnPC4Lo2GEv9EOGifYcKm0HTHJDsQ5
 uLBr1W77iIHZwiXHGS1UVhe/zXx2HxcRcLGo8q7G0CBisGbZ6Vw9T6+km3uGB/068NTQ
 bQ+2/7x0tmlRupO08MyCAqKXUefWJImPJAmGh7/SlblGJhtBtoh5nQjmj6La2Y3FN+e3
 nVAitYSjgrP+1/PepFVGzlJV92YNkNrXQLAEJZMrGM2UdcbrMy33DKSZucIybwCrLqPV
 PVgQ==
X-Gm-Message-State: AAQBX9eatUqJSkoTmrcQXq2CCMIl9WQwkHtsWMxD8T1m/kLkAHBTG0/8
 PVYFr3TN6IDoIlXT3qc4q/otAaUBo6UwPsYIVD4=
X-Google-Smtp-Source: AKy350bDOgQK4Sprayzc6UlDLculWEC4VFPHvzH5Q/Nb5yqGpHvbtdp8CCSoUfAOkT2rFfXDQK5DGOjkDaqej/1ol8k=
X-Received: by 2002:a50:a6d7:0:b0:4fa:71a2:982b with SMTP id
 f23-20020a50a6d7000000b004fa71a2982bmr4429921edc.0.1679860393941; Sun, 26 Mar
 2023 12:53:13 -0700 (PDT)
MIME-Version: 1.0
References: <20230317001203.18425-1-strahinja.p.jankovic@gmail.com>
 <20230317001203.18425-2-strahinja.p.jankovic@gmail.com>
 <CAPan3WrQXP-6BkT8eEDHW32b5fT_dA16s=1iJat54+ETG-8TSQ@mail.gmail.com>
In-Reply-To: <CAPan3WrQXP-6BkT8eEDHW32b5fT_dA16s=1iJat54+ETG-8TSQ@mail.gmail.com>
From: Strahinja Jankovic <strahinjapjankovic@gmail.com>
Date: Sun, 26 Mar 2023 21:53:02 +0200
Message-ID: <CABtshVRB0Uf6zF3Stw4+jkH5+8v0ChKRyYwKf+Bi4iPpsZs=TQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] hw/watchdog: Allwinner WDT emulation for system
 reset
To: Niek Linnenbank <nieklinnenbank@gmail.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Beniamino Galvani <b.galvani@gmail.com>, qemu-arm@nongnu.org, 
 qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=strahinjapjankovic@gmail.com; helo=mail-ed1-x52f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Hi Niek,

On Sun, Mar 26, 2023 at 9:04=E2=80=AFPM Niek Linnenbank
<nieklinnenbank@gmail.com> wrote:
>
> Hi Strahinja,
>
>
>
>
> On Fri, Mar 17, 2023 at 1:13=E2=80=AFAM Strahinja Jankovic <strahinjapjan=
kovic@gmail.com> wrote:
>>
>> This patch adds basic support for Allwinner WDT.
>> Both sun4i and sun6i variants are supported.
>> However, interrupt generation is not supported, so WDT can be used only =
to trigger system reset.
>>
>> Signed-off-by: Strahinja Jankovic <strahinja.p.jankovic@gmail.com>
>>
>> ---
>>  hw/watchdog/Kconfig                 |   4 +
>>  hw/watchdog/allwinner-wdt.c         | 416 ++++++++++++++++++++++++++++
>>  hw/watchdog/meson.build             |   1 +
>>  hw/watchdog/trace-events            |   7 +
>>  include/hw/watchdog/allwinner-wdt.h | 123 ++++++++
>>  5 files changed, 551 insertions(+)
>>  create mode 100644 hw/watchdog/allwinner-wdt.c
>>  create mode 100644 include/hw/watchdog/allwinner-wdt.h
>>
>> diff --git a/hw/watchdog/Kconfig b/hw/watchdog/Kconfig
>> index 66e1d029e3..861fd00334 100644
>> --- a/hw/watchdog/Kconfig
>> +++ b/hw/watchdog/Kconfig
>> @@ -20,3 +20,7 @@ config WDT_IMX2
>>
>>  config WDT_SBSA
>>      bool
>> +
>> +config ALLWINNER_WDT
>> +    bool
>> +    select PTIMER
>> diff --git a/hw/watchdog/allwinner-wdt.c b/hw/watchdog/allwinner-wdt.c
>> new file mode 100644
>> index 0000000000..45a4a36ba7
>> --- /dev/null
>> +++ b/hw/watchdog/allwinner-wdt.c
>> @@ -0,0 +1,416 @@
>> +/*
>> + * Allwinner Watchdog emulation
>> + *
>> + * Copyright (C) 2023 Strahinja Jankovic <strahinja.p.jankovic@gmail.co=
m>
>> + *
>> + *  This file is derived from Allwinner RTC,
>> + *  by Niek Linnenbank.
>> + *
>> + * This program is free software: you can redistribute it and/or modify
>> + * it under the terms of the GNU General Public License as published by
>> + * the Free Software Foundation, either version 2 of the License, or
>> + * (at your option) any later version.
>> + *
>> + * This program is distributed in the hope that it will be useful,
>> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
>> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
>> + * GNU General Public License for more details.
>> + *
>> + * You should have received a copy of the GNU General Public License
>> + * along with this program.  If not, see <http://www.gnu.org/licenses/>=
.
>> + */
>> +
>> +#include "qemu/osdep.h"
>> +#include "qemu/log.h"
>> +#include "qemu/units.h"
>> +#include "qemu/module.h"
>> +#include "trace.h"
>> +#include "hw/sysbus.h"
>> +#include "hw/registerfields.h"
>> +#include "hw/watchdog/allwinner-wdt.h"
>> +#include "sysemu/watchdog.h"
>> +#include "migration/vmstate.h"
>> +
>> +/* WDT registers */
>> +enum {
>> +    REG_IRQ_EN =3D 0,     /* Watchdog interrupt enable */
>> +    REG_IRQ_STA,        /* Watchdog interrupt status */
>> +    REG_CTRL,           /* Watchdog control register */
>> +    REG_CFG,            /* Watchdog configuration register */
>> +    REG_MODE,           /* Watchdog mode register */
>> +};
>> +
>> +/* Universal WDT register flags */
>> +#define WDT_RESTART_MASK    (1 << 0)
>> +#define WDT_EN_MASK         (1 << 0)
>> +
>> +/* sun4i specific WDT register flags */
>> +#define RST_EN_SUN4I_MASK       (1 << 1)
>> +#define INTV_VALUE_SUN4I_SHIFT  (3)
>> +#define INTV_VALUE_SUN4I_MASK   (0xfu << INTV_VALUE_SUN4I_SHIFT)
>> +
>> +/* sun6i specific WDT register flags */
>> +#define RST_EN_SUN6I_MASK       (1 << 0)
>> +#define KEY_FIELD_SUN6I_SHIFT   (1)
>> +#define KEY_FIELD_SUN6I_MASK    (0xfffu << KEY_FIELD_SUN6I_SHIFT)
>> +#define KEY_FIELD_SUN6I         (0xA57u)
>> +#define INTV_VALUE_SUN6I_SHIFT  (4)
>> +#define INTV_VALUE_SUN6I_MASK   (0xfu << INTV_VALUE_SUN6I_SHIFT)
>> +
>> +/* Map of INTV_VALUE to 0.5s units. */
>> +static const uint8_t allwinner_wdt_count_map[] =3D {
>> +    1,
>> +    2,
>> +    4,
>> +    6,
>> +    8,
>> +    10,
>> +    12,
>> +    16,
>> +    20,
>> +    24,
>> +    28,
>> +    32
>> +};
>> +
>> +/* WDT sun4i register map (offset to name) */
>> +const uint8_t allwinner_wdt_sun4i_regmap[] =3D {
>> +    [0x0000] =3D REG_CTRL,
>> +    [0x0004] =3D REG_MODE,
>> +};
>> +
>> +/* WDT sun6i register map (offset to name) */
>> +const uint8_t allwinner_wdt_sun6i_regmap[] =3D {
>> +    [0x0000] =3D REG_IRQ_EN,
>> +    [0x0004] =3D REG_IRQ_STA,
>> +    [0x0010] =3D REG_CTRL,
>> +    [0x0014] =3D REG_CFG,
>> +    [0x0018] =3D REG_MODE,
>> +};
>> +
>> +static bool allwinner_wdt_sun4i_read(AwWdtState *s, uint32_t offset)
>> +{
>> +    /* no sun4i specific registers currently implemented */
>> +    return false;
>> +}
>> +
>> +static bool allwinner_wdt_sun4i_write(AwWdtState *s, uint32_t offset,
>> +                                      uint32_t data)
>> +{
>> +    /* no sun4i specific registers currently implemented */
>> +    return false;
>> +}
>> +
>> +static bool allwinner_wdt_sun4i_can_reset_system(AwWdtState *s)
>> +{
>> +    if (s->regs[REG_MODE] & RST_EN_SUN6I_MASK) {
>
>
> Should this function use the RST_EN_SUN4I_MASK instead?

Thanks for reviewing this. You are correct, it should be the SUN4I_MASK.
I will update this and send v3.

>
>>
>> +        return true;
>> +    } else {
>> +        return false;
>> +    }
>> +}
>> +
>> +static bool allwinner_wdt_sun4i_is_key_valid(AwWdtState *s, uint32_t va=
l)
>> +{
>> +    /* sun4i has no key */
>> +    return true;
>> +}
>> +
>> +static uint8_t allwinner_wdt_sun4i_get_intv_value(AwWdtState *s)
>> +{
>> +    return ((s->regs[REG_MODE] & INTV_VALUE_SUN4I_MASK) >>
>> +            INTV_VALUE_SUN4I_SHIFT);
>> +}
>> +
>> +static bool allwinner_wdt_sun6i_read(AwWdtState *s, uint32_t offset)
>> +{
>> +    const AwWdtClass *c =3D AW_WDT_GET_CLASS(s);
>> +
>> +    switch (c->regmap[offset]) {
>> +    case REG_IRQ_EN:
>> +    case REG_IRQ_STA:
>> +    case REG_CFG:
>> +        return true;
>> +    default:
>> +        break;
>> +    }
>> +    return false;
>> +}
>> +
>> +static bool allwinner_wdt_sun6i_write(AwWdtState *s, uint32_t offset,
>> +                                      uint32_t data)
>> +{
>> +    const AwWdtClass *c =3D AW_WDT_GET_CLASS(s);
>> +
>> +    switch (c->regmap[offset]) {
>> +    case REG_IRQ_EN:
>> +    case REG_IRQ_STA:
>> +    case REG_CFG:
>> +        return true;
>> +    default:
>> +        break;
>> +    }
>> +    return false;
>> +}
>> +
>> +static bool allwinner_wdt_sun6i_can_reset_system(AwWdtState *s)
>> +{
>> +    if (s->regs[REG_CFG] & RST_EN_SUN6I_MASK) {
>> +        return true;
>> +    } else {
>> +        return false;
>> +    }
>> +}
>> +
>> +static bool allwinner_wdt_sun6i_is_key_valid(AwWdtState *s, uint32_t va=
l)
>> +{
>> +    uint16_t key =3D (val & KEY_FIELD_SUN6I_MASK) >> KEY_FIELD_SUN6I_SH=
IFT;
>> +    return (key =3D=3D KEY_FIELD_SUN6I);
>> +}
>> +
>> +static uint8_t allwinner_wdt_sun6i_get_intv_value(AwWdtState *s)
>> +{
>> +    return ((s->regs[REG_MODE] & INTV_VALUE_SUN6I_MASK) >>
>> +            INTV_VALUE_SUN6I_SHIFT);
>> +}
>> +
>> +static void allwinner_wdt_update_timer(AwWdtState *s)
>> +{
>> +    const AwWdtClass *c =3D AW_WDT_GET_CLASS(s);
>> +    uint8_t count =3D c->get_intv_value(s);
>> +
>> +    ptimer_transaction_begin(s->timer);
>> +    ptimer_stop(s->timer);
>> +
>> +    /* Use map to convert. */
>> +    if (count < sizeof(allwinner_wdt_count_map)) {
>> +        ptimer_set_count(s->timer, allwinner_wdt_count_map[count]);
>> +    } else {
>> +        qemu_log_mask(LOG_GUEST_ERROR, "%s: incorrect INTV_VALUE 0x%02x=
\n",
>> +                __func__, count);
>> +    }
>> +
>> +    ptimer_run(s->timer, 1);
>> +    ptimer_transaction_commit(s->timer);
>> +
>> +    trace_allwinner_wdt_update_timer(count);
>> +}
>> +
>> +static uint64_t allwinner_wdt_read(void *opaque, hwaddr offset,
>> +                                       unsigned size)
>> +{
>> +    AwWdtState *s =3D AW_WDT(opaque);
>> +    const AwWdtClass *c =3D AW_WDT_GET_CLASS(s);
>> +    uint64_t r;
>> +
>> +    if (offset >=3D c->regmap_size) {
>> +        qemu_log_mask(LOG_GUEST_ERROR, "%s: out-of-bounds offset 0x%04x=
\n",
>> +                      __func__, (uint32_t)offset);
>> +        return 0;
>> +    }
>> +
>> +    switch (c->regmap[offset]) {
>> +    case REG_CTRL:
>> +    case REG_MODE:
>> +        r =3D s->regs[c->regmap[offset]];
>> +        break;
>> +    default:
>> +        if (!c->read(s, offset)) {
>> +            qemu_log_mask(LOG_UNIMP, "%s: unimplemented register 0x%04x=
\n",
>> +                            __func__, (uint32_t)offset);
>> +            return 0;
>> +        }
>> +        r =3D s->regs[c->regmap[offset]];
>> +        break;
>> +    }
>> +
>> +    trace_allwinner_wdt_read(offset, r, size);
>> +
>> +    return r;
>> +}
>> +
>> +static void allwinner_wdt_write(void *opaque, hwaddr offset,
>> +                                   uint64_t val, unsigned size)
>> +{
>> +    AwWdtState *s =3D AW_WDT(opaque);
>> +    const AwWdtClass *c =3D AW_WDT_GET_CLASS(s);
>> +    uint32_t old_val;
>> +
>> +    if (offset >=3D c->regmap_size) {
>> +        qemu_log_mask(LOG_GUEST_ERROR, "%s: out-of-bounds offset 0x%04x=
\n",
>> +                      __func__, (uint32_t)offset);
>> +        return;
>> +    }
>> +
>> +   trace_allwinner_wdt_write(offset, val, size);
>> +
>> +    switch (c->regmap[offset]) {
>> +    case REG_CTRL:
>> +        if (c->is_key_valid(s, val)) {
>> +            if (val & WDT_RESTART_MASK) {
>> +                /* Kick timer */
>> +                allwinner_wdt_update_timer(s);
>> +            }
>> +        }
>> +        break;
>> +    case REG_MODE:
>> +        old_val =3D s->regs[REG_MODE];
>> +        s->regs[REG_MODE] =3D (uint32_t)val;
>> +
>> +        /* Check for rising edge on WDOG_MODE_EN */
>> +        if ((s->regs[REG_MODE] & ~old_val) & WDT_EN_MASK) {
>> +            allwinner_wdt_update_timer(s);
>> +        }
>> +        break;
>> +    default:
>> +        if (!c->write(s, offset, val)) {
>> +            qemu_log_mask(LOG_UNIMP, "%s: unimplemented register 0x%04x=
\n",
>> +                          __func__, (uint32_t)offset);
>> +        }
>> +        s->regs[c->regmap[offset]] =3D (uint32_t)val;
>> +        break;
>> +    }
>> +}
>> +
>> +static const MemoryRegionOps allwinner_wdt_ops =3D {
>> +    .read =3D allwinner_wdt_read,
>> +    .write =3D allwinner_wdt_write,
>> +    .endianness =3D DEVICE_NATIVE_ENDIAN,
>> +    .valid =3D {
>> +        .min_access_size =3D 4,
>> +        .max_access_size =3D 4,
>> +    },
>> +    .impl.min_access_size =3D 4,
>> +};
>> +
>> +static void allwinner_wdt_expired(void *opaque)
>> +{
>> +    AwWdtState *s =3D AW_WDT(opaque);
>> +    const AwWdtClass *c =3D AW_WDT_GET_CLASS(s);
>> +
>> +    bool enabled =3D s->regs[REG_MODE] & WDT_EN_MASK;
>> +    bool reset_enabled =3D c->can_reset_system(s);
>> +
>> +    trace_allwinner_wdt_expired(enabled, reset_enabled);
>> +
>> +    /* Perform watchdog action if watchdog is enabled and can trigger r=
eset */
>> +    if (enabled && reset_enabled) {
>> +        watchdog_perform_action();
>> +    }
>> +}
>> +
>> +static void allwinner_wdt_reset_enter(Object *obj, ResetType type)
>> +{
>> +    AwWdtState *s =3D AW_WDT(obj);
>> +
>> +    trace_allwinner_wdt_reset_enter();
>> +
>> +    /* Clear registers */
>> +    memset(s->regs, 0, sizeof(s->regs));
>> +}
>> +
>> +static const VMStateDescription allwinner_wdt_vmstate =3D {
>> +    .name =3D "allwinner-wdt",
>> +    .version_id =3D 1,
>> +    .minimum_version_id =3D 1,
>> +    .fields =3D (VMStateField[]) {
>> +        VMSTATE_PTIMER(timer, AwWdtState),
>> +        VMSTATE_UINT32_ARRAY(regs, AwWdtState, AW_WDT_REGS_NUM),
>> +        VMSTATE_END_OF_LIST()
>> +    }
>> +};
>> +
>> +static void allwinner_wdt_init(Object *obj)
>> +{
>> +    SysBusDevice *sbd =3D SYS_BUS_DEVICE(obj);
>> +    AwWdtState *s =3D AW_WDT(obj);
>> +    const AwWdtClass *c =3D AW_WDT_GET_CLASS(s);
>> +
>> +    /* Memory mapping */
>> +    memory_region_init_io(&s->iomem, OBJECT(s), &allwinner_wdt_ops, s,
>> +                          TYPE_AW_WDT, c->regmap_size * 4);
>> +    sysbus_init_mmio(sbd, &s->iomem);
>> +}
>> +
>> +static void allwinner_wdt_realize(DeviceState *dev, Error **errp)
>> +{
>> +    AwWdtState *s =3D AW_WDT(dev);
>> +
>> +    s->timer =3D ptimer_init(allwinner_wdt_expired, s,
>> +                           PTIMER_POLICY_NO_IMMEDIATE_TRIGGER |
>> +                           PTIMER_POLICY_NO_IMMEDIATE_RELOAD |
>> +                           PTIMER_POLICY_NO_COUNTER_ROUND_DOWN);
>> +
>> +    ptimer_transaction_begin(s->timer);
>> +    /* Set to 2Hz (0.5s period); other periods are multiples of 0.5s. *=
/
>> +    ptimer_set_freq(s->timer, 2);
>> +    ptimer_set_limit(s->timer, 0xff, 1);
>> +    ptimer_transaction_commit(s->timer);
>> +}
>> +
>> +static void allwinner_wdt_class_init(ObjectClass *klass, void *data)
>> +{
>> +    DeviceClass *dc =3D DEVICE_CLASS(klass);
>> +    ResettableClass *rc =3D RESETTABLE_CLASS(klass);
>> +
>> +    rc->phases.enter =3D allwinner_wdt_reset_enter;
>> +    dc->realize =3D allwinner_wdt_realize;
>> +    dc->vmsd =3D &allwinner_wdt_vmstate;
>> +}
>> +
>> +static void allwinner_wdt_sun4i_class_init(ObjectClass *klass, void *da=
ta)
>> +{
>> +    AwWdtClass *awc =3D AW_WDT_CLASS(klass);
>> +
>> +    awc->regmap =3D allwinner_wdt_sun4i_regmap;
>> +    awc->regmap_size =3D sizeof(allwinner_wdt_sun4i_regmap);
>> +    awc->read =3D allwinner_wdt_sun4i_read;
>> +    awc->write =3D allwinner_wdt_sun4i_write;
>> +    awc->can_reset_system =3D allwinner_wdt_sun4i_can_reset_system;
>> +    awc->is_key_valid =3D allwinner_wdt_sun4i_is_key_valid;
>> +    awc->get_intv_value =3D allwinner_wdt_sun4i_get_intv_value;
>> +}
>> +
>> +static void allwinner_wdt_sun6i_class_init(ObjectClass *klass, void *da=
ta)
>> +{
>> +    AwWdtClass *awc =3D AW_WDT_CLASS(klass);
>> +
>> +    awc->regmap =3D allwinner_wdt_sun6i_regmap;
>> +    awc->regmap_size =3D sizeof(allwinner_wdt_sun6i_regmap);
>> +    awc->read =3D allwinner_wdt_sun6i_read;
>> +    awc->write =3D allwinner_wdt_sun6i_write;
>> +    awc->can_reset_system =3D allwinner_wdt_sun6i_can_reset_system;
>> +    awc->is_key_valid =3D allwinner_wdt_sun6i_is_key_valid;
>> +    awc->get_intv_value =3D allwinner_wdt_sun6i_get_intv_value;
>> +}
>> +
>> +static const TypeInfo allwinner_wdt_info =3D {
>> +    .name          =3D TYPE_AW_WDT,
>> +    .parent        =3D TYPE_SYS_BUS_DEVICE,
>> +    .instance_init =3D allwinner_wdt_init,
>> +    .instance_size =3D sizeof(AwWdtState),
>> +    .class_init    =3D allwinner_wdt_class_init,
>> +    .class_size    =3D sizeof(AwWdtClass),
>> +    .abstract      =3D true,
>> +};
>> +
>> +static const TypeInfo allwinner_wdt_sun4i_info =3D {
>> +    .name          =3D TYPE_AW_WDT_SUN4I,
>> +    .parent        =3D TYPE_AW_WDT,
>> +    .class_init    =3D allwinner_wdt_sun4i_class_init,
>> +};
>> +
>> +static const TypeInfo allwinner_wdt_sun6i_info =3D {
>> +    .name          =3D TYPE_AW_WDT_SUN6I,
>> +    .parent        =3D TYPE_AW_WDT,
>> +    .class_init    =3D allwinner_wdt_sun6i_class_init,
>> +};
>> +
>> +static void allwinner_wdt_register(void)
>> +{
>> +    type_register_static(&allwinner_wdt_info);
>> +    type_register_static(&allwinner_wdt_sun4i_info);
>> +    type_register_static(&allwinner_wdt_sun6i_info);
>> +}
>> +
>> +type_init(allwinner_wdt_register)
>> diff --git a/hw/watchdog/meson.build b/hw/watchdog/meson.build
>> index 8974b5cf4c..5dcd4fbe2f 100644
>> --- a/hw/watchdog/meson.build
>> +++ b/hw/watchdog/meson.build
>> @@ -1,4 +1,5 @@
>>  softmmu_ss.add(files('watchdog.c'))
>> +softmmu_ss.add(when: 'CONFIG_ALLWINNER_WDT', if_true: files('allwinner-=
wdt.c'))
>>  softmmu_ss.add(when: 'CONFIG_CMSDK_APB_WATCHDOG', if_true: files('cmsdk=
-apb-watchdog.c'))
>>  softmmu_ss.add(when: 'CONFIG_WDT_IB6300ESB', if_true: files('wdt_i6300e=
sb.c'))
>>  softmmu_ss.add(when: 'CONFIG_WDT_IB700', if_true: files('wdt_ib700.c'))
>> diff --git a/hw/watchdog/trace-events b/hw/watchdog/trace-events
>> index 54371ae075..2739570652 100644
>> --- a/hw/watchdog/trace-events
>> +++ b/hw/watchdog/trace-events
>> @@ -1,5 +1,12 @@
>>  # See docs/devel/tracing.rst for syntax documentation.
>>
>> +# allwinner-wdt.c
>> +allwinner_wdt_read(uint64_t offset, uint64_t data, unsigned size) "Allw=
inner watchdog read: offset 0x%" PRIx64 " data 0x%" PRIx64 " size %u"
>> +allwinner_wdt_write(uint64_t offset, uint64_t data, unsigned size) "All=
winner watchdog write: offset 0x%" PRIx64 " data 0x%" PRIx64 " size %u"
>> +allwinner_wdt_reset_enter(void) "Allwinner watchdog: reset"
>> +allwinner_wdt_update_timer(uint8_t count) "Allwinner watchdog: count %"=
 PRIu8
>> +allwinner_wdt_expired(bool enabled, bool reset_enabled) "Allwinner watc=
hdog: enabled %u reset_enabled %u"
>> +
>>  # cmsdk-apb-watchdog.c
>>  cmsdk_apb_watchdog_read(uint64_t offset, uint64_t data, unsigned size) =
"CMSDK APB watchdog read: offset 0x%" PRIx64 " data 0x%" PRIx64 " size %u"
>>  cmsdk_apb_watchdog_write(uint64_t offset, uint64_t data, unsigned size)=
 "CMSDK APB watchdog write: offset 0x%" PRIx64 " data 0x%" PRIx64 " size %u=
"
>> diff --git a/include/hw/watchdog/allwinner-wdt.h b/include/hw/watchdog/a=
llwinner-wdt.h
>> new file mode 100644
>> index 0000000000..7fe41e20f2
>> --- /dev/null
>> +++ b/include/hw/watchdog/allwinner-wdt.h
>> @@ -0,0 +1,123 @@
>> +/*
>> + * Allwinner Watchdog emulation
>> + *
>> + * Copyright (C) 2023 Strahinja Jankovic <strahinja.p.jankovic@gmail.co=
m>
>> + *
>> + *  This file is derived from Allwinner RTC,
>> + *  by Niek Linnenbank.
>> + *
>> + * This program is free software: you can redistribute it and/or modify
>> + * it under the terms of the GNU General Public License as published by
>> + * the Free Software Foundation, either version 2 of the License, or
>> + * (at your option) any later version.
>> + *
>> + * This program is distributed in the hope that it will be useful,
>> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
>> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
>> + * GNU General Public License for more details.
>> + *
>> + * You should have received a copy of the GNU General Public License
>> + * along with this program.  If not, see <http://www.gnu.org/licenses/>=
.
>> + */
>> +
>> +#ifndef HW_WATCHDOG_ALLWINNER_WDT_H
>> +#define HW_WATCHDOG_ALLWINNER_WDT_H
>> +
>> +#include "qom/object.h"
>> +#include "hw/ptimer.h"
>> +#include "hw/sysbus.h"
>> +
>> +/*
>> + * This is a model of the Allwinner watchdog.
>> + * Since watchdog registers belong to the timer module (and are shared =
with the
>> + * RTC module), the interrupt line from watchdog is not handled right n=
ow.
>> + * In QEMU, we just wire up the watchdog reset to watchdog_perform_acti=
on(),
>> + * at least for the moment.
>> + */
>> +
>> +#define TYPE_AW_WDT    "allwinner-wdt"
>> +
>> +/** Allwinner WDT sun4i family (A10, A12), also sun7i (A20) */
>> +#define TYPE_AW_WDT_SUN4I    TYPE_AW_WDT "-sun4i"
>> +
>> +/** Allwinner WDT sun6i family and newer (A31, H2+, H3, etc) */
>> +#define TYPE_AW_WDT_SUN6I    TYPE_AW_WDT "-sun6i"
>> +
>> +/** Number of WDT registers */
>> +#define AW_WDT_REGS_NUM      (5)
>> +
>> +OBJECT_DECLARE_TYPE(AwWdtState, AwWdtClass, AW_WDT)
>> +
>> +/**
>> + * Allwinner WDT object instance state.
>> + */
>> +struct AwWdtState {
>> +    /*< private >*/
>> +    SysBusDevice parent_obj;
>> +
>> +    /*< public >*/
>> +    MemoryRegion iomem;
>> +    struct ptimer_state *timer;
>> +
>> +    uint32_t regs[AW_WDT_REGS_NUM];
>> +};
>> +
>> +/**
>> + * Allwinner WDT class-level struct.
>> + *
>> + * This struct is filled by each sunxi device specific code
>> + * such that the generic code can use this struct to support
>> + * all devices.
>> + */
>> +struct AwWdtClass {
>> +    /*< private >*/
>> +    SysBusDeviceClass parent_class;
>> +    /*< public >*/
>> +
>> +    /** Defines device specific register map */
>> +    const uint8_t *regmap;
>> +
>> +    /** Size of the regmap in bytes */
>> +    size_t regmap_size;
>> +
>> +    /**
>> +     * Read device specific register
>> +     *
>> +     * @offset: register offset to read
>> +     * @return true if register read successful, false otherwise
>> +     */
>> +    bool (*read)(AwWdtState *s, uint32_t offset);
>> +
>> +    /**
>> +     * Write device specific register
>> +     *
>> +     * @offset: register offset to write
>> +     * @data: value to set in register
>> +     * @return true if register write successful, false otherwise
>> +     */
>> +    bool (*write)(AwWdtState *s, uint32_t offset, uint32_t data);
>> +
>> +    /**
>> +     * Check if watchdog can generate system reset
>> +     *
>> +     * @return true if watchdog can generate system reset
>> +     */
>> +    bool (*can_reset_system)(AwWdtState *s);
>> +
>> +    /**
>> +     * Check if provided key is valid
>> +     *
>> +     * @value: value written to register
>> +     * @return true if key is valid, false otherwise
>> +     */
>> +    bool (*is_key_valid)(AwWdtState *s, uint32_t val);
>> +
>> +    /**
>> +     * Get current INTV_VALUE setting
>> +     *
>> +     * @return current INTV_VALUE (0-15)
>> +     */
>> +    uint8_t (*get_intv_value)(AwWdtState *s);
>> +};
>> +
>> +#endif /* HW_WATCHDOG_ALLWINNER_WDT_H */
>> --
>> 2.30.2
>>
>
> I've verified with U-boot manually that the watchdog also is able to rese=
t the core on the H3:
>
> ...
> =3D> mw.l 0x01c20cb4 0x1 1
> allwinner_wdt_write Allwinner watchdog write: offset 0x14 data 0x1 size 4
> =3D> mw.l 0x01c20cb8 0x1 1
> allwinner_wdt_write Allwinner watchdog write: offset 0x18 data 0x1 size 4
> allwinner_wdt_update_timer Allwinner watchdog: count 0
> =3D> allwinner_wdt_expired Allwinner watchdog: enabled 1 reset_enabled 1
> allwinner_wdt_reset_enter Allwinner watchdog: reset
>
> U-Boot SPL 2020.04-armbian (Sep 02 2020 - 10:16:13 +0200)
> DRAM: 1024 MiB
> ...
>
> So looks good to me!
>
> Reviewed-by: Niek Linnenbank <nieklinnenbank@gmail.com>
> Tested-by: Niek Linnenbank <nieklinnenbank@gmail.com>

Thanks!

Best regards,
Strahinja

>
> Regards,
> Niek
>
> --
> Niek Linnenbank
>

