Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A969A2914DA
	for <lists+qemu-devel@lfdr.de>; Sat, 17 Oct 2020 23:59:27 +0200 (CEST)
Received: from localhost ([::1]:44682 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kTuEW-0004wR-Tg
	for lists+qemu-devel@lfdr.de; Sat, 17 Oct 2020 17:59:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44178)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1kTuDC-0004JW-Du; Sat, 17 Oct 2020 17:58:02 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:37076)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1kTuD8-00056N-M8; Sat, 17 Oct 2020 17:58:01 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id DD936747623;
 Sat, 17 Oct 2020 23:57:52 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 9E386747620; Sat, 17 Oct 2020 23:57:52 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 9CA6274594E;
 Sat, 17 Oct 2020 23:57:52 +0200 (CEST)
Date: Sat, 17 Oct 2020 23:57:52 +0200 (CEST)
To: =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>
Subject: Re: [PATCH v9] mac_oldworld: Allow loading binary ROM image
In-Reply-To: <348bb0e5-dee2-1d4d-0fb5-bf6d56ef5706@amsat.org>
Message-ID: <40ed5022-b3d7-6b80-9d39-8c8a5d3561cc@eik.bme.hu>
References: <20201017155139.5A36A746331@zero.eik.bme.hu>
 <11c1edab-bcbe-bb02-7c53-b4b0707779c2@amsat.org>
 <146aa146-80e9-6cea-fbda-ccca6e47d33@eik.bme.hu>
 <348bb0e5-dee2-1d4d-0fb5-bf6d56ef5706@amsat.org>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-445051963-1602971872=:60614"
