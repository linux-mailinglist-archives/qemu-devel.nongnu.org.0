Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EBB66D68DC
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Apr 2023 18:30:19 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pjjXe-0002Jv-Al; Tue, 04 Apr 2023 12:29:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1pjjXb-0002J5-J5
 for qemu-devel@nongnu.org; Tue, 04 Apr 2023 12:29:51 -0400
Received: from 3.mo548.mail-out.ovh.net ([188.165.32.156])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1pjjXC-00021S-Co
 for qemu-devel@nongnu.org; Tue, 04 Apr 2023 12:29:36 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.1.6])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id 0CFDC21EB6;
 Tue,  4 Apr 2023 16:29:23 +0000 (UTC)
Received: from kaod.org (37.59.142.110) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Tue, 4 Apr
 2023 18:29:22 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-110S004dd354537-2539-48f5-8241-b13109ee3d01,
 85507D0075A56E5AD4EA03BF56E5282CC2D8C3A6) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <42909658-3a6d-69b0-1607-182728e2ac70@kaod.org>
Date: Tue, 4 Apr 2023 18:29:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PULL 10/19] aspeed: fby35: Add a bootrom for the BMC
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
CC: <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>, Peter Delevoryas
 <peter@pjd.dev>
References: <20220714154456.2565189-1-clg@kaod.org>
 <20220714154456.2565189-11-clg@kaod.org>
 <CAFEAcA_yYuWgsSKc9N7PvHeAWjtSqWwM1z+qJQ1swv3cwCghPg@mail.gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <CAFEAcA_yYuWgsSKc9N7PvHeAWjtSqWwM1z+qJQ1swv3cwCghPg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.110]
