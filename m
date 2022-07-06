Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D0FBE569326
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jul 2022 22:16:28 +0200 (CEST)
Received: from localhost ([::1]:44046 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9BRj-0003bk-8L
	for lists+qemu-devel@lfdr.de; Wed, 06 Jul 2022 16:16:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36914)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1o9BLP-0008TB-3Q; Wed, 06 Jul 2022 16:09:55 -0400
Received: from mail-vs1-xe36.google.com ([2607:f8b0:4864:20::e36]:39516)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1o9BLN-0003Ea-2Q; Wed, 06 Jul 2022 16:09:54 -0400
Received: by mail-vs1-xe36.google.com with SMTP id 185so5065090vse.6;
 Wed, 06 Jul 2022 13:09:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=GYKSw6d6URMvbVrcrvIxufU2//PK4FUQUoisEHExdFk=;
 b=GL6onwLaFB4yCxELWoTKkdd3adGmHfRm4IYmX9b6IQKB6LaYHnomdzs25EVUY6gIzT
 qYsqS4YbHZ//DPon1a0RrnuRwpVnPeRO5EPafP1t529zlwgAuto6Wt/MzJg4kHBKafbp
 heP1oifD72Op2jldkUYgW6p6qCTxaGJd4eml7lh11SLFZTnRRB/eutDn44QdsQTjtkVR
 YY3AtABn1bHhBLktw/8NxvRAIWwumpE1tJ5/vSm7ayvBffhBNUBtDX52aC65ygLDB1EH
 xdXgzy/8Dl4b1DjZ//ZgZmAmWnNN4MbZj6Aa6O8Uv3eeLzMWPLOotjNGMGCyrjenSYjl
 fsyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=GYKSw6d6URMvbVrcrvIxufU2//PK4FUQUoisEHExdFk=;
 b=P+rSfTkapolZ27q7zuXDSKpDN1tmQAy6Vxn8cpsGhNnmlxNeYBF2eOpC0Klz8TW4Uc
 vuqiXeNKLDGssA9yakZjKq+JjH0FAvpKZbDyD53nxvPpoV3J6A9l+K2KkPUXpm6fqNQT
 /jGgUj6PBPggM+dtjMqs+N9VSOuU9SXMBfQYGdwHJTiLv7mONkVJj1Ggm+KYtsuUOWIL
 UzddH+Br8yjyAVUGouVdeGUalJUL64H4gmDdXCzc3zT/IzVhR0yhgyuxq0paDTbwr2xG
 wSeBS1ouTb0Ld6zq+A/Lj+9Pt9/hV33jiCycvCJE1MrYt4fBxQJVAwNlP/NFodwQoHEE
 kULg==
X-Gm-Message-State: AJIora9SsjTTPlMiNVZPssYiTCDaFaXYoMw/8eue7ARpoQ75Q71vw4TG
 1d702KrBzcE6gXqfcKz3ooK/25yE3rk=
X-Google-Smtp-Source: AGRyM1tOP+Q3KX0NoqchaiiHEIm3fcIhGgbUbEkYSUP5lPIx9cE9F0nSqPzZ7pkdkXqh//QYoh4V/A==
X-Received: by 2002:a05:6102:7b9:b0:356:9ef:999e with SMTP id
 x25-20020a05610207b900b0035609ef999emr24671388vsg.47.1657138190922; 
 Wed, 06 Jul 2022 13:09:50 -0700 (PDT)
Received: from balboa.ibmuc.com (201-27-97-88.dsl.telesp.net.br.
 [201.27.97.88]) by smtp.gmail.com with ESMTPSA id
 r22-20020a056122015600b003744975035asm788662vko.19.2022.07.06.13.09.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Jul 2022 13:09:50 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, danielhb413@gmail.com, peter.maydell@linaro.org,
 richard.henderson@linaro.org
Subject: [PULL 00/34] ppc queue
Date: Wed,  6 Jul 2022 17:09:12 -0300
Message-Id: <20220706200946.471114-1-danielhb413@gmail.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::e36;
 envelope-from=danielhb413@gmail.com; helo=mail-vs1-xe36.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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

The following changes since commit 180c2f24d5e8eada41e012a3899d29bb695aae06:

  Merge tag 'net-pull-request' of https://github.com/jasowang/qemu into staging (2022-07-06 10:41:34 +0530)

are available in the Git repository at:

  https://gitlab.com/danielhb/qemu.git tags/pull-ppc-20220706

for you to fetch changes up to 0b83377f46042529adbbf3a77f7ffb6f1e8a0aaa:

  target/ppc: Fix MPC8555 and MPC8560 core type to e500v1 (2022-07-06 10:30:01 -0300)

----------------------------------------------------------------
ppc patch queue for 2022-07-06:

This queue consists of improvements and bug fixes in TCG, powernv and
pSeries, with some fixes in other areas as well.

