Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD80161224D
	for <lists+qemu-devel@lfdr.de>; Sat, 29 Oct 2022 13:19:35 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oojqW-0004eg-UK; Sat, 29 Oct 2022 07:17:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oojqV-0004dd-8I; Sat, 29 Oct 2022 07:17:47 -0400
Received: from mail-oa1-x30.google.com ([2001:4860:4864:20::30])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oojqT-0004vX-1H; Sat, 29 Oct 2022 07:17:46 -0400
Received: by mail-oa1-x30.google.com with SMTP id
 586e51a60fabf-13ae8117023so8982349fac.9; 
 Sat, 29 Oct 2022 04:17:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Q+b38CrZnv90bo1VrTd3AAXDinraiUs9Z3sIlzxrT9k=;
 b=fLqrsVFkRAFitkEWHfWunavGpkA8zS4e1mHAM71szbS69aE7Fzc2gIN53nysAtBeoF
 2tB+2sMHy9rzxvrtClHZe0VYBAgGnye26QyTAyhhK7kcsqqVglVkdLkEhqEh1bZuah5a
 +BULgF5KH0fHeth+ypV2LDdQ0Py2kblSEfrqHhIYa82tNSZs9aSt6yFIdVb40Wcqnxti
 SSFQsssEEML+q64wxftf8vfG8+BqNzTCnEv1+iWawi2uwXSssxUQ25DzCwMtMLz3zd4z
 l+OtQTVnUK9r0V0QRaUf/UtzOWO+l/l3XKoaxqpofz1AA2NRQ/HuiqzeN2FlQIeiwOTN
 8rBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Q+b38CrZnv90bo1VrTd3AAXDinraiUs9Z3sIlzxrT9k=;
 b=WgN+tb9HLuAQ2GiD2bqHOiONB7h69dSujV7hzCycE2UCSJ763rG+01vKAmEOwjg+6I
 f8NuppVk9dADsvNCgUt/G7BlY0UfQ07xiSriBUxDguyCYakMtL0w8Q+ucG672tms5uhR
 p+dUDz4m2wcA90zr9fsId1SCdmcwDJh7P+Lut7TUufXdPKoJbizhT75ppgyMYDnvXwvU
 463xRs7xUd0qU1seM/jy0XPCOn73zrlOY2HViSEq3QnBzMu4o34KGv3pibIf4hd7YB+H
 lCC72HfQAqLmVFLFyXh2ZcTtqaqFlBwv1B8I8uK/JZxadUs53rXvdDU8Clc5hRyrk0Vj
 GSag==
X-Gm-Message-State: ACrzQf1EQzljHo+YIUif45VZfHFPI6JEHZJXbNXs96zPR9n0X0CjQV5w
 ZQIY/B0i/ltMch2fiX5yBpiPSRl9nHCPuA==
X-Google-Smtp-Source: AMsMyM5MyeXXmzK+ucPqkYphygnrdZwjN9pjZ0YFsQJnbhC4fDerbZV3y1zulwd56EY3TFTinzKDMA==
X-Received: by 2002:a05:6870:d203:b0:13b:9548:bc7b with SMTP id
 g3-20020a056870d20300b0013b9548bc7bmr2075663oac.69.1667042262243; 
 Sat, 29 Oct 2022 04:17:42 -0700 (PDT)
Received: from balboa.COMFAST ([177.45.165.63])
 by smtp.gmail.com with ESMTPSA id
 f25-20020a9d6c19000000b00661a05691fasm494163otq.79.2022.10.29.04.17.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 29 Oct 2022 04:17:41 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, stefanha@redhat.com,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PULL v2 00/63] ppc queue
Date: Sat, 29 Oct 2022 08:17:25 -0300
Message-Id: <20221029111727.1065252-1-danielhb413@gmail.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::30;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x30.google.com
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

v2: add a Radix MMU regression fix patch (63) and fixed 32 bit builds by
using memory_region_size() in patch 62. Thanks,

Daniel

The following changes since commit 344744e148e6e865f5a57e745b02a87e5ea534ad:

  Merge tag 'dump-pull-request' of https://gitlab.com/marcandre.lureau/qemu into staging (2022-10-26 10:53:49 -0400)

are available in the Git repository at:

  https://gitlab.com/danielhb/qemu.git tags/pull-ppc-20221029

for you to fetch changes up to fb22d743b93b49b73930aff40d3ba9d252f81a56:

  target/ppc: Fix regression in Radix MMU (2022-10-29 06:34:52 -0300)

----------------------------------------------------------------
ppc patch queue for 2022-10-29:

This queue has the second part of the ppc4xx_sdram cleanups, doorbell
instructions for POWER8,  new pflash handling for the e500 machine and a
Radix MMU regression fix.

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

Leandro Lupori (3):
      target/ppc: Add new PMC HFLAGS
      target/ppc: Increment PMC5 with inline insns
      target/ppc: Fix regression in Radix MMU

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
 target/ppc/mmu-radix64.c                       |  29 +-
 target/ppc/power8-pmu.c                        |  74 +--
 target/ppc/power8-pmu.h                        |   3 +
 target/ppc/translate.c                         | 130 ++--
 target/ppc/translate/processor-ctrl-impl.c.inc | 105 +++
 target/ppc/translate/vmx-impl.c.inc            | 352 ++++++++--
 target/ppc/translate/vmx-ops.c.inc             |  15 +-
 target/ppc/translate/vsx-impl.c.inc            | 375 +++++++++--
 target/ppc/translate/vsx-ops.c.inc             |  21 -
 36 files changed, 2736 insertions(+), 1615 deletions(-)
 create mode 100644 hw/ppc/ppc4xx_sdram.c
 create mode 100644 target/ppc/translate/processor-ctrl-impl.c.inc

