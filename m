Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F298A534BE9
	for <lists+qemu-devel@lfdr.de>; Thu, 26 May 2022 10:48:48 +0200 (CEST)
Received: from localhost ([::1]:45476 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nu9Am-00064j-1j
	for lists+qemu-devel@lfdr.de; Thu, 26 May 2022 04:48:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49724)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nu95E-0002wL-EK
 for qemu-devel@nongnu.org; Thu, 26 May 2022 04:43:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36202)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nu95B-00047L-Nw
 for qemu-devel@nongnu.org; Thu, 26 May 2022 04:43:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653554580;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MPdT5ph3Wb1T4ZahVzgw6+8OhbpTd+O1/RJVxXeSmGM=;
 b=Wj698tf5712FumLS9SgzuKmpGJmEmY+PSkR+dm5f8Hj0QHc+DrWMEDZ4k+WPYY5V8vTaHX
 XjFavd/H3F4qThNv5UHTLQzJfnybos1+rrv8RfUnFReLTAV59l8O5YK4YNSB2daxrG9UJW
 DPP/lPEsZRtgWlXJHRHhdS24S5D77NE=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-510-NQDVSqktP6apTvrwVj4FaA-1; Thu, 26 May 2022 04:42:58 -0400
X-MC-Unique: NQDVSqktP6apTvrwVj4FaA-1
Received: by mail-wr1-f69.google.com with SMTP id
 e7-20020adfa747000000b0020fe61b0c62so138325wrd.22
 for <qemu-devel@nongnu.org>; Thu, 26 May 2022 01:42:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MPdT5ph3Wb1T4ZahVzgw6+8OhbpTd+O1/RJVxXeSmGM=;
 b=bv8B47wwoUeRH7oYs8/iLF8c8TyweZSW/C1/qVBY/zsop5/EKxg/lDQEQv1XSWcqpw
 c9KD/dp5pMmTjgUAW5S97P4vEa9HQCzX4gYldsW7gA1aEyOV8QGYg8AwQQxPKBExXQbk
 ma984R7UZqQf770sbuOvthxRpzEZ5EyuPQWBiRk4EQiXpMAN5zP9AlwBYng6Lf6aiX88
 xC+Motx9GKs/h+7D/AeRh7VEz61CVnQ6CLg60EK3Dx8/chuZtIyVDd4MbYZnFKJwPjY+
 Pv+WeGB9OA+xlxr7KCWZPuh3lzAS10a/2hJ82GtSOnSrtCp3YmvJ9i775zFw4nuqfLQV
 EHIw==
X-Gm-Message-State: AOAM5335QGkeOT3SPgsAWzq7hXXLA2tqsJS8qcYCVvxC/lXJs/OO4Fg6
 CL6IPW+uNjv7s3Qn6MDnoMw6YdRtt7K/9h40Ma0V9QQI3eEk3rf8qLv/ARKhO7We5YDEZGukhcA
 hum62dkJ7sCzLomQ=
X-Received: by 2002:a5d:64c7:0:b0:20e:609a:98d5 with SMTP id
 f7-20020a5d64c7000000b0020e609a98d5mr29726787wri.629.1653554576930; 
 Thu, 26 May 2022 01:42:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyceNtfLpJTYap8B6YSa5LyZWDf93VVHrQtBKU1j9H2wNm3AII+HBRHRw5a8aYJ73NNcma8+Q==
X-Received: by 2002:a17:906:58cd:b0:6fe:f9fe:8342 with SMTP id
 e13-20020a17090658cd00b006fef9fe8342mr13731257ejs.510.1653554566516; 
 Thu, 26 May 2022 01:42:46 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id
 e14-20020a170906504e00b006f3ef214db9sm313711ejk.31.2022.05.26.01.42.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 May 2022 01:42:45 -0700 (PDT)
Date: Thu, 26 May 2022 10:42:44 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Xiaojuan Yang <yangxiaojuan@loongson.cn>
Cc: qemu-devel@nongnu.org, richard.henderson@linaro.org,
 gaosong@loongson.cn, mark.cave-ayland@ilande.co.uk, mst@redhat.com,
 ani@anisinha.ca
