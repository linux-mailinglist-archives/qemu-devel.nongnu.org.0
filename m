Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B52D9588862
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Aug 2022 09:58:18 +0200 (CEST)
Received: from localhost ([::1]:45544 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJ9Gj-000754-Cd
	for lists+qemu-devel@lfdr.de; Wed, 03 Aug 2022 03:58:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34536)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1oJ9E1-0005Ly-9T
 for qemu-devel@nongnu.org; Wed, 03 Aug 2022 03:55:29 -0400
Received: from 10.mo552.mail-out.ovh.net ([87.98.187.244]:45683)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1oJ9Dv-00069K-S2
 for qemu-devel@nongnu.org; Wed, 03 Aug 2022 03:55:27 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.138.22])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id C4E15236D7;
 Wed,  3 Aug 2022 07:55:19 +0000 (UTC)
Received: from kaod.org (37.59.142.95) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.9; Wed, 3 Aug 2022
 09:55:19 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-95G001e1c2450e-ed0e-4beb-b69a-c1162f9e2c7b,
 CC7AE06ED68251E997EA4638F74AFDA4D8EEB002) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <1aa39486-5f92-fe94-ff50-59c74fa495eb@kaod.org>
Date: Wed, 3 Aug 2022 09:54:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 05/19] ppc/ppc405: Start QOMification of the SoC
Content-Language: en-US
To: BALATON Zoltan <balaton@eik.bme.hu>, Daniel Henrique Barboza
 <danielhb413@gmail.com>
CC: <qemu-ppc@nongnu.org>, <qemu-devel@nongnu.org>
References: <20220801131039.1693913-1-clg@kaod.org>
 <20220801131039.1693913-6-clg@kaod.org>
 <e437d81d-37e6-2a31-21e9-0cf7a8be73fd@gmail.com>
 <7abaf022-b2ef-ed5a-be3a-a04c915eb736@eik.bme.hu>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <7abaf022-b2ef-ed5a-be3a-a04c915eb736@eik.bme.hu>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.95]
X-ClientProxiedBy: DAG4EX2.mxp5.local (172.16.2.32) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: 3ef068e3-20e1-44c8-9c58-36ae8c62eee5
X-Ovh-Tracer-Id: 3019382075260111840
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrvddviedguddviecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepteefvedufeegueegudekjeffudejgefftdeuffethedvgfdvveehtdejffefgeegnecuffhomhgrihhnpehnohhnghhnuhdrohhrghdpghhithhlrggsrdgtohhmnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrdelheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopehqvghmuhdquggvvhgvlhesnhhonhhgnhhurdhorhhgpdfovfetjfhoshhtpehmohehhedv
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

