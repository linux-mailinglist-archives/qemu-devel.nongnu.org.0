Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B99671A60F7
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Apr 2020 00:51:20 +0200 (CEST)
Received: from localhost ([::1]:38068 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jNlRf-0001Fr-Ot
	for lists+qemu-devel@lfdr.de; Sun, 12 Apr 2020 18:51:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49123)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jNlIV-0008Pl-SW
 for qemu-devel@nongnu.org; Sun, 12 Apr 2020 18:41:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jNlIU-0005Y9-Jd
 for qemu-devel@nongnu.org; Sun, 12 Apr 2020 18:41:51 -0400
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:40126)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jNlIU-0005Wz-D9; Sun, 12 Apr 2020 18:41:50 -0400
Received: by mail-wr1-x444.google.com with SMTP id s8so8526750wrt.7;
 Sun, 12 Apr 2020 15:41:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=l6ERQM2wlsm2R7+WyxTeuOpkEQJddlJatKjqfQ/284o=;
 b=R8Intnu5zIBcNcExQIxzWgI0A29X6/izJd0hO4oWzjucOYuXUOcDPyjEiGwwHGlLb1
 8afiU4B0+nIUYpjXIHMNCzcFUBjYKk4QKNlId/bfJ5gWFNPaKTE06Z1pXaBxRpshoV/W
 90YDlUt2cviqVraB0+HjVshWsZzsOf5w+F0n1+Vo2nv5EG+yYLVpCtgS+LYGLF03f07l
 qO81GcuAQoxjZ7IHNoekRdHk/NoprKmMuuoztrVbeIG8sHzxgWds9RDebKy+/hnDsRHo
 jz5+4ZUcSCdip4cHKwl8sMp7vQ3wuJSSjn4U5Yho5AJ5bdjU2aIPG8Z+ZYGQ0FX/+CoN
 KrCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=l6ERQM2wlsm2R7+WyxTeuOpkEQJddlJatKjqfQ/284o=;
 b=XNwDILTrHxgjahTdF8dL3T+Zzr6SBY6ke2wFLA7qd2vyYRWyqUrLxg9kJqWSZNcQH8
 6hEGcyI/wif2WWfo1D8Ha9Z/5BdCL0hlPu/pT/QT6YMauwck2OKK95v9GDLylwxN0XUK
 2Ko34IFDlRXB+pj/fGCNCdm0MnOCLTTgFTcSdHgM3gHm+LDTW+z3RwJTu7RjuZvSTxa/
 Z+DVBWYvGNrBkirO4mrYoIXTFrWR03ASrhMjA/M4m3yV4GiBTWwYGXA8ViXAf2Mg60uJ
 epDH4mCdEcdFdNvS6JD4Rd4KzARW2AEaAmAdnzev/qIRxJb695vE5QL/LEzJA3DsfbqN
 AEUw==
X-Gm-Message-State: AGi0PuZ86CSuqWE2zK/l8muvaGRp8toEk0hzyYyvURr08KfuG8WOReyt
 4xiV6w9Nk2s+4oCpju/plQuG43aSgzwxTA==
X-Google-Smtp-Source: APiQypKpwsJXOAfSA4FazqkrAMrJI1xCSGGoAX22SuUNa4mTwgEOF2leXzkFQhSjJayUy+SPExSddw==
X-Received: by 2002:adf:916f:: with SMTP id
 j102mr15314870wrj.335.1586731308843; 
 Sun, 12 Apr 2020 15:41:48 -0700 (PDT)
Received: from localhost.localdomain (116.red-83-42-57.dynamicip.rima-tde.net.
 [83.42.57.116])
 by smtp.gmail.com with ESMTPSA id f63sm12083825wma.47.2020.04.12.15.41.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Apr 2020 15:41:48 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH-for-5.1 v3 00/23] various: Fix error-propagation with
 Coccinelle scripts (part 2)
Date: Mon, 13 Apr 2020 00:41:21 +0200
Message-Id: <20200412224144.12205-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::444
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
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>, qemu-block@nongnu.org,
 Markus Armbruster <armbru@redhat.com>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Max Reitz <mreitz@redhat.com>, Joel Stanley <joel@jms.id.au>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 Beniamino Galvani <b.galvani@gmail.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Richard Henderson <rth@twiddle.net>, Kevin Wolf <kwolf@redhat.com>,
 qemu-riscv@nongnu.org, Andrew Jeffery <andrew@aj.id.au>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>, Michael Walle <michael@walle.cc>,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This series is inspired of Peter Maydell fix [1]:
