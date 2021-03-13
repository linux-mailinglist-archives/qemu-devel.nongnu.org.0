Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CBEFE339E40
	for <lists+qemu-devel@lfdr.de>; Sat, 13 Mar 2021 14:29:55 +0100 (CET)
Received: from localhost ([::1]:44512 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lL4L4-00019e-9a
	for lists+qemu-devel@lfdr.de; Sat, 13 Mar 2021 08:29:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33092)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1lL4Iz-0000bt-T0; Sat, 13 Mar 2021 08:27:45 -0500
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:23416)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1lL4Iu-0006IT-GU; Sat, 13 Mar 2021 08:27:45 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 9988A7456E3;
 Sat, 13 Mar 2021 14:27:32 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 60AE07456B8; Sat, 13 Mar 2021 14:27:32 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 5E1AA7456B7;
 Sat, 13 Mar 2021 14:27:32 +0100 (CET)
Date: Sat, 13 Mar 2021 14:27:32 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: qemu-devel@nongnu.org, qemu-ppc@nongnu.org
Subject: Re: [PATCH v7 0/8] Pegasos2 emulation
In-Reply-To: <cover.1615345138.git.balaton@eik.bme.hu>
Message-ID: <85548594-aaa1-8d3a-cedf-d2dd92f05028@eik.bme.hu>
References: <cover.1615345138.git.balaton@eik.bme.hu>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-1358279628-1615642052=:63687"
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 David Gibson <david@gibson.dropbear.id.au>, f4bug@amsat.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-1358279628-1615642052=:63687
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Wed, 10 Mar 2021, BALATON Zoltan wrote:
> Hello,

I've started posting this series well in advance to get it into 6.0 and 
yet it seems like it may be missing it due to organisational issues (no 
real complaints were found with patches but Philippe seems to like more 
review that does not seem to happen as nobody is interested). Looks like 
David is waiting for an ack from Philippe but will be away next week so if 
this is not resolved now it may be too late on Monday. To avoid that:

David, could you please send an ack before you leave for the last two 
patches so it could get committed via some other tree while you're away?

Philippe, if you can't ack the vt82c686 patches now are you OK with taking 
the whole series via your tree before the freeze? That would give you some 
more days to review and it could always be reverted during the freeze but 
if it's not merged now I'll have to wait until the summer to get it in 
again which would be another long delay. I don't think this will get more 
reviews unless it's in master and people can start using and testing it 
better.

Thank you,
BALATON Zoltan

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
> v7: Fix errp usage in patch 2
>
> v6: Rebased on master, updated commit message about migration change
>
> v5: Changes for review comments from David and Philippe
>
> V4: Rename pegasos2_reset to pegasos2_cpu_reset
>    Add new files to MAINTAINERS
>
> BALATON Zoltan (7):
>  vt82c686: Implement control of serial port io ranges via config regs
>  vt82c686: QOM-ify superio related functionality
>  vt82c686: Add VT8231_SUPERIO based on VIA_SUPERIO
>  vt82c686: Introduce abstract TYPE_VIA_ISA and base vt82c686b_isa on it
>  vt82c686: Add emulation of VT8231 south bridge
>  hw/pci-host: Add emulation of Marvell MV64361 PPC system controller
>  hw/ppc: Add emulation of Genesi/bPlan Pegasos II
>
> Philippe Mathieu-Daudé (1):
>  hw/isa/Kconfig: Add missing dependency VIA VT82C686 -> APM
>
> MAINTAINERS                             |  10 +
> default-configs/devices/ppc-softmmu.mak |   2 +
> hw/isa/Kconfig                          |   1 +
> hw/isa/vt82c686.c                       | 517 +++++++++++--
> hw/pci-host/Kconfig                     |   4 +
> hw/pci-host/meson.build                 |   2 +
> hw/pci-host/mv64361.c                   | 966 ++++++++++++++++++++++++
> hw/pci-host/mv643xx.h                   | 918 ++++++++++++++++++++++
> hw/pci-host/trace-events                |   6 +
> hw/ppc/Kconfig                          |   9 +
> hw/ppc/meson.build                      |   2 +
> hw/ppc/pegasos2.c                       | 144 ++++
> include/hw/isa/vt82c686.h               |   2 +-
> include/hw/pci-host/mv64361.h           |   8 +
> include/hw/pci/pci_ids.h                |   4 +-
> 15 files changed, 2512 insertions(+), 83 deletions(-)
> create mode 100644 hw/pci-host/mv64361.c
> create mode 100644 hw/pci-host/mv643xx.h
> create mode 100644 hw/ppc/pegasos2.c
> create mode 100644 include/hw/pci-host/mv64361.h
>
>
--3866299591-1358279628-1615642052=:63687--

