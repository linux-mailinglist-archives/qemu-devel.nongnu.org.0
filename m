Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 58C3D42031E
	for <lists+qemu-devel@lfdr.de>; Sun,  3 Oct 2021 19:37:05 +0200 (CEST)
Received: from localhost ([::1]:46478 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mX5Q8-0004Z0-4L
	for lists+qemu-devel@lfdr.de; Sun, 03 Oct 2021 13:37:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52860)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mX5Nw-0002t2-ON
 for qemu-devel@nongnu.org; Sun, 03 Oct 2021 13:34:48 -0400
Received: from 9.mo548.mail-out.ovh.net ([46.105.48.137]:41737)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mX5Nu-0006Ek-05
 for qemu-devel@nongnu.org; Sun, 03 Oct 2021 13:34:48 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.146.59])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id 0E9E421505;
 Sun,  3 Oct 2021 17:34:42 +0000 (UTC)
Received: from kaod.org (37.59.142.95) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Sun, 3 Oct
 2021 19:34:41 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-95G001931d4607-e8cd-498a-90a7-492ad3f20121,
 56C86F9822E7E9F8B10CEC01D5C891B794C43A82) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <8bc00971-eb7e-9291-f143-e22f0d95caeb@kaod.org>
Date: Sun, 3 Oct 2021 19:34:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH 1/2] hw/adc: Add basic Aspeed ADC model
Content-Language: en-US
To: Peter Delevoryas <pdel@fb.com>
References: <20211002214414.2858382-1-pdel@fbc.om>
 <20211002214414.2858382-2-pdel@fbc.om>
 <168e5568-4cd3-5c4b-35b9-6ba5ced92ece@kaod.org>
 <2670BB23-A44C-42DD-82E9-80C271AC49D6@fb.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <2670BB23-A44C-42DD-82E9-80C271AC49D6@fb.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.95]
X-ClientProxiedBy: DAG6EX1.mxp5.local (172.16.2.51) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 855a9bac-1040-4664-a082-898ae19b93b0
X-Ovh-Tracer-Id: 16839240484673129263
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvtddrudeltddguddufecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfhfhfgjtgfgihesthejredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpefhhfelgeeukedtteffvdffueeiuefgkeekleehleetfedtgfetffefheeugeelheenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopeiihhgurghnihgvlhesfhgsrdgtohhm
Received-SPF: pass client-ip=46.105.48.137; envelope-from=clg@kaod.org;
 helo=9.mo548.mail-out.ovh.net
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9, CTE_8BIT_MISMATCH=0.452,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
 Alistair Francis <alistair@alistair23.me>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "patrick@stwcx.xyz" <patrick@stwcx.xyz>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, Joel Stanley <joel@jms.id.au>,
 Dan Zhang <zhdaniel@fb.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


