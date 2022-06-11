Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 683A45473C9
	for <lists+qemu-devel@lfdr.de>; Sat, 11 Jun 2022 12:35:52 +0200 (CEST)
Received: from localhost ([::1]:39032 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzyT9-0003Oe-1h
	for lists+qemu-devel@lfdr.de; Sat, 11 Jun 2022 06:35:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43112)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nzyQg-0001GL-Ns
 for qemu-devel@nongnu.org; Sat, 11 Jun 2022 06:33:19 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:34556)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nzyQe-00068m-Rb
 for qemu-devel@nongnu.org; Sat, 11 Jun 2022 06:33:18 -0400
Received: by mail-wr1-x436.google.com with SMTP id c21so1507904wrb.1
 for <qemu-devel@nongnu.org>; Sat, 11 Jun 2022 03:33:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=H1g6Y+FD79i6xIsYxaH+Ugqn9Uq3GI4oFgtY4f6BG3E=;
 b=qY+1u/DYpPbRrRk/dPl7D1BXbCYn5+/MCS5sGl19d+kLxULeh3F+MfPqBN9HD/iyGw
 Le4Bbm6mGZYwpM29rIvgsqKGYN7zj8HNnEjc8sLZoLq/IRZZmonuji3q6LWUF8dQT7l8
 M+OWO7jR/AUIHBTNGpriAYP22j/f7ccLJoNwhBUgoeUzcPrYxU9tM1w9EaqublHir7u8
 xlnPWiMx6HSw56LGrzW9KWPncz9FeqN/7yzMPq2lqHlB/5APIe7J+dTWUaCjyWsda6AI
 KGe16031kzF4jqbJihPHTWfoH8S/pg788JYcPGJd2ju80jeYbUGCroAS3M4dhBLDrE7m
 CyaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=H1g6Y+FD79i6xIsYxaH+Ugqn9Uq3GI4oFgtY4f6BG3E=;
 b=EGBMdJ0q7tmVlL3JH1+pqWgpTMK/rOY1jPxJAol7HKy6tm5oaW9mEDVNalUcF8Rl4S
 n2FgNluDqan9ng6XLrswSnyydJkghPC4zx95xmRipSjfhtBGgdgf32gnWaS/SDsE6dIT
 ylh0PkJeDGeSFLyBywyNSZ026K+JacFoJZM2J2KbgDry8kFymuUBvFUeouB1Qyn5Mb2a
 EADNMkjKm4FF8HuaH2uoaB7Lqqi9A0cZYFoSBk7qMBsg05gP3hXNq3epkhwnEXMo01Ge
 ZDy8k/H1M9b58xMGJxeQPRnt4+IhHDalLAKHDwpRJr2e+xtezdyDEO5Wiks+YILYFmzs
 9RnA==
X-Gm-Message-State: AOAM530Vd8H8teXAQlH1kT3cVV15LnUcO/eGKeDR26qV71av/EerJAgC
 /W9vtii2DU4+5rh8rcs44lL6fLEPP7k=
X-Google-Smtp-Source: ABdhPJz0j/MHJq6mqLrbdxO42wrnFkPFT5cmyMUw/wndjSqcG7fyNESIYnMhwXGnfEWDytN9W7HsOQ==
X-Received: by 2002:a5d:4302:0:b0:20e:66db:b8f5 with SMTP id
 h2-20020a5d4302000000b0020e66dbb8f5mr46299274wrq.320.1654943595023; 
 Sat, 11 Jun 2022 03:33:15 -0700 (PDT)
Received: from localhost.localdomain (124.net-94.228.4.isbl.embou.net.
 [94.228.4.124]) by smtp.gmail.com with ESMTPSA id
 f4-20020a056000128400b002184280b3cbsm2123032wrx.91.2022.06.11.03.33.13
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sat, 11 Jun 2022 03:33:14 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
To: qemu-devel@nongnu.org
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Stefan Pejic <stefan.pejic@syrmia.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PULL 00/49] MIPS patches for 2022-06-11
Date: Sat, 11 Jun 2022 12:32:23 +0200
Message-Id: <20220611103312.67773-1-philippe.mathieu.daude@gmail.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x436.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

The following changes since commit 30796f556790631c86c733ab06756981be0e1def:

  Merge tag 'for_upstream' of git://git.kernel.org/pub/scm/virt/kvm/mst/qemu into staging (2022-06-10 18:15:34 -0700)

are available in the Git repository at:

  https://github.com/philmd/qemu.git tags/mips-20220611

for you to fetch changes up to 37da3bcf01ccd19336fd8f43bedcd0841d71bb6a:

  docs/devel: Fix link to developer mailing lists (2022-06-11 11:44:50 +0200)

----------------------------------------------------------------
MIPS patches queue

- Various TCG fixes (Marcin Nowakowski, Ni Hui, Stefan Pejic, Stefan Pejic)
- Sysbus floppy controller fix (Peter Maydell)
- QOM'ification of PIIX southbridge (Mark Cave-Ayland, Bernhard Beschow)
- Various fixes on ISA devices commonly used by x86/mips machines (Bernhard)
- Few cleanups in accel/tcg & documentation (Bernhard)

----------------------------------------------------------------

