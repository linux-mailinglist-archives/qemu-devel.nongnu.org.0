Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E865837C778
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 18:27:50 +0200 (CEST)
Received: from localhost ([::1]:54282 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgri9-0006gy-SU
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 12:27:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41240)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lgrf2-0003Pp-HK
 for qemu-devel@nongnu.org; Wed, 12 May 2021 12:24:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22196)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lgreq-0000RL-JQ
 for qemu-devel@nongnu.org; Wed, 12 May 2021 12:24:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620836663;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=2T3b9FuLBCVJF3X0mprwdU5Vj4ziIbczuyrVJbTVdUQ=;
 b=FxonTxxGG5aBp/c5JL0M4D0bVQxQHfEju+Va5HjTcEHBUWohNZjIUYtKVuSPTsEpaSNIvq
 tyuEdFqNtXlA5vp6yzjKWqVv6NGtHewbN25sky1NPzRFNqx024Hbfe5cyvpDklU6wNS78l
 DWs6lOgmCrM7viBNfl8HzlAGMZtuDzY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-538-rRu0tP8XPUyD-M88KZBAsA-1; Wed, 12 May 2021 12:24:17 -0400
X-MC-Unique: rRu0tP8XPUyD-M88KZBAsA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 12FF4801B13;
 Wed, 12 May 2021 16:24:16 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-114-17.ams2.redhat.com
 [10.36.114.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8B86060657;
 Wed, 12 May 2021 16:24:15 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id ECB59113865F; Wed, 12 May 2021 18:24:12 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 0/5] Miscellaneous patches for 2021-05-12
Date: Wed, 12 May 2021 18:24:07 +0200
Message-Id: <20210512162412.338120-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit a5ccdccc97d6e0d75282ede5b866cf694e9602b0:

  Merge remote-tracking branch 'remotes/kraxel/tags/vga-20210510-pull-request' into staging (2021-05-12 14:45:21 +0100)

are available in the Git repository at:

  git://repo.or.cz/qemu/armbru.git tags/pull-misc-2021-05-12

for you to fetch changes up to 4369223902a79b7fc56ca076d99b88ff14964ddd:

  Drop the deprecated unicore32 target (2021-05-12 18:20:52 +0200)

----------------------------------------------------------------
Miscellaneous patches for 2021-05-12

----------------------------------------------------------------
Markus Armbruster (3):
      block: Drop the sheepdog block driver
      Drop the deprecated lm32 target
      Drop the deprecated unicore32 target

Stefan Reiter (1):
      monitor/qmp: fix race on CHR_EVENT_CLOSED without OOB