>>> +static void aspeed_adc_instance_init(Object *obj)
>>> +{
>>> +    AspeedADCState *s = ASPEED_ADC(obj);
>>> +    AspeedADCClass *aac = ASPEED_ADC_GET_CLASS(obj);
>>> +    uint32_t nr_channels = ASPEED_ADC_NR_CHANNELS / aac->nr_engines;
>>> +
>>> +    for (int i = 0; i < aac->nr_engines; i++) {
>>> +        AspeedADCEngineState *engine = &s->engines[i];
>>> +        object_initialize_child(obj, "engine[*]", engine,
>>> +                                TYPE_ASPEED_ADC_ENGINE);
>>> +        qdev_prop_set_uint32(DEVICE(engine), "engine-id", i);
>>
>> Why have you moved the property initialization in the instance_init routine ?
> 
> I think for some reason I thought this was necessary, or maybe I thought it
> was more appropriate? I think I was looking at aspeed_soc.c and saw
> most of the child initialization in the init() functions, not realize(), but

The only one is "silicon-rev" which is a constant for the SoC. That's why
we set it from the instance_init routine and I think we need it to initialize
other models also.

> I’ll just put both properties back in realize(), I don’t think there was any
> functional reason.

No. It makes sense. "engine-id" is an internal id which has no reason to
change after init. "nr-channels" is constant and could be derived from
AspeedADCClass. Idealy, we would compute "nr-channels" in AspeedADCEngineState
but this would require another property on the owning AspeedADCState object.

Let's it keep it. Unless someone has a better idea.

One extra remark below.

>>> +        qdev_prop_set_uint32(DEVICE(engine), "nr-channels", nr_channels);
>>> +    }
>>> +}
>>> +
>>> +static void aspeed_adc_set_irq(void *opaque, int n, int level)
>>> +{
>>> +    AspeedADCState *s = opaque;
>>> +    AspeedADCClass *aac = ASPEED_ADC_GET_CLASS(s);
>>> +    uint32_t pending = 0;
>>> +
>>> +    /* TODO: update Global IRQ status register on AST2600 (Need specs) */
>>> +    for (int i = 0; i < aac->nr_engines; i++) {
>>> +        uint32_t irq_status = s->engines[i].regs[INTERRUPT_CONTROL] & 0xFF;
>>> +        pending |= irq_status << (i * 8);
>>> +    }
>>> +
>>> +    qemu_set_irq(s->irq, !!pending);
>>> +}
>>> +
>>> +static void aspeed_adc_realize(DeviceState *dev, Error **errp)
>>> +{
>>> +    AspeedADCState *s = ASPEED_ADC(dev);
>>> +    SysBusDevice *sbd = SYS_BUS_DEVICE(dev);
>>> +    AspeedADCClass *aac = ASPEED_ADC_GET_CLASS(dev);
>>> +
>>> +    qdev_init_gpio_in_named_with_opaque(DEVICE(sbd), aspeed_adc_set_irq,
>>> +                                        s, NULL, aac->nr_engines);
>>> +
>>> +    sysbus_init_irq(sbd, &s->irq);
>>> +
>>> +    memory_region_init(&s->mmio, OBJECT(s), TYPE_ASPEED_ADC, 0x1000);
>>> +
>>> +    sysbus_init_mmio(sbd, &s->mmio);
>>> +
>>> +    for (int i = 0; i < aac->nr_engines; i++) {
>>> +        Object *eng = OBJECT(&s->engines[i]);
>>> +
>>> +        if (!sysbus_realize(SYS_BUS_DEVICE(eng), errp)) {
>>> +            return;
>>> +        }
>>> +        sysbus_connect_irq(SYS_BUS_DEVICE(eng), 0,
>>> +                           qdev_get_gpio_in(DEVICE(sbd), i));
>>> +        memory_region_add_subregion(&s->mmio, i * 0x100, &s->engines[i].mmio);

Since we use 0x100 twice (my fault). May be add a define for it ?

Thanks,

C.

>>> +    }
>>> +}
>>> +
>>> +static void aspeed_adc_class_init(ObjectClass *klass, void *data)
>>> +{
>>> +    DeviceClass *dc = DEVICE_CLASS(klass);
>>> +    AspeedADCClass *aac = ASPEED_ADC_CLASS(klass);
>>> +
>>> +    dc->realize = aspeed_adc_realize;
>>> +    dc->desc = "Aspeed Analog-to-Digital Converter";
>>> +    aac->nr_engines = 1;
>>> +}
>>> +
>>> +static void aspeed_2600_adc_class_init(ObjectClass *klass, void *data)
>>> +{
>>> +    DeviceClass *dc = DEVICE_CLASS(klass);
>>> +    AspeedADCClass *aac = ASPEED_ADC_CLASS(klass);
>>> +
>>> +    dc->desc = "ASPEED 2600 ADC Controller";
>>> +    aac->nr_engines = 2;
>>> +}
>>> +
>>> +static const TypeInfo aspeed_adc_info = {
>>> +    .name = TYPE_ASPEED_ADC,
>>> +    .parent = TYPE_SYS_BUS_DEVICE,
>>> +    .instance_init = aspeed_adc_instance_init,
>>> +    .instance_size = sizeof(AspeedADCState),
>>> +    .class_init = aspeed_adc_class_init,
>>> +    .class_size = sizeof(AspeedADCClass),
>>> +    .abstract   = true,
>>> +};
>>> +
>>> +static const TypeInfo aspeed_2400_adc_info = {
>>> +    .name = TYPE_ASPEED_2400_ADC,
>>> +    .parent = TYPE_ASPEED_ADC,
>>> +};
>>> +
>>> +static const TypeInfo aspeed_2500_adc_info = {
>>> +    .name = TYPE_ASPEED_2500_ADC,
>>> +    .parent = TYPE_ASPEED_ADC,
>>> +};
>>> +
>>> +static const TypeInfo aspeed_2600_adc_info = {
>>> +    .name = TYPE_ASPEED_2600_ADC,
>>> +    .parent = TYPE_ASPEED_ADC,
>>> +    .class_init = aspeed_2600_adc_class_init,
>>> +};
>>> +
>>> +static void aspeed_adc_register_types(void)
>>> +{
>>> +    type_register_static(&aspeed_adc_engine_info);
>>> +    type_register_static(&aspeed_adc_info);
>>> +    type_register_static(&aspeed_2400_adc_info);
>>> +    type_register_static(&aspeed_2500_adc_info);
>>> +    type_register_static(&aspeed_2600_adc_info);
>>> +}
>>> +
>>> +type_init(aspeed_adc_register_types);
>>> diff --git a/hw/adc/meson.build b/hw/adc/meson.build
>>> index ac4f093fea..b29ac7ccdf 100644
>>> --- a/hw/adc/meson.build
>>> +++ b/hw/adc/meson.build
>>> @@ -1,4 +1,5 @@
>>>   softmmu_ss.add(when: 'CONFIG_STM32F2XX_ADC', if_true: files('stm32f2xx_adc.c'))
>>> +softmmu_ss.add(when: 'CONFIG_ASPEED_SOC', if_true: files('aspeed_adc.c'))
>>>   softmmu_ss.add(when: 'CONFIG_NPCM7XX', if_true: files('npcm7xx_adc.c'))
>>>   softmmu_ss.add(when: 'CONFIG_ZYNQ', if_true: files('zynq-xadc.c'))
>>>   softmmu_ss.add(when: 'CONFIG_MAX111X', if_true: files('max111x.c'))
>>> diff --git a/hw/adc/trace-events b/hw/adc/trace-events
>>> index 456f21c8f4..5a4c444d77 100644
>>> --- a/hw/adc/trace-events
>>> +++ b/hw/adc/trace-events
>>> @@ -3,3 +3,6 @@
>>>   # npcm7xx_adc.c
>>>   npcm7xx_adc_read(const char *id, uint64_t offset, uint32_t value) " %s offset: 0x%04" PRIx64 " value 0x%04" PRIx32
>>>   npcm7xx_adc_write(const char *id, uint64_t offset, uint32_t value) "%s offset: 0x%04" PRIx64 " value 0x%04" PRIx32
>>> +
>>> +aspeed_adc_engine_read(uint32_t engine_id, uint64_t addr, uint64_t value) "engine[%u] 0x%" PRIx64 " 0x%" PRIx64
>>> +aspeed_adc_engine_write(uint32_t engine_id, uint64_t addr, uint64_t value) "engine[%u] 0x%" PRIx64 " 0x%" PRIx64
>>> diff --git a/include/hw/adc/aspeed_adc.h b/include/hw/adc/aspeed_adc.h
>>> new file mode 100644
>>> index 0000000000..2f166e8be1
>>> --- /dev/null
>>> +++ b/include/hw/adc/aspeed_adc.h
>>> @@ -0,0 +1,55 @@
>>> +/*
>>> + * Aspeed ADC
>>> + *
>>> + * Copyright 2017-2021 IBM Corp.
>>> + *
>>> + * Andrew Jeffery <andrew@aj.id.au>
>>> + *
>>> + * SPDX-License-Identifier: GPL-2.0-or-later
>>> + */
>>> +
>>> +#ifndef HW_ADC_ASPEED_ADC_H
>>> +#define HW_ADC_ASPEED_ADC_H
>>> +
>>> +#include "hw/sysbus.h"
>>> +
>>> +#define TYPE_ASPEED_ADC "aspeed.adc"
>>> +#define TYPE_ASPEED_2400_ADC TYPE_ASPEED_ADC "-ast2400"
>>> +#define TYPE_ASPEED_2500_ADC TYPE_ASPEED_ADC "-ast2500"
>>> +#define TYPE_ASPEED_2600_ADC TYPE_ASPEED_ADC "-ast2600"
>>> +OBJECT_DECLARE_TYPE(AspeedADCState, AspeedADCClass, ASPEED_ADC)
>>> +
>>> +#define TYPE_ASPEED_ADC_ENGINE "aspeed.adc.engine"
>>> +OBJECT_DECLARE_SIMPLE_TYPE(AspeedADCEngineState, ASPEED_ADC_ENGINE)
>>> +
>>> +#define ASPEED_ADC_NR_CHANNELS 16
>>> +#define ASPEED_ADC_NR_REGS     (0xD0 >> 2)
>>> +
>>> +struct AspeedADCEngineState {
>>> +    /* <private> */
>>> +    SysBusDevice parent;
>>> +
>>> +    MemoryRegion mmio;
>>> +    qemu_irq irq;
>>> +    uint32_t engine_id;
>>> +    uint32_t nr_channels;
>>> +    uint32_t regs[ASPEED_ADC_NR_REGS];
>>> +};
>>> +
>>> +struct AspeedADCState {
>>> +    /* <private> */
>>> +    SysBusDevice parent;
>>> +
>>> +    MemoryRegion mmio;
>>> +    qemu_irq irq;
>>> +
>>> +    AspeedADCEngineState engines[2];
>>> +};
>>> +
>>> +struct AspeedADCClass {
>>> +    SysBusDeviceClass parent_class;
>>> +
>>> +    uint32_t nr_engines;
>>> +};
>>> +
>>> +#endif /* HW_ADC_ASPEED_ADC_H */
>>
> 


