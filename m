Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 436C2490BBA
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Jan 2022 16:48:41 +0100 (CET)
Received: from localhost ([::1]:47630 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9UFM-0008Dj-6T
	for lists+qemu-devel@lfdr.de; Mon, 17 Jan 2022 10:48:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33640)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1n9TMr-0003II-45
 for qemu-devel@nongnu.org; Mon, 17 Jan 2022 09:52:21 -0500
Received: from 5.mo548.mail-out.ovh.net ([188.165.49.213]:60485)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1n9TMo-0000kA-Pu
 for qemu-devel@nongnu.org; Mon, 17 Jan 2022 09:52:20 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.1.214])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id 5A7EC1FEBE;
 Mon, 17 Jan 2022 14:52:15 +0000 (UTC)
Received: from kaod.org (37.59.142.97) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Mon, 17 Jan
 2022 15:52:14 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-97G00248dfeba8-1840-4005-8502-1a0c8ef120a3,
 9556A11AC16C5E8FE4FF301E40865CB3D13C347E) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <8f70fc45-1f2f-ce23-f95e-cb4f8ac53ab9@kaod.org>
Date: Mon, 17 Jan 2022 15:52:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH qemu] spapr: Force 32bit when resetting a core
Content-Language: en-US
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, Alexey Kardashevskiy
 <aik@ozlabs.ru>, Greg Kurz <groug@kaod.org>, David Gibson
 <david@gibson.dropbear.id.au>
References: <20220107072423.2278113-1-aik@ozlabs.ru>
 <20220107125747.7ddfd3a0@bahia> <Ydgvt0VwFUP0MD5h@yekko>
 <20220107143910.4443af02@bahia>
 <4bad4da5-44b6-717c-7770-609ddd5256f0@ozlabs.ru>
 <989489c1-33f4-698c-01de-70f6f27cb51d@kaod.org>
 <89f6b051-2d7d-02cf-6de2-b1065bb5696b@ilande.co.uk>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <89f6b051-2d7d-02cf-6de2-b1065bb5696b@ilande.co.uk>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.97]
X-ClientProxiedBy: DAG9EX1.mxp5.local (172.16.2.81) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: b369f7b1-0e8c-4e07-b5d7-3fb57ab480bf
X-Ovh-Tracer-Id: 9412241746848680809
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvvddruddugdejtdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfhfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeefiedviefgtefhleeutefgvdeutefhleegledtteejveejueejhfeuieduheefvdenucffohhmrghinhepkhgvrhhnvghlrdhorhhgpdhgvghnthhoohdrohhrghenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtohepghhrohhugheskhgrohgurdhorhhg
Received-SPF: pass client-ip=188.165.49.213; envelope-from=clg@kaod.org;
 helo=5.mo548.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/15/22 15:21, Mark Cave-Ayland wrote:
> On 14/01/2022 14:12, Cédric Le Goater wrote:
> 
>> Yes, more info here :
>>
>> https://patchwork.kernel.org/project/qemu-devel/patch/1458121432-2855-1-git-send-email-lvivier@redhat.com/
>> mac99+970 only boots with a 64bit kernel. 32bit are not supported because
>> of the use of the rfi instruction which was removed in v2.01. 32bit user
>> space is supported though.
>>
>> However I was not able to build a disk with a compatible boot partition
>> for OpenBIOS. The above support only applies for kernel loaded in memory.
>> May be Mark knows how to do this ?
> 
> The Mac machines generally require a HFS filesystem for booting with OpenBIOS: it's a bit convoluted, but some instructions for grub can be found at https://wiki.gentoo.org/wiki/GRUB_on_Open_Firmware_(PowerPC).

Initially, I installed a debian11 ppc64 on a QEMU mac99/970 machine.
Something went wrong with the bootloader at installation and I was
stuck with memory boot. I didn't manage to restore a decent boot
setup even after that.

I stole the HFS partition from a real G5 and after some manual tweaks
on the disk, I got it working.

There are a few harmless errors :
     
     >> =============================================================
     >> OpenBIOS 1.1 [Jan 15 2022 14:23]
     >> Configuration device id QEMU version 1 machine id 3
     >> CPUs: 1
     >> Memory: 1024M
     >> UUID: 00000000-0000-0000-0000-000000000000
     >> CPU type PowerPC,970
     milliseconds isn't unique.
     Welcome to OpenBIOS v1.1 built on Jan 15 2022 14:23
     Trying hd:,\\:tbxi...
     >> switching to new context:
     call-method color!: exception -21
     >> call-method color! failed with error ffffffdf
     call-method color!: exception -21
     
     ...
     call-method block-size: exception -21
     >> call-method block-size failed with error ffffffdf
     call-method block-size: exception -21
     >> call-method block-size failed with error ffffffdf
     

I guess the initial problem is in the debian installer. I will report.

> I can certainly help out if you get stuck. If this is a more obscure combination 
> then is it worth adding a tiny image for use with avocado?

No. It is really a standard setup :

     root@vm02:~# mac-fdisk -l /dev/sda
     /dev/sda
             #                    type name                length   base    ( size )  system
     /dev/sda1     Apple_partition_map Apple                   63 @ 1       ( 31.5k)  Partition map
     /dev/sda2               Apple_HFS bootstrap           500001 @ 64      (244.1M)  HFS
     /dev/sda3         Apple_UNIX_SVR2 untitled           39634766 @ 500065  ( 18.9G)  Linux native
     /dev/sda4         Apple_UNIX_SVR2 swap               1808208 @ 40134831 (882.9M)  Linux swap
     /dev/sda5              Apple_Free Extra                    1 @ 41943039 (  0.5k)  Free space
     
     Block size=512, Number of Blocks=41943040
     DeviceType=0x0, DeviceId=0x0
     
     root@vm02:~# cat /proc/cpuinfo
     processor	: 0
     cpu		: PPC970, altivec supported
     clock		: 900.000000MHz
     revision	: 2.2 (pvr 0039 0202)
     
     timebase	: 100000000
     platform	: PowerMac
     model		: PowerMac3,1
     machine		: PowerMac3,1
     motherboard	: PowerMac3,1 MacRISC MacRISC2 Power Macintosh
     detected as	: 0 ((null))
     pmac flags	: 00000000
     pmac-generation	: NewWorld
     root@vm02:~# uname -a
     Linux vm02 5.15.0-2-powerpc64 #1 SMP Debian 5.15.5-2 (2021-12-18) ppc64 GNU/Linux
  

Thanks,

C.

