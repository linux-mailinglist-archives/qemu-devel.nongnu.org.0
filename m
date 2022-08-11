Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C0FE58F830
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Aug 2022 09:15:30 +0200 (CEST)
Received: from localhost ([::1]:56188 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oM2Ph-0007cG-3S
	for lists+qemu-devel@lfdr.de; Thu, 11 Aug 2022 03:15:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40714)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1oM2KM-0003Ow-C2
 for qemu-devel@nongnu.org; Thu, 11 Aug 2022 03:09:58 -0400
Received: from 3.mo552.mail-out.ovh.net ([178.33.254.192]:52751)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1oM2KI-0005tA-Hc
 for qemu-devel@nongnu.org; Thu, 11 Aug 2022 03:09:57 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.143.25])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id 4DADB243AB;
 Thu, 11 Aug 2022 07:09:49 +0000 (UTC)
Received: from kaod.org (37.59.142.95) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.9; Thu, 11 Aug
 2022 09:09:48 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-95G0012127c4d5-b1b5-44c6-921c-e579629269ac,
 B18B381393FCCA734C2622819310E7EBE9D8D149) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 90.89.155.17
Message-ID: <fabc82c0-9443-73cb-9437-320fd1dc766e@kaod.org>
Date: Thu, 11 Aug 2022 09:09:47 +0200
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
 <77bc11f5-129a-a3a8-6c24-09c83da2fabd@kaod.org>
 <alpine.LMD.2.03.2208101524000.10818@eik.bme.hu>
 <7cccd86d-5bf2-e45c-b592-80ba10c06a41@kaod.org>
 <96386d50-8f2-4f63-c425-a1dc5247dcb7@eik.bme.hu>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <96386d50-8f2-4f63-c425-a1dc5247dcb7@eik.bme.hu>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.95]
X-ClientProxiedBy: DAG5EX2.mxp5.local (172.16.2.42) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: 556d1bdd-ba55-4ad4-80d0-5860dea3bb61
X-Ovh-Tracer-Id: 12338737080510942115
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrvdegfedguddulecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepkeetjedtleekjedvveffudfhteetleeifeegfeffuefghfefkeehffeufeeludejnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrdelheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopehpvghtvghrrdhmrgihuggvlhhlsehlihhnrghrohdrohhrghdpoffvtefjohhsthepmhhoheehvd
Received-SPF: pass client-ip=178.33.254.192; envelope-from=clg@kaod.org;
 helo=3.mo552.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On 8/10/22 16:48, BALATON Zoltan wrote:
> On Wed, 10 Aug 2022, Cédric Le Goater wrote:
>> On 8/10/22 15:28, BALATON Zoltan wrote:
>>> On Wed, 10 Aug 2022, Cédric Le Goater wrote:
>>>> On 8/9/22 19:21, BALATON Zoltan wrote:
>>>>> On Tue, 9 Aug 2022, Cédric Le Goater wrote:
>>>>>> The Device Control Registers (DCR) of on-SoC devices are accessed by
>>>>>> software through the use of the mtdcr and mfdcr instructions. These
>>>>>> are converted in transactions on a side band bus, the DCR bus, which
>>>>>> connects the on-SoC devices to the CPU.
>>>>>>
>>>>>> Ideally, we should model these accesses with a DCR namespace and DCR
>>>>>> memory regions but today the DCR handlers are installed in a DCR table
>>>>>> under the CPU. Instead introduce a little device model wrapper to hold
>>>>>> a CPU link and handle registration of DCR handlers.
>>>>>>
>>>>>> The DCR device inherits from SysBus because most of these devices also
>>>>>> have MMIO regions and/or IRQs. Being a SysBusDevice makes things easier
>>>>>> to install the device model in the overall SoC.
>>>>>>
>>>>>> The "cpu" link should be considered as modeling the piece of HW logic
>>>>>> connecting the device to the DCR bus.
>>>>>>
>>>>>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
>>>>>> ---
>>>>>> include/hw/ppc/ppc4xx.h | 17 ++++++++++++++++
>>>>>> hw/ppc/ppc4xx_devs.c    | 44 +++++++++++++++++++++++++++++++++++++++++
>>>>>> 2 files changed, 61 insertions(+)
>>>>>>
>>>>>> diff --git a/include/hw/ppc/ppc4xx.h b/include/hw/ppc/ppc4xx.h
>>>>>> index 591e2421a343..82e60b0e0742 100644
>>>>>> --- a/include/hw/ppc/ppc4xx.h
>>>>>> +++ b/include/hw/ppc/ppc4xx.h
>>>>>> @@ -27,6 +27,7 @@
>>>>>>
>>>>>> #include "hw/ppc/ppc.h"
>>>>>> #include "exec/memory.h"
>>>>>> +#include "hw/sysbus.h"
>>>>>>
>>>>>> void ppc4xx_sdram_banks(MemoryRegion *ram, int nr_banks,
>>>>>>                         MemoryRegion ram_memories[],
>>>>>> @@ -44,4 +45,20 @@ void ppc4xx_mal_init(CPUPPCState *env, uint8_t txcnum, uint8_t rxcnum,
>>>>>>
>>>>>> #define TYPE_PPC4xx_PCI_HOST_BRIDGE "ppc4xx-pcihost"
>>>>>>
>>>>>> +/*
>>>>>> + * Generic DCR device
>>>>>> + */
>>>>>> +#define TYPE_PPC4xx_DCR_DEVICE "ppc4xx-dcr-device"
>>>>>> +OBJECT_DECLARE_SIMPLE_TYPE(Ppc4xxDcrDeviceState, PPC4xx_DCR_DEVICE);
>>>>>> +struct Ppc4xxDcrDeviceState {
>>>>>> +    SysBusDevice parent_obj;
>>>>>> +
>>>>>> +    PowerPCCPU *cpu;
>>>>>> +};
>>>>>> +
>>>>>> +void ppc4xx_dcr_register(Ppc4xxDcrDeviceState *dev, int dcrn,
>>>>>> +                         dcr_read_cb dcr_read, dcr_write_cb dcr_write);
>>>>>> +bool ppc4xx_dcr_realize(Ppc4xxDcrDeviceState *dev, PowerPCCPU *cpu,
>>>>>> +                        Error **errp);
>>>>>> +
>>>>>> #endif /* PPC4XX_H */
>>>>>> diff --git a/hw/ppc/ppc4xx_devs.c b/hw/ppc/ppc4xx_devs.c
>>>>>> index 069b51195160..bce7ef461346 100644
>>>>>> --- a/hw/ppc/ppc4xx_devs.c
>>>>>> +++ b/hw/ppc/ppc4xx_devs.c
>>>>>> @@ -664,3 +664,47 @@ void ppc4xx_mal_init(CPUPPCState *env, uint8_t txcnum, uint8_t rxcnum,
>>>>>>                          mal, &dcr_read_mal, &dcr_write_mal);
>>>>>>     }
>>>>>> }
>>>>>> +
>>>>>> +void ppc4xx_dcr_register(Ppc4xxDcrDeviceState *dev, int dcrn,
>>>>>> +                         dcr_read_cb dcr_read, dcr_write_cb dcr_write)
>>>>>
>>>>> I still think this should have a separate void *opaque parameter for the callbacks and not pass dev for that as the callbacks could use anything they wish for that parameter. (Additionally this allows dropping a lot of QOM casts. If you want to see how often these are accessed, you can try -trace enable="ppc_dcr*"; on the machines and OS I've tested some are read/written frequently so I'd not add unnecessary overhead without a good reason.)
>>>>
>>>> This machine has been abandoned for 15 years and broken for maybe 10.
>>>> I think it is fine for now. We will see if further needs arise.
>>>
>>> It will arise as I'd like to keep at least the devices used by sam460ex somewhat sane 
>>
>> What do you mean by somewhat sane ? If it is the QOM casts, I don't
>> understand why you worry so much about it because QOM cast debugging
>> is not enabled by default. So it really should not impact performance
>> as you think it would.
> 
> I think it is enabled by default unless you explicitly disable> it which is not done by most distros so it's generally may
> impact performance (or if it's already slow for other reasons
> then it just increase inefficiency needlessly). If it's simple
> to avoid like here why not avoid it? 

It is not. you need to add '--enable-qom-cast-debug' to configure.

> Also conceptually the
> opaque parameter is a closure for the callback functions while
> dev is a self pointer for the method and you're now mixing
> these two. I think it's cleaner to keep them separate and not
> impose a restiction on the callbacks.
>
> Sorry but I have strong feeling on this one. 

Sorry but I don't think it is well justified.

> I think the simplest way to rebase and revert this is to do an
> interactive rebase editing each patch and do interactive
> revert of just the lines changing ppc4xx_dcr_register followed
> by a search replace of "ppc_dcr_register("
> with "ppc4xx_dcr_register(dcr, ". That should not be too
> difficult to do now. (It could be done afterwatds too but I'd
> appreciate and would be less chutn if you did that now.)

The simplest way for me is to come back the initial proposal, remove
the Ppc4xxDcrDeviceState model and reintroduce the explicit "cpu" link
for each device which was less controversial. Expect that in v5 and
that will be all for me.

Thanks,

C.

