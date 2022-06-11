Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C0045477CF
	for <lists+qemu-devel@lfdr.de>; Sun, 12 Jun 2022 00:03:28 +0200 (CEST)
Received: from localhost ([::1]:52436 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o09CZ-0001qN-8r
	for lists+qemu-devel@lfdr.de; Sat, 11 Jun 2022 18:03:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46032)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1o09AN-0000DP-P2
 for qemu-devel@nongnu.org; Sat, 11 Jun 2022 18:01:12 -0400
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a]:44753)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1o09AI-0003XK-AU
 for qemu-devel@nongnu.org; Sat, 11 Jun 2022 18:01:08 -0400
Received: by mail-ej1-x62a.google.com with SMTP id kq6so4295218ejb.11
 for <qemu-devel@nongnu.org>; Sat, 11 Jun 2022 15:01:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=f2OQ+GjapzL/5KB9uCyfCOEOulTGSWGVMj6zIi0KI0c=;
 b=MCA4PYdG5JnkRi8cQZJUykSpGNjiUpJEFTA45I3tNnH+D9HN8u1OpAsLHwH0DnlSss
 RGwdxbAgQL2dz8shgqywdt59gA7h+0/4TKmo03IKWcyJOgWy0b+sn5PQ9EnM+6AnEuAB
 rELO7lI2bJsLJhB4RnTLGfjHn0hoTDHqHVfTO5xKyuMD6XRMvxFsB4JsA7Yb0H/lPaVC
 Uh+9x4Q7qoJgAcPbryC/3zMn4K2JkCpZ4j6Qqno4HL/HRMtNJ2uZLBds3zG+viJPIV/3
 pou2DYZopvby00V52Nd1MEmvgsxbzUrI2XTWI/k9UFb5HmEHKqqvZCzKQFS5QzVT6PXP
 XkJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=f2OQ+GjapzL/5KB9uCyfCOEOulTGSWGVMj6zIi0KI0c=;
 b=cDX3lNlDt+lkOf/t5WlUWB8YksUlijK9UtKCGLHifZE/uID99VmUqN6ys1/cIj/yUS
 kwPI6gAA7KiRLDvtdwbYwDkNC3O+bi9C+GooqG8dPPfiIwIL5cCKMw+YaTQlW66uu49/
 /tUZaQ1UeFT2ROPhkoaOUQbkdsdKqOeLGSIN8zMCwuy7oEM0WedMik9US+A66dj7oszO
 SiaYecH2RF543NUZXS1F20Qg5cO7+uFXAgyR4mIazA9h6jrHLl/dCFo+4tqBqmiEH1cS
 sTuwWdpNml/NrdzBQ6Tednm2hOb1VJrx/ZDAmTEz2uDh9g+KjOl/DnZF//AbQzH0yIcD
 mVyA==
X-Gm-Message-State: AOAM5302QxrAPF7zwAsuSWtTisuCNAD3eT8KuBDmEGXB7/gu0+PKz2VD
 6ih+RTVGfW44tSVqqEMVesrFn1pZzao=
X-Google-Smtp-Source: ABdhPJw1SfonDwGX+4Uar9tX7yYPfMVp2TnunG0EUPmaTyG5E5yOpGtKLr/K2m2WqDwJ37edJTbZdA==
X-Received: by 2002:a17:907:7241:b0:711:d911:2691 with SMTP id
 ds1-20020a170907724100b00711d9112691mr26917354ejc.626.1654984863857; 
 Sat, 11 Jun 2022 15:01:03 -0700 (PDT)
Received: from localhost.localdomain (124.net-94.228.4.isbl.embou.net.
 [94.228.4.124]) by smtp.gmail.com with ESMTPSA id
 w18-20020a1709061f1200b0070b1ecdc12bsm1549042ejj.112.2022.06.11.15.01.02
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sat, 11 Jun 2022 15:01:03 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
To: 
Cc: qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Bernhard Beschow <shentey@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PULL v2 00/50] MIPS patches for 2022-06-11
Date: Sun, 12 Jun 2022 00:00:52 +0200
Message-Id: <20220611220053.69027-1-philippe.mathieu.daude@gmail.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x62a.google.com
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

Hi Richard,

In case it is not too late, this v2 includes another fix from Bernhard
which was supposed to be in v1. Otherwise it will go in the next PR.

The following changes since commit 30796f556790631c86c733ab06756981be0e1def:

  Merge tag 'for_upstream' of git://git.kernel.org/pub/scm/virt/kvm/mst/qemu into staging (2022-06-10 18:15:34 -0700)

are available in the Git repository at:

  https://github.com/philmd/qemu.git tags/mips-20220611

for you to fetch changes up to 6e0c18598814bffb67204a90890fb7b34cad288a:

  docs/devel: Fix link to developer mailing lists (2022-06-11 23:50:35 +0200)

----------------------------------------------------------------
MIPS patches queue

- Various TCG fixes (Marcin Nowakowski, Ni Hui, Stefan Pejic, Stefan Pejic)
- Sysbus floppy controller fix (Peter Maydell)
- QOM'ification of PIIX southbridge (Mark Cave-Ayland, Bernhard Beschow)
- Various fixes on ISA devices commonly used by x86/mips machines (Bernhard)
- Few cleanups in accel/tcg & documentation (Bernhard)

----------------------------------------------------------------

Bernhard Beschow (24):
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
  hw/mips/boston: Initialize g_autofree pointers
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
 hw/mips/boston.c                         |   3 +-
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
 35 files changed, 335 insertions(+), 321 deletions(-)
 create mode 100644 include/hw/acpi/piix4.h

-- 
2.36.1


