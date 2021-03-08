Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BCB443308D3
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Mar 2021 08:34:37 +0100 (CET)
Received: from localhost ([::1]:42752 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJAPU-0002cw-8w
	for lists+qemu-devel@lfdr.de; Mon, 08 Mar 2021 02:34:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59824)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lJALO-0001NQ-Jk
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 02:30:22 -0500
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:45721)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lJALM-00015i-H6
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 02:30:22 -0500
Received: by mail-wr1-x430.google.com with SMTP id e10so10266435wro.12
 for <qemu-devel@nongnu.org>; Sun, 07 Mar 2021 23:30:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=CAauk+YIUrm32EP/GYiq+vfXCdPmT96MoQonDtIB/MY=;
 b=V0TyHYchm0r09un89ijxlEaJS/N2HuwIoB7JQzB54i45qZWDiJwlR0repHyNRqTSPn
 MaRBD39+i9O5oYUbIVHvPWU5Ian4wTGpOzMlQajnPWpF/d+ODOMVgs5jen0tjfvVLctf
 zR8a3FTPgnH5FLf0247dIve+zc/EkofOUuDJu6mtkHe8LjWeIrWNPS4bNXdlbIWuvNsi
 hGScS1DiKyjKQZoEy8MMazSiktLQMkqMLcm3s7xsJH4Xi4UcfbpuXvCo0Xmhoos0+sTW
 kX3bIbO39Sp8I18FG1RqvB9Xyb/ZHtUTczVIsgyTyQg1OZNiyB9aWIMw8BlEuotd3x7D
 6+2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=CAauk+YIUrm32EP/GYiq+vfXCdPmT96MoQonDtIB/MY=;
 b=m9kzw9I9SHkjNvV68+8hEUAfakZJQ1c47ZHNdnz+2Qt23AFLMKz7VvjiRxY2hEt0Pm
 jZdGR6X8qpydV7t1c15BL0+46/nR5WRiCczgUsYSf8dZTArfxIZoHHGLP+NMb/TD7/+6
 B0v41FAFvdTEqHcbjAAdcC5FcWG+eQqukS58LUm3U/eJwHTcR6hAFGopLx1dIQbAXIyS
 +FCNQ1I992KRGAqf44JrrBRMmi4zgc0tSYOWQ9zf56bRdIqjPRpK9AE/v5J/iXVbN8ud
 MynzqzKEt7SIBGusWLwcThSMyumzhd033All92HOF+8ffU3iBPi6LLmjc+H2nmKproxs
 8hwQ==
X-Gm-Message-State: AOAM531v2JXcUlq5rOXpr+++PJeQA8BjUtReym3ucTsvE7AUMDAKKycj
 Lgy4BUgZDbfcIqyqE1C0onc=
X-Google-Smtp-Source: ABdhPJyL/RerGgOAHC8odg32Q91vDzfAob9fz6+ED9Aauqs6psbJ9ICWQ79uByiPRtgb/ur5bnpIMQ==
X-Received: by 2002:a5d:6b8a:: with SMTP id n10mr21465112wrx.150.1615188618466; 
 Sun, 07 Mar 2021 23:30:18 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id a6sm17601750wmm.0.2021.03.07.23.30.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 07 Mar 2021 23:30:17 -0800 (PST)
Subject: Re: [PATCH v5 4/5] m68k: add a system controller
To: Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org,
 Thomas Huth <thuth@redhat.com>
References: <20210307205623.507180-1-laurent@vivier.eu>
 <20210307205623.507180-5-laurent@vivier.eu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <db46d90a-ad9e-720e-c219-19d647555378@amsat.org>