X-Spam-Probability: 9%
Received-SPF: pass client-ip=2001:738:2001:2001::2001;
 envelope-from=balaton@eik.bme.hu; helo=zero.eik.bme.hu
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Alistair Francis <alistair@alistair23.me>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to: BALATON Zoltan <balaton@eik.bme.hu>
From: BALATON Zoltan via <qemu-devel@nongnu.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-445051963-1602971872=:60614
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Sat, 17 Oct 2020, Philippe Mathieu-Daudé wrote:
> On 10/17/20 6:31 PM, BALATON Zoltan via wrote:
>> On Sat, 17 Oct 2020, Philippe Mathieu-Daudé wrote:
>>> +Alistair for loader
>>> 
>>> On 10/17/20 5:47 PM, BALATON Zoltan via wrote:
>>>> The beige G3 Power Macintosh has a 4MB firmware ROM. Fix the size of
>>>> the rom region and fall back to loading a binary image with -bios if
>>>> loading ELF image failed. This allows testing emulation with a ROM
>>>> image from real hardware as well as using an ELF OpenBIOS image.
>>>> 
>>>> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
>>>> Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
>>>> ---
>>>> v9: Revert change from v8, back to the same as v7 rebased on latest
>>>> 
>>>>   hw/ppc/mac_oldworld.c | 29 ++++++++++++++++++++---------
>>>>   1 file changed, 20 insertions(+), 9 deletions(-)
>>>> 
>>>> diff --git a/hw/ppc/mac_oldworld.c b/hw/ppc/mac_oldworld.c
>>>> index 05e46ee6fe..0117ae17f5 100644
>>>> --- a/hw/ppc/mac_oldworld.c
>>>> +++ b/hw/ppc/mac_oldworld.c
>>>> @@ -59,6 +59,8 @@
>>>>   #define NDRV_VGA_FILENAME "qemu_vga.ndrv"
>>>>     #define GRACKLE_BASE 0xfec00000
>>>> +#define PROM_BASE 0xffc00000
>>>> +#define PROM_SIZE (4 * MiB)
>>>>     static void fw_cfg_boot_set(void *opaque, const char *boot_device,
>>>>                               Error **errp)
>>>> @@ -100,6 +102,7 @@ static void ppc_heathrow_init(MachineState *machine)
>>>>       SysBusDevice *s;
>>>>       DeviceState *dev, *pic_dev;
>>>>       BusState *adb_bus;
>>>> +    uint64_t bios_addr;
>>>>       int bios_size;
>>>>       unsigned int smp_cpus = machine->smp.cpus;
>>>>       uint16_t ppc_boot_device;
>>>> @@ -128,24 +131,32 @@ static void ppc_heathrow_init(MachineState 
>>>> *machine)
>>>>         memory_region_add_subregion(sysmem, 0, machine->ram);
>>>>   -    /* allocate and load BIOS */
>>>> -    memory_region_init_rom(bios, NULL, "ppc_heathrow.bios", BIOS_SIZE,
>>>> +    /* allocate and load firmware ROM */
>>>> +    memory_region_init_rom(bios, NULL, "ppc_heathrow.bios", PROM_SIZE,
>>>>                              &error_fatal);
>>>> +    memory_region_add_subregion(sysmem, PROM_BASE, bios);
>>>>   -    if (bios_name == NULL)
>>>> +    if (!bios_name) {
>>>>           bios_name = PROM_FILENAME;
>>>> +    }
>>>>       filename = qemu_find_file(QEMU_FILE_TYPE_BIOS, bios_name);
>>>> -    memory_region_add_subregion(sysmem, PROM_ADDR, bios);
>>>> -
>>>> -    /* Load OpenBIOS (ELF) */
>>>>       if (filename) {
>>>> -        bios_size = load_elf(filename, NULL, 0, NULL, NULL, NULL, NULL, 
>>>> NULL,
>>>> -                             1, PPC_ELF_MACHINE, 0, 0);
>>>> +        /* Load OpenBIOS (ELF) */
>>>> +        bios_size = load_elf(filename, NULL, NULL, NULL, NULL, 
>>>> &bios_addr,
>>>> +                             NULL, NULL, 1, PPC_ELF_MACHINE, 0, 0);
>>>> +        /* Unfortunately, load_elf sign-extends reading elf32 */
>>> 
>>> Maybe this is what translate_fn() is for?
>>> 
>>> uint64_t oldworld_phys(void *opaque, uint64_t addr)
>>> {
>>>    return addr & UINT32_MAX;
>>> }
>>> 
>>> Using as (untested):
>>> 
>>>        bios_size = load_elf(filename, NULL, oldworld_phys, NULL,
>>>                             NULL, &bios_addr, NULL,
>>>                             NULL, 1, PPC_ELF_MACHINE, 0, 0);
>> 
>> Please don't come up with any more great ideas for this patch unless you 
>> also propose a replacement and test it. This one works and we could just 
>> get this in as it is until the real problem with load_elf is fixed at which 
>> point all this can be removed so no need to be more sophisticated as the 
>> simple cast I have.
>
> Zoltan, I'm not trying to block your patch to get merged,

I didn't say you're trying to do that but based on my past experience any 
slightest doubt could result in that so I did not want it to miss another 
freeze now that it's almost got in.

> I'm asking because I'm trying to understand how this API
> is expected to be used.

Likely nobody knows, this seems to have been evolved into this mess which 
could be cleaned up but unrelated to this series. Probably nobody dared to 
touch it so far as it's used by almost every board so breling something is 
easy and testing it is difficult.

Regards,
BALATON Zoltan

>> As you can see in the original discussion:
>> 
>> http://patchwork.ozlabs.org/project/qemu-devel/patch/c69a791c7cad1246f3f34b3993dee4f549b75aa2.1593456926.git.balaton@eik.bme.hu/ 
>> 
>> problem is really in include/hw/elf_ops.h this is just a work around for 
>> that as I did not want to break anything I can't test so I'd rather fix it 
>> up here and let you fix load_elf then drop this cast. But unless you can do 
>> that before the freeze please don't hold up this patch any more.
>> 
>> Regards,
>> BALATON Zoltan
>> 
>>>> +        bios_addr = (uint32_t)bios_addr;
>>>> +
>>>> +        if (bios_size <= 0) {
>>>> +            /* or load binary ROM image */
>>>> +            bios_size = load_image_targphys(filename, PROM_BASE, 
>>>> PROM_SIZE);
>>>> +            bios_addr = PROM_BASE;
>>>> +        }
>>>>           g_free(filename);
>>>>       } else {
>>>>           bios_size = -1;
>>>>       }
>>>> -    if (bios_size < 0 || bios_size > BIOS_SIZE) {
>>>> +    if (bios_size < 0 || bios_addr - PROM_BASE + bios_size > PROM_SIZE) 
>>>> {
>>>>           error_report("could not load PowerPC bios '%s'", bios_name);
>>>>           exit(1);
>>>>       }
>>>> 
>>> 
>>> 
>>> 
>
>
--3866299591-445051963-1602971872=:60614--

