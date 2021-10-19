Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BBFD0433B79
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Oct 2021 18:01:11 +0200 (CEST)
Received: from localhost ([::1]:51542 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcrY6-00041w-RX
	for lists+qemu-devel@lfdr.de; Tue, 19 Oct 2021 12:01:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46838)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mcqY5-0007DK-7g; Tue, 19 Oct 2021 10:57:05 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:25675)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mcqY2-00063W-2i; Tue, 19 Oct 2021 10:57:04 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 4AAFD756022;
 Tue, 19 Oct 2021 16:56:58 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 1F7EE755FE6; Tue, 19 Oct 2021 16:56:58 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 1D545755F86;
 Tue, 19 Oct 2021 16:56:58 +0200 (CEST)
Date: Tue, 19 Oct 2021 16:56:58 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: Deprecate the ppc405 boards in QEMU?
In-Reply-To: <5491ed41-7328-3949-12ad-1a94f0f525d1@csgroup.eu>
Message-ID: <6be2745-2eb7-7b85-31c3-def20eb21f@eik.bme.hu>
References: <f0871969-190a-d15e-50d8-e6c1b1043652@ozlabs.ru>
 <3b1570d3-56f5-1184-239a-72791fc8ef83@redhat.com>
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
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-848428560-1634655418=:14130"
X-Spam-Probability: 9%
Received-SPF: pass client-ip=2001:738:2001:2001::2001;
 envelope-from=balaton@eik.bme.hu; helo=zero.eik.bme.hu
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 dbarboza@redhat.com, QEMU Developers <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, Greg Kurz <groug@kaod.org>,
 Alexander Graf <agraf@csgraf.de>, qemu-ppc <qemu-ppc@nongnu.org>,
 =?ISO-8859-15?Q?C=E9dric_Le_Goater?= <clg@kaod.org>,
 Cleber Rosa <crosa@redhat.com>,
 =?ISO-8859-15?Q?Herv=E9_Poussineau?= <hpoussin@reactos.org>,
 =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <philmd@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-848428560-1634655418=:14130
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Tue, 19 Oct 2021, Christophe Leroy wrote:
> Le 19/10/2021 à 15:44, Christophe Leroy a écrit :
>> There is something:
>> 
>> => bootm 0
>> Wrong Image Format for bootm command
>> ERROR: can't get kernel image!
>> 
>> => md 0
>> 00000000: 00000000 b497aae1 616e9207 003227a4    '..V....an...2'.
>> 00000010: 00000000 00000000 ee36255f 05070201    .........6%_....
>> 00000020: 4c696e75 782d352e 31352e30 2d726335    Linux-5.15.0-rc5
>> 00000030: 2d303232 32342d67 61336330 30376164    -02224-ga3c007ad
>> 00000040: 1f8b0800 00000000 0203ec5c 0f7013e7    ...........\.p..
>> 
>> => mw.l 0 0x27051956
>> 
>> => bootm 0
>> ## Booting kernel from Legacy Image at 00000000 ...
>>     Image Name:   Linux-5.15.0-rc5-02224-ga3c007ad
>>     Image Type:   PowerPC Linux Kernel Image (gzip compressed)
>>     Data Size:    3286948 Bytes = 3.1 MiB
>>     Load Address: 00000000
>>     Entry Point:  00000000
>>     Verifying Checksum ... Bad Data CRC
>> ERROR: can't get kernel image!
>> 
>> 
>> So we have something but it seems it gets overwritten by stuff.
>> 
>> Anyway loading a uImage at 0 is just bad because it is a gzipped image that 
>> should get gunzipped at address 0.
>> 
>> Or should we just copy the raw kernel at 0 and jump to the entry point ? 
>> But then we also need a device tree somewhere.
>> 
>
> If I change KERNEL_LOAD_ADDR to 0x1000000, I can bootm at that address, and 
> it seems it properly decompress the kernel:
>
> => bootm 0x1000000
> ## Booting kernel from Legacy Image at 01000000 ...
>   Image Name:   Linux-5.15.0-rc5-02224-ga3c007ad
>   Image Type:   PowerPC Linux Kernel Image (gzip compressed)
>   Data Size:    3296789 Bytes = 3.1 MiB
>   Load Address: 00000000
>   Entry Point:  00000000
>   Verifying Checksum ... OK
>   Uncompressing Kernel Image ... OK
>
>
> And it initialises the MMU properly.
>
> Then it gets stuck because there is no devicetree.
>
> (gdb) bt
> #0  0xc00094cc in udelay ()
> #1  0xc0025d34 in panic ()
> #2  0xc06415a0 in early_init_devtree ()
> #3  0xc0641da8 in machine_init ()
> #4  0xc0002200 in start_here ()

Maybe you need to embed a dtb in your kernel if that's possible somehow? 
Or QEMU has a -dtb option that sets machine->dtb but you need board code 
to do something with it. See how it's done in other boards like 
virtex_ml507 and sam460ex. But maybe you'd be better off not using -kernel 
option as it seems to not really working for these 405 boards but load and 
start the kernel from u-boot. Not sure what device does u-boot support but 
QEMU can emulate usb-storage, network, different disks so something might 
work with u-boot if this board has any peripherals. If it doesn't emulate 
any peripherals what do you expect to do with the kernel once it boots?

Regards,
BALATON Zoltan
--3866299591-848428560-1634655418=:14130--

