Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E4B4E2AF611
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Nov 2020 17:20:07 +0100 (CET)
Received: from localhost ([::1]:46378 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcsqs-00021Q-Jv
	for lists+qemu-devel@lfdr.de; Wed, 11 Nov 2020 11:20:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37046)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cupertinomiranda@gmail.com>)
 id 1kcsoz-0000En-0H
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 11:18:09 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:37030)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cupertinomiranda@gmail.com>)
 id 1kcsow-0007u8-3e
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 11:18:08 -0500
Received: by mail-wm1-x32c.google.com with SMTP id c16so2855002wmd.2
 for <qemu-devel@nongnu.org>; Wed, 11 Nov 2020 08:18:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=52JzvIPkM/frGe6IW+LQIM+glafk4IHX094qXhuGCdI=;
 b=WsY2uUvutGByWlDMEbzhuR2E6Axonkhw+wcsql/fyDUhSRwue8IdifzzMANza8R3L4
 LHugL4Bk73TcJ6P4FKFavk79E9MfGd500v9fkqa2oR3YEuO2ST43WefZTOKSygTRVZUM
 wQs+y2Kc3F6dr77uQH195W+rmdSGfylpSg3mgEvIFR5qsXgSlAEX6ca+Cd8iiVhdiYRJ
 bl4yKzMB+N4lWCWNk0eJQuAodACd8Lqbh72JM9asrIyUE7fishz8CUs1nc4/d+IjtAqH
 9woIFO/+0VWiYoRUHBccIDSzhwaLSzjCxzHVTY6P6r15Gn1qWCpf09kDry/kFdwqSLuk
 xJkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=52JzvIPkM/frGe6IW+LQIM+glafk4IHX094qXhuGCdI=;
 b=YOgapmVh6x0NG5IT+RoRbrfHh5K6C7Du4Q+t+Clh7hFpTwcem6UTugXaAbLkRntmJf
 l1HoFvfrkHeHyYT4hszd1oUYLOAF7m5VN1e+jMhLTUhqFtD3/fNw+ATrKxGZQsNt0tjJ
 o0FZi1WZbkskS0fcOwEn0vnA03shVJKcjxkT2YU+2d0prYDkyoUS1hXfoQd+LPZevRXB
 6ACKZTuKO9U6YaoQWBYX0LwRjLYvDJlNffgbMiUi6Z7xheP/xpIaKHo+u5u9mdvXOwAm
 1mOPKQ5BRC8QQKRyYDLTjnFfBCFMXdfjhMufWuNztTs76YLGNr2KVTQd0hEFAnC9zk0W
 rZWQ==
X-Gm-Message-State: AOAM531XegYQQ4rxU7qACTtQkns6gdg5sC7T6mR4iQdzMHOVRBKBB0Ec
 BY8TiZlKcln1oovoC71HQDDfleac5FYnuA==
X-Google-Smtp-Source: ABdhPJzWBxkm3ysW3xCGNeOYqIFwal2tLHkw+GXOCA+Ri9QBHSDQiZ/DvGgCdlv6rTuIXPsgOFhaKg==
X-Received: by 2002:a1c:1b85:: with SMTP id b127mr5166457wmb.163.1605111483487; 
 Wed, 11 Nov 2020 08:18:03 -0800 (PST)
Received: from cmiranda-laptop.localdomain (bl19-104-46.dsl.telepac.pt.
 [2.80.104.46])
 by smtp.gmail.com with ESMTPSA id s188sm3115178wmf.45.2020.11.11.08.18.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Nov 2020 08:18:02 -0800 (PST)
From: cupertinomiranda@gmail.com
To: qemu-devel@nongnu.org
Subject: [PATCH 00/15] *** ARC port for review ***
Date: Wed, 11 Nov 2020 16:17:43 +0000
Message-Id: <20201111161758.9636-1-cupertinomiranda@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=cupertinomiranda@gmail.com; helo=mail-wm1-x32c.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Claudiu Zissulescu <claziss@gmail.com>,
 Cupertino Miranda <cupertinomiranda@gmail.com>,
 Shahab Vahedi <shahab.vahedi@gmail.com>, Shahab Vahedi <shahab@synopsys.com>,
 Cupertino Miranda <cmiranda@synopsys.com>, linux-snps-arc@lists.infradead.org,
 Claudiu Zissulescu <claziss@synopsys.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Cupertino Miranda <cmiranda@synopsys.com>

