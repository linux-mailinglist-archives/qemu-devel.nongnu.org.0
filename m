Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A61D434E28
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Oct 2021 16:42:58 +0200 (CEST)
Received: from localhost ([::1]:57144 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdCnx-0004kG-Dm
	for lists+qemu-devel@lfdr.de; Wed, 20 Oct 2021 10:42:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50564)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mdCkv-0001IE-Hh; Wed, 20 Oct 2021 10:39:49 -0400
Received: from smtpout4.mo529.mail-out.ovh.net ([217.182.185.173]:36737)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mdCkf-0001U9-2K; Wed, 20 Oct 2021 10:39:48 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.1.141])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 7BD0AC5E0EA6;
 Wed, 20 Oct 2021 16:39:28 +0200 (CEST)
Received: from kaod.org (37.59.142.97) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.15; Wed, 20 Oct
 2021 16:39:27 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-97G002cd6af1d7-e348-4da6-939d-7d704c3f5ad9,
 92A7CFA44A7A8A14732DBB4BB7777608D4B8F25C) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <d42a7e69-37e3-a888-4256-df70e7311746@kaod.org>
Date: Wed, 20 Oct 2021 16:39:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: Deprecate the ppc405 boards in QEMU?
Content-Language: en-US
To: LEROY Christophe <christophe.leroy@csgroup.eu>, BALATON Zoltan
 <balaton@eik.bme.hu>
References: <f0871969-190a-d15e-50d8-e6c1b1043652@ozlabs.ru>
 <7526ae07-0054-69df-c71f-8751858ef0db@redhat.com>
 <ad151b9d-27a7-bb5d-2cad-1196ceecfdd6@redhat.com> <YWQB1FMhQfmqRYxN@yekko>
 <bcdf63a4-8d22-8b25-d980-7fc574f80e82@redhat.com>
 <be84c7bf-47d3-1ba8-20ca-084a487db29d@csgroup.eu>
 <8c382ce4-f706-376c-289a-b8c64393decb@redhat.com>
 <880f4bde-19fc-1267-3a04-3d9efd660897@csgroup.eu>
 <c09d92d9-a5a3-328f-824c-07653f8e649@eik.bme.hu>
 <be7a734a-b88b-3130-fee8-398387fb65b4@redhat.com>
 <262b6af0-b5c5-1d28-2f48-7a021c5cd0b9@csgroup.eu>
 <a3d28088-2012-9450-5491-1de77d962da7@eik.bme.hu>
 <d8c9661e-4439-b3f8-48d8-b6f659e862c8@csgroup.eu>
 <5491ed41-7328-3949-12ad-1a94f0f525d1@csgroup.eu>
 <6be2745-2eb7-7b85-31c3-def20eb21f@eik.bme.hu>
 <17b48b89-ef2a-f38d-b081-a3e2ffc1ca67@csgroup.eu>
 <51c1e658-a8ec-a41b-ef8f-a1677ea94f4a@kaod.org>
 <a9b483e2-9176-2349-2478-faa15592c28b@csgroup.eu>
 <38de2462-17ea-0264-5606-6e07b129920d@kaod.org>
 <e63df215-aacc-b57b-6ed2-d63927060eb7@csgroup.eu>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <e63df215-aacc-b57b-6ed2-d63927060eb7@csgroup.eu>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.97]
X-ClientProxiedBy: DAG3EX2.mxp5.local (172.16.2.22) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: c7d4df42-8406-4331-9cba-8e6d78b33341
X-Ovh-Tracer-Id: 3035426152093879102
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvtddrvddvgedgjeehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepieegvdffkeegfeetuddttddtveduiefhgeduffekiedtkeekteekhfffleevleelnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrdeljeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepghhrohhugheskhgrohgurdhorhhg
Received-SPF: pass client-ip=217.182.185.173; envelope-from=clg@kaod.org;
 helo=smtpout4.mo529.mail-out.ovh.net
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) NICE_REPLY_A=-2.267, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 "dbarboza@redhat.com" <dbarboza@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, Greg Kurz <groug@kaod.org>,
 Alexander Graf <agraf@csgraf.de>, qemu-ppc <qemu-ppc@nongnu.org>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/20/21 15:27, LEROY Christophe wrote:
> 
> 
> Le 20/10/2021 à 12:10, Cédric Le Goater a écrit :
>> On 10/20/21 11:02, Christophe Leroy wrote:
>>>
>>>
>>> Le 19/10/2021 à 23:30, Cédric Le Goater a écrit :
>>>> On 10/19/21 18:12, Christophe Leroy wrote:
>>>>>
>>>>>
>>>>> Le 19/10/2021 à 16:56, BALATON Zoltan a écrit :
>>>>>> On Tue, 19 Oct 2021, Christophe Leroy wrote:
>>>>>>> Le 19/10/2021 à 15:44, Christophe Leroy a écrit :
>>>>>>>> There is something:
>>>>>>>>
>>>>>>>> => bootm 0
>>>>>>>> Wrong Image Format for bootm command
>>>>>>>> ERROR: can't get kernel image!
>>>>>>>>
>>>>>>>> => md 0
>>>>>>>> 00000000: 00000000 b497aae1 616e9207 003227a4    '..V....an...2'.
>>>>>>>> 00000010: 00000000 00000000 ee36255f 05070201    .........6%_....
>>>>>>>> 00000020: 4c696e75 782d352e 31352e30 2d726335    Linux-5.15.0-rc5
>>>>>>>> 00000030: 2d303232 32342d67 61336330 30376164    -02224-ga3c007ad
>>>>>>>> 00000040: 1f8b0800 00000000 0203ec5c 0f7013e7    ...........\.p..
>>>>>>>>
>>>>>>>> => mw.l 0 0x27051956
>>>>>>>>
>>>>>>>> => bootm 0
>>>>>>>> ## Booting kernel from Legacy Image at 00000000 ...
>>>>>>>>      Image Name:   Linux-5.15.0-rc5-02224-ga3c007ad
>>>>>>>>      Image Type:   PowerPC Linux Kernel Image (gzip compressed)
>>>>>>>>      Data Size:    3286948 Bytes = 3.1 MiB
>>>>>>>>      Load Address: 00000000
>>>>>>>>      Entry Point:  00000000
>>>>>>>>      Verifying Checksum ... Bad Data CRC
>>>>>>>> ERROR: can't get kernel image!
>>>>>>>>
>>>>>>>>
>>>>>>>> So we have something but it seems it gets overwritten by stuff.
>>>>>>>>
>>>>>>>> Anyway loading a uImage at 0 is just bad because it is a gzipped
>>>>>>>> image that should get gunzipped at address 0.
>>>>>>>>
>>>>>>>> Or should we just copy the raw kernel at 0 and jump to the entry
>>>>>>>> point ? But then we also need a device tree somewhere.
>>>>>>>>
>>>>>>>
>>>>>>> If I change KERNEL_LOAD_ADDR to 0x1000000, I can bootm at that
>>>>>>> address, and it seems it properly decompress the kernel:
>>>>>>>
>>>>>>> => bootm 0x1000000
>>>>>>> ## Booting kernel from Legacy Image at 01000000 ...
>>>>>>>    Image Name:   Linux-5.15.0-rc5-02224-ga3c007ad
>>>>>>>    Image Type:   PowerPC Linux Kernel Image (gzip compressed)
>>>>>>>    Data Size:    3296789 Bytes = 3.1 MiB
>>>>>>>    Load Address: 00000000
>>>>>>>    Entry Point:  00000000
>>>>>>>    Verifying Checksum ... OK
>>>>>>>    Uncompressing Kernel Image ... OK
>>>>>>>
>>>>>>>
>>>>>>> And it initialises the MMU properly.
>>>>>>>
>>>>>>> Then it gets stuck because there is no devicetree.
>>>>>>>
>>>>>>> (gdb) bt
>>>>>>> #0  0xc00094cc in udelay ()
>>>>>>> #1  0xc0025d34 in panic ()
>>>>>>> #2  0xc06415a0 in early_init_devtree ()
>>>>>>> #3  0xc0641da8 in machine_init ()
>>>>>>> #4  0xc0002200 in start_here ()
>>>>>>
>>>>>> Maybe you need to embed a dtb in your kernel if that's possible
>>>>>> somehow? Or QEMU has a -dtb option that sets machine->dtb but you
>>>>>> need board code to do something with it. See how it's done in other
>>>>>> boards like virtex_ml507 and sam460ex. But maybe you'd be better
>>>>>> off not using -kernel option as it seems to not really working for
>>>>>> these 405 boards but load and start the kernel from u-boot. Not
>>>>>> sure what device does u-boot support but QEMU can emulate
>>>>>> usb-storage, network, different disks so something might work with
>>>>>> u-boot if this board has any peripherals. If it doesn't emulate any
>>>>>> peripherals what do you expect to do with the kernel once it boots?
>>>>>>
>>>>>
>>>>> I should be able to build a multi-FIT image that embeds the kernel
>>>>> and the device tree.
>>>>>
>>>>> I don't know about the peripherals, what I need it a kernel that is
>>>>> able to boot and run some user exe. I'm working on low level
>>>>> functionnalities like VMAP_STACK, STRICT_KERNEL_RWX, Userspace
>>>>> protection, etc ... I want to be able to check that after some
>>>>> modifications the kernel can still boot on every CPU sub-family, and
>>>>> I need to run LKDTM tests.
>>>>>
>>>>> For this a kernel + initrd is enough.
>>>>
>>>> hotfoot.dts is the only DT with a CPU model "PowerPC,405EP".
>>>>
>>>> With cuImage.hotfoot,
>>>>
>>>> U-Boot 2015.10-00236-g677f970bc6-dirty (Oct 06 2021 - 08:59:53 +0200)
>>>>
>>>> CPU:   AMCC PowerPC 405EP Rev. B at 770 MHz (PLB=256 OPB=128 EBC=128)
>>>>          I2C boot EEPROM disabled
>>>>          Internal PCI arbiter enabled
>>>>          16 KiB I-Cache 16 KiB D-Cache
>>>> Board: Taihu - AMCC PPC405EP Evaluation Board
>>>> I2C:   ready
>>>> DRAM:  128 MiB
>>>> Flash: ## Unknown FLASH on Bank 0 - Size = 0x00000000 = 0 MB
>>>> ## Unknown FLASH on Bank 1 - Size = 0x00000000 = 0 MB
>>>> 0 Bytes
>>>> *** Warning - bad CRC, using default environment
>>>>
>>>> PCI:   Bus Dev VenId DevId Class Int
>>>> PCI:
>>>> Net:   No ethernet found.
>>>>
>>>> Type run flash_nfs to mount root filesystem over NFS
>>>>
>>>> Hit any key to stop autoboot:  0
>>>> => bootm 01000000
>>>> ## Booting kernel from Legacy Image at 01000000 ...
>>>>      Image Name:   Linux-5.15.0-rc6-dirty
>>>>      Image Type:   PowerPC Linux Kernel Image (gzip compressed)
>>>>      Data Size:    3326878 Bytes = 3.2 MiB
>>>>      Load Address: 00700000
>>>>      Entry Point:  00701aa8
>>>>      Verifying Checksum ... OK
>>>>      Uncompressing Kernel Image ... OK
>>>> Memory <- <0x0 0x8000000> (128MB)
>>>> CPU clock-frequency <- 0x0 (0MHz)
>>>> CPU timebase-frequency <- 0x0 (0MHz)
>>>> /plb: clock-frequency <- 0 (0MHz)
>>>> /plb/opb: clock-frequency <- 0 (0MHz)
>>>> /plb/ebc: clock-frequency <- 0 (0MHz)
>>>> /plb/opb/serial@ef600300: clock-frequency <- 0 (0MHz)
>>>> /plb/opb/serial@ef600400: clock-frequency <- 0 (0MHz)
>>>> ethernet0: local-mac-address <- 00:00:00:00:00:00
>>>> ethernet1: local-mac-address <- 00:00:2d:e5:44:80
>>>> Fixing devtree for 4M Flash
>>>>
>>>> zImage starting: loaded at 0x00700000 (sp: 0x07eaabb0)
>>>> Decompression error: 'Not a gzip file'
>>>> No valid compressed data found, assume uncompressed data
>>>> Allocating 0x6c128c bytes for kernel...
>>>> 0x69e1ec bytes of uncompressed data copied
>>>>
>>>> Linux/PowerPC load:
>>>> Finalizing device tree... flat tree at 0xdc5960
>>>> Linux version 5.15.0-rc6-dirty (legoater@yukon)
>>>> (powerpc64-linux-gnu-gcc (GCC) 11.2.1 20210728 (Red Hat Cross
>>>> 11.2.1-1), GNU ld version 2.35.2-1.fc34) #1 Tue Oct 19 15:15:21 CEST
>>>> 2021
>>>> Using PowerPC 40x Platform machine description
>>>> printk: bootconsole [udbg0] enabled
>>>> -----------------------------------------------------
>>>> phys_mem_size     = 0x8000000
>>>> dcache_bsize      = 0x20
>>>> icache_bsize      = 0x20
>>>> cpu_features      = 0x0000000000000100
>>>>     possible        = 0x0000000000000100
>>>>     always          = 0x0000000000000100
>>>> cpu_user_features = 0x86000000 0x00000000
>>>> mmu_features      = 0x00000004
>>>> -----------------------------------------------------
>>>> Zone ranges:
>>>>     Normal   [mem 0x0000000000000000-0x0000000007ffffff]
>>>> Movable zone start for each node
>>>> Early memory node ranges
>>>>     node   0: [mem 0x0000000000000000-0x0000000007ffffff]
>>>> Initmem setup node 0 [mem 0x0000000000000000-0x0000000007ffffff]
>>>> MMU: Allocated 1088 bytes of context maps for 255 contexts
>>>> Built 1 zonelists, mobility grouping on.  Total pages: 32512
>>>> Kernel command line:
>>>> Dentry cache hash table entries: 16384 (order: 4, 65536 bytes, linear)
>>>> Inode-cache hash table entries: 8192 (order: 3, 32768 bytes, linear)
>>>> mem auto-init: stack:off, heap alloc:off, heap free:off
>>>> Kernel virtual memory layout:
>>>>     * 0xffbdf000..0xfffff000  : fixmap
>>>>     * 0xc9000000..0xffbdf000  : vmalloc & ioremap
>>>> Memory: 122948K/131072K available (5040K kernel code, 220K rwdata,
>>>> 1320K rodata, 200K init, 136K bss, 8124K reserved, 0K cma-reserved)
>>>> SLUB: HWalign=32, Order=0-3, MinObjects=0, CPUs=1, Nodes=1
>>>> NR_IRQS: 512, nr_irqs: 512, preallocated irqs: 16
>>>> UIC0 (32 IRQ sources) at DCR 0xc0
>>>> random: get_random_u32 called from start_kernel+0x498/0x5f8 with
>>>> crng_init=0
>>>>
>>>
>>> Great.
>>>
>>> (gdb) bt
>>> #0  __div64_32 () at arch/powerpc/lib/div64.S:29
>>> #1  0xc00099bc in div128_by_32 (dividend_high=<optimized out>,
>>> dividend_low=<optimized out>, divisor=<optimized out>,
>>> dr=dr@entry=0xc0693f78) at arch/powerpc/kernel/time.c:1038
>>> #2  0xc0641060 in time_init () at arch/powerpc/kernel/time.c:978
>>> #3  0xc063dc48 in start_kernel () at init/main.c:1055
>>> #4  0xc0002204 in start_here () at arch/powerpc/kernel/head_40x.S:617
>>>
>>>
>>> Looping forever in __div64_32() due to:
>>>
>>>   > CPU clock-frequency <- 0x0 (0MHz)
>>>   > CPU timebase-frequency <- 0x0 (0MHz)
>>>   > /plb: clock-frequency <- 0 (0MHz)
>>>   > /plb/opb: clock-frequency <- 0 (0MHz)
>>>   > /plb/ebc: clock-frequency <- 0 (0MHz)
>>>   > /plb/opb/serial@ef600300: clock-frequency <- 0 (0MHz)
>>>   > /plb/opb/serial@ef600400: clock-frequency <- 0 (0MHz)
>>
>>
>> I dont understand how
>>
>>     static bd_t bd;
>>
>> can be updated in the kernel.
>>
> 
> It's not updated in the kernel.
> 
> It is supposed to be provided by UBoot to Linux Kernel. But modern
> kernels don't take that anymore, they take a device tree. For this
> reason cuboot takes the content of bd to build/update the device tree.
> 
> Looks like QEMU also provides the bd, see ref405ep_init()