Date: Mon, 8 Mar 2021 08:30:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210307205623.507180-5-laurent@vivier.eu>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x430.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/7/21 9:56 PM, Laurent Vivier wrote:
> Add a system controller for the m68k-virt machine.
> This controller allows the kernel to power off or reset the machine.
> 
> Signed-off-by: Laurent Vivier <laurent@vivier.eu>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  include/hw/misc/m68k_virt_ctrl.h |  22 +++++
>  hw/misc/m68k_virt_ctrl.c         | 152 +++++++++++++++++++++++++++++++
>  hw/misc/Kconfig                  |   3 +
>  hw/misc/meson.build              |   3 +
>  hw/misc/trace-events             |   7 ++
>  5 files changed, 187 insertions(+)
>  create mode 100644 include/hw/misc/m68k_virt_ctrl.h
>  create mode 100644 hw/misc/m68k_virt_ctrl.c
> 
> diff --git a/include/hw/misc/m68k_virt_ctrl.h b/include/hw/misc/m68k_virt_ctrl.h
> new file mode 100644
> index 000000000000..1db7960e5477
> --- /dev/null
> +++ b/include/hw/misc/m68k_virt_ctrl.h
> @@ -0,0 +1,22 @@
> +/*
> + * SPDX-License-Identifer: GPL-2.0-or-later
> + *
> + * Virt m68k system Controller
> + */
> +
> +#ifndef M68K_VIRT_CTRL_H
> +#define M68K_VIRT_CTRL_H
> +
> +#define TYPE_M68K_VIRT_CTRL "m68k-virt-ctrl"
> +OBJECT_DECLARE_SIMPLE_TYPE(M68KVirtCtrlState, M68K_VIRT_CTRL)
> +
> +struct M68KVirtCtrlState {
> +    SysBusDevice parent_obj;
> +
> +    MemoryRegion iomem;
> +    qemu_irq irq;
> +
> +    uint32_t irq_enabled;
> +};
> +
> +#endif
> diff --git a/hw/misc/m68k_virt_ctrl.c b/hw/misc/m68k_virt_ctrl.c
> new file mode 100644
> index 000000000000..fb34aa10211a
> --- /dev/null
> +++ b/hw/misc/m68k_virt_ctrl.c
> @@ -0,0 +1,152 @@
> +/*
> + * SPDX-License-Identifer: GPL-2.0-or-later
> + *
> + * Virt m68k system Controller
> + */
> +
> +#include "qemu/osdep.h"
> +#include "hw/irq.h"
> +#include "hw/qdev-properties.h"
> +#include "hw/sysbus.h"
> +#include "migration/vmstate.h"
> +#include "qemu/log.h"
> +#include "trace.h"
> +#include "sysemu/runstate.h"
> +#include "hw/misc/m68k_virt_ctrl.h"
> +
> +enum {
> +    REG_FEATURES = 0x00,
> +    REG_CMD      = 0x04,
> +};
> +
> +#define FEAT_POWER_CTRL 0x00000001
> +
> +enum {
> +    CMD_NOOP,
> +    CMD_RESET,
> +    CMD_HALT,
> +    CMD_PANIC,
> +};
> +
> +static uint64_t m68k_virt_ctrl_read(void *opaque, hwaddr addr,
> +                                    unsigned size)
> +{
> +    M68KVirtCtrlState *s = opaque;
> +    uint64_t value = 0;
> +
> +    switch (addr) {
> +    case REG_FEATURES:
> +        value = FEAT_POWER_CTRL;
> +        break;
> +    default:
> +        qemu_log_mask(LOG_UNIMP,
> +                      "%s: unimplemented register read 0x%02"HWADDR_PRIx"\n",
> +                      __func__, addr);
> +        break;
> +    }
> +
> +    trace_m68k_virt_ctrl_write(s, addr, size, value);
> +
> +    return value;
> +}
> +
> +static void m68k_virt_ctrl_write(void *opaque, hwaddr addr,
> +                                 uint64_t value, unsigned size)
> +{
> +    M68KVirtCtrlState *s = opaque;
> +
> +    trace_m68k_virt_ctrl_write(s, addr, size, value);
> +
> +    switch (addr) {
> +    case REG_CMD:
> +        switch (value) {
> +        case CMD_NOOP:
> +            break;
> +        case CMD_RESET:
> +            qemu_system_reset_request(SHUTDOWN_CAUSE_GUEST_RESET);
> +            break;
> +        case CMD_HALT:
> +            qemu_system_shutdown_request(SHUTDOWN_CAUSE_GUEST_SHUTDOWN);
> +            break;
> +        case CMD_PANIC:
> +            qemu_system_shutdown_request(SHUTDOWN_CAUSE_GUEST_PANIC);
> +            break;
> +        }
> +        break;
> +    default:
> +        qemu_log_mask(LOG_UNIMP,
> +                      "%s: unimplemented register write 0x%02"HWADDR_PRIx"\n",
> +                      __func__, addr);
> +        break;
> +    }
> +}
> +
> +static const MemoryRegionOps m68k_virt_ctrl_ops = {
> +    .read = m68k_virt_ctrl_read,
> +    .write = m68k_virt_ctrl_write,
> +    .endianness = DEVICE_NATIVE_ENDIAN,
> +    .valid.max_access_size = 4,
> +    .impl.max_access_size = 4,
> +};
> +
> +static void m68k_virt_ctrl_reset(DeviceState *dev)
> +{
> +    M68KVirtCtrlState *s = M68K_VIRT_CTRL(dev);
> +
> +    trace_m68k_virt_ctrl_reset(s);
> +}
> +
> +static void m68k_virt_ctrl_realize(DeviceState *dev, Error **errp)
> +{
> +    M68KVirtCtrlState *s = M68K_VIRT_CTRL(dev);
> +
> +    trace_m68k_virt_ctrl_instance_init(s);
> +
> +    memory_region_init_io(&s->iomem, OBJECT(s), &m68k_virt_ctrl_ops, s,
> +                          "m68k-virt-ctrl", 0x100);
> +}
> +
> +static const VMStateDescription vmstate_m68k_virt_ctrl = {
> +    .name = "m68k-virt-ctrl",
> +    .version_id = 1,
> +    .minimum_version_id = 1,
> +    .fields = (VMStateField[]) {
> +        VMSTATE_UINT32(irq_enabled, M68KVirtCtrlState),
> +        VMSTATE_END_OF_LIST()
> +    }
> +};
> +
> +static void m68k_virt_ctrl_instance_init(Object *obj)
> +{
> +    SysBusDevice *dev = SYS_BUS_DEVICE(obj);
> +    M68KVirtCtrlState *s = M68K_VIRT_CTRL(obj);
> +
> +    trace_m68k_virt_ctrl_instance_init(s);
> +
> +    sysbus_init_mmio(dev, &s->iomem);
> +    sysbus_init_irq(dev, &s->irq);
> +}
> +
> +static void m68k_virt_ctrl_class_init(ObjectClass *oc, void *data)
> +{
> +    DeviceClass *dc = DEVICE_CLASS(oc);
> +
> +    dc->reset = m68k_virt_ctrl_reset;
> +    dc->realize = m68k_virt_ctrl_realize;
> +    dc->vmsd = &vmstate_m68k_virt_ctrl;
> +}
> +
> +static const TypeInfo m68k_virt_ctrl_info = {
> +    .name = TYPE_M68K_VIRT_CTRL,
> +    .parent = TYPE_SYS_BUS_DEVICE,
> +    .class_init = m68k_virt_ctrl_class_init,
> +    .instance_init = m68k_virt_ctrl_instance_init,
> +    .instance_size = sizeof(M68KVirtCtrlState),
> +};
> +
> +static void m68k_virt_ctrl_register_types(void)
> +{
> +    type_register_static(&m68k_virt_ctrl_info);
> +}

AFAICT nothing is m68k-specific in this controller... And being
trivial it can easily be reused.
What about renaming it... TrivialVirtSystemController maybe, and
write a a-la-gold spec documentation for it?