- tcg and target/ppc: BCDA and mffscdrn implementations, Remove CONFIG_INT128
conditional code
- fix '-cpu max' alias
- remove '-cpu default' alias
- spapr: fixes in DDW handling, H_WATCHDOG support
- powernv: cleanups in the pnv-phb3/4 models
- fix core type of MPC8555 and MPC8560 models

----------------------------------------------------------------
Alexey Kardashevskiy (4):
      spapr/ddw: Reset DMA when the last non-default window is removed
      spapr/ddw: Implement 64bit query extension
      ppc: Define SETFIELD for the ppc target
      ppc/spapr: Implement H_WATCHDOG

Daniel Henrique Barboza (8):
      ppc/pnv: move root port attach to pnv_phb4_realize()
      ppc/pnv: attach phb3/phb4 root ports in QOM tree
      ppc/pnv: assign pnv-phb-root-port chassis/slot earlier
      ppc/pnv: make pnv_ics_get() use the chip8->phbs[] array
      ppc/pnv: make pnv_ics_resend() use chip8->phbs[]
      ppc/pnv: make pnv_chip_power8_pic_print_info() use chip8->phbs[]
      ppc/pnv: remove 'INTERFACE_PCIE_DEVICE' from phb3 root bus
      ppc/pnv: remove 'INTERFACE_PCIE_DEVICE' from phb4 root bus

Matheus Ferst (11):
      target/ppc: use int128.h methods in vpmsumd
      target/ppc: use int128.h methods in vadduqm
      target/ppc: use int128.h methods in vaddecuq and vaddeuqm
      target/ppc: use int128.h methods in vaddcuq
      target/ppc: use int128.h methods in vsubuqm
      target/ppc: use int128.h methods in vsubecuq and vsubeuqm
      target/ppc: use int128.h methods in vsubcuq
      target/ppc: Add flag for ISA v2.06 BCDA instructions
      target/ppc: implement addg6s
      target/ppc: implement cbcdtd
      target/ppc: implement cdtbcd

Murilo Opsfelder Araujo (1):
      target/ppc: Return default CPU for max CPU

Pali Rohár (1):
      target/ppc: Fix MPC8555 and MPC8560 core type to e500v1

Thomas Huth (1):
      target/ppc/cpu-models: Remove the "default" CPU alias

Víctor Colombo (8):
      target/ppc: Change FPSCR_* to follow POWER ISA numbering convention
      target/ppc: Fix insn32.decode style issues
      target/ppc: Move mffscrn[i] to decodetree
      target/ppc: Move mffsce to decodetree
      target/ppc: Move mffsl to decodetree
      target/ppc: Move mffs[.] to decodetree
      target/ppc: Implement mffscdrn[i] instructions
      tests/tcg/ppc64: Add mffsce test

 hw/intc/pnv_xive.c                         |  20 ---
 hw/intc/pnv_xive2.c                        |  20 ---
 hw/pci-host/pnv_phb3.c                     |  22 +--
 hw/pci-host/pnv_phb4.c                     |  40 +----
 hw/pci-host/pnv_phb4_pec.c                 |   3 -
 hw/ppc/pnv.c                               | 102 +++++------
 hw/ppc/spapr.c                             |   4 +
 hw/ppc/spapr_iommu.c                       |   3 +-
 hw/ppc/spapr_pci.c                         |   6 +-
 hw/ppc/spapr_rtas_ddw.c                    |  34 +++-
 hw/watchdog/meson.build                    |   1 +
 hw/watchdog/spapr_watchdog.c               | 274 +++++++++++++++++++++++++++++
 hw/watchdog/trace-events                   |   7 +
 include/hw/pci-host/pnv_phb3_regs.h        |  16 --
 include/hw/ppc/pnv.h                       |   3 +-
 include/hw/ppc/spapr.h                     |  26 ++-
 target/ppc/cpu-models.c                    |  17 +-
 target/ppc/cpu-models.h                    |  14 +-
 target/ppc/cpu.h                           |  89 ++++++----
 target/ppc/cpu_init.c                      |  29 ++-
 target/ppc/dfp_helper.c                    |  65 +++++++
 target/ppc/helper.h                        |  20 ++-
 target/ppc/insn32.decode                   |  71 ++++++--
 target/ppc/int_helper.c                    | 229 ++++--------------------
 target/ppc/internal.h                      |   3 -
 target/ppc/translate/fixedpoint-impl.c.inc |  51 ++++++
 target/ppc/translate/fp-impl.c.inc         | 203 +++++++++++----------
 target/ppc/translate/fp-ops.c.inc          |   9 -
 target/ppc/translate/vmx-impl.c.inc        |  32 ++--
 target/ppc/translate/vmx-ops.c.inc         |   9 +-
 tests/tcg/ppc64/Makefile.target            |   1 +
 tests/tcg/ppc64le/Makefile.target          |   1 +
 tests/tcg/ppc64le/mffsce.c                 |  37 ++++
 33 files changed, 885 insertions(+), 576 deletions(-)
 create mode 100644 hw/watchdog/spapr_watchdog.c
 create mode 100644 tests/tcg/ppc64le/mffsce.c