Hello everyone,

Here is a long due refresh of ARCv2 port patches.

List of done requested improvements:
 - Include acceptance tests for ARC (linux boot),
 - Copyright notices,
 - Remove osdep.h from header files,
 - Removed makefiles,
 - Cleared list of boards reducing for just 2 boards

Things requested but not done: 
 - f4bug: we did not change any of the mentioned variable types since those
   variables are used in global properties, and the property definition
   seem to enforce a size and signess, when using DEFINE_PROP_UNSIGNED.

Best regards,
Cupertino Miranda


| Hello everyone,
| 
| It is with utmost pleasure that on behalf of Synopsys I initiate the
| upstream process for our ARCv2 architecture QEMU port.
| 
| I am one of the main contributors to this port and member of the
| Synopsys GNU toolchain team, together with Claudiu Zissulescu and 
| Shahab Vahedi.
| 
| ARCv2 processors use RISC, and employ the 16-/32-bit instruction set
| architecture (ISA).
| ARC processors are configurable and extensible for a wide range of uses
| in system on a chip (SoC) devices.
| It is a common processor in deeply embedded systems, used in storage,
| digital home, mobile, automotive, and Internet of Things (IoT) 
| applications.
| 
| To facilitate reviewing, we split the files through several commits,
| attempting to keep file size to reviewable chunks.
| 
| The port as presented implements the system softmmu hardware emulation,
| capable to boot and run Linux kernel.
| It has also been integrated as a patch in Zephyr project, where it is
| being used.
| To validate and guarantee correctness of the port through development, 
| we have created TCG tests from the very beggining, covering the most 
| fundamental CPU features.
| For the remaining instructions we validate the port through compiler 
| testsuites, like DejaGNU, comparing results with real hardware 
| executions.
| 
| Would like also to thank our colleagues Vineet Gupta and Alexey Broadkin
| for their contributions, which due to the collapse of the development
| commits, got their contributions overcast by major ones.
| 
| Link for Synopsys ARC processor page:
|  - https://www.synopsys.com/designware-ip/processor-solutions.html
| 
| ARC PRM for both HS and EM processors can be found in:
|  - https://www.synopsys.com/dw/doc.php/ds/cc/programmers-reference-manual-ARC-EM.pdf
|  - https://www.synopsys.com/dw/doc.php/ds/cc/programmers-reference-manual-ARC-HS.pdf.
| 
| Looking forward to your comments and suggestions.
| 
| Best regards,
| Cupertino Miranda

Claudiu Zissulescu (5):
  arc: Decoder code
  arc: Opcode definitions table
  arc: Add IRQ and timer subsystem support
  arc: Add Synopsys ARC emulation boards
  tests/tcg: ARC: Add TCG instruction definition tests

Cupertino Miranda (7):
  arc: Add initial core cpu files
  arc: TCG and decoder glue code and helpers
  arc: TCG instruction generator and hand-definitions
  arc: TCG instruction definitions
  arc: Add BCR and AUX registers implementation
  arc: Add memory management unit (MMU) support
  tests/acceptance: ARC: Add linux boot testing.