Bernhard Beschow (23):
  hw/southbridge/piix: Aggregate all PIIX southbridge type names
  hw/isa/piix4: Use object_initialize_child() for embedded struct
  hw/isa/piix4: Move pci_map_irq_fn' near pci_set_irq_fn
  hw/isa/piix4: QOM'ify PCI device creation and wiring
  hw/isa/piix4: Factor out ISABus retrieval from piix4_create()
  hw/isa/piix4: QOM'ify PIIX4 PM creation
  hw/isa/piix4: Inline and remove piix4_create()
  hw/isa/piix3: Move pci_map_irq_fn near pci_set_irq_fn
  hw/isa/piix3: QOM'ify PCI device creation and wiring
  hw/isa/piix3: Factor out ISABus retrieval from piix3_create()
  hw/isa/piix3: Inline and remove piix3_create()
  hw/i386/microvm-dt: Force explicit failure if retrieving QOM property
    fails
  hw/i386/microvm-dt: Determine mc146818rtc's IRQ number from QOM
    property
  hw/rtc/mc146818rtc: QOM'ify io_base offset
  hw: Reuse TYPE_I8042 define
  hw/audio/cs4231a: Const'ify global tables
  hw/i386/pc: Unexport PC_CPU_MODEL_IDS macro
  hw/i386/pc: Unexport functions used only internally
  hw/i386/pc: Remove orphan declarations
  hw/net/fsl_etsec/etsec: Remove obsolete and unused etsec_create()
  accel/tcg/cpu-exec: Unexport dump_drift_info()
  accel/tcg: Inline dump_opcount_info() and remove it
  docs/devel: Fix link to developer mailing lists

Dragan Mladjenovic (4):
  target/mips: Fix emulation of nanoMIPS EXTRV_S.H instruction
  target/mips: Fix emulation of nanoMIPS BPOSGE32C instruction
  target/mips: Fix emulation of nanoMIPS BNEC[32] instruction
  target/mips: Fix handling of unaligned memory access for nanoMIPS ISA

Marcin Nowakowski (1):
  target/mips: Fix WatchHi.M handling

Mark Cave-Ayland (11):
  hw/acpi/piix4: move xen_enabled() logic from piix4_pm_init() to
    piix4_pm_realize()
  hw/acpi/piix4: change smm_enabled from int to bool
  hw/acpi/piix4: convert smm_enabled bool to qdev property
  hw/acpi/piix4: move PIIX4PMState into separate piix4.h header
  hw/acpi/piix4: alter piix4_pm_init() to return PIIX4PMState
  hw/acpi/piix4: rename piix4_pm_init() to piix4_pm_initfn()
  hw/acpi/piix4: use qdev gpio to wire up sci_irq
  hw/acpi/piix4: use qdev gpio to wire up smi_irq
  hw/i386/pc_piix: create PIIX4_PM device directly instead of using
    piix4_pm_initfn()
  hw/isa/piix4.c: create PIIX4_PM device directly instead of using
    piix4_pm_initfn()
  hw/acpi/piix4: remove unused piix4_pm_initfn() function

Ni Hui (6):
  target/mips: Fix SAT_S trans helper
  target/mips: Fix df_extract_val() and df_extract_df() dfe lookup
  target/mips: Fix msa checking condition in trans_msa_elm_fn()
  target/mips: Do not treat msa INSERT as NOP when wd is zero
  target/mips: Fix store adress of high 64bit in helper_msa_st_b()
  target/mips: Fix FTRUNC_S and FTRUNC_U trans helper

Peter Maydell (1):
  hw/block/fdc-sysbus: Always mark sysbus floppy controllers as not
    having DMA

Stefan Pejic (3):
  target/mips: Fix emulation of nanoMIPS MTHLIP instruction
  target/mips: Add missing default cases for some nanoMIPS pools
  target/mips: Undeprecate nanoMIPS ISA support in QEMU

 MAINTAINERS                              |   3 +-
 accel/tcg/cpu-exec.c                     |   4 +-
 accel/tcg/translate-all.c                |   5 -
 docs/about/deprecated.rst                |  30 ------
 docs/devel/submitting-a-patch.rst        |   6 +-
 hw/acpi/piix4.c                          |  77 +++------------
 hw/audio/cs4231a.c                       |   8 +-
 hw/block/fdc-sysbus.c                    |  16 +++-
 hw/i386/acpi-build.c                     |   1 +
 hw/i386/microvm-dt.c                     |   9 +-
 hw/i386/pc.c                             |  17 +++-
 hw/i386/pc_piix.c                        |  23 +++--
 hw/isa/piix3.c                           |  98 ++++++++++---------
 hw/isa/piix4.c                           | 116 ++++++++++++-----------
 hw/mips/jazz.c                           |   2 +-
 hw/mips/malta.c                          |   9 +-
 hw/net/fsl_etsec/etsec.c                 |  23 -----
 hw/net/fsl_etsec/etsec.h                 |   7 --
 hw/rtc/mc146818rtc.c                     |   9 +-
 hw/sparc64/sun4u.c                       |   2 +-
 include/exec/cpu-all.h                   |   3 -
 include/hw/acpi/piix4.h                  |  75 +++++++++++++++
 include/hw/block/fdc.h                   |   3 +-
 include/hw/i386/pc.h                     |  14 ---
 include/hw/isa/isa.h                     |   2 -
 include/hw/rtc/mc146818rtc.h             |   2 +-
 include/hw/southbridge/piix.h            |  12 +--
 target/mips/cpu.c                        |   2 +-
 target/mips/cpu.h                        |   3 +-
 target/mips/tcg/msa_helper.c             |   2 +-
 target/mips/tcg/msa_translate.c          |  29 +++---
 target/mips/tcg/nanomips_translate.c.inc |  33 ++++++-
 target/mips/tcg/sysemu/cp0_helper.c      |   3 +-
 target/mips/tcg/translate.c              |   5 +-
 34 files changed, 333 insertions(+), 320 deletions(-)
 create mode 100644 include/hw/acpi/piix4.h

-- 
2.36.1


