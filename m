Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AFDE616B12F
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Feb 2020 21:52:24 +0100 (CET)
Received: from localhost ([::1]:42198 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j6KiD-0007Ta-LX
	for lists+qemu-devel@lfdr.de; Mon, 24 Feb 2020 15:52:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48575)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1j6Keg-0000nB-E6
 for qemu-devel@nongnu.org; Mon, 24 Feb 2020 15:48:44 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1j6Kee-0005yt-Dn
 for qemu-devel@nongnu.org; Mon, 24 Feb 2020 15:48:42 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:51323
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1j6Kee-0005wS-8Y
 for qemu-devel@nongnu.org; Mon, 24 Feb 2020 15:48:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582577319;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=FOSoYpbAdepu0uZ7MeetEyTxVfAcL2F73lkW2jHly0I=;
 b=a9o3pVKmsx2XJYt7JyeUMwbdoP50/JSHeSBM4m4ydv8/2z3u/cVA/H8jWPk/+jpSPGVHcj
 CzJaXbG3nrU+D3fqMnOiCQt6gjV1zCul+HsEZ5YS99xRUm+GbGP1ASqZMAo9AqT5Jdp8Qd
 zYyp+EY9Y3X2XP5PC54G1BIN7x21yHI=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-329-NoPgk3VuOLWa66gxnSdpfA-1; Mon, 24 Feb 2020 15:48:33 -0500
X-MC-Unique: NoPgk3VuOLWa66gxnSdpfA-1
Received: by mail-wr1-f72.google.com with SMTP id o6so6142345wrp.8
 for <qemu-devel@nongnu.org>; Mon, 24 Feb 2020 12:48:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zqh7Kc1FIAfVASZ555lC66r1lz08tHa/s+hlekUQJWc=;
 b=UPpdTmJudMgdZ/EQNnzvsM9eIU+XNgrIo8LWEA/bIyJG3E45/jyV2j0jkWW+MN7ZSc
 Ns5uAiwulj5LbKlDzfd3YzJMgHCLs8It6dwIDBP39gahe/wun2Ro7+5q+i0PmvNzTPjO
 Q4Yv2DxsugDkRb57DcD7JoPykJNBCAeY/G06aWJcSQzi6GAkOY/pWA5JQPt5uBJ5tzuQ
 i3cE5piGtXzf0ofMZTZvDDQ/svGEIfmiUo19GTZpa+tKtUecH11aS1v6+mnC3Q0I7iZl
 1/Dk9AAIU1ELnCBbdPUcyFWcH7dLZCLa4hWCzilxBwRC1ay6arKdWi611h35C9nMFhmI
 vbHA==
X-Gm-Message-State: APjAAAWZ/oJmOR+PMK95b/LTnYIbtwmTeZQGtqNZi6huV3Mw92bMX8tn
 tNKTzeO7FjZOQyfG89djL7BqtSNEym0jjVxf5uhTxqZNskrLf//Y8rZun1Ykl/hFWQl0MCqxKS9
 Y4J06AVOtvV+XpF0=
X-Received: by 2002:a7b:c851:: with SMTP id c17mr789431wml.71.1582577312461;
 Mon, 24 Feb 2020 12:48:32 -0800 (PST)
X-Google-Smtp-Source: APXvYqzOAqJ/bsDamXUWT9imGi/21dT+6DCpU6L6WZPE8wurBeFi9b2oLNQpHPLbw9xCpM0fzp7zBw==
X-Received: by 2002:a7b:c851:: with SMTP id c17mr789344wml.71.1582577311276;
 Mon, 24 Feb 2020 12:48:31 -0800 (PST)
Received: from x1w.redhat.com (47.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.47])
 by smtp.gmail.com with ESMTPSA id t81sm863436wmg.6.2020.02.24.12.48.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Feb 2020 12:48:30 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Subject: [PATCH v2 00/32] hw: Sanitize various MemoryRegion uses
Date: Mon, 24 Feb 2020 21:47:56 +0100
Message-Id: <20200224204828.23167-1-philmd@redhat.com>
X-Mailer: git-send-email 2.21.1
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
Cc: Sagar Karandikar <sagark@eecs.berkeley.edu>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 KONRAD Frederic <frederic.konrad@adacore.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, Max Reitz <mreitz@redhat.com>,
 qemu-block@nongnu.org, Magnus Damm <magnus.damm@gmail.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Joel Stanley <joel@jms.id.au>, Palmer Dabbelt <palmer@dabbelt.com>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 Richard Henderson <rth@twiddle.net>, Artyom Tarasenko <atar4qemu@gmail.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 Fabien Chouteau <chouteau@adacore.com>, qemu-arm@nongnu.org,
 Peter Chubb <peter.chubb@nicta.com.au>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>, Kevin Wolf <kwolf@redhat.com>,
 qemu-riscv@nongnu.org, Igor Mitsyanko <i.mitsyanko@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>,
 Jean-Christophe Dubois <jcd@tribudubois.net>, Michael Walle <michael@walle.cc>,
 qemu-ppc@nongnu.org, Aleksandar Markovic <amarkovic@wavecomp.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This series simplifies various memory API calls when creating
memory regions.

Most of the patches are generated with Coccinelle semantic
patches (provided).
Few more cleanups added while writting the patches have been
added.

v1 was 'Let devices own the MemoryRegion they create':
https://www.mail-archive.com/qemu-devel@nongnu.org/msg681960.html

