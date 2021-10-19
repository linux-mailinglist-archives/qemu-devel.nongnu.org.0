Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B473043400C
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Oct 2021 22:57:51 +0200 (CEST)
Received: from localhost ([::1]:58090 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcwBC-00006U-B1
	for lists+qemu-devel@lfdr.de; Tue, 19 Oct 2021 16:57:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44664)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mcw9P-0007by-0H
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 16:55:59 -0400
Received: from 7.mo548.mail-out.ovh.net ([46.105.33.25]:60909)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mcw9M-0007w1-Sw
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 16:55:58 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.1.93])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id 374012040F;
 Tue, 19 Oct 2021 20:55:52 +0000 (UTC)
Received: from kaod.org (37.59.142.105) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.15; Tue, 19 Oct
 2021 22:55:51 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-105G006a06a05af-792d-4482-8a27-816ace138ac6,
 5B5731C74782081D4A8FE9ECE1C2E20B2A30CE7F) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <85bb8afc-d22e-c127-85c7-a083848569ba@kaod.org>
Date: Tue, 19 Oct 2021 22:55:50 +0200
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
X-Originating-IP: [37.59.142.105]
X-ClientProxiedBy: DAG8EX2.mxp5.local (172.16.2.72) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 87337deb-e01c-4b66-929b-c8fac0b4773f
X-Ovh-Tracer-Id: 3519563110926224190
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvtddrvddvvddgudeflecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfhfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeeigedvffekgeeftedutddttdevudeihfegudffkeeitdekkeetkefhffelveelleenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepghhrohhugheskhgrohgurdhorhhg
Received-SPF: pass client-ip=46.105.33.25; envelope-from=clg@kaod.org;
 helo=7.mo548.mail-out.ovh.net
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.074,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
> 
> Thanks
> Christophe

If we don't need a loader, we are better off simplifying the 405 boards with
a simple init sequence such as :

     if (machine->kernel_filename) {
         hwaddr kernel_base = 0;
         int kernel_size = 0;
         hwaddr initrd_base = 0;
         int initrd_size = 0;

         kernel_size = load_elf(machine->kernel_filename, NULL, NULL, NULL,
                                &boot_entry, &kernel_base, NULL, NULL,
                                0 /* LE */, PPC_ELF_MACHINE, 0, 0);
         if (kernel_size < 0) {
             error_report("Could not load kernel '%s' : %s",
                          machine->kernel_filename, load_elf_strerror(kernel_size));
             exit(1);
         }

         if (machine->initrd_filename) {
             initrd_base = QEMU_ALIGN_UP(kernel_base + kernel_size, 0x10000);
             initrd_size = load_image_targphys(machine->initrd_filename,
                                               initrd_base, 16 * MiB /* Some value */);
             if (initrd_size < 0) {
                 error_report("Could not load initial ram disk '%s'",
                              machine->initrd_filename);
                 exit(1);
             }
         }

         if (machine->dtb) {
             dt_base = mw_dtb_load(machine, kernel_base, kernel_size, initrd_base,
                                   initrd_size);
         }
     }

We need to set the nip to 'boot_entry' and gpr[3] to 'dt_base'.

unless some pre-initialization of hw is required before running Linux ?

Thanks,

C.



