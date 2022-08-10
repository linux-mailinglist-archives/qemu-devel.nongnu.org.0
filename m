Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 52DC058EC3A
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Aug 2022 14:44:50 +0200 (CEST)
Received: from localhost ([::1]:46114 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oLl4r-0005lT-CO
	for lists+qemu-devel@lfdr.de; Wed, 10 Aug 2022 08:44:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43864)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1oLkyc-0003yK-VJ
 for qemu-devel@nongnu.org; Wed, 10 Aug 2022 08:38:23 -0400
Received: from 7.mo548.mail-out.ovh.net ([46.105.33.25]:53091)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1oLkya-0004gZ-8p
 for qemu-devel@nongnu.org; Wed, 10 Aug 2022 08:38:22 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.20.191])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id E54D720856;
 Wed, 10 Aug 2022 12:38:07 +0000 (UTC)
Received: from kaod.org (37.59.142.97) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.9; Wed, 10 Aug
 2022 14:38:06 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-97G0021c10886f-a536-4778-ab7f-cf9985552644,
 043EABA4B22CD34FCE1B70F8CBB6C707CA017DB3) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 90.89.155.17
Message-ID: <77bc11f5-129a-a3a8-6c24-09c83da2fabd@kaod.org>
Date: Wed, 10 Aug 2022 14:38:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v4 08/24] ppc/ppc4xx: Introduce a DCR device model
Content-Language: en-US
To: BALATON Zoltan <balaton@eik.bme.hu>
CC: <qemu-ppc@nongnu.org>, Daniel Henrique Barboza <danielhb413@gmail.com>,
 <qemu-devel@nongnu.org>, Peter Maydell <peter.maydell@linaro.org>
References: <20220809153904.485018-1-clg@kaod.org>
 <20220809153904.485018-9-clg@kaod.org>
 <8dcf2a12-f799-673f-d5bf-1cecba42447a@eik.bme.hu>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <8dcf2a12-f799-673f-d5bf-1cecba42447a@eik.bme.hu>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.97]
X-ClientProxiedBy: DAG2EX1.mxp5.local (172.16.2.11) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: b7c775d2-e668-466d-aa75-3dc15e5b0ddc
X-Ovh-Tracer-Id: 12010818731253205923
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrvdegvddgheefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeekteejtdelkeejvdevffduhfetteelieefgeefffeugffhfeekheffueefledujeenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtohepphgvthgvrhdrmhgrhiguvghllheslhhinhgrrhhordhorhhgpdfovfetjfhoshhtpehmohehgeek
Received-SPF: pass client-ip=46.105.33.25; envelope-from=clg@kaod.org;
 helo=7.mo548.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On 8/9/22 19:21, BALATON Zoltan wrote:
> On Tue, 9 Aug 2022, Cédric Le Goater wrote:
>> The Device Control Registers (DCR) of on-SoC devices are accessed by
>> software through the use of the mtdcr and mfdcr instructions. These
>> are converted in transactions on a side band bus, the DCR bus, which
>> connects the on-SoC devices to the CPU.
>>
>> Ideally, we should model these accesses with a DCR namespace and DCR
>> memory regions but today the DCR handlers are installed in a DCR table
>> under the CPU. Instead introduce a little device model wrapper to hold
>> a CPU link and handle registration of DCR handlers.
>>
>> The DCR device inherits from SysBus because most of these devices also
>> have MMIO regions and/or IRQs. Being a SysBusDevice makes things easier
>> to install the device model in the overall SoC.
>>
>> The "cpu" link should be considered as modeling the piece of HW logic
>> connecting the device to the DCR bus.
>>
>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
>> ---
>> include/hw/ppc/ppc4xx.h | 17 ++++++++++++++++
>> hw/ppc/ppc4xx_devs.c    | 44 +++++++++++++++++++++++++++++++++++++++++
>> 2 files changed, 61 insertions(+)
>>
>> diff --git a/include/hw/ppc/ppc4xx.h b/include/hw/ppc/ppc4xx.h
>> index 591e2421a343..82e60b0e0742 100644
>> --- a/include/hw/ppc/ppc4xx.h
>> +++ b/include/hw/ppc/ppc4xx.h
>> @@ -27,6 +27,7 @@
>>
>> #include "hw/ppc/ppc.h"
>> #include "exec/memory.h"
>> +#include "hw/sysbus.h"
>>
>> void ppc4xx_sdram_banks(MemoryRegion *ram, int nr_banks,
>>                         MemoryRegion ram_memories[],
>> @@ -44,4 +45,20 @@ void ppc4xx_mal_init(CPUPPCState *env, uint8_t txcnum, uint8_t rxcnum,
>>
>> #define TYPE_PPC4xx_PCI_HOST_BRIDGE "ppc4xx-pcihost"
>>
>> +/*
>> + * Generic DCR device
>> + */
>> +#define TYPE_PPC4xx_DCR_DEVICE "ppc4xx-dcr-device"
>> +OBJECT_DECLARE_SIMPLE_TYPE(Ppc4xxDcrDeviceState, PPC4xx_DCR_DEVICE);
>> +struct Ppc4xxDcrDeviceState {
>> +    SysBusDevice parent_obj;
>> +
>> +    PowerPCCPU *cpu;
>> +};
>> +
>> +void ppc4xx_dcr_register(Ppc4xxDcrDeviceState *dev, int dcrn,
>> +                         dcr_read_cb dcr_read, dcr_write_cb dcr_write);
>> +bool ppc4xx_dcr_realize(Ppc4xxDcrDeviceState *dev, PowerPCCPU *cpu,
>> +                        Error **errp);
>> +
>> #endif /* PPC4XX_H */
>> diff --git a/hw/ppc/ppc4xx_devs.c b/hw/ppc/ppc4xx_devs.c
>> index 069b51195160..bce7ef461346 100644
>> --- a/hw/ppc/ppc4xx_devs.c
>> +++ b/hw/ppc/ppc4xx_devs.c
>> @@ -664,3 +664,47 @@ void ppc4xx_mal_init(CPUPPCState *env, uint8_t txcnum, uint8_t rxcnum,
>>                          mal, &dcr_read_mal, &dcr_write_mal);
>>     }
>> }
>> +
>> +void ppc4xx_dcr_register(Ppc4xxDcrDeviceState *dev, int dcrn,
>> +                         dcr_read_cb dcr_read, dcr_write_cb dcr_write)
> 
> I still think this should have a separate void *opaque parameter for the callbacks and not pass dev for that as the callbacks could use anything they wish for that parameter. (Additionally this allows dropping a lot of QOM casts. If you want to see how often these are accessed, you can try -trace enable="ppc_dcr*"; on the machines and OS I've tested some are read/written frequently so I'd not add unnecessary overhead without a good reason.)

This machine has been abandoned for 15 years and broken for maybe 10.
I think it is fine for now. We will see if further needs arise.

Thanks,

C.

> 
> Otherwise:
> 
> Reviewed-by: BALATON Zoltan <balaton@eik.bme.hu>
> 
> Regards,
> BALATOn Zoltan
> 
>> +{
>> +    CPUPPCState *env;
>> +
>> +    assert(dev->cpu);
>> +
>> +    env = &dev->cpu->env;
>> +
>> +    ppc_dcr_register(env, dcrn, dev, dcr_read, dcr_write);
>> +}
>> +
>> +bool ppc4xx_dcr_realize(Ppc4xxDcrDeviceState *dev, PowerPCCPU *cpu,
>> +                        Error **errp)
>> +{
>> +    object_property_set_link(OBJECT(dev), "cpu", OBJECT(cpu), &error_abort);
>> +    return sysbus_realize(SYS_BUS_DEVICE(dev), errp);
>> +}
>> +
>> +static Property ppc4xx_dcr_properties[] = {
>> +    DEFINE_PROP_LINK("cpu", Ppc4xxDcrDeviceState, cpu, TYPE_POWERPC_CPU,
>> +                     PowerPCCPU *),
>> +    DEFINE_PROP_END_OF_LIST(),
>> +};
>> +
>> +static void ppc4xx_dcr_class_init(ObjectClass *oc, void *data)
>> +{
>> +    DeviceClass *dc = DEVICE_CLASS(oc);
>> +
>> +    device_class_set_props(dc, ppc4xx_dcr_properties);
>> +}
>> +
>> +static const TypeInfo ppc4xx_types[] = {
>> +    {
>> +        .name           = TYPE_PPC4xx_DCR_DEVICE,
>> +        .parent         = TYPE_SYS_BUS_DEVICE,
>> +        .instance_size  = sizeof(Ppc4xxDcrDeviceState),
>> +        .class_init     = ppc4xx_dcr_class_init,
>> +        .abstract       = true,
>> +    }
>> +};
>> +
>> +DEFINE_TYPES(ppc4xx_types)
>>


