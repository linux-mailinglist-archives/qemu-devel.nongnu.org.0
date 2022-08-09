Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FF5458DD84
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Aug 2022 19:55:45 +0200 (CEST)
Received: from localhost ([::1]:47276 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oLTSC-0007Zv-Da
	for lists+qemu-devel@lfdr.de; Tue, 09 Aug 2022 13:55:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55120)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1oLTFQ-0005um-Tb
 for qemu-devel@nongnu.org; Tue, 09 Aug 2022 13:42:32 -0400
Received: from 4.mo552.mail-out.ovh.net ([178.33.43.201]:50081)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1oLTFO-0008Ag-8x
 for qemu-devel@nongnu.org; Tue, 09 Aug 2022 13:42:31 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.143.236])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id 6B25123E9F;
 Tue,  9 Aug 2022 17:42:26 +0000 (UTC)
Received: from kaod.org (37.59.142.109) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.9; Tue, 9 Aug 2022
 19:42:23 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-109S00304c97ac0-d2cc-4f6e-b46c-78802dff52b9,
 BD40907C0192BF4836BE6AE78B8C01BE56B63EE9) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <689d0c57-159a-757a-0349-64f42c089997@kaod.org>
Date: Tue, 9 Aug 2022 19:42:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v4 04/24] ppc/ppc405: Move SRAM under the ref405ep machine
Content-Language: en-US
To: BALATON Zoltan <balaton@eik.bme.hu>
CC: <qemu-ppc@nongnu.org>, Daniel Henrique Barboza <danielhb413@gmail.com>,
 <qemu-devel@nongnu.org>, Peter Maydell <peter.maydell@linaro.org>
References: <20220809153904.485018-1-clg@kaod.org>
 <20220809153904.485018-5-clg@kaod.org>
 <9d3ac97d-342-1152-f01c-eb8b192dccaf@eik.bme.hu>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <9d3ac97d-342-1152-f01c-eb8b192dccaf@eik.bme.hu>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.109]
X-ClientProxiedBy: DAG5EX2.mxp5.local (172.16.2.42) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: 68afc26e-3e45-4b9c-941b-794c54bb92dd
X-Ovh-Tracer-Id: 11277576417169279907
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrvdegtddguddujecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepkeetjedtleekjedvveffudfhteetleeifeegfeffuefghfefkeehffeufeeludejnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutdelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtohepphgvthgvrhdrmhgrhiguvghllheslhhinhgrrhhordhorhhgpdfovfetjfhoshhtpehmohehhedv
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

On 8/9/22 18:53, BALATON Zoltan wrote:
> On Tue, 9 Aug 2022, Cédric Le Goater wrote:
>> It doesn't belong to the generic machine nor the SoC. Fix a typo in
>> the name while we are at it.
>>
>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
>> ---
>> hw/ppc/ppc405_boards.c | 12 ++++++------
>> 1 file changed, 6 insertions(+), 6 deletions(-)
>>
>> diff --git a/hw/ppc/ppc405_boards.c b/hw/ppc/ppc405_boards.c
>> index f4794ba40ce6..381f39aa94cb 100644
>> --- a/hw/ppc/ppc405_boards.c
>> +++ b/hw/ppc/ppc405_boards.c
>> @@ -235,7 +235,6 @@ static void ppc405_init(MachineState *machine)
>>     MachineClass *mc = MACHINE_GET_CLASS(machine);
>>     const char *kernel_filename = machine->kernel_filename;
>>     PowerPCCPU *cpu;
>> -    MemoryRegion *sram = g_new(MemoryRegion, 1);
>>     MemoryRegion *ram_memories = g_new(MemoryRegion, 2);
>>     hwaddr ram_bases[2], ram_sizes[2];
>>     MemoryRegion *sysmem = get_system_memory();
>> @@ -260,11 +259,6 @@ static void ppc405_init(MachineState *machine)
>>     cpu = ppc405ep_init(sysmem, ram_memories, ram_bases, ram_sizes,
>>                         33333333, &uicdev, kernel_filename == NULL ? 0 : 1);
>>
>> -    /* allocate SRAM */
>> -    memory_region_init_ram(sram, NULL, "ef405ep.sram", PPC405EP_SRAM_SIZE,
>> -                           &error_fatal);
> 
> Do you need to set an owner while at it? Anyway,

A machine is not a device and :

         /* This will assert if owner is neither NULL nor a DeviceState.
          * We only want the owner here for the purposes of defining a
          * unique name for migration. TODO: Ideally we should implement
          * a naming scheme for Objects which are not DeviceStates, in
          * which case we can relax this restriction.
          */
	owner_dev = DEVICE(owner);
  

Thanks,

C.

> 
> Reviewed-by: BALATON Zoltan <balaton@eik.bme.hu>
> 
> Regards,
> BALATON Zoltan
> 
>> -    memory_region_add_subregion(sysmem, PPC405EP_SRAM_BASE, sram);
>> -
>>     /* allocate and load BIOS */
>>     if (machine->firmware) {
>>         MemoryRegion *bios = g_new(MemoryRegion, 1);
>> @@ -328,9 +322,15 @@ static void ref405ep_init(MachineState *machine)
>> {
>>     DeviceState *dev;
>>     SysBusDevice *s;
>> +    MemoryRegion *sram = g_new(MemoryRegion, 1);
>>
>>     ppc405_init(machine);
>>
>> +    /* allocate SRAM */
>> +    memory_region_init_ram(sram, NULL, "ref405ep.sram", PPC405EP_SRAM_SIZE,
>> +                           &error_fatal);
>> +    memory_region_add_subregion(get_system_memory(), PPC405EP_SRAM_BASE, sram);
>> +
>>     /* Register FPGA */
>>     ref405ep_fpga_init(get_system_memory(), PPC405EP_FPGA_BASE);
>>     /* Register NVRAM */
>>


