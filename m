Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DDAD58CB59
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Aug 2022 17:37:38 +0200 (CEST)
Received: from localhost ([::1]:39734 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oL4oy-0002Rw-Jz
	for lists+qemu-devel@lfdr.de; Mon, 08 Aug 2022 11:37:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34852)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1oL4n1-0000Lr-PF
 for qemu-devel@nongnu.org; Mon, 08 Aug 2022 11:35:40 -0400
Received: from 1.mo552.mail-out.ovh.net ([178.32.96.117]:60203)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1oL4mq-0003yA-Su
 for qemu-devel@nongnu.org; Mon, 08 Aug 2022 11:35:28 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.1.111])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id 5F1B62341C;
 Mon,  8 Aug 2022 15:35:19 +0000 (UTC)
Received: from kaod.org (37.59.142.103) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.9; Mon, 8 Aug 2022
 17:35:18 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-103G0058146cdb5-e4d3-4ed5-9c45-e484fe9bf1eb,
 014009DFAA8B86078D729D00C01D9476BEEC0396) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <5036f1e1-2da9-faac-264c-4c05a8e56de8@kaod.org>
Date: Mon, 8 Aug 2022 17:35:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v3 08/22] ppc/ppc4xx: Introduce a DCR device model
Content-Language: en-US
To: BALATON Zoltan <balaton@eik.bme.hu>
CC: <qemu-ppc@nongnu.org>, Daniel Henrique Barboza <danielhb413@gmail.com>,
 <qemu-devel@nongnu.org>, Peter Maydell <peter.maydell@linaro.org>
References: <20220808102734.133084-1-clg@kaod.org>
 <20220808102734.133084-9-clg@kaod.org>
 <2220bf2e-71a9-52a-b3b-4e9cae8da1a3@eik.bme.hu>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <2220bf2e-71a9-52a-b3b-4e9cae8da1a3@eik.bme.hu>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.103]
X-ClientProxiedBy: DAG5EX2.mxp5.local (172.16.2.42) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: 5a5c67e4-4019-4680-898c-0b26e94bf8f3
X-Ovh-Tracer-Id: 3258072857478269859
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrvdefkedgledvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeekteejtdelkeejvdevffduhfetteelieefgeefffeugffhfeekheffueefledujeenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtfeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopehpvghtvghrrdhmrgihuggvlhhlsehlihhnrghrohdrohhrghdpoffvtefjohhsthepmhhoheehvd
Received-SPF: pass client-ip=178.32.96.117; envelope-from=clg@kaod.org;
 helo=1.mo552.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
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

On 8/8/22 15:29, BALATON Zoltan wrote:
> On Mon, 8 Aug 2022, Cédric Le Goater wrote:
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
>> have a MMIO regions and/or IRQs. Being a SysBusDevice makes things
> 
> Drop "a", just "MMIO regions" due to plural. Also "makes it easier to install" or "makes things easier".
> 
>> easier to install the device model in the overall SoC.
>>
>> The "cpu" link should be considered as modeling the piece of HW logic
>> connecting the device to the DCR bus.
>>
>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
>> ---
>> include/hw/ppc/ppc4xx.h | 17 +++++++++++++++
>> hw/ppc/ppc4xx_devs.c    | 46 +++++++++++++++++++++++++++++++++++++++++
>> 2 files changed, 63 insertions(+)
>>
>> diff --git a/include/hw/ppc/ppc4xx.h b/include/hw/ppc/ppc4xx.h
>> index 021376c2d260..bb373db0ba10 100644
>> --- a/include/hw/ppc/ppc4xx.h
>> +++ b/include/hw/ppc/ppc4xx.h
>> @@ -27,6 +27,7 @@
>>
>> #include "hw/ppc/ppc.h"
>> #include "exec/memory.h"
>> +#include "hw/sysbus.h"
>>
>> /* PowerPC 4xx core initialization */
>> void ppc4xx_reset(void *opaque);
>> @@ -50,4 +51,20 @@ void ppc4xx_mal_init(CPUPPCState *env, uint8_t txcnum, uint8_t rxcnum,
>>
>> #define TYPE_PPC4xx_PCI_HOST_BRIDGE "ppc4xx-pcihost"
>>
>> +/*
>> + * Generic DCR device
>> + */
>> +#define TYPE_PPC4xx_DCR_DEVICE "ppc4xx-dcr"
> 
> Should it be named ppc4xx-dcr-device for clarity? This probably won't appear anywhere where users have to type it.

ok.

> 
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
>> index f20098cf417c..e07bdba0f912 100644
>> --- a/hw/ppc/ppc4xx_devs.c
>> +++ b/hw/ppc/ppc4xx_devs.c
>> @@ -696,3 +696,49 @@ void ppc4xx_mal_init(CPUPPCState *env, uint8_t txcnum, uint8_t rxcnum,
>>                          mal, &dcr_read_mal, &dcr_write_mal);
>>     }
>> }
>> +
>> +void ppc4xx_dcr_register(Ppc4xxDcrDeviceState *dev, int dcrn,
>> +                         dcr_read_cb dcr_read, dcr_write_cb dcr_write)
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
>> +    dc->user_creatable = false;
> 
> Should this be .abstract instead? We expect this to not be used directly but only via SoC devices which is what abstract is for AFAIK.
>
> 
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
> 
> Oh, it's abstract already. So does it also need user_creatable for an abstract class then? Maybe you can drop the user_creatable.

Indeed.

Thanks,

C.
  
> Regards,
> BALATON Zoltan
> 
>> +    }
>> +};
>> +
>> +DEFINE_TYPES(ppc4xx_types)
>>