yes. It is updated here :

     /* We put the bd structure at the top of memory */
     if (bd->bi_memsize >= 0x01000000UL)
         bdloc = 0x01000000UL - sizeof(struct ppc4xx_bd_info_t);
     else
         bdloc = bd->bi_memsize - sizeof(struct ppc4xx_bd_info_t);

then
        env->gpr[3] = bdloc;

The structure definitions are probably out of sync :/

> 
> I managed to get a kernel booting with the following change (and with
> CONFIG_ETHERNET removed)

Looks good.

Do you have a compatible builroot image ?

Thanks

C.


> 
> diff --git a/arch/powerpc/boot/cuboot-hotfoot.c
> b/arch/powerpc/boot/cuboot-hotfoot.c
> index 888a6b9bfead..63a9545ff55d 100644
> --- a/arch/powerpc/boot/cuboot-hotfoot.c
> +++ b/arch/powerpc/boot/cuboot-hotfoot.c
> @@ -132,6 +132,12 @@ void platform_init(unsigned long r3, unsigned long
> r4, unsigned long r5,
>                      unsigned long r6, unsigned long r7)
>    {
>           CUBOOT_INIT();
> +        bd.bi_intfreq = 133333333;
> +        bd.bi_busfreq = 33333333;
> +        bd.bi_procfreq = 133333333;
> +        bd.bi_plb_busfreq = 33333333;
> +        bd.bi_pci_busfreq = 33333333;
> +        bd.bi_opbfreq = 33333333;
>           platform_ops.fixups = hotfoot_fixups;
>            platform_ops.exit = ibm40x_dbcr_reset;
>           fdt_init(_dtb_start);
> 
> 
> Christophe
> 


