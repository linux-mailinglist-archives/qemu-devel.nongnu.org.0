Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 90E7D4340A1
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Oct 2021 23:33:54 +0200 (CEST)
Received: from localhost ([::1]:44612 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcwk5-0004dn-7c
	for lists+qemu-devel@lfdr.de; Tue, 19 Oct 2021 17:33:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51674)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mcwgs-0003fD-HI
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 17:30:34 -0400
Received: from 1.mo552.mail-out.ovh.net ([178.32.96.117]:41663)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mcwgp-0005Q4-2m
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 17:30:34 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.143.124])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id B2E23226E4;
 Tue, 19 Oct 2021 21:30:17 +0000 (UTC)
Received: from kaod.org (37.59.142.96) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.15; Tue, 19 Oct
 2021 23:30:17 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-96R00127d04ebd-1c03-4b4a-81d4-ae27bb0dfbe3,
 C1B37E05FCF45C71ED02AF4B4DADDC6C35F6E2D2) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <51c1e658-a8ec-a41b-ef8f-a1677ea94f4a@kaod.org>
Date: Tue, 19 Oct 2021 23:30:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: Deprecate the ppc405 boards in QEMU?
Content-Language: en-US
To: Christophe Leroy <christophe.leroy@csgroup.eu>, BALATON Zoltan
 <balaton@eik.bme.hu>
References: <f0871969-190a-d15e-50d8-e6c1b1043652@ozlabs.ru>
 <881242de-fec8-3296-ffb4-36d2a551d21f@redhat.com>
 <e551634d-c6e7-c57-5b7f-b9ad8621824@eik.bme.hu>
 <119bc1c7-22e0-c455-9f34-57a7424f0c52@redhat.com>
 <a60b6ad-801c-6783-a81d-1d2b8ed97e34@eik.bme.hu>
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
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <17b48b89-ef2a-f38d-b081-a3e2ffc1ca67@csgroup.eu>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.96]
X-ClientProxiedBy: DAG6EX1.mxp5.local (172.16.2.51) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 6401547d-c074-46c4-9e4f-de1af50c307c
X-Ovh-Tracer-Id: 4100808935913720638
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvtddrvddvvddgudegiecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfhfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeeigedvffekgeeftedutddttdevudeihfegudffkeeitdekkeetkefhffelveelleenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehgrhhouhhgsehkrghougdrohhrgh
Received-SPF: pass client-ip=178.32.96.117; envelope-from=clg@kaod.org;
 helo=1.mo552.mail-out.ovh.net
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.074,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
 dbarboza@redhat.com, QEMU Developers <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, Greg Kurz <groug@kaod.org>,
 Alexander Graf <agraf@csgraf.de>, qemu-ppc <qemu-ppc@nongnu.org>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/19/21 18:12, Christophe Leroy wrote:
> 
> 
> Le 19/10/2021 à 16:56, BALATON Zoltan a écrit :
>> On Tue, 19 Oct 2021, Christophe Leroy wrote:
>>> Le 19/10/2021 à 15:44, Christophe Leroy a écrit :
>>>> There is something:
>>>>
>>>> => bootm 0
>>>> Wrong Image Format for bootm command
>>>> ERROR: can't get kernel image!
>>>>
>>>> => md 0
>>>> 00000000: 00000000 b497aae1 616e9207 003227a4    '..V....an...2'.
>>>> 00000010: 00000000 00000000 ee36255f 05070201    .........6%_....
>>>> 00000020: 4c696e75 782d352e 31352e30 2d726335    Linux-5.15.0-rc5
>>>> 00000030: 2d303232 32342d67 61336330 30376164    -02224-ga3c007ad
>>>> 00000040: 1f8b0800 00000000 0203ec5c 0f7013e7    ...........\.p..
>>>>
>>>> => mw.l 0 0x27051956
>>>>
>>>> => bootm 0
>>>> ## Booting kernel from Legacy Image at 00000000 ...
>>>>     Image Name:   Linux-5.15.0-rc5-02224-ga3c007ad
>>>>     Image Type:   PowerPC Linux Kernel Image (gzip compressed)
>>>>     Data Size:    3286948 Bytes = 3.1 MiB
>>>>     Load Address: 00000000
>>>>     Entry Point:  00000000
>>>>     Verifying Checksum ... Bad Data CRC
>>>> ERROR: can't get kernel image!
>>>>
>>>>
>>>> So we have something but it seems it gets overwritten by stuff.
>>>>
>>>> Anyway loading a uImage at 0 is just bad because it is a gzipped image that should get gunzipped at address 0.
>>>>
>>>> Or should we just copy the raw kernel at 0 and jump to the entry point ? But then we also need a device tree somewhere.
>>>>
>>>
>>> If I change KERNEL_LOAD_ADDR to 0x1000000, I can bootm at that address, and it seems it properly decompress the kernel:
>>>
>>> => bootm 0x1000000
>>> ## Booting kernel from Legacy Image at 01000000 ...
>>>   Image Name:   Linux-5.15.0-rc5-02224-ga3c007ad
>>>   Image Type:   PowerPC Linux Kernel Image (gzip compressed)
>>>   Data Size:    3296789 Bytes = 3.1 MiB
>>>   Load Address: 00000000
>>>   Entry Point:  00000000
>>>   Verifying Checksum ... OK
>>>   Uncompressing Kernel Image ... OK
>>>
>>>
>>> And it initialises the MMU properly.
>>>
>>> Then it gets stuck because there is no devicetree.
>>>
>>> (gdb) bt
>>> #0  0xc00094cc in udelay ()
>>> #1  0xc0025d34 in panic ()
>>> #2  0xc06415a0 in early_init_devtree ()
>>> #3  0xc0641da8 in machine_init ()
>>> #4  0xc0002200 in start_here ()
>>
>> Maybe you need to embed a dtb in your kernel if that's possible somehow? Or QEMU has a -dtb option that sets machine->dtb but you need board code to do something with it. See how it's done in other boards like virtex_ml507 and sam460ex. But maybe you'd be better off not using -kernel option as it seems to not really working for these 405 boards but load and start the kernel from u-boot. Not sure what device does u-boot support but QEMU can emulate usb-storage, network, different disks so something might work with u-boot if this board has any peripherals. If it doesn't emulate any peripherals what do you expect to do with the kernel once it boots?
>>
> 
> I should be able to build a multi-FIT image that embeds the kernel and the device tree.
> 
> I don't know about the peripherals, what I need it a kernel that is able to boot and run some user exe. I'm working on low level functionnalities like VMAP_STACK, STRICT_KERNEL_RWX, Userspace protection, etc ... I want to be able to check that after some modifications the kernel can still boot on every CPU sub-family, and I need to run LKDTM tests.
> 
> For this a kernel + initrd is enough.

