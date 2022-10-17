Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F04C96017C7
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Oct 2022 21:38:09 +0200 (CEST)
Received: from localhost ([::1]:36754 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okVw7-0006vu-Qs
	for lists+qemu-devel@lfdr.de; Mon, 17 Oct 2022 15:38:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46718)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1okVet-0001pJ-VZ; Mon, 17 Oct 2022 15:20:21 -0400
Received: from mail-oi1-x229.google.com ([2607:f8b0:4864:20::229]:42584)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1okVes-0002fy-1I; Mon, 17 Oct 2022 15:20:19 -0400
Received: by mail-oi1-x229.google.com with SMTP id p127so12568515oih.9;
 Mon, 17 Oct 2022 12:20:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=6Xtuf956ENMz9wASjEZaEVb6sKTfpsh0vcaImiW0+I8=;
 b=lwOnqx4PhfrUVDJJXG8Hqkib+SGRj86JUvRRa07A2FXHYqv1o6avj4jEkpbafAl3Q2
 7f4Qh2yMelQIrPgSyDKnEE9TAZgbFafb1IbzaOokSJbObuKJO+ZuPkHHD3c4qNDaj6ys
 IObTuLssHC0b5yIyKG3AGD6NS2miYRh6VyqagysYBp3dSr8XrgZ/2STcD0fISxVOTsvJ
 yfEyTh2Qs0daCYUkhMuHtiodl6ipZrUACMhj2g/MpuRZJkXY5CA6DG8I0X6WZUccA4GJ
 bEG3sPnaj6LSib3C2lXgtbtD1539IKuNpUQTRxtSnsm2ZB8tLC413gNP0jThANDsQuQx
 +Rnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6Xtuf956ENMz9wASjEZaEVb6sKTfpsh0vcaImiW0+I8=;
 b=7wQfEOsFyjR308UHcVcJpEzHjBPagKvavMiMjdmq6u+yKaRnIF5k4qEtSmanCa6hus
 RbuOBuqYr+coPDk3XXHMGaEM1Nq6isnccJLbi2KKWuyj/MQEDbN2LT+uCp3997Wi1b/r
 mw5hQaf1Ftx5aqYfZ5gRj9k9a8yZ8A8wQf/G3+s6Ws/uYb1RlRj11LT9SxmkMMRhGKiw
 BKfidH83/ht2SiYkkeCh36911iP6/0hgeF8cV9vGPL6RsEBTxElLu43CXnIEVZk/2ypi
 d+OKBH167s4nEUuFqqek3kDE3uz42IO2eIA10s5zUhlh+UFaxPgOw8zb9xKtl0uXbh6F
 9fCg==
X-Gm-Message-State: ACrzQf09vp0g+jK6T5IUzzEdXTLGlO2Kdz+TqqMq5WxHR8ee474PdybN
 C3tkk/iEACiJyCOHQH5rUXNf9QMMV2E=
X-Google-Smtp-Source: AMsMyM5tsbzA7xv+ZfLb9hSxFyEMq6oNNrBCnFyWkJBeQ/zxm9+Vgun0ExsgTtbEoOeHJ2BDd54UMQ==
X-Received: by 2002:aca:4286:0:b0:350:a3fd:f6df with SMTP id
 p128-20020aca4286000000b00350a3fdf6dfmr5693730oia.61.1666034415723; 
 Mon, 17 Oct 2022 12:20:15 -0700 (PDT)
Received: from balboa.COMFAST ([179.111.38.2])
 by smtp.gmail.com with ESMTPSA id
 n132-20020aca408a000000b00342eade43d4sm4648005oia.13.2022.10.17.12.20.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Oct 2022 12:20:15 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, stefanha@redhat.com,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PULL 00/38] ppc queue
Date: Mon, 17 Oct 2022 16:19:31 -0300
Message-Id: <20221017192009.92404-1-danielhb413@gmail.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::229;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x229.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 5c2439a92ce4a1c5a53070bd803d6f7647e702ca:

  Merge tag 'pull-riscv-to-apply-20221014' of https://github.com/alistair23/qemu into staging (2022-10-16 15:53:13 -0400)

are available in the Git repository at:

  https://gitlab.com/danielhb/qemu.git tags/pull-ppc-20221017

for you to fetch changes up to 719b718ce27f52b2da600cc1abf6a41ac54dfa36:

  hw/riscv: set machine->fdt in spike_board_init() (2022-10-17 16:15:10 -0300)

----------------------------------------------------------------
ppc patch queue for 2022-10-17:

This queue contains improvements in the e500 and ppc4xx boards, changes
in the maintainership of the project, a new QMP/HMP command and bug
fixes:

- Cedric is stepping back from qemu-ppc maintainership;
- ppc4xx_sdram: QOMification and clean ups;
- e500: add new types of flash and clean ups;
- QMP/HMP: introduce dumpdtb command;
- spapr_pci, booke doorbell interrupt and xvcmp* bit fixes;

The 'dumpdtb' implementation is also making changes to RISC-V files that
were acked by Alistair Francis and are being included in this queue.

