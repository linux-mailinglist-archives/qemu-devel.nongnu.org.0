Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 945483308E3
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Mar 2021 08:39:05 +0100 (CET)
Received: from localhost ([::1]:49414 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJATo-0005h3-Lc
	for lists+qemu-devel@lfdr.de; Mon, 08 Mar 2021 02:39:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60340)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lJAOh-00038X-Jy
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 02:33:47 -0500
Received: from mout.kundenserver.de ([217.72.192.74]:41219)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lJAOe-0002YH-Mn
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 02:33:47 -0500
Received: from [192.168.100.1] ([82.252.159.174]) by mrelayeu.kundenserver.de
 (mreue106 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MekKJ-1lqr7K1KoX-00aigg; Mon, 08 Mar 2021 08:33:35 +0100
Subject: Re: [PATCH v5 4/5] m68k: add a system controller
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>
References: <20210307205623.507180-1-laurent@vivier.eu>
 <20210307205623.507180-5-laurent@vivier.eu>
 <db46d90a-ad9e-720e-c219-19d647555378@amsat.org>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <84158a04-e8be-c2c8-6185-5a485b3e9b88@vivier.eu>
Date: Mon, 8 Mar 2021 08:33:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <db46d90a-ad9e-720e-c219-19d647555378@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:wjzu2SoeSmX6HOP6HoDN95eCrQTomQbHpMtWPNyesIGFQkFa3hF
 MisFUWZMzH9jlhU54JhhyBvJIqkL8sk0c+QtAT5TYiVE41CQnuY51TMMj3T4IaY6GEkTP3R
 fvvLj8Vz5ySQPZ5HBNUqcaUyiUWs9yMpyOn8MUUeCg0rvPWWdO96FFknuARu8llV6/AAdu/
 C73zrFkRXI4vwdZkGPD0g==
X-UI-Out-Filterresults: notjunk:1;V03:K0:dZ4GTj3Czhw=:Ip0GUPp4IfTKNv1RTeGpC4
 r8ysOTw4fDQKq8WlcWonrJgkYkLk0T1StwVMYWWnjZhtRipqC7lLdfpn4ehXA1ySMx6oQtHxm
 WqeH2xkew8DteJC8flPmQINU3HZsOYEKILYI/+bIC7AqR4VK8h1iVzNq2p3q/v7D7TIlMdf+s
 oEPCTOVblMOxUpRos09mHnsRYPSd/GpHYbA9U1SGMl0TCsPeXStpcXx7SBLyNLhq+tbrDGGGn
 hgxrz6ffadPCOv+31OB1FXOWW8eNlNuyvoCjIYWBe63JzjZ0J5LxdHIeS7H83hZYifBGYcn04
 883arByfGoUTdNs8BlDR0i9HG/5zlbgprNjdjMu/8AVwX1Dl0LYtWbVUBFensJ6NTpmAaDYTi
 ajade6b5fwTPTRh4IRW7Wh7eGXtLc6P28LjNeBwZCxx6Q5jyyFIVpnfnzAIRSlps8bwJtLOIz
 AHYLFfUgaA==
Received-SPF: none client-ip=217.72.192.74; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

Le 08/03/2021 à 08:30, Philippe Mathieu-Daudé a écrit :
> On 3/7/21 9:56 PM, Laurent Vivier wrote:
>> Add a system controller for the m68k-virt machine.
>> This controller allows the kernel to power off or reset the machine.
>>
>> Signed-off-by: Laurent Vivier <laurent@vivier.eu>
>> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>  include/hw/misc/m68k_virt_ctrl.h |  22 +++++
>>  hw/misc/m68k_virt_ctrl.c         | 152 +++++++++++++++++++++++++++++++
>>  hw/misc/Kconfig                  |   3 +
>>  hw/misc/meson.build              |   3 +
>>  hw/misc/trace-events             |   7 ++
>>  5 files changed, 187 insertions(+)
>>  create mode 100644 include/hw/misc/m68k_virt_ctrl.h
>>  create mode 100644 hw/misc/m68k_virt_ctrl.c
>>
>> diff --git a/include/hw/misc/m68k_virt_ctrl.h b/include/hw/misc/m68k_virt_ctrl.h
>> new file mode 100644
>> index 000000000000..1db7960e5477
>> --- /dev/null
>> +++ b/include/hw/misc/m68k_virt_ctrl.h
>> @@ -0,0 +1,22 @@
>> +/*
>> + * SPDX-License-Identifer: GPL-2.0-or-later
>> + *
>> + * Virt m68k system Controller
>> + */
>> +
>> +#ifndef M68K_VIRT_CTRL_H
>> +#define M68K_VIRT_CTRL_H
>> +
>> +#define TYPE_M68K_VIRT_CTRL "m68k-virt-ctrl"
>> +OBJECT_DECLARE_SIMPLE_TYPE(M68KVirtCtrlState, M68K_VIRT_CTRL)
>> +
>> +struct M68KVirtCtrlState {
>> +    SysBusDevice parent_obj;
>> +
>> +    MemoryRegion iomem;
>> +    qemu_irq irq;
>> +
>> +    uint32_t irq_enabled;
>> +};
>> +
>> +#endif
>> diff --git a/hw/misc/m68k_virt_ctrl.c b/hw/misc/m68k_virt_ctrl.c
>> new file mode 100644
>> index 000000000000..fb34aa10211a
>> --- /dev/null
>> +++ b/hw/misc/m68k_virt_ctrl.c
>> @@ -0,0 +1,152 @@
>> +/*
>> + * SPDX-License-Identifer: GPL-2.0-or-later
>> + *
>> + * Virt m68k system Controller
>> + */
>> +
>> +#include "qemu/osdep.h"
>> +#include "hw/irq.h"
>> +#include "hw/qdev-properties.h"
>> +#include "hw/sysbus.h"
>> +#include "migration/vmstate.h"
>> +#include "qemu/log.h"
>> +#include "trace.h"
>> +#include "sysemu/runstate.h"
>> +#include "hw/misc/m68k_virt_ctrl.h"
>> +
>> +enum {
>> +    REG_FEATURES = 0x00,
>> +    REG_CMD      = 0x04,
>> +};
>> +
>> +#define FEAT_POWER_CTRL 0x00000001
>> +
>> +enum {
>> +    CMD_NOOP,
>> +    CMD_RESET,
>> +    CMD_HALT,
>> +    CMD_PANIC,
>> +};
>> +
>> +static uint64_t m68k_virt_ctrl_read(void *opaque, hwaddr addr,
>> +                                    unsigned size)
>> +{
>> +    M68KVirtCtrlState *s = opaque;
>> +    uint64_t value = 0;
>> +
>> +    switch (addr) {
>> +    case REG_FEATURES:
>> +        value = FEAT_POWER_CTRL;
>> +        break;
>> +    default:
>> +        qemu_log_mask(LOG_UNIMP,
>> +                      "%s: unimplemented register read 0x%02"HWADDR_PRIx"\n",
>> +                      __func__, addr);
>> +        break;
>> +    }
>> +
>> +    trace_m68k_virt_ctrl_write(s, addr, size, value);
>> +
>> +    return value;
>> +}
>> +
>> +static void m68k_virt_ctrl_write(void *opaque, hwaddr addr,
>> +                                 uint64_t value, unsigned size)
>> +{
>> +    M68KVirtCtrlState *s = opaque;
>> +
>> +    trace_m68k_virt_ctrl_write(s, addr, size, value);
>> +
>> +    switch (addr) {
>> +    case REG_CMD:
>> +        switch (value) {
>> +        case CMD_NOOP:
>> +            break;
>> +        case CMD_RESET:
>> +            qemu_system_reset_request(SHUTDOWN_CAUSE_GUEST_RESET);
>> +            break;
>> +        case CMD_HALT:
>> +            qemu_system_shutdown_request(SHUTDOWN_CAUSE_GUEST_SHUTDOWN);
>> +            break;
>> +        case CMD_PANIC:
>> +            qemu_system_shutdown_request(SHUTDOWN_CAUSE_GUEST_PANIC);
>> +            break;
>> +        }
>> +        break;
>> +    default:
>> +        qemu_log_mask(LOG_UNIMP,
>> +                      "%s: unimplemented register write 0x%02"HWADDR_PRIx"\n",
>> +                      __func__, addr);
>> +        break;
>> +    }
>> +}
>> +
>> +static const MemoryRegionOps m68k_virt_ctrl_ops = {
>> +    .read = m68k_virt_ctrl_read,
>> +    .write = m68k_virt_ctrl_write,
>> +    .endianness = DEVICE_NATIVE_ENDIAN,
>> +    .valid.max_access_size = 4,
>> +    .impl.max_access_size = 4,
>> +};
>> +
>> +static void m68k_virt_ctrl_reset(DeviceState *dev)
>> +{
>> +    M68KVirtCtrlState *s = M68K_VIRT_CTRL(dev);
>> +
>> +    trace_m68k_virt_ctrl_reset(s);
>> +}
>> +
>> +static void m68k_virt_ctrl_realize(DeviceState *dev, Error **errp)
>> +{
>> +    M68KVirtCtrlState *s = M68K_VIRT_CTRL(dev);
>> +
>> +    trace_m68k_virt_ctrl_instance_init(s);
>> +
>> +    memory_region_init_io(&s->iomem, OBJECT(s), &m68k_virt_ctrl_ops, s,
>> +                          "m68k-virt-ctrl", 0x100);
>> +}
>> +
>> +static const VMStateDescription vmstate_m68k_virt_ctrl = {
>> +    .name = "m68k-virt-ctrl",
>> +    .version_id = 1,
>> +    .minimum_version_id = 1,
>> +    .fields = (VMStateField[]) {
>> +        VMSTATE_UINT32(irq_enabled, M68KVirtCtrlState),
>> +        VMSTATE_END_OF_LIST()
>> +    }
>> +};
>> +
>> +static void m68k_virt_ctrl_instance_init(Object *obj)
>> +{
>> +    SysBusDevice *dev = SYS_BUS_DEVICE(obj);
>> +    M68KVirtCtrlState *s = M68K_VIRT_CTRL(obj);
>> +
>> +    trace_m68k_virt_ctrl_instance_init(s);
>> +
>> +    sysbus_init_mmio(dev, &s->iomem);
>> +    sysbus_init_irq(dev, &s->irq);
>> +}
>> +
>> +static void m68k_virt_ctrl_class_init(ObjectClass *oc, void *data)
>> +{
>> +    DeviceClass *dc = DEVICE_CLASS(oc);
>> +
>> +    dc->reset = m68k_virt_ctrl_reset;
>> +    dc->realize = m68k_virt_ctrl_realize;
>> +    dc->vmsd = &vmstate_m68k_virt_ctrl;
>> +}
>> +
>> +static const TypeInfo m68k_virt_ctrl_info = {
>> +    .name = TYPE_M68K_VIRT_CTRL,
>> +    .parent = TYPE_SYS_BUS_DEVICE,
>> +    .class_init = m68k_virt_ctrl_class_init,
>> +    .instance_init = m68k_virt_ctrl_instance_init,
>> +    .instance_size = sizeof(M68KVirtCtrlState),
>> +};
>> +
>> +static void m68k_virt_ctrl_register_types(void)
>> +{
>> +    type_register_static(&m68k_virt_ctrl_info);
>> +}
> 
> AFAICT nothing is m68k-specific in this controller... And being
> trivial it can easily be reused.
> What about renaming it... TrivialVirtSystemController maybe, and
> write a a-la-gold spec documentation for it?
> 

I agree with that, I stopped in the middle of the way by putting it in misc but keeping m68k in the
name.

Thanks,
Laurent