X-ClientProxiedBy: DAG3EX1.mxp5.local (172.16.2.21) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: 8539e7d6-1868-434c-93b5-d0c8c7b09024
X-Ovh-Tracer-Id: 5792192071044729824
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvhedrvdeiledguddtudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitgcunfgvucfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepffdufeeliedujeeffffhjeffiefghffhhfdvkeeijeehledvueffhfejtdehgeegnecukfhppeduvdejrddtrddtrddupdefjedrheelrddugedvrdduuddtpdekvddrieegrddvhedtrddujedtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpeeotghlgheskhgrohgurdhorhhgqedpnhgspghrtghpthhtohepuddprhgtphhtthhopehpvghtvghrrdhmrgihuggvlhhlsehlihhnrghrohdrohhrghdpqhgvmhhuqdgrrhhmsehnohhnghhnuhdrohhrghdpqhgvmhhuqdguvghvvghlsehnohhnghhnuhdrohhrghdpphgvthgvrhesphhjugdruggvvhdpoffvtefjohhsthepmhhoheegkedpmhhouggvpehsmhhtphhouhht
Received-SPF: pass client-ip=188.165.32.156; envelope-from=clg@kaod.org;
 helo=3.mo548.mail-out.ovh.net
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.925,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 4/4/23 17:54, Peter Maydell wrote:
> On Thu, 14 Jul 2022 at 16:45, Cédric Le Goater <clg@kaod.org> wrote:
>>
>> The BMC boots from the first flash device by fetching instructions
>> from the flash contents. Add an alias region on 0x0 for this
>> purpose. There are currently performance issues with this method (TBs
>> being flushed too often), so as a faster alternative, install the
>> flash contents as a ROM in the BMC memory space.
>>
>> See commit 1a15311a12fa ("hw/arm/aspeed: add a 'execute-in-place'
>> property to boot directly from CE0")
>>
>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
>> Signed-off-by: Peter Delevoryas <peter@pjd.dev>
>> [ clg: blk_pread() fixes ]
>> Message-Id: <20220705191400.41632-8-peter@pjd.dev>
>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> 
> Hi; Coverity has noticed a trivial "memory leak" (CID 1508061) in this code:
> 
>>   static void fby35_bmc_init(Fby35State *s)
>>   {
>> +    DriveInfo *drive0 = drive_get(IF_MTD, 0, 0);
>> +
>>       memory_region_init(&s->bmc_memory, OBJECT(s), "bmc-memory", UINT64_MAX);
>>       memory_region_init_ram(&s->bmc_dram, OBJECT(s), "bmc-dram",
>>                              FBY35_BMC_RAM_SIZE, &error_abort);
>> @@ -48,6 +86,28 @@ static void fby35_bmc_init(Fby35State *s)
>>       qdev_realize(DEVICE(&s->bmc), NULL, &error_abort);
>>
>>       aspeed_board_init_flashes(&s->bmc.fmc, "n25q00", 2, 0);
>> +
>> +    /* Install first FMC flash content as a boot rom. */
>> +    if (drive0) {
>> +        AspeedSMCFlash *fl = &s->bmc.fmc.flashes[0];
>> +        MemoryRegion *boot_rom = g_new(MemoryRegion, 1);
> 
> Here we allocate a new MemoryRegion...
> 
>> +        uint64_t size = memory_region_size(&fl->mmio);
>> +
>> +        if (s->mmio_exec) {
>> +            memory_region_init_alias(boot_rom, NULL, "aspeed.boot_rom",
>> +                                     &fl->mmio, 0, size);
>> +            memory_region_add_subregion(&s->bmc_memory, FBY35_BMC_FIRMWARE_ADDR,
>> +                                        boot_rom);
>> +        } else {
>> +
>> +            memory_region_init_rom(boot_rom, NULL, "aspeed.boot_rom",
>> +                                   size, &error_abort);
>> +            memory_region_add_subregion(&s->bmc_memory, FBY35_BMC_FIRMWARE_ADDR,
>> +                                        boot_rom);
>> +            fby35_bmc_write_boot_rom(drive0, boot_rom, FBY35_BMC_FIRMWARE_ADDR,
>> +                                     size, &error_abort);
>> +        }
> 
> ...but we never keep a pointer to it anywhere, so Coverity classes
> this as a "memory leak". (It's not really one, because the memory
> has to stay live for the whole of QEMU's execution anyway.)
> 
> The easy fix is not to allocate a new MR, but instead use
> a MemoryRegion field in the Fby35State struct, the way we
> do for all the other MRs this function sets up. Conveniently,
> there already is a "MemoryRegion bmc_boot_rom" in the struct
> which is currently completely unused :-)

hey :) Indeed.

I have recently taken another approach in the aspeed machines, which is
to introduce a spi_boot region since it is part of the SoC address space.
There is also an extra container to overlap a rom region to speed up boot
because the "execute-in-place mode" is a bit slow (~30 s to reach FW).
So the aspeed code is different now :

    if (!bmc->mmio_exec) {
         DriveInfo *mtd0 = drive_get(IF_MTD, 0, 0);

         if (mtd0) {
             uint64_t rom_size = memory_region_size(&bmc->soc.spi_boot);
             aspeed_install_boot_rom(&bmc->soc, blk_by_legacy_dinfo(mtd0),
                                     rom_size);
         }
     }

and we should report the same code in fby35 (which was a copy paste)

The benefits are that we will (soon) be able to create SPI flash devices
from the command line, such as :

         -blockdev node-name=fmc0,driver=file,filename=./flash.img \
         -device mx66u51235f,addr=0x0,bus=ssi.0,drive=fmc0 \

and boot from them. That said, the memory leak is still there in
aspeed_install_boot_rom() :

     MemoryRegion *boot_rom = g_new(MemoryRegion, 1);

     memory_region_init_rom(boot_rom, NULL, "aspeed.boot_rom", rom_size,
                            &error_abort);
     memory_region_add_subregion_overlap(&soc->spi_boot_container, 0,
                                         boot_rom, 1);
     write_boot_rom(blk, ASPEED_SOC_SPI_BOOT_ADDR, rom_size, &error_abort);

and coverity didn't catch it ? Anyhow we can use a MemoryRegion under the
machine state to remove the warning like you suggested. I will add that on
the 8.1 TODO list.

Thanks,

C.


