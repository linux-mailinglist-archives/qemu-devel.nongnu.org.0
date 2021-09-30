Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F12A841D391
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Sep 2021 08:46:25 +0200 (CEST)
Received: from localhost ([::1]:50262 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVppo-0007Zx-RH
	for lists+qemu-devel@lfdr.de; Thu, 30 Sep 2021 02:46:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53956)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mVpTL-00089X-Ry
 for qemu-devel@nongnu.org; Thu, 30 Sep 2021 02:23:11 -0400
Received: from 9.mo552.mail-out.ovh.net ([87.98.180.222]:39343)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mVpTH-00013m-UU
 for qemu-devel@nongnu.org; Thu, 30 Sep 2021 02:23:11 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.146.197])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id 86AC521429;
 Thu, 30 Sep 2021 06:22:51 +0000 (UTC)
Received: from kaod.org (37.59.142.99) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Thu, 30 Sep
 2021 08:22:50 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-99G003e138679f-c9f2-4006-953a-8a168a8b815d,
 7F6F77616FEFA4DE1E608E9282B3397E3DBDA81F) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <76c9714a-4c25-27f7-7d26-c471919e8a8f@kaod.org>
Date: Thu, 30 Sep 2021 08:22:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [RFC PATCH 1/1] hw: aspeed_adc: Add initial Aspeed ADC support
Content-Language: en-US
To: <pdel@fb.com>
References: <20210930004235.1656003-1-pdel@fb.com>
 <20210930004235.1656003-2-pdel@fb.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20210930004235.1656003-2-pdel@fb.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.99]
X-ClientProxiedBy: DAG1EX1.mxp5.local (172.16.2.1) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 2c7f2dff-2dd5-47a6-860b-e4e8c4e1d08a
X-Ovh-Tracer-Id: 6321646505412037554
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvtddrudekfedguddtfecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfhfhfgjtgfgihesthejredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeekfeeiudekhfeujeetffevtdfhhfekheehhfdtjeekfeehieefjedvgfffgfeifeenucffohhmrghinhepghhithhhuhgsrdgtohhmnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrdelleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepfhegsghughesrghmshgrthdrohhrgh
Received-SPF: pass client-ip=87.98.180.222; envelope-from=clg@kaod.org;
 helo=9.mo552.mail-out.ovh.net
