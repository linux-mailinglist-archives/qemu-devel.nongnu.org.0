Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D1C4F2F042E
	for <lists+qemu-devel@lfdr.de>; Sat,  9 Jan 2021 23:56:33 +0100 (CET)
Received: from localhost ([::1]:55344 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kyN9s-0003bZ-Fp
	for lists+qemu-devel@lfdr.de; Sat, 09 Jan 2021 17:56:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34874)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1kyN85-0001uh-9u; Sat, 09 Jan 2021 17:54:41 -0500
Received: from zero.eik.bme.hu ([152.66.115.2]:42129)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1kyN81-0006kB-ST; Sat, 09 Jan 2021 17:54:40 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 2F64674646C;
 Sat,  9 Jan 2021 23:54:32 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 6F69B74645F; Sat,  9 Jan 2021 23:54:31 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 6A56E74645B;
 Sat,  9 Jan 2021 23:54:31 +0100 (CET)
Date: Sat, 9 Jan 2021 23:54:31 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>
Subject: Re: [RFC PATCH 0/2] Pegasos2 emulation
In-Reply-To: <f3d46697-6371-9bd6-67b4-d1c1255fdcf3@amsat.org>
Message-ID: <acd2a1c4-a16d-6998-4744-e939b63a22c9@eik.bme.hu>
References: <cover.1609973005.git.balaton@eik.bme.hu>
 <fc421134-788a-4c62-db25-7e2453104539@eik.bme.hu>
 <f3d46697-6371-9bd6-67b4-d1c1255fdcf3@amsat.org>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-1061120116-1610232871=:51580"
X-Spam-Probability: 9%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-1061120116-1610232871=:51580
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Thu, 7 Jan 2021, Philippe Mathieu-Daudé wrote:
> On 1/7/21 2:15 AM, BALATON Zoltan wrote:
>> On Wed, 6 Jan 2021, BALATON Zoltan wrote:
>>> Hello,
>>>
>>> This is adding a new PPC board called pegasos2 currently posted as RFC
>>> because it depends on not yet merged VT8231 emulation currently on the
>>> list:
>>>
>>> https://patchew.org/QEMU/cover.1609967638.git.balaton@eik.bme.hu/
>
> This note ^^^ ...
>
>>>
>>> and may need some changes like a test case but I'm posting it now for
>>> getting feedback on what's needed to merge this. More info on it can
>>> be found at:
>>>
>>> https://osdn.net/projects/qmiga/wiki/SubprojectPegasos2
>>>
>>> Currently it needs a firmware ROM image that I cannot include due to
>>> original copyright holder (bPlan) did not release it under a free
>>> licence but I have plans to write a replacement in the future. With
>>> that firmware it can boot MorphOS now as:
>>>
>>> qemu-system-ppc -M pegasos2 -cdrom morphos.iso -device
>>> ati-vga,romfile="" -serial stdio
>>>
>>> then enter "boot cd boot.img" at the firmware "ok" prompt as described
>>> in the MorphOS.readme. To boot Linux use same command line with e.g.
>>> -cdrom debian-8.11.0-powerpc-netinst.iso then enter
>>> "boot cd install/pegasos"
>>>
>>> Patch 2 adds the actual board code after patch 1 adding MV64361 system
>>> controller chip. The mv643xx.h header file is taken from Linux and
>>> produces a bunch of checkpatch warnings due to different formatting
>>> rules it follows, I'm not sure we want to adopt it or keep it as it is
>>> given that it does not appear any more in recent Linux versions so we
>>> could reformat it as it's unlikely to get updated in the future.
>>
>> Interestingly it applies for patchew while this was accidentally based
>> on my previous series that has hw/ppc/Kconfig reverts so it does not
>> apply on current master.
>
> ... can be passed as hint to patchew as a tag:
>
> Based-on: <cover.1609967638.git.balaton@eik.bme.hu>
>
>> Also missing a file so does not compile but
>> other than that the content could be reviewed. I've now updated this repo:
>>
>> https://osdn.net/projects/qmiga/scm/git/qemu/tree/pegasos2/
>>
>> which contains all the needed patches over QEMU master at one place in
>> case somebody wants to try this. I'll send an updated version later
>> after I get some feedback.
>>
>> The command lines above also need -bios /path/to/firmware.rom
>
> An integration test similar to the Fuloong PMON would be highly
> appreciated :)
>
> https://www.mail-archive.com/qemu-devel@nongnu.org/msg752605.html