"hw/arm/xlnx-zynqmp.c: fix some error-handling code",
but grew after v1 [2] review :/

Markus: I added the cocci patches to your Error section, I hope
that's fine :)

Part 2: Add missing error_propagate() calls in DeviceClass::realize().

Regards,

Phil.

[1] https://www.mail-archive.com/qemu-devel@nongnu.org/msg691636.html
[2] https://www.mail-archive.com/qemu-devel@nongnu.org/msg692155.html
Based-on: <20200412223619.11284-1-f4bug@amsat.org>

Philippe Mathieu-Daudé (23):
  scripts/coccinelle: Catch missing error_propagate() calls in realize()
  hw/arm/fsl-imx: Add missing error-propagation code
  hw/arm/stm32f*05_soc: Add missing error-propagation code
  hw/arm/aspeed: Add missing error-propagation code
  hw/arm/allwinner-a10: Add missing error-propagation code
  hw/arm/msf2-soc: Add missing error-propagation code
  hw/riscv/sifive: Add missing error-propagation code
  hw/arm/armv7m: Add missing error-propagation code
  hw/intc/arm_gicv3_its_kvm: Add missing error-propagation code
  hw/microblaze/xlnx-zynqmp-pmu: Add missing error-propagation code
  hw/pci-host/pnv_phb3: Add missing error-propagation code
  hw/block/onenand: Add missing error-propagation code
  scripts/coccinelle: Add script to catch missing error_propagate()
    calls
  hw/arm/bcm2835_peripherals: Add missing error-propagation code
  hw/arm/fsl-imx: Add missing error-propagation code
  hw/arm/stm32fx05_soc: Add missing error-propagation code
  hw/dma/xilinx_axidma: Add missing error-propagation code
  hw/i386/x86: Add missing error-propagation code
  hw/mips/cps: Add missing error-propagation code
  hw/misc/macio/macio: Add missing error-propagation code
  hw/net/xilinx_axienet: Add missing error-propagation code
  hw/riscv/sifive_u: Add missing error-propagation code
  hw/sd/milkymist-memcard: Add missing error-propagation code

 .../add-missing-error_propagate.cocci         | 30 +++++++++++
 .../use-error_propagate-in-realize.cocci      | 54 +++++++++++++++++++
 hw/arm/allwinner-a10.c                        | 18 +++++--
 hw/arm/armv7m.c                               | 12 ++++-
 hw/arm/aspeed_ast2600.c                       | 36 ++++++++++---
 hw/arm/aspeed_soc.c                           | 12 ++++-
 hw/arm/bcm2835_peripherals.c                  |  8 +++
 hw/arm/fsl-imx25.c                            | 14 ++++-
 hw/arm/fsl-imx6.c                             | 26 +++++++--
 hw/arm/msf2-soc.c                             | 24 +++++++--
 hw/arm/stm32f205_soc.c                        | 10 +++-
 hw/arm/stm32f405_soc.c                        | 10 +++-
 hw/block/onenand.c                            |  6 ++-
 hw/dma/xilinx_axidma.c                        |  6 +++
 hw/i386/x86.c                                 |  4 ++
 hw/intc/arm_gicv3_its_kvm.c                   |  6 ++-
 hw/microblaze/xlnx-zynqmp-pmu.c               |  6 ++-
 hw/mips/cps.c                                 | 48 +++++++++++++++++
 hw/misc/macio/macio.c                         |  4 ++
 hw/net/xilinx_axienet.c                       |  6 +++
 hw/pci-host/pnv_phb3.c                        | 24 +++++++--
 hw/riscv/sifive_e.c                           |  6 ++-
 hw/riscv/sifive_u.c                           | 32 +++++++++--
 hw/sd/milkymist-memcard.c                     |  4 ++
 MAINTAINERS                                   |  2 +
 25 files changed, 373 insertions(+), 35 deletions(-)
 create mode 100644 scripts/coccinelle/add-missing-error_propagate.cocci
 create mode 100644 scripts/coccinelle/use-error_propagate-in-realize.cocci

-- 
2.21.1


