Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 65F7B51F0EB
	for <lists+qemu-devel@lfdr.de>; Sun,  8 May 2022 22:01:08 +0200 (CEST)
Received: from localhost ([::1]:50754 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nnn5W-00068j-LG
	for lists+qemu-devel@lfdr.de; Sun, 08 May 2022 16:01:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46532)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nnn1m-0004QT-3g
 for qemu-devel@nongnu.org; Sun, 08 May 2022 15:57:14 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:55110)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nnn1k-0006ws-Ac
 for qemu-devel@nongnu.org; Sun, 08 May 2022 15:57:13 -0400
Received: from [2a00:23c4:8ba4:3700:6895:4d68:6f22:ca1c] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nnn0k-0000yR-81; Sun, 08 May 2022 20:56:14 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: richard.henderson@linaro.org,
	deller@gmx.de,
	qemu-devel@nongnu.org
Date: Sun,  8 May 2022 20:55:57 +0100
Message-Id: <20220508195650.28590-1-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba4:3700:6895:4d68:6f22:ca1c
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PULL 00/53] qemu-sparc queue 20220508
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit f1336649156cf57f5d874a98e619fb362e3fcb59:

  Merge tag 'for-upstream' of https://gitlab.com/bonzini/qemu into staging (2022-05-07 06:14:16 -0500)

are available in the Git repository at:

  https://github.com/mcayland/qemu.git tags/qemu-sparc-20220508

for you to fetch changes up to 1f110516190f146df40f49aef2f1ef5903b8f540:

  artist: only render dirty scanlines on the display surface (2022-05-08 18:52:37 +0100)

----------------------------------------------------------------
qemu-sparc queue
- HPPA general improvements and tidy-ups
- artist minor fixes and performance improvement

----------------------------------------------------------------
Mark Cave-Ayland (53):
      dino: checkpatch fixes
      dino: move registers from dino_init() to DINO_PCI_BRIDGE init function
      dino: move PCI bus initialisation to dino_pcihost_init()
      dino: move PCI windows initialisation to dino_pcihost_init()
      dino: add memory-as property containing a link to the memory address space
      dino: move pci_setup_iommu() to dino_pcihost_init()
      dino: move PCI bus master address space setup to dino_pcihost_realize()
      dino: move initial register configuration to new dino_pcihost_reset() function
      dino: use QOM cast instead of directly referencing parent_obj
      dino: return PCIBus from dino_init() using qdev_get_child_bus()
      dino: split declarations from dino.c into dino.h
      hppa: use new CONFIG_HPPA_B160L option instead of CONFIG_DINO to build hppa machine
      dino: change dino_init() to return the DINO device instead of PCIBus
      machine.c: map DINO device during board configuration
      dino.h: add defines for DINO IRQ numbers
      dino: define IRQ inputs as qdev GPIOs
      dino: wire up serial IRQ using a qdev GPIO in machine.c
      dino: remove unused dino_set_timer_irq() IRQ handler
      hppa: move dino_init() from dino.c to machine.c
      dino: use numerical constant for iar0 and iar1 reset values
      dino: move DINO HPA constants from hppa_hardware.h to dino.h
      dino: move from hw/hppa to hw/pci-host
      lasi: checkpatch fixes
      lasi: move memory region initialisation to new lasi_init() function
      lasi: move register memory mapping from lasi.c to machine.c
      lasi: move initialisation of iar and rtc to new lasi_reset() function
      lasi: move LASIState and associated QOM structures to lasi.h
      lasi: replace lasi_get_irq() with defined constants
      lasi: define IRQ inputs as qdev GPIOs
      lasi: use qdev GPIOs to wire up IRQs in lasi_initfn()
      lasi: fix serial port initialisation
      lasi: update lasi_initfn() to return LASIState
      lasi: move LAN initialisation to machine.c
      lasi: move parallel port initialisation to machine.c
      lasi: move second serial port initialisation to machine.c
      lasi: move PS2 initialisation to machine.c
      lasi: remove address space parameter from lasi_initfn()
      lasi: move lasi_initfn() to machine.c
      lasi: use constants for device register offsets
      lasi: use numerical constant for iar reset value
      hppa: move device headers from hppa_sys.h into individual .c files
      lasi: move from hw/hppa to hw/misc
      hppa: move hppa_pci_ignore_ops from pci.c to machine.c
      hppa: remove hw/hppa/pci.c
      hppa: remove unused trace-events from from hw/hppa
      hppa: move enable_lan() define from hppa_sys.h to machine.c
      hppa: remove the empty hppa_sys.h file
      hppa: use MACHINE QOM macros for defining the hppa machine
      hppa: fold machine_hppa_machine_init() into machine_hppa_machine_init_class_init()
      hppa: simplify machine function names in machine.c
      artist: checkpatch and newline style fixes
      artist: remove unused ROP8OFF() macro
      artist: only render dirty scanlines on the display surface

 MAINTAINERS                              |   4 +
 configs/devices/hppa-softmmu/default.mak |   2 +-
 hw/display/artist.c                      |  33 ++---
 hw/hppa/Kconfig                          |   5 +-
 hw/hppa/hppa_hardware.h                  |   5 -
 hw/hppa/hppa_sys.h                       |  24 ----
 hw/hppa/machine.c                        | 124 ++++++++++++++---
 hw/hppa/meson.build                      |   2 +-
 hw/hppa/pci.c                            |  88 ------------
 hw/hppa/trace-events                     |  14 --
 hw/misc/Kconfig                          |   3 +
 hw/{hppa => misc}/lasi.c                 | 161 +++++----------------
 hw/misc/meson.build                      |   3 +
 hw/misc/trace-events                     |   5 +
 hw/pci-host/Kconfig                      |   4 +
 hw/{hppa => pci-host}/dino.c             | 231 ++++++++++---------------------
 hw/pci-host/meson.build                  |   3 +
 hw/pci-host/trace-events                 |   5 +
 include/hw/misc/lasi.h                   |  78 +++++++++++
 include/hw/pci-host/dino.h               | 146 +++++++++++++++++++
 meson.build                              |   1 -
 21 files changed, 477 insertions(+), 464 deletions(-)
 delete mode 100644 hw/hppa/hppa_sys.h
 delete mode 100644 hw/hppa/pci.c
 delete mode 100644 hw/hppa/trace-events
 rename hw/{hppa => misc}/lasi.c (60%)
 rename hw/{hppa => pci-host}/dino.c (71%)
 create mode 100644 include/hw/misc/lasi.h
 create mode 100644 include/hw/pci-host/dino.h