X-Spam_score_int: -48
X-Spam_score: -4.9
X-Spam_bar: ----
X-Spam_report: (-4.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-3.03,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>,
 amithash@fb.com, qemu-devel@nongnu.org, patrick@stwcx.xyz,
 qemu-arm <qemu-arm@nongnu.org>, Joel Stanley <joel@jms.id.au>, zhdaniel@fb.com,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello Peter,

If you run ./scripts/get_maintainer.pl on the patch, it will build
the list of persons and mailing list to send to.

On 9/30/21 02:42, pdel@fb.com wrote:
> From: Peter Delevoryas <pdel@fb.com>
> 
> This change sets up Aspeed SoC ADC emulation, so that most ADC drivers
> will pass the initialization sequence and load successfully. In the
> future, we can extend this to emulate more features.
> 
> The initialization sequence is:
> 
>      1. Set `ADC00` to `0xF`.
>      2. Wait for bit 8 of `ADC00` to be set.
> 
> I also added the sequence for enabling "Auto compensating sensing mode":
> 
>      1. Set `ADC00` to `0x2F` (set bit 5).
>      2. Wait for bit 5 of `ADC00` to be reset (to zero).
>      3. ...
>      4. ...
> 
> Fuji (AST2600):
>    Before:
>      [   56.185778] aspeed_adc: probe of 1e6e9000.adc failed with error -110
>      [   56.687936] aspeed_adc: probe of 1e6e9100.adc failed with error -110
> 
>    After:
>      aspeed_adc_read 0x0c read 0x0000
>      aspeed_adc_read 0x0c read 0x0000
>      aspeed_adc_write 0x00 write 0x000f
>      aspeed_adc_read 0x00 read 0x010f
>      aspeed_adc_read 0x00 read 0x010f
>      [   55.885164] aspeed_adc 1e6e9000.adc: trim 8
>      aspeed_adc_read 0xc4 read 0x0000
>      aspeed_adc_write 0xc4 write 0x0008
>      aspeed_adc_write 0x00 write 0x011f
>      aspeed_adc_write 0x00 write 0x1011f
>      aspeed_adc_read 0x10 read 0x0000
>      aspeed_adc_write 0x00 write 0x010f
>      [   55.886509] aspeed_adc 1e6e9000.adc: cv 512
>      aspeed_adc_write 0x00 write 0xffff010f
>      aspeed_adc_read 0x0c read 0x0000
>      aspeed_adc_read 0x0c read 0x0000
>      aspeed_adc_write 0x00 write 0x000f
>      aspeed_adc_read 0x00 read 0x010f
>      aspeed_adc_read 0x00 read 0x010f
>      [   55.890609] aspeed_adc 1e6e9100.adc: trim 8
>      aspeed_adc_read 0xc4 read 0x0000
>      aspeed_adc_write 0xc4 write 0x0008
>      aspeed_adc_write 0x00 write 0x011f
>      aspeed_adc_write 0x00 write 0x1011f
>      aspeed_adc_read 0x10 read 0x0000
>      aspeed_adc_write 0x00 write 0x010f
>      [   55.891863] aspeed_adc 1e6e9100.adc: cv 512
>      aspeed_adc_write 0x00 write 0xffff010f
> 
> YosemiteV2 (AST2500):
>    Before:
>      [   20.561588] ast_adc ast_adc.0: ast_adc_probe
>      [   20.563741] hwmon hwmon0: write offset: c4, val: 8
>      [   20.563925] hwmon hwmon0: write offset: c, val: 40
>      [   20.564099] hwmon hwmon0: write offset: 0, val: f
>      [   21.066110] ast_adc: driver init failed (ret=-110)!
>      [   21.066635] ast_adc: probe of ast_adc.0 failed with error -110
> 
>    After:
>      aspeed_adc_write 0xc4 write 0x0008
>      aspeed_adc_write 0x0c write 0x0040
>      aspeed_adc_write 0x00 write 0x000f
>      aspeed_adc_read 0x00 read 0x010f
>      aspeed_adc_write 0x00 write 0x002f
>      aspeed_adc_read 0x00 read 0x000f
>      aspeed_adc_read 0xc4 read 0x0008
>      [   19.602033] ast_adc: driver successfully loaded.


FYI, these series was sent by Andrew in 2017 and I have been keeping
it alive since in the aspeed-x.y branches :

* memory: Support unaligned accesses on aligned-only models
   https://github.com/legoater/qemu/commit/1960ba6bde27b91edb5336985a9210260a4c8938

   That was requested by Phil I think.

* hw/adc: Add basic Aspeed ADC model
   https://github.com/legoater/qemu/commit/1eff7b1cf10d1777635f7d2cef8ecb441cc607c4

   This is the initial patch. I added multi-engine support recently
   for the fuji.

* hw/arm: Integrate ADC model into Aspeed SoC
   https://github.com/legoater/qemu/commit/3052f9d8ccdaf78b753e53574b7e8cc2ee01429f

   That one is trivial.


Overall comments :

I prefer the 'regs' array approach of your proposal.

I think the AspeedADCEngine should appear as a QOM object. Check
the patches above.

To move on, maybe, you could rework the initial series and take
ownership ?


Some more below,


> Signed-off-by: Peter Delevoryas <pdel@fb.com>
> ---
>   hw/adc/aspeed_adc.c         | 205 ++++++++++++++++++++++++++++++++++++
>   hw/adc/meson.build          |   1 +
>   hw/adc/trace-events         |   4 +
>   hw/arm/aspeed_ast2600.c     |  18 ++++
>   hw/arm/aspeed_soc.c         |  17 +++
>   include/hw/adc/aspeed_adc.h |  48 +++++++++
>   include/hw/arm/aspeed_soc.h |   5 +
>   7 files changed, 298 insertions(+)
>   create mode 100644 hw/adc/aspeed_adc.c
>   create mode 100644 include/hw/adc/aspeed_adc.h
> 
> diff --git a/hw/adc/aspeed_adc.c b/hw/adc/aspeed_adc.c
> new file mode 100644
> index 0000000000..590936148b
> --- /dev/null
> +++ b/hw/adc/aspeed_adc.c
> @@ -0,0 +1,205 @@
> +/*
> + * Aspeed ADC Controller
> + *
> + * Copyright 2021 Facebook, Inc.
> + *
> + * This program is free software; you can redistribute it and/or modify it
> + * under the terms of the GNU General Public License as published by the
> + * Free Software Foundation; either version 2 of the License, or
> + * (at your option) any later version.
> + *
> + * This program is distributed in the hope that it will be useful, but WITHOUT
> + * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
> + * FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License
> + * for more details.
> + */
> +
> +#include "qemu/osdep.h"
> +#include "hw/adc/aspeed_adc.h"
> +#include "hw/qdev-properties.h"
> +#include "migration/vmstate.h"
> +#include "trace.h"
> +#include "qemu/log.h"
> +
> +#define TO_REG(offset) ((offset) >> 2)
> +#define ENGINE_CONTROL TO_REG(0x00)
> +
> +static uint64_t aspeed_adc_read(void *opaque, hwaddr offset, unsigned size)
> +{
> +    AspeedADCState *s = ASPEED_ADC(opaque);
> +    int reg = TO_REG(offset);
> +
> +    if (reg >= ASPEED_ADC_MAX_REGS) {
> +        qemu_log_mask(LOG_GUEST_ERROR,
> +                      "%s: Out-of-bounds read 0x%04" HWADDR_PRIX "\n",
> +                      __func__, offset);
> +        return 0;
> +    }
> +
> +    int value = s->regs[reg];
> +
> +    trace_aspeed_adc_read(offset, value);
> +    return value;
> +}
> +
> +static void aspeed_adc_write(void *opaque, hwaddr offset, uint64_t data,
> +                             unsigned size)
> +{
> +    AspeedADCState *s = ASPEED_ADC(opaque);
> +    int reg = TO_REG(offset);
> +
> +    if (reg >= ASPEED_ADC_MAX_REGS) {
> +        qemu_log_mask(LOG_GUEST_ERROR,
> +                      "%s: Out-of-bounds write 0x%04" HWADDR_PRIX "\n",
> +                      __func__, offset);
> +        return;
> +    }
> +
> +    trace_aspeed_adc_write(offset, data);
> +
> +    switch (reg) {
> +    case ENGINE_CONTROL:
> +        switch (data) {
> +        case 0xF:
> +            s->regs[ENGINE_CONTROL] = 0x10F;
> +            return;
> +        case 0x2F:
> +            s->regs[ENGINE_CONTROL] = 0xF;
> +            return;
> +        }
> +        break;
> +    }
> +
> +    s->regs[reg] = data;
> +}
> +
> +static const MemoryRegionOps aspeed_adc_ops = {
> +    .read = aspeed_adc_read,
> +    .write = aspeed_adc_write,
> +    .endianness = DEVICE_LITTLE_ENDIAN,
> +    .valid.min_access_size = 4,
> +    .valid.max_access_size = 4,
> +    .valid.unaligned = false,

That's THE question that has been blocking the patches from being
merged since 2017.

> +};
> +
> +static void aspeed_adc_realize(DeviceState *dev, Error **errp)
> +{
> +    SysBusDevice *sbd = SYS_BUS_DEVICE(dev);
> +    AspeedADCState *s = ASPEED_ADC(dev);
> +
> +    sysbus_init_irq(sbd, &s->irq);
> +    // The memory region is actually 4KB (0x1000), but there's 2 ADC's in the
> +    // AST2600 that are offset by 0x100.

No C++ comments. Please run ./scripts/checkpatch.pl.


> +    memory_region_init_io(&s->mmio, OBJECT(s), &aspeed_adc_ops, s,
> +                          TYPE_ASPEED_ADC, 0x100);
> +    sysbus_init_mmio(sbd, &s->mmio);
> +}
> +
> +static void aspeed_adc_reset(DeviceState *dev)
> +{
> +    AspeedADCState *s = ASPEED_ADC(dev);
> +    AspeedADCClass *aac = ASPEED_ADC_GET_CLASS(dev);
> +
> +    memcpy(s->regs, aac->resets, aac->nr_regs << 2);
> +}
> +
> +static const uint32_t aspeed_2400_resets[ASPEED_2400_ADC_NR_REGS] = {
> +    [ENGINE_CONTROL] = 0x00000000,
> +};
> +
> +static const uint32_t aspeed_2500_resets[ASPEED_2500_ADC_NR_REGS] = {
> +    [ENGINE_CONTROL] = 0x00000000,
> +};
> +
> +static const uint32_t aspeed_2600_resets[ASPEED_2600_ADC_NR_REGS] = {
> +    [ENGINE_CONTROL] = 0x00000000,
> +};
> +
> +static const VMStateDescription aspeed_adc_vmstate = {
> +    .name = TYPE_ASPEED_ADC,
> +    .version_id = 0,
> +    .minimum_version_id = 0,
> +    .fields = (VMStateField[]) {
> +        VMSTATE_UINT32_ARRAY(regs, AspeedADCState, ASPEED_ADC_MAX_REGS),
> +        VMSTATE_END_OF_LIST()
> +    }
> +};
> +
> +static void aspeed_adc_class_init(ObjectClass *klass, void *data)
> +{
> +    DeviceClass *dc = DEVICE_CLASS(klass);
> +    dc->realize = aspeed_adc_realize;
> +    dc->reset = aspeed_adc_reset;
> +    dc->desc = "Aspeed Analog-to-Digital Converter";
> +    dc->vmsd = &aspeed_adc_vmstate;
> +}
> +
> +static void aspeed_2400_adc_class_init(ObjectClass *klass, void *data)
> +{
> +    DeviceClass *dc = DEVICE_CLASS(klass);
> +    AspeedADCClass *aac = ASPEED_ADC_CLASS(klass);
> +
> +    dc->desc = "Aspeed 2400 Analog-to-Digital Converter";
> +    aac->resets = aspeed_2400_resets;
> +    aac->nr_regs = ASPEED_2400_ADC_NR_REGS;
> +}
> +
> +static void aspeed_2500_adc_class_init(ObjectClass *klass, void *data)
> +{
> +    DeviceClass *dc = DEVICE_CLASS(klass);
> +    AspeedADCClass *aac = ASPEED_ADC_CLASS(klass);
> +
> +    dc->desc = "Aspeed 2500 Analog-to-Digital Converter";
> +    aac->resets = aspeed_2500_resets;
> +    aac->nr_regs = ASPEED_2500_ADC_NR_REGS;
> +}
> +
> +static void aspeed_2600_adc_class_init(ObjectClass *klass, void *data)
> +{
> +    DeviceClass *dc = DEVICE_CLASS(klass);
> +    AspeedADCClass *aac = ASPEED_ADC_CLASS(klass);
> +
> +    dc->desc = "Aspeed 2600 Analog-to-Digital Converter";
> +    aac->resets = aspeed_2600_resets;
> +    aac->nr_regs = ASPEED_2600_ADC_NR_REGS;
> +}
> +
> +static const TypeInfo aspeed_adc_info = {
> +    .name = TYPE_ASPEED_ADC,
> +    .parent = TYPE_SYS_BUS_DEVICE,
> +    .instance_size = sizeof(AspeedADCState),
> +    .class_init = aspeed_adc_class_init,
> +    .class_size = sizeof(AspeedADCClass),
> +    .abstract = true,
> +};
> +
> +static const TypeInfo aspeed_2400_adc_info = {
> +    .name = TYPE_ASPEED_2400_ADC,
> +    .parent = TYPE_ASPEED_ADC,
> +    .instance_size = sizeof(AspeedADCState),
> +    .class_init = aspeed_2400_adc_class_init,
> +};
> +
> +static const TypeInfo aspeed_2500_adc_info = {
> +    .name = TYPE_ASPEED_2500_ADC,
> +    .parent = TYPE_ASPEED_ADC,
> +    .instance_size = sizeof(AspeedADCState),
> +    .class_init = aspeed_2500_adc_class_init,
> +};
> +
> +static const TypeInfo aspeed_2600_adc_info = {
> +    .name = TYPE_ASPEED_2600_ADC,
> +    .parent = TYPE_ASPEED_ADC,
> +    .instance_size = sizeof(AspeedADCState),
> +    .class_init = aspeed_2600_adc_class_init,
> +};
> +
> +static void aspeed_adc_register_types(void)
> +{
> +    type_register_static(&aspeed_adc_info);
> +    type_register_static(&aspeed_2400_adc_info);
> +    type_register_static(&aspeed_2500_adc_info);
> +    type_register_static(&aspeed_2600_adc_info);
> +}
> +
> +type_init(aspeed_adc_register_types);
> diff --git a/hw/adc/meson.build b/hw/adc/meson.build
> index ac4f093fea..65e1dd73c1 100644
> --- a/hw/adc/meson.build
> +++ b/hw/adc/meson.build
> @@ -2,3 +2,4 @@ softmmu_ss.add(when: 'CONFIG_STM32F2XX_ADC', if_true: files('stm32f2xx_adc.c'))
>   softmmu_ss.add(when: 'CONFIG_NPCM7XX', if_true: files('npcm7xx_adc.c'))
>   softmmu_ss.add(when: 'CONFIG_ZYNQ', if_true: files('zynq-xadc.c'))
>   softmmu_ss.add(when: 'CONFIG_MAX111X', if_true: files('max111x.c'))
> +softmmu_ss.add(when: 'CONFIG_ASPEED_SOC', if_true: files('aspeed_adc.c'))
> diff --git a/hw/adc/trace-events b/hw/adc/trace-events
> index 456f21c8f4..c23d7bb6d7 100644
> --- a/hw/adc/trace-events
> +++ b/hw/adc/trace-events
> @@ -3,3 +3,7 @@
>   # npcm7xx_adc.c
>   npcm7xx_adc_read(const char *id, uint64_t offset, uint32_t value) " %s offset: 0x%04" PRIx64 " value 0x%04" PRIx32
>   npcm7xx_adc_write(const char *id, uint64_t offset, uint32_t value) "%s offset: 0x%04" PRIx64 " value 0x%04" PRIx32
> +
> +# aspeed_adc.c
> +aspeed_adc_read(uint8_t offset, uint32_t value)  "0x%02" PRIx8 " read 0x%04" PRIx32
> +aspeed_adc_write(uint8_t offset, uint32_t value) "0x%02" PRIx8 " write 0x%04" PRIx32
> diff --git a/hw/arm/aspeed_ast2600.c b/hw/arm/aspeed_ast2600.c
> index 9d70e8e060..a582e882f2 100644
> --- a/hw/arm/aspeed_ast2600.c
> +++ b/hw/arm/aspeed_ast2600.c
> @@ -44,6 +44,7 @@ static const hwaddr aspeed_soc_ast2600_memmap[] = {
>       [ASPEED_DEV_SCU]       = 0x1E6E2000,
>       [ASPEED_DEV_XDMA]      = 0x1E6E7000,
>       [ASPEED_DEV_ADC]       = 0x1E6E9000,
> +    [ASPEED_DEV_ADC2]      = 0x1E6E9100,

Look at the AspeedADCEngine approach introduced in the initial
series. It simplifies the integration in the machine.

Thanks,

C.

>       [ASPEED_DEV_VIDEO]     = 0x1E700000,
>       [ASPEED_DEV_SDHCI]     = 0x1E740000,
>       [ASPEED_DEV_EMMC]      = 0x1E750000,
> @@ -77,6 +78,7 @@ static const int aspeed_soc_ast2600_irqmap[] = {
>       [ASPEED_DEV_SDMC]      = 0,
>       [ASPEED_DEV_SCU]       = 12,
>       [ASPEED_DEV_ADC]       = 78,
> +    [ASPEED_DEV_ADC2]      = 78,
>       [ASPEED_DEV_XDMA]      = 6,
>       [ASPEED_DEV_SDHCI]     = 43,
>       [ASPEED_DEV_EHCI1]     = 5,
> @@ -216,6 +218,11 @@ static void aspeed_soc_ast2600_init(Object *obj)
>   
>       snprintf(typename, sizeof(typename), "aspeed.hace-%s", socname);
>       object_initialize_child(obj, "hace", &s->hace, typename);
> +
> +    snprintf(typename, sizeof(typename), "aspeed.adc-%s", socname);
> +    for (i = 0; i < sc->adcs_num; i++) {
> +        object_initialize_child(obj, "adc[*]", &s->adc[i], typename);
> +    }
>   }
>   
>   /*
> @@ -507,6 +514,16 @@ static void aspeed_soc_ast2600_realize(DeviceState *dev, Error **errp)
>       sysbus_mmio_map(SYS_BUS_DEVICE(&s->hace), 0, sc->memmap[ASPEED_DEV_HACE]);
>       sysbus_connect_irq(SYS_BUS_DEVICE(&s->hace), 0,
>                          aspeed_soc_get_irq(s, ASPEED_DEV_HACE));
> +
> +    /* ADC */
> +    for (int i = 0; i < sc->adcs_num; i++) {
> +        SysBusDevice *bus = SYS_BUS_DEVICE(&s->adc[i]);
> +        if (!sysbus_realize(bus, errp)) {
> +            return;
> +        }
> +        sysbus_mmio_map(bus, 0, sc->memmap[ASPEED_DEV_ADC + i]);
> +        sysbus_connect_irq(bus, 0, aspeed_soc_get_irq(s, ASPEED_DEV_ADC + i));
> +    }
>   }
>   
>   static void aspeed_soc_ast2600_class_init(ObjectClass *oc, void *data)
> @@ -524,6 +541,7 @@ static void aspeed_soc_ast2600_class_init(ObjectClass *oc, void *data)
>       sc->ehcis_num    = 2;
>       sc->wdts_num     = 4;
>       sc->macs_num     = 4;
> +    sc->adcs_num     = 2;
>       sc->irqmap       = aspeed_soc_ast2600_irqmap;
>       sc->memmap       = aspeed_soc_ast2600_memmap;
>       sc->num_cpus     = 2;
> diff --git a/hw/arm/aspeed_soc.c b/hw/arm/aspeed_soc.c
> index ed84502e23..412c557e40 100644
> --- a/hw/arm/aspeed_soc.c
> +++ b/hw/arm/aspeed_soc.c
> @@ -216,6 +216,11 @@ static void aspeed_soc_init(Object *obj)
>   
>       snprintf(typename, sizeof(typename), "aspeed.hace-%s", socname);
>       object_initialize_child(obj, "hace", &s->hace, typename);
> +
> +    snprintf(typename, sizeof(typename), "aspeed.adc-%s", socname);
> +    for (i = 0; i < sc->adcs_num; i++) {
> +        object_initialize_child(obj, "adc[*]", &s->adc[i], typename);
> +    }
>   }
>   
>   static void aspeed_soc_realize(DeviceState *dev, Error **errp)
> @@ -435,6 +440,16 @@ static void aspeed_soc_realize(DeviceState *dev, Error **errp)
>       sysbus_mmio_map(SYS_BUS_DEVICE(&s->hace), 0, sc->memmap[ASPEED_DEV_HACE]);
>       sysbus_connect_irq(SYS_BUS_DEVICE(&s->hace), 0,
>                          aspeed_soc_get_irq(s, ASPEED_DEV_HACE));
> +
> +    /* ADC */
> +    for (int i = 0; i < sc->adcs_num; i++) {
> +        SysBusDevice *bus = SYS_BUS_DEVICE(&s->adc[i]);
> +        if (!sysbus_realize(bus, errp)) {
> +            return;
> +        }
> +        sysbus_mmio_map(bus, 0, sc->memmap[ASPEED_DEV_ADC + i]);
> +        sysbus_connect_irq(bus, 0, aspeed_soc_get_irq(s, ASPEED_DEV_ADC + i));
> +    }
>   }
>   static Property aspeed_soc_properties[] = {
>       DEFINE_PROP_LINK("dram", AspeedSoCState, dram_mr, TYPE_MEMORY_REGION,
> @@ -475,6 +490,7 @@ static void aspeed_soc_ast2400_class_init(ObjectClass *oc, void *data)
>       sc->ehcis_num    = 1;
>       sc->wdts_num     = 2;
>       sc->macs_num     = 2;
> +    sc->adcs_num     = 1;
>       sc->irqmap       = aspeed_soc_ast2400_irqmap;
>       sc->memmap       = aspeed_soc_ast2400_memmap;
>       sc->num_cpus     = 1;
> @@ -500,6 +516,7 @@ static void aspeed_soc_ast2500_class_init(ObjectClass *oc, void *data)
>       sc->ehcis_num    = 2;
>       sc->wdts_num     = 3;
>       sc->macs_num     = 2;
> +    sc->adcs_num     = 1;
>       sc->irqmap       = aspeed_soc_ast2500_irqmap;
>       sc->memmap       = aspeed_soc_ast2500_memmap;
>       sc->num_cpus     = 1;
> diff --git a/include/hw/adc/aspeed_adc.h b/include/hw/adc/aspeed_adc.h
> new file mode 100644
> index 0000000000..5528781be0
> --- /dev/null
> +++ b/include/hw/adc/aspeed_adc.h
> @@ -0,0 +1,48 @@
> +/*
> + * Aspeed ADC Controller
> + *
> + * Copyright 2021 Facebook, Inc.
> + *
> + * This program is free software; you can redistribute it and/or modify it
> + * under the terms of the GNU General Public License as published by the
> + * Free Software Foundation; either version 2 of the License, or
> + * (at your option) any later version.
> + *
> + * This program is distributed in the hope that it will be useful, but WITHOUT
> + * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
> + * FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License
> + * for more details.
> + */
> +
> +#ifndef ASPEED_ADC_H
> +#define ASPEED_ADC_H
> +
> +#include "qemu/osdep.h"
> +#include "hw/sysbus.h"
> +#include "qom/object.h"
> +
> +#define TYPE_ASPEED_ADC "aspeed.adc"
> +OBJECT_DECLARE_TYPE(AspeedADCState, AspeedADCClass, ASPEED_ADC)
> +#define TYPE_ASPEED_2400_ADC TYPE_ASPEED_ADC "-ast2400"
> +#define TYPE_ASPEED_2500_ADC TYPE_ASPEED_ADC "-ast2500"
> +#define TYPE_ASPEED_2600_ADC TYPE_ASPEED_ADC "-ast2600"
> +
> +#define ASPEED_2400_ADC_NR_REGS (0xC4 >> 2)
> +#define ASPEED_2500_ADC_NR_REGS (0xC8 >> 2)
> +#define ASPEED_2600_ADC_NR_REGS (0xD0 >> 2)
> +#define ASPEED_ADC_MAX_REGS ASPEED_2600_ADC_NR_REGS
> +
> +struct AspeedADCState {
> +    SysBusDevice parent;
> +    MemoryRegion mmio;
> +    qemu_irq irq;
> +    uint32_t regs[ASPEED_ADC_MAX_REGS];
> +};
> +
> +struct AspeedADCClass {
> +    SysBusDeviceClass parent;
> +    const uint32_t *resets;
> +    uint32_t nr_regs;
> +};
> +
> +#endif
> diff --git a/include/hw/arm/aspeed_soc.h b/include/hw/arm/aspeed_soc.h
> index 87d76c9259..4503f08870 100644
> --- a/include/hw/arm/aspeed_soc.h
> +++ b/include/hw/arm/aspeed_soc.h
> @@ -30,12 +30,14 @@
>   #include "hw/usb/hcd-ehci.h"
>   #include "qom/object.h"
>   #include "hw/misc/aspeed_lpc.h"
> +#include "hw/adc/aspeed_adc.h"
>   
>   #define ASPEED_SPIS_NUM  2
>   #define ASPEED_EHCIS_NUM 2
>   #define ASPEED_WDTS_NUM  4
>   #define ASPEED_CPUS_NUM  2
>   #define ASPEED_MACS_NUM  4
> +#define ASPEED_ADCS_NUM  2
>   
>   struct AspeedSoCState {
>       /*< private >*/
> @@ -65,6 +67,7 @@ struct AspeedSoCState {
>       AspeedSDHCIState sdhci;
>       AspeedSDHCIState emmc;
>       AspeedLPCState lpc;
> +    AspeedADCState adc[ASPEED_ADCS_NUM];
>       uint32_t uart_default;
>   };
>   
> @@ -82,6 +85,7 @@ struct AspeedSoCClass {
>       int ehcis_num;
>       int wdts_num;
>       int macs_num;
> +    int adcs_num;
>       const int *irqmap;
>       const hwaddr *memmap;
>       uint32_t num_cpus;
> @@ -105,6 +109,7 @@ enum {
>       ASPEED_DEV_SDMC,
>       ASPEED_DEV_SCU,
>       ASPEED_DEV_ADC,
> +    ASPEED_DEV_ADC2,
>       ASPEED_DEV_VIDEO,
>       ASPEED_DEV_SRAM,
>       ASPEED_DEV_SDHCI,
> 


