Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1616D33E299
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 01:28:01 +0100 (CET)
Received: from localhost ([::1]:55812 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMK2a-000798-4G
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 20:28:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40334)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lMK1G-0006aZ-IJ; Tue, 16 Mar 2021 20:26:38 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:33498
 helo=mail.default.ilande.uk0.bigv.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lMK1B-0006uu-PP; Tue, 16 Mar 2021 20:26:38 -0400
Received: from host86-148-103-84.range86-148.btcentralplus.com
 ([86.148.103.84] helo=[192.168.1.65])
 by mail.default.ilande.uk0.bigv.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lMK14-0006j5-Ca; Wed, 17 Mar 2021 00:26:32 +0000
To: BALATON Zoltan <balaton@eik.bme.hu>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
References: <cover.1615932192.git.balaton@eik.bme.hu>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-ID: <da397519-f4ab-2d96-96bb-706d93d868ce@ilande.co.uk>
Date: Wed, 17 Mar 2021 00:26:20 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <cover.1615932192.git.balaton@eik.bme.hu>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 86.148.103.84
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH v9 0/7] Pegasos2 emulation
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.uk0.bigv.io)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.uk0.bigv.io
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 David Gibson <david@gibson.dropbear.id.au>, f4bug@amsat.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 16/03/2021 22:03, BALATON Zoltan wrote:

> Hello,
> 
> This is adding a new PPC board called pegasos2. More info on it can be
> found at:
> 
> https://osdn.net/projects/qmiga/wiki/SubprojectPegasos2
> 
> Currently it needs a firmware ROM image that I cannot include due to
> original copyright holder (bPlan) did not release it under a free
> licence but I have plans to write a replacement in the future. With
> the original board firmware it can boot MorphOS now as:
> 
> qemu-system-ppc -M pegasos2 -cdrom morphos.iso -device ati-vga,romfile="" -serial stdio
> 
> then enter "boot cd boot.img" at the firmware "ok" prompt as described
> in the MorphOS.readme. To boot Linux use same command line with e.g.
> -cdrom debian-8.11.0-powerpc-netinst.iso then enter
> "boot cd install/pegasos"
> 
> The last patch adds the actual board code after previous patches
> adding VT8231 and MV64361 system controller chip emulation.
> 
> Regards,
> BALATON Zoltan
> 
> v9: Rebased to master
> 
> v8: Do not emulate setting of serial port address via register, just
>      hard code a default address instead
> 
> v7: Fix errp usage in patch 2
> 
> v6: Rebased on master, updated commit message about migration change
> 
> v5: Changes for review comments from David and Philippe
> 
> V4: Rename pegasos2_reset to pegasos2_cpu_reset
>      Add new files to MAINTAINERS
> 
> BALATON Zoltan (6):
>    vt82c686: QOM-ify superio related functionality
>    vt82c686: Add VT8231_SUPERIO based on VIA_SUPERIO
>    vt82c686: Introduce abstract TYPE_VIA_ISA and base vt82c686b_isa on it
>    vt82c686: Add emulation of VT8231 south bridge
>    hw/pci-host: Add emulation of Marvell MV64361 PPC system controller
>    hw/ppc: Add emulation of Genesi/bPlan Pegasos II
> 
> Philippe Mathieu-Daudé (1):
>    hw/isa/Kconfig: Add missing dependency VIA VT82C686 -> APM
> 
>   MAINTAINERS                             |  10 +
>   default-configs/devices/ppc-softmmu.mak |   2 +
>   hw/isa/Kconfig                          |   1 +
>   hw/isa/vt82c686.c                       | 422 +++++++++--
>   hw/pci-host/Kconfig                     |   4 +
>   hw/pci-host/meson.build                 |   2 +
>   hw/pci-host/mv64361.c                   | 966 ++++++++++++++++++++++++
>   hw/pci-host/mv643xx.h                   | 918 ++++++++++++++++++++++
>   hw/pci-host/trace-events                |   6 +
>   hw/ppc/Kconfig                          |   9 +
>   hw/ppc/meson.build                      |   2 +
>   hw/ppc/pegasos2.c                       | 144 ++++
>   include/hw/isa/vt82c686.h               |   2 +-
>   include/hw/pci-host/mv64361.h           |   8 +
>   include/hw/pci/pci_ids.h                |   4 +-
>   15 files changed, 2418 insertions(+), 82 deletions(-)
>   create mode 100644 hw/pci-host/mv64361.c
>   create mode 100644 hw/pci-host/mv643xx.h
>   create mode 100644 hw/ppc/pegasos2.c
>   create mode 100644 include/hw/pci-host/mv64361.h

FWIW I've not really been involved in this patchset, but having had a quick glance 
over it the QOM/device modelling and the general direction of the patchset looks 
okay. For that reason I don't feel I'm the right person to send a PR, particularly as 
I'm not regularly using the VIA devices and for non-Mac PPC machines the final nod 
really should come from David.

The important part is that it doesn't regress existing machines using the VIA 
devices: have you run it through Gitlab CI? Posting a link to a full green pipeline 
in GitLab gives confidence to a maintainer for machines/devices that are less common 
such as this that the code is stable and ready to merge.


ATB,

Mark.