Subject: Re: [PATCH v5 40/43] hw/loongarch: Add LoongArch ls7a acpi device
 support
Message-ID: <20220526104244.7ba5235b@redhat.com>
In-Reply-To: <20220524081804.3608101-41-yangxiaojuan@loongson.cn>
References: <20220524081804.3608101-1-yangxiaojuan@loongson.cn>
 <20220524081804.3608101-41-yangxiaojuan@loongson.cn>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

On Tue, 24 May 2022 16:18:01 +0800
Xiaojuan Yang <yangxiaojuan@loongson.cn> wrote:

commit message needs pointers to specification,
+ in patch comments that point to specific chapters
within the spec for newly introduced  registers


> From: Song Gao <gaosong@loongson.cn>
> 
> Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
> Signed-off-by: Song Gao <gaosong@loongson.cn>
> ---
>  MAINTAINERS                |   2 +
>  hw/acpi/Kconfig            |   4 +
>  hw/acpi/ls7a.c             | 374 +++++++++++++++++++++++++++++++++++++
>  hw/acpi/meson.build        |   1 +
>  hw/loongarch/Kconfig       |   2 +
>  hw/loongarch/loongson3.c   |  19 +-
>  include/hw/acpi/ls7a.h     |  53 ++++++
>  include/hw/pci-host/ls7a.h |   6 +
>  8 files changed, 458 insertions(+), 3 deletions(-)
>  create mode 100644 hw/acpi/ls7a.c
>  create mode 100644 include/hw/acpi/ls7a.h
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 6e03a8bca8..6f861dec0a 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1138,6 +1138,8 @@ F: include/hw/intc/loongarch_*.h
>  F: hw/intc/loongarch_*.c
>  F: include/hw/pci-host/ls7a.h
>  F: hw/rtc/ls7a_rtc.c
> +F: include/hw/acpi/ls7a.h
> +F: hw/acpi/ls7a.c
>  
>  M68K Machines
>  -------------
> diff --git a/hw/acpi/Kconfig b/hw/acpi/Kconfig
> index 3703aca212..c65965c9b9 100644
> --- a/hw/acpi/Kconfig
> +++ b/hw/acpi/Kconfig
> @@ -13,6 +13,10 @@ config ACPI_X86
>      select ACPI_PCIHP
>      select ACPI_ERST
>  
> +config ACPI_LOONGARCH
> +    bool
> +    select ACPI
> +
>  config ACPI_X86_ICH
>      bool
>      select ACPI_X86
> diff --git a/hw/acpi/ls7a.c b/hw/acpi/ls7a.c
> new file mode 100644
> index 0000000000..cc658422dd
> --- /dev/null
> +++ b/hw/acpi/ls7a.c
> @@ -0,0 +1,374 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +/*
> + * LoongArch ACPI implementation
> + *
> + * Copyright (C) 2021 Loongson Technology Corporation Limited
> + */
> +
> +#include "qemu/osdep.h"
> +#include "sysemu/sysemu.h"
> +#include "hw/hw.h"
> +#include "hw/irq.h"
> +#include "sysemu/reset.h"
> +#include "sysemu/runstate.h"
> +#include "hw/acpi/acpi.h"
> +#include "hw/acpi/ls7a.h"
> +#include "hw/nvram/fw_cfg.h"
> +#include "qemu/config-file.h"
> +#include "qapi/opts-visitor.h"
> +#include "qapi/qapi-events-run-state.h"
> +#include "qapi/error.h"
> +#include "hw/pci-host/ls7a.h"
> +#include "hw/mem/pc-dimm.h"
> +#include "hw/mem/nvdimm.h"
> +#include "migration/vmstate.h"
> +
> +static void ls7a_pm_update_sci_fn(ACPIREGS *regs)
> +{
> +    LS7APMState *pm = container_of(regs, LS7APMState, acpi_regs);
> +    acpi_update_sci(&pm->acpi_regs, pm->irq);
> +}
> +
> +static uint64_t ls7a_gpe_readb(void *opaque, hwaddr addr, unsigned width)
> +{
> +    LS7APMState *pm = opaque;
> +    return acpi_gpe_ioport_readb(&pm->acpi_regs, addr);
> +}
> +
> +static void ls7a_gpe_writeb(void *opaque, hwaddr addr, uint64_t val,
> +                            unsigned width)
> +{
> +    LS7APMState *pm = opaque;
> +    acpi_gpe_ioport_writeb(&pm->acpi_regs, addr, val);
> +    acpi_update_sci(&pm->acpi_regs, pm->irq);
> +}
> +
> +static const MemoryRegionOps ls7a_gpe_ops = {
> +    .read = ls7a_gpe_readb,
> +    .write = ls7a_gpe_writeb,
> +    .valid.min_access_size = 1,
> +    .valid.max_access_size = 8,
> +    .impl.min_access_size = 1,
> +    .impl.max_access_size = 1,
> +    .endianness = DEVICE_LITTLE_ENDIAN,
> +};
> +
> +#define VMSTATE_GPE_ARRAY(_field, _state)                            \
> + {                                                                   \
> +     .name       = (stringify(_field)),                              \
> +     .version_id = 0,                                                \
> +     .num        = ACPI_GPE0_LEN,                                    \
> +     .info       = &vmstate_info_uint8,                              \
> +     .size       = sizeof(uint8_t),                                  \
> +     .flags      = VMS_ARRAY | VMS_POINTER,                          \
> +     .offset     = vmstate_offset_pointer(_state, _field, uint8_t),  \
> + }
> +
> +static uint64_t ls7a_reset_readw(void *opaque, hwaddr addr, unsigned width)
> +{
> +    return 0;
> +}
> +
> +static void ls7a_reset_writew(void *opaque, hwaddr addr, uint64_t val,
> +                              unsigned width)
> +{
> +    if (val & 1) {
> +        qemu_system_reset_request(SHUTDOWN_CAUSE_GUEST_RESET);
> +        return;
> +    }
> +}
> +
> +static const MemoryRegionOps ls7a_reset_ops = {
> +    .read = ls7a_reset_readw,
> +    .write = ls7a_reset_writew,
> +    .valid.min_access_size = 4,
> +    .valid.max_access_size = 4,
> +    .endianness = DEVICE_LITTLE_ENDIAN,
> +};
> +
> +const VMStateDescription vmstate_ls7a_pm = {
> +    .name = "ls7a_pm",
> +    .version_id = 1,
> +    .minimum_version_id = 1,
> +    .fields = (VMStateField[]) {
> +        VMSTATE_UINT16(acpi_regs.pm1.evt.sts, LS7APMState),
> +        VMSTATE_UINT16(acpi_regs.pm1.evt.en, LS7APMState),
> +        VMSTATE_UINT16(acpi_regs.pm1.cnt.cnt, LS7APMState),
> +        VMSTATE_TIMER_PTR(acpi_regs.tmr.timer, LS7APMState),
> +        VMSTATE_INT64(acpi_regs.tmr.overflow_time, LS7APMState),
> +        VMSTATE_GPE_ARRAY(acpi_regs.gpe.sts, LS7APMState),
> +        VMSTATE_GPE_ARRAY(acpi_regs.gpe.en, LS7APMState),
> +        VMSTATE_END_OF_LIST()
> +    },
> +};
> +
> +static inline int64_t acpi_pm_tmr_get_clock(void)
> +{
> +    return muldiv64(qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL), PM_TIMER_FREQUENCY,
> +                    NANOSECONDS_PER_SECOND);
> +}
> +
> +static uint32_t acpi_pm_tmr_get(ACPIREGS *ar)
> +{
> +    uint32_t d = acpi_pm_tmr_get_clock();
> +    return d & 0xffffff;
> +}
> +
> +static void acpi_pm_tmr_timer(void *opaque)
> +{
> +    ACPIREGS *ar = opaque;
> +    qemu_system_wakeup_request(QEMU_WAKEUP_REASON_PMTIMER, NULL);
> +    ar->tmr.update_sci(ar);
> +}
> +
> +static uint64_t acpi_pm_tmr_read(void *opaque, hwaddr addr, unsigned width)
> +{
> +    return acpi_pm_tmr_get(opaque);
> +}
> +
> +static void acpi_pm_tmr_write(void *opaque, hwaddr addr, uint64_t val,
> +                              unsigned width)
> +{
> +}
> +
> +static const MemoryRegionOps acpi_pm_tmr_ops = {
> +    .read = acpi_pm_tmr_read,
> +    .write = acpi_pm_tmr_write,
> +    .valid.min_access_size = 4,
> +    .valid.max_access_size = 4,
> +    .endianness = DEVICE_LITTLE_ENDIAN,
> +};
> +
> +static void ls7a_pm_tmr_init(ACPIREGS *ar, acpi_update_sci_fn update_sci,
> +                             MemoryRegion *parent, uint64_t offset)
> +{
> +    ar->tmr.update_sci = update_sci;
> +    ar->tmr.timer = timer_new_ns(QEMU_CLOCK_VIRTUAL, acpi_pm_tmr_timer, ar);
> +    memory_region_init_io(&ar->tmr.io, memory_region_owner(parent),
> +                          &acpi_pm_tmr_ops, ar, "acpi-tmr", 4);
> +    memory_region_add_subregion(parent, offset, &ar->tmr.io);
> +}
> +
> +static void acpi_pm1_evt_write_sts(ACPIREGS *ar, uint16_t val)
> +{
> +    uint16_t pm1_sts = acpi_pm1_evt_get_sts(ar);
> +    if (pm1_sts & val & ACPI_BITMASK_TIMER_STATUS) {
> +        /* if TMRSTS is reset, then compute the new overflow time */
> +        acpi_pm_tmr_calc_overflow_time(ar);
> +    }
> +    ar->pm1.evt.sts &= ~val;
> +}
> +
> +static uint64_t acpi_pm_evt_read(void *opaque, hwaddr addr, unsigned width)
> +{
> +    ACPIREGS *ar = opaque;
> +    switch (addr) {
> +    case 0:
> +        return acpi_pm1_evt_get_sts(ar);
> +    case 4:
> +        return ar->pm1.evt.en;
> +    default:
> +        return 0;
> +    }
> +}
> +
> +static void acpi_pm1_evt_write_en(ACPIREGS *ar, uint16_t val)
> +{
> +    ar->pm1.evt.en = val;
> +    qemu_system_wakeup_enable(QEMU_WAKEUP_REASON_RTC,
> +                              val & ACPI_BITMASK_RT_CLOCK_ENABLE);
> +    qemu_system_wakeup_enable(QEMU_WAKEUP_REASON_PMTIMER,
> +                              val & ACPI_BITMASK_TIMER_ENABLE);
> +}
> +
> +static void acpi_pm_evt_write(void *opaque, hwaddr addr, uint64_t val,
> +                              unsigned width)
> +{
> +    ACPIREGS *ar = opaque;
> +    switch (addr) {
> +    case 0:
> +        acpi_pm1_evt_write_sts(ar, val);
> +        ar->pm1.evt.update_sci(ar);
> +        break;
> +    case 4:
> +        acpi_pm1_evt_write_en(ar, val);
> +        ar->pm1.evt.update_sci(ar);
> +        break;
> +    }
> +}
> +
> +static const MemoryRegionOps acpi_pm_evt_ops = {
> +    .read = acpi_pm_evt_read,
> +    .write = acpi_pm_evt_write,
> +    .valid.min_access_size = 1,
> +    .valid.max_access_size = 4,
> +    .endianness = DEVICE_LITTLE_ENDIAN,
> +};
> +
> +static void ls7a_pm1_evt_init(ACPIREGS *ar, acpi_update_sci_fn update_sci,
> +                              MemoryRegion *parent, uint64_t offset)
> +{
> +    ar->pm1.evt.update_sci = update_sci;
> +    memory_region_init_io(&ar->pm1.evt.io, memory_region_owner(parent),
> +                          &acpi_pm_evt_ops, ar, "acpi-evt", 8);
> +    memory_region_add_subregion(parent, offset, &ar->pm1.evt.io);
> +}
> +
> +static uint64_t acpi_pm_cnt_read(void *opaque, hwaddr addr, unsigned width)
> +{
> +    ACPIREGS *ar = opaque;
> +    return ar->pm1.cnt.cnt;
> +}
> +
> +/* ACPI PM1aCNT */
> +static void acpi_pm1_cnt_write(ACPIREGS *ar, uint16_t val)
> +{
> +    ar->pm1.cnt.cnt = val & ~(ACPI_BITMASK_SLEEP_ENABLE);
> +
> +    if (val & ACPI_BITMASK_SLEEP_ENABLE) {
> +        /* Change suspend type */
> +        uint16_t sus_typ = (val >> 10) & 7;
> +        switch (sus_typ) {
> +        /* Not support s3 s4 yet */
> +        case 7: /* Soft power off */
> +            qemu_system_shutdown_request(SHUTDOWN_CAUSE_GUEST_SHUTDOWN);
> +            break;
> +        default:
> +            break;
> +        }
> +    }
> +}
> +
> +static void acpi_pm_cnt_write(void *opaque, hwaddr addr, uint64_t val,
> +                              unsigned width)
> +{
> +    acpi_pm1_cnt_write(opaque, val);
> +}
> +
> +static const MemoryRegionOps acpi_pm_cnt_ops = {
> +    .read = acpi_pm_cnt_read,
> +    .write = acpi_pm_cnt_write,
> +    .valid.min_access_size = 1,
> +    .valid.max_access_size = 4,
> +    .endianness = DEVICE_LITTLE_ENDIAN,
> +};
> +
> +static void acpi_notify_wakeup(Notifier *notifier, void *data)
> +{
> +    ACPIREGS *ar = container_of(notifier, ACPIREGS, wakeup);
> +    WakeupReason *reason = data;
> +
> +    switch (*reason) {
> +    case QEMU_WAKEUP_REASON_RTC:
> +        ar->pm1.evt.sts |=
> +            (ACPI_BITMASK_WAKE_STATUS | ACPI_BITMASK_RT_CLOCK_STATUS);
> +        break;
> +    case QEMU_WAKEUP_REASON_PMTIMER:
> +        ar->pm1.evt.sts |=
> +            (ACPI_BITMASK_WAKE_STATUS | ACPI_BITMASK_TIMER_STATUS);
> +        break;
> +    case QEMU_WAKEUP_REASON_OTHER:
> +        /*
> +         * ACPI_BITMASK_WAKE_STATUS should be set on resume.
> +         * Pretend that resume was caused by power button
> +         */
> +        ar->pm1.evt.sts |=
> +            (ACPI_BITMASK_WAKE_STATUS | ACPI_BITMASK_POWER_BUTTON_STATUS);
> +        break;
> +    default:
> +        break;
> +    }
> +}
> +
> +static void ls7a_pm1_cnt_init(ACPIREGS *ar, MemoryRegion *parent,
> +                              uint64_t offset)
> +{
> +    ar->wakeup.notify = acpi_notify_wakeup;
> +    qemu_register_wakeup_notifier(&ar->wakeup);
> +    memory_region_init_io(&ar->pm1.cnt.io, memory_region_owner(parent),
> +                          &acpi_pm_cnt_ops, ar, "acpi-cnt", 4);
> +    memory_region_add_subregion(parent, offset, &ar->pm1.cnt.io);
> +}
> +
> +static void ls7a_pm_reset(DeviceState *d)
> +{
> +    LS7APMState *pm = LS7A_PM(d);
> +
> +    acpi_pm1_evt_reset(&pm->acpi_regs);
> +    acpi_pm1_cnt_reset(&pm->acpi_regs);
> +    acpi_pm_tmr_reset(&pm->acpi_regs);
> +    acpi_gpe_reset(&pm->acpi_regs);
> +
> +    acpi_update_sci(&pm->acpi_regs, pm->irq);
> +}
> +
> +static void pm_powerdown_req(Notifier *n, void *opaque)
> +{
> +    LS7APMState *pm = container_of(n, LS7APMState, powerdown_notifier);
> +
> +    acpi_pm1_evt_power_down(&pm->acpi_regs);
> +}
> +
> +void ls7a_pm_init(DeviceState *ls7a_pm, qemu_irq pm_irq)
> +{
> +    LS7APMState *pm = LS7A_PM(ls7a_pm);
> +    pm->irq = pm_irq;
> +}
> +
> +static void ls7a_pm_realize(DeviceState *dev, Error **errp)
> +{
> +    LS7APMState *pm = LS7A_PM(dev);
> +    SysBusDevice *sbd = SYS_BUS_DEVICE(dev);
> +
> +    /*
> +     * ls7a board acpi hardware info, including
> +     * acpi system io base address
> +     * acpi gpe length
> +     * acpi sci irq number
> +     */
> +
> +    memory_region_init(&pm->iomem, OBJECT(pm), "ls7a_pm", ACPI_IO_SIZE);
> +    sysbus_init_mmio(sbd, &pm->iomem);
> +
> +    ls7a_pm_tmr_init(&pm->acpi_regs, ls7a_pm_update_sci_fn,
> +                     &pm->iomem, LS7A_PM_TMR_BLK);
> +    ls7a_pm1_evt_init(&pm->acpi_regs, ls7a_pm_update_sci_fn,
> +                      &pm->iomem, LS7A_PM_EVT_BLK);
> +    ls7a_pm1_cnt_init(&pm->acpi_regs, &pm->iomem, LS7A_PM_CNT_BLK);
> +
> +    acpi_gpe_init(&pm->acpi_regs, ACPI_GPE0_LEN);
> +    memory_region_init_io(&pm->iomem_gpe, OBJECT(pm), &ls7a_gpe_ops, pm,
> +                          "acpi-gpe0", ACPI_GPE0_LEN);
> +    sysbus_init_mmio(sbd, &pm->iomem_gpe);
> +
> +    memory_region_init_io(&pm->iomem_reset, OBJECT(pm),
> +                          &ls7a_reset_ops, pm, "acpi-reset", 4);
> +    sysbus_init_mmio(sbd, &pm->iomem_reset);
> +
> +    pm->powerdown_notifier.notify = pm_powerdown_req;
> +    qemu_register_powerdown_notifier(&pm->powerdown_notifier);
> +}
> +
> +static void ls7a_pm_class_init(ObjectClass *klass, void *data)
> +{
> +    DeviceClass *dc = DEVICE_CLASS(klass);
> +
> +    dc->realize = ls7a_pm_realize;
> +    dc->reset = ls7a_pm_reset;
> +    dc->desc = "PM";
> +    dc->vmsd = &vmstate_ls7a_pm;
> +}
> +
> +static const TypeInfo ls7a_pm_info = {
> +    .name          = TYPE_LS7A_PM,
> +    .parent        = TYPE_SYS_BUS_DEVICE,
> +    .instance_size = sizeof(LS7APMState),
> +    .class_init    = ls7a_pm_class_init,
> +};
> +
> +static void ls7a_pm_register_types(void)
> +{
> +    type_register_static(&ls7a_pm_info);
> +}
> +
> +type_init(ls7a_pm_register_types)
> diff --git a/hw/acpi/meson.build b/hw/acpi/meson.build
> index cea2f5f93a..d9078a2e26 100644
> --- a/hw/acpi/meson.build
> +++ b/hw/acpi/meson.build
> @@ -26,6 +26,7 @@ acpi_ss.add(when: 'CONFIG_ACPI_X86_ICH', if_true: files('ich9.c', 'tco.c'))
>  acpi_ss.add(when: 'CONFIG_ACPI_ERST', if_true: files('erst.c'))
>  acpi_ss.add(when: 'CONFIG_IPMI', if_true: files('ipmi.c'), if_false: files('ipmi-stub.c'))
>  acpi_ss.add(when: 'CONFIG_PC', if_false: files('acpi-x86-stub.c'))
> +acpi_ss.add(when: 'CONFIG_ACPI_LOONGARCH', if_true: files('ls7a.c'))
>  if have_tpm
>    acpi_ss.add(files('tpm.c'))
>  endif
> diff --git a/hw/loongarch/Kconfig b/hw/loongarch/Kconfig
> index 35b6680772..7c863b7150 100644
> --- a/hw/loongarch/Kconfig
> +++ b/hw/loongarch/Kconfig
> @@ -14,3 +14,5 @@ config LOONGARCH_VIRT
>      select LOONGARCH_PCH_MSI
>      select LOONGARCH_EXTIOI
>      select LS7A_RTC
> +    select ACPI_LOONGARCH
> +    select ACPI_PCI
> diff --git a/hw/loongarch/loongson3.c b/hw/loongarch/loongson3.c
> index 661345f2bb..b3275967d5 100644
> --- a/hw/loongarch/loongson3.c
> +++ b/hw/loongarch/loongson3.c
> @@ -28,7 +28,8 @@
>  #include "hw/pci-host/ls7a.h"
>  #include "hw/pci-host/gpex.h"
>  #include "hw/misc/unimp.h"
> -
> +#include "hw/acpi/aml-build.h"
> +#include "qapi/qapi-visit-common.h"
>  #include "target/loongarch/cpu.h"
>  
>  static struct _loaderparams {
> @@ -63,11 +64,11 @@ static int64_t load_kernel_info(void)
>  
>  static void loongarch_devices_init(DeviceState *pch_pic)
>  {
> -    DeviceState *gpex_dev;
> +    DeviceState *gpex_dev, *ls7a_pm;
>      SysBusDevice *d;
>      PCIBus *pci_bus;
>      MemoryRegion *ecam_alias, *ecam_reg, *pio_alias, *pio_reg;
> -    MemoryRegion *mmio_alias, *mmio_reg;
> +    MemoryRegion *mmio_alias, *mmio_reg, *pm_reg;
>      int i;
>  
>      gpex_dev = qdev_new(TYPE_GPEX_HOST);
> @@ -133,6 +134,18 @@ static void loongarch_devices_init(DeviceState *pch_pic)
>      sysbus_create_simple("ls7a_rtc", LS7A_RTC_REG_BASE,
>                           qdev_get_gpio_in(pch_pic,
>                           LS7A_RTC_IRQ - PCH_PIC_IRQ_OFFSET));
> +    /* Init pm */
> +    ls7a_pm = qdev_new(TYPE_LS7A_PM);
> +    d = SYS_BUS_DEVICE(ls7a_pm);
> +    sysbus_realize_and_unref(d, &error_fatal);
> +    ls7a_pm_init(ls7a_pm, qdev_get_gpio_in(pch_pic,
> +                                           ACPI_SCI_IRQ - PCH_PIC_IRQ_OFFSET));
> +    pm_reg = sysbus_mmio_get_region(d, 0);
> +    memory_region_add_subregion(get_system_memory(), ACPI_IO_BASE, pm_reg);
> +    memory_region_add_subregion(pm_reg, LS7A_GPE0_STS_REG,
> +                                sysbus_mmio_get_region(d, 1));
> +    memory_region_add_subregion(pm_reg, LS7A_GPE0_RESET_REG,
> +                                sysbus_mmio_get_region(d, 2));
>  }
>  
>  static void loongarch_irq_init(LoongArchMachineState *lams)
> diff --git a/include/hw/acpi/ls7a.h b/include/hw/acpi/ls7a.h
> new file mode 100644
> index 0000000000..28fe23c8a3
> --- /dev/null
> +++ b/include/hw/acpi/ls7a.h
> @@ -0,0 +1,53 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +/*
> + * QEMU GMCH/LS7A PCI PM Emulation
> + *
> + * Copyright (C) 2021 Loongson Technology Corporation Limited
> + */
> +
> +#ifndef HW_ACPI_LS7A_H
> +#define HW_ACPI_LS7A_H
> +
> +#include "hw/acpi/acpi.h"
> +#include "hw/sysbus.h"
> +
> +#define LS7A_ACPI_IO_BASE         0x800
> +#define LS7A_ACPI_IO_SIZE         0x100
> +#define LS7A_PM_EVT_BLK           (0x0C) /* 4 bytes */
> +#define LS7A_PM_CNT_BLK           (0x14) /* 2 bytes */
> +#define LS7A_GPE0_STS_REG         (0x28) /* 4 bytes */
> +#define LS7A_GPE0_ENA_REG         (0x2C) /* 4 bytes */
> +#define LS7A_GPE0_RESET_REG       (0x30) /* 4 bytes */
> +#define LS7A_PM_TMR_BLK           (0x18) /* 4 bytes */
> +#define LS7A_GPE0_LEN             (8)
> +#define ACPI_IO_BASE              (LS7A_ACPI_REG_BASE)
> +#define ACPI_GPE0_LEN             (LS7A_GPE0_LEN)
> +#define ACPI_IO_SIZE              (LS7A_ACPI_IO_SIZE)
> +#define ACPI_SCI_IRQ              (LS7A_SCI_IRQ)
> +
> +typedef struct LS7APMState {
> +    SysBusDevice parent_obj;
> +    /*
> +     * In ls7a spec says that pm1_cnt register is 32bit width and
> +     * that the upper 16bits are reserved and unused.
> +     * PM1a_CNT_BLK = 2 in FADT so it is defined as uint16_t.
> +     */
> +    ACPIREGS acpi_regs;
> +
> +    MemoryRegion iomem;
> +    MemoryRegion iomem_gpe;
> +    MemoryRegion iomem_reset;
> +
> +    qemu_irq irq;      /* SCI */
> +
> +    uint32_t pm_io_base;
> +    Notifier powerdown_notifier;
> +} LS7APMState;
> +
> +#define TYPE_LS7A_PM "ls7a_pm"
> +DECLARE_INSTANCE_CHECKER(struct LS7APMState, LS7A_PM, TYPE_LS7A_PM)
> +
> +void ls7a_pm_init(DeviceState *ls7a_pm, qemu_irq irq);
> +
> +extern const VMStateDescription vmstate_ls7a_pm;
> +#endif /* HW_ACPI_LS7A_H */
> diff --git a/include/hw/pci-host/ls7a.h b/include/hw/pci-host/ls7a.h
> index 1110d25306..baf8dde84e 100644
> --- a/include/hw/pci-host/ls7a.h
> +++ b/include/hw/pci-host/ls7a.h
> @@ -11,6 +11,7 @@
>  #include "hw/pci/pci.h"
>  #include "hw/pci/pcie_host.h"
>  #include "hw/pci-host/pam.h"
> +#include "hw/acpi/ls7a.h"
>  #include "qemu/units.h"
>  #include "qemu/range.h"
>  #include "qom/object.h"
> @@ -21,6 +22,9 @@
>  #define LS7A_PCI_IO_BASE        0x18004000UL
>  #define LS7A_PCI_IO_SIZE        0xC000
>  
> +#define LS7A_PCI_MEM_BASE        0x40000000UL
> +#define LS7A_PCI_MEM_SIZE        0x40000000UL
> +
>  #define LS7A_PCH_REG_BASE       0x10000000UL
>  #define LS7A_IOAPIC_REG_BASE    (LS7A_PCH_REG_BASE)
>  #define LS7A_PCH_MSI_ADDR_LOW   0x2FF00000UL
> @@ -39,4 +43,6 @@
>  #define LS7A_MISC_REG_BASE      (LS7A_PCH_REG_BASE + 0x00080000)
>  #define LS7A_RTC_REG_BASE       (LS7A_MISC_REG_BASE + 0x00050100)
>  #define LS7A_RTC_LEN            0x100
> +#define LS7A_ACPI_REG_BASE      (LS7A_MISC_REG_BASE + 0x00050000)
> +#define LS7A_SCI_IRQ            (PCH_PIC_IRQ_OFFSET + 4)
>  #endif


