Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C9F728D664
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Oct 2020 00:17:04 +0200 (CEST)
Received: from localhost ([::1]:34798 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kSSbO-0000FP-Tv
	for lists+qemu-devel@lfdr.de; Tue, 13 Oct 2020 18:17:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56010)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1kSSZp-0007lb-O5; Tue, 13 Oct 2020 18:15:26 -0400
Received: from zero.eik.bme.hu ([152.66.115.2]:54159)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1kSSZl-00068j-9K; Tue, 13 Oct 2020 18:15:25 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 547947475FF;
 Wed, 14 Oct 2020 00:15:16 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id F1C1D7475FE; Wed, 14 Oct 2020 00:15:15 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id EF4517475FA;
 Wed, 14 Oct 2020 00:15:15 +0200 (CEST)
Date: Wed, 14 Oct 2020 00:15:15 +0200 (CEST)
To: =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>
Subject: Re: [PATCH v7 8/8] mac_oldworld: Add SPD data to cover RAM
In-Reply-To: <5f4c18c1-80ff-f605-fdd7-7ae474443690@amsat.org>
Message-ID: <b78024b4-7d9b-9670-66af-24b6bc97a5a8@eik.bme.hu>
References: <cover.1593456926.git.balaton@eik.bme.hu>
 <9f5f44878dc0f60b073201e657d6e4dcc940f68c.1593456926.git.balaton@eik.bme.hu>
 <5f4c18c1-80ff-f605-fdd7-7ae474443690@amsat.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="3866299591-80889855-1602625614=:80018"
Content-ID: <b3c8f563-edab-1f84-50c7-6fd84b6f8bc2@eik.bme.hu>
X-Spam-Probability: 9%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/13 18:15:16
X-ACL-Warn: Detected OS   = FreeBSD 9.x or newer [fuzzy]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
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
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Howard Spoelstra <hsp.cat7@gmail.com>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to: BALATON Zoltan <balaton@eik.bme.hu>
From: BALATON Zoltan via <qemu-devel@nongnu.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-80889855-1602625614=:80018
Content-Type: text/plain; CHARSET=ISO-8859-15; format=flowed
Content-Transfer-Encoding: 8BIT
Content-ID: <61156365-ab5a-176-2980-e01c9d38ab51@eik.bme.hu>

On Tue, 13 Oct 2020, Philippe Mathieu-Daudé wrote:
> On 6/29/20 8:55 PM, BALATON Zoltan wrote:
>> OpenBIOS gets RAM size via fw_cfg but rhe original board firmware
>
> Typo "the".
>
>> detects RAM using SPD data so generate and add SDP eeproms to cover as
>
> EEPROMs?
>
>> much RAM as possible to describe with SPD (this may be less than the
>> actual ram_size due to SDRAM size constraints).
>> 
>> This patch is more complex as it should be which I intend to fix once
>> agreement can be made on how to get back the necessary functionality
>> removed by previous patches. See in this thread:
>> https://lists.nongnu.org/archive/html/qemu-devel/2020-06/msg08710.html
>> 
>> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
>> ---
>>   hw/ppc/mac_oldworld.c | 19 ++++++++++++++++++-
>>   1 file changed, 18 insertions(+), 1 deletion(-)
>> 
>> diff --git a/hw/ppc/mac_oldworld.c b/hw/ppc/mac_oldworld.c
>> index 6276973c95..6a27287c9f 100644
>> --- a/hw/ppc/mac_oldworld.c
>> +++ b/hw/ppc/mac_oldworld.c
>> @@ -34,6 +34,7 @@
>>   #include "hw/input/adb.h"
>>   #include "sysemu/sysemu.h"
>>   #include "net/net.h"
>> +#include "hw/i2c/smbus_eeprom.h"
>>   #include "hw/isa/isa.h"
>>   #include "hw/pci/pci.h"
>>   #include "hw/pci/pci_host.h"
>> @@ -104,6 +105,8 @@ static void ppc_heathrow_init(MachineState *machine)
>>       DriveInfo *hd[MAX_IDE_BUS * MAX_IDE_DEVS];
>>       void *fw_cfg;
>>       uint64_t tbfreq;
>> +    uint8_t *spd_data[3] = {};
>> +    I2CBus *i2c_bus;
>>         /* init CPUs */
>>       for (i = 0; i < smp_cpus; i++) {
>> @@ -121,8 +124,16 @@ static void ppc_heathrow_init(MachineState *machine)
>>                        "maximum 2047 MB", ram_size / MiB);
>>           exit(1);
>>       }
>> -
>>       memory_region_add_subregion(get_system_memory(), 0, machine->ram);
>> +    for (i = 0; i < 3; i++) {
>
> 3 -> ARRAY_SIZE(spd_data)
>
>> +        int size_left = ram_size - i * 512 * MiB;
>> +        if (size_left > 0) {
>> +            uint32_t s = size_left / MiB;
>> +            s = (s > 512 ? 512 : s);
>
> MIN()?

Thanks for the review. (You forgot to cc Mark so maybe he missed the other 
R-b tags but hopefully patchwork will pick these up.)

I plan to rewrite this patch eliminating this part and un-breaking 
spd_data_generate() instead to allow it to signal an error again so we 
don't need to duplicate part of it here to avoid aborting. (You may 
remember the thread where this was discussed in, I don't have a link to it 
now.) So just disregard this one patch for now, I'll take your other 
suggestions in account when submitting a rewritten version.

This and the WIP CUDA i2c patches are not yet ready to be merged and you 
had alternative suggestion for [v7,6/7] i2c: Match parameters of 
i2c_start_transfer and i2c_send_recv, but was that ever merged? Do you 
plan to resubmit or send a ping for that? It may have been lost somewhere 
because I have those mails in my mailbox but could not find it in Patchew 
or Patchwork.

Other than these 3 patches in the series others (1-5) should be OK and 
hope most of those could be taken by Mark now in the upcoming Mac fixes 
series to reduce the size of outstanding patches then I can fix up or 
rewrite the remaining ones.

I'm still not sure what to do about the sign extension problem in 
include/hw/elf_ops.h that was holding back patch 1 so if anyone has a 
suggestion please tell me or feel free to propose any fix for it, I'm not 
confident enough to break the elf loader.

Regards,
BALATON Zoltan

>> +            s = 1U << (31 - clz32(s));
>> +            spd_data[i] = spd_data_generate(SDR, s * MiB);
>> +        }
>> +    }
>>         /* allocate and load firmware ROM */
>>       memory_region_init_rom(bios, NULL, "ppc_heathrow.bios", PROM_SIZE,
>> @@ -302,6 +313,12 @@ static void ppc_heathrow_init(MachineState *machine)
>>       macio_ide_init_drives(macio_ide, &hd[MAX_IDE_DEVS]);
>>         dev = DEVICE(object_resolve_path_component(OBJECT(macio), "cuda"));
>> +    i2c_bus = I2C_BUS(qdev_get_child_bus(dev, "i2c"));
>> +    for (i = 0; i < 3; i++) {
>
> 3 -> ARRAY_SIZE(spd_data)
>
>> +        if (spd_data[i]) {
>> +            smbus_eeprom_init_one(i2c_bus, 0x50 + i, spd_data[i]);
>> +        }
>> +    }
>>       adb_bus = qdev_get_child_bus(dev, "adb.0");
>>       dev = qdev_new(TYPE_ADB_KEYBOARD);
>>       qdev_realize_and_unref(dev, adb_bus, &error_fatal);
>> 
>
>
>
--3866299591-80889855-1602625614=:80018--

