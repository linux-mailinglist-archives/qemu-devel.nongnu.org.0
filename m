Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D12445953FD
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Aug 2022 09:38:20 +0200 (CEST)
Received: from localhost ([::1]:42996 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oNr8Q-0000KC-3h
	for lists+qemu-devel@lfdr.de; Tue, 16 Aug 2022 03:37:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41106)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1oNr49-0006Vv-1p
 for qemu-devel@nongnu.org; Tue, 16 Aug 2022 03:32:45 -0400
Received: from 4.mo552.mail-out.ovh.net ([178.33.43.201]:45215)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1oNr46-0004Lx-I1
 for qemu-devel@nongnu.org; Tue, 16 Aug 2022 03:32:44 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.156.102])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id 5337C23226;
 Tue, 16 Aug 2022 07:32:38 +0000 (UTC)
Received: from kaod.org (37.59.142.103) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.9; Tue, 16 Aug
 2022 09:32:37 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-103G005b1fae85e-3648-4fb9-b46b-2399ebbf26fd,
 F9C770E940B196DD2347A7F94772438AA2E7EC4E) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <c3fc221b-1860-ab43-40b1-39faf96eca73@kaod.org>
Date: Tue, 16 Aug 2022 09:32:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 01/22] ppc/ppc4xx: Introduce a DCR device model
Content-Language: en-US
To: BALATON Zoltan <balaton@eik.bme.hu>, <qemu-devel@nongnu.org>,
 <qemu-ppc@nongnu.org>
CC: Daniel Henrique Barboza <danielhb413@gmail.com>, Peter Maydell
 <peter.maydell@linaro.org>
References: <cover.1660402839.git.balaton@eik.bme.hu>
 <50e79b2c5f2c17e2b6b7920dd6526b5c091ac8bb.1660402839.git.balaton@eik.bme.hu>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <50e79b2c5f2c17e2b6b7920dd6526b5c091ac8bb.1660402839.git.balaton@eik.bme.hu>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.103]
X-ClientProxiedBy: DAG7EX1.mxp5.local (172.16.2.61) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: aad6e75e-4524-4cd0-87f4-9d5413a6024c
X-Ovh-Tracer-Id: 5194339221767097251
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrvdehfedguddvhecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepkeetjedtleekjedvveffudfhteetleeifeegfeffuefghfefkeehffeufeeludejnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutdefnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtohepphgvthgvrhdrmhgrhiguvghllheslhhinhgrrhhordhorhhgpdfovfetjfhoshhtpehmohehhedv
Received-SPF: pass client-ip=178.33.43.201; envelope-from=clg@kaod.org;
 helo=4.mo552.mail-out.ovh.net
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

On 8/13/22 17:34, BALATON Zoltan wrote:
> From: Cédric Le Goater <clg@kaod.org>
> 
> The Device Control Registers (DCR) of on-SoC devices are accessed by
> software through the use of the mtdcr and mfdcr instructions. These
> are converted in transactions on a side band bus, the DCR bus, which
> connects the on-SoC devices to the CPU.
> 
> Ideally, we should model these accesses with a DCR namespace and DCR
> memory regions but today the DCR handlers are installed in a DCR table
> under the CPU. Instead, introduce a little device model wrapper to hold
> a CPU link and handle registration of DCR handlers.
> 
> The DCR device inherits from SysBus because most of these devices also
> have MMIO regions and/or IRQs. Being a SysBusDevice makes things easier
> to install the device model in the overall SoC.
> 
> Signed-off-by: Cédric Le Goater <clg@kaod.org>

When re-sending a patch, it is a good practice to list the changes before
the Sob of the person doing the resend.

I think you only changed the ppc4xx_dcr_register prototype. Correct ?

Thanks,

C.

> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
> ---
>   hw/ppc/ppc4xx_devs.c    | 41 +++++++++++++++++++++++++++++++++++++++++
>   include/hw/ppc/ppc4xx.h | 17 +++++++++++++++++
>   2 files changed, 58 insertions(+)
> 
> diff --git a/hw/ppc/ppc4xx_devs.c b/hw/ppc/ppc4xx_devs.c
> index 069b511951..f4d7ae9567 100644
> --- a/hw/ppc/ppc4xx_devs.c
> +++ b/hw/ppc/ppc4xx_devs.c
> @@ -664,3 +664,44 @@ void ppc4xx_mal_init(CPUPPCState *env, uint8_t txcnum, uint8_t rxcnum,
>                            mal, &dcr_read_mal, &dcr_write_mal);
>       }
>   }
> +
> +/* PPC4xx_DCR_DEVICE */
> +
> +void ppc4xx_dcr_register(Ppc4xxDcrDeviceState *dev, int dcrn, void *opaque,
> +                         dcr_read_cb dcr_read, dcr_write_cb dcr_write)
> +{
> +    assert(dev->cpu);
> +    ppc_dcr_register(&dev->cpu->env, dcrn, opaque, dcr_read, dcr_write);
> +}
> +
> +bool ppc4xx_dcr_realize(Ppc4xxDcrDeviceState *dev, PowerPCCPU *cpu,
> +                        Error **errp)
> +{
> +    object_property_set_link(OBJECT(dev), "cpu", OBJECT(cpu), &error_abort);
> +    return sysbus_realize(SYS_BUS_DEVICE(dev), errp);
> +}
> +
> +static Property ppc4xx_dcr_properties[] = {
> +    DEFINE_PROP_LINK("cpu", Ppc4xxDcrDeviceState, cpu, TYPE_POWERPC_CPU,
> +                     PowerPCCPU *),
> +    DEFINE_PROP_END_OF_LIST(),
> +};
> +
> +static void ppc4xx_dcr_class_init(ObjectClass *oc, void *data)
> +{
> +    DeviceClass *dc = DEVICE_CLASS(oc);
> +
> +    device_class_set_props(dc, ppc4xx_dcr_properties);
> +}
> +
> +static const TypeInfo ppc4xx_types[] = {
> +    {
> +        .name           = TYPE_PPC4xx_DCR_DEVICE,
> +        .parent         = TYPE_SYS_BUS_DEVICE,
> +        .instance_size  = sizeof(Ppc4xxDcrDeviceState),
> +        .class_init     = ppc4xx_dcr_class_init,
> +        .abstract       = true,
> +    }
> +};
> +
> +DEFINE_TYPES(ppc4xx_types)
> diff --git a/include/hw/ppc/ppc4xx.h b/include/hw/ppc/ppc4xx.h
> index 591e2421a3..a537a5567b 100644
> --- a/include/hw/ppc/ppc4xx.h
> +++ b/include/hw/ppc/ppc4xx.h
> @@ -27,6 +27,7 @@
>   
>   #include "hw/ppc/ppc.h"
>   #include "exec/memory.h"
> +#include "hw/sysbus.h"
>   
>   void ppc4xx_sdram_banks(MemoryRegion *ram, int nr_banks,
>                           MemoryRegion ram_memories[],
> @@ -44,4 +45,20 @@ void ppc4xx_mal_init(CPUPPCState *env, uint8_t txcnum, uint8_t rxcnum,
>   
>   #define TYPE_PPC4xx_PCI_HOST_BRIDGE "ppc4xx-pcihost"
>   
> +/*
> + * Generic DCR device
> + */
> +#define TYPE_PPC4xx_DCR_DEVICE "ppc4xx-dcr-device"
> +OBJECT_DECLARE_SIMPLE_TYPE(Ppc4xxDcrDeviceState, PPC4xx_DCR_DEVICE);
> +struct Ppc4xxDcrDeviceState {
> +    SysBusDevice parent_obj;
> +
> +    PowerPCCPU *cpu;
> +};
> +
> +void ppc4xx_dcr_register(Ppc4xxDcrDeviceState *dev, int dcrn, void *opaque,
> +                         dcr_read_cb dcr_read, dcr_write_cb dcr_write);
> +bool ppc4xx_dcr_realize(Ppc4xxDcrDeviceState *dev, PowerPCCPU *cpu,
> +                        Error **errp);
> +
>   #endif /* PPC4XX_H */