----------------------------------------------------------------
BALATON Zoltan (17):
      ppc440_bamboo: Remove unnecessary memsets
      ppc4xx: Introduce Ppc4xxSdramBank struct
      ppc4xx_sdram: Get rid of the init RAM hack
      ppc4xx: Use Ppc4xxSdramBank in ppc4xx_sdram_banks()
      ppc440_bamboo: Add missing 4 MiB valid memory size
      ppc4xx_sdram: Move size check to ppc4xx_sdram_init()
      ppc4xx_sdram: QOM'ify
      ppc4xx_sdram: Drop extra zeros for readability
      ppc440_sdram: Split off map/unmap of sdram banks for later reuse
      ppc440_sdram: Implement enable bit in the DDR2 SDRAM controller
      ppc440_sdram: Get rid of the init RAM hack
      ppc440_sdram: Rename local variable for readability
      ppc4xx_sdram: Rename functions to prevent name clashes
      ppc440_sdram: Move RAM size check to ppc440_sdram_init
      ppc440_sdram: QOM'ify
      ppc440_uc.c: Move some macros to ppc4xx.h
      ppc440_uc.c: Remove unneeded parenthesis

Bernhard Beschow (7):
      hw/ppc/meson: Allow e500 boards to be enabled separately
      hw/gpio/meson: Introduce dedicated config switch for hw/gpio/mpc8xxx
      docs/system/ppc/ppce500: Add heading for networking chapter
      hw/ppc/e500: Reduce usage of sysbus API
      hw/ppc/mpc8544ds: Rename wrongly named method
      hw/ppc/mpc8544ds: Add platform bus
      hw/ppc/e500: Remove if statement which is now always true

Cédric Le Goater (1):
      MAINTAINERS: step back from PPC

Daniel Henrique Barboza (10):
      qmp/hmp, device_tree.c: introduce dumpdtb
      hw/nios2: set machine->fdt in nios2_load_dtb()
      hw/ppc: set machine->fdt in bamboo_load_device_tree()
      hw/ppc: set machine->fdt in sam460ex_load_device_tree()
      hw/ppc: set machine->fdt in xilinx_load_device_tree()
      hw/ppc: set machine->fdt in pegasos2_machine_reset()
      hw/ppc: set machine->fdt in pnv_reset()
      hw/ppc: set machine->fdt in spapr machine
      hw/riscv: set machine->fdt in sifive_u_machine_init()
      hw/riscv: set machine->fdt in spike_board_init()

Nicholas Piggin (1):
      target/ppc: restore powerpc_excp_booke doorbell interrupts

Peter Maydell (1):
      hw/ppc/spapr_pci.c: Use device_cold_reset() rather than device_legacy_reset()

Víctor Colombo (1):
      target/ppc: Fix xvcmp* clearing FI bit

 MAINTAINERS                             |  10 +-
 configs/devices/ppc-softmmu/default.mak |   3 +-
 docs/system/ppc/ppce500.rst             |   3 +
 hmp-commands.hx                         |  15 ++
 hw/gpio/Kconfig                         |   3 +
 hw/gpio/meson.build                     |   2 +-
 hw/nios2/boot.c                         |   8 +-
 hw/nios2/meson.build                    |   2 +-
 hw/ppc/Kconfig                          |   9 ++
 hw/ppc/e500.c                           |  30 ++--
 hw/ppc/e500.h                           |   1 -
 hw/ppc/e500plat.c                       |   1 -
 hw/ppc/meson.build                      |   6 +-
 hw/ppc/mpc8544ds.c                      |   9 +-
 hw/ppc/pegasos2.c                       |   4 +
 hw/ppc/pnv.c                            |   8 +-
 hw/ppc/ppc405.h                         |   8 +-
 hw/ppc/ppc405_boards.c                  |  13 +-
 hw/ppc/ppc405_uc.c                      |  33 ++--
 hw/ppc/ppc440.h                         |   4 -
 hw/ppc/ppc440_bamboo.c                  |  50 +++----
 hw/ppc/ppc440_uc.c                      | 257 ++++++++++++++++++++------------
 hw/ppc/ppc4xx_devs.c                    | 241 +++++++++++++++---------------
 hw/ppc/sam460ex.c                       |  65 ++++----
 hw/ppc/spapr.c                          |   3 +
 hw/ppc/spapr_hcall.c                    |   8 +
 hw/ppc/spapr_pci.c                      |   2 +-
 hw/ppc/virtex_ml507.c                   |  25 ++--
 hw/riscv/sifive_u.c                     |   3 +
 hw/riscv/spike.c                        |   6 +
 include/hw/ppc/ppc4xx.h                 |  63 +++++++-
 include/sysemu/device_tree.h            |   1 +
 monitor/misc.c                          |   1 +
 qapi/machine.json                       |  18 +++
 softmmu/device_tree.c                   |  37 +++++
 target/ppc/excp_helper.c                |   6 +
 target/ppc/translate/vsx-impl.c.inc     |   1 -
 37 files changed, 589 insertions(+), 370 deletions(-)