Since v1:
- understood a bit more Peter Maydell comments regarding
  how memory devices are migrated.

Supersedes: <20200221173049.18134-1-philmd@redhat.com>

Philippe Mathieu-Daud=C3=A9 (32):
  memory: Correctly return alias region type
  memory: Simplify memory_region_init_rom_nomigrate() to ease review
  scripts/cocci: Rename memory-region-{init-ram -> housekeeping}
  scripts/cocci: Patch to replace memory_region_init_{ram,readonly ->
    rom}
  hw/arm: Use memory_region_init_rom() with read-only regions
  hw/display: Use memory_region_init_rom() with read-only regions
  hw/mips: Use memory_region_init_rom() with read-only regions
  hw/m68k: Use memory_region_init_rom() with read-only regions
  hw/net: Use memory_region_init_rom() with read-only regions
  hw/pci-host: Use memory_region_init_rom() with read-only regions
  hw/ppc: Use memory_region_init_rom() with read-only regions
  hw/riscv: Use memory_region_init_rom() with read-only regions
  hw/sh4: Use memory_region_init_rom() with read-only regions
  hw/sparc: Use memory_region_init_rom() with read-only regions
  scripts/cocci: Patch to detect potential use of memory_region_init_rom
  hw/arm/stm32: Use memory_region_init_rom() with read-only regions
  hw/ppc/ppc405: Use memory_region_init_rom() with read-only regions
  hw/i386/pc_sysfw: Simplify using memory_region_init_alias()
  hw/i386/pc_sysfw: Remove unused 'ram_size' argument
  scripts/cocci: Patch to remove unnecessary
    memory_region_set_readonly()
  hw/arm: Remove unnecessary memory_region_set_readonly() on ROM alias
  scripts/cocci: Patch to let devices own their MemoryRegions
  hw/arm: Let devices own the MemoryRegion they create
  hw/char: Let devices own the MemoryRegion they create
  hw/core: Let devices own the MemoryRegion they create
  hw/display: Let devices own the MemoryRegion they create
  hw/dma: Let devices own the MemoryRegion they create
  hw/riscv: Let devices own the MemoryRegion they create
  hw/input/milkymist-softusb: Remove unused 'pmem_ptr' field
  hw/input/milkymist-softusb: Let devices own the MemoryRegion they
    create
  hw/net/milkymist-minimac2: Let devices own the MemoryRegion they
    create
  hw/block/onenand: Let devices own the MemoryRegion they create

 .../memory-region-housekeeping.cocci          | 159 ++++++++++++++++++
 .../coccinelle/memory-region-init-ram.cocci   |  38 -----
 hw/arm/exynos4210.c                           |  14 +-
 hw/arm/fsl-imx25.c                            |  10 +-
 hw/arm/fsl-imx31.c                            |   6 +-
 hw/arm/fsl-imx6.c                             |   6 +-
 hw/arm/fsl-imx6ul.c                           |   9 +-
 hw/arm/mainstone.c                            |   3 +-
 hw/arm/msf2-soc.c                             |   6 +-
 hw/arm/nrf51_soc.c                            |   2 +-
 hw/arm/omap_sx1.c                             |   6 +-
 hw/arm/palm.c                                 |   3 +-
 hw/arm/spitz.c                                |   3 +-
 hw/arm/stellaris.c                            |   3 +-
 hw/arm/stm32f205_soc.c                        |  11 +-
 hw/arm/stm32f405_soc.c                        |  12 +-
 hw/arm/tosa.c                                 |   3 +-
 hw/arm/xlnx-zynqmp.c                          |  11 +-
 hw/block/onenand.c                            |   7 +-
 hw/char/serial.c                              |   7 +-
 hw/core/platform-bus.c                        |   3 +-
 hw/display/cg3.c                              |   5 +-
 hw/display/g364fb.c                           |   3 +-
 hw/display/macfb.c                            |   4 +-
 hw/display/tcx.c                              |   5 +-
 hw/dma/i8257.c                                |   2 +-
 hw/dma/rc4030.c                               |   4 +-
 hw/i386/pc_sysfw.c                            |  29 +---
 hw/input/milkymist-softusb.c                  |  12 +-
 hw/m68k/q800.c                                |   3 +-
 hw/mips/mips_fulong2e.c                       |   3 +-
 hw/mips/mips_jazz.c                           |   6 +-
 hw/mips/mips_mipssim.c                        |   3 +-
 hw/mips/mips_r4k.c                            |   3 +-
 hw/net/dp8393x.c                              |   5 +-
 hw/net/milkymist-minimac2.c                   |   8 +-
 hw/pci-host/prep.c                            |   5 +-
 hw/ppc/mac_newworld.c                         |   3 +-
 hw/ppc/mac_oldworld.c                         |   3 +-
 hw/ppc/ppc405_boards.c                        |   6 +-
 hw/riscv/sifive_e.c                           |   9 +-
 hw/riscv/sifive_u.c                           |   2 +-
 hw/sh4/shix.c                                 |   3 +-
 hw/sparc/leon3.c                              |   3 +-
 memory.c                                      |  16 +-
 MAINTAINERS                                   |   1 +
 46 files changed, 268 insertions(+), 200 deletions(-)
 create mode 100644 scripts/coccinelle/memory-region-housekeeping.cocci
 delete mode 100644 scripts/coccinelle/memory-region-init-ram.cocci

--=20
2.21.1


