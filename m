Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EBDF33E642
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 02:38:30 +0100 (CET)
Received: from localhost ([::1]:52702 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lML8n-0008Tz-LF
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 21:38:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51326)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1lML7R-0007TJ-4i; Tue, 16 Mar 2021 21:37:05 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:35342)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1lML7O-0004Q0-CX; Tue, 16 Mar 2021 21:37:04 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id AF2D97462DB;
 Wed, 17 Mar 2021 02:36:59 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 757397462BD; Wed, 17 Mar 2021 02:36:59 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 736F67456B4;
 Wed, 17 Mar 2021 02:36:59 +0100 (CET)
Date: Wed, 17 Mar 2021 02:36:59 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Subject: Re: [PATCH v9 0/7] Pegasos2 emulation
In-Reply-To: <da397519-f4ab-2d96-96bb-706d93d868ce@ilande.co.uk>
Message-ID: <a9934519-5698-60cb-8b39-7fcbee2de87@eik.bme.hu>
References: <cover.1615932192.git.balaton@eik.bme.hu>
 <da397519-f4ab-2d96-96bb-706d93d868ce@ilande.co.uk>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-596554705-1615945019=:79267"
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
Cc: Peter Maydell <peter.maydell@linaro.org>, f4bug@amsat.org,
 qemu-devel@nongnu.org, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-596554705-1615945019=:79267
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Wed, 17 Mar 2021, Mark Cave-Ayland wrote:
> On 16/03/2021 22:03, BALATON Zoltan wrote:
>
>> Hello,
>> 
>> This is adding a new PPC board called pegasos2. More info on it can be
>> found at:
>> 
>> https://osdn.net/projects/qmiga/wiki/SubprojectPegasos2
>> 
>> Currently it needs a firmware ROM image that I cannot include due to
>> original copyright holder (bPlan) did not release it under a free
>> licence but I have plans to write a replacement in the future. With
>> the original board firmware it can boot MorphOS now as:
>> 
>> qemu-system-ppc -M pegasos2 -cdrom morphos.iso -device ati-vga,romfile="" 
>> -serial stdio
>> 
>> then enter "boot cd boot.img" at the firmware "ok" prompt as described
>> in the MorphOS.readme. To boot Linux use same command line with e.g.
>> -cdrom debian-8.11.0-powerpc-netinst.iso then enter
>> "boot cd install/pegasos"
>> 
>> The last patch adds the actual board code after previous patches
>> adding VT8231 and MV64361 system controller chip emulation.
>> 
>> Regards,
>> BALATON Zoltan
>> 
>> v9: Rebased to master
>> 
>> v8: Do not emulate setting of serial port address via register, just
>>      hard code a default address instead
>> 
>> v7: Fix errp usage in patch 2
>> 
>> v6: Rebased on master, updated commit message about migration change
>> 
>> v5: Changes for review comments from David and Philippe
>> 
>> V4: Rename pegasos2_reset to pegasos2_cpu_reset
>>      Add new files to MAINTAINERS
>> 
>> BALATON Zoltan (6):
>>    vt82c686: QOM-ify superio related functionality
>>    vt82c686: Add VT8231_SUPERIO based on VIA_SUPERIO
>>    vt82c686: Introduce abstract TYPE_VIA_ISA and base vt82c686b_isa on it
>>    vt82c686: Add emulation of VT8231 south bridge
>>    hw/pci-host: Add emulation of Marvell MV64361 PPC system controller
>>    hw/ppc: Add emulation of Genesi/bPlan Pegasos II
>> 
>> Philippe Mathieu-Daudé (1):
>>    hw/isa/Kconfig: Add missing dependency VIA VT82C686 -> APM
>>
>>   MAINTAINERS                             |  10 +
>>   default-configs/devices/ppc-softmmu.mak |   2 +
>>   hw/isa/Kconfig                          |   1 +
>>   hw/isa/vt82c686.c                       | 422 +++++++++--
>>   hw/pci-host/Kconfig                     |   4 +
>>   hw/pci-host/meson.build                 |   2 +
>>   hw/pci-host/mv64361.c                   | 966 ++++++++++++++++++++++++
>>   hw/pci-host/mv643xx.h                   | 918 ++++++++++++++++++++++
>>   hw/pci-host/trace-events                |   6 +
>>   hw/ppc/Kconfig                          |   9 +
>>   hw/ppc/meson.build                      |   2 +
>>   hw/ppc/pegasos2.c                       | 144 ++++
>>   include/hw/isa/vt82c686.h               |   2 +-
>>   include/hw/pci-host/mv64361.h           |   8 +
>>   include/hw/pci/pci_ids.h                |   4 +-
>>   15 files changed, 2418 insertions(+), 82 deletions(-)
>>   create mode 100644 hw/pci-host/mv64361.c
>>   create mode 100644 hw/pci-host/mv643xx.h
>>   create mode 100644 hw/ppc/pegasos2.c
>>   create mode 100644 include/hw/pci-host/mv64361.h
>
> FWIW I've not really been involved in this patchset, but having had a quick 
> glance over it the QOM/device modelling and the general direction of the 
> patchset looks okay. For that reason I don't feel I'm the right person to 
> send a PR, particularly as I'm not regularly using the VIA devices and for 
> non-Mac PPC machines the final nod really should come from David.

Thanks for the review, I've updated comments and sent v10. David is away 
this week so maybe it's only Philippe now who could still take this series 
before it's too late for 6.0 (if it isn't already).

> The important part is that it doesn't regress existing machines using the VIA 
> devices: have you run it through Gitlab CI? Posting a link to a full green 
> pipeline in GitLab gives confidence to a maintainer for machines/devices that 
> are less common such as this that the code is stable and ready to merge.

These are adding new device model that's only used by the new machine. How 
could it regress anything? Those patches that changed existing devices are 
already upstream. Also if it touches anything that's fuloong2e which is 
harfly critical and was barely working before I've started to clean it up 
to be able to use it's devices as a basis for pegasos2. Lastly the freeze 
is for finding and fixing regressions but for that the series should first 
be allowed to get in to be tested more widely.

I don't know how to run Gitlab CI, I don't even have an account. Thought 
that's what maintainers are there for to run these tests.

Regards,
BALATON Zoltan
--3866299591-596554705-1615945019=:79267--

