Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 760A06117B0
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Oct 2022 18:41:30 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ooSOu-0002Io-1O; Fri, 28 Oct 2022 12:40:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1ooSOr-00028G-OZ; Fri, 28 Oct 2022 12:40:05 -0400
Received: from mail-ot1-x334.google.com ([2607:f8b0:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1ooSOo-0007Tt-Os; Fri, 28 Oct 2022 12:40:05 -0400
Received: by mail-ot1-x334.google.com with SMTP id
 16-20020a9d0490000000b0066938311495so3272148otm.4; 
 Fri, 28 Oct 2022 09:40:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=6QSvGxilaBZmgmGUT4rVPXb+ngh/0vHUAIxGS4J1cp0=;
 b=JT+DgHir5f+NZFzShU0wzMwsbTK61bEH7qlItOeNE39IbzvZgGWrbLYC3gsSHvURlt
 4ZxJUkTWMkv8lEdO/m2rRWQs5T1pT5ROWo7t3/iCoo+PK4+PIQnY5gBrJeJJgpG5fBHY
 nhJMY6USkUncAV0AWAhYfiRT5FinYn0C4JegMveqvOB4+mfBHKrfTVTpA8wQrrF11bN3
 9jSU/dUnGGrOk5phhYokXaaSRWEFfcBBO2OnZVOBjs3n00AVEc7q7d79qhNdshsMXmUc
 bfov3a491m/wDJHF8PCyqE8aFL+C/D5wtHd7lTyFqxqrcF1Ftkf6CZuXivhwG4A3AbkX
 rQng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6QSvGxilaBZmgmGUT4rVPXb+ngh/0vHUAIxGS4J1cp0=;
 b=rmYFUICNRIVsqYhoz3mx2ccCuIexTf5XW31lOmn1h9sPSnI0ZzaSvsgGhZk6ox3+HE
 T9djIeIIMMggQg3UFLeIUrgrADo36jNRMqnrIIcrZEAg2cdj7lCtHnlHXf/MSAnG5VT/
 pOIodtaqZaDiSGVObXkU3BOnNrGvREuEDB2hwuVqGF7LId/p2HWBac1gXUbSqZ0W72Wn
 uqHH7uaNlwFYVVeOC0s21Xu6Bt6lNrHeOQRsvy49pkSVbqY8pHwzClxYrwX6336hEsRv
 IfStdeppVcaY+FsM6gN1DPQ8tcjWF7HxgFcaxBwjWNMeQPVpI1LYH7Gv6XZs7kAj9CsZ
 oSQw==
X-Gm-Message-State: ACrzQf0j/f6/04sCz/P9C/Hfm/sP47ZoC3R6H4n9v+n4KSXEMqIPp826
 8aaToflKWg/2nBhjROsBj0KEXs0iR1ydUQ==
X-Google-Smtp-Source: AMsMyM6xxwisxVpYMvVQ91hEcGMugBqC5Ivntpbgn0dvKLnaKGN3jYcqTzbFHTiFTY4QurIntchlmw==
X-Received: by 2002:a9d:198c:0:b0:661:aa2e:1aa0 with SMTP id
 k12-20020a9d198c000000b00661aa2e1aa0mr118583otk.154.1666975200291; 
 Fri, 28 Oct 2022 09:40:00 -0700 (PDT)
Received: from balboa.COMFAST ([177.45.165.63])
 by smtp.gmail.com with ESMTPSA id
 s127-20020acaa985000000b00354b7120d60sm1658373oie.52.2022.10.28.09.39.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Oct 2022 09:39:59 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, stefanha@redhat.com,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PULL 00/62] ppc queue
Date: Fri, 28 Oct 2022 13:38:49 -0300
Message-Id: <20221028163951.810456-1-danielhb413@gmail.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::334;
 envelope-from=danielhb413@gmail.com; helo=mail-ot1-x334.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

The following changes since commit 344744e148e6e865f5a57e745b02a87e5ea534ad:

  Merge tag 'dump-pull-request' of https://gitlab.com/marcandre.lureau/qemu into staging (2022-10-26 10:53:49 -0400)

are available in the Git repository at:

  https://gitlab.com/danielhb/qemu.git tags/pull-ppc-20221028

for you to fetch changes up to 1a4ef9d45dbe6be588735a989e8ed3764a2fcf49:

  hw/ppc/e500: Implement pflash handling (2022-10-28 13:26:20 -0300)

----------------------------------------------------------------
ppc patch queue for 2022-10-28:

This queue has the second part of the ppc4xx_sdram cleanups, doorbell
instructions for POWER8 and new pflash handling for the e500 machine.

It also has a lot of performance optimizations in the PowerPC emulation
done by the researchers of the Eldorado institute. Between using gvec
for VMX/VSX instructions, a full rework of the interrupt model and PMU
optimizations, they managed to drastically speed up the emulation of
powernv8/9/10 machines.  Here's an example with avocado tests:

- with master:

tests/avocado/boot_linux_console.py:BootLinuxConsole.test_ppc_powernv8:
PASS (38.89 s)
tests/avocado/boot_linux_console.py:BootLinuxConsole.test_ppc_powernv9:
PASS (43.89 s)

- with this queue applied:

tests/avocado/boot_linux_console.py:BootLinuxConsole.test_ppc_powernv8:
PASS (21.23 s)
tests/avocado/boot_linux_console.py:BootLinuxConsole.test_ppc_powernv9:
PASS (22.58 s)

Other ppc machines, like pseries, also had a noticeable performance
boost.

----------------------------------------------------------------
BALATON Zoltan (8):
      ppc440_uc.c: Move DDR2 SDRAM controller model to ppc4xx_sdram.c
      ppc4xx_devs.c: Move DDR SDRAM controller model to ppc4xx_sdram.c
      ppc4xx_sdram: Move ppc4xx_sdram_banks() to ppc4xx_sdram.c
      ppc4xx_sdram: Use hwaddr for memory bank size
      ppc4xx_sdram: Rename local state variable for brevity
      ppc4xx_sdram: Generalise bank setup
      ppc4xx_sdram: Convert DDR SDRAM controller to new bank handling
      ppc4xx_sdram: Add errp parameter to ppc4xx_sdram_banks()

Bernhard Beschow (5):
      docs/system/ppc/ppce500: Use qemu-system-ppc64 across the board(s)
      hw/block/pflash_cfi0{1, 2}: Error out if device length isn't a power of two
      hw/sd/sdhci-internal: Unexport ESDHC defines
      hw/sd/sdhci: Rename ESDHC_* defines to USDHC_*
      hw/ppc/e500: Implement pflash handling

Leandro Lupori (2):
      target/ppc: Add new PMC HFLAGS
      target/ppc: Increment PMC5 with inline insns

Lucas Mateus Castro (alqotel) (12):
      target/ppc: Moved VMLADDUHM to decodetree and use gvec
      target/ppc: Move VMH[R]ADDSHS instruction to decodetree
      target/ppc: Move V(ADD|SUB)CUW to decodetree and use gvec
      target/ppc: Move VNEG[WD] to decodtree and use gvec
      target/ppc: Move VPRTYB[WDQ] to decodetree and use gvec
      target/ppc: Move VAVG[SU][BHW] to decodetree and use gvec
      target/ppc: Move VABSDU[BHW] to decodetree and use gvec
      target/ppc: Use gvec to decode XV[N]ABS[DS]P/XVNEG[DS]P
      target/ppc: Use gvec to decode XVCPSGN[SD]P
      target/ppc: Moved XVTSTDC[DS]P to decodetree
      target/ppc: Moved XSTSTDC[QDS]P to decodetree
      target/ppc: Use gvec to decode XVTSTDC[DS]P

Matheus Ferst (35):
      target/ppc: fix msgclr/msgsnd insns flags
      target/ppc: fix msgsync insns flags
      target/ppc: fix REQUIRE_HV macro definition
      target/ppc: move msgclr/msgsnd to decodetree
      target/ppc: move msgclrp/msgsndp to decodetree
      target/ppc: move msgsync to decodetree
      target/ppc: define PPC_INTERRUPT_* values directly
      target/ppc: always use ppc_set_irq to set env->pending_interrupts
      target/ppc: split interrupt masking and delivery from ppc_hw_interrupt
      target/ppc: prepare to split interrupt masking and delivery by excp_model
      target/ppc: create an interrupt masking method for POWER9/POWER10
      target/ppc: remove unused interrupts from p9_next_unmasked_interrupt
      target/ppc: create an interrupt deliver method for POWER9/POWER10
      target/ppc: remove unused interrupts from p9_deliver_interrupt
      target/ppc: remove generic architecture checks from p9_deliver_interrupt
      target/ppc: move power-saving interrupt masking out of cpu_has_work_POWER9
      target/ppc: add power-saving interrupt masking logic to p9_next_unmasked_interrupt
      target/ppc: create an interrupt masking method for POWER8
      target/ppc: remove unused interrupts from p8_next_unmasked_interrupt
      target/ppc: create an interrupt deliver method for POWER8
      target/ppc: remove unused interrupts from p8_deliver_interrupt
      target/ppc: remove generic architecture checks from p8_deliver_interrupt
      target/ppc: move power-saving interrupt masking out of cpu_has_work_POWER8
      target/ppc: add power-saving interrupt masking logic to p8_next_unmasked_interrupt
      target/ppc: create an interrupt masking method for POWER7
      target/ppc: remove unused interrupts from p7_next_unmasked_interrupt
      target/ppc: create an interrupt deliver method for POWER7
      target/ppc: remove unused interrupts from p7_deliver_interrupt
      target/ppc: remove generic architecture checks from p7_deliver_interrupt
      target/ppc: move power-saving interrupt masking out of cpu_has_work_POWER7
      target/ppc: add power-saving interrupt masking logic to p7_next_unmasked_interrupt
      target/ppc: remove ppc_store_lpcr from CONFIG_USER_ONLY builds
      target/ppc: introduce ppc_maybe_interrupt
      target/ppc: unify cpu->has_work based on cs->interrupt_request
      target/ppc: move the p*_interrupt_powersave methods to excp_helper.c

 docs/system/ppc/ppce500.rst                    |  25 +-
 hw/block/pflash_cfi01.c                        |   8 +-
 hw/block/pflash_cfi02.c                        |   5 +
 hw/ppc/Kconfig                                 |   1 +
 hw/ppc/e500.c                                  |  79 +++
 hw/ppc/meson.build                             |   3 +-
 hw/ppc/pnv_core.c                              |   1 +
 hw/ppc/ppc.c                                   |  17 +-
 hw/ppc/ppc440_uc.c                             | 332 ----------
 hw/ppc/ppc4xx_devs.c                           | 414 ------------
 hw/ppc/ppc4xx_sdram.c                          | 757 ++++++++++++++++++++++
 hw/ppc/spapr_hcall.c                           |   6 +
 hw/ppc/spapr_rtas.c                            |   2 +-
 hw/ppc/trace-events                            |   3 +-
 hw/sd/sdhci-internal.h                         |  20 -
 hw/sd/sdhci.c                                  |  63 +-
 include/hw/ppc/ppc4xx.h                        |  20 +-
 target/ppc/cpu.c                               |   4 +
 target/ppc/cpu.h                               |  47 +-
 target/ppc/cpu_init.c                          | 212 +-----
 target/ppc/excp_helper.c                       | 863 ++++++++++++++++++++++---
 target/ppc/fpu_helper.c                        | 137 ++--
 target/ppc/helper.h                            |  44 +-
 target/ppc/helper_regs.c                       |   8 +
 target/ppc/insn32.decode                       |  58 ++
 target/ppc/int_helper.c                        | 107 +--
 target/ppc/misc_helper.c                       |  11 +-
 target/ppc/power8-pmu.c                        |  74 +--
 target/ppc/power8-pmu.h                        |   3 +
 target/ppc/translate.c                         | 130 ++--
 target/ppc/translate/processor-ctrl-impl.c.inc | 105 +++
 target/ppc/translate/vmx-impl.c.inc            | 352 ++++++++--
 target/ppc/translate/vmx-ops.c.inc             |  15 +-
 target/ppc/translate/vsx-impl.c.inc            | 375 +++++++++--
 target/ppc/translate/vsx-ops.c.inc             |  21 -
 35 files changed, 2715 insertions(+), 1607 deletions(-)
 create mode 100644 hw/ppc/ppc4xx_sdram.c
 create mode 100644 target/ppc/translate/processor-ctrl-impl.c.inc