hotfoot.dts is the only DT with a CPU model "PowerPC,405EP".

With cuImage.hotfoot,

U-Boot 2015.10-00236-g677f970bc6-dirty (Oct 06 2021 - 08:59:53 +0200)

CPU:   AMCC PowerPC 405EP Rev. B at 770 MHz (PLB=256 OPB=128 EBC=128)
        I2C boot EEPROM disabled
        Internal PCI arbiter enabled
        16 KiB I-Cache 16 KiB D-Cache
Board: Taihu - AMCC PPC405EP Evaluation Board
I2C:   ready
DRAM:  128 MiB
Flash: ## Unknown FLASH on Bank 0 - Size = 0x00000000 = 0 MB
## Unknown FLASH on Bank 1 - Size = 0x00000000 = 0 MB
0 Bytes
*** Warning - bad CRC, using default environment

PCI:   Bus Dev VenId DevId Class Int
PCI:
Net:   No ethernet found.

Type run flash_nfs to mount root filesystem over NFS

Hit any key to stop autoboot:  0
=> bootm 01000000
## Booting kernel from Legacy Image at 01000000 ...
    Image Name:   Linux-5.15.0-rc6-dirty
    Image Type:   PowerPC Linux Kernel Image (gzip compressed)
    Data Size:    3326878 Bytes = 3.2 MiB
    Load Address: 00700000
    Entry Point:  00701aa8
    Verifying Checksum ... OK
    Uncompressing Kernel Image ... OK
Memory <- <0x0 0x8000000> (128MB)
CPU clock-frequency <- 0x0 (0MHz)
CPU timebase-frequency <- 0x0 (0MHz)
/plb: clock-frequency <- 0 (0MHz)
/plb/opb: clock-frequency <- 0 (0MHz)
/plb/ebc: clock-frequency <- 0 (0MHz)
/plb/opb/serial@ef600300: clock-frequency <- 0 (0MHz)
/plb/opb/serial@ef600400: clock-frequency <- 0 (0MHz)
ethernet0: local-mac-address <- 00:00:00:00:00:00
ethernet1: local-mac-address <- 00:00:2d:e5:44:80
Fixing devtree for 4M Flash

zImage starting: loaded at 0x00700000 (sp: 0x07eaabb0)
Decompression error: 'Not a gzip file'
No valid compressed data found, assume uncompressed data
Allocating 0x6c128c bytes for kernel...
0x69e1ec bytes of uncompressed data copied

Linux/PowerPC load:
Finalizing device tree... flat tree at 0xdc5960
Linux version 5.15.0-rc6-dirty (legoater@yukon) (powerpc64-linux-gnu-gcc (GCC) 11.2.1 20210728 (Red Hat Cross 11.2.1-1), GNU ld version 2.35.2-1.fc34) #1 Tue Oct 19 15:15:21 CEST 2021
Using PowerPC 40x Platform machine description
printk: bootconsole [udbg0] enabled
-----------------------------------------------------
phys_mem_size     = 0x8000000
dcache_bsize      = 0x20
icache_bsize      = 0x20
cpu_features      = 0x0000000000000100
   possible        = 0x0000000000000100
   always          = 0x0000000000000100
cpu_user_features = 0x86000000 0x00000000
mmu_features      = 0x00000004
-----------------------------------------------------
Zone ranges:
   Normal   [mem 0x0000000000000000-0x0000000007ffffff]
Movable zone start for each node
Early memory node ranges
   node   0: [mem 0x0000000000000000-0x0000000007ffffff]
Initmem setup node 0 [mem 0x0000000000000000-0x0000000007ffffff]
MMU: Allocated 1088 bytes of context maps for 255 contexts
Built 1 zonelists, mobility grouping on.  Total pages: 32512
Kernel command line:
Dentry cache hash table entries: 16384 (order: 4, 65536 bytes, linear)
Inode-cache hash table entries: 8192 (order: 3, 32768 bytes, linear)
mem auto-init: stack:off, heap alloc:off, heap free:off
Kernel virtual memory layout:
   * 0xffbdf000..0xfffff000  : fixmap
   * 0xc9000000..0xffbdf000  : vmalloc & ioremap
Memory: 122948K/131072K available (5040K kernel code, 220K rwdata, 1320K rodata, 200K init, 136K bss, 8124K reserved, 0K cma-reserved)
SLUB: HWalign=32, Order=0-3, MinObjects=0, CPUs=1, Nodes=1
NR_IRQS: 512, nr_irqs: 512, preallocated irqs: 16
UIC0 (32 IRQ sources) at DCR 0xc0
random: get_random_u32 called from start_kernel+0x498/0x5f8 with crng_init=0



