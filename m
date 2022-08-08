Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB2A758C9C9
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Aug 2022 15:52:58 +0200 (CEST)
Received: from localhost ([::1]:52956 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oL3Bh-0005Bj-Cf
	for lists+qemu-devel@lfdr.de; Mon, 08 Aug 2022 09:52:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35824)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1oL3A7-0003a9-W9
 for qemu-devel@nongnu.org; Mon, 08 Aug 2022 09:51:20 -0400
Received: from 10.mo552.mail-out.ovh.net ([87.98.187.244]:39083)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1oL3A5-0002o0-DR
 for qemu-devel@nongnu.org; Mon, 08 Aug 2022 09:51:19 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.146.15])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id 939FA22B58;
 Mon,  8 Aug 2022 13:51:13 +0000 (UTC)
Received: from kaod.org (37.59.142.107) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.9; Mon, 8 Aug 2022
 15:51:12 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-107S001a4fbd46c-47ec-45e4-b728-adea7870e04c,
 014009DFAA8B86078D729D00C01D9476BEEC0396) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <dd13c15a-c742-8eb5-cf81-010becd5937a@kaod.org>
Date: Mon, 8 Aug 2022 15:51:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v3 05/22] ppc/ppc405: Introduce a PPC405 SoC
Content-Language: en-US
To: BALATON Zoltan <balaton@eik.bme.hu>
CC: <qemu-ppc@nongnu.org>, Daniel Henrique Barboza <danielhb413@gmail.com>,
 <qemu-devel@nongnu.org>, Peter Maydell <peter.maydell@linaro.org>
References: <20220808102734.133084-1-clg@kaod.org>
 <20220808102734.133084-6-clg@kaod.org>
 <ea7b62be-5550-3e67-cd28-d7ab44a11ace@eik.bme.hu>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <ea7b62be-5550-3e67-cd28-d7ab44a11ace@eik.bme.hu>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.107]
X-ClientProxiedBy: DAG1EX1.mxp5.local (172.16.2.1) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: 392e11e9-e80a-4327-8ff4-7854e9eb3f9e
X-Ovh-Tracer-Id: 1499980154237717411
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrvdefkedgjeduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeekteejtdelkeejvdevffduhfetteelieefgeefffeugffhfeekheffueefledujeenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopehpvghtvghrrdhmrgihuggvlhhlsehlihhnrghrohdrohhrghdpoffvtefjohhsthepmhhoheehvd
Received-SPF: pass client-ip=87.98.187.244; envelope-from=clg@kaod.org;
 helo=10.mo552.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 8/8/22 14:43, BALATON Zoltan wrote:
> On Mon, 8 Aug 2022, Cédric Le Goater wrote:
>> It is an initial model to start QOMification of the PPC405 board.
>> QOM'ified devices will be reintroduced one by one. Start with the
>> memory regions, which name prefix is changed to "ppc405".
>>
>> Also, initialize only one RAM bank. The second bank is a dummy one
>> (zero size) which is here to match the hard coded number of banks in
>> ppc405ep_init().
>>
>> Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
>> ---
>> hw/ppc/ppc405.h        | 16 ++++++++++++++++
>> hw/ppc/ppc405_boards.c | 23 ++++++++++++-----------
>> hw/ppc/ppc405_uc.c     | 40 ++++++++++++++++++++++++++++++++++++++++
>> 3 files changed, 68 insertions(+), 11 deletions(-)
>>
>> diff --git a/hw/ppc/ppc405.h b/hw/ppc/ppc405.h
>> index 83f156f585c8..66dc21cdfed8 100644
>> --- a/hw/ppc/ppc405.h
>> +++ b/hw/ppc/ppc405.h
>> @@ -25,6 +25,7 @@
>> #ifndef PPC405_H
>> #define PPC405_H
>>
>> +#include "qom/object.h"
>> #include "hw/ppc/ppc4xx.h"
>>
>> #define PPC405EP_SDRAM_BASE 0x00000000
>> @@ -62,6 +63,21 @@ struct ppc4xx_bd_info_t {
>>     uint32_t bi_iic_fast[2];
>> };
>>
>> +#define TYPE_PPC405_SOC "ppc405-soc"
>> +OBJECT_DECLARE_SIMPLE_TYPE(Ppc405SoCState, PPC405_SOC);
>> +
>> +struct Ppc405SoCState {
>> +    /* Private */
>> +    DeviceState parent_obj;
>> +
>> +    /* Public */
>> +    MemoryRegion ram_banks[2];
>> +    hwaddr ram_bases[2], ram_sizes[2];
>> +
>> +    MemoryRegion *dram_mr;
>> +    hwaddr ram_size;
>> +};
>> +
>> /* PowerPC 405 core */
>> ram_addr_t ppc405_set_bootinfo(CPUPPCState *env, ram_addr_t ram_size);
>>
>> diff --git a/hw/ppc/ppc405_boards.c b/hw/ppc/ppc405_boards.c
>> index c6fa559b03d9..1dc5065fcc1d 100644
>> --- a/hw/ppc/ppc405_boards.c
>> +++ b/hw/ppc/ppc405_boards.c
>> @@ -57,6 +57,8 @@ struct Ppc405MachineState {
>>     /* Private */
>>     MachineState parent_obj;
>>     /* Public */
>> +
>> +    Ppc405SoCState soc;
>> };
>>
>> /*****************************************************************************/
>> @@ -232,11 +234,10 @@ static void boot_from_kernel(MachineState *machine, PowerPCCPU *cpu)
>>
>> static void ppc405_init(MachineState *machine)
>> {
>> +    Ppc405MachineState *ppc405 = PPC405_MACHINE(machine);
>>     MachineClass *mc = MACHINE_GET_CLASS(machine);
>>     const char *kernel_filename = machine->kernel_filename;
>>     PowerPCCPU *cpu;
>> -    MemoryRegion *ram_memories = g_new(MemoryRegion, 2);
>> -    hwaddr ram_bases[2], ram_sizes[2];
>>     MemoryRegion *sysmem = get_system_memory();
>>     DeviceState *uicdev;
>>
>> @@ -247,16 +248,16 @@ static void ppc405_init(MachineState *machine)
>>         exit(EXIT_FAILURE);
>>     }
>>
>> -    /* XXX: fix this */
>> -    memory_region_init_alias(&ram_memories[0], NULL, "ef405ep.ram.alias",
>> -                             machine->ram, 0, machine->ram_size);
>> -    ram_bases[0] = 0;
>> -    ram_sizes[0] = machine->ram_size;
>> -    memory_region_init(&ram_memories[1], NULL, "ef405ep.ram1", 0);
>> -    ram_bases[1] = 0x00000000;
>> -    ram_sizes[1] = 0x00000000;
>> +    object_initialize_child(OBJECT(machine), "soc", &ppc405->soc,
>> +                            TYPE_PPC405_SOC);
>> +    object_property_set_uint(OBJECT(&ppc405->soc), "ram-size",
>> +                             machine->ram_size, &error_fatal);
>> +    object_property_set_link(OBJECT(&ppc405->soc), "dram",
>> +                             OBJECT(machine->ram), &error_abort);
>> +    qdev_realize(DEVICE(&ppc405->soc), NULL, &error_abort);
>>
>> -    cpu = ppc405ep_init(sysmem, ram_memories, ram_bases, ram_sizes,
>> +    cpu = ppc405ep_init(sysmem, ppc405->soc.ram_banks, ppc405->soc.ram_bases,
>> +                        ppc405->soc.ram_sizes,
>>                         33333333, &uicdev, kernel_filename == NULL ? 0 : 1);
>>
>>     /* allocate and load BIOS */
>> diff --git a/hw/ppc/ppc405_uc.c b/hw/ppc/ppc405_uc.c
>> index d6420c88d3a6..adadb3a0ae08 100644
>> --- a/hw/ppc/ppc405_uc.c
>> +++ b/hw/ppc/ppc405_uc.c
>> @@ -30,6 +30,7 @@
>> #include "hw/ppc/ppc.h"
>> #include "hw/i2c/ppc4xx_i2c.h"
>> #include "hw/irq.h"
>> +#include "hw/qdev-properties.h"
>> #include "ppc405.h"
>> #include "hw/char/serial.h"
>> #include "qemu/timer.h"
>> @@ -1530,3 +1531,42 @@ PowerPCCPU *ppc405ep_init(MemoryRegion *address_space_mem,
>>
>>     return cpu;
>> }
>> +
>> +static void ppc405_soc_realize(DeviceState *dev, Error **errp)
>> +{
>> +    Ppc405SoCState *s = PPC405_SOC(dev);
>> +
>> +    /* Initialize only one bank */
>> +    s->ram_bases[0] = 0;
>> +    s->ram_sizes[0] = s->ram_size;
>> +    memory_region_init_alias(&s->ram_banks[0], OBJECT(s),
>> +                             "ppc405.sdram0", s->dram_mr,
>> +                             s->ram_bases[0], s->ram_sizes[0]);
>> +}
>> +
>> +static Property ppc405_soc_properties[] = {
>> +    DEFINE_PROP_LINK("dram", Ppc405SoCState, dram_mr, TYPE_MEMORY_REGION,
>> +                     MemoryRegion *),
>> +    DEFINE_PROP_UINT64("ram-size", Ppc405SoCState, ram_size, 0),
>> +    DEFINE_PROP_END_OF_LIST(),
>> +};
> 
> I'm not sure why we need to duplicate these in the soc if they are always the same as machine->ram and machine->ram_size. 

There are machines with multi SoCs. PowerNV can have 16.

But that's not the reason here, we pass the dram memory region to the SoC
for controllers that might need it for memory transactions, typically DMAs.
In this case, it's the SDRAM controller which creates slices of RAM for
each available RAM bank.

> Is it theoretically possible to have a soc where it uses ram that's not the whole ram? 

Yes.

> If not then you could just uose machine which is accessible either as current_machine 
> or qdev_get_machine() 

These are QEMU globals. We should avoid using them in device models.

> (also the parent of out soc but we don't know how to get that). If setting ram this way
> is still desired do we separately need to set its size or we could use memory_region_size() 
> instead?

Let's keep SDRAM modeling for the next patchset.

  
>> +
>> +static void ppc405_soc_class_init(ObjectClass *oc, void *data)
>> +{
>> +    DeviceClass *dc = DEVICE_CLASS(oc);
>> +
>> +    dc->realize = ppc405_soc_realize;
>> +    dc->user_creatable = false;
> 
> May need a comment explaining why user_creatable = false. (Also for all other similar lines in other patches, I won't repeat this there.)

TYPE_PPC405_SOC devices can not be created from the QEMU command line.
it doesn't make sense. That's what 'dc->user_creatable = false' means.

Thanks,

C.

> 
> Regards,
> BALATON Zoltan
> 
>> +    device_class_set_props(dc, ppc405_soc_properties);
>> +}
>> +
>> +static const TypeInfo ppc405_types[] = {
>> +    {
>> +        .name           = TYPE_PPC405_SOC,
>> +        .parent         = TYPE_DEVICE,
>> +        .instance_size  = sizeof(Ppc405SoCState),
>> +        .class_init     = ppc405_soc_class_init,
>> +    }
>> +};
>> +
>> +DEFINE_TYPES(ppc405_types)
>>