On 8/2/22 23:24, BALATON Zoltan wrote:
> On Tue, 2 Aug 2022, Daniel Henrique Barboza wrote:
>> On 8/1/22 10:10, Cédric Le Goater wrote:
>>> This moves all the code previously done in the ppc405ep_init() routine
>>> under ppc405_soc_realize().
>>>
>>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
>>> ---
>>>   hw/ppc/ppc405.h        |  12 ++--
>>>   hw/ppc/ppc405_boards.c |  12 ++--
>>>   hw/ppc/ppc405_uc.c     | 151 ++++++++++++++++++++---------------------
>>>   3 files changed, 84 insertions(+), 91 deletions(-)
>>>
>>> diff --git a/hw/ppc/ppc405.h b/hw/ppc/ppc405.h
>>> index c8cddb71733a..5e4e96d86ceb 100644
>>> --- a/hw/ppc/ppc405.h
>>> +++ b/hw/ppc/ppc405.h
>>> @@ -74,9 +74,14 @@ struct Ppc405SoCState {
>>>       MemoryRegion sram;
>>>       MemoryRegion ram_memories[2];
>>>       hwaddr ram_bases[2], ram_sizes[2];
>>> +    bool do_dram_init;
>>>         MemoryRegion *dram_mr;
>>>       hwaddr ram_size;
>>> +
>>> +    uint32_t sysclk;
>>> +    PowerPCCPU *cpu;
>>> +    DeviceState *uic;
>>>   };
>>>     /* PowerPC 405 core */
>>> @@ -85,11 +90,4 @@ ram_addr_t ppc405_set_bootinfo(CPUPPCState *env, ram_addr_t ram_size);
>>>   void ppc4xx_plb_init(CPUPPCState *env);
>>>   void ppc405_ebc_init(CPUPPCState *env);
>>>   -PowerPCCPU *ppc405ep_init(MemoryRegion *address_space_mem,
>>> -                        MemoryRegion ram_memories[2],
>>> -                        hwaddr ram_bases[2],
>>> -                        hwaddr ram_sizes[2],
>>> -                        uint32_t sysclk, DeviceState **uicdev,
>>> -                        int do_init);
>>> -
>>>   #endif /* PPC405_H */
>>> diff --git a/hw/ppc/ppc405_boards.c b/hw/ppc/ppc405_boards.c
>>> index 96db52c5a309..363cb0770506 100644
>>> --- a/hw/ppc/ppc405_boards.c
>>> +++ b/hw/ppc/ppc405_boards.c
>>> @@ -237,9 +237,7 @@ static void ppc405_init(MachineState *machine)
>>>       Ppc405MachineState *ppc405 = PPC405_MACHINE(machine);
>>>       MachineClass *mc = MACHINE_GET_CLASS(machine);
>>>       const char *kernel_filename = machine->kernel_filename;
>>> -    PowerPCCPU *cpu;
>>>       MemoryRegion *sysmem = get_system_memory();
>>> -    DeviceState *uicdev;
>>>         if (machine->ram_size != mc->default_ram_size) {
>>>           char *sz = size_to_str(mc->default_ram_size);
>>> @@ -254,12 +252,12 @@ static void ppc405_init(MachineState *machine)
>>>                                machine->ram_size, &error_fatal);
>>>       object_property_set_link(OBJECT(&ppc405->soc), "dram",
>>>                                OBJECT(machine->ram), &error_abort);
>>> +    object_property_set_bool(OBJECT(&ppc405->soc), "dram-init",
>>> +                             !(kernel_filename == NULL), &error_abort);
>>> +    object_property_set_uint(OBJECT(&ppc405->soc), "sys-clk", 33333333,
>>> +                             &error_abort);
>>>       qdev_realize(DEVICE(&ppc405->soc), NULL, &error_abort);
>>>   -    cpu = ppc405ep_init(sysmem, ppc405->soc.ram_memories, ppc405->soc.ram_bases,
>>> -                        ppc405->soc.ram_sizes,
>>> -                        33333333, &uicdev, kernel_filename == NULL ? 0 : 1);
>>> -
>>>       /* allocate and load BIOS */
>>>       if (machine->firmware) {
>>>           MemoryRegion *bios = g_new(MemoryRegion, 1);
>>> @@ -315,7 +313,7 @@ static void ppc405_init(MachineState *machine)
>>>         /* Load ELF kernel and rootfs.cpio */
>>>       } else if (kernel_filename && !machine->firmware) {
>>> -        boot_from_kernel(machine, cpu);
>>> +        boot_from_kernel(machine, ppc405->soc.cpu);
>>>       }
>>>   }
>>>   diff --git a/hw/ppc/ppc405_uc.c b/hw/ppc/ppc405_uc.c
>>> index 156e839b8283..59612504bf3f 100644
>>> --- a/hw/ppc/ppc405_uc.c
>>> +++ b/hw/ppc/ppc405_uc.c
>>> @@ -1432,134 +1432,131 @@ static void ppc405ep_cpc_init (CPUPPCState *env, clk_setup_t clk_setup[8],
>>>   #endif
>>>   }
>>>   -PowerPCCPU *ppc405ep_init(MemoryRegion *address_space_mem,
>>> -                        MemoryRegion ram_memories[2],
>>> -                        hwaddr ram_bases[2],
>>> -                        hwaddr ram_sizes[2],
>>> -                        uint32_t sysclk, DeviceState **uicdevp,
>>> -                        int do_init)
>>> +static void ppc405_soc_realize(DeviceState *dev, Error **errp)
>>>   {
>>> +    Ppc405SoCState *s = PPC405_SOC(dev);
>>>       clk_setup_t clk_setup[PPC405EP_CLK_NB], tlb_clk_setup;
>>>       qemu_irq dma_irqs[4], gpt_irqs[5], mal_irqs[4];
>>> -    PowerPCCPU *cpu;
>>>       CPUPPCState *env;
>>> -    DeviceState *uicdev;
>>> -    SysBusDevice *uicsbd;
>>> +    Error *err = NULL;
>>> +
>>> +    /* XXX: fix this ? */
>>
>> So, this comment, originally from ppc405_boards.c, was added by commit
>> 1a6c088620368 and it seemed to make reference to something with the refering
>> to the ram_* values:
>>
>>
>>    /* XXX: fix this */
>>    ram_bases[0] = 0x00000000;
>>    ram_sizes[0] = 0x08000000;
>>    ram_bases[1] = 0x00000000;
>>    ram_sizes[1] = 0x00000000;
>> (...)
>>
>>
>> No more context is provided aside from a git-svn-id from savannah.nongnu.org.
>>
>> If no one can provide more context about what is to be fixed here, I'll
>> remove the comment.
> 
> I'm not sure about it because I don't know 405 and only vaguely remember how this was on 440/460EX but I think it might be that the memory controller can be programmed to map RAM to different places 

Yes. See :

   https://gitlab.com/huth/u-boot/-/blob/taihu/arch/powerpc/cpu/ppc4xx/sdram.c

Thomas had to hack the SDRAM init sequence for the QEMU machine to boot.

> but we don't fully emulate that nor the different chunks/DIMM sockets that could be possible and just map all system RAM to address 0 which is what most guest firmware or OS does anyway. 

It feels like it. At least for the 405, only one bank is used :

   0000000000000000-ffffffffffffffff (prio 0, i/o): system
     0000000000000000-0000000007ffffff (prio 0, i/o): sdram-containers
       0000000000000000-0000000007ffffff (prio 0, ram): alias ef405ep.ram.alias @ppc405.ram 0000000000000000-0000000007ffffff

The machine allocates a set of memory regions which are aliases on the
machine RAM. These are passed to the SDRAM controller model which maps
and unmaps container regions depending on the register settings.

It could be simplified.

Thanks,

C.


> Maybe I'm wrong and don't remember this correctly, the SDRAM controller model in ppc4xx_devs.c seems to do some mapping but I think this is what the comment might refer to or something similar. If so, I don't think it's worth emulating this more precisely unless we know about a guest which needs this.
> 
> Regards,
> BALATON Zoltan