This does not seem to be in master so I could copy and modify. I also have 
no way to test this test so maybe you could help writing and testing the 
necessary module. Basically we need to download a boot iso from here:

https://www.morphos-team.net/morphos-3.15.iso

For the pegasos2.rom the easiest may be to extract it from an update still 
available here:

https://morph.zone/modules/newbb_plus/viewtopic.php?forum=11&topic_id=11892&post_id=129768&viewmode=flat&sortorder=0&showonepost=1

which links to

http://web.archive.org/web/20071021223056/http://www.bplan-gmbh.de/up050404/up050404

that has the actual file as the original site does not have it any more 
(used to be here: 
http://www.bplan-gmbh.de/flash_update_for_pegasos_ii_en.html ). Then the 
rom can be extracted with:

https://osdn.net/projects/qmiga/wiki/SubprojectPegasos2/attach/extract_rom_from_updater

To get a binary with MD5 sum 3248e02596480f2dba5944bd219ecfad

Then running it like this should produce the following output:

$ qemu-system-ppc -M pegasos2 -bios pegasos2.rom -device ati-vga,romfile="" -cdrom morphos-3.15.iso -serial stdio

PegasosII Boot Strap (c) 2002-2003 bplan GmbH
Running on CPU PVR:000C0209
Enable L1 ICache...                                                   Done.
Reading W83194 :                                                      FAILED.
Setting Front Side Bus to 133MHz...                                   FAILED.
Configuring DDR...                                                    Done.
Configuring PCI0...                                                   Done.
Configuring PCI1...                                                   Done.
Configuring ETH...                                                    Done.
Releasing IDE reset ...                                	              Done.
Configuring Legacy Devices
Initializing KBD...                                                   Done.
Testing 10000000 Bytes, Pass: 00000000 Failed: 00000000
RAM TEST (fill linear)...                                             Done.
FFFFFFFF

SmartFirmware:
cpu0: PowerPC,G4 CPUClock 599 Mhz BUSClock 133 Mhz (Version 0x000C,0x0209)
no/bad nvramrc - performing default startup script
channel 1 unit 0 : atapi | QEMU DVD-ROM                             | 2.5+ 
ATA device not present or not responding



Welcome to SmartFirmware(tm) for bplan Pegasos2 version 1.1 (20040405172512)
SmartFirmware(tm) Copyright 1996-2001 by CodeGen, Inc.
All Rights Reserved.
Pegasos BIOS Extensions Copyright 2001-2003 by bplan GmbH.
All Rights Reserved.
entering main read/eval loop...
ok boot cd boot.img
ISO-9660 filesystem:  System-ID: "MORPHOS"  Volume-ID: "MorphOSBoot"
Root dir: "" flags=0x2 extent=0x20 size=0x1800
Memory used before SYS_Init: 9MB


ABox 1.30 (2.7.2018) © 1999-2018 by Ralph Schmidt, Emmanuel Lesueur, Teemu Suikki, Harry Sintonen
PCI ATA/ATAPI Driver@2: PIO Mode 4
PCI ATA/ATAPI Driver@2: UDMA Mode 5
ide.device@2: QEMU     QEMU DVD-ROM     <CDROM>
ide.device@2:  CDRom <CD001>,<MORPHOS > found, bootable
ide.device@2:  Mount <CD0>
ide.device@2:  Partition <CD0> DosType 0x43444653 BootPri 127

Maybe you should wait for the "Welcome to SmartFirmware" banner or 
"entering main read/eval loop" followed by the "ok" prompt where you 
should send "boot cd boot.img" string then wait for the "ide.device@2: 
Mount <CD0>" string to confirm it found the boot CD at which point it 
should be working which also tests that via-ide DMA works (it it doesn't 
it won't find the CD). This tests mv64361, vt8231 (including via-ide 
half-native mode). Also uses ati-vga but that's already tested by other 
tests and these texts on serial do not confirm it works with ati-vga, 
that's just so you can also see it boot if you let it running further. The 
romfile="" is needed to disable vgabios-ati.bin which the firmware cannot 
handle.

Can you turn this into a python script implementing a test case based on 
your other similar tests? I think you have more experience with this and 
have a way to actually test it that I lack.

Regards,
BALATON Zoltan
--3866299591-1061120116-1610232871=:51580--