Shahab Vahedi (3):
  arc: Add memory protection unit (MPU) support
  arc: Add gdbstub and XML for debugging support
  arc: Add support for ARCv2

 configure                               |     2 +
 default-configs/arc-softmmu.mak         |     5 +
 default-configs/devices/arc-softmmu.mak |     7 +
 default-configs/targets/arc-softmmu.mak |     2 +
 disas.c                                 |     2 +
 disas/arc.c                             |   461 +
 disas/meson.build                       |     1 +
 gdb-xml/arc-v2-aux.xml                  |    32 +
 gdb-xml/arc-v2-core.xml                 |    45 +
 gdb-xml/arc-v2-other.xml                |   235 +
 hw/Kconfig                              |     1 +
 hw/arc/Kconfig                          |     7 +
 hw/arc/arc_sim.c                        |   124 +
 hw/arc/boot.c                           |   100 +
 hw/arc/boot.h                           |    21 +
 hw/arc/meson.build                      |     9 +
 hw/arc/pic_cpu.c                        |   113 +
 hw/arc/virt.c                           |   107 +
 hw/meson.build                          |     1 +
 include/disas/dis-asm.h                 |    10 +-
 include/elf.h                           |     3 +
 include/exec/poison.h                   |     2 +
 include/hw/arc/cpudevs.h                |    30 +
 include/sysemu/arch_init.h              |     1 +
 meson.build                             |     5 +-
 softmmu/arch_init.c                     |     2 +
 target/arc/arc-common.h                 |    54 +
 target/arc/cache.c                      |   182 +
 target/arc/cache.h                      |    42 +
 target/arc/cpu-param.h                  |    32 +
 target/arc/cpu-qom.h                    |    52 +
 target/arc/cpu.c                        |   467 +
 target/arc/cpu.h                        |   531 +
 target/arc/decoder.c                    |  1277 ++
 target/arc/decoder.h                    |   349 +
 target/arc/extra_mapping.def            |    40 +
 target/arc/flags.def                    |    85 +
 target/arc/gdbstub.c                    |   420 +
 target/arc/helper.c                     |   293 +
 target/arc/helper.h                     |    46 +
 target/arc/internals.h                  |    38 +
 target/arc/irq.c                        |   658 +
 target/arc/irq.h                        |    37 +
 target/arc/meson.build                  |    20 +
 target/arc/mmu.c                        |   777 +
 target/arc/mmu.h                        |   166 +
 target/arc/mpu.c                        |   656 +
 target/arc/mpu.h                        |   142 +
 target/arc/op_helper.c                  |   749 +
 target/arc/opcodes.def                  | 19976 ++++++++++++++++++++++
 target/arc/operands.def                 |   123 +
 target/arc/regs-detail.def              |   538 +
 target/arc/regs.c                       |   139 +
 target/arc/regs.def                     |   396 +
 target/arc/regs.h                       |   118 +
 target/arc/semfunc-helper.c             |   493 +
 target/arc/semfunc-helper.h             |   280 +
 target/arc/semfunc.c                    |  8473 +++++++++
 target/arc/semfunc.h                    |    62 +
 target/arc/semfunc_mapping.def          |   329 +
 target/arc/timer.c                      |   454 +
 target/arc/timer.h                      |    30 +
 target/arc/translate.c                  |  1345 ++
 target/arc/translate.h                  |   201 +
 target/meson.build                      |     1 +
 tests/Makefile.include                  |     1 +
 tests/acceptance/boot_linux_console.py  |    55 +
 tests/tcg/arc/Makefile                  |   114 +
 tests/tcg/arc/Makefile.softmmu-target   |    43 +
 tests/tcg/arc/Makefile.target           |   101 +
 tests/tcg/arc/check_add.S               |    11 +
 tests/tcg/arc/check_addx.S              |    71 +
 tests/tcg/arc/check_andx.S              |    36 +
 tests/tcg/arc/check_aslx.S              |    57 +
 tests/tcg/arc/check_asrx.S              |    86 +
 tests/tcg/arc/check_basic1.S            |    30 +
 tests/tcg/arc/check_basic2.S            |    26 +
 tests/tcg/arc/check_beq.S               |    14 +
 tests/tcg/arc/check_beqx.S              |    26 +
 tests/tcg/arc/check_bi.S                |    32 +
 tests/tcg/arc/check_big_tb.S            |   173 +
 tests/tcg/arc/check_bih.S               |    29 +
 tests/tcg/arc/check_bnex.S              |    26 +
 tests/tcg/arc/check_breqx.S             |    26 +
 tests/tcg/arc/check_brgex.S             |    26 +
 tests/tcg/arc/check_brhsx.S             |    27 +
 tests/tcg/arc/check_brlox.S             |    26 +
 tests/tcg/arc/check_brltx.S             |    26 +
 tests/tcg/arc/check_brnex.S             |    26 +
 tests/tcg/arc/check_bta.S               |   294 +
 tests/tcg/arc/check_carry.S             |    15 +
 tests/tcg/arc/check_enter_leave.S       |   715 +
 tests/tcg/arc/check_excp.S              |    17 +
 tests/tcg/arc/check_excp_1.c            |    15 +
 tests/tcg/arc/check_excp_jumpdl_mmu.S   |    44 +
 tests/tcg/arc/check_excp_mmu.S          |    69 +
 tests/tcg/arc/check_flags.S             |    23 +
 tests/tcg/arc/check_ldaw_mmu.S          |    71 +
 tests/tcg/arc/check_ldstx.S             |    37 +
 tests/tcg/arc/check_lp.S                |    12 +
 tests/tcg/arc/check_lp02.S              |    72 +
 tests/tcg/arc/check_lp03.S              |    49 +
 tests/tcg/arc/check_lp04.S              |    48 +
 tests/tcg/arc/check_lp05.S              |    23 +
 tests/tcg/arc/check_lp06.S              |   163 +
 tests/tcg/arc/check_lsrx.S              |    33 +
 tests/tcg/arc/check_mac.S               |   228 +
 tests/tcg/arc/check_manip_10_mmu.S      |   173 +
 tests/tcg/arc/check_manip_4_mmu.S       |   158 +
 tests/tcg/arc/check_manip_5_mmu.S       |   166 +
 tests/tcg/arc/check_manip_mmu.S         |   565 +
 tests/tcg/arc/check_mmu.S               |    59 +
 tests/tcg/arc/check_mpu.S               |   703 +
 tests/tcg/arc/check_mpyd.S              |   543 +
 tests/tcg/arc/check_mpyw.S              |    41 +
 tests/tcg/arc/check_norm.S              |    40 +
 tests/tcg/arc/check_orx.S               |    34 +
 tests/tcg/arc/check_prefetch.S          |    37 +
 tests/tcg/arc/check_rolx.S              |    47 +
 tests/tcg/arc/check_rorx.S              |    64 +
 tests/tcg/arc/check_rtc.S               |    29 +
 tests/tcg/arc/check_rtie_user.S         |    30 +
 tests/tcg/arc/check_stld.S              |    10 +
 tests/tcg/arc/check_subf.S              |    67 +
 tests/tcg/arc/check_subx.S              |    43 +
 tests/tcg/arc/check_swi.S               |   115 +
 tests/tcg/arc/check_swirq.S             |    27 +
 tests/tcg/arc/check_swirq1.S            |    31 +
 tests/tcg/arc/check_swirq3.S            |    49 +
 tests/tcg/arc/check_t01.S               |    12 +
 tests/tcg/arc/check_t02.S               |     9 +
 tests/tcg/arc/check_timer0.S            |    36 +
 tests/tcg/arc/check_timer0_loop.S       |    34 +
 tests/tcg/arc/check_timer0_loop3.S      |    46 +
 tests/tcg/arc/check_timer0_retrig.S     |    29 +
 tests/tcg/arc/check_timer0_sleep.S      |    33 +
 tests/tcg/arc/check_timerX_freq.S       |    87 +
 tests/tcg/arc/check_vadd.S              |   510 +
 tests/tcg/arc/check_vsub.S              |   510 +
 tests/tcg/arc/check_xorx.S              |    32 +
 tests/tcg/arc/ivt.S                     |    38 +
 tests/tcg/arc/macros.inc                |   261 +
 tests/tcg/arc/memory.x                  |    12 +
 tests/tcg/arc/mmu.inc                   |   132 +
 tests/tcg/arc/mpu.inc                   |   269 +
 tests/tcg/arc/tarc.ld                   |    15 +
 tests/tcg/arc/tarc_mmu.ld               |    15 +
 tests/tcg/arc/test_macros.h             |   257 +
 tests/tcg/configure.sh                  |     3 +-
 149 files changed, 49782 insertions(+), 4 deletions(-)
 create mode 100644 default-configs/arc-softmmu.mak
 create mode 100644 default-configs/devices/arc-softmmu.mak
 create mode 100644 default-configs/targets/arc-softmmu.mak
 create mode 100644 disas/arc.c
 create mode 100644 gdb-xml/arc-v2-aux.xml
 create mode 100644 gdb-xml/arc-v2-core.xml
 create mode 100644 gdb-xml/arc-v2-other.xml
 create mode 100644 hw/arc/Kconfig
 create mode 100644 hw/arc/arc_sim.c
 create mode 100644 hw/arc/boot.c
 create mode 100644 hw/arc/boot.h
 create mode 100644 hw/arc/meson.build
 create mode 100644 hw/arc/pic_cpu.c
 create mode 100644 hw/arc/virt.c
 create mode 100644 include/hw/arc/cpudevs.h
 create mode 100644 target/arc/arc-common.h
 create mode 100644 target/arc/cache.c
 create mode 100644 target/arc/cache.h
 create mode 100644 target/arc/cpu-param.h
 create mode 100644 target/arc/cpu-qom.h
 create mode 100644 target/arc/cpu.c
 create mode 100644 target/arc/cpu.h
 create mode 100644 target/arc/decoder.c
 create mode 100644 target/arc/decoder.h
 create mode 100644 target/arc/extra_mapping.def
 create mode 100644 target/arc/flags.def
 create mode 100644 target/arc/gdbstub.c
 create mode 100644 target/arc/helper.c
 create mode 100644 target/arc/helper.h
 create mode 100644 target/arc/internals.h
 create mode 100644 target/arc/irq.c
 create mode 100644 target/arc/irq.h
 create mode 100644 target/arc/meson.build
 create mode 100644 target/arc/mmu.c
 create mode 100644 target/arc/mmu.h
 create mode 100644 target/arc/mpu.c
 create mode 100644 target/arc/mpu.h
 create mode 100644 target/arc/op_helper.c
 create mode 100644 target/arc/opcodes.def
 create mode 100644 target/arc/operands.def
 create mode 100644 target/arc/regs-detail.def
 create mode 100644 target/arc/regs.c
 create mode 100644 target/arc/regs.def
 create mode 100644 target/arc/regs.h
 create mode 100644 target/arc/semfunc-helper.c
 create mode 100644 target/arc/semfunc-helper.h
 create mode 100644 target/arc/semfunc.c
 create mode 100644 target/arc/semfunc.h
 create mode 100644 target/arc/semfunc_mapping.def
 create mode 100644 target/arc/timer.c
 create mode 100644 target/arc/timer.h
 create mode 100644 target/arc/translate.c
 create mode 100644 target/arc/translate.h
 create mode 100644 tests/tcg/arc/Makefile
 create mode 100644 tests/tcg/arc/Makefile.softmmu-target
 create mode 100644 tests/tcg/arc/Makefile.target
 create mode 100644 tests/tcg/arc/check_add.S
 create mode 100644 tests/tcg/arc/check_addx.S
 create mode 100644 tests/tcg/arc/check_andx.S
 create mode 100644 tests/tcg/arc/check_aslx.S
 create mode 100644 tests/tcg/arc/check_asrx.S
 create mode 100644 tests/tcg/arc/check_basic1.S
 create mode 100644 tests/tcg/arc/check_basic2.S
 create mode 100644 tests/tcg/arc/check_beq.S
 create mode 100644 tests/tcg/arc/check_beqx.S
 create mode 100644 tests/tcg/arc/check_bi.S
 create mode 100644 tests/tcg/arc/check_big_tb.S
 create mode 100644 tests/tcg/arc/check_bih.S
 create mode 100644 tests/tcg/arc/check_bnex.S
 create mode 100644 tests/tcg/arc/check_breqx.S
 create mode 100644 tests/tcg/arc/check_brgex.S
 create mode 100644 tests/tcg/arc/check_brhsx.S
 create mode 100644 tests/tcg/arc/check_brlox.S
 create mode 100644 tests/tcg/arc/check_brltx.S
 create mode 100644 tests/tcg/arc/check_brnex.S
 create mode 100644 tests/tcg/arc/check_bta.S
 create mode 100644 tests/tcg/arc/check_carry.S
 create mode 100644 tests/tcg/arc/check_enter_leave.S
 create mode 100644 tests/tcg/arc/check_excp.S
 create mode 100644 tests/tcg/arc/check_excp_1.c
 create mode 100644 tests/tcg/arc/check_excp_jumpdl_mmu.S
 create mode 100644 tests/tcg/arc/check_excp_mmu.S
 create mode 100644 tests/tcg/arc/check_flags.S
 create mode 100644 tests/tcg/arc/check_ldaw_mmu.S
 create mode 100644 tests/tcg/arc/check_ldstx.S
 create mode 100644 tests/tcg/arc/check_lp.S
 create mode 100644 tests/tcg/arc/check_lp02.S
 create mode 100644 tests/tcg/arc/check_lp03.S
 create mode 100644 tests/tcg/arc/check_lp04.S
 create mode 100644 tests/tcg/arc/check_lp05.S
 create mode 100644 tests/tcg/arc/check_lp06.S
 create mode 100644 tests/tcg/arc/check_lsrx.S
 create mode 100644 tests/tcg/arc/check_mac.S
 create mode 100644 tests/tcg/arc/check_manip_10_mmu.S
 create mode 100644 tests/tcg/arc/check_manip_4_mmu.S
 create mode 100644 tests/tcg/arc/check_manip_5_mmu.S
 create mode 100644 tests/tcg/arc/check_manip_mmu.S
 create mode 100644 tests/tcg/arc/check_mmu.S
 create mode 100644 tests/tcg/arc/check_mpu.S
 create mode 100644 tests/tcg/arc/check_mpyd.S
 create mode 100644 tests/tcg/arc/check_mpyw.S
 create mode 100644 tests/tcg/arc/check_norm.S
 create mode 100644 tests/tcg/arc/check_orx.S
 create mode 100644 tests/tcg/arc/check_prefetch.S
 create mode 100644 tests/tcg/arc/check_rolx.S
 create mode 100644 tests/tcg/arc/check_rorx.S
 create mode 100644 tests/tcg/arc/check_rtc.S
 create mode 100644 tests/tcg/arc/check_rtie_user.S
 create mode 100644 tests/tcg/arc/check_stld.S
 create mode 100644 tests/tcg/arc/check_subf.S
 create mode 100644 tests/tcg/arc/check_subx.S
 create mode 100644 tests/tcg/arc/check_swi.S
 create mode 100644 tests/tcg/arc/check_swirq.S
 create mode 100644 tests/tcg/arc/check_swirq1.S
 create mode 100644 tests/tcg/arc/check_swirq3.S
 create mode 100644 tests/tcg/arc/check_t01.S
 create mode 100644 tests/tcg/arc/check_t02.S
 create mode 100644 tests/tcg/arc/check_timer0.S
 create mode 100644 tests/tcg/arc/check_timer0_loop.S
 create mode 100644 tests/tcg/arc/check_timer0_loop3.S
 create mode 100644 tests/tcg/arc/check_timer0_retrig.S
 create mode 100644 tests/tcg/arc/check_timer0_sleep.S
 create mode 100644 tests/tcg/arc/check_timerX_freq.S
 create mode 100644 tests/tcg/arc/check_vadd.S
 create mode 100644 tests/tcg/arc/check_vsub.S
 create mode 100644 tests/tcg/arc/check_xorx.S
 create mode 100644 tests/tcg/arc/ivt.S
 create mode 100644 tests/tcg/arc/macros.inc
 create mode 100644 tests/tcg/arc/memory.x
 create mode 100644 tests/tcg/arc/mmu.inc
 create mode 100644 tests/tcg/arc/mpu.inc
 create mode 100644 tests/tcg/arc/tarc.ld
 create mode 100644 tests/tcg/arc/tarc_mmu.ld
 create mode 100644 tests/tcg/arc/test_macros.h

-- 
2.20.1