Thomas Huth (1):
      Remove the deprecated moxie target

 docs/system/deprecated.rst                    |   33 -
 docs/system/device-url-syntax.rst.inc         |   18 -
 docs/system/qemu-block-drivers.rst.inc        |   69 -
 docs/system/removed-features.rst              |   28 +
 configure                                     |   17 +-
 default-configs/devices/lm32-softmmu.mak      |   12 -
 default-configs/devices/moxie-softmmu.mak     |    5 -
 default-configs/devices/unicore32-softmmu.mak |    6 -
 default-configs/targets/lm32-softmmu.mak      |    2 -
 default-configs/targets/moxie-softmmu.mak     |    2 -
 default-configs/targets/unicore32-softmmu.mak |    1 -
 meson.build                                   |    5 +-
 qapi/block-core.json                          |   93 +-
 qapi/machine.json                             |    6 +-
 qapi/misc-target.json                         |    2 +-
 qapi/transaction.json                         |    8 +-
 hw/display/milkymist-vgafb_template.h         |   74 -
 hw/lm32/lm32.h                                |   48 -
 hw/lm32/lm32_hwsetup.h                        |  179 --
 hw/lm32/milkymist-hw.h                        |  133 -
 hw/usb/quirks-ftdi-ids.h                      |    6 -
 hw/usb/quirks.h                               |    1 -
 include/disas/dis-asm.h                       |    4 -
 include/elf.h                                 |    6 +-
 include/exec/poison.h                         |    5 -
 include/hw/char/lm32_juart.h                  |   13 -
 include/hw/display/milkymist_tmu2.h           |   42 -
 include/hw/elf_ops.h                          |    8 -
 include/hw/lm32/lm32_pic.h                    |   10 -
 include/hw/unicore32/puv3.h                   |   40 -
 include/sysemu/arch_init.h                    |    3 -
 target/lm32/cpu-param.h                       |   17 -
 target/lm32/cpu-qom.h                         |   48 -
 target/lm32/cpu.h                             |  262 --
 target/lm32/helper.h                          |   14 -
 target/moxie/cpu-param.h                      |   17 -
 target/moxie/cpu.h                            |  123 -
 target/moxie/helper.h                         |    5 -
 target/moxie/machine.h                        |    1 -
 target/moxie/mmu.h                            |   19 -
 target/unicore32/cpu-param.h                  |   17 -
 target/unicore32/cpu-qom.h                    |   37 -
 target/unicore32/cpu.h                        |  168 --
 target/unicore32/helper.h                     |   62 -
 block/sheepdog.c                              | 3356 -------------------------
 disas/lm32.c                                  |  361 ---
 disas/moxie.c                                 |  360 ---
 hw/audio/milkymist-ac97.c                     |  360 ---
 hw/char/lm32_juart.c                          |  166 --
 hw/char/lm32_uart.c                           |  314 ---
 hw/char/milkymist-uart.c                      |  258 --
 hw/display/milkymist-tmu2.c                   |  551 ----
 hw/display/milkymist-vgafb.c                  |  360 ---
 hw/dma/puv3_dma.c                             |  119 -
 hw/gpio/puv3_gpio.c                           |  154 --
 hw/input/milkymist-softusb.c                  |  319 ---
 hw/intc/lm32_pic.c                            |  195 --
 hw/intc/puv3_intc.c                           |  147 --
 hw/lm32/lm32_boards.c                         |  332 ---
 hw/lm32/milkymist.c                           |  249 --
 hw/misc/milkymist-hpdmc.c                     |  172 --
 hw/misc/milkymist-pfpu.c                      |  548 ----
 hw/misc/puv3_pm.c                             |  159 --
 hw/moxie/moxiesim.c                           |  155 --
 hw/net/milkymist-minimac2.c                   |  547 ----
 hw/sd/milkymist-memcard.c                     |  335 ---
 hw/timer/lm32_timer.c                         |  249 --
 hw/timer/milkymist-sysctl.c                   |  361 ---
 hw/timer/puv3_ost.c                           |  166 --
 hw/unicore32/puv3.c                           |  145 --
 monitor/qmp.c                                 |   40 +-
 softmmu/arch_init.c                           |    6 -
 target/lm32/cpu.c                             |  274 --
 target/lm32/gdbstub.c                         |   92 -
 target/lm32/helper.c                          |  224 --
 target/lm32/lm32-semi.c                       |  211 --
 target/lm32/machine.c                         |   33 -
 target/lm32/op_helper.c                       |  148 --
 target/lm32/translate.c                       | 1237 ---------
 target/moxie/cpu.c                            |  161 --
 target/moxie/helper.c                         |  120 -
 target/moxie/machine.c                        |   19 -
 target/moxie/mmu.c                            |   32 -
 target/moxie/translate.c                      |  892 -------
 target/unicore32/cpu.c                        |  174 --
 target/unicore32/helper.c                     |  183 --
 target/unicore32/op_helper.c                  |  244 --
 target/unicore32/softmmu.c                    |  280 ---
 target/unicore32/translate.c                  | 2083 ---------------
 target/unicore32/ucf64_helper.c               |  324 ---
 tests/qtest/boot-serial-test.c                |    8 -
 tests/qtest/machine-none-test.c               |    3 -
 fpu/softfloat-specialize.c.inc                |   11 +-
 .gitlab-ci.yml                                |    9 +-
 MAINTAINERS                                   |   54 -
 block/meson.build                             |    1 -
 block/trace-events                            |   14 -
 disas/meson.build                             |    2 -
 hw/Kconfig                                    |    3 -
 hw/audio/meson.build                          |    1 -
 hw/audio/trace-events                         |   12 -
 hw/char/meson.build                           |    3 -
 hw/char/trace-events                          |   17 -
 hw/display/Kconfig                            |    4 -
 hw/display/meson.build                        |    2 -
 hw/display/trace-events                       |   10 -
 hw/dma/meson.build                            |    1 -
 hw/gpio/meson.build                           |    1 -
 hw/input/meson.build                          |    1 -
 hw/input/trace-events                         |    7 -
 hw/intc/meson.build                           |    2 -
 hw/intc/trace-events                          |    9 -
 hw/lm32/Kconfig                               |   18 -
 hw/lm32/meson.build                           |    6 -
 hw/meson.build                                |    3 -
 hw/misc/meson.build                           |    4 -
 hw/misc/trace-events                          |   10 -
 hw/moxie/Kconfig                              |    3 -
 hw/moxie/meson.build                          |    4 -
 hw/net/meson.build                            |    1 -
 hw/net/trace-events                           |   12 -
 hw/sd/meson.build                             |    1 -
 hw/sd/trace-events                            |    4 -
 hw/timer/meson.build                          |    3 -
 hw/timer/trace-events                         |   17 -
 hw/unicore32/Kconfig                          |    5 -
 hw/unicore32/meson.build                      |    5 -
 qemu-options.hx                               |    4 +-
 target/lm32/README                            |   45 -
 target/lm32/TODO                              |    1 -
 target/lm32/meson.build                       |   15 -
 target/meson.build                            |    3 -
 target/moxie/meson.build                      |   14 -
 target/unicore32/meson.build                  |   14 -
 tests/qemu-iotests/005                        |    5 -
 tests/qemu-iotests/025                        |    2 +-
 tests/qemu-iotests/check                      |    3 +-
 tests/qemu-iotests/common.rc                  |    4 -
 tests/qtest/meson.build                       |    2 -
 tests/tcg/README                              |    6 -
 tests/tcg/configure.sh                        |    2 +-
 tests/tcg/lm32/Makefile                       |  106 -
 tests/tcg/lm32/crt.S                          |   84 -
 tests/tcg/lm32/helper.S                       |   65 -
 tests/tcg/lm32/linker.ld                      |   55 -
 tests/tcg/lm32/macros.inc                     |   90 -
 tests/tcg/lm32/test_add.S                     |   75 -
 tests/tcg/lm32/test_addi.S                    |   56 -
 tests/tcg/lm32/test_and.S                     |   45 -
 tests/tcg/lm32/test_andhi.S                   |   35 -
 tests/tcg/lm32/test_andi.S                    |   35 -
 tests/tcg/lm32/test_b.S                       |   13 -
 tests/tcg/lm32/test_be.S                      |   48 -
 tests/tcg/lm32/test_bg.S                      |   78 -
 tests/tcg/lm32/test_bge.S                     |   78 -
 tests/tcg/lm32/test_bgeu.S                    |   78 -
 tests/tcg/lm32/test_bgu.S                     |   78 -
 tests/tcg/lm32/test_bi.S                      |   23 -
 tests/tcg/lm32/test_bne.S                     |   48 -
 tests/tcg/lm32/test_break.S                   |   20 -
 tests/tcg/lm32/test_bret.S                    |   38 -
 tests/tcg/lm32/test_call.S                    |   16 -
 tests/tcg/lm32/test_calli.S                   |   15 -
 tests/tcg/lm32/test_cmpe.S                    |   40 -
 tests/tcg/lm32/test_cmpei.S                   |   35 -
 tests/tcg/lm32/test_cmpg.S                    |   64 -
 tests/tcg/lm32/test_cmpge.S                   |   64 -
 tests/tcg/lm32/test_cmpgei.S                  |   70 -
 tests/tcg/lm32/test_cmpgeu.S                  |   64 -
 tests/tcg/lm32/test_cmpgeui.S                 |   70 -
 tests/tcg/lm32/test_cmpgi.S                   |   70 -
 tests/tcg/lm32/test_cmpgu.S                   |   64 -
 tests/tcg/lm32/test_cmpgui.S                  |   70 -
 tests/tcg/lm32/test_cmpne.S                   |   40 -
 tests/tcg/lm32/test_cmpnei.S                  |   35 -
 tests/tcg/lm32/test_divu.S                    |   29 -
 tests/tcg/lm32/test_eret.S                    |   38 -
 tests/tcg/lm32/test_lb.S                      |   49 -
 tests/tcg/lm32/test_lbu.S                     |   49 -
 tests/tcg/lm32/test_lh.S                      |   49 -
 tests/tcg/lm32/test_lhu.S                     |   49 -
 tests/tcg/lm32/test_lw.S                      |   32 -
 tests/tcg/lm32/test_modu.S                    |   35 -
 tests/tcg/lm32/test_mul.S                     |   70 -
 tests/tcg/lm32/test_muli.S                    |   45 -
 tests/tcg/lm32/test_nor.S                     |   51 -
 tests/tcg/lm32/test_nori.S                    |   35 -
 tests/tcg/lm32/test_or.S                      |   51 -
 tests/tcg/lm32/test_orhi.S                    |   35 -
 tests/tcg/lm32/test_ori.S                     |   35 -
 tests/tcg/lm32/test_ret.S                     |   14 -
 tests/tcg/lm32/test_sb.S                      |   32 -
 tests/tcg/lm32/test_scall.S                   |   24 -
 tests/tcg/lm32/test_sextb.S                   |   20 -
 tests/tcg/lm32/test_sexth.S                   |   20 -
 tests/tcg/lm32/test_sh.S                      |   32 -
 tests/tcg/lm32/test_sl.S                      |   45 -
 tests/tcg/lm32/test_sli.S                     |   30 -
 tests/tcg/lm32/test_sr.S                      |   57 -
 tests/tcg/lm32/test_sri.S                     |   40 -
 tests/tcg/lm32/test_sru.S                     |   57 -
 tests/tcg/lm32/test_srui.S                    |   40 -
 tests/tcg/lm32/test_sub.S                     |   75 -
 tests/tcg/lm32/test_sw.S                      |   38 -
 tests/tcg/lm32/test_xnor.S                    |   51 -
 tests/tcg/lm32/test_xnori.S                   |   35 -
 tests/tcg/lm32/test_xor.S                     |   51 -
 tests/tcg/lm32/test_xori.S                    |   35 -
 208 files changed, 78 insertions(+), 22410 deletions(-)
 delete mode 100644 default-configs/devices/lm32-softmmu.mak
 delete mode 100644 default-configs/devices/moxie-softmmu.mak
 delete mode 100644 default-configs/devices/unicore32-softmmu.mak
 delete mode 100644 default-configs/targets/lm32-softmmu.mak
 delete mode 100644 default-configs/targets/moxie-softmmu.mak
 delete mode 100644 default-configs/targets/unicore32-softmmu.mak
 delete mode 100644 hw/display/milkymist-vgafb_template.h
 delete mode 100644 hw/lm32/lm32.h
 delete mode 100644 hw/lm32/lm32_hwsetup.h
 delete mode 100644 hw/lm32/milkymist-hw.h
 delete mode 100644 include/hw/char/lm32_juart.h
 delete mode 100644 include/hw/display/milkymist_tmu2.h
 delete mode 100644 include/hw/lm32/lm32_pic.h
 delete mode 100644 include/hw/unicore32/puv3.h
 delete mode 100644 target/lm32/cpu-param.h
 delete mode 100644 target/lm32/cpu-qom.h
 delete mode 100644 target/lm32/cpu.h
 delete mode 100644 target/lm32/helper.h
 delete mode 100644 target/moxie/cpu-param.h
 delete mode 100644 target/moxie/cpu.h
 delete mode 100644 target/moxie/helper.h
 delete mode 100644 target/moxie/machine.h
 delete mode 100644 target/moxie/mmu.h
 delete mode 100644 target/unicore32/cpu-param.h
 delete mode 100644 target/unicore32/cpu-qom.h
 delete mode 100644 target/unicore32/cpu.h
 delete mode 100644 target/unicore32/helper.h
 delete mode 100644 block/sheepdog.c
 delete mode 100644 disas/lm32.c
 delete mode 100644 disas/moxie.c
 delete mode 100644 hw/audio/milkymist-ac97.c
 delete mode 100644 hw/char/lm32_juart.c
 delete mode 100644 hw/char/lm32_uart.c
 delete mode 100644 hw/char/milkymist-uart.c
 delete mode 100644 hw/display/milkymist-tmu2.c
 delete mode 100644 hw/display/milkymist-vgafb.c
 delete mode 100644 hw/dma/puv3_dma.c
 delete mode 100644 hw/gpio/puv3_gpio.c
 delete mode 100644 hw/input/milkymist-softusb.c
 delete mode 100644 hw/intc/lm32_pic.c
 delete mode 100644 hw/intc/puv3_intc.c
 delete mode 100644 hw/lm32/lm32_boards.c
 delete mode 100644 hw/lm32/milkymist.c
 delete mode 100644 hw/misc/milkymist-hpdmc.c
 delete mode 100644 hw/misc/milkymist-pfpu.c
 delete mode 100644 hw/misc/puv3_pm.c
 delete mode 100644 hw/moxie/moxiesim.c
 delete mode 100644 hw/net/milkymist-minimac2.c
 delete mode 100644 hw/sd/milkymist-memcard.c
 delete mode 100644 hw/timer/lm32_timer.c
 delete mode 100644 hw/timer/milkymist-sysctl.c
 delete mode 100644 hw/timer/puv3_ost.c
 delete mode 100644 hw/unicore32/puv3.c
 delete mode 100644 target/lm32/cpu.c
 delete mode 100644 target/lm32/gdbstub.c
 delete mode 100644 target/lm32/helper.c
 delete mode 100644 target/lm32/lm32-semi.c
 delete mode 100644 target/lm32/machine.c
 delete mode 100644 target/lm32/op_helper.c
 delete mode 100644 target/lm32/translate.c
 delete mode 100644 target/moxie/cpu.c
 delete mode 100644 target/moxie/helper.c
 delete mode 100644 target/moxie/machine.c
 delete mode 100644 target/moxie/mmu.c
 delete mode 100644 target/moxie/translate.c
 delete mode 100644 target/unicore32/cpu.c
 delete mode 100644 target/unicore32/helper.c
 delete mode 100644 target/unicore32/op_helper.c
 delete mode 100644 target/unicore32/softmmu.c
 delete mode 100644 target/unicore32/translate.c
 delete mode 100644 target/unicore32/ucf64_helper.c
 delete mode 100644 hw/lm32/Kconfig
 delete mode 100644 hw/lm32/meson.build
 delete mode 100644 hw/moxie/Kconfig
 delete mode 100644 hw/moxie/meson.build
 delete mode 100644 hw/unicore32/Kconfig
 delete mode 100644 hw/unicore32/meson.build
 delete mode 100644 target/lm32/README
 delete mode 100644 target/lm32/TODO
 delete mode 100644 target/lm32/meson.build
 delete mode 100644 target/moxie/meson.build
 delete mode 100644 target/unicore32/meson.build
 delete mode 100644 tests/tcg/lm32/Makefile
 delete mode 100644 tests/tcg/lm32/crt.S
 delete mode 100644 tests/tcg/lm32/helper.S
 delete mode 100644 tests/tcg/lm32/linker.ld
 delete mode 100644 tests/tcg/lm32/macros.inc
 delete mode 100644 tests/tcg/lm32/test_add.S
 delete mode 100644 tests/tcg/lm32/test_addi.S
 delete mode 100644 tests/tcg/lm32/test_and.S
 delete mode 100644 tests/tcg/lm32/test_andhi.S
 delete mode 100644 tests/tcg/lm32/test_andi.S
 delete mode 100644 tests/tcg/lm32/test_b.S
 delete mode 100644 tests/tcg/lm32/test_be.S
 delete mode 100644 tests/tcg/lm32/test_bg.S
 delete mode 100644 tests/tcg/lm32/test_bge.S
 delete mode 100644 tests/tcg/lm32/test_bgeu.S
 delete mode 100644 tests/tcg/lm32/test_bgu.S
 delete mode 100644 tests/tcg/lm32/test_bi.S
 delete mode 100644 tests/tcg/lm32/test_bne.S
 delete mode 100644 tests/tcg/lm32/test_break.S
 delete mode 100644 tests/tcg/lm32/test_bret.S
 delete mode 100644 tests/tcg/lm32/test_call.S
 delete mode 100644 tests/tcg/lm32/test_calli.S
 delete mode 100644 tests/tcg/lm32/test_cmpe.S
 delete mode 100644 tests/tcg/lm32/test_cmpei.S
 delete mode 100644 tests/tcg/lm32/test_cmpg.S
 delete mode 100644 tests/tcg/lm32/test_cmpge.S
 delete mode 100644 tests/tcg/lm32/test_cmpgei.S
 delete mode 100644 tests/tcg/lm32/test_cmpgeu.S
 delete mode 100644 tests/tcg/lm32/test_cmpgeui.S
 delete mode 100644 tests/tcg/lm32/test_cmpgi.S
 delete mode 100644 tests/tcg/lm32/test_cmpgu.S
 delete mode 100644 tests/tcg/lm32/test_cmpgui.S
 delete mode 100644 tests/tcg/lm32/test_cmpne.S
 delete mode 100644 tests/tcg/lm32/test_cmpnei.S
 delete mode 100644 tests/tcg/lm32/test_divu.S
 delete mode 100644 tests/tcg/lm32/test_eret.S
 delete mode 100644 tests/tcg/lm32/test_lb.S
 delete mode 100644 tests/tcg/lm32/test_lbu.S
 delete mode 100644 tests/tcg/lm32/test_lh.S
 delete mode 100644 tests/tcg/lm32/test_lhu.S
 delete mode 100644 tests/tcg/lm32/test_lw.S
 delete mode 100644 tests/tcg/lm32/test_modu.S
 delete mode 100644 tests/tcg/lm32/test_mul.S
 delete mode 100644 tests/tcg/lm32/test_muli.S
 delete mode 100644 tests/tcg/lm32/test_nor.S
 delete mode 100644 tests/tcg/lm32/test_nori.S
 delete mode 100644 tests/tcg/lm32/test_or.S
 delete mode 100644 tests/tcg/lm32/test_orhi.S
 delete mode 100644 tests/tcg/lm32/test_ori.S
 delete mode 100644 tests/tcg/lm32/test_ret.S
 delete mode 100644 tests/tcg/lm32/test_sb.S
 delete mode 100644 tests/tcg/lm32/test_scall.S
 delete mode 100644 tests/tcg/lm32/test_sextb.S
 delete mode 100644 tests/tcg/lm32/test_sexth.S
 delete mode 100644 tests/tcg/lm32/test_sh.S
 delete mode 100644 tests/tcg/lm32/test_sl.S
 delete mode 100644 tests/tcg/lm32/test_sli.S
 delete mode 100644 tests/tcg/lm32/test_sr.S
 delete mode 100644 tests/tcg/lm32/test_sri.S
 delete mode 100644 tests/tcg/lm32/test_sru.S
 delete mode 100644 tests/tcg/lm32/test_srui.S
 delete mode 100644 tests/tcg/lm32/test_sub.S
 delete mode 100644 tests/tcg/lm32/test_sw.S
 delete mode 100644 tests/tcg/lm32/test_xnor.S
 delete mode 100644 tests/tcg/lm32/test_xnori.S
 delete mode 100644 tests/tcg/lm32/test_xor.S
 delete mode 100644 tests/tcg/lm32/test_xori.S

-- 
2.26.3


