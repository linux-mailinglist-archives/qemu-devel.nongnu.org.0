Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A9B4B492142
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Jan 2022 09:34:02 +0100 (CET)
Received: from localhost ([::1]:50212 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9jwH-0003W0-O0
	for lists+qemu-devel@lfdr.de; Tue, 18 Jan 2022 03:34:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58078)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1n9jsr-0001Tq-Ke; Tue, 18 Jan 2022 03:30:29 -0500
Received: from [2001:41c9:1:41f::167] (port=52552
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1n9jsl-0005qf-Jb; Tue, 18 Jan 2022 03:30:28 -0500
Received: from [2a00:23c4:8ba0:4900:614:7796:ec2b:4f88]
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1n9jsA-0005qm-Qj; Tue, 18 Jan 2022 08:29:47 +0000
Message-ID: <e5c47ed6-f197-548d-e55c-cb07a59d019d@ilande.co.uk>
Date: Tue, 18 Jan 2022 08:30:05 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Alexey Kardashevskiy <aik@ozlabs.ru>, Greg Kurz <groug@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>
References: <20220107072423.2278113-1-aik@ozlabs.ru>
 <20220107125747.7ddfd3a0@bahia> <Ydgvt0VwFUP0MD5h@yekko>
 <20220107143910.4443af02@bahia>
 <4bad4da5-44b6-717c-7770-609ddd5256f0@ozlabs.ru>
 <989489c1-33f4-698c-01de-70f6f27cb51d@kaod.org>
 <89f6b051-2d7d-02cf-6de2-b1065bb5696b@ilande.co.uk>
 <8f70fc45-1f2f-ce23-f95e-cb4f8ac53ab9@kaod.org>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <8f70fc45-1f2f-ce23-f95e-cb4f8ac53ab9@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba0:4900:614:7796:ec2b:4f88
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH qemu] spapr: Force 32bit when resetting a core
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.bv.iomart.io)
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2001:41c9:1:41f::167
 (failed)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.bv.iomart.io
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RDNS_NONE=0.793, SPF_PASS=-0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=no autolearn_force=no
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

On 17/01/2022 14:52, Cédric Le Goater wrote:

> Initially, I installed a debian11 ppc64 on a QEMU mac99/970 machine.
> Something went wrong with the bootloader at installation and I was
> stuck with memory boot. I didn't manage to restore a decent boot
> setup even after that.

Interesting. I had a similar issue using the debian ports images on mac99/ppc32: 
everything went well all up until the bootloader installation which failed. When I 
looked at the installer logs IIRC there was a kernel panic somewhere in the hfs 
module which I figured is likely an emulation bug somewhere.

> I stole the HFS partition from a real G5 and after some manual tweaks
> on the disk, I got it working.
> 
> There are a few harmless errors :
>      >> =============================================================
>      >> OpenBIOS 1.1 [Jan 15 2022 14:23]
>      >> Configuration device id QEMU version 1 machine id 3
>      >> CPUs: 1
>      >> Memory: 1024M
>      >> UUID: 00000000-0000-0000-0000-000000000000
>      >> CPU type PowerPC,970
>      milliseconds isn't unique.
>      Welcome to OpenBIOS v1.1 built on Jan 15 2022 14:23
>      Trying hd:,\\:tbxi...
>      >> switching to new context:
>      call-method color!: exception -21
>      >> call-method color! failed with error ffffffdf
>      call-method color!: exception -21
>      ...
>      call-method block-size: exception -21
>      >> call-method block-size failed with error ffffffdf
>      call-method block-size: exception -21
>      >> call-method block-size failed with error ffffffdf
> 
> I guess the initial problem is in the debian installer. I will report.
> 
>> I can certainly help out if you get stuck. If this is a more obscure combination 
>> then is it worth adding a tiny image for use with avocado?
> 
> No. It is really a standard setup :
> 
>      root@vm02:~# mac-fdisk -l /dev/sda
>      /dev/sda
>              #                    type name                length   base    ( size )  
> system
>      /dev/sda1     Apple_partition_map Apple                   63 @ 1       ( 31.5k)  
> Partition map
>      /dev/sda2               Apple_HFS bootstrap           500001 @ 64      (244.1M)  
> HFS
>      /dev/sda3         Apple_UNIX_SVR2 untitled           39634766 @ 500065  ( 
> 18.9G)  Linux native
>      /dev/sda4         Apple_UNIX_SVR2 swap               1808208 @ 40134831 
> (882.9M)  Linux swap
>      /dev/sda5              Apple_Free Extra                    1 @ 41943039 (  
> 0.5k)  Free space
>      Block size=512, Number of Blocks=41943040
>      DeviceType=0x0, DeviceId=0x0
>      root@vm02:~# cat /proc/cpuinfo
>      processor    : 0
>      cpu        : PPC970, altivec supported
>      clock        : 900.000000MHz
>      revision    : 2.2 (pvr 0039 0202)
>      timebase    : 100000000
>      platform    : PowerMac
>      model        : PowerMac3,1
>      machine        : PowerMac3,1
>      motherboard    : PowerMac3,1 MacRISC MacRISC2 Power Macintosh
>      detected as    : 0 ((null))
>      pmac flags    : 00000000
>      pmac-generation    : NewWorld
>      root@vm02:~# uname -a
>      Linux vm02 5.15.0-2-powerpc64 #1 SMP Debian 5.15.5-2 (2021-12-18) ppc64 GNU/Linux

Fantastic! Glad everything is all working for you :)


ATB,

Mark.

