Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2452437C791
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 18:35:58 +0200 (CEST)
Received: from localhost ([::1]:38308 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgrq1-0006y3-4v
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 12:35:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41308)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lgrfC-0003Sq-My
 for qemu-devel@nongnu.org; Wed, 12 May 2021 12:24:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30456)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lgrf0-0000WH-Fu
 for qemu-devel@nongnu.org; Wed, 12 May 2021 12:24:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620836671;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/W71Lwi2VKYiig3Z/btL2TexifvsXtMH/JP9ceAWYYY=;
 b=ELvrU9NybgJ5lNaZmUsrV56nEOvH4yU9ThdVqBA7EgMPHlS8sdjnfXl3/k4VZcu6x+0+vy
 Ie3LI3GAtW88t6pfOEcDUFkwyzyA8prfG9KYY359TfeOBB+LF8/FnSz1P6YHCob8ny9J/3
 86FgNIIA7vr0ISm/wCExEOP97sWzKwM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-268-5ZKIR_YrPfusEAI-8DF_EA-1; Wed, 12 May 2021 12:24:24 -0400
X-MC-Unique: 5ZKIR_YrPfusEAI-8DF_EA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 64E0AEC1A9;
 Wed, 12 May 2021 16:24:23 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-114-17.ams2.redhat.com
 [10.36.114.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 06C6910016FC;
 Wed, 12 May 2021 16:24:18 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 1B0481138461; Wed, 12 May 2021 18:24:13 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 4/5] Drop the deprecated lm32 target
Date: Wed, 12 May 2021 18:24:11 +0200
Message-Id: <20210512162412.338120-5-armbru@redhat.com>
In-Reply-To: <20210512162412.338120-1-armbru@redhat.com>
References: <20210512162412.338120-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org, Michael Walle <michael@walle.cc>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Target lm32 was deprecated in commit d8498005122, v5.2.0.  See there
for rationale.

Some of its code lives on in device models derived from milkymist
ones: hw/char/digic-uart.c and hw/display/bcm2835_fb.c.

Cc: Michael Walle <michael@walle.cc>
Signed-off-by: Markus Armbruster <armbru@redhat.com>
Message-Id: <20210503084034.3804963-2-armbru@redhat.com>
Acked-by: Michael Walle <michael@walle.cc>
[Trivial conflicts resolved, reST markup fixed]
---
 docs/system/deprecated.rst               |    8 -
 docs/system/removed-features.rst         |    7 +
 configure                                |    7 +-
 default-configs/devices/lm32-softmmu.mak |   12 -
 default-configs/targets/lm32-softmmu.mak |    2 -
 meson.build                              |    3 +-
 qapi/machine.json                        |    2 +-
 hw/display/milkymist-vgafb_template.h    |   74 --
 hw/lm32/lm32.h                           |   48 -
 hw/lm32/lm32_hwsetup.h                   |  179 ----
 hw/lm32/milkymist-hw.h                   |  133 ---
 hw/usb/quirks-ftdi-ids.h                 |    6 -
 hw/usb/quirks.h                          |    1 -
 include/disas/dis-asm.h                  |    3 -
 include/exec/poison.h                    |    2 -
 include/hw/char/lm32_juart.h             |   13 -
 include/hw/display/milkymist_tmu2.h      |   42 -
 include/hw/lm32/lm32_pic.h               |   10 -
 include/sysemu/arch_init.h               |    1 -
 target/lm32/cpu-param.h                  |   17 -
 target/lm32/cpu-qom.h                    |   48 -
 target/lm32/cpu.h                        |  262 -----
 target/lm32/helper.h                     |   14 -
 disas/lm32.c                             |  361 -------
 hw/audio/milkymist-ac97.c                |  360 -------
 hw/char/lm32_juart.c                     |  166 ---
 hw/char/lm32_uart.c                      |  314 ------
 hw/char/milkymist-uart.c                 |  258 -----
 hw/display/milkymist-tmu2.c              |  551 ----------
 hw/display/milkymist-vgafb.c             |  360 -------
 hw/input/milkymist-softusb.c             |  319 ------
 hw/intc/lm32_pic.c                       |  195 ----
 hw/lm32/lm32_boards.c                    |  332 ------
 hw/lm32/milkymist.c                      |  249 -----
 hw/misc/milkymist-hpdmc.c                |  172 ---
 hw/misc/milkymist-pfpu.c                 |  548 ----------
 hw/net/milkymist-minimac2.c              |  547 ----------
 hw/sd/milkymist-memcard.c                |  335 ------
 hw/timer/lm32_timer.c                    |  249 -----
 hw/timer/milkymist-sysctl.c              |  361 -------
 softmmu/arch_init.c                      |    2 -
 target/lm32/cpu.c                        |  274 -----
 target/lm32/gdbstub.c                    |   92 --
 target/lm32/helper.c                     |  224 ----
 target/lm32/lm32-semi.c                  |  211 ----
 target/lm32/machine.c                    |   33 -
 target/lm32/op_helper.c                  |  148 ---
 target/lm32/translate.c                  | 1237 ----------------------
 tests/qtest/machine-none-test.c          |    1 -
 fpu/softfloat-specialize.c.inc           |    2 +-
 .gitlab-ci.yml                           |    2 +-
 MAINTAINERS                              |   25 -
 disas/meson.build                        |    1 -
 hw/Kconfig                               |    1 -
 hw/audio/meson.build                     |    1 -
 hw/audio/trace-events                    |   12 -
 hw/char/meson.build                      |    3 -
 hw/char/trace-events                     |   17 -
 hw/display/Kconfig                       |    4 -
 hw/display/meson.build                   |    2 -
 hw/display/trace-events                  |   10 -
 hw/input/meson.build                     |    1 -
 hw/input/trace-events                    |    7 -
 hw/intc/meson.build                      |    1 -
 hw/intc/trace-events                     |    9 -
 hw/lm32/Kconfig                          |   18 -
 hw/lm32/meson.build                      |    6 -
 hw/meson.build                           |    1 -
 hw/misc/meson.build                      |    1 -
 hw/misc/trace-events                     |   10 -
 hw/net/meson.build                       |    1 -
 hw/net/trace-events                      |   12 -
 hw/sd/meson.build                        |    1 -
 hw/sd/trace-events                       |    4 -
 hw/timer/meson.build                     |    2 -
 hw/timer/trace-events                    |   17 -
 qemu-options.hx                          |    4 +-
 target/lm32/README                       |   45 -
 target/lm32/TODO                         |    1 -
 target/lm32/meson.build                  |   15 -
 target/meson.build                       |    1 -
 tests/tcg/README                         |    6 -
 tests/tcg/configure.sh                   |    2 +-
 tests/tcg/lm32/Makefile                  |  106 --
 tests/tcg/lm32/crt.S                     |   84 --
 tests/tcg/lm32/helper.S                  |   65 --
 tests/tcg/lm32/linker.ld                 |   55 -
 tests/tcg/lm32/macros.inc                |   90 --
 tests/tcg/lm32/test_add.S                |   75 --
 tests/tcg/lm32/test_addi.S               |   56 -
 tests/tcg/lm32/test_and.S                |   45 -
 tests/tcg/lm32/test_andhi.S              |   35 -
 tests/tcg/lm32/test_andi.S               |   35 -
 tests/tcg/lm32/test_b.S                  |   13 -
 tests/tcg/lm32/test_be.S                 |   48 -
 tests/tcg/lm32/test_bg.S                 |   78 --
 tests/tcg/lm32/test_bge.S                |   78 --
 tests/tcg/lm32/test_bgeu.S               |   78 --
 tests/tcg/lm32/test_bgu.S                |   78 --
 tests/tcg/lm32/test_bi.S                 |   23 -
 tests/tcg/lm32/test_bne.S                |   48 -
 tests/tcg/lm32/test_break.S              |   20 -
 tests/tcg/lm32/test_bret.S               |   38 -
 tests/tcg/lm32/test_call.S               |   16 -
 tests/tcg/lm32/test_calli.S              |   15 -
 tests/tcg/lm32/test_cmpe.S               |   40 -
 tests/tcg/lm32/test_cmpei.S              |   35 -
 tests/tcg/lm32/test_cmpg.S               |   64 --
 tests/tcg/lm32/test_cmpge.S              |   64 --
 tests/tcg/lm32/test_cmpgei.S             |   70 --
 tests/tcg/lm32/test_cmpgeu.S             |   64 --
 tests/tcg/lm32/test_cmpgeui.S            |   70 --
 tests/tcg/lm32/test_cmpgi.S              |   70 --
 tests/tcg/lm32/test_cmpgu.S              |   64 --
 tests/tcg/lm32/test_cmpgui.S             |   70 --
 tests/tcg/lm32/test_cmpne.S              |   40 -
 tests/tcg/lm32/test_cmpnei.S             |   35 -
 tests/tcg/lm32/test_divu.S               |   29 -
 tests/tcg/lm32/test_eret.S               |   38 -
 tests/tcg/lm32/test_lb.S                 |   49 -
 tests/tcg/lm32/test_lbu.S                |   49 -
 tests/tcg/lm32/test_lh.S                 |   49 -
 tests/tcg/lm32/test_lhu.S                |   49 -
 tests/tcg/lm32/test_lw.S                 |   32 -
 tests/tcg/lm32/test_modu.S               |   35 -
 tests/tcg/lm32/test_mul.S                |   70 --
 tests/tcg/lm32/test_muli.S               |   45 -
 tests/tcg/lm32/test_nor.S                |   51 -
 tests/tcg/lm32/test_nori.S               |   35 -
 tests/tcg/lm32/test_or.S                 |   51 -
 tests/tcg/lm32/test_orhi.S               |   35 -
 tests/tcg/lm32/test_ori.S                |   35 -
 tests/tcg/lm32/test_ret.S                |   14 -
 tests/tcg/lm32/test_sb.S                 |   32 -
 tests/tcg/lm32/test_scall.S              |   24 -
 tests/tcg/lm32/test_sextb.S              |   20 -
 tests/tcg/lm32/test_sexth.S              |   20 -
 tests/tcg/lm32/test_sh.S                 |   32 -
 tests/tcg/lm32/test_sl.S                 |   45 -
 tests/tcg/lm32/test_sli.S                |   30 -
 tests/tcg/lm32/test_sr.S                 |   57 -
 tests/tcg/lm32/test_sri.S                |   40 -
 tests/tcg/lm32/test_sru.S                |   57 -
 tests/tcg/lm32/test_srui.S               |   40 -
 tests/tcg/lm32/test_sub.S                |   75 --
 tests/tcg/lm32/test_sw.S                 |   38 -
 tests/tcg/lm32/test_xnor.S               |   51 -
 tests/tcg/lm32/test_xnori.S              |   35 -
 tests/tcg/lm32/test_xor.S                |   51 -
 tests/tcg/lm32/test_xori.S               |   35 -
 150 files changed, 17 insertions(+), 12234 deletions(-)
 delete mode 100644 default-configs/devices/lm32-softmmu.mak
 delete mode 100644 default-configs/targets/lm32-softmmu.mak
 delete mode 100644 hw/display/milkymist-vgafb_template.h
 delete mode 100644 hw/lm32/lm32.h
 delete mode 100644 hw/lm32/lm32_hwsetup.h
 delete mode 100644 hw/lm32/milkymist-hw.h
 delete mode 100644 include/hw/char/lm32_juart.h
 delete mode 100644 include/hw/display/milkymist_tmu2.h
 delete mode 100644 include/hw/lm32/lm32_pic.h
 delete mode 100644 target/lm32/cpu-param.h
 delete mode 100644 target/lm32/cpu-qom.h
 delete mode 100644 target/lm32/cpu.h
 delete mode 100644 target/lm32/helper.h
 delete mode 100644 disas/lm32.c
 delete mode 100644 hw/audio/milkymist-ac97.c
 delete mode 100644 hw/char/lm32_juart.c
 delete mode 100644 hw/char/lm32_uart.c
 delete mode 100644 hw/char/milkymist-uart.c
 delete mode 100644 hw/display/milkymist-tmu2.c
 delete mode 100644 hw/display/milkymist-vgafb.c
 delete mode 100644 hw/input/milkymist-softusb.c
 delete mode 100644 hw/intc/lm32_pic.c
 delete mode 100644 hw/lm32/lm32_boards.c
 delete mode 100644 hw/lm32/milkymist.c
 delete mode 100644 hw/misc/milkymist-hpdmc.c
 delete mode 100644 hw/misc/milkymist-pfpu.c
 delete mode 100644 hw/net/milkymist-minimac2.c
 delete mode 100644 hw/sd/milkymist-memcard.c
 delete mode 100644 hw/timer/lm32_timer.c
 delete mode 100644 hw/timer/milkymist-sysctl.c
 delete mode 100644 target/lm32/cpu.c
 delete mode 100644 target/lm32/gdbstub.c
 delete mode 100644 target/lm32/helper.c
 delete mode 100644 target/lm32/lm32-semi.c
 delete mode 100644 target/lm32/machine.c
 delete mode 100644 target/lm32/op_helper.c
 delete mode 100644 target/lm32/translate.c
 delete mode 100644 hw/lm32/Kconfig
 delete mode 100644 hw/lm32/meson.build
 delete mode 100644 target/lm32/README
 delete mode 100644 target/lm32/TODO
 delete mode 100644 target/lm32/meson.build
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

diff --git a/docs/system/deprecated.rst b/docs/system/deprecated.rst
index 7d34da9f68..1199fe93c0 100644
--- a/docs/system/deprecated.rst
+++ b/docs/system/deprecated.rst
@@ -198,14 +198,6 @@ from Linux upstream kernel, declare it deprecated.
 System emulator CPUS
 --------------------
 
-``lm32`` CPUs (since 5.2.0)
-'''''''''''''''''''''''''''
-
-The ``lm32`` guest CPU support is deprecated and will be removed in
-a future version of QEMU. The only public user of this architecture
-was the milkymist project, which has been dead for years; there was
-never an upstream Linux port.
-
 ``unicore32`` CPUs (since 5.2.0)
 ''''''''''''''''''''''''''''''''
 
diff --git a/docs/system/removed-features.rst b/docs/system/removed-features.rst
index 51a79b39cb..4915bc3f63 100644
--- a/docs/system/removed-features.rst
+++ b/docs/system/removed-features.rst
@@ -298,6 +298,13 @@ Nobody was using this CPU emulation in QEMU, and there were no test images
 available to make sure that the code is still working, so it has been removed
 without replacement.
 
+``lm32`` CPUs (removed in 6.1.0)
+''''''''''''''''''''''''''''''''
+
+The only public user of this architecture was the milkymist project,
+which has been dead for years; there was never an upstream Linux
+port.  Removed without replacement.
+
 System emulator machines
 ------------------------
 
diff --git a/configure b/configure
index 87593045cf..cae212988c 100755
--- a/configure
+++ b/configure
@@ -1663,7 +1663,7 @@ if [ "$ARCH" = "unknown" ]; then
 fi
 
 default_target_list=""
-deprecated_targets_list=ppc64abi32-linux-user,lm32-softmmu,unicore32-softmmu
+deprecated_targets_list=ppc64abi32-linux-user,unicore32-softmmu
 deprecated_features=""
 mak_wilds=""
 
@@ -3617,7 +3617,7 @@ case "$fdt" in
 esac
 
 ##########################################
-# opengl probe (for sdl2, gtk, milkymist-tmu2)
+# opengl probe (for sdl2, gtk)
 
 gbm="no"
 if $pkg_config gbm; then
@@ -6274,14 +6274,13 @@ fi
 # UNLINK is used to remove symlinks from older development versions
 # that might get into the way when doing "git update" without doing
 # a "make distclean" in between.
-DIRS="tests tests/tcg tests/tcg/lm32 tests/qapi-schema tests/qtest/libqos"
+DIRS="tests tests/tcg tests/qapi-schema tests/qtest/libqos"
 DIRS="$DIRS tests/qtest tests/qemu-iotests tests/vm tests/fp tests/qgraph"
 DIRS="$DIRS docs docs/interop fsdev scsi"
 DIRS="$DIRS pc-bios/optionrom pc-bios/s390-ccw"
 DIRS="$DIRS roms/seabios"
 DIRS="$DIRS contrib/plugins/"
 LINKS="Makefile"
-LINKS="$LINKS tests/tcg/lm32/Makefile"
 LINKS="$LINKS tests/tcg/Makefile.target"
 LINKS="$LINKS pc-bios/optionrom/Makefile"
 LINKS="$LINKS pc-bios/s390-ccw/Makefile"
diff --git a/default-configs/devices/lm32-softmmu.mak b/default-configs/devices/lm32-softmmu.mak
deleted file mode 100644
index 1bce3f6e8b..0000000000
--- a/default-configs/devices/lm32-softmmu.mak
+++ /dev/null
@@ -1,12 +0,0 @@
-# Default configuration for lm32-softmmu
-
-# Uncomment the following lines to disable these optional devices:
-#
-#CONFIG_MILKYMIST_TMU2=n        # disabling it actually causes compile-time failures
-
-CONFIG_SEMIHOSTING=y
-
-# Boards:
-#
-CONFIG_LM32_EVR=y
-CONFIG_MILKYMIST=y
diff --git a/default-configs/targets/lm32-softmmu.mak b/default-configs/targets/lm32-softmmu.mak
deleted file mode 100644
index 55e7184a3d..0000000000
--- a/default-configs/targets/lm32-softmmu.mak
+++ /dev/null
@@ -1,2 +0,0 @@
-TARGET_ARCH=lm32
-TARGET_WORDS_BIGENDIAN=y
diff --git a/meson.build b/meson.build
index eeb82a4bc6..8e16e05c2a 100644
--- a/meson.build
+++ b/meson.build
@@ -847,7 +847,7 @@ if 'CONFIG_VTE' in config_host
                            link_args: config_host['VTE_LIBS'].split())
 endif
 x11 = not_found
-if gtkx11.found() or 'lm32-softmmu' in target_dirs
+if gtkx11.found()
   x11 = dependency('x11', method: 'pkg-config', required: gtkx11.found(),
                    kwargs: static_kwargs)
 endif
@@ -1210,7 +1210,6 @@ disassemblers = {
   'i386' : ['CONFIG_I386_DIS'],
   'x86_64' : ['CONFIG_I386_DIS'],
   'x32' : ['CONFIG_I386_DIS'],
-  'lm32' : ['CONFIG_LM32_DIS'],
   'm68k' : ['CONFIG_M68K_DIS'],
   'microblaze' : ['CONFIG_MICROBLAZE_DIS'],
   'mips' : ['CONFIG_MIPS_DIS'],
diff --git a/qapi/machine.json b/qapi/machine.json
index f1e2ccceba..37a7e34195 100644
--- a/qapi/machine.json
+++ b/qapi/machine.json
@@ -29,7 +29,7 @@
 # Since: 3.0
 ##
 { 'enum' : 'SysEmuTarget',
-  'data' : [ 'aarch64', 'alpha', 'arm', 'avr', 'cris', 'hppa', 'i386', 'lm32',
+  'data' : [ 'aarch64', 'alpha', 'arm', 'avr', 'cris', 'hppa', 'i386',
              'm68k', 'microblaze', 'microblazeel', 'mips', 'mips64',
              'mips64el', 'mipsel', 'nios2', 'or1k', 'ppc',
              'ppc64', 'riscv32', 'riscv64', 'rx', 's390x', 'sh4',
diff --git a/hw/display/milkymist-vgafb_template.h b/hw/display/milkymist-vgafb_template.h
deleted file mode 100644
index 96137f9709..0000000000
--- a/hw/display/milkymist-vgafb_template.h
+++ /dev/null
@@ -1,74 +0,0 @@
-/*
- *  QEMU model of the Milkymist VGA framebuffer.
- *
- *  Copyright (c) 2010 Michael Walle <michael@walle.cc>
- *
- * This library is free software; you can redistribute it and/or
- * modify it under the terms of the GNU Lesser General Public
- * License as published by the Free Software Foundation; either
- * version 2.1 of the License, or (at your option) any later version.
- *
- * This library is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
- * Lesser General Public License for more details.
- *
- * You should have received a copy of the GNU Lesser General Public
- * License along with this library; if not, see <http://www.gnu.org/licenses/>.
- *
- */
-
-#if BITS == 8
-#define COPY_PIXEL(to, r, g, b)                    \
-    do {                                           \
-        *to = rgb_to_pixel8(r, g, b);              \
-        to += 1;                                   \
-    } while (0)
-#elif BITS == 15
-#define COPY_PIXEL(to, r, g, b)                    \
-    do {                                           \
-        *(uint16_t *)to = rgb_to_pixel15(r, g, b); \
-        to += 2;                                   \
-    } while (0)
-#elif BITS == 16
-#define COPY_PIXEL(to, r, g, b)                    \
-    do {                                           \
-        *(uint16_t *)to = rgb_to_pixel16(r, g, b); \
-        to += 2;                                   \
-    } while (0)
-#elif BITS == 24
-#define COPY_PIXEL(to, r, g, b)                    \
-    do {                                           \
-        uint32_t tmp = rgb_to_pixel24(r, g, b);    \
-        *(to++) =         tmp & 0xff;              \
-        *(to++) =  (tmp >> 8) & 0xff;              \
-        *(to++) = (tmp >> 16) & 0xff;              \
-    } while (0)
-#elif BITS == 32
-#define COPY_PIXEL(to, r, g, b)                    \
-    do {                                           \
-        *(uint32_t *)to = rgb_to_pixel32(r, g, b); \
-        to += 4;                                   \
-    } while (0)
-#else
-#error unknown bit depth
-#endif
-
-static void glue(draw_line_, BITS)(void *opaque, uint8_t *d, const uint8_t *s,
-        int width, int deststep)
-{
-    uint16_t rgb565;
-    uint8_t r, g, b;
-
-    while (width--) {
-        rgb565 = lduw_be_p(s);
-        r = ((rgb565 >> 11) & 0x1f) << 3;
-        g = ((rgb565 >>  5) & 0x3f) << 2;
-        b = ((rgb565 >>  0) & 0x1f) << 3;
-        COPY_PIXEL(d, r, g, b);
-        s += 2;
-    }
-}
-
-#undef BITS
-#undef COPY_PIXEL
diff --git a/hw/lm32/lm32.h b/hw/lm32/lm32.h
deleted file mode 100644
index 7b4f6255b9..0000000000
--- a/hw/lm32/lm32.h
+++ /dev/null
@@ -1,48 +0,0 @@
-#ifndef HW_LM32_H
-#define HW_LM32_H
-
-#include "hw/char/lm32_juart.h"
-#include "hw/qdev-properties.h"
-#include "qapi/error.h"
-
-static inline DeviceState *lm32_pic_init(qemu_irq cpu_irq)
-{
-    DeviceState *dev;
-    SysBusDevice *d;
-
-    dev = qdev_new("lm32-pic");
-    d = SYS_BUS_DEVICE(dev);
-    sysbus_realize_and_unref(d, &error_fatal);
-    sysbus_connect_irq(d, 0, cpu_irq);
-
-    return dev;
-}
-
-static inline DeviceState *lm32_juart_init(Chardev *chr)
-{
-    DeviceState *dev;
-
-    dev = qdev_new(TYPE_LM32_JUART);
-    qdev_prop_set_chr(dev, "chardev", chr);
-    sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
-
-    return dev;
-}
-
-static inline DeviceState *lm32_uart_create(hwaddr addr,
-                                            qemu_irq irq,
-                                            Chardev *chr)
-{
-    DeviceState *dev;
-    SysBusDevice *s;
-
-    dev = qdev_new("lm32-uart");
-    s = SYS_BUS_DEVICE(dev);
-    qdev_prop_set_chr(dev, "chardev", chr);
-    sysbus_realize_and_unref(s, &error_fatal);
-    sysbus_mmio_map(s, 0, addr);
-    sysbus_connect_irq(s, 0, irq);
-    return dev;
-}
-
-#endif
diff --git a/hw/lm32/lm32_hwsetup.h b/hw/lm32/lm32_hwsetup.h
deleted file mode 100644
index e6cd30ad68..0000000000
--- a/hw/lm32/lm32_hwsetup.h
+++ /dev/null
@@ -1,179 +0,0 @@
-/*
- *  LatticeMico32 hwsetup helper functions.
- *
- *  Copyright (c) 2010 Michael Walle <michael@walle.cc>
- *
- * This library is free software; you can redistribute it and/or
- * modify it under the terms of the GNU Lesser General Public
- * License as published by the Free Software Foundation; either
- * version 2.1 of the License, or (at your option) any later version.
- *
- * This library is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
- * Lesser General Public License for more details.
- *
- * You should have received a copy of the GNU Lesser General Public
- * License along with this library; if not, see <http://www.gnu.org/licenses/>.
- */
-
-/*
- * These are helper functions for creating the hardware description blob used
- * in the Theobroma's uClinux port.
- */
-
-#ifndef QEMU_HW_LM32_HWSETUP_H
-#define QEMU_HW_LM32_HWSETUP_H
-
-#include "qemu/cutils.h"
-#include "hw/loader.h"
-
-typedef struct {
-    void *data;
-    void *ptr;
-} HWSetup;
-
-enum hwsetup_tag {
-    HWSETUP_TAG_EOL         = 0,
-    HWSETUP_TAG_CPU         = 1,
-    HWSETUP_TAG_ASRAM       = 2,
-    HWSETUP_TAG_FLASH       = 3,
-    HWSETUP_TAG_SDRAM       = 4,
-    HWSETUP_TAG_OCM         = 5,
-    HWSETUP_TAG_DDR_SDRAM   = 6,
-    HWSETUP_TAG_DDR2_SDRAM  = 7,
-    HWSETUP_TAG_TIMER       = 8,
-    HWSETUP_TAG_UART        = 9,
-    HWSETUP_TAG_GPIO        = 10,
-    HWSETUP_TAG_TRISPEEDMAC = 11,
-    HWSETUP_TAG_I2CM        = 12,
-    HWSETUP_TAG_LEDS        = 13,
-    HWSETUP_TAG_7SEG        = 14,
-    HWSETUP_TAG_SPI_S       = 15,
-    HWSETUP_TAG_SPI_M       = 16,
-};
-
-static inline HWSetup *hwsetup_init(void)
-{
-    HWSetup *hw;
-
-    hw = g_malloc(sizeof(HWSetup));
-    hw->data = g_malloc0(TARGET_PAGE_SIZE);
-    hw->ptr = hw->data;
-
-    return hw;
-}
-
-static inline void hwsetup_free(HWSetup *hw)
-{
-    g_free(hw->data);
-    g_free(hw);
-}
-
-static inline void hwsetup_create_rom(HWSetup *hw,
-        hwaddr base)
-{
-    rom_add_blob("hwsetup", hw->data, TARGET_PAGE_SIZE,
-                 TARGET_PAGE_SIZE, base, NULL, NULL, NULL, NULL, true);
-}
-
-static inline void hwsetup_add_u8(HWSetup *hw, uint8_t u)
-{
-    stb_p(hw->ptr, u);
-    hw->ptr += 1;
-}
-
-static inline void hwsetup_add_u32(HWSetup *hw, uint32_t u)
-{
-    stl_p(hw->ptr, u);
-    hw->ptr += 4;
-}
-
-static inline void hwsetup_add_tag(HWSetup *hw, enum hwsetup_tag t)
-{
-    stl_p(hw->ptr, t);
-    hw->ptr += 4;
-}
-
-static inline void hwsetup_add_str(HWSetup *hw, const char *str)
-{
-    pstrcpy(hw->ptr, 32, str);
-    hw->ptr += 32;
-}
-
-static inline void hwsetup_add_trailer(HWSetup *hw)
-{
-    hwsetup_add_u32(hw, 8); /* size */
-    hwsetup_add_tag(hw, HWSETUP_TAG_EOL);
-}
-
-static inline void hwsetup_add_cpu(HWSetup *hw,
-        const char *name, uint32_t frequency)
-{
-    hwsetup_add_u32(hw, 44); /* size */
-    hwsetup_add_tag(hw, HWSETUP_TAG_CPU);
-    hwsetup_add_str(hw, name);
-    hwsetup_add_u32(hw, frequency);
-}
-
-static inline void hwsetup_add_flash(HWSetup *hw,
-        const char *name, uint32_t base, uint32_t size)
-{
-    hwsetup_add_u32(hw, 52); /* size */
-    hwsetup_add_tag(hw, HWSETUP_TAG_FLASH);
-    hwsetup_add_str(hw, name);
-    hwsetup_add_u32(hw, base);
-    hwsetup_add_u32(hw, size);
-    hwsetup_add_u8(hw, 8); /* read latency */
-    hwsetup_add_u8(hw, 8); /* write latency */
-    hwsetup_add_u8(hw, 25); /* address width */
-    hwsetup_add_u8(hw, 32); /* data width */
-}
-
-static inline void hwsetup_add_ddr_sdram(HWSetup *hw,
-        const char *name, uint32_t base, uint32_t size)
-{
-    hwsetup_add_u32(hw, 48); /* size */
-    hwsetup_add_tag(hw, HWSETUP_TAG_DDR_SDRAM);
-    hwsetup_add_str(hw, name);
-    hwsetup_add_u32(hw, base);
-    hwsetup_add_u32(hw, size);
-}
-
-static inline void hwsetup_add_timer(HWSetup *hw,
-        const char *name, uint32_t base, uint32_t irq)
-{
-    hwsetup_add_u32(hw, 56); /* size */
-    hwsetup_add_tag(hw, HWSETUP_TAG_TIMER);
-    hwsetup_add_str(hw, name);
-    hwsetup_add_u32(hw, base);
-    hwsetup_add_u8(hw, 1); /* wr_tickcount */
-    hwsetup_add_u8(hw, 1); /* rd_tickcount */
-    hwsetup_add_u8(hw, 1); /* start_stop_control */
-    hwsetup_add_u8(hw, 32); /* counter_width */
-    hwsetup_add_u32(hw, 20); /* reload_ticks */
-    hwsetup_add_u8(hw, irq);
-    hwsetup_add_u8(hw, 0); /* padding */
-    hwsetup_add_u8(hw, 0); /* padding */
-    hwsetup_add_u8(hw, 0); /* padding */
-}
-
-static inline void hwsetup_add_uart(HWSetup *hw,
-        const char *name, uint32_t base, uint32_t irq)
-{
-    hwsetup_add_u32(hw, 56); /* size */
-    hwsetup_add_tag(hw, HWSETUP_TAG_UART);
-    hwsetup_add_str(hw, name);
-    hwsetup_add_u32(hw, base);
-    hwsetup_add_u32(hw, 115200); /* baudrate */
-    hwsetup_add_u8(hw, 8); /* databits */
-    hwsetup_add_u8(hw, 1); /* stopbits */
-    hwsetup_add_u8(hw, 1); /* use_interrupt */
-    hwsetup_add_u8(hw, 1); /* block_on_transmit */
-    hwsetup_add_u8(hw, 1); /* block_on_receive */
-    hwsetup_add_u8(hw, 4); /* rx_buffer_size */
-    hwsetup_add_u8(hw, 4); /* tx_buffer_size */
-    hwsetup_add_u8(hw, irq);
-}
-
-#endif /* QEMU_HW_LM32_HWSETUP_H */
diff --git a/hw/lm32/milkymist-hw.h b/hw/lm32/milkymist-hw.h
deleted file mode 100644
index 5dca5d52f5..0000000000
--- a/hw/lm32/milkymist-hw.h
+++ /dev/null
@@ -1,133 +0,0 @@
-#ifndef QEMU_HW_MILKYMIST_HW_H
-#define QEMU_HW_MILKYMIST_HW_H
-
-#include "hw/qdev-core.h"
-#include "net/net.h"
-#include "qapi/error.h"
-
-static inline DeviceState *milkymist_uart_create(hwaddr base,
-                                                 qemu_irq irq,
-                                                 Chardev *chr)
-{
-    DeviceState *dev;
-
-    dev = qdev_new("milkymist-uart");
-    qdev_prop_set_chr(dev, "chardev", chr);
-    sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
-    sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, base);
-    sysbus_connect_irq(SYS_BUS_DEVICE(dev), 0, irq);
-
-    return dev;
-}
-
-static inline DeviceState *milkymist_hpdmc_create(hwaddr base)
-{
-    DeviceState *dev;
-
-    dev = qdev_new("milkymist-hpdmc");
-    sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
-    sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, base);
-
-    return dev;
-}
-
-static inline DeviceState *milkymist_vgafb_create(hwaddr base,
-        uint32_t fb_offset, uint32_t fb_mask)
-{
-    DeviceState *dev;
-
-    dev = qdev_new("milkymist-vgafb");
-    qdev_prop_set_uint32(dev, "fb_offset", fb_offset);
-    qdev_prop_set_uint32(dev, "fb_mask", fb_mask);
-    sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
-    sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, base);
-
-    return dev;
-}
-
-static inline DeviceState *milkymist_sysctl_create(hwaddr base,
-        qemu_irq gpio_irq, qemu_irq timer0_irq, qemu_irq timer1_irq,
-        uint32_t freq_hz, uint32_t system_id, uint32_t capabilities,
-        uint32_t gpio_strappings)
-{
-    DeviceState *dev;
-
-    dev = qdev_new("milkymist-sysctl");
-    qdev_prop_set_uint32(dev, "frequency", freq_hz);
-    qdev_prop_set_uint32(dev, "systemid", system_id);
-    qdev_prop_set_uint32(dev, "capabilities", capabilities);
-    qdev_prop_set_uint32(dev, "gpio_strappings", gpio_strappings);
-    sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
-    sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, base);
-    sysbus_connect_irq(SYS_BUS_DEVICE(dev), 0, gpio_irq);
-    sysbus_connect_irq(SYS_BUS_DEVICE(dev), 1, timer0_irq);
-    sysbus_connect_irq(SYS_BUS_DEVICE(dev), 2, timer1_irq);
-
-    return dev;
-}
-
-static inline DeviceState *milkymist_pfpu_create(hwaddr base,
-        qemu_irq irq)
-{
-    DeviceState *dev;
-
-    dev = qdev_new("milkymist-pfpu");
-    sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
-    sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, base);
-    sysbus_connect_irq(SYS_BUS_DEVICE(dev), 0, irq);
-    return dev;
-}
-
-static inline DeviceState *milkymist_ac97_create(hwaddr base,
-        qemu_irq crrequest_irq, qemu_irq crreply_irq, qemu_irq dmar_irq,
-        qemu_irq dmaw_irq)
-{
-    DeviceState *dev;
-
-    dev = qdev_new("milkymist-ac97");
-    sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
-    sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, base);
-    sysbus_connect_irq(SYS_BUS_DEVICE(dev), 0, crrequest_irq);
-    sysbus_connect_irq(SYS_BUS_DEVICE(dev), 1, crreply_irq);
-    sysbus_connect_irq(SYS_BUS_DEVICE(dev), 2, dmar_irq);
-    sysbus_connect_irq(SYS_BUS_DEVICE(dev), 3, dmaw_irq);
-
-    return dev;
-}
-
-static inline DeviceState *milkymist_minimac2_create(hwaddr base,
-        hwaddr buffers_base, qemu_irq rx_irq, qemu_irq tx_irq)
-{
-    DeviceState *dev;
-
-    qemu_check_nic_model(&nd_table[0], "minimac2");
-    dev = qdev_new("milkymist-minimac2");
-    qdev_set_nic_properties(dev, &nd_table[0]);
-    sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
-    sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, base);
-    sysbus_mmio_map(SYS_BUS_DEVICE(dev), 1, buffers_base);
-    sysbus_connect_irq(SYS_BUS_DEVICE(dev), 0, rx_irq);
-    sysbus_connect_irq(SYS_BUS_DEVICE(dev), 1, tx_irq);
-
-    return dev;
-}
-
-static inline DeviceState *milkymist_softusb_create(hwaddr base,
-        qemu_irq irq, uint32_t pmem_base, uint32_t pmem_size,
-        uint32_t dmem_base, uint32_t dmem_size)
-{
-    DeviceState *dev;
-
-    dev = qdev_new("milkymist-softusb");
-    qdev_prop_set_uint32(dev, "pmem_size", pmem_size);
-    qdev_prop_set_uint32(dev, "dmem_size", dmem_size);
-    sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
-    sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, base);
-    sysbus_mmio_map(SYS_BUS_DEVICE(dev), 1, pmem_base);
-    sysbus_mmio_map(SYS_BUS_DEVICE(dev), 2, dmem_base);
-    sysbus_connect_irq(SYS_BUS_DEVICE(dev), 0, irq);
-
-    return dev;
-}
-
-#endif /* QEMU_HW_MILKYMIST_HW_H */
diff --git a/hw/usb/quirks-ftdi-ids.h b/hw/usb/quirks-ftdi-ids.h
index 57c12ef662..01aca55ca7 100644
--- a/hw/usb/quirks-ftdi-ids.h
+++ b/hw/usb/quirks-ftdi-ids.h
@@ -1221,12 +1221,6 @@
 #define FTDI_SCIENCESCOPE_LS_LOGBOOK_PID	0xFF1C
 #define FTDI_SCIENCESCOPE_HS_LOGBOOK_PID	0xFF1D
 
-/*
- * Milkymist One JTAG/Serial
- */
-#define QIHARDWARE_VID			0x20B7
-#define MILKYMISTONE_JTAGSERIAL_PID	0x0713
-
 /*
  * CTI GmbH RS485 Converter http://www.cti-lean.com/
  */
diff --git a/hw/usb/quirks.h b/hw/usb/quirks.h
index 50ef2f9c2e..c3e595f40b 100644
--- a/hw/usb/quirks.h
+++ b/hw/usb/quirks.h
@@ -904,7 +904,6 @@ static const struct usb_device_id usbredir_ftdi_serial_ids[] = {
     { USB_DEVICE(FTDI_VID, FTDI_SCIENCESCOPE_HS_LOGBOOK_PID) },
     { USB_DEVICE(FTDI_VID, FTDI_CINTERION_MC55I_PID) },
     { USB_DEVICE(FTDI_VID, FTDI_DOTEC_PID) },
-    { USB_DEVICE(QIHARDWARE_VID, MILKYMISTONE_JTAGSERIAL_PID) },
     { USB_DEVICE(ST_VID, ST_STMCLT1030_PID) },
     { USB_DEVICE(FTDI_VID, FTDI_RF_R106) },
     { USB_DEVICE(FTDI_VID, FTDI_DISTORTEC_JTAG_LOCK_PICK_PID) },
diff --git a/include/disas/dis-asm.h b/include/disas/dis-asm.h
index 8e985e7e94..524f29196d 100644
--- a/include/disas/dis-asm.h
+++ b/include/disas/dis-asm.h
@@ -249,8 +249,6 @@ enum bfd_architecture
 #define bfd_mach_nios2          0
 #define bfd_mach_nios2r1        1
 #define bfd_mach_nios2r2        2
-  bfd_arch_lm32,       /* Lattice Mico32 */
-#define bfd_mach_lm32 1
   bfd_arch_rx,       /* Renesas RX */
 #define bfd_mach_rx            0x75
 #define bfd_mach_rx_v2         0x76
@@ -457,7 +455,6 @@ int print_insn_crisv32          (bfd_vma, disassemble_info*);
 int print_insn_crisv10          (bfd_vma, disassemble_info*);
 int print_insn_microblaze       (bfd_vma, disassemble_info*);
 int print_insn_ia64             (bfd_vma, disassemble_info*);
-int print_insn_lm32             (bfd_vma, disassemble_info*);
 int print_insn_big_nios2        (bfd_vma, disassemble_info*);
 int print_insn_little_nios2     (bfd_vma, disassemble_info*);
 int print_insn_xtensa           (bfd_vma, disassemble_info*);
diff --git a/include/exec/poison.h b/include/exec/poison.h
index de972bfd8e..b102e3cbf0 100644
--- a/include/exec/poison.h
+++ b/include/exec/poison.h
@@ -12,7 +12,6 @@
 #pragma GCC poison TARGET_CRIS
 #pragma GCC poison TARGET_HEXAGON
 #pragma GCC poison TARGET_HPPA
-#pragma GCC poison TARGET_LM32
 #pragma GCC poison TARGET_M68K
 #pragma GCC poison TARGET_MICROBLAZE
 #pragma GCC poison TARGET_MIPS
@@ -73,7 +72,6 @@
 #pragma GCC poison CONFIG_HPPA_DIS
 #pragma GCC poison CONFIG_I386_DIS
 #pragma GCC poison CONFIG_HEXAGON_DIS
-#pragma GCC poison CONFIG_LM32_DIS
 #pragma GCC poison CONFIG_M68K_DIS
 #pragma GCC poison CONFIG_MICROBLAZE_DIS
 #pragma GCC poison CONFIG_MIPS_DIS
diff --git a/include/hw/char/lm32_juart.h b/include/hw/char/lm32_juart.h
deleted file mode 100644
index 6fce278326..0000000000
--- a/include/hw/char/lm32_juart.h
+++ /dev/null
@@ -1,13 +0,0 @@
-#ifndef QEMU_HW_CHAR_LM32_JUART_H
-#define QEMU_HW_CHAR_LM32_JUART_H
-
-#include "hw/qdev-core.h"
-
-#define TYPE_LM32_JUART "lm32-juart"
-
-uint32_t lm32_juart_get_jtx(DeviceState *d);
-uint32_t lm32_juart_get_jrx(DeviceState *d);
-void lm32_juart_set_jtx(DeviceState *d, uint32_t jtx);
-void lm32_juart_set_jrx(DeviceState *d, uint32_t jrx);
-
-#endif /* QEMU_HW_CHAR_LM32_JUART_H */
diff --git a/include/hw/display/milkymist_tmu2.h b/include/hw/display/milkymist_tmu2.h
deleted file mode 100644
index fdce9535a1..0000000000
--- a/include/hw/display/milkymist_tmu2.h
+++ /dev/null
@@ -1,42 +0,0 @@
-/*
- *  QEMU model of the Milkymist texture mapping unit.
- *
- *  Copyright (c) 2010 Michael Walle <michael@walle.cc>
- *  Copyright (c) 2010 Sebastien Bourdeauducq
- *                       <sebastien.bourdeauducq@lekernel.net>
- *
- * This library is free software; you can redistribute it and/or
- * modify it under the terms of the GNU Lesser General Public
- * License as published by the Free Software Foundation; either
- * version 2.1 of the License, or (at your option) any later version.
- *
- * This library is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
- * Lesser General Public License for more details.
- *
- * You should have received a copy of the GNU Lesser General Public
- * License along with this library; if not, see <http://www.gnu.org/licenses/>.
- *
- *
- * Specification available at:
- *   http://milkymist.walle.cc/socdoc/tmu2.pdf
- *
- */
-
-#ifndef HW_DISPLAY_MILKYMIST_TMU2_H
-#define HW_DISPLAY_MILKYMIST_TMU2_H
-
-#include "exec/hwaddr.h"
-#include "hw/qdev-core.h"
-
-#if defined(CONFIG_X11) && defined(CONFIG_OPENGL)
-DeviceState *milkymist_tmu2_create(hwaddr base, qemu_irq irq);
-#else
-static inline DeviceState *milkymist_tmu2_create(hwaddr base, qemu_irq irq)
-{
-    return NULL;
-}
-#endif
-
-#endif /* HW_DISPLAY_MILKYMIST_TMU2_H */
diff --git a/include/hw/lm32/lm32_pic.h b/include/hw/lm32/lm32_pic.h
deleted file mode 100644
index 9e5e038437..0000000000
--- a/include/hw/lm32/lm32_pic.h
+++ /dev/null
@@ -1,10 +0,0 @@
-#ifndef QEMU_HW_LM32_PIC_H
-#define QEMU_HW_LM32_PIC_H
-
-
-uint32_t lm32_pic_get_ip(DeviceState *d);
-uint32_t lm32_pic_get_im(DeviceState *d);
-void lm32_pic_set_ip(DeviceState *d, uint32_t ip);
-void lm32_pic_set_im(DeviceState *d, uint32_t im);
-
-#endif /* QEMU_HW_LM32_PIC_H */
diff --git a/include/sysemu/arch_init.h b/include/sysemu/arch_init.h
index 44e3734d18..fc002b84de 100644
--- a/include/sysemu/arch_init.h
+++ b/include/sysemu/arch_init.h
@@ -9,7 +9,6 @@ enum {
     QEMU_ARCH_CRIS = (1 << 2),
     QEMU_ARCH_I386 = (1 << 3),
     QEMU_ARCH_M68K = (1 << 4),
-    QEMU_ARCH_LM32 = (1 << 5),
     QEMU_ARCH_MICROBLAZE = (1 << 6),
     QEMU_ARCH_MIPS = (1 << 7),
     QEMU_ARCH_PPC = (1 << 8),
diff --git a/target/lm32/cpu-param.h b/target/lm32/cpu-param.h
deleted file mode 100644
index d89574ad19..0000000000
--- a/target/lm32/cpu-param.h
+++ /dev/null
@@ -1,17 +0,0 @@
-/*
- * LatticeMico32 cpu parameters for qemu.
- *
- * Copyright (c) 2010 Michael Walle <michael@walle.cc>
- * SPDX-License-Identifier: LGPL-2.0+
- */
-
-#ifndef LM32_CPU_PARAM_H
-#define LM32_CPU_PARAM_H 1
-
-#define TARGET_LONG_BITS 32
-#define TARGET_PAGE_BITS 12
-#define TARGET_PHYS_ADDR_SPACE_BITS 32
-#define TARGET_VIRT_ADDR_SPACE_BITS 32
-#define NB_MMU_MODES 1
-
-#endif
diff --git a/target/lm32/cpu-qom.h b/target/lm32/cpu-qom.h
deleted file mode 100644
index 245b35cd1d..0000000000
--- a/target/lm32/cpu-qom.h
+++ /dev/null
@@ -1,48 +0,0 @@
-/*
- * QEMU LatticeMico32 CPU
- *
- * Copyright (c) 2012 SUSE LINUX Products GmbH
- *
- * This library is free software; you can redistribute it and/or
- * modify it under the terms of the GNU Lesser General Public
- * License as published by the Free Software Foundation; either
- * version 2.1 of the License, or (at your option) any later version.
- *
- * This library is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
- * Lesser General Public License for more details.
- *
- * You should have received a copy of the GNU Lesser General Public
- * License along with this library; if not, see
- * <http://www.gnu.org/licenses/lgpl-2.1.html>
- */
-#ifndef QEMU_LM32_CPU_QOM_H
-#define QEMU_LM32_CPU_QOM_H
-
-#include "hw/core/cpu.h"
-#include "qom/object.h"
-
-#define TYPE_LM32_CPU "lm32-cpu"
-
-OBJECT_DECLARE_TYPE(LM32CPU, LM32CPUClass,
-                    LM32_CPU)
-
-/**
- * LM32CPUClass:
- * @parent_realize: The parent class' realize handler.
- * @parent_reset: The parent class' reset handler.
- *
- * A LatticeMico32 CPU model.
- */
-struct LM32CPUClass {
-    /*< private >*/
-    CPUClass parent_class;
-    /*< public >*/
-
-    DeviceRealize parent_realize;
-    DeviceReset parent_reset;
-};
-
-
-#endif
diff --git a/target/lm32/cpu.h b/target/lm32/cpu.h
deleted file mode 100644
index ea7c01ca8b..0000000000
--- a/target/lm32/cpu.h
+++ /dev/null
@@ -1,262 +0,0 @@
-/*
- *  LatticeMico32 virtual CPU header.
- *
- *  Copyright (c) 2010 Michael Walle <michael@walle.cc>
- *
- * This library is free software; you can redistribute it and/or
- * modify it under the terms of the GNU Lesser General Public
- * License as published by the Free Software Foundation; either
- * version 2.1 of the License, or (at your option) any later version.
- *
- * This library is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
- * Lesser General Public License for more details.
- *
- * You should have received a copy of the GNU Lesser General Public
- * License along with this library; if not, see <http://www.gnu.org/licenses/>.
- */
-
-#ifndef LM32_CPU_H
-#define LM32_CPU_H
-
-#include "cpu-qom.h"
-#include "exec/cpu-defs.h"
-
-typedef struct CPULM32State CPULM32State;
-
-static inline int cpu_mmu_index(CPULM32State *env, bool ifetch)
-{
-    return 0;
-}
-
-/* Exceptions indices */
-enum {
-    EXCP_RESET = 0,
-    EXCP_BREAKPOINT,
-    EXCP_INSN_BUS_ERROR,
-    EXCP_WATCHPOINT,
-    EXCP_DATA_BUS_ERROR,
-    EXCP_DIVIDE_BY_ZERO,
-    EXCP_IRQ,
-    EXCP_SYSTEMCALL
-};
-
-/* Registers */
-enum {
-    R_R0 = 0, R_R1, R_R2, R_R3, R_R4, R_R5, R_R6, R_R7, R_R8, R_R9, R_R10,
-    R_R11, R_R12, R_R13, R_R14, R_R15, R_R16, R_R17, R_R18, R_R19, R_R20,
-    R_R21, R_R22, R_R23, R_R24, R_R25, R_R26, R_R27, R_R28, R_R29, R_R30,
-    R_R31
-};
-
-/* Register aliases */
-enum {
-    R_GP = R_R26,
-    R_FP = R_R27,
-    R_SP = R_R28,
-    R_RA = R_R29,
-    R_EA = R_R30,
-    R_BA = R_R31
-};
-
-/* IE flags */
-enum {
-    IE_IE  = (1<<0),
-    IE_EIE = (1<<1),
-    IE_BIE = (1<<2),
-};
-
-/* DC flags */
-enum {
-    DC_SS  = (1<<0),
-    DC_RE  = (1<<1),
-    DC_C0  = (1<<2),
-    DC_C1  = (1<<3),
-    DC_C2  = (1<<4),
-    DC_C3  = (1<<5),
-};
-
-/* CFG mask */
-enum {
-    CFG_M         = (1<<0),
-    CFG_D         = (1<<1),
-    CFG_S         = (1<<2),
-    CFG_U         = (1<<3),
-    CFG_X         = (1<<4),
-    CFG_CC        = (1<<5),
-    CFG_IC        = (1<<6),
-    CFG_DC        = (1<<7),
-    CFG_G         = (1<<8),
-    CFG_H         = (1<<9),
-    CFG_R         = (1<<10),
-    CFG_J         = (1<<11),
-    CFG_INT_SHIFT = 12,
-    CFG_BP_SHIFT  = 18,
-    CFG_WP_SHIFT  = 22,
-    CFG_REV_SHIFT = 26,
-};
-
-/* CSRs */
-enum {
-    CSR_IE   = 0x00,
-    CSR_IM   = 0x01,
-    CSR_IP   = 0x02,
-    CSR_ICC  = 0x03,
-    CSR_DCC  = 0x04,
-    CSR_CC   = 0x05,
-    CSR_CFG  = 0x06,
-    CSR_EBA  = 0x07,
-    CSR_DC   = 0x08,
-    CSR_DEBA = 0x09,
-    CSR_JTX  = 0x0e,
-    CSR_JRX  = 0x0f,
-    CSR_BP0  = 0x10,
-    CSR_BP1  = 0x11,
-    CSR_BP2  = 0x12,
-    CSR_BP3  = 0x13,
-    CSR_WP0  = 0x18,
-    CSR_WP1  = 0x19,
-    CSR_WP2  = 0x1a,
-    CSR_WP3  = 0x1b,
-};
-
-enum {
-    LM32_FEATURE_MULTIPLY     =  1,
-    LM32_FEATURE_DIVIDE       =  2,
-    LM32_FEATURE_SHIFT        =  4,
-    LM32_FEATURE_SIGN_EXTEND  =  8,
-    LM32_FEATURE_I_CACHE      = 16,
-    LM32_FEATURE_D_CACHE      = 32,
-    LM32_FEATURE_CYCLE_COUNT  = 64,
-};
-
-enum {
-    LM32_FLAG_IGNORE_MSB = 1,
-};
-
-struct CPULM32State {
-    /* general registers */
-    uint32_t regs[32];
-
-    /* special registers */
-    uint32_t pc;        /* program counter */
-    uint32_t ie;        /* interrupt enable */
-    uint32_t icc;       /* instruction cache control */
-    uint32_t dcc;       /* data cache control */
-    uint32_t cc;        /* cycle counter */
-    uint32_t cfg;       /* configuration */
-
-    /* debug registers */
-    uint32_t dc;        /* debug control */
-    uint32_t bp[4];     /* breakpoints */
-    uint32_t wp[4];     /* watchpoints */
-
-    struct CPUBreakpoint *cpu_breakpoint[4];
-    struct CPUWatchpoint *cpu_watchpoint[4];
-
-    /* Fields up to this point are cleared by a CPU reset */
-    struct {} end_reset_fields;
-
-    /* Fields from here on are preserved across CPU reset. */
-    uint32_t eba;       /* exception base address */
-    uint32_t deba;      /* debug exception base address */
-
-    /* interrupt controller handle for callbacks */
-    DeviceState *pic_state;
-    /* JTAG UART handle for callbacks */
-    DeviceState *juart_state;
-
-    /* processor core features */
-    uint32_t flags;
-
-};
-
-/**
- * LM32CPU:
- * @env: #CPULM32State
- *
- * A LatticeMico32 CPU.
- */
-struct LM32CPU {
-    /*< private >*/
-    CPUState parent_obj;
-    /*< public >*/
-
-    CPUNegativeOffsetState neg;
-    CPULM32State env;
-
-    uint32_t revision;
-    uint8_t num_interrupts;
-    uint8_t num_breakpoints;
-    uint8_t num_watchpoints;
-    uint32_t features;
-};
-
-
-#ifndef CONFIG_USER_ONLY
-extern const VMStateDescription vmstate_lm32_cpu;
-#endif
-
-void lm32_cpu_do_interrupt(CPUState *cpu);
-bool lm32_cpu_exec_interrupt(CPUState *cs, int int_req);
-void lm32_cpu_dump_state(CPUState *cpu, FILE *f, int flags);
-hwaddr lm32_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);
-int lm32_cpu_gdb_read_register(CPUState *cpu, GByteArray *buf, int reg);
-int lm32_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg);
-
-typedef enum {
-    LM32_WP_DISABLED = 0,
-    LM32_WP_READ,
-    LM32_WP_WRITE,
-    LM32_WP_READ_WRITE,
-} lm32_wp_t;
-
-static inline lm32_wp_t lm32_wp_type(uint32_t dc, int idx)
-{
-    assert(idx < 4);
-    return (dc >> (idx+1)*2) & 0x3;
-}
-
-/* you can call this signal handler from your SIGBUS and SIGSEGV
-   signal handlers to inform the virtual CPU of exceptions. non zero
-   is returned if the signal was handled by the virtual CPU.  */
-int cpu_lm32_signal_handler(int host_signum, void *pinfo,
-                          void *puc);
-void lm32_cpu_list(void);
-void lm32_translate_init(void);
-void cpu_lm32_set_phys_msb_ignore(CPULM32State *env, int value);
-void QEMU_NORETURN raise_exception(CPULM32State *env, int index);
-void lm32_debug_excp_handler(CPUState *cs);
-void lm32_breakpoint_insert(CPULM32State *env, int index, target_ulong address);
-void lm32_breakpoint_remove(CPULM32State *env, int index);
-void lm32_watchpoint_insert(CPULM32State *env, int index, target_ulong address,
-        lm32_wp_t wp_type);
-void lm32_watchpoint_remove(CPULM32State *env, int index);
-bool lm32_cpu_do_semihosting(CPUState *cs);
-
-#define LM32_CPU_TYPE_SUFFIX "-" TYPE_LM32_CPU
-#define LM32_CPU_TYPE_NAME(model) model LM32_CPU_TYPE_SUFFIX
-#define CPU_RESOLVING_TYPE TYPE_LM32_CPU
-
-#define cpu_list lm32_cpu_list
-#define cpu_signal_handler cpu_lm32_signal_handler
-
-bool lm32_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
-                       MMUAccessType access_type, int mmu_idx,
-                       bool probe, uintptr_t retaddr);
-
-typedef CPULM32State CPUArchState;
-typedef LM32CPU ArchCPU;
-
-#include "exec/cpu-all.h"
-
-static inline void cpu_get_tb_cpu_state(CPULM32State *env, target_ulong *pc,
-                                        target_ulong *cs_base, uint32_t *flags)
-{
-    *pc = env->pc;
-    *cs_base = 0;
-    *flags = 0;
-}
-
-#endif
diff --git a/target/lm32/helper.h b/target/lm32/helper.h
deleted file mode 100644
index 445578c439..0000000000
--- a/target/lm32/helper.h
+++ /dev/null
@@ -1,14 +0,0 @@
-DEF_HELPER_2(raise_exception, void, env, i32)
-DEF_HELPER_1(hlt, void, env)
-DEF_HELPER_3(wcsr_bp, void, env, i32, i32)
-DEF_HELPER_3(wcsr_wp, void, env, i32, i32)
-DEF_HELPER_2(wcsr_dc, void, env, i32)
-DEF_HELPER_2(wcsr_im, void, env, i32)
-DEF_HELPER_2(wcsr_ip, void, env, i32)
-DEF_HELPER_2(wcsr_jtx, void, env, i32)
-DEF_HELPER_2(wcsr_jrx, void, env, i32)
-DEF_HELPER_1(rcsr_im, i32, env)
-DEF_HELPER_1(rcsr_ip, i32, env)
-DEF_HELPER_1(rcsr_jtx, i32, env)
-DEF_HELPER_1(rcsr_jrx, i32, env)
-DEF_HELPER_1(ill, void, env)
diff --git a/disas/lm32.c b/disas/lm32.c
deleted file mode 100644
index 4fbb124534..0000000000
--- a/disas/lm32.c
+++ /dev/null
@@ -1,361 +0,0 @@
-/*
- *  Simple LatticeMico32 disassembler.
- *
- *  Copyright (c) 2012 Michael Walle <michael@walle.cc>
- *
- * This library is free software; you can redistribute it and/or
- * modify it under the terms of the GNU Lesser General Public
- * License as published by the Free Software Foundation; either
- * version 2.1 of the License, or (at your option) any later version.
- *
- * This library is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
- * Lesser General Public License for more details.
- *
- * You should have received a copy of the GNU Lesser General Public
- * License along with this library; if not, see <http://www.gnu.org/licenses/>.
- *
- */
-
-#include "qemu/osdep.h"
-#include "disas/dis-asm.h"
-
-typedef enum {
-    LM32_OP_SRUI = 0, LM32_OP_NORI, LM32_OP_MULI, LM32_OP_SH, LM32_OP_LB,
-    LM32_OP_SRI, LM32_OP_XORI, LM32_OP_LH, LM32_OP_ANDI, LM32_OP_XNORI,
-    LM32_OP_LW, LM32_OP_LHU, LM32_OP_SB, LM32_OP_ADDI, LM32_OP_ORI,
-    LM32_OP_SLI, LM32_OP_LBU, LM32_OP_BE, LM32_OP_BG, LM32_OP_BGE,
-    LM32_OP_BGEU, LM32_OP_BGU, LM32_OP_SW, LM32_OP_BNE, LM32_OP_ANDHI,
-    LM32_OP_CMPEI, LM32_OP_CMPGI, LM32_OP_CMPGEI, LM32_OP_CMPGEUI,
-    LM32_OP_CMPGUI, LM32_OP_ORHI, LM32_OP_CMPNEI, LM32_OP_SRU, LM32_OP_NOR,
-    LM32_OP_MUL, LM32_OP_DIVU, LM32_OP_RCSR, LM32_OP_SR, LM32_OP_XOR,
-    LM32_OP_ILL0, LM32_OP_AND, LM32_OP_XNOR, LM32_OP_ILL1, LM32_OP_SCALL,
-    LM32_OP_SEXTB, LM32_OP_ADD, LM32_OP_OR, LM32_OP_SL, LM32_OP_B,
-    LM32_OP_MODU, LM32_OP_SUB, LM32_OP_ILL2, LM32_OP_WCSR, LM32_OP_ILL3,
-    LM32_OP_CALL, LM32_OP_SEXTH, LM32_OP_BI, LM32_OP_CMPE, LM32_OP_CMPG,
-    LM32_OP_CMPGE, LM32_OP_CMPGEU, LM32_OP_CMPGU, LM32_OP_CALLI, LM32_OP_CMPNE,
-} Lm32Opcode;
-
-typedef enum {
-    FMT_INVALID = 0, FMT_RRI5, FMT_RRI16, FMT_IMM26, FMT_LOAD, FMT_STORE,
-    FMT_RRR, FMT_R, FMT_RNR, FMT_CRN, FMT_CNR, FMT_BREAK,
-} Lm32OpcodeFmt;
-
-typedef enum {
-    LM32_CSR_IE = 0, LM32_CSR_IM, LM32_CSR_IP, LM32_CSR_ICC, LM32_CSR_DCC,
-    LM32_CSR_CC, LM32_CSR_CFG, LM32_CSR_EBA, LM32_CSR_DC, LM32_CSR_DEBA,
-    LM32_CSR_CFG2, LM32_CSR_JTX = 0xe, LM32_CSR_JRX, LM32_CSR_BP0,
-    LM32_CSR_BP1, LM32_CSR_BP2, LM32_CSR_BP3, LM32_CSR_WP0 = 0x18,
-    LM32_CSR_WP1, LM32_CSR_WP2, LM32_CSR_WP3,
-} Lm32CsrNum;
-
-typedef struct {
-    int csr;
-    const char *name;
-} Lm32CsrInfo;
-
-static const Lm32CsrInfo lm32_csr_info[] = {
-    {LM32_CSR_IE,   "ie", },
-    {LM32_CSR_IM,   "im", },
-    {LM32_CSR_IP,   "ip", },
-    {LM32_CSR_ICC,  "icc", },
-    {LM32_CSR_DCC,  "dcc", },
-    {LM32_CSR_CC,   "cc", },
-    {LM32_CSR_CFG,  "cfg", },
-    {LM32_CSR_EBA,  "eba", },
-    {LM32_CSR_DC,   "dc", },
-    {LM32_CSR_DEBA, "deba", },
-    {LM32_CSR_CFG2, "cfg2", },
-    {LM32_CSR_JTX,  "jtx", },
-    {LM32_CSR_JRX,  "jrx", },
-    {LM32_CSR_BP0,  "bp0", },
-    {LM32_CSR_BP1,  "bp1", },
-    {LM32_CSR_BP2,  "bp2", },
-    {LM32_CSR_BP3,  "bp3", },
-    {LM32_CSR_WP0,  "wp0", },
-    {LM32_CSR_WP1,  "wp1", },
-    {LM32_CSR_WP2,  "wp2", },
-    {LM32_CSR_WP3,  "wp3", },
-};
-
-static const Lm32CsrInfo *find_csr_info(int csr)
-{
-    const Lm32CsrInfo *info;
-    int i;
-
-    for (i = 0; i < ARRAY_SIZE(lm32_csr_info); i++) {
-        info = &lm32_csr_info[i];
-        if (csr == info->csr) {
-            return info;
-        }
-    }
-
-    return NULL;
-}
-
-typedef struct {
-    int reg;
-    const char *name;
-} Lm32RegInfo;
-
-typedef enum {
-    LM32_REG_R0 = 0, LM32_REG_R1, LM32_REG_R2, LM32_REG_R3, LM32_REG_R4,
-    LM32_REG_R5, LM32_REG_R6, LM32_REG_R7, LM32_REG_R8, LM32_REG_R9,
-    LM32_REG_R10, LM32_REG_R11, LM32_REG_R12, LM32_REG_R13, LM32_REG_R14,
-    LM32_REG_R15, LM32_REG_R16, LM32_REG_R17, LM32_REG_R18, LM32_REG_R19,
-    LM32_REG_R20, LM32_REG_R21, LM32_REG_R22, LM32_REG_R23, LM32_REG_R24,
-    LM32_REG_R25, LM32_REG_GP, LM32_REG_FP, LM32_REG_SP, LM32_REG_RA,
-    LM32_REG_EA, LM32_REG_BA,
-} Lm32RegNum;
-
-static const Lm32RegInfo lm32_reg_info[] = {
-    {LM32_REG_R0,  "r0", },
-    {LM32_REG_R1,  "r1", },
-    {LM32_REG_R2,  "r2", },
-    {LM32_REG_R3,  "r3", },
-    {LM32_REG_R4,  "r4", },
-    {LM32_REG_R5,  "r5", },
-    {LM32_REG_R6,  "r6", },
-    {LM32_REG_R7,  "r7", },
-    {LM32_REG_R8,  "r8", },
-    {LM32_REG_R9,  "r9", },
-    {LM32_REG_R10, "r10", },
-    {LM32_REG_R11, "r11", },
-    {LM32_REG_R12, "r12", },
-    {LM32_REG_R13, "r13", },
-    {LM32_REG_R14, "r14", },
-    {LM32_REG_R15, "r15", },
-    {LM32_REG_R16, "r16", },
-    {LM32_REG_R17, "r17", },
-    {LM32_REG_R18, "r18", },
-    {LM32_REG_R19, "r19", },
-    {LM32_REG_R20, "r20", },
-    {LM32_REG_R21, "r21", },
-    {LM32_REG_R22, "r22", },
-    {LM32_REG_R23, "r23", },
-    {LM32_REG_R24, "r24", },
-    {LM32_REG_R25, "r25", },
-    {LM32_REG_GP,  "gp", },
-    {LM32_REG_FP,  "fp", },
-    {LM32_REG_SP,  "sp", },
-    {LM32_REG_RA,  "ra", },
-    {LM32_REG_EA,  "ea", },
-    {LM32_REG_BA,  "ba", },
-};
-
-static const Lm32RegInfo *find_reg_info(int reg)
-{
-    assert(ARRAY_SIZE(lm32_reg_info) == 32);
-    return &lm32_reg_info[reg & 0x1f];
-}
-
-typedef struct {
-    struct {
-        uint32_t code;
-        uint32_t mask;
-    } op;
-    const char *name;
-    const char *args_fmt;
-} Lm32OpcodeInfo;
-
-static const Lm32OpcodeInfo lm32_opcode_info[] = {
-    /* pseudo instructions */
-    {{0x34000000, 0xffffffff}, "nop",   NULL},
-    {{0xac000002, 0xffffffff}, "break", NULL},
-    {{0xac000003, 0xffffffff}, "scall", NULL},
-    {{0xc3e00000, 0xffffffff}, "bret",  NULL},
-    {{0xc3c00000, 0xffffffff}, "eret",  NULL},
-    {{0xc3a00000, 0xffffffff}, "ret",   NULL},
-    {{0xa4000000, 0xfc1f07ff}, "not",   "%2, %0"},
-    {{0xb8000000, 0xfc1f07ff}, "mv",    "%2, %0"},
-    {{0x71e00000, 0xffe00000}, "mvhi",  "%1, %u"},
-    {{0x34000000, 0xffe00000}, "mvi",   "%1, %s"},
-
-#define _O(op) {op << 26, 0x3f << 26}
-    /* regular opcodes */
-    {_O(LM32_OP_ADD),     "add",     "%2, %0, %1"  },
-    {_O(LM32_OP_ADDI),    "addi",    "%1, %0, %s"  },
-    {_O(LM32_OP_AND),     "and",     "%2, %0, %1"  },
-    {_O(LM32_OP_ANDHI),   "andhi",   "%1, %0, %u"  },
-    {_O(LM32_OP_ANDI),    "andi",    "%1, %0, %u"  },
-    {_O(LM32_OP_B),       "b",       "%0",         },
-    {_O(LM32_OP_BE),      "be",      "%1, %0, %r"  },
-    {_O(LM32_OP_BG),      "bg",      "%1, %0, %r"  },
-    {_O(LM32_OP_BGE),     "bge",     "%1, %0, %r"  },
-    {_O(LM32_OP_BGEU),    "bgeu",    "%1, %0, %r"  },
-    {_O(LM32_OP_BGU),     "bgu",     "%1, %0, %r"  },
-    {_O(LM32_OP_BI),      "bi",      "%R",         },
-    {_O(LM32_OP_BNE),     "bne",     "%1, %0, %r"  },
-    {_O(LM32_OP_CALL),    "call",    "%0",         },
-    {_O(LM32_OP_CALLI),   "calli",   "%R",         },
-    {_O(LM32_OP_CMPE),    "cmpe",    "%2, %0, %1"  },
-    {_O(LM32_OP_CMPEI),   "cmpei",   "%1, %0, %s"  },
-    {_O(LM32_OP_CMPG),    "cmpg",    "%2, %0, %1"  },
-    {_O(LM32_OP_CMPGE),   "cmpge",   "%2, %0, %1"  },
-    {_O(LM32_OP_CMPGEI),  "cmpgei",  "%1, %0, %s"  },
-    {_O(LM32_OP_CMPGEU),  "cmpgeu",  "%2, %0, %1"  },
-    {_O(LM32_OP_CMPGEUI), "cmpgeui", "%1, %0, %s"  },
-    {_O(LM32_OP_CMPGI),   "cmpgi",   "%1, %0, %s"  },
-    {_O(LM32_OP_CMPGU),   "cmpgu",   "%2, %0, %1"  },
-    {_O(LM32_OP_CMPGUI),  "cmpgui",  "%1, %0, %s"  },
-    {_O(LM32_OP_CMPNE),   "cmpne",   "%2, %0, %1"  },
-    {_O(LM32_OP_CMPNEI),  "cmpnei",  "%1, %0, %s"  },
-    {_O(LM32_OP_DIVU),    "divu",    "%2, %0, %1"  },
-    {_O(LM32_OP_LB),      "lb",      "%1, (%0+%s)" },
-    {_O(LM32_OP_LBU),     "lbu",     "%1, (%0+%s)" },
-    {_O(LM32_OP_LH),      "lh",      "%1, (%0+%s)" },
-    {_O(LM32_OP_LHU),     "lhu",     "%1, (%0+%s)" },
-    {_O(LM32_OP_LW),      "lw",      "%1, (%0+%s)" },
-    {_O(LM32_OP_MODU),    "modu",    "%2, %0, %1"  },
-    {_O(LM32_OP_MULI),    "muli",    "%1, %0, %s"  },
-    {_O(LM32_OP_MUL),     "mul",     "%2, %0, %1"  },
-    {_O(LM32_OP_NORI),    "nori",    "%1, %0, %u"  },
-    {_O(LM32_OP_NOR),     "nor",     "%2, %0, %1"  },
-    {_O(LM32_OP_ORHI),    "orhi",    "%1, %0, %u"  },
-    {_O(LM32_OP_ORI),     "ori",     "%1, %0, %u"  },
-    {_O(LM32_OP_OR),      "or",      "%2, %0, %1"  },
-    {_O(LM32_OP_RCSR),    "rcsr",    "%2, %c",     },
-    {_O(LM32_OP_SB),      "sb",      "(%0+%s), %1" },
-    {_O(LM32_OP_SEXTB),   "sextb",   "%2, %0",     },
-    {_O(LM32_OP_SEXTH),   "sexth",   "%2, %0",     },
-    {_O(LM32_OP_SH),      "sh",      "(%0+%s), %1" },
-    {_O(LM32_OP_SLI),     "sli",     "%1, %0, %h"  },
-    {_O(LM32_OP_SL),      "sl",      "%2, %0, %1"  },
-    {_O(LM32_OP_SRI),     "sri",     "%1, %0, %h"  },
-    {_O(LM32_OP_SR),      "sr",      "%2, %0, %1"  },
-    {_O(LM32_OP_SRUI),    "srui",    "%1, %0, %d"  },
-    {_O(LM32_OP_SRU),     "sru",     "%2, %0, %s"  },
-    {_O(LM32_OP_SUB),     "sub",     "%2, %0, %s"  },
-    {_O(LM32_OP_SW),      "sw",      "(%0+%s), %1" },
-    {_O(LM32_OP_WCSR),    "wcsr",    "%c, %1",     },
-    {_O(LM32_OP_XNORI),   "xnori",   "%1, %0, %u"  },
-    {_O(LM32_OP_XNOR),    "xnor",    "%2, %0, %1"  },
-    {_O(LM32_OP_XORI),    "xori",    "%1, %0, %u"  },
-    {_O(LM32_OP_XOR),     "xor",     "%2, %0, %1"  },
-#undef _O
-};
-
-static const Lm32OpcodeInfo *find_opcode_info(uint32_t opcode)
-{
-    const Lm32OpcodeInfo *info;
-    int i;
-    for (i = 0; i < ARRAY_SIZE(lm32_opcode_info); i++) {
-        info = &lm32_opcode_info[i];
-        if ((opcode & info->op.mask) == info->op.code) {
-            return info;
-        }
-    }
-
-    return NULL;
-}
-
-int print_insn_lm32(bfd_vma memaddr, struct disassemble_info *info)
-{
-    fprintf_function fprintf_fn = info->fprintf_func;
-    void *stream = info->stream;
-    int rc;
-    uint8_t insn[4];
-    const Lm32OpcodeInfo *opc_info;
-    uint32_t op;
-    const char *args_fmt;
-
-    rc = info->read_memory_func(memaddr, insn, 4, info);
-    if (rc != 0) {
-        info->memory_error_func(rc, memaddr, info);
-        return -1;
-    }
-
-    fprintf_fn(stream, "%02x %02x %02x %02x    ",
-            insn[0], insn[1], insn[2], insn[3]);
-
-    op = bfd_getb32(insn);
-    opc_info = find_opcode_info(op);
-    if (opc_info) {
-        fprintf_fn(stream, "%-8s ", opc_info->name);
-        args_fmt = opc_info->args_fmt;
-        while (args_fmt && *args_fmt) {
-            if (*args_fmt == '%') {
-                switch (*(++args_fmt)) {
-                case '0': {
-                    uint8_t r0;
-                    const char *r0_name;
-                    r0 = (op >> 21) & 0x1f;
-                    r0_name = find_reg_info(r0)->name;
-                    fprintf_fn(stream, "%s", r0_name);
-                    break;
-                }
-                case '1': {
-                    uint8_t r1;
-                    const char *r1_name;
-                    r1 = (op >> 16) & 0x1f;
-                    r1_name = find_reg_info(r1)->name;
-                    fprintf_fn(stream, "%s", r1_name);
-                    break;
-                }
-                case '2': {
-                    uint8_t r2;
-                    const char *r2_name;
-                    r2 = (op >> 11) & 0x1f;
-                    r2_name = find_reg_info(r2)->name;
-                    fprintf_fn(stream, "%s", r2_name);
-                    break;
-                }
-                case 'c': {
-                    uint8_t csr;
-                    const Lm32CsrInfo *info;
-                    csr = (op >> 21) & 0x1f;
-                    info = find_csr_info(csr);
-                    if (info) {
-                        fprintf_fn(stream, "%s", info->name);
-                    } else {
-                        fprintf_fn(stream, "0x%x", csr);
-                    }
-                    break;
-                }
-                case 'u': {
-                    uint16_t u16;
-                    u16 = op & 0xffff;
-                    fprintf_fn(stream, "0x%x", u16);
-                    break;
-                }
-                case 's': {
-                    int16_t s16;
-                    s16 = (int16_t)(op & 0xffff);
-                    fprintf_fn(stream, "%d", s16);
-                    break;
-                }
-                case 'r': {
-                    uint32_t rela;
-                    rela = memaddr + (((int16_t)(op & 0xffff)) << 2);
-                    fprintf_fn(stream, "%x", rela);
-                    break;
-                }
-                case 'R': {
-                    uint32_t rela;
-                    int32_t imm26;
-                    imm26 = (int32_t)((op & 0x3ffffff) << 6) >> 4;
-                    rela = memaddr + imm26;
-                    fprintf_fn(stream, "%x", rela);
-                    break;
-                }
-                case 'h': {
-                    uint8_t u5;
-                    u5 = (op & 0x1f);
-                    fprintf_fn(stream, "%d", u5);
-                    break;
-                }
-                default:
-                    break;
-                }
-            } else {
-                fprintf_fn(stream, "%c", *args_fmt);
-            }
-            args_fmt++;
-        }
-    } else {
-        fprintf_fn(stream, ".word 0x%x", op);
-    }
-
-    return 4;
-}
diff --git a/hw/audio/milkymist-ac97.c b/hw/audio/milkymist-ac97.c
deleted file mode 100644
index 7d2e057038..0000000000
--- a/hw/audio/milkymist-ac97.c
+++ /dev/null
@@ -1,360 +0,0 @@
-/*
- *  QEMU model of the Milkymist System Controller.
- *
- *  Copyright (c) 2010 Michael Walle <michael@walle.cc>
- *
- * This library is free software; you can redistribute it and/or
- * modify it under the terms of the GNU Lesser General Public
- * License as published by the Free Software Foundation; either
- * version 2.1 of the License, or (at your option) any later version.
- *
- * This library is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
- * Lesser General Public License for more details.
- *
- * You should have received a copy of the GNU Lesser General Public
- * License along with this library; if not, see <http://www.gnu.org/licenses/>.
- *
- *
- * Specification available at:
- *   http://milkymist.walle.cc/socdoc/ac97.pdf
- */
-
-#include "qemu/osdep.h"
-#include "hw/irq.h"
-#include "hw/sysbus.h"
-#include "migration/vmstate.h"
-#include "trace.h"
-#include "audio/audio.h"
-#include "qemu/error-report.h"
-#include "qemu/module.h"
-#include "qom/object.h"
-
-enum {
-    R_AC97_CTRL = 0,
-    R_AC97_ADDR,
-    R_AC97_DATAOUT,
-    R_AC97_DATAIN,
-    R_D_CTRL,
-    R_D_ADDR,
-    R_D_REMAINING,
-    R_RESERVED,
-    R_U_CTRL,
-    R_U_ADDR,
-    R_U_REMAINING,
-    R_MAX
-};
-
-enum {
-    AC97_CTRL_RQEN  = (1<<0),
-    AC97_CTRL_WRITE = (1<<1),
-};
-
-enum {
-    CTRL_EN = (1<<0),
-};
-
-#define TYPE_MILKYMIST_AC97 "milkymist-ac97"
-OBJECT_DECLARE_SIMPLE_TYPE(MilkymistAC97State, MILKYMIST_AC97)
-
-struct MilkymistAC97State {
-    SysBusDevice parent_obj;
-
-    MemoryRegion regs_region;
-
-    QEMUSoundCard card;
-    SWVoiceIn *voice_in;
-    SWVoiceOut *voice_out;
-
-    uint32_t regs[R_MAX];
-
-    qemu_irq crrequest_irq;
-    qemu_irq crreply_irq;
-    qemu_irq dmar_irq;
-    qemu_irq dmaw_irq;
-};
-
-static void update_voices(MilkymistAC97State *s)
-{
-    if (s->regs[R_D_CTRL] & CTRL_EN) {
-        AUD_set_active_out(s->voice_out, 1);
-    } else {
-        AUD_set_active_out(s->voice_out, 0);
-    }
-
-    if (s->regs[R_U_CTRL] & CTRL_EN) {
-        AUD_set_active_in(s->voice_in, 1);
-    } else {
-        AUD_set_active_in(s->voice_in, 0);
-    }
-}
-
-static uint64_t ac97_read(void *opaque, hwaddr addr,
-                          unsigned size)
-{
-    MilkymistAC97State *s = opaque;
-    uint32_t r = 0;
-
-    addr >>= 2;
-    switch (addr) {
-    case R_AC97_CTRL:
-    case R_AC97_ADDR:
-    case R_AC97_DATAOUT:
-    case R_AC97_DATAIN:
-    case R_D_CTRL:
-    case R_D_ADDR:
-    case R_D_REMAINING:
-    case R_U_CTRL:
-    case R_U_ADDR:
-    case R_U_REMAINING:
-        r = s->regs[addr];
-        break;
-
-    default:
-        error_report("milkymist_ac97: read access to unknown register 0x"
-                TARGET_FMT_plx, addr << 2);
-        break;
-    }
-
-    trace_milkymist_ac97_memory_read(addr << 2, r);
-
-    return r;
-}
-
-static void ac97_write(void *opaque, hwaddr addr, uint64_t value,
-                       unsigned size)
-{
-    MilkymistAC97State *s = opaque;
-
-    trace_milkymist_ac97_memory_write(addr, value);
-
-    addr >>= 2;
-    switch (addr) {
-    case R_AC97_CTRL:
-        /* always raise an IRQ according to the direction */
-        if (value & AC97_CTRL_RQEN) {
-            if (value & AC97_CTRL_WRITE) {
-                trace_milkymist_ac97_pulse_irq_crrequest();
-                qemu_irq_pulse(s->crrequest_irq);
-            } else {
-                trace_milkymist_ac97_pulse_irq_crreply();
-                qemu_irq_pulse(s->crreply_irq);
-            }
-        }
-
-        /* RQEN is self clearing */
-        s->regs[addr] = value & ~AC97_CTRL_RQEN;
-        break;
-    case R_D_CTRL:
-    case R_U_CTRL:
-        s->regs[addr] = value;
-        update_voices(s);
-        break;
-    case R_AC97_ADDR:
-    case R_AC97_DATAOUT:
-    case R_AC97_DATAIN:
-    case R_D_ADDR:
-    case R_D_REMAINING:
-    case R_U_ADDR:
-    case R_U_REMAINING:
-        s->regs[addr] = value;
-        break;
-
-    default:
-        error_report("milkymist_ac97: write access to unknown register 0x"
-                TARGET_FMT_plx, addr);
-        break;
-    }
-
-}
-
-static const MemoryRegionOps ac97_mmio_ops = {
-    .read = ac97_read,
-    .write = ac97_write,
-    .valid = {
-        .min_access_size = 4,
-        .max_access_size = 4,
-    },
-    .endianness = DEVICE_NATIVE_ENDIAN,
-};
-
-static void ac97_in_cb(void *opaque, int avail_b)
-{
-    MilkymistAC97State *s = opaque;
-    uint8_t buf[4096];
-    uint32_t remaining = s->regs[R_U_REMAINING];
-    int temp = MIN(remaining, avail_b);
-    uint32_t addr = s->regs[R_U_ADDR];
-    int transferred = 0;
-
-    trace_milkymist_ac97_in_cb(avail_b, remaining);
-
-    /* prevent from raising an IRQ */
-    if (temp == 0) {
-        return;
-    }
-
-    while (temp) {
-        int acquired, to_copy;
-
-        to_copy = MIN(temp, sizeof(buf));
-        acquired = AUD_read(s->voice_in, buf, to_copy);
-        if (!acquired) {
-            break;
-        }
-
-        cpu_physical_memory_write(addr, buf, acquired);
-
-        temp -= acquired;
-        addr += acquired;
-        transferred += acquired;
-    }
-
-    trace_milkymist_ac97_in_cb_transferred(transferred);
-
-    s->regs[R_U_ADDR] = addr;
-    s->regs[R_U_REMAINING] -= transferred;
-
-    if ((s->regs[R_U_CTRL] & CTRL_EN) && (s->regs[R_U_REMAINING] == 0)) {
-        trace_milkymist_ac97_pulse_irq_dmaw();
-        qemu_irq_pulse(s->dmaw_irq);
-    }
-}
-
-static void ac97_out_cb(void *opaque, int free_b)
-{
-    MilkymistAC97State *s = opaque;
-    uint8_t buf[4096];
-    uint32_t remaining = s->regs[R_D_REMAINING];
-    int temp = MIN(remaining, free_b);
-    uint32_t addr = s->regs[R_D_ADDR];
-    int transferred = 0;
-
-    trace_milkymist_ac97_out_cb(free_b, remaining);
-
-    /* prevent from raising an IRQ */
-    if (temp == 0) {
-        return;
-    }
-
-    while (temp) {
-        int copied, to_copy;
-
-        to_copy = MIN(temp, sizeof(buf));
-        cpu_physical_memory_read(addr, buf, to_copy);
-        copied = AUD_write(s->voice_out, buf, to_copy);
-        if (!copied) {
-            break;
-        }
-        temp -= copied;
-        addr += copied;
-        transferred += copied;
-    }
-
-    trace_milkymist_ac97_out_cb_transferred(transferred);
-
-    s->regs[R_D_ADDR] = addr;
-    s->regs[R_D_REMAINING] -= transferred;
-
-    if ((s->regs[R_D_CTRL] & CTRL_EN) && (s->regs[R_D_REMAINING] == 0)) {
-        trace_milkymist_ac97_pulse_irq_dmar();
-        qemu_irq_pulse(s->dmar_irq);
-    }
-}
-
-static void milkymist_ac97_reset(DeviceState *d)
-{
-    MilkymistAC97State *s = MILKYMIST_AC97(d);
-    int i;
-
-    for (i = 0; i < R_MAX; i++) {
-        s->regs[i] = 0;
-    }
-
-    AUD_set_active_in(s->voice_in, 0);
-    AUD_set_active_out(s->voice_out, 0);
-}
-
-static int ac97_post_load(void *opaque, int version_id)
-{
-    MilkymistAC97State *s = opaque;
-
-    update_voices(s);
-
-    return 0;
-}
-
-static void milkymist_ac97_init(Object *obj)
-{
-    MilkymistAC97State *s = MILKYMIST_AC97(obj);
-    SysBusDevice *dev = SYS_BUS_DEVICE(obj);
-
-    sysbus_init_irq(dev, &s->crrequest_irq);
-    sysbus_init_irq(dev, &s->crreply_irq);
-    sysbus_init_irq(dev, &s->dmar_irq);
-    sysbus_init_irq(dev, &s->dmaw_irq);
-
-    memory_region_init_io(&s->regs_region, obj, &ac97_mmio_ops, s,
-            "milkymist-ac97", R_MAX * 4);
-    sysbus_init_mmio(dev, &s->regs_region);
-}
-
-static void milkymist_ac97_realize(DeviceState *dev, Error **errp)
-{
-    MilkymistAC97State *s = MILKYMIST_AC97(dev);
-    struct audsettings as;
-
-    AUD_register_card("Milkymist AC'97", &s->card);
-
-    as.freq = 48000;
-    as.nchannels = 2;
-    as.fmt = AUDIO_FORMAT_S16;
-    as.endianness = 1;
-
-    s->voice_in = AUD_open_in(&s->card, s->voice_in,
-            "mm_ac97.in", s, ac97_in_cb, &as);
-    s->voice_out = AUD_open_out(&s->card, s->voice_out,
-            "mm_ac97.out", s, ac97_out_cb, &as);
-}
-
-static const VMStateDescription vmstate_milkymist_ac97 = {
-    .name = "milkymist-ac97",
-    .version_id = 1,
-    .minimum_version_id = 1,
-    .post_load = ac97_post_load,
-    .fields = (VMStateField[]) {
-        VMSTATE_UINT32_ARRAY(regs, MilkymistAC97State, R_MAX),
-        VMSTATE_END_OF_LIST()
-    }
-};
-
-static Property milkymist_ac97_properties[] = {
-    DEFINE_AUDIO_PROPERTIES(MilkymistAC97State, card),
-    DEFINE_PROP_END_OF_LIST(),
-};
-
-static void milkymist_ac97_class_init(ObjectClass *klass, void *data)
-{
-    DeviceClass *dc = DEVICE_CLASS(klass);
-
-    dc->realize = milkymist_ac97_realize;
-    dc->reset = milkymist_ac97_reset;
-    dc->vmsd = &vmstate_milkymist_ac97;
-    device_class_set_props(dc, milkymist_ac97_properties);
-}
-
-static const TypeInfo milkymist_ac97_info = {
-    .name          = TYPE_MILKYMIST_AC97,
-    .parent        = TYPE_SYS_BUS_DEVICE,
-    .instance_size = sizeof(MilkymistAC97State),
-    .instance_init = milkymist_ac97_init,
-    .class_init    = milkymist_ac97_class_init,
-};
-
-static void milkymist_ac97_register_types(void)
-{
-    type_register_static(&milkymist_ac97_info);
-}
-
-type_init(milkymist_ac97_register_types)
diff --git a/hw/char/lm32_juart.c b/hw/char/lm32_juart.c
deleted file mode 100644
index ce30279650..0000000000
--- a/hw/char/lm32_juart.c
+++ /dev/null
@@ -1,166 +0,0 @@
-/*
- *  LatticeMico32 JTAG UART model.
- *
- *  Copyright (c) 2010 Michael Walle <michael@walle.cc>
- *
- * This library is free software; you can redistribute it and/or
- * modify it under the terms of the GNU Lesser General Public
- * License as published by the Free Software Foundation; either
- * version 2.1 of the License, or (at your option) any later version.
- *
- * This library is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
- * Lesser General Public License for more details.
- *
- * You should have received a copy of the GNU Lesser General Public
- * License along with this library; if not, see <http://www.gnu.org/licenses/>.
- */
-
-#include "qemu/osdep.h"
-#include "hw/sysbus.h"
-#include "migration/vmstate.h"
-#include "qemu/module.h"
-#include "trace.h"
-#include "chardev/char-fe.h"
-
-#include "hw/char/lm32_juart.h"
-#include "hw/qdev-properties.h"
-#include "hw/qdev-properties-system.h"
-#include "qom/object.h"
-
-enum {
-    LM32_JUART_MIN_SAVE_VERSION = 0,
-    LM32_JUART_CURRENT_SAVE_VERSION = 0,
-    LM32_JUART_MAX_SAVE_VERSION = 0,
-};
-
-enum {
-    JTX_FULL = (1<<8),
-};
-
-enum {
-    JRX_FULL = (1<<8),
-};
-
-OBJECT_DECLARE_SIMPLE_TYPE(LM32JuartState, LM32_JUART)
-
-struct LM32JuartState {
-    SysBusDevice parent_obj;
-
-    CharBackend chr;
-
-    uint32_t jtx;
-    uint32_t jrx;
-};
-
-uint32_t lm32_juart_get_jtx(DeviceState *d)
-{
-    LM32JuartState *s = LM32_JUART(d);
-
-    trace_lm32_juart_get_jtx(s->jtx);
-    return s->jtx;
-}
-
-uint32_t lm32_juart_get_jrx(DeviceState *d)
-{
-    LM32JuartState *s = LM32_JUART(d);
-
-    trace_lm32_juart_get_jrx(s->jrx);
-    return s->jrx;
-}
-
-void lm32_juart_set_jtx(DeviceState *d, uint32_t jtx)
-{
-    LM32JuartState *s = LM32_JUART(d);
-    unsigned char ch = jtx & 0xff;
-
-    trace_lm32_juart_set_jtx(s->jtx);
-
-    s->jtx = jtx;
-    /* XXX this blocks entire thread. Rewrite to use
-     * qemu_chr_fe_write and background I/O callbacks */
-    qemu_chr_fe_write_all(&s->chr, &ch, 1);
-}
-
-void lm32_juart_set_jrx(DeviceState *d, uint32_t jtx)
-{
-    LM32JuartState *s = LM32_JUART(d);
-
-    trace_lm32_juart_set_jrx(s->jrx);
-    s->jrx &= ~JRX_FULL;
-}
-
-static void juart_rx(void *opaque, const uint8_t *buf, int size)
-{
-    LM32JuartState *s = opaque;
-
-    s->jrx = *buf | JRX_FULL;
-}
-
-static int juart_can_rx(void *opaque)
-{
-    LM32JuartState *s = opaque;
-
-    return !(s->jrx & JRX_FULL);
-}
-
-static void juart_event(void *opaque, QEMUChrEvent event)
-{
-}
-
-static void juart_reset(DeviceState *d)
-{
-    LM32JuartState *s = LM32_JUART(d);
-
-    s->jtx = 0;
-    s->jrx = 0;
-}
-
-static void lm32_juart_realize(DeviceState *dev, Error **errp)
-{
-    LM32JuartState *s = LM32_JUART(dev);
-
-    qemu_chr_fe_set_handlers(&s->chr, juart_can_rx, juart_rx,
-                             juart_event, NULL, s, NULL, true);
-}
-
-static const VMStateDescription vmstate_lm32_juart = {
-    .name = "lm32-juart",
-    .version_id = 1,
-    .minimum_version_id = 1,
-    .fields = (VMStateField[]) {
-        VMSTATE_UINT32(jtx, LM32JuartState),
-        VMSTATE_UINT32(jrx, LM32JuartState),
-        VMSTATE_END_OF_LIST()
-    }
-};
-
-static Property lm32_juart_properties[] = {
-    DEFINE_PROP_CHR("chardev", LM32JuartState, chr),
-    DEFINE_PROP_END_OF_LIST(),
-};
-
-static void lm32_juart_class_init(ObjectClass *klass, void *data)
-{
-    DeviceClass *dc = DEVICE_CLASS(klass);
-
-    dc->reset = juart_reset;
-    dc->vmsd = &vmstate_lm32_juart;
-    device_class_set_props(dc, lm32_juart_properties);
-    dc->realize = lm32_juart_realize;
-}
-
-static const TypeInfo lm32_juart_info = {
-    .name          = TYPE_LM32_JUART,
-    .parent        = TYPE_SYS_BUS_DEVICE,
-    .instance_size = sizeof(LM32JuartState),
-    .class_init    = lm32_juart_class_init,
-};
-
-static void lm32_juart_register_types(void)
-{
-    type_register_static(&lm32_juart_info);
-}
-
-type_init(lm32_juart_register_types)
diff --git a/hw/char/lm32_uart.c b/hw/char/lm32_uart.c
deleted file mode 100644
index d8e0331311..0000000000
--- a/hw/char/lm32_uart.c
+++ /dev/null
@@ -1,314 +0,0 @@
-/*
- *  QEMU model of the LatticeMico32 UART block.
- *
- *  Copyright (c) 2010 Michael Walle <michael@walle.cc>
- *
- * This library is free software; you can redistribute it and/or
- * modify it under the terms of the GNU Lesser General Public
- * License as published by the Free Software Foundation; either
- * version 2.1 of the License, or (at your option) any later version.
- *
- * This library is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
- * Lesser General Public License for more details.
- *
- * You should have received a copy of the GNU Lesser General Public
- * License along with this library; if not, see <http://www.gnu.org/licenses/>.
- *
- *
- * Specification available at:
- *   http://www.latticesemi.com/documents/mico32uart.pdf
- */
-
-
-#include "qemu/osdep.h"
-#include "hw/irq.h"
-#include "hw/qdev-properties.h"
-#include "hw/qdev-properties-system.h"
-#include "hw/sysbus.h"
-#include "migration/vmstate.h"
-#include "trace.h"
-#include "chardev/char-fe.h"
-#include "qemu/error-report.h"
-#include "qemu/module.h"
-#include "qom/object.h"
-
-enum {
-    R_RXTX = 0,
-    R_IER,
-    R_IIR,
-    R_LCR,
-    R_MCR,
-    R_LSR,
-    R_MSR,
-    R_DIV,
-    R_MAX
-};
-
-enum {
-    IER_RBRI = (1<<0),
-    IER_THRI = (1<<1),
-    IER_RLSI = (1<<2),
-    IER_MSI  = (1<<3),
-};
-
-enum {
-    IIR_STAT = (1<<0),
-    IIR_ID0  = (1<<1),
-    IIR_ID1  = (1<<2),
-};
-
-enum {
-    LCR_WLS0 = (1<<0),
-    LCR_WLS1 = (1<<1),
-    LCR_STB  = (1<<2),
-    LCR_PEN  = (1<<3),
-    LCR_EPS  = (1<<4),
-    LCR_SP   = (1<<5),
-    LCR_SB   = (1<<6),
-};
-
-enum {
-    MCR_DTR  = (1<<0),
-    MCR_RTS  = (1<<1),
-};
-
-enum {
-    LSR_DR   = (1<<0),
-    LSR_OE   = (1<<1),
-    LSR_PE   = (1<<2),
-    LSR_FE   = (1<<3),
-    LSR_BI   = (1<<4),
-    LSR_THRE = (1<<5),
-    LSR_TEMT = (1<<6),
-};
-
-enum {
-    MSR_DCTS = (1<<0),
-    MSR_DDSR = (1<<1),
-    MSR_TERI = (1<<2),
-    MSR_DDCD = (1<<3),
-    MSR_CTS  = (1<<4),
-    MSR_DSR  = (1<<5),
-    MSR_RI   = (1<<6),
-    MSR_DCD  = (1<<7),
-};
-
-#define TYPE_LM32_UART "lm32-uart"
-OBJECT_DECLARE_SIMPLE_TYPE(LM32UartState, LM32_UART)
-
-struct LM32UartState {
-    SysBusDevice parent_obj;
-
-    MemoryRegion iomem;
-    CharBackend chr;
-    qemu_irq irq;
-
-    uint32_t regs[R_MAX];
-};
-
-static void uart_update_irq(LM32UartState *s)
-{
-    unsigned int irq;
-
-    if ((s->regs[R_LSR] & (LSR_OE | LSR_PE | LSR_FE | LSR_BI))
-            && (s->regs[R_IER] & IER_RLSI)) {
-        irq = 1;
-        s->regs[R_IIR] = IIR_ID1 | IIR_ID0;
-    } else if ((s->regs[R_LSR] & LSR_DR) && (s->regs[R_IER] & IER_RBRI)) {
-        irq = 1;
-        s->regs[R_IIR] = IIR_ID1;
-    } else if ((s->regs[R_LSR] & LSR_THRE) && (s->regs[R_IER] & IER_THRI)) {
-        irq = 1;
-        s->regs[R_IIR] = IIR_ID0;
-    } else if ((s->regs[R_MSR] & 0x0f) && (s->regs[R_IER] & IER_MSI)) {
-        irq = 1;
-        s->regs[R_IIR] = 0;
-    } else {
-        irq = 0;
-        s->regs[R_IIR] = IIR_STAT;
-    }
-
-    trace_lm32_uart_irq_state(irq);
-    qemu_set_irq(s->irq, irq);
-}
-
-static uint64_t uart_read(void *opaque, hwaddr addr,
-                          unsigned size)
-{
-    LM32UartState *s = opaque;
-    uint32_t r = 0;
-
-    addr >>= 2;
-    switch (addr) {
-    case R_RXTX:
-        r = s->regs[R_RXTX];
-        s->regs[R_LSR] &= ~LSR_DR;
-        uart_update_irq(s);
-        qemu_chr_fe_accept_input(&s->chr);
-        break;
-    case R_IIR:
-    case R_LSR:
-    case R_MSR:
-        r = s->regs[addr];
-        break;
-    case R_IER:
-    case R_LCR:
-    case R_MCR:
-    case R_DIV:
-        error_report("lm32_uart: read access to write only register 0x"
-                TARGET_FMT_plx, addr << 2);
-        break;
-    default:
-        error_report("lm32_uart: read access to unknown register 0x"
-                TARGET_FMT_plx, addr << 2);
-        break;
-    }
-
-    trace_lm32_uart_memory_read(addr << 2, r);
-    return r;
-}
-
-static void uart_write(void *opaque, hwaddr addr,
-                       uint64_t value, unsigned size)
-{
-    LM32UartState *s = opaque;
-    unsigned char ch = value;
-
-    trace_lm32_uart_memory_write(addr, value);
-
-    addr >>= 2;
-    switch (addr) {
-    case R_RXTX:
-        /* XXX this blocks entire thread. Rewrite to use
-         * qemu_chr_fe_write and background I/O callbacks */
-        qemu_chr_fe_write_all(&s->chr, &ch, 1);
-        break;
-    case R_IER:
-    case R_LCR:
-    case R_MCR:
-    case R_DIV:
-        s->regs[addr] = value;
-        break;
-    case R_IIR:
-    case R_LSR:
-    case R_MSR:
-        error_report("lm32_uart: write access to read only register 0x"
-                TARGET_FMT_plx, addr << 2);
-        break;
-    default:
-        error_report("lm32_uart: write access to unknown register 0x"
-                TARGET_FMT_plx, addr << 2);
-        break;
-    }
-    uart_update_irq(s);
-}
-
-static const MemoryRegionOps uart_ops = {
-    .read = uart_read,
-    .write = uart_write,
-    .endianness = DEVICE_NATIVE_ENDIAN,
-    .valid = {
-        .min_access_size = 4,
-        .max_access_size = 4,
-    },
-};
-
-static void uart_rx(void *opaque, const uint8_t *buf, int size)
-{
-    LM32UartState *s = opaque;
-
-    if (s->regs[R_LSR] & LSR_DR) {
-        s->regs[R_LSR] |= LSR_OE;
-    }
-
-    s->regs[R_LSR] |= LSR_DR;
-    s->regs[R_RXTX] = *buf;
-
-    uart_update_irq(s);
-}
-
-static int uart_can_rx(void *opaque)
-{
-    LM32UartState *s = opaque;
-
-    return !(s->regs[R_LSR] & LSR_DR);
-}
-
-static void uart_event(void *opaque, QEMUChrEvent event)
-{
-}
-
-static void uart_reset(DeviceState *d)
-{
-    LM32UartState *s = LM32_UART(d);
-    int i;
-
-    for (i = 0; i < R_MAX; i++) {
-        s->regs[i] = 0;
-    }
-
-    /* defaults */
-    s->regs[R_LSR] = LSR_THRE | LSR_TEMT;
-}
-
-static void lm32_uart_init(Object *obj)
-{
-    LM32UartState *s = LM32_UART(obj);
-    SysBusDevice *dev = SYS_BUS_DEVICE(obj);
-
-    sysbus_init_irq(dev, &s->irq);
-
-    memory_region_init_io(&s->iomem, obj, &uart_ops, s,
-                          "uart", R_MAX * 4);
-    sysbus_init_mmio(dev, &s->iomem);
-}
-
-static void lm32_uart_realize(DeviceState *dev, Error **errp)
-{
-    LM32UartState *s = LM32_UART(dev);
-
-    qemu_chr_fe_set_handlers(&s->chr, uart_can_rx, uart_rx,
-                             uart_event, NULL, s, NULL, true);
-}
-
-static const VMStateDescription vmstate_lm32_uart = {
-    .name = "lm32-uart",
-    .version_id = 1,
-    .minimum_version_id = 1,
-    .fields = (VMStateField[]) {
-        VMSTATE_UINT32_ARRAY(regs, LM32UartState, R_MAX),
-        VMSTATE_END_OF_LIST()
-    }
-};
-
-static Property lm32_uart_properties[] = {
-    DEFINE_PROP_CHR("chardev", LM32UartState, chr),
-    DEFINE_PROP_END_OF_LIST(),
-};
-
-static void lm32_uart_class_init(ObjectClass *klass, void *data)
-{
-    DeviceClass *dc = DEVICE_CLASS(klass);
-
-    dc->reset = uart_reset;
-    dc->vmsd = &vmstate_lm32_uart;
-    device_class_set_props(dc, lm32_uart_properties);
-    dc->realize = lm32_uart_realize;
-}
-
-static const TypeInfo lm32_uart_info = {
-    .name          = TYPE_LM32_UART,
-    .parent        = TYPE_SYS_BUS_DEVICE,
-    .instance_size = sizeof(LM32UartState),
-    .instance_init = lm32_uart_init,
-    .class_init    = lm32_uart_class_init,
-};
-
-static void lm32_uart_register_types(void)
-{
-    type_register_static(&lm32_uart_info);
-}
-
-type_init(lm32_uart_register_types)
diff --git a/hw/char/milkymist-uart.c b/hw/char/milkymist-uart.c
deleted file mode 100644
index cb1b3470ad..0000000000
--- a/hw/char/milkymist-uart.c
+++ /dev/null
@@ -1,258 +0,0 @@
-/*
- *  QEMU model of the Milkymist UART block.
- *
- *  Copyright (c) 2010 Michael Walle <michael@walle.cc>
- *
- * This library is free software; you can redistribute it and/or
- * modify it under the terms of the GNU Lesser General Public
- * License as published by the Free Software Foundation; either
- * version 2.1 of the License, or (at your option) any later version.
- *
- * This library is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
- * Lesser General Public License for more details.
- *
- * You should have received a copy of the GNU Lesser General Public
- * License along with this library; if not, see <http://www.gnu.org/licenses/>.
- *
- *
- * Specification available at:
- *   http://milkymist.walle.cc/socdoc/uart.pdf
- */
-
-#include "qemu/osdep.h"
-#include "hw/irq.h"
-#include "hw/qdev-properties.h"
-#include "hw/qdev-properties-system.h"
-#include "hw/sysbus.h"
-#include "migration/vmstate.h"
-#include "trace.h"
-#include "chardev/char-fe.h"
-#include "qemu/error-report.h"
-#include "qemu/module.h"
-#include "qom/object.h"
-
-enum {
-    R_RXTX = 0,
-    R_DIV,
-    R_STAT,
-    R_CTRL,
-    R_DBG,
-    R_MAX
-};
-
-enum {
-    STAT_THRE   = (1<<0),
-    STAT_RX_EVT = (1<<1),
-    STAT_TX_EVT = (1<<2),
-};
-
-enum {
-    CTRL_RX_IRQ_EN = (1<<0),
-    CTRL_TX_IRQ_EN = (1<<1),
-    CTRL_THRU_EN   = (1<<2),
-};
-
-enum {
-    DBG_BREAK_EN = (1<<0),
-};
-
-#define TYPE_MILKYMIST_UART "milkymist-uart"
-OBJECT_DECLARE_SIMPLE_TYPE(MilkymistUartState, MILKYMIST_UART)
-
-struct MilkymistUartState {
-    SysBusDevice parent_obj;
-
-    MemoryRegion regs_region;
-    CharBackend chr;
-    qemu_irq irq;
-
-    uint32_t regs[R_MAX];
-};
-
-static void uart_update_irq(MilkymistUartState *s)
-{
-    int rx_event = s->regs[R_STAT] & STAT_RX_EVT;
-    int tx_event = s->regs[R_STAT] & STAT_TX_EVT;
-    int rx_irq_en = s->regs[R_CTRL] & CTRL_RX_IRQ_EN;
-    int tx_irq_en = s->regs[R_CTRL] & CTRL_TX_IRQ_EN;
-
-    if ((rx_irq_en && rx_event) || (tx_irq_en && tx_event)) {
-        trace_milkymist_uart_raise_irq();
-        qemu_irq_raise(s->irq);
-    } else {
-        trace_milkymist_uart_lower_irq();
-        qemu_irq_lower(s->irq);
-    }
-}
-
-static uint64_t uart_read(void *opaque, hwaddr addr,
-                          unsigned size)
-{
-    MilkymistUartState *s = opaque;
-    uint32_t r = 0;
-
-    addr >>= 2;
-    switch (addr) {
-    case R_RXTX:
-        r = s->regs[addr];
-        break;
-    case R_DIV:
-    case R_STAT:
-    case R_CTRL:
-    case R_DBG:
-        r = s->regs[addr];
-        break;
-
-    default:
-        error_report("milkymist_uart: read access to unknown register 0x"
-                TARGET_FMT_plx, addr << 2);
-        break;
-    }
-
-    trace_milkymist_uart_memory_read(addr << 2, r);
-
-    return r;
-}
-
-static void uart_write(void *opaque, hwaddr addr, uint64_t value,
-                       unsigned size)
-{
-    MilkymistUartState *s = opaque;
-    unsigned char ch = value;
-
-    trace_milkymist_uart_memory_write(addr, value);
-
-    addr >>= 2;
-    switch (addr) {
-    case R_RXTX:
-        qemu_chr_fe_write_all(&s->chr, &ch, 1);
-        s->regs[R_STAT] |= STAT_TX_EVT;
-        break;
-    case R_DIV:
-    case R_CTRL:
-    case R_DBG:
-        s->regs[addr] = value;
-        break;
-
-    case R_STAT:
-        /* write one to clear bits */
-        s->regs[addr] &= ~(value & (STAT_RX_EVT | STAT_TX_EVT));
-        qemu_chr_fe_accept_input(&s->chr);
-        break;
-
-    default:
-        error_report("milkymist_uart: write access to unknown register 0x"
-                TARGET_FMT_plx, addr << 2);
-        break;
-    }
-
-    uart_update_irq(s);
-}
-
-static const MemoryRegionOps uart_mmio_ops = {
-    .read = uart_read,
-    .write = uart_write,
-    .valid = {
-        .min_access_size = 4,
-        .max_access_size = 4,
-    },
-    .endianness = DEVICE_NATIVE_ENDIAN,
-};
-
-static void uart_rx(void *opaque, const uint8_t *buf, int size)
-{
-    MilkymistUartState *s = opaque;
-
-    assert(!(s->regs[R_STAT] & STAT_RX_EVT));
-
-    s->regs[R_STAT] |= STAT_RX_EVT;
-    s->regs[R_RXTX] = *buf;
-
-    uart_update_irq(s);
-}
-
-static int uart_can_rx(void *opaque)
-{
-    MilkymistUartState *s = opaque;
-
-    return !(s->regs[R_STAT] & STAT_RX_EVT);
-}
-
-static void uart_event(void *opaque, QEMUChrEvent event)
-{
-}
-
-static void milkymist_uart_reset(DeviceState *d)
-{
-    MilkymistUartState *s = MILKYMIST_UART(d);
-    int i;
-
-    for (i = 0; i < R_MAX; i++) {
-        s->regs[i] = 0;
-    }
-
-    /* THRE is always set */
-    s->regs[R_STAT] = STAT_THRE;
-}
-
-static void milkymist_uart_realize(DeviceState *dev, Error **errp)
-{
-    MilkymistUartState *s = MILKYMIST_UART(dev);
-
-    qemu_chr_fe_set_handlers(&s->chr, uart_can_rx, uart_rx,
-                             uart_event, NULL, s, NULL, true);
-}
-
-static void milkymist_uart_init(Object *obj)
-{
-    SysBusDevice *sbd = SYS_BUS_DEVICE(obj);
-    MilkymistUartState *s = MILKYMIST_UART(obj);
-
-    sysbus_init_irq(sbd, &s->irq);
-
-    memory_region_init_io(&s->regs_region, OBJECT(s), &uart_mmio_ops, s,
-                          "milkymist-uart", R_MAX * 4);
-    sysbus_init_mmio(sbd, &s->regs_region);
-}
-
-static const VMStateDescription vmstate_milkymist_uart = {
-    .name = "milkymist-uart",
-    .version_id = 1,
-    .minimum_version_id = 1,
-    .fields = (VMStateField[]) {
-        VMSTATE_UINT32_ARRAY(regs, MilkymistUartState, R_MAX),
-        VMSTATE_END_OF_LIST()
-    }
-};
-
-static Property milkymist_uart_properties[] = {
-    DEFINE_PROP_CHR("chardev", MilkymistUartState, chr),
-    DEFINE_PROP_END_OF_LIST(),
-};
-
-static void milkymist_uart_class_init(ObjectClass *klass, void *data)
-{
-    DeviceClass *dc = DEVICE_CLASS(klass);
-
-    dc->realize = milkymist_uart_realize;
-    dc->reset = milkymist_uart_reset;
-    dc->vmsd = &vmstate_milkymist_uart;
-    device_class_set_props(dc, milkymist_uart_properties);
-}
-
-static const TypeInfo milkymist_uart_info = {
-    .name          = TYPE_MILKYMIST_UART,
-    .parent        = TYPE_SYS_BUS_DEVICE,
-    .instance_size = sizeof(MilkymistUartState),
-    .instance_init = milkymist_uart_init,
-    .class_init    = milkymist_uart_class_init,
-};
-
-static void milkymist_uart_register_types(void)
-{
-    type_register_static(&milkymist_uart_info);
-}
-
-type_init(milkymist_uart_register_types)
diff --git a/hw/display/milkymist-tmu2.c b/hw/display/milkymist-tmu2.c
deleted file mode 100644
index 02a28c807b..0000000000
--- a/hw/display/milkymist-tmu2.c
+++ /dev/null
@@ -1,551 +0,0 @@
-/*
- *  QEMU model of the Milkymist texture mapping unit.
- *
- *  Copyright (c) 2010 Michael Walle <michael@walle.cc>
- *  Copyright (c) 2010 Sebastien Bourdeauducq
- *                       <sebastien.bourdeauducq@lekernel.net>
- *
- * This library is free software; you can redistribute it and/or
- * modify it under the terms of the GNU Lesser General Public
- * License as published by the Free Software Foundation; either
- * version 2.1 of the License, or (at your option) any later version.
- *
- * This library is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
- * Lesser General Public License for more details.
- *
- * You should have received a copy of the GNU Lesser General Public
- * License along with this library; if not, see <http://www.gnu.org/licenses/>.
- *
- *
- * Specification available at:
- *   http://milkymist.walle.cc/socdoc/tmu2.pdf
- *
- */
-
-#include "qemu/osdep.h"
-#include "hw/irq.h"
-#include "hw/sysbus.h"
-#include "migration/vmstate.h"
-#include "trace.h"
-#include "qapi/error.h"
-#include "qemu/error-report.h"
-#include "qemu/module.h"
-#include "qapi/error.h"
-#include "hw/display/milkymist_tmu2.h"
-
-#include <X11/Xlib.h>
-#include <epoxy/gl.h>
-#include <epoxy/glx.h>
-#include "qom/object.h"
-
-enum {
-    R_CTL = 0,
-    R_HMESHLAST,
-    R_VMESHLAST,
-    R_BRIGHTNESS,
-    R_CHROMAKEY,
-    R_VERTICESADDR,
-    R_TEXFBUF,
-    R_TEXHRES,
-    R_TEXVRES,
-    R_TEXHMASK,
-    R_TEXVMASK,
-    R_DSTFBUF,
-    R_DSTHRES,
-    R_DSTVRES,
-    R_DSTHOFFSET,
-    R_DSTVOFFSET,
-    R_DSTSQUAREW,
-    R_DSTSQUAREH,
-    R_ALPHA,
-    R_MAX
-};
-
-enum {
-    CTL_START_BUSY  = (1<<0),
-    CTL_CHROMAKEY   = (1<<1),
-};
-
-enum {
-    MAX_BRIGHTNESS = 63,
-    MAX_ALPHA      = 63,
-};
-
-enum {
-    MESH_MAXSIZE = 128,
-};
-
-struct vertex {
-    int x;
-    int y;
-} QEMU_PACKED;
-
-#define TYPE_MILKYMIST_TMU2 "milkymist-tmu2"
-OBJECT_DECLARE_SIMPLE_TYPE(MilkymistTMU2State, MILKYMIST_TMU2)
-
-struct MilkymistTMU2State {
-    SysBusDevice parent_obj;
-
-    MemoryRegion regs_region;
-    Chardev *chr;
-    qemu_irq irq;
-
-    uint32_t regs[R_MAX];
-
-    Display *dpy;
-    GLXFBConfig glx_fb_config;
-    GLXContext glx_context;
-};
-
-static const int glx_fbconfig_attr[] = {
-    GLX_GREEN_SIZE, 5,
-    GLX_GREEN_SIZE, 6,
-    GLX_BLUE_SIZE, 5,
-    None
-};
-
-static int tmu2_glx_init(MilkymistTMU2State *s)
-{
-    GLXFBConfig *configs;
-    int nelements;
-
-    s->dpy = XOpenDisplay(NULL); /* FIXME: call XCloseDisplay() */
-    if (s->dpy == NULL) {
-        return 1;
-    }
-
-    configs = glXChooseFBConfig(s->dpy, 0, glx_fbconfig_attr, &nelements);
-    if (configs == NULL) {
-        return 1;
-    }
-
-    s->glx_fb_config = *configs;
-    XFree(configs);
-
-    /* FIXME: call glXDestroyContext() */
-    s->glx_context = glXCreateNewContext(s->dpy, s->glx_fb_config,
-            GLX_RGBA_TYPE, NULL, 1);
-    if (s->glx_context == NULL) {
-        return 1;
-    }
-
-    return 0;
-}
-
-static void tmu2_gl_map(struct vertex *mesh, int texhres, int texvres,
-        int hmeshlast, int vmeshlast, int ho, int vo, int sw, int sh)
-{
-    int x, y;
-    int x0, y0, x1, y1;
-    int u0, v0, u1, v1, u2, v2, u3, v3;
-    double xscale = 1.0 / ((double)(64 * texhres));
-    double yscale = 1.0 / ((double)(64 * texvres));
-
-    glLoadIdentity();
-    glTranslatef(ho, vo, 0);
-    glEnable(GL_TEXTURE_2D);
-    glBegin(GL_QUADS);
-
-    for (y = 0; y < vmeshlast; y++) {
-        y0 = y * sh;
-        y1 = y0 + sh;
-        for (x = 0; x < hmeshlast; x++) {
-            x0 = x * sw;
-            x1 = x0 + sw;
-
-            u0 = be32_to_cpu(mesh[MESH_MAXSIZE * y + x].x);
-            v0 = be32_to_cpu(mesh[MESH_MAXSIZE * y + x].y);
-            u1 = be32_to_cpu(mesh[MESH_MAXSIZE * y + x + 1].x);
-            v1 = be32_to_cpu(mesh[MESH_MAXSIZE * y + x + 1].y);
-            u2 = be32_to_cpu(mesh[MESH_MAXSIZE * (y + 1) + x + 1].x);
-            v2 = be32_to_cpu(mesh[MESH_MAXSIZE * (y + 1) + x + 1].y);
-            u3 = be32_to_cpu(mesh[MESH_MAXSIZE * (y + 1) + x].x);
-            v3 = be32_to_cpu(mesh[MESH_MAXSIZE * (y + 1) + x].y);
-
-            glTexCoord2d(((double)u0) * xscale, ((double)v0) * yscale);
-            glVertex3i(x0, y0, 0);
-            glTexCoord2d(((double)u1) * xscale, ((double)v1) * yscale);
-            glVertex3i(x1, y0, 0);
-            glTexCoord2d(((double)u2) * xscale, ((double)v2) * yscale);
-            glVertex3i(x1, y1, 0);
-            glTexCoord2d(((double)u3) * xscale, ((double)v3) * yscale);
-            glVertex3i(x0, y1, 0);
-        }
-    }
-
-    glEnd();
-}
-
-static void tmu2_start(MilkymistTMU2State *s)
-{
-    int pbuffer_attrib[6] = {
-        GLX_PBUFFER_WIDTH,
-        0,
-        GLX_PBUFFER_HEIGHT,
-        0,
-        GLX_PRESERVED_CONTENTS,
-        True
-    };
-
-    GLXPbuffer pbuffer;
-    GLuint texture;
-    void *fb;
-    hwaddr fb_len;
-    void *mesh;
-    hwaddr mesh_len;
-    float m;
-
-    trace_milkymist_tmu2_start();
-
-    /* Create and set up a suitable OpenGL context */
-    pbuffer_attrib[1] = s->regs[R_DSTHRES];
-    pbuffer_attrib[3] = s->regs[R_DSTVRES];
-    pbuffer = glXCreatePbuffer(s->dpy, s->glx_fb_config, pbuffer_attrib);
-    glXMakeContextCurrent(s->dpy, pbuffer, pbuffer, s->glx_context);
-
-    /* Fixup endianness. TODO: would it work on BE hosts? */
-    glPixelStorei(GL_UNPACK_SWAP_BYTES, 1);
-    glPixelStorei(GL_PACK_SWAP_BYTES, 1);
-
-    /* Row alignment */
-    glPixelStorei(GL_UNPACK_ALIGNMENT, 2);
-    glPixelStorei(GL_PACK_ALIGNMENT, 2);
-
-    /* Read the QEMU source framebuffer into an OpenGL texture */
-    glGenTextures(1, &texture);
-    glBindTexture(GL_TEXTURE_2D, texture);
-    fb_len = 2ULL * s->regs[R_TEXHRES] * s->regs[R_TEXVRES];
-    fb = cpu_physical_memory_map(s->regs[R_TEXFBUF], &fb_len, false);
-    if (fb == NULL) {
-        glDeleteTextures(1, &texture);
-        glXMakeContextCurrent(s->dpy, None, None, NULL);
-        glXDestroyPbuffer(s->dpy, pbuffer);
-        return;
-    }
-    glTexImage2D(GL_TEXTURE_2D, 0, 3, s->regs[R_TEXHRES], s->regs[R_TEXVRES],
-            0, GL_RGB, GL_UNSIGNED_SHORT_5_6_5, fb);
-    cpu_physical_memory_unmap(fb, fb_len, 0, fb_len);
-
-    /* Set up texturing options */
-    /* WARNING:
-     * Many cases of TMU2 masking are not supported by OpenGL.
-     * We only implement the most common ones:
-     *  - full bilinear filtering vs. nearest texel
-     *  - texture clamping vs. texture wrapping
-     */
-    if ((s->regs[R_TEXHMASK] & 0x3f) > 0x20) {
-        glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_LINEAR);
-        glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_LINEAR);
-    } else {
-        glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_NEAREST);
-        glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_NEAREST);
-    }
-    if ((s->regs[R_TEXHMASK] >> 6) & s->regs[R_TEXHRES]) {
-        glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_S, GL_CLAMP);
-    } else {
-        glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_S, GL_REPEAT);
-    }
-    if ((s->regs[R_TEXVMASK] >> 6) & s->regs[R_TEXVRES]) {
-        glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_T, GL_CLAMP);
-    } else {
-        glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_T, GL_REPEAT);
-    }
-
-    /* Translucency and decay */
-    glEnable(GL_BLEND);
-    glBlendFunc(GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA);
-    m = (float)(s->regs[R_BRIGHTNESS] + 1) / 64.0f;
-    glColor4f(m, m, m, (float)(s->regs[R_ALPHA] + 1) / 64.0f);
-
-    /* Read the QEMU dest. framebuffer into the OpenGL framebuffer */
-    fb_len = 2ULL * s->regs[R_DSTHRES] * s->regs[R_DSTVRES];
-    fb = cpu_physical_memory_map(s->regs[R_DSTFBUF], &fb_len, false);
-    if (fb == NULL) {
-        glDeleteTextures(1, &texture);
-        glXMakeContextCurrent(s->dpy, None, None, NULL);
-        glXDestroyPbuffer(s->dpy, pbuffer);
-        return;
-    }
-
-    glDrawPixels(s->regs[R_DSTHRES], s->regs[R_DSTVRES], GL_RGB,
-            GL_UNSIGNED_SHORT_5_6_5, fb);
-    cpu_physical_memory_unmap(fb, fb_len, 0, fb_len);
-    glViewport(0, 0, s->regs[R_DSTHRES], s->regs[R_DSTVRES]);
-    glMatrixMode(GL_PROJECTION);
-    glLoadIdentity();
-    glOrtho(0.0, s->regs[R_DSTHRES], 0.0, s->regs[R_DSTVRES], -1.0, 1.0);
-    glMatrixMode(GL_MODELVIEW);
-
-    /* Map the texture */
-    mesh_len = MESH_MAXSIZE*MESH_MAXSIZE*sizeof(struct vertex);
-    mesh = cpu_physical_memory_map(s->regs[R_VERTICESADDR], &mesh_len, false);
-    if (mesh == NULL) {
-        glDeleteTextures(1, &texture);
-        glXMakeContextCurrent(s->dpy, None, None, NULL);
-        glXDestroyPbuffer(s->dpy, pbuffer);
-        return;
-    }
-
-    tmu2_gl_map((struct vertex *)mesh,
-        s->regs[R_TEXHRES], s->regs[R_TEXVRES],
-        s->regs[R_HMESHLAST], s->regs[R_VMESHLAST],
-        s->regs[R_DSTHOFFSET], s->regs[R_DSTVOFFSET],
-        s->regs[R_DSTSQUAREW], s->regs[R_DSTSQUAREH]);
-    cpu_physical_memory_unmap(mesh, mesh_len, 0, mesh_len);
-
-    /* Write back the OpenGL framebuffer to the QEMU framebuffer */
-    fb_len = 2ULL * s->regs[R_DSTHRES] * s->regs[R_DSTVRES];
-    fb = cpu_physical_memory_map(s->regs[R_DSTFBUF], &fb_len, true);
-    if (fb == NULL) {
-        glDeleteTextures(1, &texture);
-        glXMakeContextCurrent(s->dpy, None, None, NULL);
-        glXDestroyPbuffer(s->dpy, pbuffer);
-        return;
-    }
-
-    glReadPixels(0, 0, s->regs[R_DSTHRES], s->regs[R_DSTVRES], GL_RGB,
-            GL_UNSIGNED_SHORT_5_6_5, fb);
-    cpu_physical_memory_unmap(fb, fb_len, 1, fb_len);
-
-    /* Free OpenGL allocs */
-    glDeleteTextures(1, &texture);
-    glXMakeContextCurrent(s->dpy, None, None, NULL);
-    glXDestroyPbuffer(s->dpy, pbuffer);
-
-    s->regs[R_CTL] &= ~CTL_START_BUSY;
-
-    trace_milkymist_tmu2_pulse_irq();
-    qemu_irq_pulse(s->irq);
-}
-
-static uint64_t tmu2_read(void *opaque, hwaddr addr,
-                          unsigned size)
-{
-    MilkymistTMU2State *s = opaque;
-    uint32_t r = 0;
-
-    addr >>= 2;
-    switch (addr) {
-    case R_CTL:
-    case R_HMESHLAST:
-    case R_VMESHLAST:
-    case R_BRIGHTNESS:
-    case R_CHROMAKEY:
-    case R_VERTICESADDR:
-    case R_TEXFBUF:
-    case R_TEXHRES:
-    case R_TEXVRES:
-    case R_TEXHMASK:
-    case R_TEXVMASK:
-    case R_DSTFBUF:
-    case R_DSTHRES:
-    case R_DSTVRES:
-    case R_DSTHOFFSET:
-    case R_DSTVOFFSET:
-    case R_DSTSQUAREW:
-    case R_DSTSQUAREH:
-    case R_ALPHA:
-        r = s->regs[addr];
-        break;
-
-    default:
-        error_report("milkymist_tmu2: read access to unknown register 0x"
-                TARGET_FMT_plx, addr << 2);
-        break;
-    }
-
-    trace_milkymist_tmu2_memory_read(addr << 2, r);
-
-    return r;
-}
-
-static void tmu2_check_registers(MilkymistTMU2State *s)
-{
-    if (s->regs[R_BRIGHTNESS] > MAX_BRIGHTNESS) {
-        error_report("milkymist_tmu2: max brightness is %d", MAX_BRIGHTNESS);
-    }
-
-    if (s->regs[R_ALPHA] > MAX_ALPHA) {
-        error_report("milkymist_tmu2: max alpha is %d", MAX_ALPHA);
-    }
-
-    if (s->regs[R_VERTICESADDR] & 0x07) {
-        error_report("milkymist_tmu2: vertex mesh address has to be 64-bit "
-                "aligned");
-    }
-
-    if (s->regs[R_TEXFBUF] & 0x01) {
-        error_report("milkymist_tmu2: texture buffer address has to be "
-                "16-bit aligned");
-    }
-}
-
-static void tmu2_write(void *opaque, hwaddr addr, uint64_t value,
-                       unsigned size)
-{
-    MilkymistTMU2State *s = opaque;
-
-    trace_milkymist_tmu2_memory_write(addr, value);
-
-    addr >>= 2;
-    switch (addr) {
-    case R_CTL:
-        s->regs[addr] = value;
-        if (value & CTL_START_BUSY) {
-            tmu2_start(s);
-        }
-        break;
-    case R_BRIGHTNESS:
-    case R_HMESHLAST:
-    case R_VMESHLAST:
-    case R_CHROMAKEY:
-    case R_VERTICESADDR:
-    case R_TEXFBUF:
-    case R_TEXHRES:
-    case R_TEXVRES:
-    case R_TEXHMASK:
-    case R_TEXVMASK:
-    case R_DSTFBUF:
-    case R_DSTHRES:
-    case R_DSTVRES:
-    case R_DSTHOFFSET:
-    case R_DSTVOFFSET:
-    case R_DSTSQUAREW:
-    case R_DSTSQUAREH:
-    case R_ALPHA:
-        s->regs[addr] = value;
-        break;
-
-    default:
-        error_report("milkymist_tmu2: write access to unknown register 0x"
-                TARGET_FMT_plx, addr << 2);
-        break;
-    }
-
-    tmu2_check_registers(s);
-}
-
-static const MemoryRegionOps tmu2_mmio_ops = {
-    .read = tmu2_read,
-    .write = tmu2_write,
-    .valid = {
-        .min_access_size = 4,
-        .max_access_size = 4,
-    },
-    .endianness = DEVICE_NATIVE_ENDIAN,
-};
-
-static void milkymist_tmu2_reset(DeviceState *d)
-{
-    MilkymistTMU2State *s = MILKYMIST_TMU2(d);
-    int i;
-
-    for (i = 0; i < R_MAX; i++) {
-        s->regs[i] = 0;
-    }
-}
-
-static void milkymist_tmu2_init(Object *obj)
-{
-    MilkymistTMU2State *s = MILKYMIST_TMU2(obj);
-    SysBusDevice *dev = SYS_BUS_DEVICE(obj);
-
-    sysbus_init_irq(dev, &s->irq);
-
-    memory_region_init_io(&s->regs_region, obj, &tmu2_mmio_ops, s,
-            "milkymist-tmu2", R_MAX * 4);
-    sysbus_init_mmio(dev, &s->regs_region);
-}
-
-static void milkymist_tmu2_realize(DeviceState *dev, Error **errp)
-{
-    MilkymistTMU2State *s = MILKYMIST_TMU2(dev);
-
-    if (tmu2_glx_init(s)) {
-        error_setg(errp, "tmu2_glx_init failed");
-    }
-}
-
-static const VMStateDescription vmstate_milkymist_tmu2 = {
-    .name = "milkymist-tmu2",
-    .version_id = 1,
-    .minimum_version_id = 1,
-    .fields = (VMStateField[]) {
-        VMSTATE_UINT32_ARRAY(regs, MilkymistTMU2State, R_MAX),
-        VMSTATE_END_OF_LIST()
-    }
-};
-
-static void milkymist_tmu2_class_init(ObjectClass *klass, void *data)
-{
-    DeviceClass *dc = DEVICE_CLASS(klass);
-
-    dc->realize = milkymist_tmu2_realize;
-    dc->reset = milkymist_tmu2_reset;
-    dc->vmsd = &vmstate_milkymist_tmu2;
-}
-
-static const TypeInfo milkymist_tmu2_info = {
-    .name          = TYPE_MILKYMIST_TMU2,
-    .parent        = TYPE_SYS_BUS_DEVICE,
-    .instance_size = sizeof(MilkymistTMU2State),
-    .instance_init = milkymist_tmu2_init,
-    .class_init    = milkymist_tmu2_class_init,
-};
-
-static void milkymist_tmu2_register_types(void)
-{
-    type_register_static(&milkymist_tmu2_info);
-}
-
-type_init(milkymist_tmu2_register_types)
-
-DeviceState *milkymist_tmu2_create(hwaddr base, qemu_irq irq)
-{
-    DeviceState *dev;
-    Display *d;
-    GLXFBConfig *configs;
-    int nelements;
-    int ver_major, ver_minor;
-
-    /* check that GLX will work */
-    d = XOpenDisplay(NULL);
-    if (d == NULL) {
-        return NULL;
-    }
-
-    if (!glXQueryVersion(d, &ver_major, &ver_minor)) {
-        /*
-         * Yeah, sometimes getting the GLX version can fail.
-         * Isn't X beautiful?
-         */
-        XCloseDisplay(d);
-        return NULL;
-    }
-
-    if ((ver_major < 1) || ((ver_major == 1) && (ver_minor < 3))) {
-        printf("Your GLX version is %d.%d,"
-          "but TMU emulation needs at least 1.3. TMU disabled.\n",
-          ver_major, ver_minor);
-        XCloseDisplay(d);
-        return NULL;
-    }
-
-    configs = glXChooseFBConfig(d, 0, glx_fbconfig_attr, &nelements);
-    if (configs == NULL) {
-        XCloseDisplay(d);
-        return NULL;
-    }
-
-    XFree(configs);
-    XCloseDisplay(d);
-
-    dev = qdev_new(TYPE_MILKYMIST_TMU2);
-    sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
-    sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, base);
-    sysbus_connect_irq(SYS_BUS_DEVICE(dev), 0, irq);
-
-    return dev;
-}
diff --git a/hw/display/milkymist-vgafb.c b/hw/display/milkymist-vgafb.c
deleted file mode 100644
index e2c587e2df..0000000000
--- a/hw/display/milkymist-vgafb.c
+++ /dev/null
@@ -1,360 +0,0 @@
-
-/*
- *  QEMU model of the Milkymist VGA framebuffer.
- *
- *  Copyright (c) 2010-2012 Michael Walle <michael@walle.cc>
- *
- * This library is free software; you can redistribute it and/or
- * modify it under the terms of the GNU Lesser General Public
- * License as published by the Free Software Foundation; either
- * version 2.1 of the License, or (at your option) any later version.
- *
- * This library is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
- * Lesser General Public License for more details.
- *
- * You should have received a copy of the GNU Lesser General Public
- * License along with this library; if not, see <http://www.gnu.org/licenses/>.
- *
- *
- * Specification available at:
- *   http://milkymist.walle.cc/socdoc/vgafb.pdf
- */
-
-#include "qemu/osdep.h"
-#include "hw/hw.h"
-#include "hw/qdev-properties.h"
-#include "hw/sysbus.h"
-#include "trace.h"
-#include "ui/console.h"
-#include "framebuffer.h"
-#include "ui/pixel_ops.h"
-#include "qemu/error-report.h"
-#include "qemu/module.h"
-#include "qom/object.h"
-
-#define BITS 8
-#include "migration/vmstate.h"
-#include "milkymist-vgafb_template.h"
-#define BITS 15
-#include "milkymist-vgafb_template.h"
-#define BITS 16
-#include "milkymist-vgafb_template.h"
-#define BITS 24
-#include "milkymist-vgafb_template.h"
-#define BITS 32
-#include "milkymist-vgafb_template.h"
-
-enum {
-    R_CTRL = 0,
-    R_HRES,
-    R_HSYNC_START,
-    R_HSYNC_END,
-    R_HSCAN,
-    R_VRES,
-    R_VSYNC_START,
-    R_VSYNC_END,
-    R_VSCAN,
-    R_BASEADDRESS,
-    R_BASEADDRESS_ACT,
-    R_BURST_COUNT,
-    R_DDC,
-    R_SOURCE_CLOCK,
-    R_MAX
-};
-
-enum {
-    CTRL_RESET = (1<<0),
-};
-
-#define TYPE_MILKYMIST_VGAFB "milkymist-vgafb"
-OBJECT_DECLARE_SIMPLE_TYPE(MilkymistVgafbState, MILKYMIST_VGAFB)
-
-struct MilkymistVgafbState {
-    SysBusDevice parent_obj;
-
-    MemoryRegion regs_region;
-    MemoryRegionSection fbsection;
-    QemuConsole *con;
-
-    int invalidate;
-    uint32_t fb_offset;
-    uint32_t fb_mask;
-
-    uint32_t regs[R_MAX];
-};
-
-static int vgafb_enabled(MilkymistVgafbState *s)
-{
-    return !(s->regs[R_CTRL] & CTRL_RESET);
-}
-
-static void vgafb_update_display(void *opaque)
-{
-    MilkymistVgafbState *s = opaque;
-    SysBusDevice *sbd;
-    DisplaySurface *surface = qemu_console_surface(s->con);
-    int src_width;
-    int first = 0;
-    int last = 0;
-    drawfn fn;
-
-    if (!vgafb_enabled(s)) {
-        return;
-    }
-
-    sbd = SYS_BUS_DEVICE(s);
-    int dest_width = s->regs[R_HRES];
-
-    switch (surface_bits_per_pixel(surface)) {
-    case 0:
-        return;
-    case 8:
-        fn = draw_line_8;
-        break;
-    case 15:
-        fn = draw_line_15;
-        dest_width *= 2;
-        break;
-    case 16:
-        fn = draw_line_16;
-        dest_width *= 2;
-        break;
-    case 24:
-        fn = draw_line_24;
-        dest_width *= 3;
-        break;
-    case 32:
-        fn = draw_line_32;
-        dest_width *= 4;
-        break;
-    default:
-        hw_error("milkymist_vgafb: bad color depth\n");
-        break;
-    }
-
-    src_width = s->regs[R_HRES] * 2;
-    if (s->invalidate) {
-        framebuffer_update_memory_section(&s->fbsection,
-                                          sysbus_address_space(sbd),
-                                          s->regs[R_BASEADDRESS] + s->fb_offset,
-                                          s->regs[R_VRES], src_width);
-    }
-
-    framebuffer_update_display(surface, &s->fbsection,
-                               s->regs[R_HRES],
-                               s->regs[R_VRES],
-                               src_width,
-                               dest_width,
-                               0,
-                               s->invalidate,
-                               fn,
-                               NULL,
-                               &first, &last);
-
-    if (first >= 0) {
-        dpy_gfx_update(s->con, 0, first, s->regs[R_HRES], last - first + 1);
-    }
-    s->invalidate = 0;
-}
-
-static void vgafb_invalidate_display(void *opaque)
-{
-    MilkymistVgafbState *s = opaque;
-    s->invalidate = 1;
-}
-
-static void vgafb_resize(MilkymistVgafbState *s)
-{
-    if (!vgafb_enabled(s)) {
-        return;
-    }
-
-    qemu_console_resize(s->con, s->regs[R_HRES], s->regs[R_VRES]);
-    s->invalidate = 1;
-}
-
-static uint64_t vgafb_read(void *opaque, hwaddr addr,
-                           unsigned size)
-{
-    MilkymistVgafbState *s = opaque;
-    uint32_t r = 0;
-
-    addr >>= 2;
-    switch (addr) {
-    case R_CTRL:
-    case R_HRES:
-    case R_HSYNC_START:
-    case R_HSYNC_END:
-    case R_HSCAN:
-    case R_VRES:
-    case R_VSYNC_START:
-    case R_VSYNC_END:
-    case R_VSCAN:
-    case R_BASEADDRESS:
-    case R_BURST_COUNT:
-    case R_DDC:
-    case R_SOURCE_CLOCK:
-        r = s->regs[addr];
-    break;
-    case R_BASEADDRESS_ACT:
-        r = s->regs[R_BASEADDRESS];
-    break;
-
-    default:
-        error_report("milkymist_vgafb: read access to unknown register 0x"
-                TARGET_FMT_plx, addr << 2);
-        break;
-    }
-
-    trace_milkymist_vgafb_memory_read(addr << 2, r);
-
-    return r;
-}
-
-static void vgafb_write(void *opaque, hwaddr addr, uint64_t value,
-                        unsigned size)
-{
-    MilkymistVgafbState *s = opaque;
-
-    trace_milkymist_vgafb_memory_write(addr, value);
-
-    addr >>= 2;
-    switch (addr) {
-    case R_CTRL:
-        s->regs[addr] = value;
-        vgafb_resize(s);
-        break;
-    case R_HSYNC_START:
-    case R_HSYNC_END:
-    case R_HSCAN:
-    case R_VSYNC_START:
-    case R_VSYNC_END:
-    case R_VSCAN:
-    case R_BURST_COUNT:
-    case R_DDC:
-    case R_SOURCE_CLOCK:
-        s->regs[addr] = value;
-        break;
-    case R_BASEADDRESS:
-        if (value & 0x1f) {
-            error_report("milkymist_vgafb: framebuffer base address have to "
-                     "be 32 byte aligned");
-            break;
-        }
-        s->regs[addr] = value & s->fb_mask;
-        s->invalidate = 1;
-        break;
-    case R_HRES:
-    case R_VRES:
-        s->regs[addr] = value;
-        vgafb_resize(s);
-        break;
-    case R_BASEADDRESS_ACT:
-        error_report("milkymist_vgafb: write to read-only register 0x"
-                TARGET_FMT_plx, addr << 2);
-        break;
-
-    default:
-        error_report("milkymist_vgafb: write access to unknown register 0x"
-                TARGET_FMT_plx, addr << 2);
-        break;
-    }
-}
-
-static const MemoryRegionOps vgafb_mmio_ops = {
-    .read = vgafb_read,
-    .write = vgafb_write,
-    .valid = {
-        .min_access_size = 4,
-        .max_access_size = 4,
-    },
-    .endianness = DEVICE_NATIVE_ENDIAN,
-};
-
-static void milkymist_vgafb_reset(DeviceState *d)
-{
-    MilkymistVgafbState *s = MILKYMIST_VGAFB(d);
-    int i;
-
-    for (i = 0; i < R_MAX; i++) {
-        s->regs[i] = 0;
-    }
-
-    /* defaults */
-    s->regs[R_CTRL] = CTRL_RESET;
-    s->regs[R_HRES] = 640;
-    s->regs[R_VRES] = 480;
-    s->regs[R_BASEADDRESS] = 0;
-}
-
-static const GraphicHwOps vgafb_ops = {
-    .invalidate  = vgafb_invalidate_display,
-    .gfx_update  = vgafb_update_display,
-};
-
-static void milkymist_vgafb_init(Object *obj)
-{
-    MilkymistVgafbState *s = MILKYMIST_VGAFB(obj);
-    SysBusDevice *dev = SYS_BUS_DEVICE(obj);
-
-    memory_region_init_io(&s->regs_region, OBJECT(s), &vgafb_mmio_ops, s,
-            "milkymist-vgafb", R_MAX * 4);
-    sysbus_init_mmio(dev, &s->regs_region);
-}
-
-static void milkymist_vgafb_realize(DeviceState *dev, Error **errp)
-{
-    MilkymistVgafbState *s = MILKYMIST_VGAFB(dev);
-
-    s->con = graphic_console_init(dev, 0, &vgafb_ops, s);
-}
-
-static int vgafb_post_load(void *opaque, int version_id)
-{
-    vgafb_invalidate_display(opaque);
-    return 0;
-}
-
-static const VMStateDescription vmstate_milkymist_vgafb = {
-    .name = "milkymist-vgafb",
-    .version_id = 1,
-    .minimum_version_id = 1,
-    .post_load = vgafb_post_load,
-    .fields = (VMStateField[]) {
-        VMSTATE_UINT32_ARRAY(regs, MilkymistVgafbState, R_MAX),
-        VMSTATE_END_OF_LIST()
-    }
-};
-
-static Property milkymist_vgafb_properties[] = {
-    DEFINE_PROP_UINT32("fb_offset", MilkymistVgafbState, fb_offset, 0x0),
-    DEFINE_PROP_UINT32("fb_mask", MilkymistVgafbState, fb_mask, 0xffffffff),
-    DEFINE_PROP_END_OF_LIST(),
-};
-
-static void milkymist_vgafb_class_init(ObjectClass *klass, void *data)
-{
-    DeviceClass *dc = DEVICE_CLASS(klass);
-
-    dc->reset = milkymist_vgafb_reset;
-    dc->vmsd = &vmstate_milkymist_vgafb;
-    device_class_set_props(dc, milkymist_vgafb_properties);
-    dc->realize = milkymist_vgafb_realize;
-}
-
-static const TypeInfo milkymist_vgafb_info = {
-    .name          = TYPE_MILKYMIST_VGAFB,
-    .parent        = TYPE_SYS_BUS_DEVICE,
-    .instance_size = sizeof(MilkymistVgafbState),
-    .instance_init = milkymist_vgafb_init,
-    .class_init    = milkymist_vgafb_class_init,
-};
-
-static void milkymist_vgafb_register_types(void)
-{
-    type_register_static(&milkymist_vgafb_info);
-}
-
-type_init(milkymist_vgafb_register_types)
diff --git a/hw/input/milkymist-softusb.c b/hw/input/milkymist-softusb.c
deleted file mode 100644
index d885c708d7..0000000000
--- a/hw/input/milkymist-softusb.c
+++ /dev/null
@@ -1,319 +0,0 @@
-/*
- *  QEMU model of the Milkymist SoftUSB block.
- *
- *  Copyright (c) 2010 Michael Walle <michael@walle.cc>
- *
- * This library is free software; you can redistribute it and/or
- * modify it under the terms of the GNU Lesser General Public
- * License as published by the Free Software Foundation; either
- * version 2.1 of the License, or (at your option) any later version.
- *
- * This library is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
- * Lesser General Public License for more details.
- *
- * You should have received a copy of the GNU Lesser General Public
- * License along with this library; if not, see <http://www.gnu.org/licenses/>.
- *
- *
- * Specification available at:
- *   not available yet
- */
-
-#include "qemu/osdep.h"
-#include "qapi/error.h"
-#include "hw/sysbus.h"
-#include "migration/vmstate.h"
-#include "trace.h"
-#include "ui/console.h"
-#include "hw/input/hid.h"
-#include "hw/irq.h"
-#include "hw/qdev-properties.h"
-#include "qemu/error-report.h"
-#include "qemu/module.h"
-#include "qom/object.h"
-
-enum {
-    R_CTRL = 0,
-    R_MAX
-};
-
-enum {
-    CTRL_RESET = (1<<0),
-};
-
-#define COMLOC_DEBUG_PRODUCE 0x1000
-#define COMLOC_DEBUG_BASE    0x1001
-#define COMLOC_MEVT_PRODUCE  0x1101
-#define COMLOC_MEVT_BASE     0x1102
-#define COMLOC_KEVT_PRODUCE  0x1142
-#define COMLOC_KEVT_BASE     0x1143
-
-#define TYPE_MILKYMIST_SOFTUSB "milkymist-softusb"
-OBJECT_DECLARE_SIMPLE_TYPE(MilkymistSoftUsbState, MILKYMIST_SOFTUSB)
-
-struct MilkymistSoftUsbState {
-    SysBusDevice parent_obj;
-
-    HIDState hid_kbd;
-    HIDState hid_mouse;
-
-    MemoryRegion regs_region;
-    MemoryRegion pmem;
-    MemoryRegion dmem;
-    qemu_irq irq;
-
-    void *pmem_ptr;
-    void *dmem_ptr;
-
-    /* device properties */
-    uint32_t pmem_size;
-    uint32_t dmem_size;
-
-    /* device registers */
-    uint32_t regs[R_MAX];
-
-    /* mouse state */
-    uint8_t mouse_hid_buffer[4];
-
-    /* keyboard state */
-    uint8_t kbd_hid_buffer[8];
-};
-
-static uint64_t softusb_read(void *opaque, hwaddr addr,
-                             unsigned size)
-{
-    MilkymistSoftUsbState *s = opaque;
-    uint32_t r = 0;
-
-    addr >>= 2;
-    switch (addr) {
-    case R_CTRL:
-        r = s->regs[addr];
-        break;
-
-    default:
-        error_report("milkymist_softusb: read access to unknown register 0x"
-                TARGET_FMT_plx, addr << 2);
-        break;
-    }
-
-    trace_milkymist_softusb_memory_read(addr << 2, r);
-
-    return r;
-}
-
-static void
-softusb_write(void *opaque, hwaddr addr, uint64_t value,
-              unsigned size)
-{
-    MilkymistSoftUsbState *s = opaque;
-
-    trace_milkymist_softusb_memory_write(addr, value);
-
-    addr >>= 2;
-    switch (addr) {
-    case R_CTRL:
-        s->regs[addr] = value;
-        break;
-
-    default:
-        error_report("milkymist_softusb: write access to unknown register 0x"
-                TARGET_FMT_plx, addr << 2);
-        break;
-    }
-}
-
-static const MemoryRegionOps softusb_mmio_ops = {
-    .read = softusb_read,
-    .write = softusb_write,
-    .endianness = DEVICE_NATIVE_ENDIAN,
-    .valid = {
-        .min_access_size = 4,
-        .max_access_size = 4,
-    },
-};
-
-static inline void softusb_read_dmem(MilkymistSoftUsbState *s,
-        uint32_t offset, uint8_t *buf, uint32_t len)
-{
-    if (offset + len >= s->dmem_size) {
-        error_report("milkymist_softusb: read dmem out of bounds "
-                "at offset 0x%x, len %d", offset, len);
-        memset(buf, 0, len);
-        return;
-    }
-
-    memcpy(buf, s->dmem_ptr + offset, len);
-}
-
-static inline void softusb_write_dmem(MilkymistSoftUsbState *s,
-        uint32_t offset, uint8_t *buf, uint32_t len)
-{
-    if (offset + len >= s->dmem_size) {
-        error_report("milkymist_softusb: write dmem out of bounds "
-                "at offset 0x%x, len %d", offset, len);
-        return;
-    }
-
-    memcpy(s->dmem_ptr + offset, buf, len);
-}
-
-static void softusb_mouse_changed(MilkymistSoftUsbState *s)
-{
-    uint8_t m;
-
-    softusb_read_dmem(s, COMLOC_MEVT_PRODUCE, &m, 1);
-    trace_milkymist_softusb_mevt(m);
-    softusb_write_dmem(s, COMLOC_MEVT_BASE + 4 * m, s->mouse_hid_buffer, 4);
-    m = (m + 1) & 0xf;
-    softusb_write_dmem(s, COMLOC_MEVT_PRODUCE, &m, 1);
-
-    trace_milkymist_softusb_pulse_irq();
-    qemu_irq_pulse(s->irq);
-}
-
-static void softusb_kbd_changed(MilkymistSoftUsbState *s)
-{
-    uint8_t m;
-
-    softusb_read_dmem(s, COMLOC_KEVT_PRODUCE, &m, 1);
-    trace_milkymist_softusb_kevt(m);
-    softusb_write_dmem(s, COMLOC_KEVT_BASE + 8 * m, s->kbd_hid_buffer, 8);
-    m = (m + 1) & 0x7;
-    softusb_write_dmem(s, COMLOC_KEVT_PRODUCE, &m, 1);
-
-    trace_milkymist_softusb_pulse_irq();
-    qemu_irq_pulse(s->irq);
-}
-
-static void softusb_kbd_hid_datain(HIDState *hs)
-{
-    MilkymistSoftUsbState *s = container_of(hs, MilkymistSoftUsbState, hid_kbd);
-    int len;
-
-    /* if device is in reset, do nothing */
-    if (s->regs[R_CTRL] & CTRL_RESET) {
-        return;
-    }
-
-    while (hid_has_events(hs)) {
-        len = hid_keyboard_poll(hs, s->kbd_hid_buffer,
-                sizeof(s->kbd_hid_buffer));
-
-        if (len == 8) {
-            softusb_kbd_changed(s);
-        }
-    }
-}
-
-static void softusb_mouse_hid_datain(HIDState *hs)
-{
-    MilkymistSoftUsbState *s =
-            container_of(hs, MilkymistSoftUsbState, hid_mouse);
-    int len;
-
-    /* if device is in reset, do nothing */
-    if (s->regs[R_CTRL] & CTRL_RESET) {
-        return;
-    }
-
-    while (hid_has_events(hs)) {
-        len = hid_pointer_poll(hs, s->mouse_hid_buffer,
-                sizeof(s->mouse_hid_buffer));
-
-        if (len == 4) {
-            softusb_mouse_changed(s);
-        }
-    }
-}
-
-static void milkymist_softusb_reset(DeviceState *d)
-{
-    MilkymistSoftUsbState *s = MILKYMIST_SOFTUSB(d);
-    int i;
-
-    for (i = 0; i < R_MAX; i++) {
-        s->regs[i] = 0;
-    }
-    memset(s->kbd_hid_buffer, 0, sizeof(s->kbd_hid_buffer));
-    memset(s->mouse_hid_buffer, 0, sizeof(s->mouse_hid_buffer));
-
-    hid_reset(&s->hid_kbd);
-    hid_reset(&s->hid_mouse);
-
-    /* defaults */
-    s->regs[R_CTRL] = CTRL_RESET;
-}
-
-static void milkymist_softusb_realize(DeviceState *dev, Error **errp)
-{
-    MilkymistSoftUsbState *s = MILKYMIST_SOFTUSB(dev);
-    SysBusDevice *sbd = SYS_BUS_DEVICE(dev);
-
-    sysbus_init_irq(sbd, &s->irq);
-
-    memory_region_init_io(&s->regs_region, OBJECT(s), &softusb_mmio_ops, s,
-                          "milkymist-softusb", R_MAX * 4);
-    sysbus_init_mmio(sbd, &s->regs_region);
-
-    /* register pmem and dmem */
-    memory_region_init_ram_nomigrate(&s->pmem, OBJECT(s), "milkymist-softusb.pmem",
-                           s->pmem_size, &error_fatal);
-    vmstate_register_ram_global(&s->pmem);
-    s->pmem_ptr = memory_region_get_ram_ptr(&s->pmem);
-    sysbus_init_mmio(sbd, &s->pmem);
-    memory_region_init_ram_nomigrate(&s->dmem, OBJECT(s), "milkymist-softusb.dmem",
-                           s->dmem_size, &error_fatal);
-    vmstate_register_ram_global(&s->dmem);
-    s->dmem_ptr = memory_region_get_ram_ptr(&s->dmem);
-    sysbus_init_mmio(sbd, &s->dmem);
-
-    hid_init(&s->hid_kbd, HID_KEYBOARD, softusb_kbd_hid_datain);
-    hid_init(&s->hid_mouse, HID_MOUSE, softusb_mouse_hid_datain);
-}
-
-static const VMStateDescription vmstate_milkymist_softusb = {
-    .name = "milkymist-softusb",
-    .version_id = 1,
-    .minimum_version_id = 1,
-    .fields = (VMStateField[]) {
-        VMSTATE_UINT32_ARRAY(regs, MilkymistSoftUsbState, R_MAX),
-        VMSTATE_HID_KEYBOARD_DEVICE(hid_kbd, MilkymistSoftUsbState),
-        VMSTATE_HID_POINTER_DEVICE(hid_mouse, MilkymistSoftUsbState),
-        VMSTATE_BUFFER(kbd_hid_buffer, MilkymistSoftUsbState),
-        VMSTATE_BUFFER(mouse_hid_buffer, MilkymistSoftUsbState),
-        VMSTATE_END_OF_LIST()
-    }
-};
-
-static Property milkymist_softusb_properties[] = {
-    DEFINE_PROP_UINT32("pmem_size", MilkymistSoftUsbState, pmem_size, 0x00001000),
-    DEFINE_PROP_UINT32("dmem_size", MilkymistSoftUsbState, dmem_size, 0x00002000),
-    DEFINE_PROP_END_OF_LIST(),
-};
-
-static void milkymist_softusb_class_init(ObjectClass *klass, void *data)
-{
-    DeviceClass *dc = DEVICE_CLASS(klass);
-
-    dc->realize = milkymist_softusb_realize;
-    dc->reset = milkymist_softusb_reset;
-    dc->vmsd = &vmstate_milkymist_softusb;
-    device_class_set_props(dc, milkymist_softusb_properties);
-}
-
-static const TypeInfo milkymist_softusb_info = {
-    .name          = TYPE_MILKYMIST_SOFTUSB,
-    .parent        = TYPE_SYS_BUS_DEVICE,
-    .instance_size = sizeof(MilkymistSoftUsbState),
-    .class_init    = milkymist_softusb_class_init,
-};
-
-static void milkymist_softusb_register_types(void)
-{
-    type_register_static(&milkymist_softusb_info);
-}
-
-type_init(milkymist_softusb_register_types)
diff --git a/hw/intc/lm32_pic.c b/hw/intc/lm32_pic.c
deleted file mode 100644
index 991a90bc99..0000000000
--- a/hw/intc/lm32_pic.c
+++ /dev/null
@@ -1,195 +0,0 @@
-/*
- *  LatticeMico32 CPU interrupt controller logic.
- *
- *  Copyright (c) 2010 Michael Walle <michael@walle.cc>
- *
- * This library is free software; you can redistribute it and/or
- * modify it under the terms of the GNU Lesser General Public
- * License as published by the Free Software Foundation; either
- * version 2.1 of the License, or (at your option) any later version.
- *
- * This library is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
- * Lesser General Public License for more details.
- *
- * You should have received a copy of the GNU Lesser General Public
- * License along with this library; if not, see <http://www.gnu.org/licenses/>.
- */
-
-#include "qemu/osdep.h"
-
-#include "migration/vmstate.h"
-#include "monitor/monitor.h"
-#include "qemu/module.h"
-#include "hw/sysbus.h"
-#include "trace.h"
-#include "hw/lm32/lm32_pic.h"
-#include "hw/intc/intc.h"
-#include "hw/irq.h"
-#include "qom/object.h"
-
-#define TYPE_LM32_PIC "lm32-pic"
-OBJECT_DECLARE_SIMPLE_TYPE(LM32PicState, LM32_PIC)
-
-struct LM32PicState {
-    SysBusDevice parent_obj;
-
-    qemu_irq parent_irq;
-    uint32_t im;        /* interrupt mask */
-    uint32_t ip;        /* interrupt pending */
-    uint32_t irq_state;
-
-    /* statistics */
-    uint64_t stats_irq_count[32];
-};
-
-static void update_irq(LM32PicState *s)
-{
-    s->ip |= s->irq_state;
-
-    if (s->ip & s->im) {
-        trace_lm32_pic_raise_irq();
-        qemu_irq_raise(s->parent_irq);
-    } else {
-        trace_lm32_pic_lower_irq();
-        qemu_irq_lower(s->parent_irq);
-    }
-}
-
-static void irq_handler(void *opaque, int irq, int level)
-{
-    LM32PicState *s = opaque;
-
-    assert(irq < 32);
-    trace_lm32_pic_interrupt(irq, level);
-
-    if (level) {
-        s->irq_state |= (1 << irq);
-        s->stats_irq_count[irq]++;
-    } else {
-        s->irq_state &= ~(1 << irq);
-    }
-
-    update_irq(s);
-}
-
-void lm32_pic_set_im(DeviceState *d, uint32_t im)
-{
-    LM32PicState *s = LM32_PIC(d);
-
-    trace_lm32_pic_set_im(im);
-    s->im = im;
-
-    update_irq(s);
-}
-
-void lm32_pic_set_ip(DeviceState *d, uint32_t ip)
-{
-    LM32PicState *s = LM32_PIC(d);
-
-    trace_lm32_pic_set_ip(ip);
-
-    /* ack interrupt */
-    s->ip &= ~ip;
-
-    update_irq(s);
-}
-
-uint32_t lm32_pic_get_im(DeviceState *d)
-{
-    LM32PicState *s = LM32_PIC(d);
-
-    trace_lm32_pic_get_im(s->im);
-    return s->im;
-}
-
-uint32_t lm32_pic_get_ip(DeviceState *d)
-{
-    LM32PicState *s = LM32_PIC(d);
-
-    trace_lm32_pic_get_ip(s->ip);
-    return s->ip;
-}
-
-static void pic_reset(DeviceState *d)
-{
-    LM32PicState *s = LM32_PIC(d);
-    int i;
-
-    s->im = 0;
-    s->ip = 0;
-    s->irq_state = 0;
-    for (i = 0; i < 32; i++) {
-        s->stats_irq_count[i] = 0;
-    }
-}
-
-static bool lm32_get_statistics(InterruptStatsProvider *obj,
-                                uint64_t **irq_counts, unsigned int *nb_irqs)
-{
-    LM32PicState *s = LM32_PIC(obj);
-    *irq_counts = s->stats_irq_count;
-    *nb_irqs = ARRAY_SIZE(s->stats_irq_count);
-    return true;
-}
-
-static void lm32_print_info(InterruptStatsProvider *obj, Monitor *mon)
-{
-    LM32PicState *s = LM32_PIC(obj);
-    monitor_printf(mon, "lm32-pic: im=%08x ip=%08x irq_state=%08x\n",
-            s->im, s->ip, s->irq_state);
-}
-
-static void lm32_pic_init(Object *obj)
-{
-    DeviceState *dev = DEVICE(obj);
-    LM32PicState *s = LM32_PIC(obj);
-    SysBusDevice *sbd = SYS_BUS_DEVICE(obj);
-
-    qdev_init_gpio_in(dev, irq_handler, 32);
-    sysbus_init_irq(sbd, &s->parent_irq);
-}
-
-static const VMStateDescription vmstate_lm32_pic = {
-    .name = "lm32-pic",
-    .version_id = 2,
-    .minimum_version_id = 2,
-    .fields = (VMStateField[]) {
-        VMSTATE_UINT32(im, LM32PicState),
-        VMSTATE_UINT32(ip, LM32PicState),
-        VMSTATE_UINT32(irq_state, LM32PicState),
-        VMSTATE_UINT64_ARRAY(stats_irq_count, LM32PicState, 32),
-        VMSTATE_END_OF_LIST()
-    }
-};
-
-static void lm32_pic_class_init(ObjectClass *klass, void *data)
-{
-    DeviceClass *dc = DEVICE_CLASS(klass);
-    InterruptStatsProviderClass *ic = INTERRUPT_STATS_PROVIDER_CLASS(klass);
-
-    dc->reset = pic_reset;
-    dc->vmsd = &vmstate_lm32_pic;
-    ic->get_statistics = lm32_get_statistics;
-    ic->print_info = lm32_print_info;
-}
-
-static const TypeInfo lm32_pic_info = {
-    .name          = TYPE_LM32_PIC,
-    .parent        = TYPE_SYS_BUS_DEVICE,
-    .instance_size = sizeof(LM32PicState),
-    .instance_init = lm32_pic_init,
-    .class_init    = lm32_pic_class_init,
-    .interfaces = (InterfaceInfo[]) {
-        { TYPE_INTERRUPT_STATS_PROVIDER },
-        { }
-    },
-};
-
-static void lm32_pic_register_types(void)
-{
-    type_register_static(&lm32_pic_info);
-}
-
-type_init(lm32_pic_register_types)
diff --git a/hw/lm32/lm32_boards.c b/hw/lm32/lm32_boards.c
deleted file mode 100644
index 2961e4c2b4..0000000000
--- a/hw/lm32/lm32_boards.c
+++ /dev/null
@@ -1,332 +0,0 @@
-/*
- *  QEMU models for LatticeMico32 uclinux and evr32 boards.
- *
- *  Copyright (c) 2010 Michael Walle <michael@walle.cc>
- *
- * This library is free software; you can redistribute it and/or
- * modify it under the terms of the GNU Lesser General Public
- * License as published by the Free Software Foundation; either
- * version 2.1 of the License, or (at your option) any later version.
- *
- * This library is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
- * Lesser General Public License for more details.
- *
- * You should have received a copy of the GNU Lesser General Public
- * License along with this library; if not, see <http://www.gnu.org/licenses/>.
- */
-
-#include "qemu/osdep.h"
-#include "qemu/units.h"
-#include "qemu/cutils.h"
-#include "qemu/error-report.h"
-#include "cpu.h"
-#include "hw/sysbus.h"
-#include "hw/irq.h"
-#include "hw/block/flash.h"
-#include "hw/boards.h"
-#include "hw/loader.h"
-#include "elf.h"
-#include "lm32_hwsetup.h"
-#include "lm32.h"
-#include "sysemu/reset.h"
-#include "sysemu/sysemu.h"
-
-typedef struct {
-    LM32CPU *cpu;
-    hwaddr bootstrap_pc;
-    hwaddr flash_base;
-    hwaddr hwsetup_base;
-    hwaddr initrd_base;
-    size_t initrd_size;
-    hwaddr cmdline_base;
-} ResetInfo;
-
-static void cpu_irq_handler(void *opaque, int irq, int level)
-{
-    LM32CPU *cpu = opaque;
-    CPUState *cs = CPU(cpu);
-
-    if (level) {
-        cpu_interrupt(cs, CPU_INTERRUPT_HARD);
-    } else {
-        cpu_reset_interrupt(cs, CPU_INTERRUPT_HARD);
-    }
-}
-
-static void main_cpu_reset(void *opaque)
-{
-    ResetInfo *reset_info = opaque;
-    CPULM32State *env = &reset_info->cpu->env;
-
-    cpu_reset(CPU(reset_info->cpu));
-
-    /* init defaults */
-    env->pc = (uint32_t)reset_info->bootstrap_pc;
-    env->regs[R_R1] = (uint32_t)reset_info->hwsetup_base;
-    env->regs[R_R2] = (uint32_t)reset_info->cmdline_base;
-    env->regs[R_R3] = (uint32_t)reset_info->initrd_base;
-    env->regs[R_R4] = (uint32_t)(reset_info->initrd_base +
-        reset_info->initrd_size);
-    env->eba = reset_info->flash_base;
-    env->deba = reset_info->flash_base;
-}
-
-static void lm32_evr_init(MachineState *machine)
-{
-    MachineClass *mc = MACHINE_GET_CLASS(machine);
-    const char *kernel_filename = machine->kernel_filename;
-    LM32CPU *cpu;
-    CPULM32State *env;
-    DriveInfo *dinfo;
-    MemoryRegion *address_space_mem =  get_system_memory();
-    qemu_irq irq[32];
-    ResetInfo *reset_info;
-    int i;
-
-    if (machine->ram_size != mc->default_ram_size) {
-        char *sz = size_to_str(mc->default_ram_size);
-        error_report("Invalid RAM size, should be %s", sz);
-        g_free(sz);
-        exit(EXIT_FAILURE);
-    }
-
-    /* memory map */
-    hwaddr flash_base  = 0x04000000;
-    size_t flash_sector_size       = 256 * KiB;
-    size_t flash_size              = 32 * MiB;
-    hwaddr ram_base    = 0x08000000;
-    hwaddr timer0_base = 0x80002000;
-    hwaddr uart0_base  = 0x80006000;
-    hwaddr timer1_base = 0x8000a000;
-    int uart0_irq                  = 0;
-    int timer0_irq                 = 1;
-    int timer1_irq                 = 3;
-
-    reset_info = g_malloc0(sizeof(ResetInfo));
-
-    cpu = LM32_CPU(cpu_create(machine->cpu_type));
-
-    env = &cpu->env;
-    reset_info->cpu = cpu;
-
-    reset_info->flash_base = flash_base;
-
-    memory_region_add_subregion(address_space_mem, ram_base, machine->ram);
-
-    dinfo = drive_get(IF_PFLASH, 0, 0);
-    /* Spansion S29NS128P */
-    pflash_cfi02_register(flash_base, "lm32_evr.flash", flash_size,
-                          dinfo ? blk_by_legacy_dinfo(dinfo) : NULL,
-                          flash_sector_size,
-                          1, 2, 0x01, 0x7e, 0x43, 0x00, 0x555, 0x2aa, 1);
-
-    /* create irq lines */
-    env->pic_state = lm32_pic_init(qemu_allocate_irq(cpu_irq_handler, cpu, 0));
-    for (i = 0; i < 32; i++) {
-        irq[i] = qdev_get_gpio_in(env->pic_state, i);
-    }
-
-    lm32_uart_create(uart0_base, irq[uart0_irq], serial_hd(0));
-    sysbus_create_simple("lm32-timer", timer0_base, irq[timer0_irq]);
-    sysbus_create_simple("lm32-timer", timer1_base, irq[timer1_irq]);
-
-    /* make sure juart isn't the first chardev */
-    env->juart_state = lm32_juart_init(serial_hd(1));
-
-    reset_info->bootstrap_pc = flash_base;
-
-    if (kernel_filename) {
-        uint64_t entry;
-        int kernel_size;
-
-        kernel_size = load_elf(kernel_filename, NULL, NULL, NULL,
-                               &entry, NULL, NULL, NULL,
-                               1, EM_LATTICEMICO32, 0, 0);
-        reset_info->bootstrap_pc = entry;
-
-        if (kernel_size < 0) {
-            kernel_size = load_image_targphys(kernel_filename, ram_base,
-                                              machine->ram_size);
-            reset_info->bootstrap_pc = ram_base;
-        }
-
-        if (kernel_size < 0) {
-            error_report("could not load kernel '%s'", kernel_filename);
-            exit(1);
-        }
-    }
-
-    qemu_register_reset(main_cpu_reset, reset_info);
-}
-
-static void lm32_uclinux_init(MachineState *machine)
-{
-    MachineClass *mc = MACHINE_GET_CLASS(machine);
-    const char *kernel_filename = machine->kernel_filename;
-    const char *kernel_cmdline = machine->kernel_cmdline;
-    const char *initrd_filename = machine->initrd_filename;
-    LM32CPU *cpu;
-    CPULM32State *env;
-    DriveInfo *dinfo;
-    MemoryRegion *address_space_mem =  get_system_memory();
-    qemu_irq irq[32];
-    HWSetup *hw;
-    ResetInfo *reset_info;
-    int i;
-
-    if (machine->ram_size != mc->default_ram_size) {
-        char *sz = size_to_str(mc->default_ram_size);
-        error_report("Invalid RAM size, should be %s", sz);
-        g_free(sz);
-        exit(EXIT_FAILURE);
-    }
-
-    /* memory map */
-    hwaddr flash_base   = 0x04000000;
-    size_t flash_sector_size        = 256 * KiB;
-    size_t flash_size               = 32 * MiB;
-    hwaddr ram_base     = 0x08000000;
-    hwaddr uart0_base   = 0x80000000;
-    hwaddr timer0_base  = 0x80002000;
-    hwaddr timer1_base  = 0x80010000;
-    hwaddr timer2_base  = 0x80012000;
-    int uart0_irq                   = 0;
-    int timer0_irq                  = 1;
-    int timer1_irq                  = 20;
-    int timer2_irq                  = 21;
-    hwaddr hwsetup_base = 0x0bffe000;
-    hwaddr cmdline_base = 0x0bfff000;
-    hwaddr initrd_base  = 0x08400000;
-    size_t initrd_max               = 0x01000000;
-
-    reset_info = g_malloc0(sizeof(ResetInfo));
-
-    cpu = LM32_CPU(cpu_create(machine->cpu_type));
-
-    env = &cpu->env;
-    reset_info->cpu = cpu;
-
-    reset_info->flash_base = flash_base;
-
-    memory_region_add_subregion(address_space_mem, ram_base, machine->ram);
-
-    dinfo = drive_get(IF_PFLASH, 0, 0);
-    /* Spansion S29NS128P */
-    pflash_cfi02_register(flash_base, "lm32_uclinux.flash", flash_size,
-                          dinfo ? blk_by_legacy_dinfo(dinfo) : NULL,
-                          flash_sector_size,
-                          1, 2, 0x01, 0x7e, 0x43, 0x00, 0x555, 0x2aa, 1);
-
-    /* create irq lines */
-    env->pic_state = lm32_pic_init(qemu_allocate_irq(cpu_irq_handler, env, 0));
-    for (i = 0; i < 32; i++) {
-        irq[i] = qdev_get_gpio_in(env->pic_state, i);
-    }
-
-    lm32_uart_create(uart0_base, irq[uart0_irq], serial_hd(0));
-    sysbus_create_simple("lm32-timer", timer0_base, irq[timer0_irq]);
-    sysbus_create_simple("lm32-timer", timer1_base, irq[timer1_irq]);
-    sysbus_create_simple("lm32-timer", timer2_base, irq[timer2_irq]);
-
-    /* make sure juart isn't the first chardev */
-    env->juart_state = lm32_juart_init(serial_hd(1));
-
-    reset_info->bootstrap_pc = flash_base;
-
-    if (kernel_filename) {
-        uint64_t entry;
-        int kernel_size;
-
-        kernel_size = load_elf(kernel_filename, NULL, NULL, NULL,
-                               &entry, NULL, NULL, NULL,
-                               1, EM_LATTICEMICO32, 0, 0);
-        reset_info->bootstrap_pc = entry;
-
-        if (kernel_size < 0) {
-            kernel_size = load_image_targphys(kernel_filename, ram_base,
-                                              machine->ram_size);
-            reset_info->bootstrap_pc = ram_base;
-        }
-
-        if (kernel_size < 0) {
-            error_report("could not load kernel '%s'", kernel_filename);
-            exit(1);
-        }
-    }
-
-    /* generate a rom with the hardware description */
-    hw = hwsetup_init();
-    hwsetup_add_cpu(hw, "LM32", 75000000);
-    hwsetup_add_flash(hw, "flash", flash_base, flash_size);
-    hwsetup_add_ddr_sdram(hw, "ddr_sdram", ram_base, machine->ram_size);
-    hwsetup_add_timer(hw, "timer0", timer0_base, timer0_irq);
-    hwsetup_add_timer(hw, "timer1_dev_only", timer1_base, timer1_irq);
-    hwsetup_add_timer(hw, "timer2_dev_only", timer2_base, timer2_irq);
-    hwsetup_add_uart(hw, "uart", uart0_base, uart0_irq);
-    hwsetup_add_trailer(hw);
-    hwsetup_create_rom(hw, hwsetup_base);
-    hwsetup_free(hw);
-
-    reset_info->hwsetup_base = hwsetup_base;
-
-    if (kernel_cmdline && strlen(kernel_cmdline)) {
-        pstrcpy_targphys("cmdline", cmdline_base, TARGET_PAGE_SIZE,
-                kernel_cmdline);
-        reset_info->cmdline_base = cmdline_base;
-    }
-
-    if (initrd_filename) {
-        size_t initrd_size;
-        initrd_size = load_image_targphys(initrd_filename, initrd_base,
-                initrd_max);
-        reset_info->initrd_base = initrd_base;
-        reset_info->initrd_size = initrd_size;
-    }
-
-    qemu_register_reset(main_cpu_reset, reset_info);
-}
-
-static void lm32_evr_class_init(ObjectClass *oc, void *data)
-{
-    MachineClass *mc = MACHINE_CLASS(oc);
-
-    mc->desc = "LatticeMico32 EVR32 eval system";
-    mc->init = lm32_evr_init;
-    mc->is_default = true;
-    mc->default_cpu_type = LM32_CPU_TYPE_NAME("lm32-full");
-    mc->default_ram_size = 64 * MiB;
-    mc->default_ram_id = "lm32_evr.sdram";
-}
-
-static const TypeInfo lm32_evr_type = {
-    .name = MACHINE_TYPE_NAME("lm32-evr"),
-    .parent = TYPE_MACHINE,
-    .class_init = lm32_evr_class_init,
-};
-
-static void lm32_uclinux_class_init(ObjectClass *oc, void *data)
-{
-    MachineClass *mc = MACHINE_CLASS(oc);
-
-    mc->desc = "lm32 platform for uClinux and u-boot by Theobroma Systems";
-    mc->init = lm32_uclinux_init;
-    mc->default_cpu_type = LM32_CPU_TYPE_NAME("lm32-full");
-    mc->default_ram_size = 64 * MiB;
-    mc->default_ram_id = "lm32_uclinux.sdram";
-}
-
-static const TypeInfo lm32_uclinux_type = {
-    .name = MACHINE_TYPE_NAME("lm32-uclinux"),
-    .parent = TYPE_MACHINE,
-    .class_init = lm32_uclinux_class_init,
-};
-
-static void lm32_machine_init(void)
-{
-    type_register_static(&lm32_evr_type);
-    type_register_static(&lm32_uclinux_type);
-}
-
-type_init(lm32_machine_init)
diff --git a/hw/lm32/milkymist.c b/hw/lm32/milkymist.c
deleted file mode 100644
index bef7855328..0000000000
--- a/hw/lm32/milkymist.c
+++ /dev/null
@@ -1,249 +0,0 @@
-/*
- *  QEMU model for the Milkymist board.
- *
- *  Copyright (c) 2010 Michael Walle <michael@walle.cc>
- *
- * This library is free software; you can redistribute it and/or
- * modify it under the terms of the GNU Lesser General Public
- * License as published by the Free Software Foundation; either
- * version 2.1 of the License, or (at your option) any later version.
- *
- * This library is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
- * Lesser General Public License for more details.
- *
- * You should have received a copy of the GNU Lesser General Public
- * License along with this library; if not, see <http://www.gnu.org/licenses/>.
- */
-
-#include "qemu/osdep.h"
-#include "qemu/units.h"
-#include "qemu/error-report.h"
-#include "qemu-common.h"
-#include "qemu/datadir.h"
-#include "cpu.h"
-#include "hw/sysbus.h"
-#include "hw/irq.h"
-#include "hw/block/flash.h"
-#include "sysemu/sysemu.h"
-#include "sysemu/qtest.h"
-#include "sysemu/reset.h"
-#include "hw/boards.h"
-#include "hw/loader.h"
-#include "hw/qdev-properties.h"
-#include "elf.h"
-#include "milkymist-hw.h"
-#include "hw/display/milkymist_tmu2.h"
-#include "hw/sd/sd.h"
-#include "lm32.h"
-#include "qemu/cutils.h"
-
-#define BIOS_FILENAME    "mmone-bios.bin"
-#define BIOS_OFFSET      0x00860000
-#define BIOS_SIZE        (512 * KiB)
-#define KERNEL_LOAD_ADDR 0x40000000
-
-typedef struct {
-    LM32CPU *cpu;
-    hwaddr bootstrap_pc;
-    hwaddr flash_base;
-    hwaddr initrd_base;
-    size_t initrd_size;
-    hwaddr cmdline_base;
-} ResetInfo;
-
-static void cpu_irq_handler(void *opaque, int irq, int level)
-{
-    LM32CPU *cpu = opaque;
-    CPUState *cs = CPU(cpu);
-
-    if (level) {
-        cpu_interrupt(cs, CPU_INTERRUPT_HARD);
-    } else {
-        cpu_reset_interrupt(cs, CPU_INTERRUPT_HARD);
-    }
-}
-
-static void main_cpu_reset(void *opaque)
-{
-    ResetInfo *reset_info = opaque;
-    CPULM32State *env = &reset_info->cpu->env;
-
-    cpu_reset(CPU(reset_info->cpu));
-
-    /* init defaults */
-    env->pc = reset_info->bootstrap_pc;
-    env->regs[R_R1] = reset_info->cmdline_base;
-    env->regs[R_R2] = reset_info->initrd_base;
-    env->regs[R_R3] = reset_info->initrd_base + reset_info->initrd_size;
-    env->eba = reset_info->flash_base;
-    env->deba = reset_info->flash_base;
-}
-
-static DeviceState *milkymist_memcard_create(hwaddr base)
-{
-    DeviceState *dev;
-    DriveInfo *dinfo;
-
-    dev = qdev_new("milkymist-memcard");
-    sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
-    sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, base);
-
-    dinfo = drive_get_next(IF_SD);
-    if (dinfo) {
-        DeviceState *card;
-
-        card = qdev_new(TYPE_SD_CARD);
-        qdev_prop_set_drive_err(card, "drive", blk_by_legacy_dinfo(dinfo),
-                                &error_fatal);
-        qdev_realize_and_unref(card, qdev_get_child_bus(dev, "sd-bus"),
-                               &error_fatal);
-    }
-
-    return dev;
-}
-
-static void
-milkymist_init(MachineState *machine)
-{
-    MachineClass *mc = MACHINE_GET_CLASS(machine);
-    const char *bios_name = machine->firmware ?: BIOS_FILENAME;
-    const char *kernel_filename = machine->kernel_filename;
-    const char *kernel_cmdline = machine->kernel_cmdline;
-    const char *initrd_filename = machine->initrd_filename;
-    LM32CPU *cpu;
-    CPULM32State *env;
-    int kernel_size;
-    DriveInfo *dinfo;
-    MemoryRegion *address_space_mem = get_system_memory();
-    qemu_irq irq[32];
-    int i;
-    char *bios_filename;
-    ResetInfo *reset_info;
-
-    if (machine->ram_size != mc->default_ram_size) {
-        char *sz = size_to_str(mc->default_ram_size);
-        error_report("Invalid RAM size, should be %s", sz);
-        g_free(sz);
-        exit(EXIT_FAILURE);
-    }
-
-    /* memory map */
-    hwaddr flash_base   = 0x00000000;
-    size_t flash_sector_size        = 128 * KiB;
-    size_t flash_size               = 32 * MiB;
-    hwaddr sdram_base   = 0x40000000;
-
-    hwaddr initrd_base  = sdram_base + 0x1002000;
-    hwaddr cmdline_base = sdram_base + 0x1000000;
-    size_t initrd_max = machine->ram_size - 0x1002000;
-
-    reset_info = g_malloc0(sizeof(ResetInfo));
-
-    cpu = LM32_CPU(cpu_create(machine->cpu_type));
-
-    env = &cpu->env;
-    reset_info->cpu = cpu;
-
-    cpu_lm32_set_phys_msb_ignore(env, 1);
-
-    memory_region_add_subregion(address_space_mem, sdram_base, machine->ram);
-
-    dinfo = drive_get(IF_PFLASH, 0, 0);
-    /* Numonyx JS28F256J3F105 */
-    pflash_cfi01_register(flash_base, "milkymist.flash", flash_size,
-                          dinfo ? blk_by_legacy_dinfo(dinfo) : NULL,
-                          flash_sector_size, 2, 0x00, 0x89, 0x00, 0x1d, 1);
-
-    /* create irq lines */
-    env->pic_state = lm32_pic_init(qemu_allocate_irq(cpu_irq_handler, cpu, 0));
-    for (i = 0; i < 32; i++) {
-        irq[i] = qdev_get_gpio_in(env->pic_state, i);
-    }
-
-    /* load bios rom */
-    bios_filename = qemu_find_file(QEMU_FILE_TYPE_BIOS, bios_name);
-
-    if (bios_filename) {
-        if (load_image_targphys(bios_filename, BIOS_OFFSET, BIOS_SIZE) < 0) {
-            error_report("could not load bios '%s'", bios_filename);
-            exit(1);
-        }
-    }
-
-    reset_info->bootstrap_pc = BIOS_OFFSET;
-
-    /* if no kernel is given no valid bios rom is a fatal error */
-    if (!kernel_filename && !dinfo && !bios_filename && !qtest_enabled()) {
-        error_report("could not load Milkymist One bios '%s'", bios_name);
-        exit(1);
-    }
-    g_free(bios_filename);
-
-    milkymist_uart_create(0x60000000, irq[0], serial_hd(0));
-    milkymist_sysctl_create(0x60001000, irq[1], irq[2], irq[3],
-            80000000, 0x10014d31, 0x0000041f, 0x00000001);
-    milkymist_hpdmc_create(0x60002000);
-    milkymist_vgafb_create(0x60003000, 0x40000000, 0x0fffffff);
-    milkymist_memcard_create(0x60004000);
-    milkymist_ac97_create(0x60005000, irq[4], irq[5], irq[6], irq[7]);
-    milkymist_pfpu_create(0x60006000, irq[8]);
-    if (machine->enable_graphics) {
-        milkymist_tmu2_create(0x60007000, irq[9]);
-    }
-    milkymist_minimac2_create(0x60008000, 0x30000000, irq[10], irq[11]);
-    milkymist_softusb_create(0x6000f000, irq[15],
-            0x20000000, 0x1000, 0x20020000, 0x2000);
-
-    /* make sure juart isn't the first chardev */
-    env->juart_state = lm32_juart_init(serial_hd(1));
-
-    if (kernel_filename) {
-        uint64_t entry;
-
-        /* Boots a kernel elf binary.  */
-        kernel_size = load_elf(kernel_filename, NULL, NULL, NULL,
-                               &entry, NULL, NULL, NULL,
-                               1, EM_LATTICEMICO32, 0, 0);
-        reset_info->bootstrap_pc = entry;
-
-        if (kernel_size < 0) {
-            kernel_size = load_image_targphys(kernel_filename, sdram_base,
-                                              machine->ram_size);
-            reset_info->bootstrap_pc = sdram_base;
-        }
-
-        if (kernel_size < 0) {
-            error_report("could not load kernel '%s'", kernel_filename);
-            exit(1);
-        }
-    }
-
-    if (kernel_cmdline && strlen(kernel_cmdline)) {
-        pstrcpy_targphys("cmdline", cmdline_base, TARGET_PAGE_SIZE,
-                kernel_cmdline);
-        reset_info->cmdline_base = (uint32_t)cmdline_base;
-    }
-
-    if (initrd_filename) {
-        size_t initrd_size;
-        initrd_size = load_image_targphys(initrd_filename, initrd_base,
-                initrd_max);
-        reset_info->initrd_base = (uint32_t)initrd_base;
-        reset_info->initrd_size = (uint32_t)initrd_size;
-    }
-
-    qemu_register_reset(main_cpu_reset, reset_info);
-}
-
-static void milkymist_machine_init(MachineClass *mc)
-{
-    mc->desc = "Milkymist One";
-    mc->init = milkymist_init;
-    mc->default_cpu_type = LM32_CPU_TYPE_NAME("lm32-full");
-    mc->default_ram_size = 128 * MiB;
-    mc->default_ram_id = "milkymist.sdram";
-}
-
-DEFINE_MACHINE("milkymist", milkymist_machine_init)
diff --git a/hw/misc/milkymist-hpdmc.c b/hw/misc/milkymist-hpdmc.c
deleted file mode 100644
index 09a3875f02..0000000000
--- a/hw/misc/milkymist-hpdmc.c
+++ /dev/null
@@ -1,172 +0,0 @@
-/*
- *  QEMU model of the Milkymist High Performance Dynamic Memory Controller.
- *
- *  Copyright (c) 2010 Michael Walle <michael@walle.cc>
- *
- * This library is free software; you can redistribute it and/or
- * modify it under the terms of the GNU Lesser General Public
- * License as published by the Free Software Foundation; either
- * version 2.1 of the License, or (at your option) any later version.
- *
- * This library is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
- * Lesser General Public License for more details.
- *
- * You should have received a copy of the GNU Lesser General Public
- * License along with this library; if not, see <http://www.gnu.org/licenses/>.
- *
- *
- * Specification available at:
- *   http://milkymist.walle.cc/socdoc/hpdmc.pdf
- */
-
-#include "qemu/osdep.h"
-#include "hw/sysbus.h"
-#include "migration/vmstate.h"
-#include "trace.h"
-#include "qemu/error-report.h"
-#include "qemu/module.h"
-#include "qom/object.h"
-
-enum {
-    R_SYSTEM = 0,
-    R_BYPASS,
-    R_TIMING,
-    R_IODELAY,
-    R_MAX
-};
-
-enum {
-    IODELAY_DQSDELAY_RDY = (1<<5),
-    IODELAY_PLL1_LOCKED  = (1<<6),
-    IODELAY_PLL2_LOCKED  = (1<<7),
-};
-
-#define TYPE_MILKYMIST_HPDMC "milkymist-hpdmc"
-OBJECT_DECLARE_SIMPLE_TYPE(MilkymistHpdmcState, MILKYMIST_HPDMC)
-
-struct MilkymistHpdmcState {
-    SysBusDevice parent_obj;
-
-    MemoryRegion regs_region;
-
-    uint32_t regs[R_MAX];
-};
-
-static uint64_t hpdmc_read(void *opaque, hwaddr addr,
-                           unsigned size)
-{
-    MilkymistHpdmcState *s = opaque;
-    uint32_t r = 0;
-
-    addr >>= 2;
-    switch (addr) {
-    case R_SYSTEM:
-    case R_BYPASS:
-    case R_TIMING:
-    case R_IODELAY:
-        r = s->regs[addr];
-        break;
-
-    default:
-        error_report("milkymist_hpdmc: read access to unknown register 0x"
-                TARGET_FMT_plx, addr << 2);
-        break;
-    }
-
-    trace_milkymist_hpdmc_memory_read(addr << 2, r);
-
-    return r;
-}
-
-static void hpdmc_write(void *opaque, hwaddr addr, uint64_t value,
-                        unsigned size)
-{
-    MilkymistHpdmcState *s = opaque;
-
-    trace_milkymist_hpdmc_memory_write(addr, value);
-
-    addr >>= 2;
-    switch (addr) {
-    case R_SYSTEM:
-    case R_BYPASS:
-    case R_TIMING:
-        s->regs[addr] = value;
-        break;
-    case R_IODELAY:
-        /* ignore writes */
-        break;
-
-    default:
-        error_report("milkymist_hpdmc: write access to unknown register 0x"
-                TARGET_FMT_plx, addr << 2);
-        break;
-    }
-}
-
-static const MemoryRegionOps hpdmc_mmio_ops = {
-    .read = hpdmc_read,
-    .write = hpdmc_write,
-    .valid = {
-        .min_access_size = 4,
-        .max_access_size = 4,
-    },
-    .endianness = DEVICE_NATIVE_ENDIAN,
-};
-
-static void milkymist_hpdmc_reset(DeviceState *d)
-{
-    MilkymistHpdmcState *s = MILKYMIST_HPDMC(d);
-    int i;
-
-    for (i = 0; i < R_MAX; i++) {
-        s->regs[i] = 0;
-    }
-
-    /* defaults */
-    s->regs[R_IODELAY] = IODELAY_DQSDELAY_RDY | IODELAY_PLL1_LOCKED
-                         | IODELAY_PLL2_LOCKED;
-}
-
-static void milkymist_hpdmc_realize(DeviceState *dev, Error **errp)
-{
-    MilkymistHpdmcState *s = MILKYMIST_HPDMC(dev);
-
-    memory_region_init_io(&s->regs_region, OBJECT(dev), &hpdmc_mmio_ops, s,
-            "milkymist-hpdmc", R_MAX * 4);
-    sysbus_init_mmio(SYS_BUS_DEVICE(dev), &s->regs_region);
-}
-
-static const VMStateDescription vmstate_milkymist_hpdmc = {
-    .name = "milkymist-hpdmc",
-    .version_id = 1,
-    .minimum_version_id = 1,
-    .fields = (VMStateField[]) {
-        VMSTATE_UINT32_ARRAY(regs, MilkymistHpdmcState, R_MAX),
-        VMSTATE_END_OF_LIST()
-    }
-};
-
-static void milkymist_hpdmc_class_init(ObjectClass *klass, void *data)
-{
-    DeviceClass *dc = DEVICE_CLASS(klass);
-
-    dc->realize = milkymist_hpdmc_realize;
-    dc->reset = milkymist_hpdmc_reset;
-    dc->vmsd = &vmstate_milkymist_hpdmc;
-}
-
-static const TypeInfo milkymist_hpdmc_info = {
-    .name          = TYPE_MILKYMIST_HPDMC,
-    .parent        = TYPE_SYS_BUS_DEVICE,
-    .instance_size = sizeof(MilkymistHpdmcState),
-    .class_init    = milkymist_hpdmc_class_init,
-};
-
-static void milkymist_hpdmc_register_types(void)
-{
-    type_register_static(&milkymist_hpdmc_info);
-}
-
-type_init(milkymist_hpdmc_register_types)
diff --git a/hw/misc/milkymist-pfpu.c b/hw/misc/milkymist-pfpu.c
deleted file mode 100644
index e4ee209c10..0000000000
--- a/hw/misc/milkymist-pfpu.c
+++ /dev/null
@@ -1,548 +0,0 @@
-/*
- *  QEMU model of the Milkymist programmable FPU.
- *
- *  Copyright (c) 2010 Michael Walle <michael@walle.cc>
- *
- * This library is free software; you can redistribute it and/or
- * modify it under the terms of the GNU Lesser General Public
- * License as published by the Free Software Foundation; either
- * version 2.1 of the License, or (at your option) any later version.
- *
- * This library is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
- * Lesser General Public License for more details.
- *
- * You should have received a copy of the GNU Lesser General Public
- * License along with this library; if not, see <http://www.gnu.org/licenses/>.
- *
- *
- * Specification available at:
- *   http://milkymist.walle.cc/socdoc/pfpu.pdf
- *
- */
-
-#include "qemu/osdep.h"
-#include "hw/irq.h"
-#include "hw/sysbus.h"
-#include "migration/vmstate.h"
-#include "trace.h"
-#include "qemu/log.h"
-#include "qemu/module.h"
-#include "qemu/error-report.h"
-#include <math.h>
-#include "qom/object.h"
-
-/* #define TRACE_EXEC */
-
-#ifdef TRACE_EXEC
-#    define D_EXEC(x) x
-#else
-#    define D_EXEC(x)
-#endif
-
-enum {
-    R_CTL = 0,
-    R_MESHBASE,
-    R_HMESHLAST,
-    R_VMESHLAST,
-    R_CODEPAGE,
-    R_VERTICES,
-    R_COLLISIONS,
-    R_STRAYWRITES,
-    R_LASTDMA,
-    R_PC,
-    R_DREGBASE,
-    R_CODEBASE,
-    R_MAX
-};
-
-enum {
-    CTL_START_BUSY = (1<<0),
-};
-
-enum {
-    OP_NOP = 0,
-    OP_FADD,
-    OP_FSUB,
-    OP_FMUL,
-    OP_FABS,
-    OP_F2I,
-    OP_I2F,
-    OP_VECTOUT,
-    OP_SIN,
-    OP_COS,
-    OP_ABOVE,
-    OP_EQUAL,
-    OP_COPY,
-    OP_IF,
-    OP_TSIGN,
-    OP_QUAKE,
-};
-
-enum {
-    GPR_X = 0,
-    GPR_Y = 1,
-    GPR_FLAGS = 2,
-};
-
-enum {
-    LATENCY_FADD = 5,
-    LATENCY_FSUB = 5,
-    LATENCY_FMUL = 7,
-    LATENCY_FABS = 2,
-    LATENCY_F2I = 2,
-    LATENCY_I2F = 3,
-    LATENCY_VECTOUT = 0,
-    LATENCY_SIN = 4,
-    LATENCY_COS = 4,
-    LATENCY_ABOVE = 2,
-    LATENCY_EQUAL = 2,
-    LATENCY_COPY = 2,
-    LATENCY_IF = 2,
-    LATENCY_TSIGN = 2,
-    LATENCY_QUAKE = 2,
-    MAX_LATENCY = 7
-};
-
-#define GPR_BEGIN       0x100
-#define GPR_END         0x17f
-#define MICROCODE_BEGIN 0x200
-#define MICROCODE_END   0x3ff
-#define MICROCODE_WORDS 2048
-
-#define REINTERPRET_CAST(type, val) (*((type *)&(val)))
-
-#ifdef TRACE_EXEC
-static const char *opcode_to_str[] = {
-    "NOP", "FADD", "FSUB", "FMUL", "FABS", "F2I", "I2F", "VECTOUT",
-    "SIN", "COS", "ABOVE", "EQUAL", "COPY", "IF", "TSIGN", "QUAKE",
-};
-#endif
-
-#define TYPE_MILKYMIST_PFPU "milkymist-pfpu"
-OBJECT_DECLARE_SIMPLE_TYPE(MilkymistPFPUState, MILKYMIST_PFPU)
-
-struct MilkymistPFPUState {
-    SysBusDevice parent_obj;
-
-    MemoryRegion regs_region;
-    Chardev *chr;
-    qemu_irq irq;
-
-    uint32_t regs[R_MAX];
-    uint32_t gp_regs[128];
-    uint32_t microcode[MICROCODE_WORDS];
-
-    int output_queue_pos;
-    uint32_t output_queue[MAX_LATENCY];
-};
-
-static inline uint32_t
-get_dma_address(uint32_t base, uint32_t x, uint32_t y)
-{
-    return base + 8 * (128 * y + x);
-}
-
-static inline void
-output_queue_insert(MilkymistPFPUState *s, uint32_t val, int pos)
-{
-    s->output_queue[(s->output_queue_pos + pos) % MAX_LATENCY] = val;
-}
-
-static inline uint32_t
-output_queue_remove(MilkymistPFPUState *s)
-{
-    return s->output_queue[s->output_queue_pos];
-}
-
-static inline void
-output_queue_advance(MilkymistPFPUState *s)
-{
-    s->output_queue[s->output_queue_pos] = 0;
-    s->output_queue_pos = (s->output_queue_pos + 1) % MAX_LATENCY;
-}
-
-static int pfpu_decode_insn(MilkymistPFPUState *s)
-{
-    uint32_t pc = s->regs[R_PC];
-    uint32_t insn = s->microcode[pc];
-    uint32_t reg_a = (insn >> 18) & 0x7f;
-    uint32_t reg_b = (insn >> 11) & 0x7f;
-    uint32_t op = (insn >> 7) & 0xf;
-    uint32_t reg_d = insn & 0x7f;
-    uint32_t r = 0;
-    int latency = 0;
-
-    switch (op) {
-    case OP_NOP:
-        break;
-    case OP_FADD:
-    {
-        float a = REINTERPRET_CAST(float, s->gp_regs[reg_a]);
-        float b = REINTERPRET_CAST(float, s->gp_regs[reg_b]);
-        float t = a + b;
-        r = REINTERPRET_CAST(uint32_t, t);
-        latency = LATENCY_FADD;
-        D_EXEC(qemu_log("ADD a=%f b=%f t=%f, r=%08x\n", a, b, t, r));
-    } break;
-    case OP_FSUB:
-    {
-        float a = REINTERPRET_CAST(float, s->gp_regs[reg_a]);
-        float b = REINTERPRET_CAST(float, s->gp_regs[reg_b]);
-        float t = a - b;
-        r = REINTERPRET_CAST(uint32_t, t);
-        latency = LATENCY_FSUB;
-        D_EXEC(qemu_log("SUB a=%f b=%f t=%f, r=%08x\n", a, b, t, r));
-    } break;
-    case OP_FMUL:
-    {
-        float a = REINTERPRET_CAST(float, s->gp_regs[reg_a]);
-        float b = REINTERPRET_CAST(float, s->gp_regs[reg_b]);
-        float t = a * b;
-        r = REINTERPRET_CAST(uint32_t, t);
-        latency = LATENCY_FMUL;
-        D_EXEC(qemu_log("MUL a=%f b=%f t=%f, r=%08x\n", a, b, t, r));
-    } break;
-    case OP_FABS:
-    {
-        float a = REINTERPRET_CAST(float, s->gp_regs[reg_a]);
-        float t = fabsf(a);
-        r = REINTERPRET_CAST(uint32_t, t);
-        latency = LATENCY_FABS;
-        D_EXEC(qemu_log("ABS a=%f t=%f, r=%08x\n", a, t, r));
-    } break;
-    case OP_F2I:
-    {
-        float a = REINTERPRET_CAST(float, s->gp_regs[reg_a]);
-        int32_t t = a;
-        r = REINTERPRET_CAST(uint32_t, t);
-        latency = LATENCY_F2I;
-        D_EXEC(qemu_log("F2I a=%f t=%d, r=%08x\n", a, t, r));
-    } break;
-    case OP_I2F:
-    {
-        int32_t a = REINTERPRET_CAST(int32_t, s->gp_regs[reg_a]);
-        float t = a;
-        r = REINTERPRET_CAST(uint32_t, t);
-        latency = LATENCY_I2F;
-        D_EXEC(qemu_log("I2F a=%08x t=%f, r=%08x\n", a, t, r));
-    } break;
-    case OP_VECTOUT:
-    {
-        uint32_t a = cpu_to_be32(s->gp_regs[reg_a]);
-        uint32_t b = cpu_to_be32(s->gp_regs[reg_b]);
-        hwaddr dma_ptr =
-            get_dma_address(s->regs[R_MESHBASE],
-                    s->gp_regs[GPR_X], s->gp_regs[GPR_Y]);
-        cpu_physical_memory_write(dma_ptr, &a, 4);
-        cpu_physical_memory_write(dma_ptr + 4, &b, 4);
-        s->regs[R_LASTDMA] = dma_ptr + 4;
-        D_EXEC(qemu_log("VECTOUT a=%08x b=%08x dma=%08x\n", a, b, dma_ptr));
-        trace_milkymist_pfpu_vectout(a, b, dma_ptr);
-    } break;
-    case OP_SIN:
-    {
-        int32_t a = REINTERPRET_CAST(int32_t, s->gp_regs[reg_a]);
-        float t = sinf(a * (1.0f / (M_PI * 4096.0f)));
-        r = REINTERPRET_CAST(uint32_t, t);
-        latency = LATENCY_SIN;
-        D_EXEC(qemu_log("SIN a=%d t=%f, r=%08x\n", a, t, r));
-    } break;
-    case OP_COS:
-    {
-        int32_t a = REINTERPRET_CAST(int32_t, s->gp_regs[reg_a]);
-        float t = cosf(a * (1.0f / (M_PI * 4096.0f)));
-        r = REINTERPRET_CAST(uint32_t, t);
-        latency = LATENCY_COS;
-        D_EXEC(qemu_log("COS a=%d t=%f, r=%08x\n", a, t, r));
-    } break;
-    case OP_ABOVE:
-    {
-        float a = REINTERPRET_CAST(float, s->gp_regs[reg_a]);
-        float b = REINTERPRET_CAST(float, s->gp_regs[reg_b]);
-        float t = (a > b) ? 1.0f : 0.0f;
-        r = REINTERPRET_CAST(uint32_t, t);
-        latency = LATENCY_ABOVE;
-        D_EXEC(qemu_log("ABOVE a=%f b=%f t=%f, r=%08x\n", a, b, t, r));
-    } break;
-    case OP_EQUAL:
-    {
-        float a = REINTERPRET_CAST(float, s->gp_regs[reg_a]);
-        float b = REINTERPRET_CAST(float, s->gp_regs[reg_b]);
-        float t = (a == b) ? 1.0f : 0.0f;
-        r = REINTERPRET_CAST(uint32_t, t);
-        latency = LATENCY_EQUAL;
-        D_EXEC(qemu_log("EQUAL a=%f b=%f t=%f, r=%08x\n", a, b, t, r));
-    } break;
-    case OP_COPY:
-    {
-        r = s->gp_regs[reg_a];
-        latency = LATENCY_COPY;
-        D_EXEC(qemu_log("COPY"));
-    } break;
-    case OP_IF:
-    {
-        float a = REINTERPRET_CAST(float, s->gp_regs[reg_a]);
-        float b = REINTERPRET_CAST(float, s->gp_regs[reg_b]);
-        uint32_t f = s->gp_regs[GPR_FLAGS];
-        float t = (f != 0) ? a : b;
-        r = REINTERPRET_CAST(uint32_t, t);
-        latency = LATENCY_IF;
-        D_EXEC(qemu_log("IF f=%u a=%f b=%f t=%f, r=%08x\n", f, a, b, t, r));
-    } break;
-    case OP_TSIGN:
-    {
-        float a = REINTERPRET_CAST(float, s->gp_regs[reg_a]);
-        float b = REINTERPRET_CAST(float, s->gp_regs[reg_b]);
-        float t = (b < 0) ? -a : a;
-        r = REINTERPRET_CAST(uint32_t, t);
-        latency = LATENCY_TSIGN;
-        D_EXEC(qemu_log("TSIGN a=%f b=%f t=%f, r=%08x\n", a, b, t, r));
-    } break;
-    case OP_QUAKE:
-    {
-        uint32_t a = s->gp_regs[reg_a];
-        r = 0x5f3759df - (a >> 1);
-        latency = LATENCY_QUAKE;
-        D_EXEC(qemu_log("QUAKE a=%d r=%08x\n", a, r));
-    } break;
-
-    default:
-        error_report("milkymist_pfpu: unknown opcode %d", op);
-        break;
-    }
-
-    if (!reg_d) {
-        D_EXEC(qemu_log("%04d %8s R%03d, R%03d <L=%d, E=%04d>\n",
-                    s->regs[R_PC], opcode_to_str[op], reg_a, reg_b, latency,
-                    s->regs[R_PC] + latency));
-    } else {
-        D_EXEC(qemu_log("%04d %8s R%03d, R%03d <L=%d, E=%04d> -> R%03d\n",
-                    s->regs[R_PC], opcode_to_str[op], reg_a, reg_b, latency,
-                    s->regs[R_PC] + latency, reg_d));
-    }
-
-    if (op == OP_VECTOUT) {
-        return 0;
-    }
-
-    /* store output for this cycle */
-    if (reg_d) {
-        uint32_t val = output_queue_remove(s);
-        D_EXEC(qemu_log("R%03d <- 0x%08x\n", reg_d, val));
-        s->gp_regs[reg_d] = val;
-    }
-
-    output_queue_advance(s);
-
-    /* store op output */
-    if (op != OP_NOP) {
-        output_queue_insert(s, r, latency-1);
-    }
-
-    /* advance PC */
-    s->regs[R_PC]++;
-
-    return 1;
-};
-
-static void pfpu_start(MilkymistPFPUState *s)
-{
-    int x, y;
-    int i;
-
-    for (y = 0; y <= s->regs[R_VMESHLAST]; y++) {
-        for (x = 0; x <= s->regs[R_HMESHLAST]; x++) {
-            D_EXEC(qemu_log("\nprocessing x=%d y=%d\n", x, y));
-
-            /* set current position */
-            s->gp_regs[GPR_X] = x;
-            s->gp_regs[GPR_Y] = y;
-
-            /* run microcode on this position */
-            i = 0;
-            while (pfpu_decode_insn(s)) {
-                /* decode at most MICROCODE_WORDS instructions */
-                if (++i >= MICROCODE_WORDS) {
-                    error_report("milkymist_pfpu: too many instructions "
-                            "executed in microcode. No VECTOUT?");
-                    break;
-                }
-            }
-
-            /* reset pc for next run */
-            s->regs[R_PC] = 0;
-        }
-    }
-
-    s->regs[R_VERTICES] = x * y;
-
-    trace_milkymist_pfpu_pulse_irq();
-    qemu_irq_pulse(s->irq);
-}
-
-static inline int get_microcode_address(MilkymistPFPUState *s, uint32_t addr)
-{
-    return (512 * s->regs[R_CODEPAGE]) + addr - MICROCODE_BEGIN;
-}
-
-static uint64_t pfpu_read(void *opaque, hwaddr addr,
-                          unsigned size)
-{
-    MilkymistPFPUState *s = opaque;
-    uint32_t r = 0;
-
-    addr >>= 2;
-    switch (addr) {
-    case R_CTL:
-    case R_MESHBASE:
-    case R_HMESHLAST:
-    case R_VMESHLAST:
-    case R_CODEPAGE:
-    case R_VERTICES:
-    case R_COLLISIONS:
-    case R_STRAYWRITES:
-    case R_LASTDMA:
-    case R_PC:
-    case R_DREGBASE:
-    case R_CODEBASE:
-        r = s->regs[addr];
-        break;
-    case GPR_BEGIN ... GPR_END:
-        r = s->gp_regs[addr - GPR_BEGIN];
-        break;
-    case MICROCODE_BEGIN ...  MICROCODE_END:
-        r = s->microcode[get_microcode_address(s, addr)];
-        break;
-
-    default:
-        error_report("milkymist_pfpu: read access to unknown register 0x"
-                TARGET_FMT_plx, addr << 2);
-        break;
-    }
-
-    trace_milkymist_pfpu_memory_read(addr << 2, r);
-
-    return r;
-}
-
-static void pfpu_write(void *opaque, hwaddr addr, uint64_t value,
-                       unsigned size)
-{
-    MilkymistPFPUState *s = opaque;
-
-    trace_milkymist_pfpu_memory_write(addr, value);
-
-    addr >>= 2;
-    switch (addr) {
-    case R_CTL:
-        if (value & CTL_START_BUSY) {
-            pfpu_start(s);
-        }
-        break;
-    case R_MESHBASE:
-    case R_HMESHLAST:
-    case R_VMESHLAST:
-    case R_CODEPAGE:
-    case R_VERTICES:
-    case R_COLLISIONS:
-    case R_STRAYWRITES:
-    case R_LASTDMA:
-    case R_PC:
-    case R_DREGBASE:
-    case R_CODEBASE:
-        s->regs[addr] = value;
-        break;
-    case GPR_BEGIN ...  GPR_END:
-        s->gp_regs[addr - GPR_BEGIN] = value;
-        break;
-    case MICROCODE_BEGIN ...  MICROCODE_END:
-        s->microcode[get_microcode_address(s, addr)] = value;
-        break;
-
-    default:
-        error_report("milkymist_pfpu: write access to unknown register 0x"
-                TARGET_FMT_plx, addr << 2);
-        break;
-    }
-}
-
-static const MemoryRegionOps pfpu_mmio_ops = {
-    .read = pfpu_read,
-    .write = pfpu_write,
-    .valid = {
-        .min_access_size = 4,
-        .max_access_size = 4,
-    },
-    .endianness = DEVICE_NATIVE_ENDIAN,
-};
-
-static void milkymist_pfpu_reset(DeviceState *d)
-{
-    MilkymistPFPUState *s = MILKYMIST_PFPU(d);
-    int i;
-
-    for (i = 0; i < R_MAX; i++) {
-        s->regs[i] = 0;
-    }
-    for (i = 0; i < 128; i++) {
-        s->gp_regs[i] = 0;
-    }
-    for (i = 0; i < MICROCODE_WORDS; i++) {
-        s->microcode[i] = 0;
-    }
-    s->output_queue_pos = 0;
-    for (i = 0; i < MAX_LATENCY; i++) {
-        s->output_queue[i] = 0;
-    }
-}
-
-static void milkymist_pfpu_realize(DeviceState *dev, Error **errp)
-{
-    MilkymistPFPUState *s = MILKYMIST_PFPU(dev);
-    SysBusDevice *sbd = SYS_BUS_DEVICE(dev);
-
-    sysbus_init_irq(sbd, &s->irq);
-
-    memory_region_init_io(&s->regs_region, OBJECT(dev), &pfpu_mmio_ops, s,
-            "milkymist-pfpu", MICROCODE_END * 4);
-    sysbus_init_mmio(sbd, &s->regs_region);
-}
-
-static const VMStateDescription vmstate_milkymist_pfpu = {
-    .name = "milkymist-pfpu",
-    .version_id = 1,
-    .minimum_version_id = 1,
-    .fields = (VMStateField[]) {
-        VMSTATE_UINT32_ARRAY(regs, MilkymistPFPUState, R_MAX),
-        VMSTATE_UINT32_ARRAY(gp_regs, MilkymistPFPUState, 128),
-        VMSTATE_UINT32_ARRAY(microcode, MilkymistPFPUState, MICROCODE_WORDS),
-        VMSTATE_INT32(output_queue_pos, MilkymistPFPUState),
-        VMSTATE_UINT32_ARRAY(output_queue, MilkymistPFPUState, MAX_LATENCY),
-        VMSTATE_END_OF_LIST()
-    }
-};
-
-static void milkymist_pfpu_class_init(ObjectClass *klass, void *data)
-{
-    DeviceClass *dc = DEVICE_CLASS(klass);
-
-    dc->realize = milkymist_pfpu_realize;
-    dc->reset = milkymist_pfpu_reset;
-    dc->vmsd = &vmstate_milkymist_pfpu;
-}
-
-static const TypeInfo milkymist_pfpu_info = {
-    .name          = TYPE_MILKYMIST_PFPU,
-    .parent        = TYPE_SYS_BUS_DEVICE,
-    .instance_size = sizeof(MilkymistPFPUState),
-    .class_init    = milkymist_pfpu_class_init,
-};
-
-static void milkymist_pfpu_register_types(void)
-{
-    type_register_static(&milkymist_pfpu_info);
-}
-
-type_init(milkymist_pfpu_register_types)
diff --git a/hw/net/milkymist-minimac2.c b/hw/net/milkymist-minimac2.c
deleted file mode 100644
index 5826944fd5..0000000000
--- a/hw/net/milkymist-minimac2.c
+++ /dev/null
@@ -1,547 +0,0 @@
-/*
- *  QEMU model of the Milkymist minimac2 block.
- *
- *  Copyright (c) 2011 Michael Walle <michael@walle.cc>
- *
- * This library is free software; you can redistribute it and/or
- * modify it under the terms of the GNU Lesser General Public
- * License as published by the Free Software Foundation; either
- * version 2.1 of the License, or (at your option) any later version.
- *
- * This library is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
- * Lesser General Public License for more details.
- *
- * You should have received a copy of the GNU Lesser General Public
- * License along with this library; if not, see <http://www.gnu.org/licenses/>.
- *
- *
- * Specification available at:
- *   not available yet
- *
- */
-
-#include "qemu/osdep.h"
-#include "qapi/error.h"
-#include "qom/object.h"
-#include "cpu.h" /* FIXME: why does this use TARGET_PAGE_ALIGN? */
-#include "hw/irq.h"
-#include "hw/qdev-properties.h"
-#include "hw/sysbus.h"
-#include "migration/vmstate.h"
-#include "trace.h"
-#include "net/net.h"
-#include "qemu/log.h"
-#include "qemu/module.h"
-#include "qemu/error-report.h"
-
-#include <zlib.h>
-
-enum {
-    R_SETUP = 0,
-    R_MDIO,
-    R_STATE0,
-    R_COUNT0,
-    R_STATE1,
-    R_COUNT1,
-    R_TXCOUNT,
-    R_MAX
-};
-
-enum {
-    SETUP_PHY_RST = (1<<0),
-};
-
-enum {
-    MDIO_DO  = (1<<0),
-    MDIO_DI  = (1<<1),
-    MDIO_OE  = (1<<2),
-    MDIO_CLK = (1<<3),
-};
-
-enum {
-    STATE_EMPTY   = 0,
-    STATE_LOADED  = 1,
-    STATE_PENDING = 2,
-};
-
-enum {
-    MDIO_OP_WRITE = 1,
-    MDIO_OP_READ  = 2,
-};
-
-enum mdio_state {
-    MDIO_STATE_IDLE,
-    MDIO_STATE_READING,
-    MDIO_STATE_WRITING,
-};
-
-enum {
-    R_PHY_ID1  = 2,
-    R_PHY_ID2  = 3,
-    R_PHY_MAX  = 32
-};
-
-#define MINIMAC2_MTU 1530
-#define MINIMAC2_BUFFER_SIZE 2048
-
-struct MilkymistMinimac2MdioState {
-    int last_clk;
-    int count;
-    uint32_t data;
-    uint16_t data_out;
-    int state;
-
-    uint8_t phy_addr;
-    uint8_t reg_addr;
-};
-typedef struct MilkymistMinimac2MdioState MilkymistMinimac2MdioState;
-
-#define TYPE_MILKYMIST_MINIMAC2 "milkymist-minimac2"
-OBJECT_DECLARE_SIMPLE_TYPE(MilkymistMinimac2State, MILKYMIST_MINIMAC2)
-
-struct MilkymistMinimac2State {
-    SysBusDevice parent_obj;
-
-    NICState *nic;
-    NICConf conf;
-    char *phy_model;
-    MemoryRegion buffers;
-    MemoryRegion regs_region;
-
-    qemu_irq rx_irq;
-    qemu_irq tx_irq;
-
-    uint32_t regs[R_MAX];
-
-    MilkymistMinimac2MdioState mdio;
-
-    uint16_t phy_regs[R_PHY_MAX];
-
-    uint8_t *rx0_buf;
-    uint8_t *rx1_buf;
-    uint8_t *tx_buf;
-};
-
-static const uint8_t preamble_sfd[] = {
-        0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0xd5
-};
-
-static void minimac2_mdio_write_reg(MilkymistMinimac2State *s,
-        uint8_t phy_addr, uint8_t reg_addr, uint16_t value)
-{
-    trace_milkymist_minimac2_mdio_write(phy_addr, reg_addr, value);
-
-    /* nop */
-}
-
-static uint16_t minimac2_mdio_read_reg(MilkymistMinimac2State *s,
-        uint8_t phy_addr, uint8_t reg_addr)
-{
-    uint16_t r = s->phy_regs[reg_addr];
-
-    trace_milkymist_minimac2_mdio_read(phy_addr, reg_addr, r);
-
-    return r;
-}
-
-static void minimac2_update_mdio(MilkymistMinimac2State *s)
-{
-    MilkymistMinimac2MdioState *m = &s->mdio;
-
-    /* detect rising clk edge */
-    if (m->last_clk == 0 && (s->regs[R_MDIO] & MDIO_CLK)) {
-        /* shift data in */
-        int bit = ((s->regs[R_MDIO] & MDIO_DO)
-                   && (s->regs[R_MDIO] & MDIO_OE)) ? 1 : 0;
-        m->data = (m->data << 1) | bit;
-
-        /* check for sync */
-        if (m->data == 0xffffffff) {
-            m->count = 32;
-        }
-
-        if (m->count == 16) {
-            uint8_t start = (m->data >> 14) & 0x3;
-            uint8_t op = (m->data >> 12) & 0x3;
-            uint8_t ta = (m->data) & 0x3;
-
-            if (start == 1 && op == MDIO_OP_WRITE && ta == 2) {
-                m->state = MDIO_STATE_WRITING;
-            } else if (start == 1 && op == MDIO_OP_READ && (ta & 1) == 0) {
-                m->state = MDIO_STATE_READING;
-            } else {
-                m->state = MDIO_STATE_IDLE;
-            }
-
-            if (m->state != MDIO_STATE_IDLE) {
-                m->phy_addr = (m->data >> 7) & 0x1f;
-                m->reg_addr = (m->data >> 2) & 0x1f;
-            }
-
-            if (m->state == MDIO_STATE_READING) {
-                m->data_out = minimac2_mdio_read_reg(s, m->phy_addr,
-                        m->reg_addr);
-            }
-        }
-
-        if (m->count < 16 && m->state == MDIO_STATE_READING) {
-            int bit = (m->data_out & 0x8000) ? 1 : 0;
-            m->data_out <<= 1;
-
-            if (bit) {
-                s->regs[R_MDIO] |= MDIO_DI;
-            } else {
-                s->regs[R_MDIO] &= ~MDIO_DI;
-            }
-        }
-
-        if (m->count == 0 && m->state) {
-            if (m->state == MDIO_STATE_WRITING) {
-                uint16_t data = m->data & 0xffff;
-                minimac2_mdio_write_reg(s, m->phy_addr, m->reg_addr, data);
-            }
-            m->state = MDIO_STATE_IDLE;
-        }
-        m->count--;
-    }
-
-    m->last_clk = (s->regs[R_MDIO] & MDIO_CLK) ? 1 : 0;
-}
-
-static size_t assemble_frame(uint8_t *buf, size_t size,
-        const uint8_t *payload, size_t payload_size)
-{
-    uint32_t crc;
-
-    if (size < payload_size + 12) {
-        qemu_log_mask(LOG_GUEST_ERROR, "milkymist_minimac2: frame too big "
-                      "(%zd bytes)\n", payload_size);
-        return 0;
-    }
-
-    /* prepend preamble and sfd */
-    memcpy(buf, preamble_sfd, 8);
-
-    /* now copy the payload */
-    memcpy(buf + 8, payload, payload_size);
-
-    /* pad frame if needed */
-    if (payload_size < 60) {
-        memset(buf + payload_size + 8, 0, 60 - payload_size);
-        payload_size = 60;
-    }
-
-    /* append fcs */
-    crc = cpu_to_le32(crc32(0, buf + 8, payload_size));
-    memcpy(buf + payload_size + 8, &crc, 4);
-
-    return payload_size + 12;
-}
-
-static void minimac2_tx(MilkymistMinimac2State *s)
-{
-    uint32_t txcount = s->regs[R_TXCOUNT];
-    uint8_t *buf = s->tx_buf;
-
-    if (txcount < 64) {
-        error_report("milkymist_minimac2: ethernet frame too small (%u < %u)",
-                txcount, 64);
-        goto err;
-    }
-
-    if (txcount > MINIMAC2_MTU) {
-        error_report("milkymist_minimac2: MTU exceeded (%u > %u)",
-                txcount, MINIMAC2_MTU);
-        goto err;
-    }
-
-    if (memcmp(buf, preamble_sfd, 8) != 0) {
-        error_report("milkymist_minimac2: frame doesn't contain the preamble "
-                "and/or the SFD (%02x %02x %02x %02x %02x %02x %02x %02x)",
-                buf[0], buf[1], buf[2], buf[3], buf[4], buf[5], buf[6], buf[7]);
-        goto err;
-    }
-
-    trace_milkymist_minimac2_tx_frame(txcount - 12);
-
-    /* send packet, skipping preamble and sfd */
-    qemu_send_packet_raw(qemu_get_queue(s->nic), buf + 8, txcount - 12);
-
-    s->regs[R_TXCOUNT] = 0;
-
-err:
-    trace_milkymist_minimac2_pulse_irq_tx();
-    qemu_irq_pulse(s->tx_irq);
-}
-
-static void update_rx_interrupt(MilkymistMinimac2State *s)
-{
-    if (s->regs[R_STATE0] == STATE_PENDING
-            || s->regs[R_STATE1] == STATE_PENDING) {
-        trace_milkymist_minimac2_raise_irq_rx();
-        qemu_irq_raise(s->rx_irq);
-    } else {
-        trace_milkymist_minimac2_lower_irq_rx();
-        qemu_irq_lower(s->rx_irq);
-    }
-}
-
-static ssize_t minimac2_rx(NetClientState *nc, const uint8_t *buf, size_t size)
-{
-    MilkymistMinimac2State *s = qemu_get_nic_opaque(nc);
-
-    uint32_t r_count;
-    uint32_t r_state;
-    uint8_t *rx_buf;
-
-    size_t frame_size;
-
-    trace_milkymist_minimac2_rx_frame(buf, size);
-
-    /* choose appropriate slot */
-    if (s->regs[R_STATE0] == STATE_LOADED) {
-        r_count = R_COUNT0;
-        r_state = R_STATE0;
-        rx_buf = s->rx0_buf;
-    } else if (s->regs[R_STATE1] == STATE_LOADED) {
-        r_count = R_COUNT1;
-        r_state = R_STATE1;
-        rx_buf = s->rx1_buf;
-    } else {
-        return 0;
-    }
-
-    /* assemble frame */
-    frame_size = assemble_frame(rx_buf, MINIMAC2_BUFFER_SIZE, buf, size);
-
-    if (frame_size == 0) {
-        return size;
-    }
-
-    trace_milkymist_minimac2_rx_transfer(rx_buf, frame_size);
-
-    /* update slot */
-    s->regs[r_count] = frame_size;
-    s->regs[r_state] = STATE_PENDING;
-
-    update_rx_interrupt(s);
-
-    return size;
-}
-
-static uint64_t
-minimac2_read(void *opaque, hwaddr addr, unsigned size)
-{
-    MilkymistMinimac2State *s = opaque;
-    uint32_t r = 0;
-
-    addr >>= 2;
-    switch (addr) {
-    case R_SETUP:
-    case R_MDIO:
-    case R_STATE0:
-    case R_COUNT0:
-    case R_STATE1:
-    case R_COUNT1:
-    case R_TXCOUNT:
-        r = s->regs[addr];
-        break;
-
-    default:
-        qemu_log_mask(LOG_GUEST_ERROR,
-                      "milkymist_minimac2_rd%d: 0x%" HWADDR_PRIx "\n",
-                      size, addr << 2);
-        break;
-    }
-
-    trace_milkymist_minimac2_memory_read(addr << 2, r);
-
-    return r;
-}
-
-static int minimac2_can_rx(MilkymistMinimac2State *s)
-{
-    if (s->regs[R_STATE0] == STATE_LOADED) {
-        return 1;
-    }
-    if (s->regs[R_STATE1] == STATE_LOADED) {
-        return 1;
-    }
-
-    return 0;
-}
-
-static void
-minimac2_write(void *opaque, hwaddr addr, uint64_t value,
-               unsigned size)
-{
-    MilkymistMinimac2State *s = opaque;
-
-    trace_milkymist_minimac2_memory_write(addr, value);
-
-    addr >>= 2;
-    switch (addr) {
-    case R_MDIO:
-    {
-        /* MDIO_DI is read only */
-        int mdio_di = (s->regs[R_MDIO] & MDIO_DI);
-        s->regs[R_MDIO] = value;
-        if (mdio_di) {
-            s->regs[R_MDIO] |= mdio_di;
-        } else {
-            s->regs[R_MDIO] &= ~mdio_di;
-        }
-
-        minimac2_update_mdio(s);
-    } break;
-    case R_TXCOUNT:
-        s->regs[addr] = value;
-        if (value > 0) {
-            minimac2_tx(s);
-        }
-        break;
-    case R_STATE0:
-    case R_STATE1:
-        s->regs[addr] = value;
-        update_rx_interrupt(s);
-        if (minimac2_can_rx(s)) {
-            qemu_flush_queued_packets(qemu_get_queue(s->nic));
-        }
-        break;
-    case R_SETUP:
-    case R_COUNT0:
-    case R_COUNT1:
-        s->regs[addr] = value;
-        break;
-
-    default:
-        qemu_log_mask(LOG_GUEST_ERROR,
-                      "milkymist_minimac2_wr%d: 0x%" HWADDR_PRIx
-                      " = 0x%" PRIx64 "\n",
-                      size, addr << 2, value);
-        break;
-    }
-}
-
-static const MemoryRegionOps minimac2_ops = {
-    .read = minimac2_read,
-    .write = minimac2_write,
-    .valid = {
-        .min_access_size = 4,
-        .max_access_size = 4,
-    },
-    .endianness = DEVICE_NATIVE_ENDIAN,
-};
-
-static void milkymist_minimac2_reset(DeviceState *d)
-{
-    MilkymistMinimac2State *s = MILKYMIST_MINIMAC2(d);
-    int i;
-
-    for (i = 0; i < R_MAX; i++) {
-        s->regs[i] = 0;
-    }
-    for (i = 0; i < R_PHY_MAX; i++) {
-        s->phy_regs[i] = 0;
-    }
-
-    /* defaults */
-    s->phy_regs[R_PHY_ID1] = 0x0022; /* Micrel KSZ8001L */
-    s->phy_regs[R_PHY_ID2] = 0x161a;
-}
-
-static NetClientInfo net_milkymist_minimac2_info = {
-    .type = NET_CLIENT_DRIVER_NIC,
-    .size = sizeof(NICState),
-    .receive = minimac2_rx,
-};
-
-static void milkymist_minimac2_realize(DeviceState *dev, Error **errp)
-{
-    SysBusDevice *sbd = SYS_BUS_DEVICE(dev);
-    MilkymistMinimac2State *s = MILKYMIST_MINIMAC2(dev);
-    size_t buffers_size = TARGET_PAGE_ALIGN(3 * MINIMAC2_BUFFER_SIZE);
-
-    sysbus_init_irq(sbd, &s->rx_irq);
-    sysbus_init_irq(sbd, &s->tx_irq);
-
-    memory_region_init_io(&s->regs_region, OBJECT(dev), &minimac2_ops, s,
-                          "milkymist-minimac2", R_MAX * 4);
-    sysbus_init_mmio(sbd, &s->regs_region);
-
-    /* register buffers memory */
-    memory_region_init_ram_nomigrate(&s->buffers, OBJECT(dev), "milkymist-minimac2.buffers",
-                           buffers_size, &error_fatal);
-    vmstate_register_ram_global(&s->buffers);
-    s->rx0_buf = memory_region_get_ram_ptr(&s->buffers);
-    s->rx1_buf = s->rx0_buf + MINIMAC2_BUFFER_SIZE;
-    s->tx_buf = s->rx1_buf + MINIMAC2_BUFFER_SIZE;
-
-    sysbus_init_mmio(sbd, &s->buffers);
-
-    qemu_macaddr_default_if_unset(&s->conf.macaddr);
-    s->nic = qemu_new_nic(&net_milkymist_minimac2_info, &s->conf,
-                          object_get_typename(OBJECT(dev)), dev->id, s);
-    qemu_format_nic_info_str(qemu_get_queue(s->nic), s->conf.macaddr.a);
-}
-
-static const VMStateDescription vmstate_milkymist_minimac2_mdio = {
-    .name = "milkymist-minimac2-mdio",
-    .version_id = 1,
-    .minimum_version_id = 1,
-    .fields = (VMStateField[]) {
-        VMSTATE_INT32(last_clk, MilkymistMinimac2MdioState),
-        VMSTATE_INT32(count, MilkymistMinimac2MdioState),
-        VMSTATE_UINT32(data, MilkymistMinimac2MdioState),
-        VMSTATE_UINT16(data_out, MilkymistMinimac2MdioState),
-        VMSTATE_INT32(state, MilkymistMinimac2MdioState),
-        VMSTATE_UINT8(phy_addr, MilkymistMinimac2MdioState),
-        VMSTATE_UINT8(reg_addr, MilkymistMinimac2MdioState),
-        VMSTATE_END_OF_LIST()
-    }
-};
-
-static const VMStateDescription vmstate_milkymist_minimac2 = {
-    .name = "milkymist-minimac2",
-    .version_id = 1,
-    .minimum_version_id = 1,
-    .fields = (VMStateField[]) {
-        VMSTATE_UINT32_ARRAY(regs, MilkymistMinimac2State, R_MAX),
-        VMSTATE_UINT16_ARRAY(phy_regs, MilkymistMinimac2State, R_PHY_MAX),
-        VMSTATE_STRUCT(mdio, MilkymistMinimac2State, 0,
-                vmstate_milkymist_minimac2_mdio, MilkymistMinimac2MdioState),
-        VMSTATE_END_OF_LIST()
-    }
-};
-
-static Property milkymist_minimac2_properties[] = {
-    DEFINE_NIC_PROPERTIES(MilkymistMinimac2State, conf),
-    DEFINE_PROP_STRING("phy_model", MilkymistMinimac2State, phy_model),
-    DEFINE_PROP_END_OF_LIST(),
-};
-
-static void milkymist_minimac2_class_init(ObjectClass *klass, void *data)
-{
-    DeviceClass *dc = DEVICE_CLASS(klass);
-
-    dc->realize = milkymist_minimac2_realize;
-    dc->reset = milkymist_minimac2_reset;
-    dc->vmsd = &vmstate_milkymist_minimac2;
-    device_class_set_props(dc, milkymist_minimac2_properties);
-}
-
-static const TypeInfo milkymist_minimac2_info = {
-    .name          = TYPE_MILKYMIST_MINIMAC2,
-    .parent        = TYPE_SYS_BUS_DEVICE,
-    .instance_size = sizeof(MilkymistMinimac2State),
-    .class_init    = milkymist_minimac2_class_init,
-};
-
-static void milkymist_minimac2_register_types(void)
-{
-    type_register_static(&milkymist_minimac2_info);
-}
-
-type_init(milkymist_minimac2_register_types)
diff --git a/hw/sd/milkymist-memcard.c b/hw/sd/milkymist-memcard.c
deleted file mode 100644
index a1235aa46c..0000000000
--- a/hw/sd/milkymist-memcard.c
+++ /dev/null
@@ -1,335 +0,0 @@
-/*
- *  QEMU model of the Milkymist SD Card Controller.
- *
- *  Copyright (c) 2010 Michael Walle <michael@walle.cc>
- *
- * This library is free software; you can redistribute it and/or
- * modify it under the terms of the GNU Lesser General Public
- * License as published by the Free Software Foundation; either
- * version 2.1 of the License, or (at your option) any later version.
- *
- * This library is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
- * Lesser General Public License for more details.
- *
- * You should have received a copy of the GNU Lesser General Public
- * License along with this library; if not, see <http://www.gnu.org/licenses/>.
- *
- *
- * Specification available at:
- *   http://milkymist.walle.cc/socdoc/memcard.pdf
- */
-
-#include "qemu/osdep.h"
-#include "qemu/log.h"
-#include "qemu/module.h"
-#include "hw/sysbus.h"
-#include "migration/vmstate.h"
-#include "trace.h"
-#include "qapi/error.h"
-#include "sysemu/block-backend.h"
-#include "sysemu/blockdev.h"
-#include "hw/qdev-properties.h"
-#include "hw/sd/sd.h"
-#include "qom/object.h"
-
-enum {
-    ENABLE_CMD_TX   = (1<<0),
-    ENABLE_CMD_RX   = (1<<1),
-    ENABLE_DAT_TX   = (1<<2),
-    ENABLE_DAT_RX   = (1<<3),
-};
-
-enum {
-    PENDING_CMD_TX   = (1<<0),
-    PENDING_CMD_RX   = (1<<1),
-    PENDING_DAT_TX   = (1<<2),
-    PENDING_DAT_RX   = (1<<3),
-};
-
-enum {
-    START_CMD_TX    = (1<<0),
-    START_DAT_RX    = (1<<1),
-};
-
-enum {
-    R_CLK2XDIV = 0,
-    R_ENABLE,
-    R_PENDING,
-    R_START,
-    R_CMD,
-    R_DAT,
-    R_MAX
-};
-
-#define TYPE_MILKYMIST_MEMCARD "milkymist-memcard"
-OBJECT_DECLARE_SIMPLE_TYPE(MilkymistMemcardState, MILKYMIST_MEMCARD)
-
-#define TYPE_MILKYMIST_SDBUS "milkymist-sdbus"
-
-struct MilkymistMemcardState {
-    SysBusDevice parent_obj;
-
-    MemoryRegion regs_region;
-    SDBus sdbus;
-
-    int command_write_ptr;
-    int response_read_ptr;
-    int response_len;
-    int ignore_next_cmd;
-    int enabled;
-    uint8_t command[6];
-    uint8_t response[17];
-    uint32_t regs[R_MAX];
-};
-
-static void update_pending_bits(MilkymistMemcardState *s)
-{
-    /* transmits are instantaneous, thus tx pending bits are never set */
-    s->regs[R_PENDING] = 0;
-    /* if rx is enabled the corresponding pending bits are always set */
-    if (s->regs[R_ENABLE] & ENABLE_CMD_RX) {
-        s->regs[R_PENDING] |= PENDING_CMD_RX;
-    }
-    if (s->regs[R_ENABLE] & ENABLE_DAT_RX) {
-        s->regs[R_PENDING] |= PENDING_DAT_RX;
-    }
-}
-
-static void memcard_sd_command(MilkymistMemcardState *s)
-{
-    SDRequest req;
-
-    req.cmd = s->command[0] & 0x3f;
-    req.arg = ldl_be_p(s->command + 1);
-    req.crc = s->command[5];
-
-    s->response[0] = req.cmd;
-    s->response_len = sdbus_do_command(&s->sdbus, &req, s->response + 1);
-    s->response_read_ptr = 0;
-
-    if (s->response_len == 16) {
-        /* R2 response */
-        s->response[0] = 0x3f;
-        s->response_len += 1;
-    } else if (s->response_len == 4) {
-        /* no crc calculation, insert dummy byte */
-        s->response[5] = 0;
-        s->response_len += 2;
-    }
-
-    if (req.cmd == 0) {
-        /* next write is a dummy byte to clock the initialization of the sd
-         * card */
-        s->ignore_next_cmd = 1;
-    }
-}
-
-static uint64_t memcard_read(void *opaque, hwaddr addr,
-                             unsigned size)
-{
-    MilkymistMemcardState *s = opaque;
-    uint32_t r = 0;
-
-    addr >>= 2;
-    switch (addr) {
-    case R_CMD:
-        if (!s->enabled) {
-            r = 0xff;
-        } else {
-            r = s->response[s->response_read_ptr++];
-            if (s->response_read_ptr > s->response_len) {
-                qemu_log_mask(LOG_GUEST_ERROR, "milkymist_memcard: "
-                              "read more cmd bytes than available: clipping\n");
-                s->response_read_ptr = 0;
-            }
-        }
-        break;
-    case R_DAT:
-        if (!s->enabled) {
-            r = 0xffffffff;
-        } else {
-            sdbus_read_data(&s->sdbus, &r, sizeof(r));
-            be32_to_cpus(&r);
-        }
-        break;
-    case R_CLK2XDIV:
-    case R_ENABLE:
-    case R_PENDING:
-    case R_START:
-        r = s->regs[addr];
-        break;
-
-    default:
-        qemu_log_mask(LOG_UNIMP, "milkymist_memcard: "
-                      "read access to unknown register 0x%" HWADDR_PRIx "\n",
-                      addr << 2);
-        break;
-    }
-
-    trace_milkymist_memcard_memory_read(addr << 2, r);
-
-    return r;
-}
-
-static void memcard_write(void *opaque, hwaddr addr, uint64_t value,
-                          unsigned size)
-{
-    MilkymistMemcardState *s = opaque;
-    uint32_t val32;
-
-    trace_milkymist_memcard_memory_write(addr, value);
-
-    addr >>= 2;
-    switch (addr) {
-    case R_PENDING:
-        /* clear rx pending bits */
-        s->regs[R_PENDING] &= ~(value & (PENDING_CMD_RX | PENDING_DAT_RX));
-        update_pending_bits(s);
-        break;
-    case R_CMD:
-        if (!s->enabled) {
-            break;
-        }
-        if (s->ignore_next_cmd) {
-            s->ignore_next_cmd = 0;
-            break;
-        }
-        s->command[s->command_write_ptr] = value & 0xff;
-        s->command_write_ptr = (s->command_write_ptr + 1) % 6;
-        if (s->command_write_ptr == 0) {
-            memcard_sd_command(s);
-        }
-        break;
-    case R_DAT:
-        if (!s->enabled) {
-            break;
-        }
-        val32 = cpu_to_be32(value);
-        sdbus_write_data(&s->sdbus, &val32, sizeof(val32));
-        break;
-    case R_ENABLE:
-        s->regs[addr] = value;
-        update_pending_bits(s);
-        break;
-    case R_CLK2XDIV:
-    case R_START:
-        s->regs[addr] = value;
-        break;
-
-    default:
-        qemu_log_mask(LOG_UNIMP, "milkymist_memcard: "
-                      "write access to unknown register 0x%" HWADDR_PRIx " "
-                      "(value 0x%" PRIx64 ")\n", addr << 2, value);
-        break;
-    }
-}
-
-static const MemoryRegionOps memcard_mmio_ops = {
-    .read = memcard_read,
-    .write = memcard_write,
-    .valid = {
-        .min_access_size = 4,
-        .max_access_size = 4,
-    },
-    .endianness = DEVICE_NATIVE_ENDIAN,
-};
-
-static void milkymist_memcard_reset(DeviceState *d)
-{
-    MilkymistMemcardState *s = MILKYMIST_MEMCARD(d);
-    int i;
-
-    s->command_write_ptr = 0;
-    s->response_read_ptr = 0;
-    s->response_len = 0;
-
-    for (i = 0; i < R_MAX; i++) {
-        s->regs[i] = 0;
-    }
-}
-
-static void milkymist_memcard_set_readonly(DeviceState *dev, bool level)
-{
-    qemu_log_mask(LOG_UNIMP,
-                  "milkymist_memcard: read-only mode not supported\n");
-}
-
-static void milkymist_memcard_set_inserted(DeviceState *dev, bool level)
-{
-    MilkymistMemcardState *s = MILKYMIST_MEMCARD(dev);
-
-    s->enabled = !!level;
-}
-
-static void milkymist_memcard_init(Object *obj)
-{
-    MilkymistMemcardState *s = MILKYMIST_MEMCARD(obj);
-    SysBusDevice *dev = SYS_BUS_DEVICE(obj);
-
-    memory_region_init_io(&s->regs_region, OBJECT(s), &memcard_mmio_ops, s,
-            "milkymist-memcard", R_MAX * 4);
-    sysbus_init_mmio(dev, &s->regs_region);
-
-    qbus_create_inplace(&s->sdbus, sizeof(s->sdbus), TYPE_SD_BUS,
-                        DEVICE(obj), "sd-bus");
-}
-
-static const VMStateDescription vmstate_milkymist_memcard = {
-    .name = "milkymist-memcard",
-    .version_id = 1,
-    .minimum_version_id = 1,
-    .fields = (VMStateField[]) {
-        VMSTATE_INT32(command_write_ptr, MilkymistMemcardState),
-        VMSTATE_INT32(response_read_ptr, MilkymistMemcardState),
-        VMSTATE_INT32(response_len, MilkymistMemcardState),
-        VMSTATE_INT32(ignore_next_cmd, MilkymistMemcardState),
-        VMSTATE_INT32(enabled, MilkymistMemcardState),
-        VMSTATE_UINT8_ARRAY(command, MilkymistMemcardState, 6),
-        VMSTATE_UINT8_ARRAY(response, MilkymistMemcardState, 17),
-        VMSTATE_UINT32_ARRAY(regs, MilkymistMemcardState, R_MAX),
-        VMSTATE_END_OF_LIST()
-    }
-};
-
-static void milkymist_memcard_class_init(ObjectClass *klass, void *data)
-{
-    DeviceClass *dc = DEVICE_CLASS(klass);
-
-    dc->reset = milkymist_memcard_reset;
-    dc->vmsd = &vmstate_milkymist_memcard;
-    /* Reason: output IRQs should be wired up */
-    dc->user_creatable = false;
-}
-
-static const TypeInfo milkymist_memcard_info = {
-    .name          = TYPE_MILKYMIST_MEMCARD,
-    .parent        = TYPE_SYS_BUS_DEVICE,
-    .instance_size = sizeof(MilkymistMemcardState),
-    .instance_init = milkymist_memcard_init,
-    .class_init    = milkymist_memcard_class_init,
-};
-
-static void milkymist_sdbus_class_init(ObjectClass *klass, void *data)
-{
-    SDBusClass *sbc = SD_BUS_CLASS(klass);
-
-    sbc->set_inserted = milkymist_memcard_set_inserted;
-    sbc->set_readonly = milkymist_memcard_set_readonly;
-}
-
-static const TypeInfo milkymist_sdbus_info = {
-    .name = TYPE_MILKYMIST_SDBUS,
-    .parent = TYPE_SD_BUS,
-    .instance_size = sizeof(SDBus),
-    .class_init = milkymist_sdbus_class_init,
-};
-
-static void milkymist_memcard_register_types(void)
-{
-    type_register_static(&milkymist_memcard_info);
-    type_register_static(&milkymist_sdbus_info);
-}
-
-type_init(milkymist_memcard_register_types)
diff --git a/hw/timer/lm32_timer.c b/hw/timer/lm32_timer.c
deleted file mode 100644
index eeaf0ada5f..0000000000
--- a/hw/timer/lm32_timer.c
+++ /dev/null
@@ -1,249 +0,0 @@
-/*
- *  QEMU model of the LatticeMico32 timer block.
- *
- *  Copyright (c) 2010 Michael Walle <michael@walle.cc>
- *
- * This library is free software; you can redistribute it and/or
- * modify it under the terms of the GNU Lesser General Public
- * License as published by the Free Software Foundation; either
- * version 2.1 of the License, or (at your option) any later version.
- *
- * This library is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
- * Lesser General Public License for more details.
- *
- * You should have received a copy of the GNU Lesser General Public
- * License along with this library; if not, see <http://www.gnu.org/licenses/>.
- *
- *
- * Specification available at:
- *   http://www.latticesemi.com/documents/mico32timer.pdf
- */
-
-#include "qemu/osdep.h"
-#include "hw/irq.h"
-#include "hw/sysbus.h"
-#include "migration/vmstate.h"
-#include "trace.h"
-#include "qemu/timer.h"
-#include "hw/ptimer.h"
-#include "hw/qdev-properties.h"
-#include "qemu/error-report.h"
-#include "qemu/module.h"
-#include "qom/object.h"
-
-#define DEFAULT_FREQUENCY (50*1000000)
-
-enum {
-    R_SR = 0,
-    R_CR,
-    R_PERIOD,
-    R_SNAPSHOT,
-    R_MAX
-};
-
-enum {
-    SR_TO    = (1 << 0),
-    SR_RUN   = (1 << 1),
-};
-
-enum {
-    CR_ITO   = (1 << 0),
-    CR_CONT  = (1 << 1),
-    CR_START = (1 << 2),
-    CR_STOP  = (1 << 3),
-};
-
-#define TYPE_LM32_TIMER "lm32-timer"
-OBJECT_DECLARE_SIMPLE_TYPE(LM32TimerState, LM32_TIMER)
-
-struct LM32TimerState {
-    SysBusDevice parent_obj;
-
-    MemoryRegion iomem;
-
-    ptimer_state *ptimer;
-
-    qemu_irq irq;
-    uint32_t freq_hz;
-
-    uint32_t regs[R_MAX];
-};
-
-static void timer_update_irq(LM32TimerState *s)
-{
-    int state = (s->regs[R_SR] & SR_TO) && (s->regs[R_CR] & CR_ITO);
-
-    trace_lm32_timer_irq_state(state);
-    qemu_set_irq(s->irq, state);
-}
-
-static uint64_t timer_read(void *opaque, hwaddr addr, unsigned size)
-{
-    LM32TimerState *s = opaque;
-    uint32_t r = 0;
-
-    addr >>= 2;
-    switch (addr) {
-    case R_SR:
-    case R_CR:
-    case R_PERIOD:
-        r = s->regs[addr];
-        break;
-    case R_SNAPSHOT:
-        r = (uint32_t)ptimer_get_count(s->ptimer);
-        break;
-    default:
-        error_report("lm32_timer: read access to unknown register 0x"
-                TARGET_FMT_plx, addr << 2);
-        break;
-    }
-
-    trace_lm32_timer_memory_read(addr << 2, r);
-    return r;
-}
-
-static void timer_write(void *opaque, hwaddr addr,
-                        uint64_t value, unsigned size)
-{
-    LM32TimerState *s = opaque;
-
-    trace_lm32_timer_memory_write(addr, value);
-
-    addr >>= 2;
-    switch (addr) {
-    case R_SR:
-        s->regs[R_SR] &= ~SR_TO;
-        break;
-    case R_CR:
-        ptimer_transaction_begin(s->ptimer);
-        s->regs[R_CR] = value;
-        if (s->regs[R_CR] & CR_START) {
-            ptimer_run(s->ptimer, 1);
-        }
-        if (s->regs[R_CR] & CR_STOP) {
-            ptimer_stop(s->ptimer);
-        }
-        ptimer_transaction_commit(s->ptimer);
-        break;
-    case R_PERIOD:
-        s->regs[R_PERIOD] = value;
-        ptimer_transaction_begin(s->ptimer);
-        ptimer_set_count(s->ptimer, value);
-        ptimer_transaction_commit(s->ptimer);
-        break;
-    case R_SNAPSHOT:
-        error_report("lm32_timer: write access to read only register 0x"
-                TARGET_FMT_plx, addr << 2);
-        break;
-    default:
-        error_report("lm32_timer: write access to unknown register 0x"
-                TARGET_FMT_plx, addr << 2);
-        break;
-    }
-    timer_update_irq(s);
-}
-
-static const MemoryRegionOps timer_ops = {
-    .read = timer_read,
-    .write = timer_write,
-    .endianness = DEVICE_NATIVE_ENDIAN,
-    .valid = {
-        .min_access_size = 4,
-        .max_access_size = 4,
-    },
-};
-
-static void timer_hit(void *opaque)
-{
-    LM32TimerState *s = opaque;
-
-    trace_lm32_timer_hit();
-
-    s->regs[R_SR] |= SR_TO;
-
-    if (s->regs[R_CR] & CR_CONT) {
-        ptimer_set_count(s->ptimer, s->regs[R_PERIOD]);
-        ptimer_run(s->ptimer, 1);
-    }
-    timer_update_irq(s);
-}
-
-static void timer_reset(DeviceState *d)
-{
-    LM32TimerState *s = LM32_TIMER(d);
-    int i;
-
-    for (i = 0; i < R_MAX; i++) {
-        s->regs[i] = 0;
-    }
-    ptimer_transaction_begin(s->ptimer);
-    ptimer_stop(s->ptimer);
-    ptimer_transaction_commit(s->ptimer);
-}
-
-static void lm32_timer_init(Object *obj)
-{
-    LM32TimerState *s = LM32_TIMER(obj);
-    SysBusDevice *dev = SYS_BUS_DEVICE(obj);
-
-    sysbus_init_irq(dev, &s->irq);
-
-    memory_region_init_io(&s->iomem, obj, &timer_ops, s,
-                          "timer", R_MAX * 4);
-    sysbus_init_mmio(dev, &s->iomem);
-}
-
-static void lm32_timer_realize(DeviceState *dev, Error **errp)
-{
-    LM32TimerState *s = LM32_TIMER(dev);
-
-    s->ptimer = ptimer_init(timer_hit, s, PTIMER_POLICY_DEFAULT);
-
-    ptimer_transaction_begin(s->ptimer);
-    ptimer_set_freq(s->ptimer, s->freq_hz);
-    ptimer_transaction_commit(s->ptimer);
-}
-
-static const VMStateDescription vmstate_lm32_timer = {
-    .name = "lm32-timer",
-    .version_id = 1,
-    .minimum_version_id = 1,
-    .fields = (VMStateField[]) {
-        VMSTATE_PTIMER(ptimer, LM32TimerState),
-        VMSTATE_UINT32(freq_hz, LM32TimerState),
-        VMSTATE_UINT32_ARRAY(regs, LM32TimerState, R_MAX),
-        VMSTATE_END_OF_LIST()
-    }
-};
-
-static Property lm32_timer_properties[] = {
-    DEFINE_PROP_UINT32("frequency", LM32TimerState, freq_hz, DEFAULT_FREQUENCY),
-    DEFINE_PROP_END_OF_LIST(),
-};
-
-static void lm32_timer_class_init(ObjectClass *klass, void *data)
-{
-    DeviceClass *dc = DEVICE_CLASS(klass);
-
-    dc->realize = lm32_timer_realize;
-    dc->reset = timer_reset;
-    dc->vmsd = &vmstate_lm32_timer;
-    device_class_set_props(dc, lm32_timer_properties);
-}
-
-static const TypeInfo lm32_timer_info = {
-    .name          = TYPE_LM32_TIMER,
-    .parent        = TYPE_SYS_BUS_DEVICE,
-    .instance_size = sizeof(LM32TimerState),
-    .instance_init = lm32_timer_init,
-    .class_init    = lm32_timer_class_init,
-};
-
-static void lm32_timer_register_types(void)
-{
-    type_register_static(&lm32_timer_info);
-}
-
-type_init(lm32_timer_register_types)
diff --git a/hw/timer/milkymist-sysctl.c b/hw/timer/milkymist-sysctl.c
deleted file mode 100644
index 9ecea63861..0000000000
--- a/hw/timer/milkymist-sysctl.c
+++ /dev/null
@@ -1,361 +0,0 @@
-/*
- *  QEMU model of the Milkymist System Controller.
- *
- *  Copyright (c) 2010-2012 Michael Walle <michael@walle.cc>
- *
- * This library is free software; you can redistribute it and/or
- * modify it under the terms of the GNU Lesser General Public
- * License as published by the Free Software Foundation; either
- * version 2.1 of the License, or (at your option) any later version.
- *
- * This library is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
- * Lesser General Public License for more details.
- *
- * You should have received a copy of the GNU Lesser General Public
- * License along with this library; if not, see <http://www.gnu.org/licenses/>.
- *
- *
- * Specification available at:
- *   http://milkymist.walle.cc/socdoc/sysctl.pdf
- */
-
-#include "qemu/osdep.h"
-#include "hw/irq.h"
-#include "hw/sysbus.h"
-#include "migration/vmstate.h"
-#include "trace.h"
-#include "qemu/timer.h"
-#include "sysemu/runstate.h"
-#include "hw/ptimer.h"
-#include "hw/qdev-properties.h"
-#include "qemu/error-report.h"
-#include "qemu/module.h"
-#include "qom/object.h"
-
-enum {
-    CTRL_ENABLE      = (1<<0),
-    CTRL_AUTORESTART = (1<<1),
-};
-
-enum {
-    ICAP_READY       = (1<<0),
-};
-
-enum {
-    R_GPIO_IN         = 0,
-    R_GPIO_OUT,
-    R_GPIO_INTEN,
-    R_TIMER0_CONTROL  = 4,
-    R_TIMER0_COMPARE,
-    R_TIMER0_COUNTER,
-    R_TIMER1_CONTROL  = 8,
-    R_TIMER1_COMPARE,
-    R_TIMER1_COUNTER,
-    R_ICAP = 16,
-    R_DBG_SCRATCHPAD  = 20,
-    R_DBG_WRITE_LOCK,
-    R_CLK_FREQUENCY   = 29,
-    R_CAPABILITIES,
-    R_SYSTEM_ID,
-    R_MAX
-};
-
-#define TYPE_MILKYMIST_SYSCTL "milkymist-sysctl"
-OBJECT_DECLARE_SIMPLE_TYPE(MilkymistSysctlState, MILKYMIST_SYSCTL)
-
-struct MilkymistSysctlState {
-    SysBusDevice parent_obj;
-
-    MemoryRegion regs_region;
-
-    ptimer_state *ptimer0;
-    ptimer_state *ptimer1;
-
-    uint32_t freq_hz;
-    uint32_t capabilities;
-    uint32_t systemid;
-    uint32_t strappings;
-
-    uint32_t regs[R_MAX];
-
-    qemu_irq gpio_irq;
-    qemu_irq timer0_irq;
-    qemu_irq timer1_irq;
-};
-
-static void sysctl_icap_write(MilkymistSysctlState *s, uint32_t value)
-{
-    trace_milkymist_sysctl_icap_write(value);
-    switch (value & 0xffff) {
-    case 0x000e:
-        qemu_system_shutdown_request(SHUTDOWN_CAUSE_GUEST_SHUTDOWN);
-        break;
-    }
-}
-
-static uint64_t sysctl_read(void *opaque, hwaddr addr,
-                            unsigned size)
-{
-    MilkymistSysctlState *s = opaque;
-    uint32_t r = 0;
-
-    addr >>= 2;
-    switch (addr) {
-    case R_TIMER0_COUNTER:
-        r = (uint32_t)ptimer_get_count(s->ptimer0);
-        /* milkymist timer counts up */
-        r = s->regs[R_TIMER0_COMPARE] - r;
-        break;
-    case R_TIMER1_COUNTER:
-        r = (uint32_t)ptimer_get_count(s->ptimer1);
-        /* milkymist timer counts up */
-        r = s->regs[R_TIMER1_COMPARE] - r;
-        break;
-    case R_GPIO_IN:
-    case R_GPIO_OUT:
-    case R_GPIO_INTEN:
-    case R_TIMER0_CONTROL:
-    case R_TIMER0_COMPARE:
-    case R_TIMER1_CONTROL:
-    case R_TIMER1_COMPARE:
-    case R_ICAP:
-    case R_DBG_SCRATCHPAD:
-    case R_DBG_WRITE_LOCK:
-    case R_CLK_FREQUENCY:
-    case R_CAPABILITIES:
-    case R_SYSTEM_ID:
-        r = s->regs[addr];
-        break;
-
-    default:
-        error_report("milkymist_sysctl: read access to unknown register 0x"
-                TARGET_FMT_plx, addr << 2);
-        break;
-    }
-
-    trace_milkymist_sysctl_memory_read(addr << 2, r);
-
-    return r;
-}
-
-static void sysctl_write(void *opaque, hwaddr addr, uint64_t value,
-                         unsigned size)
-{
-    MilkymistSysctlState *s = opaque;
-
-    trace_milkymist_sysctl_memory_write(addr, value);
-
-    addr >>= 2;
-    switch (addr) {
-    case R_GPIO_OUT:
-    case R_GPIO_INTEN:
-    case R_TIMER0_COUNTER:
-    case R_TIMER1_COUNTER:
-    case R_DBG_SCRATCHPAD:
-        s->regs[addr] = value;
-        break;
-    case R_TIMER0_COMPARE:
-        ptimer_transaction_begin(s->ptimer0);
-        ptimer_set_limit(s->ptimer0, value, 0);
-        s->regs[addr] = value;
-        ptimer_transaction_commit(s->ptimer0);
-        break;
-    case R_TIMER1_COMPARE:
-        ptimer_transaction_begin(s->ptimer1);
-        ptimer_set_limit(s->ptimer1, value, 0);
-        s->regs[addr] = value;
-        ptimer_transaction_commit(s->ptimer1);
-        break;
-    case R_TIMER0_CONTROL:
-        ptimer_transaction_begin(s->ptimer0);
-        s->regs[addr] = value;
-        if (s->regs[R_TIMER0_CONTROL] & CTRL_ENABLE) {
-            trace_milkymist_sysctl_start_timer0();
-            ptimer_set_count(s->ptimer0,
-                    s->regs[R_TIMER0_COMPARE] - s->regs[R_TIMER0_COUNTER]);
-            ptimer_run(s->ptimer0, 0);
-        } else {
-            trace_milkymist_sysctl_stop_timer0();
-            ptimer_stop(s->ptimer0);
-        }
-        ptimer_transaction_commit(s->ptimer0);
-        break;
-    case R_TIMER1_CONTROL:
-        ptimer_transaction_begin(s->ptimer1);
-        s->regs[addr] = value;
-        if (s->regs[R_TIMER1_CONTROL] & CTRL_ENABLE) {
-            trace_milkymist_sysctl_start_timer1();
-            ptimer_set_count(s->ptimer1,
-                    s->regs[R_TIMER1_COMPARE] - s->regs[R_TIMER1_COUNTER]);
-            ptimer_run(s->ptimer1, 0);
-        } else {
-            trace_milkymist_sysctl_stop_timer1();
-            ptimer_stop(s->ptimer1);
-        }
-        ptimer_transaction_commit(s->ptimer1);
-        break;
-    case R_ICAP:
-        sysctl_icap_write(s, value);
-        break;
-    case R_DBG_WRITE_LOCK:
-        s->regs[addr] = 1;
-        break;
-    case R_SYSTEM_ID:
-        qemu_system_reset_request(SHUTDOWN_CAUSE_GUEST_RESET);
-        break;
-
-    case R_GPIO_IN:
-    case R_CLK_FREQUENCY:
-    case R_CAPABILITIES:
-        error_report("milkymist_sysctl: write to read-only register 0x"
-                TARGET_FMT_plx, addr << 2);
-        break;
-
-    default:
-        error_report("milkymist_sysctl: write access to unknown register 0x"
-                TARGET_FMT_plx, addr << 2);
-        break;
-    }
-}
-
-static const MemoryRegionOps sysctl_mmio_ops = {
-    .read = sysctl_read,
-    .write = sysctl_write,
-    .valid = {
-        .min_access_size = 4,
-        .max_access_size = 4,
-    },
-    .endianness = DEVICE_NATIVE_ENDIAN,
-};
-
-static void timer0_hit(void *opaque)
-{
-    MilkymistSysctlState *s = opaque;
-
-    if (!(s->regs[R_TIMER0_CONTROL] & CTRL_AUTORESTART)) {
-        s->regs[R_TIMER0_CONTROL] &= ~CTRL_ENABLE;
-        trace_milkymist_sysctl_stop_timer0();
-        ptimer_stop(s->ptimer0);
-    }
-
-    trace_milkymist_sysctl_pulse_irq_timer0();
-    qemu_irq_pulse(s->timer0_irq);
-}
-
-static void timer1_hit(void *opaque)
-{
-    MilkymistSysctlState *s = opaque;
-
-    if (!(s->regs[R_TIMER1_CONTROL] & CTRL_AUTORESTART)) {
-        s->regs[R_TIMER1_CONTROL] &= ~CTRL_ENABLE;
-        trace_milkymist_sysctl_stop_timer1();
-        ptimer_stop(s->ptimer1);
-    }
-
-    trace_milkymist_sysctl_pulse_irq_timer1();
-    qemu_irq_pulse(s->timer1_irq);
-}
-
-static void milkymist_sysctl_reset(DeviceState *d)
-{
-    MilkymistSysctlState *s = MILKYMIST_SYSCTL(d);
-    int i;
-
-    for (i = 0; i < R_MAX; i++) {
-        s->regs[i] = 0;
-    }
-
-    ptimer_transaction_begin(s->ptimer0);
-    ptimer_stop(s->ptimer0);
-    ptimer_transaction_commit(s->ptimer0);
-    ptimer_transaction_begin(s->ptimer1);
-    ptimer_stop(s->ptimer1);
-    ptimer_transaction_commit(s->ptimer1);
-
-    /* defaults */
-    s->regs[R_ICAP] = ICAP_READY;
-    s->regs[R_SYSTEM_ID] = s->systemid;
-    s->regs[R_CLK_FREQUENCY] = s->freq_hz;
-    s->regs[R_CAPABILITIES] = s->capabilities;
-    s->regs[R_GPIO_IN] = s->strappings;
-}
-
-static void milkymist_sysctl_init(Object *obj)
-{
-    MilkymistSysctlState *s = MILKYMIST_SYSCTL(obj);
-    SysBusDevice *dev = SYS_BUS_DEVICE(obj);
-
-    sysbus_init_irq(dev, &s->gpio_irq);
-    sysbus_init_irq(dev, &s->timer0_irq);
-    sysbus_init_irq(dev, &s->timer1_irq);
-
-    memory_region_init_io(&s->regs_region, obj, &sysctl_mmio_ops, s,
-            "milkymist-sysctl", R_MAX * 4);
-    sysbus_init_mmio(dev, &s->regs_region);
-}
-
-static void milkymist_sysctl_realize(DeviceState *dev, Error **errp)
-{
-    MilkymistSysctlState *s = MILKYMIST_SYSCTL(dev);
-
-    s->ptimer0 = ptimer_init(timer0_hit, s, PTIMER_POLICY_DEFAULT);
-    s->ptimer1 = ptimer_init(timer1_hit, s, PTIMER_POLICY_DEFAULT);
-
-    ptimer_transaction_begin(s->ptimer0);
-    ptimer_set_freq(s->ptimer0, s->freq_hz);
-    ptimer_transaction_commit(s->ptimer0);
-    ptimer_transaction_begin(s->ptimer1);
-    ptimer_set_freq(s->ptimer1, s->freq_hz);
-    ptimer_transaction_commit(s->ptimer1);
-}
-
-static const VMStateDescription vmstate_milkymist_sysctl = {
-    .name = "milkymist-sysctl",
-    .version_id = 1,
-    .minimum_version_id = 1,
-    .fields = (VMStateField[]) {
-        VMSTATE_UINT32_ARRAY(regs, MilkymistSysctlState, R_MAX),
-        VMSTATE_PTIMER(ptimer0, MilkymistSysctlState),
-        VMSTATE_PTIMER(ptimer1, MilkymistSysctlState),
-        VMSTATE_END_OF_LIST()
-    }
-};
-
-static Property milkymist_sysctl_properties[] = {
-    DEFINE_PROP_UINT32("frequency", MilkymistSysctlState,
-    freq_hz, 80000000),
-    DEFINE_PROP_UINT32("capabilities", MilkymistSysctlState,
-    capabilities, 0x00000000),
-    DEFINE_PROP_UINT32("systemid", MilkymistSysctlState,
-    systemid, 0x10014d31),
-    DEFINE_PROP_UINT32("gpio_strappings", MilkymistSysctlState,
-    strappings, 0x00000001),
-    DEFINE_PROP_END_OF_LIST(),
-};
-
-static void milkymist_sysctl_class_init(ObjectClass *klass, void *data)
-{
-    DeviceClass *dc = DEVICE_CLASS(klass);
-
-    dc->realize = milkymist_sysctl_realize;
-    dc->reset = milkymist_sysctl_reset;
-    dc->vmsd = &vmstate_milkymist_sysctl;
-    device_class_set_props(dc, milkymist_sysctl_properties);
-}
-
-static const TypeInfo milkymist_sysctl_info = {
-    .name          = TYPE_MILKYMIST_SYSCTL,
-    .parent        = TYPE_SYS_BUS_DEVICE,
-    .instance_size = sizeof(MilkymistSysctlState),
-    .instance_init = milkymist_sysctl_init,
-    .class_init    = milkymist_sysctl_class_init,
-};
-
-static void milkymist_sysctl_register_types(void)
-{
-    type_register_static(&milkymist_sysctl_info);
-}
-
-type_init(milkymist_sysctl_register_types)
diff --git a/softmmu/arch_init.c b/softmmu/arch_init.c
index afb0904020..2b90884e3a 100644
--- a/softmmu/arch_init.c
+++ b/softmmu/arch_init.c
@@ -56,8 +56,6 @@ int graphic_depth = 32;
 #define QEMU_ARCH QEMU_ARCH_HPPA
 #elif defined(TARGET_I386)
 #define QEMU_ARCH QEMU_ARCH_I386
-#elif defined(TARGET_LM32)
-#define QEMU_ARCH QEMU_ARCH_LM32
 #elif defined(TARGET_M68K)
 #define QEMU_ARCH QEMU_ARCH_M68K
 #elif defined(TARGET_MICROBLAZE)
diff --git a/target/lm32/cpu.c b/target/lm32/cpu.c
deleted file mode 100644
index c23d72874c..0000000000
--- a/target/lm32/cpu.c
+++ /dev/null
@@ -1,274 +0,0 @@
-/*
- * QEMU LatticeMico32 CPU
- *
- * Copyright (c) 2012 SUSE LINUX Products GmbH
- *
- * This library is free software; you can redistribute it and/or
- * modify it under the terms of the GNU Lesser General Public
- * License as published by the Free Software Foundation; either
- * version 2.1 of the License, or (at your option) any later version.
- *
- * This library is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
- * Lesser General Public License for more details.
- *
- * You should have received a copy of the GNU Lesser General Public
- * License along with this library; if not, see
- * <http://www.gnu.org/licenses/lgpl-2.1.html>
- */
-
-#include "qemu/osdep.h"
-#include "qapi/error.h"
-#include "qemu/qemu-print.h"
-#include "cpu.h"
-
-
-static void lm32_cpu_set_pc(CPUState *cs, vaddr value)
-{
-    LM32CPU *cpu = LM32_CPU(cs);
-
-    cpu->env.pc = value;
-}
-
-static void lm32_cpu_list_entry(gpointer data, gpointer user_data)
-{
-    ObjectClass *oc = data;
-    const char *typename = object_class_get_name(oc);
-    char *name;
-
-    name = g_strndup(typename, strlen(typename) - strlen(LM32_CPU_TYPE_SUFFIX));
-    qemu_printf("  %s\n", name);
-    g_free(name);
-}
-
-
-void lm32_cpu_list(void)
-{
-    GSList *list;
-
-    list = object_class_get_list_sorted(TYPE_LM32_CPU, false);
-    qemu_printf("Available CPUs:\n");
-    g_slist_foreach(list, lm32_cpu_list_entry, NULL);
-    g_slist_free(list);
-}
-
-static void lm32_cpu_init_cfg_reg(LM32CPU *cpu)
-{
-    CPULM32State *env = &cpu->env;
-    uint32_t cfg = 0;
-
-    if (cpu->features & LM32_FEATURE_MULTIPLY) {
-        cfg |= CFG_M;
-    }
-
-    if (cpu->features & LM32_FEATURE_DIVIDE) {
-        cfg |= CFG_D;
-    }
-
-    if (cpu->features & LM32_FEATURE_SHIFT) {
-        cfg |= CFG_S;
-    }
-
-    if (cpu->features & LM32_FEATURE_SIGN_EXTEND) {
-        cfg |= CFG_X;
-    }
-
-    if (cpu->features & LM32_FEATURE_I_CACHE) {
-        cfg |= CFG_IC;
-    }
-
-    if (cpu->features & LM32_FEATURE_D_CACHE) {
-        cfg |= CFG_DC;
-    }
-
-    if (cpu->features & LM32_FEATURE_CYCLE_COUNT) {
-        cfg |= CFG_CC;
-    }
-
-    cfg |= (cpu->num_interrupts << CFG_INT_SHIFT);
-    cfg |= (cpu->num_breakpoints << CFG_BP_SHIFT);
-    cfg |= (cpu->num_watchpoints << CFG_WP_SHIFT);
-    cfg |= (cpu->revision << CFG_REV_SHIFT);
-
-    env->cfg = cfg;
-}
-
-static bool lm32_cpu_has_work(CPUState *cs)
-{
-    return cs->interrupt_request & CPU_INTERRUPT_HARD;
-}
-
-static void lm32_cpu_reset(DeviceState *dev)
-{
-    CPUState *s = CPU(dev);
-    LM32CPU *cpu = LM32_CPU(s);
-    LM32CPUClass *lcc = LM32_CPU_GET_CLASS(cpu);
-    CPULM32State *env = &cpu->env;
-
-    lcc->parent_reset(dev);
-
-    /* reset cpu state */
-    memset(env, 0, offsetof(CPULM32State, end_reset_fields));
-
-    lm32_cpu_init_cfg_reg(cpu);
-}
-
-static void lm32_cpu_disas_set_info(CPUState *cpu, disassemble_info *info)
-{
-    info->mach = bfd_mach_lm32;
-    info->print_insn = print_insn_lm32;
-}
-
-static void lm32_cpu_realizefn(DeviceState *dev, Error **errp)
-{
-    CPUState *cs = CPU(dev);
-    LM32CPUClass *lcc = LM32_CPU_GET_CLASS(dev);
-    Error *local_err = NULL;
-
-    cpu_exec_realizefn(cs, &local_err);
-    if (local_err != NULL) {
-        error_propagate(errp, local_err);
-        return;
-    }
-
-    cpu_reset(cs);
-
-    qemu_init_vcpu(cs);
-
-    lcc->parent_realize(dev, errp);
-}
-
-static void lm32_cpu_initfn(Object *obj)
-{
-    LM32CPU *cpu = LM32_CPU(obj);
-    CPULM32State *env = &cpu->env;
-
-    cpu_set_cpustate_pointers(cpu);
-
-    env->flags = 0;
-}
-
-static void lm32_basic_cpu_initfn(Object *obj)
-{
-    LM32CPU *cpu = LM32_CPU(obj);
-
-    cpu->revision = 3;
-    cpu->num_interrupts = 32;
-    cpu->num_breakpoints = 4;
-    cpu->num_watchpoints = 4;
-    cpu->features = LM32_FEATURE_SHIFT
-                  | LM32_FEATURE_SIGN_EXTEND
-                  | LM32_FEATURE_CYCLE_COUNT;
-}
-
-static void lm32_standard_cpu_initfn(Object *obj)
-{
-    LM32CPU *cpu = LM32_CPU(obj);
-
-    cpu->revision = 3;
-    cpu->num_interrupts = 32;
-    cpu->num_breakpoints = 4;
-    cpu->num_watchpoints = 4;
-    cpu->features = LM32_FEATURE_MULTIPLY
-                  | LM32_FEATURE_DIVIDE
-                  | LM32_FEATURE_SHIFT
-                  | LM32_FEATURE_SIGN_EXTEND
-                  | LM32_FEATURE_I_CACHE
-                  | LM32_FEATURE_CYCLE_COUNT;
-}
-
-static void lm32_full_cpu_initfn(Object *obj)
-{
-    LM32CPU *cpu = LM32_CPU(obj);
-
-    cpu->revision = 3;
-    cpu->num_interrupts = 32;
-    cpu->num_breakpoints = 4;
-    cpu->num_watchpoints = 4;
-    cpu->features = LM32_FEATURE_MULTIPLY
-                  | LM32_FEATURE_DIVIDE
-                  | LM32_FEATURE_SHIFT
-                  | LM32_FEATURE_SIGN_EXTEND
-                  | LM32_FEATURE_I_CACHE
-                  | LM32_FEATURE_D_CACHE
-                  | LM32_FEATURE_CYCLE_COUNT;
-}
-
-static ObjectClass *lm32_cpu_class_by_name(const char *cpu_model)
-{
-    ObjectClass *oc;
-    char *typename;
-
-    typename = g_strdup_printf(LM32_CPU_TYPE_NAME("%s"), cpu_model);
-    oc = object_class_by_name(typename);
-    g_free(typename);
-    if (oc != NULL && (!object_class_dynamic_cast(oc, TYPE_LM32_CPU) ||
-                       object_class_is_abstract(oc))) {
-        oc = NULL;
-    }
-    return oc;
-}
-
-#include "hw/core/tcg-cpu-ops.h"
-
-static struct TCGCPUOps lm32_tcg_ops = {
-    .initialize = lm32_translate_init,
-    .cpu_exec_interrupt = lm32_cpu_exec_interrupt,
-    .tlb_fill = lm32_cpu_tlb_fill,
-    .debug_excp_handler = lm32_debug_excp_handler,
-
-#ifndef CONFIG_USER_ONLY
-    .do_interrupt = lm32_cpu_do_interrupt,
-#endif /* !CONFIG_USER_ONLY */
-};
-
-static void lm32_cpu_class_init(ObjectClass *oc, void *data)
-{
-    LM32CPUClass *lcc = LM32_CPU_CLASS(oc);
-    CPUClass *cc = CPU_CLASS(oc);
-    DeviceClass *dc = DEVICE_CLASS(oc);
-
-    device_class_set_parent_realize(dc, lm32_cpu_realizefn,
-                                    &lcc->parent_realize);
-    device_class_set_parent_reset(dc, lm32_cpu_reset, &lcc->parent_reset);
-
-    cc->class_by_name = lm32_cpu_class_by_name;
-    cc->has_work = lm32_cpu_has_work;
-    cc->dump_state = lm32_cpu_dump_state;
-    cc->set_pc = lm32_cpu_set_pc;
-    cc->gdb_read_register = lm32_cpu_gdb_read_register;
-    cc->gdb_write_register = lm32_cpu_gdb_write_register;
-#ifndef CONFIG_USER_ONLY
-    cc->get_phys_page_debug = lm32_cpu_get_phys_page_debug;
-    cc->vmsd = &vmstate_lm32_cpu;
-#endif
-    cc->gdb_num_core_regs = 32 + 7;
-    cc->gdb_stop_before_watchpoint = true;
-    cc->disas_set_info = lm32_cpu_disas_set_info;
-    cc->tcg_ops = &lm32_tcg_ops;
-}
-
-#define DEFINE_LM32_CPU_TYPE(cpu_model, initfn) \
-    { \
-        .parent = TYPE_LM32_CPU, \
-        .name = LM32_CPU_TYPE_NAME(cpu_model), \
-        .instance_init = initfn, \
-    }
-
-static const TypeInfo lm32_cpus_type_infos[] = {
-    { /* base class should be registered first */
-         .name = TYPE_LM32_CPU,
-         .parent = TYPE_CPU,
-         .instance_size = sizeof(LM32CPU),
-         .instance_init = lm32_cpu_initfn,
-         .abstract = true,
-         .class_size = sizeof(LM32CPUClass),
-         .class_init = lm32_cpu_class_init,
-    },
-    DEFINE_LM32_CPU_TYPE("lm32-basic", lm32_basic_cpu_initfn),
-    DEFINE_LM32_CPU_TYPE("lm32-standard", lm32_standard_cpu_initfn),
-    DEFINE_LM32_CPU_TYPE("lm32-full", lm32_full_cpu_initfn),
-};
-
-DEFINE_TYPES(lm32_cpus_type_infos)
diff --git a/target/lm32/gdbstub.c b/target/lm32/gdbstub.c
deleted file mode 100644
index 56f508a5b6..0000000000
--- a/target/lm32/gdbstub.c
+++ /dev/null
@@ -1,92 +0,0 @@
-/*
- * LM32 gdb server stub
- *
- * Copyright (c) 2003-2005 Fabrice Bellard
- * Copyright (c) 2013 SUSE LINUX Products GmbH
- *
- * This library is free software; you can redistribute it and/or
- * modify it under the terms of the GNU Lesser General Public
- * License as published by the Free Software Foundation; either
- * version 2.1 of the License, or (at your option) any later version.
- *
- * This library is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
- * Lesser General Public License for more details.
- *
- * You should have received a copy of the GNU Lesser General Public
- * License along with this library; if not, see <http://www.gnu.org/licenses/>.
- */
-#include "qemu/osdep.h"
-#include "cpu.h"
-#include "exec/gdbstub.h"
-#include "hw/lm32/lm32_pic.h"
-
-int lm32_cpu_gdb_read_register(CPUState *cs, GByteArray *mem_buf, int n)
-{
-    LM32CPU *cpu = LM32_CPU(cs);
-    CPULM32State *env = &cpu->env;
-
-    if (n < 32) {
-        return gdb_get_reg32(mem_buf, env->regs[n]);
-    } else {
-        switch (n) {
-        case 32:
-            return gdb_get_reg32(mem_buf, env->pc);
-        /* FIXME: put in right exception ID */
-        case 33:
-            return gdb_get_reg32(mem_buf, 0);
-        case 34:
-            return gdb_get_reg32(mem_buf, env->eba);
-        case 35:
-            return gdb_get_reg32(mem_buf, env->deba);
-        case 36:
-            return gdb_get_reg32(mem_buf, env->ie);
-        case 37:
-            return gdb_get_reg32(mem_buf, lm32_pic_get_im(env->pic_state));
-        case 38:
-            return gdb_get_reg32(mem_buf, lm32_pic_get_ip(env->pic_state));
-        }
-    }
-    return 0;
-}
-
-int lm32_cpu_gdb_write_register(CPUState *cs, uint8_t *mem_buf, int n)
-{
-    LM32CPU *cpu = LM32_CPU(cs);
-    CPUClass *cc = CPU_GET_CLASS(cs);
-    CPULM32State *env = &cpu->env;
-    uint32_t tmp;
-
-    if (n > cc->gdb_num_core_regs) {
-        return 0;
-    }
-
-    tmp = ldl_p(mem_buf);
-
-    if (n < 32) {
-        env->regs[n] = tmp;
-    } else {
-        switch (n) {
-        case 32:
-            env->pc = tmp;
-            break;
-        case 34:
-            env->eba = tmp;
-            break;
-        case 35:
-            env->deba = tmp;
-            break;
-        case 36:
-            env->ie = tmp;
-            break;
-        case 37:
-            lm32_pic_set_im(env->pic_state, tmp);
-            break;
-        case 38:
-            lm32_pic_set_ip(env->pic_state, tmp);
-            break;
-        }
-    }
-    return 4;
-}
diff --git a/target/lm32/helper.c b/target/lm32/helper.c
deleted file mode 100644
index 01cc3c53a5..0000000000
--- a/target/lm32/helper.c
+++ /dev/null
@@ -1,224 +0,0 @@
-/*
- *  LatticeMico32 helper routines.
- *
- *  Copyright (c) 2010-2014 Michael Walle <michael@walle.cc>
- *
- * This library is free software; you can redistribute it and/or
- * modify it under the terms of the GNU Lesser General Public
- * License as published by the Free Software Foundation; either
- * version 2.1 of the License, or (at your option) any later version.
- *
- * This library is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
- * Lesser General Public License for more details.
- *
- * You should have received a copy of the GNU Lesser General Public
- * License along with this library; if not, see <http://www.gnu.org/licenses/>.
- */
-
-#include "qemu/osdep.h"
-#include "cpu.h"
-#include "exec/exec-all.h"
-#include "qemu/host-utils.h"
-#include "semihosting/semihost.h"
-#include "exec/log.h"
-
-bool lm32_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
-                       MMUAccessType access_type, int mmu_idx,
-                       bool probe, uintptr_t retaddr)
-{
-    LM32CPU *cpu = LM32_CPU(cs);
-    CPULM32State *env = &cpu->env;
-    int prot;
-
-    address &= TARGET_PAGE_MASK;
-    prot = PAGE_BITS;
-    if (env->flags & LM32_FLAG_IGNORE_MSB) {
-        tlb_set_page(cs, address, address & 0x7fffffff, prot, mmu_idx,
-                     TARGET_PAGE_SIZE);
-    } else {
-        tlb_set_page(cs, address, address, prot, mmu_idx, TARGET_PAGE_SIZE);
-    }
-    return true;
-}
-
-hwaddr lm32_cpu_get_phys_page_debug(CPUState *cs, vaddr addr)
-{
-    LM32CPU *cpu = LM32_CPU(cs);
-
-    addr &= TARGET_PAGE_MASK;
-    if (cpu->env.flags & LM32_FLAG_IGNORE_MSB) {
-        return addr & 0x7fffffff;
-    } else {
-        return addr;
-    }
-}
-
-void lm32_breakpoint_insert(CPULM32State *env, int idx, target_ulong address)
-{
-    cpu_breakpoint_insert(env_cpu(env), address, BP_CPU,
-                          &env->cpu_breakpoint[idx]);
-}
-
-void lm32_breakpoint_remove(CPULM32State *env, int idx)
-{
-    if (!env->cpu_breakpoint[idx]) {
-        return;
-    }
-
-    cpu_breakpoint_remove_by_ref(env_cpu(env), env->cpu_breakpoint[idx]);
-    env->cpu_breakpoint[idx] = NULL;
-}
-
-void lm32_watchpoint_insert(CPULM32State *env, int idx, target_ulong address,
-                            lm32_wp_t wp_type)
-{
-    int flags = 0;
-
-    switch (wp_type) {
-    case LM32_WP_DISABLED:
-        /* nothing to do */
-        break;
-    case LM32_WP_READ:
-        flags = BP_CPU | BP_STOP_BEFORE_ACCESS | BP_MEM_READ;
-        break;
-    case LM32_WP_WRITE:
-        flags = BP_CPU | BP_STOP_BEFORE_ACCESS | BP_MEM_WRITE;
-        break;
-    case LM32_WP_READ_WRITE:
-        flags = BP_CPU | BP_STOP_BEFORE_ACCESS | BP_MEM_ACCESS;
-        break;
-    }
-
-    if (flags != 0) {
-        cpu_watchpoint_insert(env_cpu(env), address, 1, flags,
-                              &env->cpu_watchpoint[idx]);
-    }
-}
-
-void lm32_watchpoint_remove(CPULM32State *env, int idx)
-{
-    if (!env->cpu_watchpoint[idx]) {
-        return;
-    }
-
-    cpu_watchpoint_remove_by_ref(env_cpu(env), env->cpu_watchpoint[idx]);
-    env->cpu_watchpoint[idx] = NULL;
-}
-
-static bool check_watchpoints(CPULM32State *env)
-{
-    LM32CPU *cpu = env_archcpu(env);
-    int i;
-
-    for (i = 0; i < cpu->num_watchpoints; i++) {
-        if (env->cpu_watchpoint[i] &&
-                env->cpu_watchpoint[i]->flags & BP_WATCHPOINT_HIT) {
-            return true;
-        }
-    }
-    return false;
-}
-
-void lm32_debug_excp_handler(CPUState *cs)
-{
-    LM32CPU *cpu = LM32_CPU(cs);
-    CPULM32State *env = &cpu->env;
-    CPUBreakpoint *bp;
-
-    if (cs->watchpoint_hit) {
-        if (cs->watchpoint_hit->flags & BP_CPU) {
-            cs->watchpoint_hit = NULL;
-            if (check_watchpoints(env)) {
-                raise_exception(env, EXCP_WATCHPOINT);
-            } else {
-                cpu_loop_exit_noexc(cs);
-            }
-        }
-    } else {
-        QTAILQ_FOREACH(bp, &cs->breakpoints, entry) {
-            if (bp->pc == env->pc) {
-                if (bp->flags & BP_CPU) {
-                    raise_exception(env, EXCP_BREAKPOINT);
-                }
-                break;
-            }
-        }
-    }
-}
-
-void lm32_cpu_do_interrupt(CPUState *cs)
-{
-    LM32CPU *cpu = LM32_CPU(cs);
-    CPULM32State *env = &cpu->env;
-
-    qemu_log_mask(CPU_LOG_INT,
-            "exception at pc=%x type=%x\n", env->pc, cs->exception_index);
-
-    switch (cs->exception_index) {
-    case EXCP_SYSTEMCALL:
-        if (unlikely(semihosting_enabled())) {
-            /* do_semicall() returns true if call was handled. Otherwise
-             * do the normal exception handling. */
-            if (lm32_cpu_do_semihosting(cs)) {
-                env->pc += 4;
-                break;
-            }
-        }
-        /* fall through */
-    case EXCP_INSN_BUS_ERROR:
-    case EXCP_DATA_BUS_ERROR:
-    case EXCP_DIVIDE_BY_ZERO:
-    case EXCP_IRQ:
-        /* non-debug exceptions */
-        env->regs[R_EA] = env->pc;
-        env->ie |= (env->ie & IE_IE) ? IE_EIE : 0;
-        env->ie &= ~IE_IE;
-        if (env->dc & DC_RE) {
-            env->pc = env->deba + (cs->exception_index * 32);
-        } else {
-            env->pc = env->eba + (cs->exception_index * 32);
-        }
-        log_cpu_state_mask(CPU_LOG_INT, cs, 0);
-        break;
-    case EXCP_BREAKPOINT:
-    case EXCP_WATCHPOINT:
-        /* debug exceptions */
-        env->regs[R_BA] = env->pc;
-        env->ie |= (env->ie & IE_IE) ? IE_BIE : 0;
-        env->ie &= ~IE_IE;
-        env->pc = env->deba + (cs->exception_index * 32);
-        log_cpu_state_mask(CPU_LOG_INT, cs, 0);
-        break;
-    default:
-        cpu_abort(cs, "unhandled exception type=%d\n",
-                  cs->exception_index);
-        break;
-    }
-}
-
-bool lm32_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
-{
-    LM32CPU *cpu = LM32_CPU(cs);
-    CPULM32State *env = &cpu->env;
-
-    if ((interrupt_request & CPU_INTERRUPT_HARD) && (env->ie & IE_IE)) {
-        cs->exception_index = EXCP_IRQ;
-        lm32_cpu_do_interrupt(cs);
-        return true;
-    }
-    return false;
-}
-
-/* Some soc ignores the MSB on the address bus. Thus creating a shadow memory
- * area. As a general rule, 0x00000000-0x7fffffff is cached, whereas
- * 0x80000000-0xffffffff is not cached and used to access IO devices. */
-void cpu_lm32_set_phys_msb_ignore(CPULM32State *env, int value)
-{
-    if (value) {
-        env->flags |= LM32_FLAG_IGNORE_MSB;
-    } else {
-        env->flags &= ~LM32_FLAG_IGNORE_MSB;
-    }
-}
diff --git a/target/lm32/lm32-semi.c b/target/lm32/lm32-semi.c
deleted file mode 100644
index 661a770249..0000000000
--- a/target/lm32/lm32-semi.c
+++ /dev/null
@@ -1,211 +0,0 @@
-/*
- *  Lattice Mico32 semihosting syscall interface
- *
- *  Copyright (c) 2014 Michael Walle <michael@walle.cc>
- *
- * Based on target/m68k/m68k-semi.c, which is
- *  Copyright (c) 2005-2007 CodeSourcery.
- *
- * This work is licensed under the terms of the GNU GPL, version 2 or later.
- * See the COPYING file in the top-level directory.
- */
-
-#include "qemu/osdep.h"
-#include "cpu.h"
-#include "exec/helper-proto.h"
-#include "exec/softmmu-semi.h"
-
-enum {
-    TARGET_SYS_exit    = 1,
-    TARGET_SYS_open    = 2,
-    TARGET_SYS_close   = 3,
-    TARGET_SYS_read    = 4,
-    TARGET_SYS_write   = 5,
-    TARGET_SYS_lseek   = 6,
-    TARGET_SYS_fstat   = 10,
-    TARGET_SYS_stat    = 15,
-};
-
-enum {
-    NEWLIB_O_RDONLY    =   0x0,
-    NEWLIB_O_WRONLY    =   0x1,
-    NEWLIB_O_RDWR      =   0x2,
-    NEWLIB_O_APPEND    =   0x8,
-    NEWLIB_O_CREAT     = 0x200,
-    NEWLIB_O_TRUNC     = 0x400,
-    NEWLIB_O_EXCL      = 0x800,
-};
-
-static int translate_openflags(int flags)
-{
-    int hf;
-
-    if (flags & NEWLIB_O_WRONLY) {
-        hf = O_WRONLY;
-    } else if (flags & NEWLIB_O_RDWR) {
-        hf = O_RDWR;
-    } else {
-        hf = O_RDONLY;
-    }
-
-    if (flags & NEWLIB_O_APPEND) {
-        hf |= O_APPEND;
-    }
-
-    if (flags & NEWLIB_O_CREAT) {
-        hf |= O_CREAT;
-    }
-
-    if (flags & NEWLIB_O_TRUNC) {
-        hf |= O_TRUNC;
-    }
-
-    if (flags & NEWLIB_O_EXCL) {
-        hf |= O_EXCL;
-    }
-
-    return hf;
-}
-
-struct newlib_stat {
-    int16_t     newlib_st_dev;     /* device */
-    uint16_t    newlib_st_ino;     /* inode */
-    uint16_t    newlib_st_mode;    /* protection */
-    uint16_t    newlib_st_nlink;   /* number of hard links */
-    uint16_t    newlib_st_uid;     /* user ID of owner */
-    uint16_t    newlib_st_gid;     /* group ID of owner */
-    int16_t     newlib_st_rdev;    /* device type (if inode device) */
-    int32_t     newlib_st_size;    /* total size, in bytes */
-    int32_t     newlib_st_atime;   /* time of last access */
-    uint32_t    newlib_st_spare1;
-    int32_t     newlib_st_mtime;   /* time of last modification */
-    uint32_t    newlib_st_spare2;
-    int32_t     newlib_st_ctime;   /* time of last change */
-    uint32_t    newlib_st_spare3;
-} QEMU_PACKED;
-
-static int translate_stat(CPULM32State *env, target_ulong addr,
-        struct stat *s)
-{
-    struct newlib_stat *p;
-
-    p = lock_user(VERIFY_WRITE, addr, sizeof(struct newlib_stat), 0);
-    if (!p) {
-        return 0;
-    }
-    p->newlib_st_dev = cpu_to_be16(s->st_dev);
-    p->newlib_st_ino = cpu_to_be16(s->st_ino);
-    p->newlib_st_mode = cpu_to_be16(s->st_mode);
-    p->newlib_st_nlink = cpu_to_be16(s->st_nlink);
-    p->newlib_st_uid = cpu_to_be16(s->st_uid);
-    p->newlib_st_gid = cpu_to_be16(s->st_gid);
-    p->newlib_st_rdev = cpu_to_be16(s->st_rdev);
-    p->newlib_st_size = cpu_to_be32(s->st_size);
-    p->newlib_st_atime = cpu_to_be32(s->st_atime);
-    p->newlib_st_mtime = cpu_to_be32(s->st_mtime);
-    p->newlib_st_ctime = cpu_to_be32(s->st_ctime);
-    unlock_user(p, addr, sizeof(struct newlib_stat));
-
-    return 1;
-}
-
-bool lm32_cpu_do_semihosting(CPUState *cs)
-{
-    LM32CPU *cpu = LM32_CPU(cs);
-    CPULM32State *env = &cpu->env;
-
-    int ret = -1;
-    target_ulong nr, arg0, arg1, arg2;
-    void *p;
-    struct stat s;
-
-    nr = env->regs[R_R8];
-    arg0 = env->regs[R_R1];
-    arg1 = env->regs[R_R2];
-    arg2 = env->regs[R_R3];
-
-    switch (nr) {
-    case TARGET_SYS_exit:
-        /* void _exit(int rc) */
-        exit(arg0);
-
-    case TARGET_SYS_open:
-        /* int open(const char *pathname, int flags) */
-        p = lock_user_string(arg0);
-        if (!p) {
-            ret = -1;
-        } else {
-            ret = open(p, translate_openflags(arg2));
-            unlock_user(p, arg0, 0);
-        }
-        break;
-
-    case TARGET_SYS_read:
-        /* ssize_t read(int fd, const void *buf, size_t count) */
-        p = lock_user(VERIFY_WRITE, arg1, arg2, 0);
-        if (!p) {
-            ret = -1;
-        } else {
-            ret = read(arg0, p, arg2);
-            unlock_user(p, arg1, arg2);
-        }
-        break;
-
-    case TARGET_SYS_write:
-        /* ssize_t write(int fd, const void *buf, size_t count) */
-        p = lock_user(VERIFY_READ, arg1, arg2, 1);
-        if (!p) {
-            ret = -1;
-        } else {
-            ret = write(arg0, p, arg2);
-            unlock_user(p, arg1, 0);
-        }
-        break;
-
-    case TARGET_SYS_close:
-        /* int close(int fd) */
-        /* don't close stdin/stdout/stderr */
-        if (arg0 > 2) {
-            ret = close(arg0);
-        } else {
-            ret = 0;
-        }
-        break;
-
-    case TARGET_SYS_lseek:
-        /* off_t lseek(int fd, off_t offset, int whence */
-        ret = lseek(arg0, arg1, arg2);
-        break;
-
-    case TARGET_SYS_stat:
-        /* int stat(const char *path, struct stat *buf) */
-        p = lock_user_string(arg0);
-        if (!p) {
-            ret = -1;
-        } else {
-            ret = stat(p, &s);
-            unlock_user(p, arg0, 0);
-            if (translate_stat(env, arg1, &s) == 0) {
-                ret = -1;
-            }
-        }
-        break;
-
-    case TARGET_SYS_fstat:
-        /* int stat(int fd, struct stat *buf) */
-        ret = fstat(arg0, &s);
-        if (ret == 0) {
-            if (translate_stat(env, arg1, &s) == 0) {
-                ret = -1;
-            }
-        }
-        break;
-
-    default:
-        /* unhandled */
-        return false;
-    }
-
-    env->regs[R_R1] = ret;
-    return true;
-}
diff --git a/target/lm32/machine.c b/target/lm32/machine.c
deleted file mode 100644
index 365eaa2e47..0000000000
--- a/target/lm32/machine.c
+++ /dev/null
@@ -1,33 +0,0 @@
-#include "qemu/osdep.h"
-#include "cpu.h"
-#include "migration/cpu.h"
-
-static const VMStateDescription vmstate_env = {
-    .name = "env",
-    .version_id = 1,
-    .minimum_version_id = 1,
-    .fields = (VMStateField[]) {
-        VMSTATE_UINT32_ARRAY(regs, CPULM32State, 32),
-        VMSTATE_UINT32(pc, CPULM32State),
-        VMSTATE_UINT32(ie, CPULM32State),
-        VMSTATE_UINT32(icc, CPULM32State),
-        VMSTATE_UINT32(dcc, CPULM32State),
-        VMSTATE_UINT32(cc, CPULM32State),
-        VMSTATE_UINT32(eba, CPULM32State),
-        VMSTATE_UINT32(dc, CPULM32State),
-        VMSTATE_UINT32(deba, CPULM32State),
-        VMSTATE_UINT32_ARRAY(bp, CPULM32State, 4),
-        VMSTATE_UINT32_ARRAY(wp, CPULM32State, 4),
-        VMSTATE_END_OF_LIST()
-    }
-};
-
-const VMStateDescription vmstate_lm32_cpu = {
-    .name = "cpu",
-    .version_id = 1,
-    .minimum_version_id = 1,
-    .fields = (VMStateField[]) {
-        VMSTATE_STRUCT(env, LM32CPU, 1, vmstate_env, CPULM32State),
-        VMSTATE_END_OF_LIST()
-    }
-};
diff --git a/target/lm32/op_helper.c b/target/lm32/op_helper.c
deleted file mode 100644
index e39fcd5647..0000000000
--- a/target/lm32/op_helper.c
+++ /dev/null
@@ -1,148 +0,0 @@
-#include "qemu/osdep.h"
-#include "cpu.h"
-#include "exec/helper-proto.h"
-#include "qemu/host-utils.h"
-#include "qemu/main-loop.h"
-#include "sysemu/runstate.h"
-
-#include "hw/lm32/lm32_pic.h"
-#include "hw/char/lm32_juart.h"
-
-#include "exec/exec-all.h"
-#include "exec/cpu_ldst.h"
-
-#ifndef CONFIG_USER_ONLY
-#endif
-
-#if !defined(CONFIG_USER_ONLY)
-void raise_exception(CPULM32State *env, int index)
-{
-    CPUState *cs = env_cpu(env);
-
-    cs->exception_index = index;
-    cpu_loop_exit(cs);
-}
-
-void HELPER(raise_exception)(CPULM32State *env, uint32_t index)
-{
-    raise_exception(env, index);
-}
-
-void HELPER(hlt)(CPULM32State *env)
-{
-    CPUState *cs = env_cpu(env);
-
-    cs->halted = 1;
-    cs->exception_index = EXCP_HLT;
-    cpu_loop_exit(cs);
-}
-
-void HELPER(ill)(CPULM32State *env)
-{
-#ifndef CONFIG_USER_ONLY
-    CPUState *cs = env_cpu(env);
-    fprintf(stderr, "VM paused due to illegal instruction. "
-            "Connect a debugger or switch to the monitor console "
-            "to find out more.\n");
-    vm_stop(RUN_STATE_PAUSED);
-    cs->halted = 1;
-    raise_exception(env, EXCP_HALTED);
-#endif
-}
-
-void HELPER(wcsr_bp)(CPULM32State *env, uint32_t bp, uint32_t idx)
-{
-    uint32_t addr = bp & ~1;
-
-    assert(idx < 4);
-
-    env->bp[idx] = bp;
-    lm32_breakpoint_remove(env, idx);
-    if (bp & 1) {
-        lm32_breakpoint_insert(env, idx, addr);
-    }
-}
-
-void HELPER(wcsr_wp)(CPULM32State *env, uint32_t wp, uint32_t idx)
-{
-    lm32_wp_t wp_type;
-
-    assert(idx < 4);
-
-    env->wp[idx] = wp;
-
-    wp_type = lm32_wp_type(env->dc, idx);
-    lm32_watchpoint_remove(env, idx);
-    if (wp_type != LM32_WP_DISABLED) {
-        lm32_watchpoint_insert(env, idx, wp, wp_type);
-    }
-}
-
-void HELPER(wcsr_dc)(CPULM32State *env, uint32_t dc)
-{
-    uint32_t old_dc;
-    int i;
-    lm32_wp_t old_type;
-    lm32_wp_t new_type;
-
-    old_dc = env->dc;
-    env->dc = dc;
-
-    for (i = 0; i < 4; i++) {
-        old_type = lm32_wp_type(old_dc, i);
-        new_type = lm32_wp_type(dc, i);
-
-        if (old_type != new_type) {
-            lm32_watchpoint_remove(env, i);
-            if (new_type != LM32_WP_DISABLED) {
-                lm32_watchpoint_insert(env, i, env->wp[i], new_type);
-            }
-        }
-    }
-}
-
-void HELPER(wcsr_im)(CPULM32State *env, uint32_t im)
-{
-    qemu_mutex_lock_iothread();
-    lm32_pic_set_im(env->pic_state, im);
-    qemu_mutex_unlock_iothread();
-}
-
-void HELPER(wcsr_ip)(CPULM32State *env, uint32_t im)
-{
-    qemu_mutex_lock_iothread();
-    lm32_pic_set_ip(env->pic_state, im);
-    qemu_mutex_unlock_iothread();
-}
-
-void HELPER(wcsr_jtx)(CPULM32State *env, uint32_t jtx)
-{
-    lm32_juart_set_jtx(env->juart_state, jtx);
-}
-
-void HELPER(wcsr_jrx)(CPULM32State *env, uint32_t jrx)
-{
-    lm32_juart_set_jrx(env->juart_state, jrx);
-}
-
-uint32_t HELPER(rcsr_im)(CPULM32State *env)
-{
-    return lm32_pic_get_im(env->pic_state);
-}
-
-uint32_t HELPER(rcsr_ip)(CPULM32State *env)
-{
-    return lm32_pic_get_ip(env->pic_state);
-}
-
-uint32_t HELPER(rcsr_jtx)(CPULM32State *env)
-{
-    return lm32_juart_get_jtx(env->juart_state);
-}
-
-uint32_t HELPER(rcsr_jrx)(CPULM32State *env)
-{
-    return lm32_juart_get_jrx(env->juart_state);
-}
-#endif
-
diff --git a/target/lm32/translate.c b/target/lm32/translate.c
deleted file mode 100644
index 20c70d03f1..0000000000
--- a/target/lm32/translate.c
+++ /dev/null
@@ -1,1237 +0,0 @@
-/*
- *  LatticeMico32 main translation routines.
- *
- *  Copyright (c) 2010 Michael Walle <michael@walle.cc>
- *
- * This library is free software; you can redistribute it and/or
- * modify it under the terms of the GNU Lesser General Public
- * License as published by the Free Software Foundation; either
- * version 2.1 of the License, or (at your option) any later version.
- *
- * This library is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
- * Lesser General Public License for more details.
- *
- * You should have received a copy of the GNU Lesser General Public
- * License along with this library; if not, see <http://www.gnu.org/licenses/>.
- */
-
-#include "qemu/osdep.h"
-#include "cpu.h"
-#include "disas/disas.h"
-#include "exec/helper-proto.h"
-#include "exec/exec-all.h"
-#include "exec/translator.h"
-#include "tcg/tcg-op.h"
-#include "qemu/qemu-print.h"
-
-#include "exec/cpu_ldst.h"
-#include "hw/lm32/lm32_pic.h"
-
-#include "exec/helper-gen.h"
-
-#include "trace-tcg.h"
-#include "exec/log.h"
-
-
-#define DISAS_LM32 0
-
-#define LOG_DIS(...) \
-    do { \
-        if (DISAS_LM32) { \
-            qemu_log_mask(CPU_LOG_TB_IN_ASM, ## __VA_ARGS__); \
-        } \
-    } while (0)
-
-#define EXTRACT_FIELD(src, start, end) \
-            (((src) >> start) & ((1 << (end - start + 1)) - 1))
-
-#define MEM_INDEX 0
-
-/* is_jmp field values */
-#define DISAS_JUMP    DISAS_TARGET_0 /* only pc was modified dynamically */
-#define DISAS_UPDATE  DISAS_TARGET_1 /* cpu state was modified dynamically */
-#define DISAS_TB_JUMP DISAS_TARGET_2 /* only pc was modified statically */
-
-static TCGv cpu_R[32];
-static TCGv cpu_pc;
-static TCGv cpu_ie;
-static TCGv cpu_icc;
-static TCGv cpu_dcc;
-static TCGv cpu_cc;
-static TCGv cpu_cfg;
-static TCGv cpu_eba;
-static TCGv cpu_dc;
-static TCGv cpu_deba;
-static TCGv cpu_bp[4];
-static TCGv cpu_wp[4];
-
-#include "exec/gen-icount.h"
-
-enum {
-    OP_FMT_RI,
-    OP_FMT_RR,
-    OP_FMT_CR,
-    OP_FMT_I
-};
-
-/* This is the state at translation time.  */
-typedef struct DisasContext {
-    target_ulong pc;
-
-    /* Decoder.  */
-    int format;
-    uint32_t ir;
-    uint8_t opcode;
-    uint8_t r0, r1, r2, csr;
-    uint16_t imm5;
-    uint16_t imm16;
-    uint32_t imm26;
-
-    unsigned int delayed_branch;
-    unsigned int tb_flags, synced_flags; /* tb dependent flags.  */
-    int is_jmp;
-
-    TranslationBlock *tb;
-    int singlestep_enabled;
-
-    uint32_t features;
-    uint8_t num_breakpoints;
-    uint8_t num_watchpoints;
-} DisasContext;
-
-static const char *regnames[] = {
-    "r0", "r1", "r2", "r3", "r4", "r5", "r6", "r7",
-    "r8", "r9", "r10", "r11", "r12", "r13", "r14", "r15",
-    "r16", "r17", "r18", "r19", "r20", "r21", "r22", "r23",
-    "r24", "r25", "r26/gp", "r27/fp", "r28/sp", "r29/ra",
-    "r30/ea", "r31/ba", "bp0", "bp1", "bp2", "bp3", "wp0",
-    "wp1", "wp2", "wp3"
-};
-
-static inline int zero_extend(unsigned int val, int width)
-{
-    return val & ((1 << width) - 1);
-}
-
-static inline int sign_extend(unsigned int val, int width)
-{
-    int sval;
-
-    /* LSL.  */
-    val <<= 32 - width;
-    sval = val;
-    /* ASR.  */
-    sval >>= 32 - width;
-
-    return sval;
-}
-
-static inline void t_gen_raise_exception(DisasContext *dc, uint32_t index)
-{
-    TCGv_i32 tmp = tcg_const_i32(index);
-
-    gen_helper_raise_exception(cpu_env, tmp);
-    tcg_temp_free_i32(tmp);
-}
-
-static inline void t_gen_illegal_insn(DisasContext *dc)
-{
-    tcg_gen_movi_tl(cpu_pc, dc->pc);
-    gen_helper_ill(cpu_env);
-}
-
-static inline bool use_goto_tb(DisasContext *dc, target_ulong dest)
-{
-    if (unlikely(dc->singlestep_enabled)) {
-        return false;
-    }
-
-#ifndef CONFIG_USER_ONLY
-    return (dc->tb->pc & TARGET_PAGE_MASK) == (dest & TARGET_PAGE_MASK);
-#else
-    return true;
-#endif
-}
-
-static void gen_goto_tb(DisasContext *dc, int n, target_ulong dest)
-{
-    if (use_goto_tb(dc, dest)) {
-        tcg_gen_goto_tb(n);
-        tcg_gen_movi_tl(cpu_pc, dest);
-        tcg_gen_exit_tb(dc->tb, n);
-    } else {
-        tcg_gen_movi_tl(cpu_pc, dest);
-        if (dc->singlestep_enabled) {
-            t_gen_raise_exception(dc, EXCP_DEBUG);
-        }
-        tcg_gen_exit_tb(NULL, 0);
-    }
-}
-
-static void dec_add(DisasContext *dc)
-{
-    if (dc->format == OP_FMT_RI) {
-        if (dc->r0 == R_R0) {
-            if (dc->r1 == R_R0 && dc->imm16 == 0) {
-                LOG_DIS("nop\n");
-            } else {
-                LOG_DIS("mvi r%d, %d\n", dc->r1, sign_extend(dc->imm16, 16));
-            }
-        } else {
-            LOG_DIS("addi r%d, r%d, %d\n", dc->r1, dc->r0,
-                    sign_extend(dc->imm16, 16));
-        }
-    } else {
-        LOG_DIS("add r%d, r%d, r%d\n", dc->r2, dc->r0, dc->r1);
-    }
-
-    if (dc->format == OP_FMT_RI) {
-        tcg_gen_addi_tl(cpu_R[dc->r1], cpu_R[dc->r0],
-                sign_extend(dc->imm16, 16));
-    } else {
-        tcg_gen_add_tl(cpu_R[dc->r2], cpu_R[dc->r0], cpu_R[dc->r1]);
-    }
-}
-
-static void dec_and(DisasContext *dc)
-{
-    if (dc->format == OP_FMT_RI) {
-        LOG_DIS("andi r%d, r%d, %d\n", dc->r1, dc->r0,
-                zero_extend(dc->imm16, 16));
-    } else {
-        LOG_DIS("and r%d, r%d, r%d\n", dc->r2, dc->r0, dc->r1);
-    }
-
-    if (dc->format == OP_FMT_RI) {
-        tcg_gen_andi_tl(cpu_R[dc->r1], cpu_R[dc->r0],
-                zero_extend(dc->imm16, 16));
-    } else  {
-        if (dc->r0 == 0 && dc->r1 == 0 && dc->r2 == 0) {
-            tcg_gen_movi_tl(cpu_pc, dc->pc + 4);
-            gen_helper_hlt(cpu_env);
-        } else {
-            tcg_gen_and_tl(cpu_R[dc->r2], cpu_R[dc->r0], cpu_R[dc->r1]);
-        }
-    }
-}
-
-static void dec_andhi(DisasContext *dc)
-{
-    LOG_DIS("andhi r%d, r%d, %d\n", dc->r1, dc->r0, dc->imm16);
-
-    tcg_gen_andi_tl(cpu_R[dc->r1], cpu_R[dc->r0], (dc->imm16 << 16));
-}
-
-static void dec_b(DisasContext *dc)
-{
-    if (dc->r0 == R_RA) {
-        LOG_DIS("ret\n");
-    } else if (dc->r0 == R_EA) {
-        LOG_DIS("eret\n");
-    } else if (dc->r0 == R_BA) {
-        LOG_DIS("bret\n");
-    } else {
-        LOG_DIS("b r%d\n", dc->r0);
-    }
-
-    /* restore IE.IE in case of an eret */
-    if (dc->r0 == R_EA) {
-        TCGv t0 = tcg_temp_new();
-        TCGLabel *l1 = gen_new_label();
-        tcg_gen_andi_tl(t0, cpu_ie, IE_EIE);
-        tcg_gen_ori_tl(cpu_ie, cpu_ie, IE_IE);
-        tcg_gen_brcondi_tl(TCG_COND_EQ, t0, IE_EIE, l1);
-        tcg_gen_andi_tl(cpu_ie, cpu_ie, ~IE_IE);
-        gen_set_label(l1);
-        tcg_temp_free(t0);
-    } else if (dc->r0 == R_BA) {
-        TCGv t0 = tcg_temp_new();
-        TCGLabel *l1 = gen_new_label();
-        tcg_gen_andi_tl(t0, cpu_ie, IE_BIE);
-        tcg_gen_ori_tl(cpu_ie, cpu_ie, IE_IE);
-        tcg_gen_brcondi_tl(TCG_COND_EQ, t0, IE_BIE, l1);
-        tcg_gen_andi_tl(cpu_ie, cpu_ie, ~IE_IE);
-        gen_set_label(l1);
-        tcg_temp_free(t0);
-    }
-    tcg_gen_mov_tl(cpu_pc, cpu_R[dc->r0]);
-
-    dc->is_jmp = DISAS_JUMP;
-}
-
-static void dec_bi(DisasContext *dc)
-{
-    LOG_DIS("bi %d\n", sign_extend(dc->imm26 << 2, 26));
-
-    gen_goto_tb(dc, 0, dc->pc + (sign_extend(dc->imm26 << 2, 26)));
-
-    dc->is_jmp = DISAS_TB_JUMP;
-}
-
-static inline void gen_cond_branch(DisasContext *dc, int cond)
-{
-    TCGLabel *l1 = gen_new_label();
-    tcg_gen_brcond_tl(cond, cpu_R[dc->r0], cpu_R[dc->r1], l1);
-    gen_goto_tb(dc, 0, dc->pc + 4);
-    gen_set_label(l1);
-    gen_goto_tb(dc, 1, dc->pc + (sign_extend(dc->imm16 << 2, 16)));
-    dc->is_jmp = DISAS_TB_JUMP;
-}
-
-static void dec_be(DisasContext *dc)
-{
-    LOG_DIS("be r%d, r%d, %d\n", dc->r1, dc->r0,
-            sign_extend(dc->imm16, 16) * 4);
-
-    gen_cond_branch(dc, TCG_COND_EQ);
-}
-
-static void dec_bg(DisasContext *dc)
-{
-    LOG_DIS("bg r%d, r%d, %d\n", dc->r1, dc->r0,
-            sign_extend(dc->imm16, 16 * 4));
-
-    gen_cond_branch(dc, TCG_COND_GT);
-}
-
-static void dec_bge(DisasContext *dc)
-{
-    LOG_DIS("bge r%d, r%d, %d\n", dc->r1, dc->r0,
-            sign_extend(dc->imm16, 16) * 4);
-
-    gen_cond_branch(dc, TCG_COND_GE);
-}
-
-static void dec_bgeu(DisasContext *dc)
-{
-    LOG_DIS("bgeu r%d, r%d, %d\n", dc->r1, dc->r0,
-            sign_extend(dc->imm16, 16) * 4);
-
-    gen_cond_branch(dc, TCG_COND_GEU);
-}
-
-static void dec_bgu(DisasContext *dc)
-{
-    LOG_DIS("bgu r%d, r%d, %d\n", dc->r1, dc->r0,
-            sign_extend(dc->imm16, 16) * 4);
-
-    gen_cond_branch(dc, TCG_COND_GTU);
-}
-
-static void dec_bne(DisasContext *dc)
-{
-    LOG_DIS("bne r%d, r%d, %d\n", dc->r1, dc->r0,
-            sign_extend(dc->imm16, 16) * 4);
-
-    gen_cond_branch(dc, TCG_COND_NE);
-}
-
-static void dec_call(DisasContext *dc)
-{
-    LOG_DIS("call r%d\n", dc->r0);
-
-    tcg_gen_movi_tl(cpu_R[R_RA], dc->pc + 4);
-    tcg_gen_mov_tl(cpu_pc, cpu_R[dc->r0]);
-
-    dc->is_jmp = DISAS_JUMP;
-}
-
-static void dec_calli(DisasContext *dc)
-{
-    LOG_DIS("calli %d\n", sign_extend(dc->imm26, 26) * 4);
-
-    tcg_gen_movi_tl(cpu_R[R_RA], dc->pc + 4);
-    gen_goto_tb(dc, 0, dc->pc + (sign_extend(dc->imm26 << 2, 26)));
-
-    dc->is_jmp = DISAS_TB_JUMP;
-}
-
-static inline void gen_compare(DisasContext *dc, int cond)
-{
-    int i;
-
-    if (dc->format == OP_FMT_RI) {
-        switch (cond) {
-        case TCG_COND_GEU:
-        case TCG_COND_GTU:
-            i = zero_extend(dc->imm16, 16);
-            break;
-        default:
-            i = sign_extend(dc->imm16, 16);
-            break;
-        }
-
-        tcg_gen_setcondi_tl(cond, cpu_R[dc->r1], cpu_R[dc->r0], i);
-    } else {
-        tcg_gen_setcond_tl(cond, cpu_R[dc->r2], cpu_R[dc->r0], cpu_R[dc->r1]);
-    }
-}
-
-static void dec_cmpe(DisasContext *dc)
-{
-    if (dc->format == OP_FMT_RI) {
-        LOG_DIS("cmpei r%d, r%d, %d\n", dc->r1, dc->r0,
-                sign_extend(dc->imm16, 16));
-    } else {
-        LOG_DIS("cmpe r%d, r%d, r%d\n", dc->r2, dc->r0, dc->r1);
-    }
-
-    gen_compare(dc, TCG_COND_EQ);
-}
-
-static void dec_cmpg(DisasContext *dc)
-{
-    if (dc->format == OP_FMT_RI) {
-        LOG_DIS("cmpgi r%d, r%d, %d\n", dc->r1, dc->r0,
-                sign_extend(dc->imm16, 16));
-    } else {
-        LOG_DIS("cmpg r%d, r%d, r%d\n", dc->r2, dc->r0, dc->r1);
-    }
-
-    gen_compare(dc, TCG_COND_GT);
-}
-
-static void dec_cmpge(DisasContext *dc)
-{
-    if (dc->format == OP_FMT_RI) {
-        LOG_DIS("cmpgei r%d, r%d, %d\n", dc->r1, dc->r0,
-                sign_extend(dc->imm16, 16));
-    } else {
-        LOG_DIS("cmpge r%d, r%d, r%d\n", dc->r2, dc->r0, dc->r1);
-    }
-
-    gen_compare(dc, TCG_COND_GE);
-}
-
-static void dec_cmpgeu(DisasContext *dc)
-{
-    if (dc->format == OP_FMT_RI) {
-        LOG_DIS("cmpgeui r%d, r%d, %d\n", dc->r1, dc->r0,
-                zero_extend(dc->imm16, 16));
-    } else {
-        LOG_DIS("cmpgeu r%d, r%d, r%d\n", dc->r2, dc->r0, dc->r1);
-    }
-
-    gen_compare(dc, TCG_COND_GEU);
-}
-
-static void dec_cmpgu(DisasContext *dc)
-{
-    if (dc->format == OP_FMT_RI) {
-        LOG_DIS("cmpgui r%d, r%d, %d\n", dc->r1, dc->r0,
-                zero_extend(dc->imm16, 16));
-    } else {
-        LOG_DIS("cmpgu r%d, r%d, r%d\n", dc->r2, dc->r0, dc->r1);
-    }
-
-    gen_compare(dc, TCG_COND_GTU);
-}
-
-static void dec_cmpne(DisasContext *dc)
-{
-    if (dc->format == OP_FMT_RI) {
-        LOG_DIS("cmpnei r%d, r%d, %d\n", dc->r1, dc->r0,
-                sign_extend(dc->imm16, 16));
-    } else {
-        LOG_DIS("cmpne r%d, r%d, r%d\n", dc->r2, dc->r0, dc->r1);
-    }
-
-    gen_compare(dc, TCG_COND_NE);
-}
-
-static void dec_divu(DisasContext *dc)
-{
-    TCGLabel *l1;
-
-    LOG_DIS("divu r%d, r%d, r%d\n", dc->r2, dc->r0, dc->r1);
-
-    if (!(dc->features & LM32_FEATURE_DIVIDE)) {
-        qemu_log_mask(LOG_GUEST_ERROR, "hardware divider is not available\n");
-        t_gen_illegal_insn(dc);
-        return;
-    }
-
-    l1 = gen_new_label();
-    tcg_gen_brcondi_tl(TCG_COND_NE, cpu_R[dc->r1], 0, l1);
-    tcg_gen_movi_tl(cpu_pc, dc->pc);
-    t_gen_raise_exception(dc, EXCP_DIVIDE_BY_ZERO);
-    gen_set_label(l1);
-    tcg_gen_divu_tl(cpu_R[dc->r2], cpu_R[dc->r0], cpu_R[dc->r1]);
-}
-
-static void dec_lb(DisasContext *dc)
-{
-    TCGv t0;
-
-    LOG_DIS("lb r%d, (r%d+%d)\n", dc->r1, dc->r0, dc->imm16);
-
-    t0 = tcg_temp_new();
-    tcg_gen_addi_tl(t0, cpu_R[dc->r0], sign_extend(dc->imm16, 16));
-    tcg_gen_qemu_ld8s(cpu_R[dc->r1], t0, MEM_INDEX);
-    tcg_temp_free(t0);
-}
-
-static void dec_lbu(DisasContext *dc)
-{
-    TCGv t0;
-
-    LOG_DIS("lbu r%d, (r%d+%d)\n", dc->r1, dc->r0, dc->imm16);
-
-    t0 = tcg_temp_new();
-    tcg_gen_addi_tl(t0, cpu_R[dc->r0], sign_extend(dc->imm16, 16));
-    tcg_gen_qemu_ld8u(cpu_R[dc->r1], t0, MEM_INDEX);
-    tcg_temp_free(t0);
-}
-
-static void dec_lh(DisasContext *dc)
-{
-    TCGv t0;
-
-    LOG_DIS("lh r%d, (r%d+%d)\n", dc->r1, dc->r0, dc->imm16);
-
-    t0 = tcg_temp_new();
-    tcg_gen_addi_tl(t0, cpu_R[dc->r0], sign_extend(dc->imm16, 16));
-    tcg_gen_qemu_ld16s(cpu_R[dc->r1], t0, MEM_INDEX);
-    tcg_temp_free(t0);
-}
-
-static void dec_lhu(DisasContext *dc)
-{
-    TCGv t0;
-
-    LOG_DIS("lhu r%d, (r%d+%d)\n", dc->r1, dc->r0, dc->imm16);
-
-    t0 = tcg_temp_new();
-    tcg_gen_addi_tl(t0, cpu_R[dc->r0], sign_extend(dc->imm16, 16));
-    tcg_gen_qemu_ld16u(cpu_R[dc->r1], t0, MEM_INDEX);
-    tcg_temp_free(t0);
-}
-
-static void dec_lw(DisasContext *dc)
-{
-    TCGv t0;
-
-    LOG_DIS("lw r%d, (r%d+%d)\n", dc->r1, dc->r0, sign_extend(dc->imm16, 16));
-
-    t0 = tcg_temp_new();
-    tcg_gen_addi_tl(t0, cpu_R[dc->r0], sign_extend(dc->imm16, 16));
-    tcg_gen_qemu_ld32s(cpu_R[dc->r1], t0, MEM_INDEX);
-    tcg_temp_free(t0);
-}
-
-static void dec_modu(DisasContext *dc)
-{
-    TCGLabel *l1;
-
-    LOG_DIS("modu r%d, r%d, %d\n", dc->r2, dc->r0, dc->r1);
-
-    if (!(dc->features & LM32_FEATURE_DIVIDE)) {
-        qemu_log_mask(LOG_GUEST_ERROR, "hardware divider is not available\n");
-        t_gen_illegal_insn(dc);
-        return;
-    }
-
-    l1 = gen_new_label();
-    tcg_gen_brcondi_tl(TCG_COND_NE, cpu_R[dc->r1], 0, l1);
-    tcg_gen_movi_tl(cpu_pc, dc->pc);
-    t_gen_raise_exception(dc, EXCP_DIVIDE_BY_ZERO);
-    gen_set_label(l1);
-    tcg_gen_remu_tl(cpu_R[dc->r2], cpu_R[dc->r0], cpu_R[dc->r1]);
-}
-
-static void dec_mul(DisasContext *dc)
-{
-    if (dc->format == OP_FMT_RI) {
-        LOG_DIS("muli r%d, r%d, %d\n", dc->r1, dc->r0,
-                sign_extend(dc->imm16, 16));
-    } else {
-        LOG_DIS("mul r%d, r%d, r%d\n", dc->r2, dc->r0, dc->r1);
-    }
-
-    if (!(dc->features & LM32_FEATURE_MULTIPLY)) {
-        qemu_log_mask(LOG_GUEST_ERROR,
-                      "hardware multiplier is not available\n");
-        t_gen_illegal_insn(dc);
-        return;
-    }
-
-    if (dc->format == OP_FMT_RI) {
-        tcg_gen_muli_tl(cpu_R[dc->r1], cpu_R[dc->r0],
-                sign_extend(dc->imm16, 16));
-    } else {
-        tcg_gen_mul_tl(cpu_R[dc->r2], cpu_R[dc->r0], cpu_R[dc->r1]);
-    }
-}
-
-static void dec_nor(DisasContext *dc)
-{
-    if (dc->format == OP_FMT_RI) {
-        LOG_DIS("nori r%d, r%d, %d\n", dc->r1, dc->r0,
-                zero_extend(dc->imm16, 16));
-    } else {
-        LOG_DIS("nor r%d, r%d, r%d\n", dc->r2, dc->r0, dc->r1);
-    }
-
-    if (dc->format == OP_FMT_RI) {
-        TCGv t0 = tcg_temp_new();
-        tcg_gen_movi_tl(t0, zero_extend(dc->imm16, 16));
-        tcg_gen_nor_tl(cpu_R[dc->r1], cpu_R[dc->r0], t0);
-        tcg_temp_free(t0);
-    } else {
-        tcg_gen_nor_tl(cpu_R[dc->r2], cpu_R[dc->r0], cpu_R[dc->r1]);
-    }
-}
-
-static void dec_or(DisasContext *dc)
-{
-    if (dc->format == OP_FMT_RI) {
-        LOG_DIS("ori r%d, r%d, %d\n", dc->r1, dc->r0,
-                zero_extend(dc->imm16, 16));
-    } else {
-        if (dc->r1 == R_R0) {
-            LOG_DIS("mv r%d, r%d\n", dc->r2, dc->r0);
-        } else {
-            LOG_DIS("or r%d, r%d, r%d\n", dc->r2, dc->r0, dc->r1);
-        }
-    }
-
-    if (dc->format == OP_FMT_RI) {
-        tcg_gen_ori_tl(cpu_R[dc->r1], cpu_R[dc->r0],
-                zero_extend(dc->imm16, 16));
-    } else {
-        tcg_gen_or_tl(cpu_R[dc->r2], cpu_R[dc->r0], cpu_R[dc->r1]);
-    }
-}
-
-static void dec_orhi(DisasContext *dc)
-{
-    if (dc->r0 == R_R0) {
-        LOG_DIS("mvhi r%d, %d\n", dc->r1, dc->imm16);
-    } else {
-        LOG_DIS("orhi r%d, r%d, %d\n", dc->r1, dc->r0, dc->imm16);
-    }
-
-    tcg_gen_ori_tl(cpu_R[dc->r1], cpu_R[dc->r0], (dc->imm16 << 16));
-}
-
-static void dec_scall(DisasContext *dc)
-{
-    switch (dc->imm5) {
-    case 2:
-        LOG_DIS("break\n");
-        tcg_gen_movi_tl(cpu_pc, dc->pc);
-        t_gen_raise_exception(dc, EXCP_BREAKPOINT);
-        break;
-    case 7:
-        LOG_DIS("scall\n");
-        tcg_gen_movi_tl(cpu_pc, dc->pc);
-        t_gen_raise_exception(dc, EXCP_SYSTEMCALL);
-        break;
-    default:
-        qemu_log_mask(LOG_GUEST_ERROR, "invalid opcode @0x%x", dc->pc);
-        t_gen_illegal_insn(dc);
-        break;
-    }
-}
-
-static void dec_rcsr(DisasContext *dc)
-{
-    LOG_DIS("rcsr r%d, %d\n", dc->r2, dc->csr);
-
-    switch (dc->csr) {
-    case CSR_IE:
-        tcg_gen_mov_tl(cpu_R[dc->r2], cpu_ie);
-        break;
-    case CSR_IM:
-        gen_helper_rcsr_im(cpu_R[dc->r2], cpu_env);
-        break;
-    case CSR_IP:
-        gen_helper_rcsr_ip(cpu_R[dc->r2], cpu_env);
-        break;
-    case CSR_CC:
-        tcg_gen_mov_tl(cpu_R[dc->r2], cpu_cc);
-        break;
-    case CSR_CFG:
-        tcg_gen_mov_tl(cpu_R[dc->r2], cpu_cfg);
-        break;
-    case CSR_EBA:
-        tcg_gen_mov_tl(cpu_R[dc->r2], cpu_eba);
-        break;
-    case CSR_DC:
-        tcg_gen_mov_tl(cpu_R[dc->r2], cpu_dc);
-        break;
-    case CSR_DEBA:
-        tcg_gen_mov_tl(cpu_R[dc->r2], cpu_deba);
-        break;
-    case CSR_JTX:
-        gen_helper_rcsr_jtx(cpu_R[dc->r2], cpu_env);
-        break;
-    case CSR_JRX:
-        gen_helper_rcsr_jrx(cpu_R[dc->r2], cpu_env);
-        break;
-    case CSR_ICC:
-    case CSR_DCC:
-    case CSR_BP0:
-    case CSR_BP1:
-    case CSR_BP2:
-    case CSR_BP3:
-    case CSR_WP0:
-    case CSR_WP1:
-    case CSR_WP2:
-    case CSR_WP3:
-        qemu_log_mask(LOG_GUEST_ERROR, "invalid read access csr=%x\n", dc->csr);
-        break;
-    default:
-        qemu_log_mask(LOG_GUEST_ERROR, "read_csr: unknown csr=%x\n", dc->csr);
-        break;
-    }
-}
-
-static void dec_sb(DisasContext *dc)
-{
-    TCGv t0;
-
-    LOG_DIS("sb (r%d+%d), r%d\n", dc->r0, dc->imm16, dc->r1);
-
-    t0 = tcg_temp_new();
-    tcg_gen_addi_tl(t0, cpu_R[dc->r0], sign_extend(dc->imm16, 16));
-    tcg_gen_qemu_st8(cpu_R[dc->r1], t0, MEM_INDEX);
-    tcg_temp_free(t0);
-}
-
-static void dec_sextb(DisasContext *dc)
-{
-    LOG_DIS("sextb r%d, r%d\n", dc->r2, dc->r0);
-
-    if (!(dc->features & LM32_FEATURE_SIGN_EXTEND)) {
-        qemu_log_mask(LOG_GUEST_ERROR,
-                      "hardware sign extender is not available\n");
-        t_gen_illegal_insn(dc);
-        return;
-    }
-
-    tcg_gen_ext8s_tl(cpu_R[dc->r2], cpu_R[dc->r0]);
-}
-
-static void dec_sexth(DisasContext *dc)
-{
-    LOG_DIS("sexth r%d, r%d\n", dc->r2, dc->r0);
-
-    if (!(dc->features & LM32_FEATURE_SIGN_EXTEND)) {
-        qemu_log_mask(LOG_GUEST_ERROR,
-                      "hardware sign extender is not available\n");
-        t_gen_illegal_insn(dc);
-        return;
-    }
-
-    tcg_gen_ext16s_tl(cpu_R[dc->r2], cpu_R[dc->r0]);
-}
-
-static void dec_sh(DisasContext *dc)
-{
-    TCGv t0;
-
-    LOG_DIS("sh (r%d+%d), r%d\n", dc->r0, dc->imm16, dc->r1);
-
-    t0 = tcg_temp_new();
-    tcg_gen_addi_tl(t0, cpu_R[dc->r0], sign_extend(dc->imm16, 16));
-    tcg_gen_qemu_st16(cpu_R[dc->r1], t0, MEM_INDEX);
-    tcg_temp_free(t0);
-}
-
-static void dec_sl(DisasContext *dc)
-{
-    if (dc->format == OP_FMT_RI) {
-        LOG_DIS("sli r%d, r%d, %d\n", dc->r1, dc->r0, dc->imm5);
-    } else {
-        LOG_DIS("sl r%d, r%d, r%d\n", dc->r2, dc->r0, dc->r1);
-    }
-
-    if (!(dc->features & LM32_FEATURE_SHIFT)) {
-        qemu_log_mask(LOG_GUEST_ERROR, "hardware shifter is not available\n");
-        t_gen_illegal_insn(dc);
-        return;
-    }
-
-    if (dc->format == OP_FMT_RI) {
-        tcg_gen_shli_tl(cpu_R[dc->r1], cpu_R[dc->r0], dc->imm5);
-    } else {
-        TCGv t0 = tcg_temp_new();
-        tcg_gen_andi_tl(t0, cpu_R[dc->r1], 0x1f);
-        tcg_gen_shl_tl(cpu_R[dc->r2], cpu_R[dc->r0], t0);
-        tcg_temp_free(t0);
-    }
-}
-
-static void dec_sr(DisasContext *dc)
-{
-    if (dc->format == OP_FMT_RI) {
-        LOG_DIS("sri r%d, r%d, %d\n", dc->r1, dc->r0, dc->imm5);
-    } else {
-        LOG_DIS("sr r%d, r%d, r%d\n", dc->r2, dc->r0, dc->r1);
-    }
-
-    /* The real CPU (w/o hardware shifter) only supports right shift by exactly
-     * one bit */
-    if (dc->format == OP_FMT_RI) {
-        if (!(dc->features & LM32_FEATURE_SHIFT) && (dc->imm5 != 1)) {
-            qemu_log_mask(LOG_GUEST_ERROR,
-                    "hardware shifter is not available\n");
-            t_gen_illegal_insn(dc);
-            return;
-        }
-        tcg_gen_sari_tl(cpu_R[dc->r1], cpu_R[dc->r0], dc->imm5);
-    } else {
-        TCGLabel *l1 = gen_new_label();
-        TCGLabel *l2 = gen_new_label();
-        TCGv t0 = tcg_temp_local_new();
-        tcg_gen_andi_tl(t0, cpu_R[dc->r1], 0x1f);
-
-        if (!(dc->features & LM32_FEATURE_SHIFT)) {
-            tcg_gen_brcondi_tl(TCG_COND_EQ, t0, 1, l1);
-            t_gen_illegal_insn(dc);
-            tcg_gen_br(l2);
-        }
-
-        gen_set_label(l1);
-        tcg_gen_sar_tl(cpu_R[dc->r2], cpu_R[dc->r0], t0);
-        gen_set_label(l2);
-
-        tcg_temp_free(t0);
-    }
-}
-
-static void dec_sru(DisasContext *dc)
-{
-    if (dc->format == OP_FMT_RI) {
-        LOG_DIS("srui r%d, r%d, %d\n", dc->r1, dc->r0, dc->imm5);
-    } else {
-        LOG_DIS("sru r%d, r%d, r%d\n", dc->r2, dc->r0, dc->r1);
-    }
-
-    if (dc->format == OP_FMT_RI) {
-        if (!(dc->features & LM32_FEATURE_SHIFT) && (dc->imm5 != 1)) {
-            qemu_log_mask(LOG_GUEST_ERROR,
-                    "hardware shifter is not available\n");
-            t_gen_illegal_insn(dc);
-            return;
-        }
-        tcg_gen_shri_tl(cpu_R[dc->r1], cpu_R[dc->r0], dc->imm5);
-    } else {
-        TCGLabel *l1 = gen_new_label();
-        TCGLabel *l2 = gen_new_label();
-        TCGv t0 = tcg_temp_local_new();
-        tcg_gen_andi_tl(t0, cpu_R[dc->r1], 0x1f);
-
-        if (!(dc->features & LM32_FEATURE_SHIFT)) {
-            tcg_gen_brcondi_tl(TCG_COND_EQ, t0, 1, l1);
-            t_gen_illegal_insn(dc);
-            tcg_gen_br(l2);
-        }
-
-        gen_set_label(l1);
-        tcg_gen_shr_tl(cpu_R[dc->r2], cpu_R[dc->r0], t0);
-        gen_set_label(l2);
-
-        tcg_temp_free(t0);
-    }
-}
-
-static void dec_sub(DisasContext *dc)
-{
-    LOG_DIS("sub r%d, r%d, r%d\n", dc->r2, dc->r0, dc->r1);
-
-    tcg_gen_sub_tl(cpu_R[dc->r2], cpu_R[dc->r0], cpu_R[dc->r1]);
-}
-
-static void dec_sw(DisasContext *dc)
-{
-    TCGv t0;
-
-    LOG_DIS("sw (r%d+%d), r%d\n", dc->r0, sign_extend(dc->imm16, 16), dc->r1);
-
-    t0 = tcg_temp_new();
-    tcg_gen_addi_tl(t0, cpu_R[dc->r0], sign_extend(dc->imm16, 16));
-    tcg_gen_qemu_st32(cpu_R[dc->r1], t0, MEM_INDEX);
-    tcg_temp_free(t0);
-}
-
-static void dec_user(DisasContext *dc)
-{
-    LOG_DIS("user");
-
-    qemu_log_mask(LOG_GUEST_ERROR, "user instruction undefined\n");
-    t_gen_illegal_insn(dc);
-}
-
-static void dec_wcsr(DisasContext *dc)
-{
-    int no;
-
-    LOG_DIS("wcsr %d, r%d\n", dc->csr, dc->r1);
-
-    switch (dc->csr) {
-    case CSR_IE:
-        tcg_gen_mov_tl(cpu_ie, cpu_R[dc->r1]);
-        tcg_gen_movi_tl(cpu_pc, dc->pc + 4);
-        dc->is_jmp = DISAS_UPDATE;
-        break;
-    case CSR_IM:
-        /* mark as an io operation because it could cause an interrupt */
-        if (tb_cflags(dc->tb) & CF_USE_ICOUNT) {
-            gen_io_start();
-        }
-        gen_helper_wcsr_im(cpu_env, cpu_R[dc->r1]);
-        tcg_gen_movi_tl(cpu_pc, dc->pc + 4);
-        dc->is_jmp = DISAS_UPDATE;
-        break;
-    case CSR_IP:
-        /* mark as an io operation because it could cause an interrupt */
-        if (tb_cflags(dc->tb) & CF_USE_ICOUNT) {
-            gen_io_start();
-        }
-        gen_helper_wcsr_ip(cpu_env, cpu_R[dc->r1]);
-        tcg_gen_movi_tl(cpu_pc, dc->pc + 4);
-        dc->is_jmp = DISAS_UPDATE;
-        break;
-    case CSR_ICC:
-        /* TODO */
-        break;
-    case CSR_DCC:
-        /* TODO */
-        break;
-    case CSR_EBA:
-        tcg_gen_mov_tl(cpu_eba, cpu_R[dc->r1]);
-        break;
-    case CSR_DEBA:
-        tcg_gen_mov_tl(cpu_deba, cpu_R[dc->r1]);
-        break;
-    case CSR_JTX:
-        gen_helper_wcsr_jtx(cpu_env, cpu_R[dc->r1]);
-        break;
-    case CSR_JRX:
-        gen_helper_wcsr_jrx(cpu_env, cpu_R[dc->r1]);
-        break;
-    case CSR_DC:
-        gen_helper_wcsr_dc(cpu_env, cpu_R[dc->r1]);
-        break;
-    case CSR_BP0:
-    case CSR_BP1:
-    case CSR_BP2:
-    case CSR_BP3:
-        no = dc->csr - CSR_BP0;
-        if (dc->num_breakpoints <= no) {
-            qemu_log_mask(LOG_GUEST_ERROR,
-                          "breakpoint #%i is not available\n", no);
-            t_gen_illegal_insn(dc);
-            break;
-        }
-        gen_helper_wcsr_bp(cpu_env, cpu_R[dc->r1], tcg_const_i32(no));
-        break;
-    case CSR_WP0:
-    case CSR_WP1:
-    case CSR_WP2:
-    case CSR_WP3:
-        no = dc->csr - CSR_WP0;
-        if (dc->num_watchpoints <= no) {
-            qemu_log_mask(LOG_GUEST_ERROR,
-                          "watchpoint #%i is not available\n", no);
-            t_gen_illegal_insn(dc);
-            break;
-        }
-        gen_helper_wcsr_wp(cpu_env, cpu_R[dc->r1], tcg_const_i32(no));
-        break;
-    case CSR_CC:
-    case CSR_CFG:
-        qemu_log_mask(LOG_GUEST_ERROR, "invalid write access csr=%x\n",
-                      dc->csr);
-        break;
-    default:
-        qemu_log_mask(LOG_GUEST_ERROR, "write_csr: unknown csr=%x\n",
-                      dc->csr);
-        break;
-    }
-}
-
-static void dec_xnor(DisasContext *dc)
-{
-    if (dc->format == OP_FMT_RI) {
-        LOG_DIS("xnori r%d, r%d, %d\n", dc->r1, dc->r0,
-                zero_extend(dc->imm16, 16));
-    } else {
-        if (dc->r1 == R_R0) {
-            LOG_DIS("not r%d, r%d\n", dc->r2, dc->r0);
-        } else {
-            LOG_DIS("xnor r%d, r%d, r%d\n", dc->r2, dc->r0, dc->r1);
-        }
-    }
-
-    if (dc->format == OP_FMT_RI) {
-        tcg_gen_xori_tl(cpu_R[dc->r1], cpu_R[dc->r0],
-                zero_extend(dc->imm16, 16));
-        tcg_gen_not_tl(cpu_R[dc->r1], cpu_R[dc->r1]);
-    } else {
-        tcg_gen_eqv_tl(cpu_R[dc->r2], cpu_R[dc->r0], cpu_R[dc->r1]);
-    }
-}
-
-static void dec_xor(DisasContext *dc)
-{
-    if (dc->format == OP_FMT_RI) {
-        LOG_DIS("xori r%d, r%d, %d\n", dc->r1, dc->r0,
-                zero_extend(dc->imm16, 16));
-    } else {
-        LOG_DIS("xor r%d, r%d, r%d\n", dc->r2, dc->r0, dc->r1);
-    }
-
-    if (dc->format == OP_FMT_RI) {
-        tcg_gen_xori_tl(cpu_R[dc->r1], cpu_R[dc->r0],
-                zero_extend(dc->imm16, 16));
-    } else {
-        tcg_gen_xor_tl(cpu_R[dc->r2], cpu_R[dc->r0], cpu_R[dc->r1]);
-    }
-}
-
-static void dec_ill(DisasContext *dc)
-{
-    qemu_log_mask(LOG_GUEST_ERROR, "invalid opcode 0x%02x\n", dc->opcode);
-    t_gen_illegal_insn(dc);
-}
-
-typedef void (*DecoderInfo)(DisasContext *dc);
-static const DecoderInfo decinfo[] = {
-    dec_sru, dec_nor, dec_mul, dec_sh, dec_lb, dec_sr, dec_xor, dec_lh,
-    dec_and, dec_xnor, dec_lw, dec_lhu, dec_sb, dec_add, dec_or, dec_sl,
-    dec_lbu, dec_be, dec_bg, dec_bge, dec_bgeu, dec_bgu, dec_sw, dec_bne,
-    dec_andhi, dec_cmpe, dec_cmpg, dec_cmpge, dec_cmpgeu, dec_cmpgu, dec_orhi,
-    dec_cmpne,
-    dec_sru, dec_nor, dec_mul, dec_divu, dec_rcsr, dec_sr, dec_xor, dec_ill,
-    dec_and, dec_xnor, dec_ill, dec_scall, dec_sextb, dec_add, dec_or, dec_sl,
-    dec_b, dec_modu, dec_sub, dec_user, dec_wcsr, dec_ill, dec_call, dec_sexth,
-    dec_bi, dec_cmpe, dec_cmpg, dec_cmpge, dec_cmpgeu, dec_cmpgu, dec_calli,
-    dec_cmpne
-};
-
-static inline void decode(DisasContext *dc, uint32_t ir)
-{
-    dc->ir = ir;
-    LOG_DIS("%8.8x\t", dc->ir);
-
-    dc->opcode = EXTRACT_FIELD(ir, 26, 31);
-
-    dc->imm5 = EXTRACT_FIELD(ir, 0, 4);
-    dc->imm16 = EXTRACT_FIELD(ir, 0, 15);
-    dc->imm26 = EXTRACT_FIELD(ir, 0, 25);
-
-    dc->csr = EXTRACT_FIELD(ir, 21, 25);
-    dc->r0 = EXTRACT_FIELD(ir, 21, 25);
-    dc->r1 = EXTRACT_FIELD(ir, 16, 20);
-    dc->r2 = EXTRACT_FIELD(ir, 11, 15);
-
-    /* bit 31 seems to indicate insn type.  */
-    if (ir & (1 << 31)) {
-        dc->format = OP_FMT_RR;
-    } else {
-        dc->format = OP_FMT_RI;
-    }
-
-    assert(ARRAY_SIZE(decinfo) == 64);
-    assert(dc->opcode < 64);
-
-    decinfo[dc->opcode](dc);
-}
-
-/* generate intermediate code for basic block 'tb'.  */
-void gen_intermediate_code(CPUState *cs, TranslationBlock *tb, int max_insns)
-{
-    CPULM32State *env = cs->env_ptr;
-    LM32CPU *cpu = env_archcpu(env);
-    struct DisasContext ctx, *dc = &ctx;
-    uint32_t pc_start;
-    uint32_t page_start;
-    int num_insns;
-
-    pc_start = tb->pc;
-    dc->features = cpu->features;
-    dc->num_breakpoints = cpu->num_breakpoints;
-    dc->num_watchpoints = cpu->num_watchpoints;
-    dc->tb = tb;
-
-    dc->is_jmp = DISAS_NEXT;
-    dc->pc = pc_start;
-    dc->singlestep_enabled = cs->singlestep_enabled;
-
-    if (pc_start & 3) {
-        qemu_log_mask(LOG_GUEST_ERROR,
-                      "unaligned PC=%x. Ignoring lowest bits.\n", pc_start);
-        pc_start &= ~3;
-    }
-
-    page_start = pc_start & TARGET_PAGE_MASK;
-    num_insns = 0;
-
-    gen_tb_start(tb);
-    do {
-        tcg_gen_insn_start(dc->pc);
-        num_insns++;
-
-        if (unlikely(cpu_breakpoint_test(cs, dc->pc, BP_ANY))) {
-            tcg_gen_movi_tl(cpu_pc, dc->pc);
-            t_gen_raise_exception(dc, EXCP_DEBUG);
-            dc->is_jmp = DISAS_UPDATE;
-            /* The address covered by the breakpoint must be included in
-               [tb->pc, tb->pc + tb->size) in order to for it to be
-               properly cleared -- thus we increment the PC here so that
-               the logic setting tb->size below does the right thing.  */
-            dc->pc += 4;
-            break;
-        }
-
-        /* Pretty disas.  */
-        LOG_DIS("%8.8x:\t", dc->pc);
-
-        if (num_insns == max_insns && (tb_cflags(tb) & CF_LAST_IO)) {
-            gen_io_start();
-        }
-
-        decode(dc, cpu_ldl_code(env, dc->pc));
-        dc->pc += 4;
-    } while (!dc->is_jmp
-         && !tcg_op_buf_full()
-         && !cs->singlestep_enabled
-         && !singlestep
-         && (dc->pc - page_start < TARGET_PAGE_SIZE)
-         && num_insns < max_insns);
-
-
-    if (unlikely(cs->singlestep_enabled)) {
-        if (dc->is_jmp == DISAS_NEXT) {
-            tcg_gen_movi_tl(cpu_pc, dc->pc);
-        }
-        t_gen_raise_exception(dc, EXCP_DEBUG);
-    } else {
-        switch (dc->is_jmp) {
-        case DISAS_NEXT:
-            gen_goto_tb(dc, 1, dc->pc);
-            break;
-        default:
-        case DISAS_JUMP:
-        case DISAS_UPDATE:
-            /* indicate that the hash table must be used
-               to find the next TB */
-            tcg_gen_exit_tb(NULL, 0);
-            break;
-        case DISAS_TB_JUMP:
-            /* nothing more to generate */
-            break;
-        }
-    }
-
-    gen_tb_end(tb, num_insns);
-
-    tb->size = dc->pc - pc_start;
-    tb->icount = num_insns;
-
-#ifdef DEBUG_DISAS
-    if (qemu_loglevel_mask(CPU_LOG_TB_IN_ASM)
-        && qemu_log_in_addr_range(pc_start)) {
-        FILE *logfile = qemu_log_lock();
-        qemu_log("\n");
-        log_target_disas(cs, pc_start, dc->pc - pc_start);
-        qemu_log_unlock(logfile);
-    }
-#endif
-}
-
-void lm32_cpu_dump_state(CPUState *cs, FILE *f, int flags)
-{
-    LM32CPU *cpu = LM32_CPU(cs);
-    CPULM32State *env = &cpu->env;
-    int i;
-
-    if (!env) {
-        return;
-    }
-
-    qemu_fprintf(f, "IN: PC=%x %s\n",
-                 env->pc, lookup_symbol(env->pc));
-
-    qemu_fprintf(f, "ie=%8.8x (IE=%x EIE=%x BIE=%x) im=%8.8x ip=%8.8x\n",
-                 env->ie,
-                 (env->ie & IE_IE) ? 1 : 0,
-                 (env->ie & IE_EIE) ? 1 : 0,
-                 (env->ie & IE_BIE) ? 1 : 0,
-                 lm32_pic_get_im(env->pic_state),
-                 lm32_pic_get_ip(env->pic_state));
-    qemu_fprintf(f, "eba=%8.8x deba=%8.8x\n",
-                 env->eba,
-                 env->deba);
-
-    for (i = 0; i < 32; i++) {
-        qemu_fprintf(f, "r%2.2d=%8.8x ", i, env->regs[i]);
-        if ((i + 1) % 4 == 0) {
-            qemu_fprintf(f, "\n");
-        }
-    }
-    qemu_fprintf(f, "\n\n");
-}
-
-void restore_state_to_opc(CPULM32State *env, TranslationBlock *tb,
-                          target_ulong *data)
-{
-    env->pc = data[0];
-}
-
-void lm32_translate_init(void)
-{
-    int i;
-
-    for (i = 0; i < ARRAY_SIZE(cpu_R); i++) {
-        cpu_R[i] = tcg_global_mem_new(cpu_env,
-                          offsetof(CPULM32State, regs[i]),
-                          regnames[i]);
-    }
-
-    for (i = 0; i < ARRAY_SIZE(cpu_bp); i++) {
-        cpu_bp[i] = tcg_global_mem_new(cpu_env,
-                          offsetof(CPULM32State, bp[i]),
-                          regnames[32+i]);
-    }
-
-    for (i = 0; i < ARRAY_SIZE(cpu_wp); i++) {
-        cpu_wp[i] = tcg_global_mem_new(cpu_env,
-                          offsetof(CPULM32State, wp[i]),
-                          regnames[36+i]);
-    }
-
-    cpu_pc = tcg_global_mem_new(cpu_env,
-                    offsetof(CPULM32State, pc),
-                    "pc");
-    cpu_ie = tcg_global_mem_new(cpu_env,
-                    offsetof(CPULM32State, ie),
-                    "ie");
-    cpu_icc = tcg_global_mem_new(cpu_env,
-                    offsetof(CPULM32State, icc),
-                    "icc");
-    cpu_dcc = tcg_global_mem_new(cpu_env,
-                    offsetof(CPULM32State, dcc),
-                    "dcc");
-    cpu_cc = tcg_global_mem_new(cpu_env,
-                    offsetof(CPULM32State, cc),
-                    "cc");
-    cpu_cfg = tcg_global_mem_new(cpu_env,
-                    offsetof(CPULM32State, cfg),
-                    "cfg");
-    cpu_eba = tcg_global_mem_new(cpu_env,
-                    offsetof(CPULM32State, eba),
-                    "eba");
-    cpu_dc = tcg_global_mem_new(cpu_env,
-                    offsetof(CPULM32State, dc),
-                    "dc");
-    cpu_deba = tcg_global_mem_new(cpu_env,
-                    offsetof(CPULM32State, deba),
-                    "deba");
-}
-
diff --git a/tests/qtest/machine-none-test.c b/tests/qtest/machine-none-test.c
index 5feada15dc..0ec1549648 100644
--- a/tests/qtest/machine-none-test.c
+++ b/tests/qtest/machine-none-test.c
@@ -32,7 +32,6 @@ static struct arch2cpu cpus_map[] = {
     { "i386", "qemu32,apic-id=0" },
     { "alpha", "ev67" },
     { "cris", "crisv32" },
-    { "lm32", "lm32-full" },
     { "m68k", "m5206" },
     { "microblaze", "any" },
     { "microblazeel", "any" },
diff --git a/fpu/softfloat-specialize.c.inc b/fpu/softfloat-specialize.c.inc
index 60df67d441..9b4cbf4f98 100644
--- a/fpu/softfloat-specialize.c.inc
+++ b/fpu/softfloat-specialize.c.inc
@@ -152,7 +152,7 @@ static FloatParts parts_default_nan(float_status *status)
     /* This case is true for Alpha, ARM, MIPS, OpenRISC, PPC, RISC-V,
      * S390, SH4, TriCore, and Xtensa.  I cannot find documentation
      * for Unicore32; the choice from the original commit is unchanged.
-     * Our other supported targets, CRIS, LM32, and Nios2,
+     * Our other supported targets, CRIS, Nios2, and Tile,
      * do not have floating-point.
      */
     if (snan_bit_is_one(status)) {
diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 745fdaea92..e0d941b779 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -624,7 +624,7 @@ build-deprecated:
     IMAGE: debian-all-test-cross
     CONFIGURE_ARGS: --disable-tools
     MAKE_CHECK_ARGS: build-tcg
-    TARGETS: ppc64abi32-linux-user lm32-softmmu unicore32-softmmu
+    TARGETS: ppc64abi32-linux-user unicore32-softmmu
   artifacts:
     expire_in: 2 days
     paths:
diff --git a/MAINTAINERS b/MAINTAINERS
index c765165e5c..96855fbc73 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -207,19 +207,6 @@ F: disas/hppa.c
 F: hw/net/*i82596*
 F: include/hw/net/lasi_82596.h
 
-LM32 TCG CPUs
-R: Michael Walle <michael@walle.cc>
-S: Orphan
-F: target/lm32/
-F: disas/lm32.c
-F: hw/lm32/
-F: hw/*/lm32_*
-F: hw/*/milkymist-*
-F: include/hw/display/milkymist_tmu2.h
-F: include/hw/char/lm32_juart.h
-F: include/hw/lm32/
-F: tests/tcg/lm32/
-
 M68K TCG CPUs
 M: Laurent Vivier <laurent@vivier.eu>
 S: Maintained
@@ -1081,18 +1068,6 @@ F: default-configs/*/hppa-softmmu.mak
 F: hw/hppa/
 F: pc-bios/hppa-firmware.img
 
-LM32 Machines
--------------
-EVR32 and uclinux BSP
-R: Michael Walle <michael@walle.cc>
-S: Orphan
-F: hw/lm32/lm32_boards.c
-
-milkymist
-R: Michael Walle <michael@walle.cc>
-S: Orphan
-F: hw/lm32/milkymist.c
-
 M68K Machines
 -------------
 an5206
diff --git a/disas/meson.build b/disas/meson.build
index 39a5475ff6..449f99e1de 100644
--- a/disas/meson.build
+++ b/disas/meson.build
@@ -9,7 +9,6 @@ common_ss.add(when: 'CONFIG_CRIS_DIS', if_true: files('cris.c'))
 common_ss.add(when: 'CONFIG_HEXAGON_DIS', if_true: files('hexagon.c'))
 common_ss.add(when: 'CONFIG_HPPA_DIS', if_true: files('hppa.c'))
 common_ss.add(when: 'CONFIG_I386_DIS', if_true: files('i386.c'))
-common_ss.add(when: 'CONFIG_LM32_DIS', if_true: files('lm32.c'))
 common_ss.add(when: 'CONFIG_M68K_DIS', if_true: files('m68k.c'))
 common_ss.add(when: 'CONFIG_MICROBLAZE_DIS', if_true: files('microblaze.c'))
 common_ss.add(when: 'CONFIG_MIPS_DIS', if_true: files('mips.c'))
diff --git a/hw/Kconfig b/hw/Kconfig
index 559b7636f4..10a48d1492 100644
--- a/hw/Kconfig
+++ b/hw/Kconfig
@@ -47,7 +47,6 @@ source avr/Kconfig
 source cris/Kconfig
 source hppa/Kconfig
 source i386/Kconfig
-source lm32/Kconfig
 source m68k/Kconfig
 source microblaze/Kconfig
 source mips/Kconfig
diff --git a/hw/audio/meson.build b/hw/audio/meson.build
index 32c42bdebe..e48a9fc73d 100644
--- a/hw/audio/meson.build
+++ b/hw/audio/meson.build
@@ -7,7 +7,6 @@ softmmu_ss.add(when: 'CONFIG_ES1370', if_true: files('es1370.c'))
 softmmu_ss.add(when: 'CONFIG_GUS', if_true: files('gus.c', 'gusemu_hal.c', 'gusemu_mixer.c'))
 softmmu_ss.add(when: 'CONFIG_HDA', if_true: files('intel-hda.c', 'hda-codec.c'))
 softmmu_ss.add(when: 'CONFIG_MARVELL_88W8618', if_true: files('marvell_88w8618.c'))
-softmmu_ss.add(when: 'CONFIG_MILKYMIST', if_true: files('milkymist-ac97.c'))
 softmmu_ss.add(when: 'CONFIG_PCSPK', if_true: files('pcspk.c'))
 softmmu_ss.add(when: 'CONFIG_PL041', if_true: files('pl041.c', 'lm4549.c'))
 softmmu_ss.add(when: 'CONFIG_SB16', if_true: files('sb16.c'))
diff --git a/hw/audio/trace-events b/hw/audio/trace-events
index 60556b4a97..432e10712f 100644
--- a/hw/audio/trace-events
+++ b/hw/audio/trace-events
@@ -6,18 +6,6 @@ cs4231_mem_readl_reg(uint32_t reg, uint32_t ret) "read reg %d: 0x%08x"
 cs4231_mem_writel_reg(uint32_t reg, uint32_t old, uint32_t val) "write reg %d: 0x%08x -> 0x%08x"
 cs4231_mem_writel_dreg(uint32_t reg, uint32_t old, uint32_t val) "write dreg %d: 0x%02x -> 0x%02x"
 
-# milkymist-ac97.c
-milkymist_ac97_memory_read(uint32_t addr, uint32_t value) "addr 0x%08x value 0x%08x"
-milkymist_ac97_memory_write(uint32_t addr, uint32_t value) "addr 0x%08x value 0x%08x"
-milkymist_ac97_pulse_irq_crrequest(void) "Pulse IRQ CR request"
-milkymist_ac97_pulse_irq_crreply(void) "Pulse IRQ CR reply"
-milkymist_ac97_pulse_irq_dmaw(void) "Pulse IRQ DMA write"
-milkymist_ac97_pulse_irq_dmar(void) "Pulse IRQ DMA read"
-milkymist_ac97_in_cb(int avail, uint32_t remaining) "avail %d remaining %u"
-milkymist_ac97_in_cb_transferred(int transferred) "transferred %d"
-milkymist_ac97_out_cb(int free, uint32_t remaining) "free %d remaining %u"
-milkymist_ac97_out_cb_transferred(int transferred) "transferred %d"
-
 # hda-codec.c
 hda_audio_running(const char *stream, int nr, bool running) "st %s, nr %d, run %d"
 hda_audio_format(const char *stream, int chan, const char *fmt, int freq) "st %s, %d x %s @ %d Hz"
diff --git a/hw/char/meson.build b/hw/char/meson.build
index da5bb8b762..31bf506398 100644
--- a/hw/char/meson.build
+++ b/hw/char/meson.build
@@ -8,9 +8,6 @@ softmmu_ss.add(when: 'CONFIG_IMX', if_true: files('imx_serial.c'))
 softmmu_ss.add(when: 'CONFIG_IPACK', if_true: files('ipoctal232.c'))
 softmmu_ss.add(when: 'CONFIG_ISA_BUS', if_true: files('parallel-isa.c'))
 softmmu_ss.add(when: 'CONFIG_ISA_DEBUG', if_true: files('debugcon.c'))
-softmmu_ss.add(when: 'CONFIG_LM32_DEVICES', if_true: files('lm32_juart.c'))
-softmmu_ss.add(when: 'CONFIG_LM32_DEVICES', if_true: files('lm32_uart.c'))
-softmmu_ss.add(when: 'CONFIG_MILKYMIST', if_true: files('milkymist-uart.c'))
 softmmu_ss.add(when: 'CONFIG_NRF51_SOC', if_true: files('nrf51_uart.c'))
 softmmu_ss.add(when: 'CONFIG_PARALLEL', if_true: files('parallel.c'))
 softmmu_ss.add(when: 'CONFIG_PL011', if_true: files('pl011.c'))
diff --git a/hw/char/trace-events b/hw/char/trace-events
index 76d52938ea..76d303b953 100644
--- a/hw/char/trace-events
+++ b/hw/char/trace-events
@@ -35,23 +35,6 @@ grlib_apbuart_event(int event) "event:%d"
 grlib_apbuart_writel_unknown(uint64_t addr, uint32_t value) "addr 0x%"PRIx64" value 0x%x"
 grlib_apbuart_readl_unknown(uint64_t addr) "addr 0x%"PRIx64
 
-# lm32_juart.c
-lm32_juart_get_jtx(uint32_t value) "jtx 0x%08x"
-lm32_juart_set_jtx(uint32_t value) "jtx 0x%08x"
-lm32_juart_get_jrx(uint32_t value) "jrx 0x%08x"
-lm32_juart_set_jrx(uint32_t value) "jrx 0x%08x"
-
-# lm32_uart.c
-lm32_uart_memory_write(uint32_t addr, uint32_t value) "addr 0x%08x value 0x%08x"
-lm32_uart_memory_read(uint32_t addr, uint32_t value) "addr 0x%08x value 0x%08x"
-lm32_uart_irq_state(int level) "irq state %d"
-
-# milkymist-uart.c
-milkymist_uart_memory_read(uint32_t addr, uint32_t value) "addr 0x%08x value 0x%08x"
-milkymist_uart_memory_write(uint32_t addr, uint32_t value) "addr 0x%08x value 0x%08x"
-milkymist_uart_raise_irq(void) "Raise IRQ"
-milkymist_uart_lower_irq(void) "Lower IRQ"
-
 # escc.c
 escc_put_queue(char channel, int b) "channel %c put: 0x%02x"
 escc_get_queue(char channel, int val) "channel %c get 0x%02x"
diff --git a/hw/display/Kconfig b/hw/display/Kconfig
index ca46b5830e..a2306b67d8 100644
--- a/hw/display/Kconfig
+++ b/hw/display/Kconfig
@@ -72,10 +72,6 @@ config BLIZZARD
 config FRAMEBUFFER
     bool
 
-config MILKYMIST_TMU2
-    bool
-    depends on OPENGL && X11
-
 config SM501
     bool
     select I2C
diff --git a/hw/display/meson.build b/hw/display/meson.build
index 612cd6582d..aaf797c5e9 100644
--- a/hw/display/meson.build
+++ b/hw/display/meson.build
@@ -48,7 +48,6 @@ endif
 softmmu_ss.add(when: 'CONFIG_DPCD', if_true: files('dpcd.c'))
 softmmu_ss.add(when: 'CONFIG_XLNX_ZYNQMP_ARM', if_true: files('xlnx_dp.c'))
 
-softmmu_ss.add(when: 'CONFIG_MILKYMIST', if_true: files('milkymist-vgafb.c'))
 softmmu_ss.add(when: 'CONFIG_ARTIST', if_true: files('artist.c'))
 
 softmmu_ss.add(when: [pixman, 'CONFIG_ATI_VGA'], if_true: files('ati.c', 'ati_2d.c', 'ati_dbg.c'))
@@ -94,7 +93,6 @@ if config_all_devices.has_key('CONFIG_VIRTIO_VGA')
   hw_display_modules += {'virtio-vga-gl': virtio_vga_gl_ss}
 endif
 
-specific_ss.add(when: [x11, opengl, 'CONFIG_MILKYMIST_TMU2'], if_true: files('milkymist-tmu2.c'))
 specific_ss.add(when: 'CONFIG_OMAP', if_true: files('omap_lcdc.c'))
 
 modules += { 'hw-display': hw_display_modules }
diff --git a/hw/display/trace-events b/hw/display/trace-events
index 957b8ba994..9fccca18a1 100644
--- a/hw/display/trace-events
+++ b/hw/display/trace-events
@@ -13,16 +13,6 @@ xenfb_input_connected(void *xendev, int abs_pointer_wanted) "%p abs %d"
 g364fb_read(uint64_t addr, uint32_t val) "read addr=0x%"PRIx64": 0x%x"
 g364fb_write(uint64_t addr, uint32_t new) "write addr=0x%"PRIx64": 0x%x"
 
-# milkymist-tmu2.c
-milkymist_tmu2_memory_read(uint32_t addr, uint32_t value) "addr 0x%08x value 0x%08x"
-milkymist_tmu2_memory_write(uint32_t addr, uint32_t value) "addr 0x%08x value 0x%08x"
-milkymist_tmu2_start(void) "Start TMU"
-milkymist_tmu2_pulse_irq(void) "Pulse IRQ"
-
-# milkymist-vgafb.c
-milkymist_vgafb_memory_read(uint32_t addr, uint32_t value) "addr 0x%08x value 0x%08x"
-milkymist_vgafb_memory_write(uint32_t addr, uint32_t value) "addr 0x%08x value 0x%08x"
-
 # vmware_vga.c
 vmware_value_read(uint32_t index, uint32_t value) "index %d, value 0x%x"
 vmware_value_write(uint32_t index, uint32_t value) "index %d, value 0x%x"
diff --git a/hw/input/meson.build b/hw/input/meson.build
index 0042c3f0dc..8deb011d4a 100644
--- a/hw/input/meson.build
+++ b/hw/input/meson.build
@@ -13,7 +13,6 @@ softmmu_ss.add(when: 'CONFIG_VIRTIO_INPUT', if_true: files('virtio-input-hid.c')
 softmmu_ss.add(when: 'CONFIG_VIRTIO_INPUT_HOST', if_true: files('virtio-input-host.c'))
 softmmu_ss.add(when: 'CONFIG_VHOST_USER_INPUT', if_true: files('vhost-user-input.c'))
 
-softmmu_ss.add(when: 'CONFIG_MILKYMIST', if_true: files('milkymist-softusb.c'))
 softmmu_ss.add(when: 'CONFIG_PXA2XX', if_true: files('pxa2xx_keypad.c'))
 softmmu_ss.add(when: 'CONFIG_TSC210X', if_true: files('tsc210x.c'))
 softmmu_ss.add(when: 'CONFIG_LASIPS2', if_true: files('lasips2.c'))
diff --git a/hw/input/trace-events b/hw/input/trace-events
index 1dd8ad6018..33741e74f5 100644
--- a/hw/input/trace-events
+++ b/hw/input/trace-events
@@ -44,13 +44,6 @@ ps2_mouse_reset(void *opaque) "%p"
 ps2_kbd_init(void *s) "%p"
 ps2_mouse_init(void *s) "%p"
 
-# milkymist-softusb.c
-milkymist_softusb_memory_read(uint32_t addr, uint32_t value) "addr 0x%08x value 0x%08x"
-milkymist_softusb_memory_write(uint32_t addr, uint32_t value) "addr 0x%08x value 0x%08x"
-milkymist_softusb_mevt(uint8_t m) "m %d"
-milkymist_softusb_kevt(uint8_t m) "m %d"
-milkymist_softusb_pulse_irq(void) "Pulse IRQ"
-
 # hid.c
 hid_kbd_queue_full(void) "queue full"
 hid_kbd_queue_empty(void) "queue empty"
diff --git a/hw/intc/meson.build b/hw/intc/meson.build
index 1c299039f6..cc7a140f3f 100644
--- a/hw/intc/meson.build
+++ b/hw/intc/meson.build
@@ -14,7 +14,6 @@ softmmu_ss.add(when: 'CONFIG_HEATHROW_PIC', if_true: files('heathrow_pic.c'))
 softmmu_ss.add(when: 'CONFIG_I8259', if_true: files('i8259_common.c', 'i8259.c'))
 softmmu_ss.add(when: 'CONFIG_IMX', if_true: files('imx_avic.c', 'imx_gpcv2.c'))
 softmmu_ss.add(when: 'CONFIG_IOAPIC', if_true: files('ioapic_common.c'))
-softmmu_ss.add(when: 'CONFIG_LM32_DEVICES', if_true: files('lm32_pic.c'))
 softmmu_ss.add(when: 'CONFIG_OPENPIC', if_true: files('openpic.c'))
 softmmu_ss.add(when: 'CONFIG_PL190', if_true: files('pl190.c'))
 softmmu_ss.add(when: 'CONFIG_PUV3', if_true: files('puv3_intc.c'))
diff --git a/hw/intc/trace-events b/hw/intc/trace-events
index c9ab17234b..626bb554b2 100644
--- a/hw/intc/trace-events
+++ b/hw/intc/trace-events
@@ -51,15 +51,6 @@ grlib_irqmp_set_irq(int irq) "Raise CPU IRQ %d"
 grlib_irqmp_readl_unknown(uint64_t addr) "addr 0x%"PRIx64
 grlib_irqmp_writel_unknown(uint64_t addr, uint32_t value) "addr 0x%"PRIx64" value 0x%x"
 
-# lm32_pic.c
-lm32_pic_raise_irq(void) "Raise CPU interrupt"
-lm32_pic_lower_irq(void) "Lower CPU interrupt"
-lm32_pic_interrupt(int irq, int level) "Set IRQ%d %d"
-lm32_pic_set_im(uint32_t im) "im 0x%08x"
-lm32_pic_set_ip(uint32_t ip) "ip 0x%08x"
-lm32_pic_get_im(uint32_t im) "im 0x%08x"
-lm32_pic_get_ip(uint32_t ip) "ip 0x%08x"
-
 # xics.c
 xics_icp_check_ipi(int server, uint8_t mfrr) "CPU %d can take IPI mfrr=0x%x"
 xics_icp_accept(uint32_t old_xirr, uint32_t new_xirr) "icp_accept: XIRR 0x%"PRIx32"->0x%"PRIx32
diff --git a/hw/lm32/Kconfig b/hw/lm32/Kconfig
deleted file mode 100644
index 8ac94205d7..0000000000
--- a/hw/lm32/Kconfig
+++ /dev/null
@@ -1,18 +0,0 @@
-config LM32_DEVICES
-    bool
-    select PTIMER
-
-config MILKYMIST
-    bool
-    # FIXME: disabling it results in compile-time errors
-    select MILKYMIST_TMU2 if OPENGL && X11
-    select PFLASH_CFI01
-    select FRAMEBUFFER
-    select SD
-    select USB_OHCI
-    select LM32_DEVICES
-
-config LM32_EVR
-    bool
-    select LM32_DEVICES
-    select PFLASH_CFI02
diff --git a/hw/lm32/meson.build b/hw/lm32/meson.build
deleted file mode 100644
index 42d6f8db3d..0000000000
--- a/hw/lm32/meson.build
+++ /dev/null
@@ -1,6 +0,0 @@
-lm32_ss = ss.source_set()
-# LM32 boards
-lm32_ss.add(when: 'CONFIG_LM32_EVR', if_true: files('lm32_boards.c'))
-lm32_ss.add(when: 'CONFIG_MILKYMIST', if_true: files('milkymist.c'))
-
-hw_arch += {'lm32': lm32_ss}
diff --git a/hw/meson.build b/hw/meson.build
index 503cbc974f..56ce810c4b 100644
--- a/hw/meson.build
+++ b/hw/meson.build
@@ -47,7 +47,6 @@ subdir('avr')
 subdir('cris')
 subdir('hppa')
 subdir('i386')
-subdir('lm32')
 subdir('m68k')
 subdir('microblaze')
 subdir('mips')
diff --git a/hw/misc/meson.build b/hw/misc/meson.build
index 1e7b8b064b..f934d79e29 100644
--- a/hw/misc/meson.build
+++ b/hw/misc/meson.build
@@ -63,7 +63,6 @@ softmmu_ss.add(when: 'CONFIG_IMX', if_true: files(
   'imx_ccm.c',
   'imx_rngc.c',
 ))
-softmmu_ss.add(when: 'CONFIG_MILKYMIST', if_true: files('milkymist-hpdmc.c', 'milkymist-pfpu.c'))
 softmmu_ss.add(when: 'CONFIG_MAINSTONE', if_true: files('mst_fpga.c'))
 softmmu_ss.add(when: 'CONFIG_NPCM7XX', if_true: files(
   'npcm7xx_clk.c',
diff --git a/hw/misc/trace-events b/hw/misc/trace-events
index d0a89eb059..0752217636 100644
--- a/hw/misc/trace-events
+++ b/hw/misc/trace-events
@@ -67,16 +67,6 @@ slavio_sysctrl_mem_readl(uint32_t ret) "Read system control 0x%08x"
 slavio_led_mem_writew(uint32_t val) "Write diagnostic LED 0x%04x"
 slavio_led_mem_readw(uint32_t ret) "Read diagnostic LED 0x%04x"
 
-# milkymist-hpdmc.c
-milkymist_hpdmc_memory_read(uint32_t addr, uint32_t value) "addr=0x%08x value=0x%08x"
-milkymist_hpdmc_memory_write(uint32_t addr, uint32_t value) "addr=0x%08x value=0x%08x"
-
-# milkymist-pfpu.c
-milkymist_pfpu_memory_read(uint32_t addr, uint32_t value) "addr 0x%08x value 0x%08x"
-milkymist_pfpu_memory_write(uint32_t addr, uint32_t value) "addr 0x%08x value 0x%08x"
-milkymist_pfpu_vectout(uint32_t a, uint32_t b, uint32_t dma_ptr) "a 0x%08x b 0x%08x dma_ptr 0x%08x"
-milkymist_pfpu_pulse_irq(void) "Pulse IRQ"
-
 # aspeed_scu.c
 aspeed_scu_write(uint64_t offset, unsigned size, uint32_t data) "To 0x%" PRIx64 " of size %u: 0x%" PRIx32
 
diff --git a/hw/net/meson.build b/hw/net/meson.build
index af0749c42b..bdf71f1f40 100644
--- a/hw/net/meson.build
+++ b/hw/net/meson.build
@@ -39,7 +39,6 @@ softmmu_ss.add(when: 'CONFIG_NPCM7XX', if_true: files('npcm7xx_emc.c'))
 
 softmmu_ss.add(when: 'CONFIG_ETRAXFS', if_true: files('etraxfs_eth.c'))
 softmmu_ss.add(when: 'CONFIG_COLDFIRE', if_true: files('mcf_fec.c'))
-specific_ss.add(when: 'CONFIG_MILKYMIST', if_true: files('milkymist-minimac2.c'))
 specific_ss.add(when: 'CONFIG_PSERIES', if_true: files('spapr_llan.c'))
 specific_ss.add(when: 'CONFIG_XILINX_ETHLITE', if_true: files('xilinx_ethlite.c'))
 
diff --git a/hw/net/trace-events b/hw/net/trace-events
index baf25ffa7e..314e21fa99 100644
--- a/hw/net/trace-events
+++ b/hw/net/trace-events
@@ -19,18 +19,6 @@ mdio_bitbang(bool mdc, bool mdio, int state, uint16_t cnt, unsigned int drive) "
 lance_mem_readw(uint64_t addr, uint32_t ret) "addr=0x%"PRIx64"val=0x%04x"
 lance_mem_writew(uint64_t addr, uint32_t val) "addr=0x%"PRIx64"val=0x%04x"
 
-# milkymist-minimac2.c
-milkymist_minimac2_memory_read(uint32_t addr, uint32_t value) "addr 0x%08x value 0x%08x"
-milkymist_minimac2_memory_write(uint32_t addr, uint32_t value) "addr 0x%08x value 0x%08x"
-milkymist_minimac2_mdio_write(uint8_t phy_addr, uint8_t addr, uint16_t value) "phy_addr 0x%02x addr 0x%02x value 0x%04x"
-milkymist_minimac2_mdio_read(uint8_t phy_addr, uint8_t addr, uint16_t value) "phy_addr 0x%02x addr 0x%02x value 0x%04x"
-milkymist_minimac2_tx_frame(uint32_t length) "length %u"
-milkymist_minimac2_rx_frame(const void *buf, uint32_t length) "buf %p length %u"
-milkymist_minimac2_rx_transfer(const void *buf, uint32_t length) "buf %p length %d"
-milkymist_minimac2_raise_irq_rx(void) "Raise IRQ RX"
-milkymist_minimac2_lower_irq_rx(void) "Lower IRQ RX"
-milkymist_minimac2_pulse_irq_tx(void) "Pulse IRQ TX"
-
 # mipsnet.c
 mipsnet_send(uint32_t size) "sending len=%u"
 mipsnet_receive(uint32_t size) "receiving len=%u"
diff --git a/hw/sd/meson.build b/hw/sd/meson.build
index 9c29691e13..f1ce357a3b 100644
--- a/hw/sd/meson.build
+++ b/hw/sd/meson.build
@@ -4,7 +4,6 @@ softmmu_ss.add(when: 'CONFIG_SDHCI', if_true: files('sdhci.c'))
 softmmu_ss.add(when: 'CONFIG_SDHCI_PCI', if_true: files('sdhci-pci.c'))
 softmmu_ss.add(when: 'CONFIG_SSI_SD', if_true: files('ssi-sd.c'))
 
-softmmu_ss.add(when: 'CONFIG_MILKYMIST', if_true: files('milkymist-memcard.c'))
 softmmu_ss.add(when: 'CONFIG_OMAP', if_true: files('omap_mmc.c'))
 softmmu_ss.add(when: 'CONFIG_PXA2XX', if_true: files('pxa2xx_mmci.c'))
 softmmu_ss.add(when: 'CONFIG_RASPI', if_true: files('bcm2835_sdhost.c'))
diff --git a/hw/sd/trace-events b/hw/sd/trace-events
index 4140e48540..e185d07a1d 100644
--- a/hw/sd/trace-events
+++ b/hw/sd/trace-events
@@ -55,10 +55,6 @@ sdcard_write_data(const char *proto, const char *cmd_desc, uint8_t cmd, uint8_t
 sdcard_read_data(const char *proto, const char *cmd_desc, uint8_t cmd, uint32_t length) "%s %20s/ CMD%02d len %" PRIu32
 sdcard_set_voltage(uint16_t millivolts) "%u mV"
 
-# milkymist-memcard.c
-milkymist_memcard_memory_read(uint32_t addr, uint32_t value) "addr 0x%08x value 0x%08x"
-milkymist_memcard_memory_write(uint32_t addr, uint32_t value) "addr 0x%08x value 0x%08x"
-
 # pxa2xx_mmci.c
 pxa2xx_mmci_read(uint8_t size, uint32_t addr, uint32_t value) "size %d addr 0x%02x value 0x%08x"
 pxa2xx_mmci_write(uint8_t size, uint32_t addr, uint32_t value) "size %d addr 0x%02x value 0x%08x"
diff --git a/hw/timer/meson.build b/hw/timer/meson.build
index 598d058506..f2081d261a 100644
--- a/hw/timer/meson.build
+++ b/hw/timer/meson.build
@@ -19,8 +19,6 @@ softmmu_ss.add(when: 'CONFIG_HPET', if_true: files('hpet.c'))
 softmmu_ss.add(when: 'CONFIG_I8254', if_true: files('i8254_common.c', 'i8254.c'))
 softmmu_ss.add(when: 'CONFIG_IMX', if_true: files('imx_epit.c'))
 softmmu_ss.add(when: 'CONFIG_IMX', if_true: files('imx_gpt.c'))
-softmmu_ss.add(when: 'CONFIG_LM32_DEVICES', if_true: files('lm32_timer.c'))
-softmmu_ss.add(when: 'CONFIG_MILKYMIST', if_true: files('milkymist-sysctl.c'))
 softmmu_ss.add(when: 'CONFIG_MIPS_CPS', if_true: files('mips_gictimer.c'))
 softmmu_ss.add(when: 'CONFIG_MSF2', if_true: files('mss-timer.c'))
 softmmu_ss.add(when: 'CONFIG_NPCM7XX', if_true: files('npcm7xx_timer.c'))
diff --git a/hw/timer/trace-events b/hw/timer/trace-events
index f8b9db25c2..029fb56280 100644
--- a/hw/timer/trace-events
+++ b/hw/timer/trace-events
@@ -24,23 +24,6 @@ grlib_gptimer_hit(int id) "timer:%d HIT"
 grlib_gptimer_readl(int id, uint64_t addr, uint32_t val) "timer:%d addr 0x%"PRIx64" 0x%x"
 grlib_gptimer_writel(int id, uint64_t addr, uint32_t val) "timer:%d addr 0x%"PRIx64" 0x%x"
 
-# lm32_timer.c
-lm32_timer_memory_write(uint32_t addr, uint32_t value) "addr 0x%08x value 0x%08x"
-lm32_timer_memory_read(uint32_t addr, uint32_t value) "addr 0x%08x value 0x%08x"
-lm32_timer_hit(void) "timer hit"
-lm32_timer_irq_state(int level) "irq state %d"
-
-# milkymist-sysctl.c
-milkymist_sysctl_memory_read(uint32_t addr, uint32_t value) "addr 0x%08x value 0x%08x"
-milkymist_sysctl_memory_write(uint32_t addr, uint32_t value) "addr 0x%08x value 0x%08x"
-milkymist_sysctl_icap_write(uint32_t value) "value 0x%08x"
-milkymist_sysctl_start_timer0(void) "Start timer0"
-milkymist_sysctl_stop_timer0(void) "Stop timer0"
-milkymist_sysctl_start_timer1(void) "Start timer1"
-milkymist_sysctl_stop_timer1(void) "Stop timer1"
-milkymist_sysctl_pulse_irq_timer0(void) "Pulse IRQ Timer0"
-milkymist_sysctl_pulse_irq_timer1(void) "Pulse IRQ Timer1"
-
 # aspeed_timer.c
 aspeed_timer_ctrl_enable(uint8_t i, bool enable) "Timer %" PRIu8 ": %d"
 aspeed_timer_ctrl_external_clock(uint8_t i, bool enable) "Timer %" PRIu8 ": %d"
diff --git a/qemu-options.hx b/qemu-options.hx
index 7c825f81fc..a81ca006db 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -4288,7 +4288,7 @@ SRST
 ERST
 DEF("semihosting", 0, QEMU_OPTION_semihosting,
     "-semihosting    semihosting mode\n",
-    QEMU_ARCH_ARM | QEMU_ARCH_M68K | QEMU_ARCH_XTENSA | QEMU_ARCH_LM32 |
+    QEMU_ARCH_ARM | QEMU_ARCH_M68K | QEMU_ARCH_XTENSA |
     QEMU_ARCH_MIPS | QEMU_ARCH_NIOS2 | QEMU_ARCH_RISCV)
 SRST
 ``-semihosting``
@@ -4303,7 +4303,7 @@ ERST
 DEF("semihosting-config", HAS_ARG, QEMU_OPTION_semihosting_config,
     "-semihosting-config [enable=on|off][,target=native|gdb|auto][,chardev=id][,arg=str[,...]]\n" \
     "                semihosting configuration\n",
-QEMU_ARCH_ARM | QEMU_ARCH_M68K | QEMU_ARCH_XTENSA | QEMU_ARCH_LM32 |
+QEMU_ARCH_ARM | QEMU_ARCH_M68K | QEMU_ARCH_XTENSA |
 QEMU_ARCH_MIPS | QEMU_ARCH_NIOS2 | QEMU_ARCH_RISCV)
 SRST
 ``-semihosting-config [enable=on|off][,target=native|gdb|auto][,chardev=id][,arg=str[,...]]``
diff --git a/target/lm32/README b/target/lm32/README
deleted file mode 100644
index ba3508a711..0000000000
--- a/target/lm32/README
+++ /dev/null
@@ -1,45 +0,0 @@
-LatticeMico32 target
---------------------
-
-General
--------
-All opcodes including the JUART CSRs are supported.
-
-
-JTAG UART
----------
-JTAG UART is routed to a serial console device. For the current boards it
-is the second one. Ie to enable it in the qemu virtual console window use
-the following command line parameters:
-  -serial vc -serial vc
-This will make serial0 (the lm32_uart) and serial1 (the JTAG UART)
-available as virtual consoles.
-
-
-Semihosting
------------
-Semihosting on this target is supported. Some system calls like read, write
-and exit are executed on the host if semihosting is enabled. See
-target/lm32-semi.c for all supported system calls. Emulation aware programs
-can use this mechanism to shut down the virtual machine and print to the
-host console. See the tcg tests for an example.
-
-
-Special instructions
---------------------
-The translation recognizes one special instruction to halt the cpu:
-  and r0, r0, r0
-On real hardware this instruction is a nop. It is not used by GCC and
-should (hopefully) not be used within hand-crafted assembly.
-Insert this instruction in your idle loop to reduce the cpu load on the
-host.
-
-
-Ignoring the MSB of the address bus
------------------------------------
-Some SoC ignores the MSB on the address bus. Thus creating a shadow memory
-area. As a general rule, 0x00000000-0x7fffffff is cached, whereas
-0x80000000-0xffffffff is not cached and used to access IO devices. This
-behaviour can be enabled with:
-  cpu_lm32_set_phys_msb_ignore(env, 1);
-
diff --git a/target/lm32/TODO b/target/lm32/TODO
deleted file mode 100644
index e163c42ebe..0000000000
--- a/target/lm32/TODO
+++ /dev/null
@@ -1 +0,0 @@
-* linux-user emulation
diff --git a/target/lm32/meson.build b/target/lm32/meson.build
deleted file mode 100644
index ef0eef07f1..0000000000
--- a/target/lm32/meson.build
+++ /dev/null
@@ -1,15 +0,0 @@
-lm32_ss = ss.source_set()
-lm32_ss.add(files(
-  'cpu.c',
-  'gdbstub.c',
-  'helper.c',
-  'lm32-semi.c',
-  'op_helper.c',
-  'translate.c',
-))
-
-lm32_softmmu_ss = ss.source_set()
-lm32_softmmu_ss.add(files('machine.c'))
-
-target_arch += {'lm32': lm32_ss}
-target_softmmu_arch += {'lm32': lm32_softmmu_ss}
diff --git a/target/meson.build b/target/meson.build
index 289a654caf..ccc87f30f3 100644
--- a/target/meson.build
+++ b/target/meson.build
@@ -5,7 +5,6 @@ subdir('cris')
 subdir('hexagon')
 subdir('hppa')
 subdir('i386')
-subdir('lm32')
 subdir('m68k')
 subdir('microblaze')
 subdir('mips')
diff --git a/tests/tcg/README b/tests/tcg/README
index 2a58f9a058..706bb185b4 100644
--- a/tests/tcg/README
+++ b/tests/tcg/README
@@ -7,9 +7,3 @@ CRIS
 ====
 The testsuite for CRIS is in tests/tcg/cris.  You can run it
 with "make test-cris".
-
-LM32
-====
-The testsuite for LM32 is in tests/tcg/lm32.  You can run it
-with "make test-lm32".
-
diff --git a/tests/tcg/configure.sh b/tests/tcg/configure.sh
index fa1a4261a4..8f20ce065d 100755
--- a/tests/tcg/configure.sh
+++ b/tests/tcg/configure.sh
@@ -96,7 +96,7 @@ for target in $target_list; do
     xtensa|xtensaeb)
       arches=xtensa
       ;;
-    alpha|cris|hexagon|hppa|i386|lm32|microblaze|microblazeel|m68k|openrisc|riscv64|s390x|sh4|sparc64)
+    alpha|cris|hexagon|hppa|i386|microblaze|microblazeel|m68k|openrisc|riscv64|s390x|sh4|sparc64)
       arches=$target
       ;;
     *)
diff --git a/tests/tcg/lm32/Makefile b/tests/tcg/lm32/Makefile
deleted file mode 100644
index 57e7363b2c..0000000000
--- a/tests/tcg/lm32/Makefile
+++ /dev/null
@@ -1,106 +0,0 @@
--include ../../../config-host.mak
-
-CROSS=lm32-elf-
-
-SIM = qemu-system-lm32
-SIMFLAGS = -M lm32-evr -nographic -semihosting -net none -kernel
-
-CC      = $(CROSS)gcc
-AS      = $(CROSS)as
-AS      = $(CC) -x assembler
-SIZE    = $(CROSS)size
-LD      = $(CC)
-OBJCOPY = $(CROSS)objcopy
-
-TSRC_PATH = $(SRC_PATH)/tests/tcg/lm32
-
-LDFLAGS = -T$(TSRC_PATH)/linker.ld
-ASFLAGS += -Wa,-I,$(TSRC_PATH)/
-
-CRT        = crt.o
-HELPER     = helper.o
-TESTCASES += test_add.tst
-TESTCASES += test_addi.tst
-TESTCASES += test_and.tst
-TESTCASES += test_andhi.tst
-TESTCASES += test_andi.tst
-TESTCASES += test_b.tst
-TESTCASES += test_be.tst
-TESTCASES += test_bg.tst
-TESTCASES += test_bge.tst
-TESTCASES += test_bgeu.tst
-TESTCASES += test_bgu.tst
-TESTCASES += test_bi.tst
-TESTCASES += test_bne.tst
-TESTCASES += test_break.tst
-TESTCASES += test_bret.tst
-TESTCASES += test_call.tst
-TESTCASES += test_calli.tst
-TESTCASES += test_cmpe.tst
-TESTCASES += test_cmpei.tst
-TESTCASES += test_cmpg.tst
-TESTCASES += test_cmpgi.tst
-TESTCASES += test_cmpge.tst
-TESTCASES += test_cmpgei.tst
-TESTCASES += test_cmpgeu.tst
-TESTCASES += test_cmpgeui.tst
-TESTCASES += test_cmpgu.tst
-TESTCASES += test_cmpgui.tst
-TESTCASES += test_cmpne.tst
-TESTCASES += test_cmpnei.tst
-TESTCASES += test_divu.tst
-TESTCASES += test_eret.tst
-TESTCASES += test_lb.tst
-TESTCASES += test_lbu.tst
-TESTCASES += test_lh.tst
-TESTCASES += test_lhu.tst
-TESTCASES += test_lw.tst
-TESTCASES += test_modu.tst
-TESTCASES += test_mul.tst
-TESTCASES += test_muli.tst
-TESTCASES += test_nor.tst
-TESTCASES += test_nori.tst
-TESTCASES += test_or.tst
-TESTCASES += test_ori.tst
-TESTCASES += test_orhi.tst
-#TESTCASES += test_rcsr.tst
-TESTCASES += test_ret.tst
-TESTCASES += test_sb.tst
-TESTCASES += test_scall.tst
-TESTCASES += test_sextb.tst
-TESTCASES += test_sexth.tst
-TESTCASES += test_sh.tst
-TESTCASES += test_sl.tst
-TESTCASES += test_sli.tst
-TESTCASES += test_sr.tst
-TESTCASES += test_sri.tst
-TESTCASES += test_sru.tst
-TESTCASES += test_srui.tst
-TESTCASES += test_sub.tst
-TESTCASES += test_sw.tst
-#TESTCASES += test_wcsr.tst
-TESTCASES += test_xnor.tst
-TESTCASES += test_xnori.tst
-TESTCASES += test_xor.tst
-TESTCASES += test_xori.tst
-
-all: build
-
-%.o: $(TSRC_PATH)/%.c
-	$(CC) $(CFLAGS) -c $< -o $@
-
-%.o: $(TSRC_PATH)/%.S
-	$(AS) $(ASFLAGS) -c $< -o $@
-
-%.tst: %.o $(TSRC_PATH)/macros.inc $(CRT) $(HELPER)
-	$(LD) $(LDFLAGS) $(NOSTDFLAGS) $(CRT) $(HELPER) $< -o $@
-
-build: $(TESTCASES)
-
-check: $(TESTCASES:test_%.tst=check_%)
-
-check_%: test_%.tst
-	@$(SIM) $(SIMFLAGS) $<
-
-clean:
-	$(RM) -fr $(TESTCASES) $(CRT) $(HELPER)
diff --git a/tests/tcg/lm32/crt.S b/tests/tcg/lm32/crt.S
deleted file mode 100644
index fc437a3de1..0000000000
--- a/tests/tcg/lm32/crt.S
+++ /dev/null
@@ -1,84 +0,0 @@
-.text
-.global _start
-
-_start:
-_reset_handler:
-	xor r0, r0, r0
-	mvhi r1, hi(_start)
-	ori r1, r1, lo(_start)
-	wcsr eba, r1
-	wcsr deba, r1
-	mvhi sp, hi(_fstack)
-	ori sp, sp, lo(_fstack)
-	bi _main
-
-_breakpoint_handler:
-	ori r25, r25, 1
-	addi ra, ba, 4
-	ret
-	nop
-	nop
-	nop
-	nop
-	nop
-
-_instruction_bus_error_handler:
-	ori r25, r25, 2
-	addi ra, ea, 4
-	ret
-	nop
-	nop
-	nop
-	nop
-	nop
-
-_watchpoint_handler:
-	ori r25, r25, 4
-	addi ra, ba, 4
-	ret
-	nop
-	nop
-	nop
-	nop
-	nop
-
-_data_bus_error_handler:
-	ori r25, r25, 8
-	addi ra, ea, 4
-	ret
-	nop
-	nop
-	nop
-	nop
-	nop
-
-_divide_by_zero_handler:
-	ori r25, r25, 16
-	addi ra, ea, 4
-	ret
-	nop
-	nop
-	nop
-	nop
-	nop
-
-_interrupt_handler:
-	ori r25, r25, 32
-	addi ra, ea, 4
-	ret
-	nop
-	nop
-	nop
-	nop
-	nop
-
-_system_call_handler:
-	ori r25, r25, 64
-	addi ra, ea, 4
-	ret
-	nop
-	nop
-	nop
-	nop
-	nop
-
diff --git a/tests/tcg/lm32/helper.S b/tests/tcg/lm32/helper.S
deleted file mode 100644
index 3351d41e84..0000000000
--- a/tests/tcg/lm32/helper.S
+++ /dev/null
@@ -1,65 +0,0 @@
-.text
-.global _start, _write, _exit
-.global _tc_fail, _tc_pass
-
-_write:
-	addi sp, sp, -4
-	sw (sp+4), r8
-	mvi r8, 5
-	scall
-	lw r8, (sp+4)
-	addi sp, sp, 4
-	ret
-
-_exit:
-	mvi r8, 1
-	scall
-1:
-	bi 1b
-
-_tc_pass:
-.data
-1:
-	.ascii "OK\n"
-2:
-.text
-	addi sp, sp, -16
-	sw (sp+4), ra
-	sw (sp+8), r1
-	sw (sp+12), r2
-	sw (sp+16), r3
-	mvi r1, 1
-	mvhi r2, hi(1b)
-	ori r2, r2, lo(1b)
-	mvi r3, (2b - 1b)
-	calli _write
-	lw r3, (sp+16)
-	lw r2, (sp+12)
-	lw r1, (sp+8)
-	lw ra, (sp+4)
-	addi sp, sp, 16
-	ret
-
-_tc_fail:
-.data
-1:
-	.ascii "FAILED\n"
-2:
-.text
-	addi sp, sp, -16
-	sw (sp+4), ra
-	sw (sp+8), r1
-	sw (sp+12), r2
-	sw (sp+16), r3
-	sw (sp+4), ra
-	mvi r1, 1
-	mvhi r2, hi(1b)
-	ori r2, r2, lo(1b)
-	mvi r3, (2b - 1b)
-	calli _write
-	lw r3, (sp+16)
-	lw r2, (sp+12)
-	lw r1, (sp+8)
-	lw ra, (sp+4)
-	addi sp, sp, 16
-	ret
diff --git a/tests/tcg/lm32/linker.ld b/tests/tcg/lm32/linker.ld
deleted file mode 100644
index 52d43a4c74..0000000000
--- a/tests/tcg/lm32/linker.ld
+++ /dev/null
@@ -1,55 +0,0 @@
-OUTPUT_FORMAT("elf32-lm32")
-ENTRY(_start)
-
-__DYNAMIC = 0;
-
-MEMORY {
-	ram : ORIGIN = 0x08000000, LENGTH = 0x04000000  /* 64M */
-}
-
-SECTIONS
-{
-	.text :
-	{
-		_ftext = .;
-		*(.text .stub .text.* .gnu.linkonce.t.*)
-		_etext = .;
-	} > ram
-
-	.rodata :
-	{
-		. = ALIGN(4);
-		_frodata = .;
-		*(.rodata .rodata.* .gnu.linkonce.r.*)
-		*(.rodata1)
-		_erodata = .;
-	} > ram
-
-	.data :
-	{
-		. = ALIGN(4);
-		_fdata = .;
-		*(.data .data.* .gnu.linkonce.d.*)
-		*(.data1)
-		_gp = ALIGN(16);
-		*(.sdata .sdata.* .gnu.linkonce.s.*)
-		_edata = .;
-	} > ram
-
-	.bss :
-	{
-		. = ALIGN(4);
-		_fbss = .;
-		*(.dynsbss)
-		*(.sbss .sbss.* .gnu.linkonce.sb.*)
-		*(.scommon)
-		*(.dynbss)
-		*(.bss .bss.* .gnu.linkonce.b.*)
-		*(COMMON)
-		_ebss = .;
-		_end = .;
-	} > ram
-}
-
-PROVIDE(_fstack = ORIGIN(ram) + LENGTH(ram) - 4);
-
diff --git a/tests/tcg/lm32/macros.inc b/tests/tcg/lm32/macros.inc
deleted file mode 100644
index 360ad53c9f..0000000000
--- a/tests/tcg/lm32/macros.inc
+++ /dev/null
@@ -1,90 +0,0 @@
-
-.equ MAX_TESTNAME_LEN, 32
-.macro test_name name
-	.data
-tn_\name:
-	.ascii "\name"
-	.space MAX_TESTNAME_LEN - (. - tn_\name), ' '
-	.text
-	.global \name
-\name:
-	addi sp, sp, -12
-	sw (sp+4), r1
-	sw (sp+8), r2
-	sw (sp+12), r3
-	mvi r1, 1
-	mvhi r2, hi(tn_\name)
-	ori r2, r2, lo(tn_\name)
-	mvi r3, MAX_TESTNAME_LEN
-	calli _write
-	lw r3, (sp+12)
-	lw r2, (sp+8)
-	lw r1, (sp+4)
-	addi sp, sp, 12
-.endm
-
-.macro load reg val
-	mvhi \reg, hi(\val)
-	ori \reg, \reg, lo(\val)
-.endm
-
-.macro tc_pass
-	calli _tc_pass
-.endm
-
-.macro tc_fail
-	addi r12, r12, 1
-	calli _tc_fail
-.endm
-
-.macro check_r3 val
-	mvhi r13, hi(\val)
-	ori r13, r13, lo(\val)
-	be r3, r13, 1f
-	tc_fail
-	bi 2f
-1:
-	tc_pass
-2:
-.endm
-
-.macro check_mem adr val
-	mvhi r13, hi(\adr)
-	ori r13, r13, lo(\adr)
-	mvhi r14, hi(\val)
-	ori r14, r14, lo(\val)
-	lw r13, (r13+0)
-	be r13, r14, 1f
-	tc_fail
-	bi 2f
-1:
-	tc_pass
-2:
-.endm
-
-.macro check_excp excp
-	andi r13, r25, \excp
-	bne r13, r0, 1f
-	tc_fail
-	bi 2f
-1:
-	tc_pass
-2:
-.endm
-
-.macro start
-	.global _main
-	.text
-_main:
-	mvi r12, 0
-.endm
-
-.macro end
-	mv r1, r12
-	calli _exit
-.endm
-
-# base +
-#  0  ctrl
-#  4  pass/fail
-#  8  ptr to test name
diff --git a/tests/tcg/lm32/test_add.S b/tests/tcg/lm32/test_add.S
deleted file mode 100644
index 030ad197bb..0000000000
--- a/tests/tcg/lm32/test_add.S
+++ /dev/null
@@ -1,75 +0,0 @@
-.include "macros.inc"
-
-start
-
-test_name ADD_1
-mvi r1, 0
-mvi r2, 0
-add r3, r1, r2
-check_r3 0
-
-test_name ADD_2
-mvi r1, 0
-mvi r2, 1
-add r3, r1, r2
-check_r3 1
-
-test_name ADD_3
-mvi r1, 1
-mvi r2, 0
-add r3, r1, r2
-check_r3 1
-
-test_name ADD_4
-mvi r1, 1
-mvi r2, -1
-add r3, r1, r2
-check_r3 0
-
-test_name ADD_5
-mvi r1, -1
-mvi r2, 1
-add r3, r1, r2
-check_r3 0
-
-test_name ADD_6
-mvi r1, -1
-mvi r2, 0
-add r3, r1, r2
-check_r3 -1
-
-test_name ADD_7
-mvi r1, 0
-mvi r2, -1
-add r3, r1, r2
-check_r3 -1
-
-test_name ADD_8
-mvi r3, 2
-add r3, r3, r3
-check_r3 4
-
-test_name ADD_9
-mvi r1, 4
-mvi r3, 2
-add r3, r1, r3
-check_r3 6
-
-test_name ADD_10
-mvi r1, 4
-mvi r3, 2
-add r3, r3, r1
-check_r3 6
-
-test_name ADD_11
-mvi r1, 4
-add r3, r1, r1
-check_r3 8
-
-test_name ADD_12
-load r1 0x12345678
-load r2 0xabcdef97
-add r3, r1, r2
-check_r3 0xbe02460f
-
-end
diff --git a/tests/tcg/lm32/test_addi.S b/tests/tcg/lm32/test_addi.S
deleted file mode 100644
index 68e766d1e5..0000000000
--- a/tests/tcg/lm32/test_addi.S
+++ /dev/null
@@ -1,56 +0,0 @@
-.include "macros.inc"
-
-start
-
-test_name ADDI_1
-mvi r1, 0
-addi r3, r1, 0
-check_r3 0
-
-test_name ADDI_2
-mvi r1, 0
-addi r3, r1, 1
-check_r3 1
-
-test_name ADDI_3
-mvi r1, 1
-addi r3, r1, 0
-check_r3 1
-
-test_name ADDI_4
-mvi r1, 1
-addi r3, r1, -1
-check_r3 0
-
-test_name ADDI_5
-mvi r1, -1
-addi r3, r1, 1
-check_r3 0
-
-test_name ADDI_6
-mvi r1, -1
-addi r3, r1, 0
-check_r3 -1
-
-test_name ADDI_7
-mvi r1, 0
-addi r3, r1, -1
-check_r3 -1
-
-test_name ADDI_8
-mvi r3, 4
-addi r3, r3, 4
-check_r3 8
-
-test_name ADDI_9
-mvi r3, 4
-addi r3, r3, -4
-check_r3 0
-
-test_name ADDI_10
-mvi r3, 4
-addi r3, r3, -5
-check_r3 -1
-
-end
-
diff --git a/tests/tcg/lm32/test_and.S b/tests/tcg/lm32/test_and.S
deleted file mode 100644
index 80962ce7a2..0000000000
--- a/tests/tcg/lm32/test_and.S
+++ /dev/null
@@ -1,45 +0,0 @@
-.include "macros.inc"
-
-start
-
-test_name AND_1
-mvi r1, 0
-mvi r2, 0
-and r3, r1, r2
-check_r3 0
-
-test_name AND_2
-mvi r1, 0
-mvi r2, 1
-and r3, r1, r2
-check_r3 0
-
-test_name AND_3
-mvi r1, 1
-mvi r2, 1
-and r3, r1, r2
-check_r3 1
-
-test_name AND_4
-mvi r3, 7
-and r3, r3, r3
-check_r3 7
-
-test_name AND_5
-mvi r1, 7
-and r3, r1, r1
-check_r3 7
-
-test_name AND_6
-mvi r1, 7
-mvi r3, 0
-and r3, r1, r3
-check_r3 0
-
-test_name AND_7
-load r1 0xaa55aa55
-load r2 0x55aa55aa
-and r3, r1, r2
-check_r3 0
-
-end
diff --git a/tests/tcg/lm32/test_andhi.S b/tests/tcg/lm32/test_andhi.S
deleted file mode 100644
index 4f73af550b..0000000000
--- a/tests/tcg/lm32/test_andhi.S
+++ /dev/null
@@ -1,35 +0,0 @@
-.include "macros.inc"
-
-start
-
-test_name ANDHI_1
-mvi r1, 0
-andhi r3, r1, 0
-check_r3 0
-
-test_name ANDHI_2
-mvi r1, 1
-andhi r3, r1, 1
-check_r3 0
-
-test_name ANDHI_3
-load r1 0x000f0000
-andhi r3, r1, 1
-check_r3 0x00010000
-
-test_name ANDHI_4
-load r1 0xffffffff
-andhi r3, r1, 0xffff
-check_r3 0xffff0000
-
-test_name ANDHI_5
-load r1 0xffffffff
-andhi r3, r1, 0
-check_r3 0
-
-test_name ANDHI_6
-load r3 0x55aaffff
-andhi r3, r3, 0xaaaa
-check_r3 0x00aa0000
-
-end
diff --git a/tests/tcg/lm32/test_andi.S b/tests/tcg/lm32/test_andi.S
deleted file mode 100644
index da1b0a32f7..0000000000
--- a/tests/tcg/lm32/test_andi.S
+++ /dev/null
@@ -1,35 +0,0 @@
-.include "macros.inc"
-
-start
-
-test_name ANDI_1
-mvi r1, 0
-andi r3, r1, 0
-check_r3 0
-
-test_name ANDI_2
-mvi r1, 1
-andi r3, r1, 1
-check_r3 1
-
-test_name ANDI_3
-load r1 0x000f0000
-andi r3, r1, 1
-check_r3 0
-
-test_name ANDI_4
-load r1 0xffffffff
-andi r3, r1, 0xffff
-check_r3 0xffff
-
-test_name ANDI_5
-load r1 0xffffffff
-andi r3, r1, 0
-check_r3 0
-
-test_name ANDI_6
-load r3 0xffff55aa
-andi r3, r3, 0xaaaa
-check_r3 0x000000aa
-
-end
diff --git a/tests/tcg/lm32/test_b.S b/tests/tcg/lm32/test_b.S
deleted file mode 100644
index 98172d8a95..0000000000
--- a/tests/tcg/lm32/test_b.S
+++ /dev/null
@@ -1,13 +0,0 @@
-.include "macros.inc"
-
-start
-
-test_name B_1
-load r1 jump
-b r1
-tc_fail
-end
-
-jump:
-tc_pass
-end
diff --git a/tests/tcg/lm32/test_be.S b/tests/tcg/lm32/test_be.S
deleted file mode 100644
index 635cabacad..0000000000
--- a/tests/tcg/lm32/test_be.S
+++ /dev/null
@@ -1,48 +0,0 @@
-.include "macros.inc"
-
-start
-
-test_name BE_1
-mvi r1, 0
-mvi r2, 0
-be r1, r2, 1f
-tc_fail
-bi 2f
-1:
-tc_pass
-2:
-
-test_name BE_2
-mvi r1, 1
-mvi r2, 0
-be r1, r2, 1f
-tc_pass
-bi 2f
-1:
-tc_fail
-2:
-
-test_name BE_3
-mvi r1, 0
-mvi r2, 1
-be r1, r2, 1f
-tc_pass
-bi 2f
-1:
-tc_fail
-2:
-
-bi 2f
-1:
-tc_pass
-bi 3f
-2:
-test_name BE_4
-mvi r1, 1
-mvi r2, 1
-be r1, r2, 1b
-tc_fail
-3:
-
-end
-
diff --git a/tests/tcg/lm32/test_bg.S b/tests/tcg/lm32/test_bg.S
deleted file mode 100644
index 81823c2304..0000000000
--- a/tests/tcg/lm32/test_bg.S
+++ /dev/null
@@ -1,78 +0,0 @@
-.include "macros.inc"
-
-start
-
-test_name BG_1
-mvi r1, 0
-mvi r2, 0
-bg r1, r2, 1f
-tc_pass
-bi 2f
-1:
-tc_fail
-2:
-
-test_name BG_2
-mvi r1, 1
-mvi r2, 0
-bg r1, r2, 1f
-tc_fail
-bi 2f
-1:
-tc_pass
-2:
-
-test_name BG_3
-mvi r1, 0
-mvi r2, 1
-bg r1, r2, 1f
-tc_pass
-bi 2f
-1:
-tc_fail
-2:
-
-test_name BG_4
-mvi r1, 0
-mvi r2, -1
-bg r1, r2, 1f
-tc_fail
-bi 2f
-1:
-tc_pass
-2:
-
-test_name BG_5
-mvi r1, -1
-mvi r2, 0
-bg r1, r2, 1f
-tc_pass
-bi 2f
-1:
-tc_fail
-2:
-
-test_name BG_6
-mvi r1, -1
-mvi r2, -1
-bg r1, r2, 1f
-tc_pass
-bi 2f
-1:
-tc_fail
-2:
-
-bi 2f
-1:
-tc_pass
-bi 3f
-2:
-test_name BG_7
-mvi r1, 1
-mvi r2, 0
-bg r1, r2, 1b
-tc_fail
-3:
-
-end
-
diff --git a/tests/tcg/lm32/test_bge.S b/tests/tcg/lm32/test_bge.S
deleted file mode 100644
index 6684d15a55..0000000000
--- a/tests/tcg/lm32/test_bge.S
+++ /dev/null
@@ -1,78 +0,0 @@
-.include "macros.inc"
-
-start
-
-test_name BGE_1
-mvi r1, 0
-mvi r2, 0
-bge r1, r2, 1f
-tc_fail
-bi 2f
-1:
-tc_pass
-2:
-
-test_name BGE_2
-mvi r1, 1
-mvi r2, 0
-bge r1, r2, 1f
-tc_fail
-bi 2f
-1:
-tc_pass
-2:
-
-test_name BGE_3
-mvi r1, 0
-mvi r2, 1
-bge r1, r2, 1f
-tc_pass
-bi 2f
-1:
-tc_fail
-2:
-
-test_name BGE_4
-mvi r1, 0
-mvi r2, -1
-bge r1, r2, 1f
-tc_fail
-bi 2f
-1:
-tc_pass
-2:
-
-test_name BGE_5
-mvi r1, -1
-mvi r2, 0
-bge r1, r2, 1f
-tc_pass
-bi 2f
-1:
-tc_fail
-2:
-
-test_name BGE_6
-mvi r1, -1
-mvi r2, -1
-bge r1, r2, 1f
-tc_fail
-bi 2f
-1:
-tc_pass
-2:
-
-bi 2f
-1:
-tc_pass
-bi 3f
-2:
-test_name BGE_7
-mvi r1, 1
-mvi r2, 0
-bge r1, r2, 1b
-tc_fail
-3:
-
-end
-
diff --git a/tests/tcg/lm32/test_bgeu.S b/tests/tcg/lm32/test_bgeu.S
deleted file mode 100644
index be440308fd..0000000000
--- a/tests/tcg/lm32/test_bgeu.S
+++ /dev/null
@@ -1,78 +0,0 @@
-.include "macros.inc"
-
-start
-
-test_name BGEU_1
-mvi r1, 0
-mvi r2, 0
-bgeu r1, r2, 1f
-tc_fail
-bi 2f
-1:
-tc_pass
-2:
-
-test_name BGEU_2
-mvi r1, 1
-mvi r2, 0
-bgeu r1, r2, 1f
-tc_fail
-bi 2f
-1:
-tc_pass
-2:
-
-test_name BGEU_3
-mvi r1, 0
-mvi r2, 1
-bgeu r1, r2, 1f
-tc_pass
-bi 2f
-1:
-tc_fail
-2:
-
-test_name BGEU_4
-mvi r1, 0
-mvi r2, -1
-bgeu r1, r2, 1f
-tc_pass
-bi 2f
-1:
-tc_fail
-2:
-
-test_name BGEU_5
-mvi r1, -1
-mvi r2, 0
-bgeu r1, r2, 1f
-tc_fail
-bi 2f
-1:
-tc_pass
-2:
-
-test_name BGEU_6
-mvi r1, -1
-mvi r2, -1
-bgeu r1, r2, 1f
-tc_fail
-bi 2f
-1:
-tc_pass
-2:
-
-bi 2f
-1:
-tc_pass
-bi 3f
-2:
-test_name BGEU_7
-mvi r1, 1
-mvi r2, 0
-bgeu r1, r2, 1b
-tc_fail
-3:
-
-end
-
diff --git a/tests/tcg/lm32/test_bgu.S b/tests/tcg/lm32/test_bgu.S
deleted file mode 100644
index 8cc695b310..0000000000
--- a/tests/tcg/lm32/test_bgu.S
+++ /dev/null
@@ -1,78 +0,0 @@
-.include "macros.inc"
-
-start
-
-test_name BGU_1
-mvi r1, 0
-mvi r2, 0
-bgu r1, r2, 1f
-tc_pass
-bi 2f
-1:
-tc_fail
-2:
-
-test_name BGU_2
-mvi r1, 1
-mvi r2, 0
-bgu r1, r2, 1f
-tc_fail
-bi 2f
-1:
-tc_pass
-2:
-
-test_name BGU_3
-mvi r1, 0
-mvi r2, 1
-bgu r1, r2, 1f
-tc_pass
-bi 2f
-1:
-tc_fail
-2:
-
-test_name BGU_4
-mvi r1, 0
-mvi r2, -1
-bgu r1, r2, 1f
-tc_pass
-bi 2f
-1:
-tc_fail
-2:
-
-test_name BGU_5
-mvi r1, -1
-mvi r2, 0
-bgu r1, r2, 1f
-tc_fail
-bi 2f
-1:
-tc_pass
-2:
-
-test_name BGU_6
-mvi r1, -1
-mvi r2, -1
-bgu r1, r2, 1f
-tc_pass
-bi 2f
-1:
-tc_fail
-2:
-
-bi 2f
-1:
-tc_pass
-bi 3f
-2:
-test_name BGU_7
-mvi r1, 1
-mvi r2, 0
-bgu r1, r2, 1b
-tc_fail
-3:
-
-end
-
diff --git a/tests/tcg/lm32/test_bi.S b/tests/tcg/lm32/test_bi.S
deleted file mode 100644
index a1fbd6fc07..0000000000
--- a/tests/tcg/lm32/test_bi.S
+++ /dev/null
@@ -1,23 +0,0 @@
-.include "macros.inc"
-
-start
-
-test_name BI_1
-bi jump
-tc_fail
-end
-
-jump_back:
-tc_pass
-end
-
-jump:
-tc_pass
-
-test_name BI_2
-bi jump_back
-tc_fail
-
-end
-
-
diff --git a/tests/tcg/lm32/test_bne.S b/tests/tcg/lm32/test_bne.S
deleted file mode 100644
index 871a006755..0000000000
--- a/tests/tcg/lm32/test_bne.S
+++ /dev/null
@@ -1,48 +0,0 @@
-.include "macros.inc"
-
-start
-
-test_name BNE_1
-mvi r1, 0
-mvi r2, 0
-bne r1, r2, 1f
-tc_pass
-bi 2f
-1:
-tc_fail
-2:
-
-test_name BNE_2
-mvi r1, 1
-mvi r2, 0
-bne r1, r2, 1f
-tc_fail
-bi 2f
-1:
-tc_pass
-2:
-
-test_name BNE_3
-mvi r1, 0
-mvi r2, 1
-bne r1, r2, 1f
-tc_fail
-bi 2f
-1:
-tc_pass
-2:
-
-bi 2f
-1:
-tc_fail
-bi 3f
-2:
-test_name BNE_4
-mvi r1, 1
-mvi r2, 1
-bne r1, r2, 1b
-tc_pass
-3:
-
-end
-
diff --git a/tests/tcg/lm32/test_break.S b/tests/tcg/lm32/test_break.S
deleted file mode 100644
index 0384fc6128..0000000000
--- a/tests/tcg/lm32/test_break.S
+++ /dev/null
@@ -1,20 +0,0 @@
-.include "macros.inc"
-
-start
-
-test_name BREAK_1
-mvi r1, 1
-wcsr IE, r1
-insn:
-break
-check_excp 1
-
-test_name BREAK_2
-mv r3, ba
-check_r3 insn
-
-test_name BREAK_3
-rcsr r3, IE
-check_r3 4
-
-end
diff --git a/tests/tcg/lm32/test_bret.S b/tests/tcg/lm32/test_bret.S
deleted file mode 100644
index 645210e434..0000000000
--- a/tests/tcg/lm32/test_bret.S
+++ /dev/null
@@ -1,38 +0,0 @@
-.include "macros.inc"
-
-start
-
-test_name BRET_1
-mvi r1, 4
-wcsr IE, r1
-load ba mark
-bret
-tc_fail
-bi 1f
-
-mark:
-tc_pass
-
-1:
-test_name BRET_2
-rcsr r3, IE
-check_r3 5
-
-test_name BRET_3
-mvi r1, 0
-wcsr IE, r1
-load ba mark2
-bret
-tc_fail
-bi 1f
-
-mark2:
-tc_pass
-
-1:
-test_name BRET_4
-rcsr r3, IE
-check_r3 0
-
-end
-
diff --git a/tests/tcg/lm32/test_call.S b/tests/tcg/lm32/test_call.S
deleted file mode 100644
index 1b91a5f2be..0000000000
--- a/tests/tcg/lm32/test_call.S
+++ /dev/null
@@ -1,16 +0,0 @@
-.include "macros.inc"
-
-start
-
-test_name CALL_1
-load r1 mark
-call r1
-return:
-
-tc_fail
-end
-
-mark:
-mv r3, ra
-check_r3 return
-end
diff --git a/tests/tcg/lm32/test_calli.S b/tests/tcg/lm32/test_calli.S
deleted file mode 100644
index 1d87ae6e21..0000000000
--- a/tests/tcg/lm32/test_calli.S
+++ /dev/null
@@ -1,15 +0,0 @@
-.include "macros.inc"
-
-start
-
-test_name CALLI_1
-calli mark
-return:
-
-tc_fail
-end
-
-mark:
-mv r3, ra
-check_r3 return
-end
diff --git a/tests/tcg/lm32/test_cmpe.S b/tests/tcg/lm32/test_cmpe.S
deleted file mode 100644
index 60a885500b..0000000000
--- a/tests/tcg/lm32/test_cmpe.S
+++ /dev/null
@@ -1,40 +0,0 @@
-.include "macros.inc"
-
-start
-
-test_name CMPE_1
-mvi r1, 0
-mvi r2, 0
-cmpe r3, r1, r2
-check_r3 1
-
-test_name CMPE_2
-mvi r1, 0
-mvi r2, 1
-cmpe r3, r1, r2
-check_r3 0
-
-test_name CMPE_3
-mvi r1, 1
-mvi r2, 0
-cmpe r3, r1, r2
-check_r3 0
-
-test_name CMPE_4
-mvi r3, 0
-mvi r2, 1
-cmpe r3, r3, r2
-check_r3 0
-
-test_name CMPE_5
-mvi r3, 0
-mvi r2, 0
-cmpe r3, r3, r2
-check_r3 1
-
-test_name CMPE_6
-mvi r3, 0
-cmpe r3, r3, r3
-check_r3 1
-
-end
diff --git a/tests/tcg/lm32/test_cmpei.S b/tests/tcg/lm32/test_cmpei.S
deleted file mode 100644
index c3d3566ad3..0000000000
--- a/tests/tcg/lm32/test_cmpei.S
+++ /dev/null
@@ -1,35 +0,0 @@
-.include "macros.inc"
-
-start
-
-test_name CMPEI_1
-mvi r1, 0
-cmpei r3, r1, 0
-check_r3 1
-
-test_name CMPEI_2
-mvi r1, 0
-cmpei r3, r1, 1
-check_r3 0
-
-test_name CMPEI_3
-mvi r1, 1
-cmpei r3, r1, 0
-check_r3 0
-
-test_name CMPEI_4
-load r1 0xffffffff
-cmpei r3, r1, -1
-check_r3 1
-
-test_name CMPEI_5
-mvi r3, 0
-cmpei r3, r3, 0
-check_r3 1
-
-test_name CMPEI_6
-mvi r3, 0
-cmpei r3, r3, 1
-check_r3 0
-
-end
diff --git a/tests/tcg/lm32/test_cmpg.S b/tests/tcg/lm32/test_cmpg.S
deleted file mode 100644
index 012407874c..0000000000
--- a/tests/tcg/lm32/test_cmpg.S
+++ /dev/null
@@ -1,64 +0,0 @@
-.include "macros.inc"
-
-start
-
-test_name CMPG_1
-mvi r1, 0
-mvi r2, 0
-cmpg r3, r1, r2
-check_r3 0
-
-test_name CMPG_2
-mvi r1, 0
-mvi r2, 1
-cmpg r3, r1, r2
-check_r3 0
-
-test_name CMPG_3
-mvi r1, 1
-mvi r2, 0
-cmpg r3, r1, r2
-check_r3 1
-
-test_name CMPG_4
-mvi r1, 1
-mvi r2, 1
-cmpg r3, r1, r2
-check_r3 0
-
-test_name CMPG_5
-mvi r1, 0
-mvi r2, -1
-cmpg r3, r1, r2
-check_r3 1
-
-test_name CMPG_6
-mvi r1, -1
-mvi r2, 0
-cmpg r3, r1, r2
-check_r3 0
-
-test_name CMPG_7
-mvi r1, -1
-mvi r2, -1
-cmpg r3, r1, r2
-check_r3 0
-
-test_name CMPG_8
-mvi r3, 0
-mvi r2, 1
-cmpg r3, r3, r2
-check_r3 0
-
-test_name CMPG_9
-mvi r3, 1
-mvi r2, 0
-cmpg r3, r3, r2
-check_r3 1
-
-test_name CMPG_10
-mvi r3, 0
-cmpg r3, r3, r3
-check_r3 0
-
-end
diff --git a/tests/tcg/lm32/test_cmpge.S b/tests/tcg/lm32/test_cmpge.S
deleted file mode 100644
index 84620a00e3..0000000000
--- a/tests/tcg/lm32/test_cmpge.S
+++ /dev/null
@@ -1,64 +0,0 @@
-.include "macros.inc"
-
-start
-
-test_name CMPGE_1
-mvi r1, 0
-mvi r2, 0
-cmpge r3, r1, r2
-check_r3 1
-
-test_name CMPGE_2
-mvi r1, 0
-mvi r2, 1
-cmpge r3, r1, r2
-check_r3 0
-
-test_name CMPGE_3
-mvi r1, 1
-mvi r2, 0
-cmpge r3, r1, r2
-check_r3 1
-
-test_name CMPGE_4
-mvi r1, 1
-mvi r2, 1
-cmpge r3, r1, r2
-check_r3 1
-
-test_name CMPGE_5
-mvi r1, 0
-mvi r2, -1
-cmpge r3, r1, r2
-check_r3 1
-
-test_name CMPGE_6
-mvi r1, -1
-mvi r2, 0
-cmpge r3, r1, r2
-check_r3 0
-
-test_name CMPGE_7
-mvi r1, -1
-mvi r2, -1
-cmpge r3, r1, r2
-check_r3 1
-
-test_name CMPGE_8
-mvi r3, 0
-mvi r2, 1
-cmpge r3, r3, r2
-check_r3 0
-
-test_name CMPGE_9
-mvi r3, 1
-mvi r2, 0
-cmpge r3, r3, r2
-check_r3 1
-
-test_name CMPGE_10
-mvi r3, 0
-cmpge r3, r3, r3
-check_r3 1
-
-end
diff --git a/tests/tcg/lm32/test_cmpgei.S b/tests/tcg/lm32/test_cmpgei.S
deleted file mode 100644
index 6e388a2a35..0000000000
--- a/tests/tcg/lm32/test_cmpgei.S
+++ /dev/null
@@ -1,70 +0,0 @@
-.include "macros.inc"
-
-start
-
-test_name CMPGEI_1
-mvi r1, 0
-cmpgei r3, r1, 0
-check_r3 1
-
-test_name CMPGEI_2
-mvi r1, 0
-cmpgei r3, r1, 1
-check_r3 0
-
-test_name CMPGEI_3
-mvi r1, 1
-cmpgei r3, r1, 0
-check_r3 1
-
-test_name CMPGEI_4
-mvi r1, 1
-cmpgei r3, r1, 1
-check_r3 1
-
-test_name CMPGEI_5
-mvi r1, 0
-cmpgei r3, r1, -1
-check_r3 1
-
-test_name CMPGEI_6
-mvi r1, -1
-cmpgei r3, r1, 0
-check_r3 0
-
-test_name CMPGEI_7
-mvi r1, -1
-cmpgei r3, r1, -1
-check_r3 1
-
-test_name CMPGEI_8
-mvi r3, 0
-cmpgei r3, r3, 1
-check_r3 0
-
-test_name CMPGEI_9
-mvi r3, 1
-cmpgei r3, r3, 0
-check_r3 1
-
-test_name CMPGEI_10
-mvi r3, 0
-cmpgei r3, r3, 0
-check_r3 1
-
-test_name CMPGEI_11
-mvi r1, 0
-cmpgei r3, r1, -32768
-check_r3 1
-
-test_name CMPGEI_12
-mvi r1, -1
-cmpgei r3, r1, -32768
-check_r3 1
-
-test_name CMPGEI_13
-mvi r1, -32768
-cmpgei r3, r1, -32768
-check_r3 1
-
-end
diff --git a/tests/tcg/lm32/test_cmpgeu.S b/tests/tcg/lm32/test_cmpgeu.S
deleted file mode 100644
index 2110ccb6b7..0000000000
--- a/tests/tcg/lm32/test_cmpgeu.S
+++ /dev/null
@@ -1,64 +0,0 @@
-.include "macros.inc"
-
-start
-
-test_name CMPGEU_1
-mvi r1, 0
-mvi r2, 0
-cmpgeu r3, r1, r2
-check_r3 1
-
-test_name CMPGEU_2
-mvi r1, 0
-mvi r2, 1
-cmpgeu r3, r1, r2
-check_r3 0
-
-test_name CMPGEU_3
-mvi r1, 1
-mvi r2, 0
-cmpgeu r3, r1, r2
-check_r3 1
-
-test_name CMPGEU_4
-mvi r1, 1
-mvi r2, 1
-cmpgeu r3, r1, r2
-check_r3 1
-
-test_name CMPGEU_5
-mvi r1, 0
-mvi r2, -1
-cmpgeu r3, r1, r2
-check_r3 0
-
-test_name CMPGEU_6
-mvi r1, -1
-mvi r2, 0
-cmpgeu r3, r1, r2
-check_r3 1
-
-test_name CMPGEU_7
-mvi r1, -1
-mvi r2, -1
-cmpgeu r3, r1, r2
-check_r3 1
-
-test_name CMPGEU_8
-mvi r3, 0
-mvi r2, 1
-cmpgeu r3, r3, r2
-check_r3 0
-
-test_name CMPGEU_9
-mvi r3, 1
-mvi r2, 0
-cmpgeu r3, r3, r2
-check_r3 1
-
-test_name CMPGEU_10
-mvi r3, 0
-cmpgeu r3, r3, r3
-check_r3 1
-
-end
diff --git a/tests/tcg/lm32/test_cmpgeui.S b/tests/tcg/lm32/test_cmpgeui.S
deleted file mode 100644
index 3866d96cb7..0000000000
--- a/tests/tcg/lm32/test_cmpgeui.S
+++ /dev/null
@@ -1,70 +0,0 @@
-.include "macros.inc"
-
-start
-
-test_name CMPGEUI_1
-mvi r1, 0
-cmpgeui r3, r1, 0
-check_r3 1
-
-test_name CMPGEUI_2
-mvi r1, 0
-cmpgeui r3, r1, 1
-check_r3 0
-
-test_name CMPGEUI_3
-mvi r1, 1
-cmpgeui r3, r1, 0
-check_r3 1
-
-test_name CMPGEUI_4
-mvi r1, 1
-cmpgeui r3, r1, 1
-check_r3 1
-
-test_name CMPGEUI_5
-mvi r1, 0
-cmpgeui r3, r1, 0xffff
-check_r3 0
-
-test_name CMPGEUI_6
-mvi r1, -1
-cmpgeui r3, r1, 0
-check_r3 1
-
-test_name CMPGEUI_7
-mvi r1, -1
-cmpgeui r3, r1, 0xffff
-check_r3 1
-
-test_name CMPGEUI_8
-mvi r3, 0
-cmpgeui r3, r3, 1
-check_r3 0
-
-test_name CMPGEUI_9
-mvi r3, 1
-cmpgeui r3, r3, 0
-check_r3 1
-
-test_name CMPGEUI_10
-mvi r3, 0
-cmpgeui r3, r3, 0
-check_r3 1
-
-test_name CMPGEUI_11
-mvi r1, 0
-cmpgeui r3, r1, 0x8000
-check_r3 0
-
-test_name CMPGEUI_12
-mvi r1, -1
-cmpgeui r3, r1, 0x8000
-check_r3 1
-
-test_name CMPGEUI_13
-ori r1, r0, 0x8000
-cmpgeui r3, r1, 0x8000
-check_r3 1
-
-end
diff --git a/tests/tcg/lm32/test_cmpgi.S b/tests/tcg/lm32/test_cmpgi.S
deleted file mode 100644
index 21695f97ab..0000000000
--- a/tests/tcg/lm32/test_cmpgi.S
+++ /dev/null
@@ -1,70 +0,0 @@
-.include "macros.inc"
-
-start
-
-test_name CMPGI_1
-mvi r1, 0
-cmpgi r3, r1, 0
-check_r3 0
-
-test_name CMPGI_2
-mvi r1, 0
-cmpgi r3, r1, 1
-check_r3 0
-
-test_name CMPGI_3
-mvi r1, 1
-cmpgi r3, r1, 0
-check_r3 1
-
-test_name CMPGI_4
-mvi r1, 1
-cmpgi r3, r1, 1
-check_r3 0
-
-test_name CMPGI_5
-mvi r1, 0
-cmpgi r3, r1, -1
-check_r3 1
-
-test_name CMPGI_6
-mvi r1, -1
-cmpgi r3, r1, 0
-check_r3 0
-
-test_name CMPGI_7
-mvi r1, -1
-cmpgi r3, r1, -1
-check_r3 0
-
-test_name CMPGI_8
-mvi r3, 0
-cmpgi r3, r3, 1
-check_r3 0
-
-test_name CMPGI_9
-mvi r3, 1
-cmpgi r3, r3, 0
-check_r3 1
-
-test_name CMPGI_10
-mvi r3, 0
-cmpgi r3, r3, 0
-check_r3 0
-
-test_name CMPGI_11
-mvi r1, 0
-cmpgi r3, r1, -32768
-check_r3 1
-
-test_name CMPGI_12
-mvi r1, -1
-cmpgi r3, r1, -32768
-check_r3 1
-
-test_name CMPGI_13
-mvi r1, -32768
-cmpgi r3, r1, -32768
-check_r3 0
-
-end
diff --git a/tests/tcg/lm32/test_cmpgu.S b/tests/tcg/lm32/test_cmpgu.S
deleted file mode 100644
index dd465471ea..0000000000
--- a/tests/tcg/lm32/test_cmpgu.S
+++ /dev/null
@@ -1,64 +0,0 @@
-.include "macros.inc"
-
-start
-
-test_name CMPGU_1
-mvi r1, 0
-mvi r2, 0
-cmpgu r3, r1, r2
-check_r3 0
-
-test_name CMPGU_2
-mvi r1, 0
-mvi r2, 1
-cmpgu r3, r1, r2
-check_r3 0
-
-test_name CMPGU_3
-mvi r1, 1
-mvi r2, 0
-cmpgu r3, r1, r2
-check_r3 1
-
-test_name CMPGU_4
-mvi r1, 1
-mvi r2, 1
-cmpgu r3, r1, r2
-check_r3 0
-
-test_name CMPGU_5
-mvi r1, 0
-mvi r2, -1
-cmpgu r3, r1, r2
-check_r3 0
-
-test_name CMPGU_6
-mvi r1, -1
-mvi r2, 0
-cmpgu r3, r1, r2
-check_r3 1
-
-test_name CMPGU_7
-mvi r1, -1
-mvi r2, -1
-cmpgu r3, r1, r2
-check_r3 0
-
-test_name CMPGU_8
-mvi r3, 0
-mvi r2, 1
-cmpgu r3, r3, r2
-check_r3 0
-
-test_name CMPGU_9
-mvi r3, 1
-mvi r2, 0
-cmpgu r3, r3, r2
-check_r3 1
-
-test_name CMPGU_10
-mvi r3, 0
-cmpgu r3, r3, r3
-check_r3 0
-
-end
diff --git a/tests/tcg/lm32/test_cmpgui.S b/tests/tcg/lm32/test_cmpgui.S
deleted file mode 100644
index dd94001492..0000000000
--- a/tests/tcg/lm32/test_cmpgui.S
+++ /dev/null
@@ -1,70 +0,0 @@
-.include "macros.inc"
-
-start
-
-test_name CMPGUI_1
-mvi r1, 0
-cmpgui r3, r1, 0
-check_r3 0
-
-test_name CMPGUI_2
-mvi r1, 0
-cmpgui r3, r1, 1
-check_r3 0
-
-test_name CMPGUI_3
-mvi r1, 1
-cmpgui r3, r1, 0
-check_r3 1
-
-test_name CMPGUI_4
-mvi r1, 1
-cmpgui r3, r1, 1
-check_r3 0
-
-test_name CMPGUI_5
-mvi r1, 0
-cmpgui r3, r1, 0xffff
-check_r3 0
-
-test_name CMPGUI_6
-mvi r1, -1
-cmpgui r3, r1, 0
-check_r3 1
-
-test_name CMPGUI_7
-mvi r1, -1
-cmpgui r3, r1, 0xffff
-check_r3 1
-
-test_name CMPGUI_8
-mvi r3, 0
-cmpgui r3, r3, 1
-check_r3 0
-
-test_name CMPGUI_9
-mvi r3, 1
-cmpgui r3, r3, 0
-check_r3 1
-
-test_name CMPGUI_10
-mvi r3, 0
-cmpgui r3, r3, 0
-check_r3 0
-
-test_name CMPGUI_11
-mvi r1, 0
-cmpgui r3, r1, 0x8000
-check_r3 0
-
-test_name CMPGUI_12
-mvi r1, -1
-cmpgui r3, r1, 0x8000
-check_r3 1
-
-test_name CMPGUI_13
-ori r1, r0, 0x8000
-cmpgui r3, r1, 0x8000
-check_r3 0
-
-end
diff --git a/tests/tcg/lm32/test_cmpne.S b/tests/tcg/lm32/test_cmpne.S
deleted file mode 100644
index 0f1078114c..0000000000
--- a/tests/tcg/lm32/test_cmpne.S
+++ /dev/null
@@ -1,40 +0,0 @@
-.include "macros.inc"
-
-start
-
-test_name CMPNE_1
-mvi r1, 0
-mvi r2, 0
-cmpne r3, r1, r2
-check_r3 0
-
-test_name CMPNE_2
-mvi r1, 0
-mvi r2, 1
-cmpne r3, r1, r2
-check_r3 1
-
-test_name CMPNE_3
-mvi r1, 1
-mvi r2, 0
-cmpne r3, r1, r2
-check_r3 1
-
-test_name CMPNE_4
-mvi r3, 0
-mvi r2, 1
-cmpne r3, r3, r2
-check_r3 1
-
-test_name CMPNE_5
-mvi r3, 0
-mvi r2, 0
-cmpne r3, r3, r2
-check_r3 0
-
-test_name CMPNE_6
-mvi r3, 0
-cmpne r3, r3, r3
-check_r3 0
-
-end
diff --git a/tests/tcg/lm32/test_cmpnei.S b/tests/tcg/lm32/test_cmpnei.S
deleted file mode 100644
index 060dd9d394..0000000000
--- a/tests/tcg/lm32/test_cmpnei.S
+++ /dev/null
@@ -1,35 +0,0 @@
-.include "macros.inc"
-
-start
-
-test_name CMPNEI_1
-mvi r1, 0
-cmpnei r3, r1, 0
-check_r3 0
-
-test_name CMPNEI_2
-mvi r1, 0
-cmpnei r3, r1, 1
-check_r3 1
-
-test_name CMPNEI_3
-mvi r1, 1
-cmpnei r3, r1, 0
-check_r3 1
-
-test_name CMPNEI_4
-load r1 0xffffffff
-cmpnei r3, r1, -1
-check_r3 0
-
-test_name CMPNEI_5
-mvi r3, 0
-cmpnei r3, r3, 0
-check_r3 0
-
-test_name CMPNEI_6
-mvi r3, 0
-cmpnei r3, r3, 1
-check_r3 1
-
-end
diff --git a/tests/tcg/lm32/test_divu.S b/tests/tcg/lm32/test_divu.S
deleted file mode 100644
index f381d095c5..0000000000
--- a/tests/tcg/lm32/test_divu.S
+++ /dev/null
@@ -1,29 +0,0 @@
-.include "macros.inc"
-
-start
-
-test_name DIVU_1
-mvi r1, 0
-mvi r2, 1
-divu r3, r1, r2
-check_r3 0
-
-test_name DIVU_2
-mvi r1, 1
-mvi r2, 1
-divu r3, r1, r2
-check_r3 1
-
-test_name DIVU_3
-mvi r1, 0
-mvi r2, 0
-divu r3, r1, r2
-check_excp 16
-
-test_name DIVU_4
-load r1 0xabcdef12
-load r2 0x12345
-divu r3, r1, r2
-check_r3 0x9700
-
-end
diff --git a/tests/tcg/lm32/test_eret.S b/tests/tcg/lm32/test_eret.S
deleted file mode 100644
index 6830bd1abf..0000000000
--- a/tests/tcg/lm32/test_eret.S
+++ /dev/null
@@ -1,38 +0,0 @@
-.include "macros.inc"
-
-start
-
-test_name ERET_1
-mvi r1, 2
-wcsr IE, r1
-load ea mark
-eret
-tc_fail
-bi 1f
-
-mark:
-tc_pass
-
-1:
-test_name ERET_2
-rcsr r3, IE
-check_r3 3
-
-test_name ERET_3
-mvi r1, 0
-wcsr IE, r1
-load ea mark2
-eret
-tc_fail
-bi 1f
-
-mark2:
-tc_pass
-
-1:
-test_name ERET_4
-rcsr r3, IE
-check_r3 0
-
-end
-
diff --git a/tests/tcg/lm32/test_lb.S b/tests/tcg/lm32/test_lb.S
deleted file mode 100644
index d677eea4c4..0000000000
--- a/tests/tcg/lm32/test_lb.S
+++ /dev/null
@@ -1,49 +0,0 @@
-.include "macros.inc"
-
-start
-
-test_name LB_1
-load r1 data
-lb r3, (r1+0)
-check_r3 0x7e
-
-test_name LB_2
-load r1 data
-lb r3, (r1+1)
-check_r3 0x7f
-
-test_name LB_3
-load r1 data
-lb r3, (r1+-1)
-check_r3 0x7d
-
-test_name LB_4
-load r1 data_msb
-lb r3, (r1+0)
-check_r3 0xfffffffe
-
-test_name LB_5
-load r1 data_msb
-lb r3, (r1+1)
-check_r3 0xffffffff
-
-test_name LB_6
-load r1 data_msb
-lb r3, (r1+-1)
-check_r3 0xfffffffd
-
-test_name LB_7
-load r3 data
-lb r3, (r3+0)
-check_r3 0x7e
-
-end
-
-.data
-	.align 4
-	.byte 0x7a, 0x7b, 0x7c, 0x7d
-data:
-	.byte 0x7e, 0x7f, 0x70, 0x71
-	.byte 0xfa, 0xfb, 0xfc, 0xfd
-data_msb:
-	.byte 0xfe, 0xff, 0xf0, 0xf1
diff --git a/tests/tcg/lm32/test_lbu.S b/tests/tcg/lm32/test_lbu.S
deleted file mode 100644
index dc5d5f67d3..0000000000
--- a/tests/tcg/lm32/test_lbu.S
+++ /dev/null
@@ -1,49 +0,0 @@
-.include "macros.inc"
-
-start
-
-test_name LBU_1
-load r1 data
-lbu r3, (r1+0)
-check_r3 0x7e
-
-test_name LBU_2
-load r1 data
-lbu r3, (r1+1)
-check_r3 0x7f
-
-test_name LBU_3
-load r1 data
-lbu r3, (r1+-1)
-check_r3 0x7d
-
-test_name LBU_4
-load r1 data_msb
-lbu r3, (r1+0)
-check_r3 0xfe
-
-test_name LBU_5
-load r1 data_msb
-lbu r3, (r1+1)
-check_r3 0xff
-
-test_name LBU_6
-load r1 data_msb
-lbu r3, (r1+-1)
-check_r3 0xfd
-
-test_name LBU_7
-load r3 data
-lbu r3, (r3+0)
-check_r3 0x7e
-
-end
-
-.data
-	.align 4
-	.byte 0x7a, 0x7b, 0x7c, 0x7d
-data:
-	.byte 0x7e, 0x7f, 0x70, 0x71
-	.byte 0xfa, 0xfb, 0xfc, 0xfd
-data_msb:
-	.byte 0xfe, 0xff, 0xf0, 0xf1
diff --git a/tests/tcg/lm32/test_lh.S b/tests/tcg/lm32/test_lh.S
deleted file mode 100644
index 397996bddd..0000000000
--- a/tests/tcg/lm32/test_lh.S
+++ /dev/null
@@ -1,49 +0,0 @@
-.include "macros.inc"
-
-start
-
-test_name LH_1
-load r1 data
-lh r3, (r1+0)
-check_r3 0x7e7f
-
-test_name LH_2
-load r1 data
-lh r3, (r1+2)
-check_r3 0x7071
-
-test_name LH_3
-load r1 data
-lh r3, (r1+-2)
-check_r3 0x7c7d
-
-test_name LH_4
-load r1 data_msb
-lh r3, (r1+0)
-check_r3 0xfffffeff
-
-test_name LH_5
-load r1 data_msb
-lh r3, (r1+2)
-check_r3 0xfffff0f1
-
-test_name LH_6
-load r1 data_msb
-lh r3, (r1+-2)
-check_r3 0xfffffcfd
-
-test_name LH_7
-load r3 data
-lh r3, (r3+0)
-check_r3 0x7e7f
-
-end
-
-.data
-	.align 4
-	.byte 0x7a, 0x7b, 0x7c, 0x7d
-data:
-	.byte 0x7e, 0x7f, 0x70, 0x71
-	.byte 0xfa, 0xfb, 0xfc, 0xfd
-data_msb:
-	.byte 0xfe, 0xff, 0xf0, 0xf1
diff --git a/tests/tcg/lm32/test_lhu.S b/tests/tcg/lm32/test_lhu.S
deleted file mode 100644
index 8de7c52560..0000000000
--- a/tests/tcg/lm32/test_lhu.S
+++ /dev/null
@@ -1,49 +0,0 @@
-.include "macros.inc"
-
-start
-
-test_name LHU_1
-load r1 data
-lhu r3, (r1+0)
-check_r3 0x7e7f
-
-test_name LHU_2
-load r1 data
-lhu r3, (r1+2)
-check_r3 0x7071
-
-test_name LHU_3
-load r1 data
-lhu r3, (r1+-2)
-check_r3 0x7c7d
-
-test_name LHU_4
-load r1 data_msb
-lhu r3, (r1+0)
-check_r3 0xfeff
-
-test_name LHU_5
-load r1 data_msb
-lhu r3, (r1+2)
-check_r3 0xf0f1
-
-test_name LHU_6
-load r1 data_msb
-lhu r3, (r1+-2)
-check_r3 0xfcfd
-
-test_name LHU_7
-load r3 data
-lhu r3, (r3+0)
-check_r3 0x7e7f
-
-end
-
-.data
-	.align 4
-	.byte 0x7a, 0x7b, 0x7c, 0x7d
-data:
-	.byte 0x7e, 0x7f, 0x70, 0x71
-	.byte 0xfa, 0xfb, 0xfc, 0xfd
-data_msb:
-	.byte 0xfe, 0xff, 0xf0, 0xf1
diff --git a/tests/tcg/lm32/test_lw.S b/tests/tcg/lm32/test_lw.S
deleted file mode 100644
index 996e5f8c88..0000000000
--- a/tests/tcg/lm32/test_lw.S
+++ /dev/null
@@ -1,32 +0,0 @@
-.include "macros.inc"
-
-start
-
-test_name LW_1
-load r1 data
-lw r3, (r1+0)
-check_r3 0x7e7f7071
-
-test_name LW_2
-load r1 data
-lw r3, (r1+4)
-check_r3 0x72737475
-
-test_name LW_3
-load r1 data
-lw r3, (r1+-4)
-check_r3 0x7a7b7c7d
-
-test_name LW_4
-load r3 data
-lw r3, (r3+0)
-check_r3 0x7e7f7071
-
-end
-
-.data
-	.align 4
-	.byte 0x7a, 0x7b, 0x7c, 0x7d
-data:
-	.byte 0x7e, 0x7f, 0x70, 0x71
-	.byte 0x72, 0x73, 0x74, 0x75
diff --git a/tests/tcg/lm32/test_modu.S b/tests/tcg/lm32/test_modu.S
deleted file mode 100644
index 42486900b4..0000000000
--- a/tests/tcg/lm32/test_modu.S
+++ /dev/null
@@ -1,35 +0,0 @@
-.include "macros.inc"
-
-start
-
-test_name MODU_1
-mvi r1, 0
-mvi r2, 1
-modu r3, r1, r2
-check_r3 0
-
-test_name MODU_2
-mvi r1, 1
-mvi r2, 1
-modu r3, r1, r2
-check_r3 0
-
-test_name MODU_3
-mvi r1, 3
-mvi r2, 2
-modu r3, r1, r2
-check_r3 1
-
-test_name MODU_4
-mvi r1, 0
-mvi r2, 0
-modu r3, r1, r2
-check_excp 16
-
-test_name MODU_5
-load r1 0xabcdef12
-load r2 0x12345
-modu r3, r1, r2
-check_r3 0x3c12
-
-end
diff --git a/tests/tcg/lm32/test_mul.S b/tests/tcg/lm32/test_mul.S
deleted file mode 100644
index e9b937e648..0000000000
--- a/tests/tcg/lm32/test_mul.S
+++ /dev/null
@@ -1,70 +0,0 @@
-.include "macros.inc"
-
-start
-
-test_name MUL_1
-mvi r1, 0
-mvi r2, 0
-mul r3, r1, r2
-check_r3 0
-
-test_name MUL_2
-mvi r1, 1
-mvi r2, 0
-mul r3, r1, r2
-check_r3 0
-
-test_name MUL_3
-mvi r1, 0
-mvi r2, 1
-mul r3, r1, r2
-check_r3 0
-
-test_name MUL_4
-mvi r1, 1
-mvi r2, 1
-mul r3, r1, r2
-check_r3 1
-
-test_name MUL_5
-mvi r1, 2
-mvi r2, -1
-mul r3, r1, r2
-check_r3 -2
-
-test_name MUL_6
-mvi r1, -2
-mvi r2, -1
-mul r3, r1, r2
-check_r3 2
-
-test_name MUL_7
-mvi r1, 0x1234
-mvi r2, 0x789
-mul r3, r1, r2
-check_r3 0x8929d4
-
-test_name MUL_8
-mvi r3, 4
-mul r3, r3, r3
-check_r3 16
-
-test_name MUL_9
-mvi r2, 2
-mvi r3, 4
-mul r3, r3, r2
-check_r3 8
-
-test_name MUL_10
-load r1 0x12345678
-load r2 0x7bcdef12
-mul r3, r1, r2
-check_r3 0xa801c70
-
-test_name MUL_11
-load r1 0x12345678
-load r2 0xabcdef12
-mul r3, r1, r2
-check_r3 0x8a801c70
-
-end
diff --git a/tests/tcg/lm32/test_muli.S b/tests/tcg/lm32/test_muli.S
deleted file mode 100644
index d6dd4a0f7e..0000000000
--- a/tests/tcg/lm32/test_muli.S
+++ /dev/null
@@ -1,45 +0,0 @@
-.include "macros.inc"
-
-start
-
-test_name MULI_1
-mvi r1, 0
-muli r3, r1, 0
-check_r3 0
-
-test_name MULI_2
-mvi r1, 1
-muli r3, r1, 0
-check_r3 0
-
-test_name MULI_3
-mvi r1, 0
-muli r3, r1, 1
-check_r3 0
-
-test_name MULI_4
-mvi r1, 1
-muli r3, r1, 1
-check_r3 1
-
-test_name MULI_5
-mvi r1, 2
-muli r3, r1, -1
-check_r3 -2
-
-test_name MULI_6
-mvi r1, -2
-muli r3, r1, -1
-check_r3 2
-
-test_name MULI_7
-mvi r1, 0x1234
-muli r3, r1, 0x789
-check_r3 0x8929d4
-
-test_name MULI_8
-mvi r3, 4
-muli r3, r3, 4
-check_r3 16
-
-end
diff --git a/tests/tcg/lm32/test_nor.S b/tests/tcg/lm32/test_nor.S
deleted file mode 100644
index 74d7592565..0000000000
--- a/tests/tcg/lm32/test_nor.S
+++ /dev/null
@@ -1,51 +0,0 @@
-.include "macros.inc"
-
-start
-
-test_name NOR_1
-mvi r1, 0
-mvi r2, 0
-nor r3, r1, r2
-check_r3 0xffffffff
-
-test_name NOR_2
-mvi r1, 0
-mvi r2, 1
-nor r3, r1, r2
-check_r3 0xfffffffe
-
-test_name NOR_3
-mvi r1, 1
-mvi r2, 1
-nor r3, r1, r2
-check_r3 0xfffffffe
-
-test_name NOR_4
-mvi r1, 1
-mvi r2, 0
-nor r3, r1, r2
-check_r3 0xfffffffe
-
-test_name NOR_5
-load r1 0xaa55aa55
-load r2 0x55aa55aa
-nor r3, r1, r2
-check_r3 0
-
-test_name NOR_6
-load r1 0xaa550000
-load r2 0x0000aa55
-nor r3, r1, r2
-check_r3 0x55aa55aa
-
-test_name NOR_7
-load r1 0xaa55aa55
-nor r3, r1, r1
-check_r3 0x55aa55aa
-
-test_name NOR_8
-load r3 0xaa55aa55
-nor r3, r3, r3
-check_r3 0x55aa55aa
-
-end
diff --git a/tests/tcg/lm32/test_nori.S b/tests/tcg/lm32/test_nori.S
deleted file mode 100644
index d00309c73e..0000000000
--- a/tests/tcg/lm32/test_nori.S
+++ /dev/null
@@ -1,35 +0,0 @@
-.include "macros.inc"
-
-start
-
-test_name NORI_1
-mvi r1, 0
-nori r3, r1, 0
-check_r3 0xffffffff
-
-test_name NORI_2
-mvi r1, 0
-nori r3, r1, 1
-check_r3 0xfffffffe
-
-test_name NORI_3
-mvi r1, 1
-nori r3, r1, 1
-check_r3 0xfffffffe
-
-test_name NORI_4
-mvi r1, 1
-nori r3, r1, 0
-check_r3 0xfffffffe
-
-test_name NORI_5
-load r1 0xaa55aa55
-nori r3, r1, 0x55aa
-check_r3 0x55aa0000
-
-test_name NORI_6
-load r3 0xaa55aa55
-nori r3, r3, 0x55aa
-check_r3 0x55aa0000
-
-end
diff --git a/tests/tcg/lm32/test_or.S b/tests/tcg/lm32/test_or.S
deleted file mode 100644
index 4ed292330e..0000000000
--- a/tests/tcg/lm32/test_or.S
+++ /dev/null
@@ -1,51 +0,0 @@
-.include "macros.inc"
-
-start
-
-test_name OR_1
-mvi r1, 0
-mvi r2, 0
-or r3, r1, r2
-check_r3 0
-
-test_name OR_2
-mvi r1, 0
-mvi r2, 1
-or r3, r1, r2
-check_r3 1
-
-test_name OR_3
-mvi r1, 1
-mvi r2, 1
-or r3, r1, r2
-check_r3 1
-
-test_name OR_4
-mvi r1, 1
-mvi r2, 0
-or r3, r1, r2
-check_r3 1
-
-test_name OR_5
-load r1 0xaa55aa55
-load r2 0x55aa55aa
-or r3, r1, r2
-check_r3 0xffffffff
-
-test_name OR_6
-load r1 0xaa550000
-load r2 0x0000aa55
-or r3, r1, r2
-check_r3 0xaa55aa55
-
-test_name OR_7
-load r1 0xaa55aa55
-or r3, r1, r1
-check_r3 0xaa55aa55
-
-test_name OR_8
-load r3 0xaa55aa55
-or r3, r3, r3
-check_r3 0xaa55aa55
-
-end
diff --git a/tests/tcg/lm32/test_orhi.S b/tests/tcg/lm32/test_orhi.S
deleted file mode 100644
index 78b7600e03..0000000000
--- a/tests/tcg/lm32/test_orhi.S
+++ /dev/null
@@ -1,35 +0,0 @@
-.include "macros.inc"
-
-start
-
-test_name ORHI_1
-mvi r1, 0
-orhi r3, r1, 0
-check_r3 0
-
-test_name ORHI_2
-mvi r1, 0
-orhi r3, r1, 1
-check_r3 0x00010000
-
-test_name ORHI_3
-load r1 0x00010000
-orhi r3, r1, 1
-check_r3 0x00010000
-
-test_name ORHI_4
-mvi r1, 1
-orhi r3, r1, 0
-check_r3 1
-
-test_name ORHI_5
-load r1 0xaa55aa55
-orhi r3, r1, 0x55aa
-check_r3 0xffffaa55
-
-test_name ORHI_6
-load r3 0xaa55aa55
-orhi r3, r3, 0x55aa
-check_r3 0xffffaa55
-
-end
diff --git a/tests/tcg/lm32/test_ori.S b/tests/tcg/lm32/test_ori.S
deleted file mode 100644
index 3d576cdb8b..0000000000
--- a/tests/tcg/lm32/test_ori.S
+++ /dev/null
@@ -1,35 +0,0 @@
-.include "macros.inc"
-
-start
-
-test_name ORI_1
-mvi r1, 0
-ori r3, r1, 0
-check_r3 0
-
-test_name ORI_2
-mvi r1, 0
-ori r3, r1, 1
-check_r3 1
-
-test_name ORI_3
-mvi r1, 1
-ori r3, r1, 1
-check_r3 1
-
-test_name ORI_4
-mvi r1, 1
-ori r3, r1, 0
-check_r3 1
-
-test_name ORI_5
-load r1 0xaa55aa55
-ori r3, r1, 0x55aa
-check_r3 0xaa55ffff
-
-test_name ORI_6
-load r3 0xaa55aa55
-ori r3, r3, 0x55aa
-check_r3 0xaa55ffff
-
-end
diff --git a/tests/tcg/lm32/test_ret.S b/tests/tcg/lm32/test_ret.S
deleted file mode 100644
index 320264f148..0000000000
--- a/tests/tcg/lm32/test_ret.S
+++ /dev/null
@@ -1,14 +0,0 @@
-.include "macros.inc"
-
-start
-
-test_name RET_1
-load ra mark
-ret
-
-tc_fail
-end
-
-mark:
-tc_pass
-end
diff --git a/tests/tcg/lm32/test_sb.S b/tests/tcg/lm32/test_sb.S
deleted file mode 100644
index b15a89d342..0000000000
--- a/tests/tcg/lm32/test_sb.S
+++ /dev/null
@@ -1,32 +0,0 @@
-.include "macros.inc"
-
-start
-
-test_name SB_1
-load r1 data
-load r2 0xf0f1f2aa
-sb (r1+0), r2
-check_mem data 0xaa000000
-
-test_name SB_2
-load r1 data
-load r2 0xf0f1f2bb
-sb (r1+1), r2
-check_mem data 0xaabb0000
-
-test_name SB_3
-load r1 data
-load r2 0xf0f1f2cc
-sb (r1+-1), r2
-check_mem data0 0x000000cc
-
-end
-
-.data
-	.align 4
-data0:
-	.byte 0, 0, 0, 0
-data:
-	.byte 0, 0, 0, 0
-data1:
-	.byte 0, 0, 0, 0
diff --git a/tests/tcg/lm32/test_scall.S b/tests/tcg/lm32/test_scall.S
deleted file mode 100644
index 46032f841d..0000000000
--- a/tests/tcg/lm32/test_scall.S
+++ /dev/null
@@ -1,24 +0,0 @@
-.include "macros.inc"
-
-start
-
-test_name SCALL_1
-mvi r1, 1
-wcsr IE, r1
-# we are running in a semi hosted environment
-# therefore we have to set r8 to some unused system
-# call
-mvi r8, 0
-insn:
-scall
-check_excp 64
-
-test_name SCALL_2
-mv r3, ea
-check_r3 insn
-
-test_name SCALL_3
-rcsr r3, IE
-check_r3 2
-
-end
diff --git a/tests/tcg/lm32/test_sextb.S b/tests/tcg/lm32/test_sextb.S
deleted file mode 100644
index 58db8ee8b9..0000000000
--- a/tests/tcg/lm32/test_sextb.S
+++ /dev/null
@@ -1,20 +0,0 @@
-.include "macros.inc"
-
-start
-
-test_name SEXTB_1
-mvi r1, 0
-sextb r3, r1
-check_r3 0
-
-test_name SEXTB_2
-mvi r1, 0x7f
-sextb r3, r1
-check_r3 0x0000007f
-
-test_name SEXTB_3
-mvi r1, 0x80
-sextb r3, r1
-check_r3 0xffffff80
-
-end
diff --git a/tests/tcg/lm32/test_sexth.S b/tests/tcg/lm32/test_sexth.S
deleted file mode 100644
index a059ec3ee6..0000000000
--- a/tests/tcg/lm32/test_sexth.S
+++ /dev/null
@@ -1,20 +0,0 @@
-.include "macros.inc"
-
-start
-
-test_name SEXTH_1
-mvi r1, 0
-sexth r3, r1
-check_r3 0
-
-test_name SEXTH_2
-load r1 0x7fff
-sexth r3, r1
-check_r3 0x00007fff
-
-test_name SEXTH_3
-load r1 0x8000
-sexth r3, r1
-check_r3 0xffff8000
-
-end
diff --git a/tests/tcg/lm32/test_sh.S b/tests/tcg/lm32/test_sh.S
deleted file mode 100644
index bba10224f6..0000000000
--- a/tests/tcg/lm32/test_sh.S
+++ /dev/null
@@ -1,32 +0,0 @@
-.include "macros.inc"
-
-start
-
-test_name SH_1
-load r1 data
-load r2 0xf0f1aaaa
-sh (r1+0), r2
-check_mem data 0xaaaa0000
-
-test_name SH_2
-load r1 data
-load r2 0xf0f1bbbb
-sh (r1+2), r2
-check_mem data 0xaaaabbbb
-
-test_name SH_3
-load r1 data
-load r2 0xf0f1cccc
-sh (r1+-2), r2
-check_mem data0 0x0000cccc
-
-end
-
-.data
-	.align 4
-data0:
-	.byte 0, 0, 0, 0
-data:
-	.byte 0, 0, 0, 0
-data1:
-	.byte 0, 0, 0, 0
diff --git a/tests/tcg/lm32/test_sl.S b/tests/tcg/lm32/test_sl.S
deleted file mode 100644
index 0aee17fdb8..0000000000
--- a/tests/tcg/lm32/test_sl.S
+++ /dev/null
@@ -1,45 +0,0 @@
-.include "macros.inc"
-
-start
-
-test_name SL_1
-mvi r1, 1
-mvi r2, 0
-sl r3, r1, r2
-check_r3 1
-
-test_name SL_2
-mvi r1, 0
-mvi r2, 1
-sl r3, r1, r2
-check_r3 0
-
-test_name SL_3
-mvi r1, 1
-mvi r2, 31
-sl r3, r1, r2
-check_r3 0x80000000
-
-test_name SL_4
-mvi r1, 16
-mvi r2, 31
-sl r3, r1, r2
-check_r3 0
-
-test_name SL_5
-mvi r1, 1
-mvi r2, 34
-sl r3, r1, r2
-check_r3 4
-
-test_name SL_6
-mvi r1, 2
-sl r3, r1, r1
-check_r3 8
-
-test_name SL_7
-mvi r3, 2
-sl r3, r3, r3
-check_r3 8
-
-end
diff --git a/tests/tcg/lm32/test_sli.S b/tests/tcg/lm32/test_sli.S
deleted file mode 100644
index a421de9014..0000000000
--- a/tests/tcg/lm32/test_sli.S
+++ /dev/null
@@ -1,30 +0,0 @@
-.include "macros.inc"
-
-start
-
-test_name SLI_1
-mvi r1, 1
-sli r3, r1, 0
-check_r3 1
-
-test_name SLI_2
-mvi r1, 0
-sli r3, r1, 1
-check_r3 0
-
-test_name SLI_3
-mvi r1, 1
-sli r3, r1, 31
-check_r3 0x80000000
-
-test_name SLI_4
-mvi r1, 16
-sli r3, r1, 31
-check_r3 0
-
-test_name SLI_7
-mvi r3, 2
-sli r3, r3, 2
-check_r3 8
-
-end
diff --git a/tests/tcg/lm32/test_sr.S b/tests/tcg/lm32/test_sr.S
deleted file mode 100644
index 62431a9864..0000000000
--- a/tests/tcg/lm32/test_sr.S
+++ /dev/null
@@ -1,57 +0,0 @@
-.include "macros.inc"
-
-start
-
-test_name SR_1
-mvi r1, 1
-mvi r2, 0
-sr r3, r1, r2
-check_r3 1
-
-test_name SR_2
-mvi r1, 0
-mvi r2, 1
-sr r3, r1, r2
-check_r3 0
-
-test_name SR_3
-load r1 0x40000000
-mvi r2, 30
-sr r3, r1, r2
-check_r3 1
-
-test_name SR_4
-load r1 0x40000000
-mvi r2, 31
-sr r3, r1, r2
-check_r3 0
-
-test_name SR_5
-mvi r1, 16
-mvi r2, 34
-sr r3, r1, r2
-check_r3 4
-
-test_name SR_6
-mvi r1, 2
-sr r3, r1, r1
-check_r3 0
-
-test_name SR_7
-mvi r3, 2
-sr r3, r3, r3
-check_r3 0
-
-test_name SR_8
-mvi r1, 0xfffffff0
-mvi r2, 2
-sr r3, r1, r2
-check_r3 0xfffffffc
-
-test_name SR_9
-mvi r1, 0xfffffff0
-mvi r2, 4
-sr r3, r1, r2
-check_r3 0xffffffff
-
-end
diff --git a/tests/tcg/lm32/test_sri.S b/tests/tcg/lm32/test_sri.S
deleted file mode 100644
index c1be907b5b..0000000000
--- a/tests/tcg/lm32/test_sri.S
+++ /dev/null
@@ -1,40 +0,0 @@
-.include "macros.inc"
-
-start
-
-test_name SRI_1
-mvi r1, 1
-sri r3, r1, 0
-check_r3 1
-
-test_name SRI_2
-mvi r1, 0
-sri r3, r1, 1
-check_r3 0
-
-test_name SRI_3
-load r1 0x40000000
-sri r3, r1, 30
-check_r3 1
-
-test_name SRI_4
-load r1 0x40000000
-sri r3, r1, 31
-check_r3 0
-
-test_name SRI_5
-mvi r3, 2
-sri r3, r3, 2
-check_r3 0
-
-test_name SRI_6
-mvi r1, 0xfffffff0
-sri r3, r1, 2
-check_r3 0xfffffffc
-
-test_name SRI_7
-mvi r1, 0xfffffff0
-sri r3, r1, 4
-check_r3 0xffffffff
-
-end
diff --git a/tests/tcg/lm32/test_sru.S b/tests/tcg/lm32/test_sru.S
deleted file mode 100644
index 2ab0b54c77..0000000000
--- a/tests/tcg/lm32/test_sru.S
+++ /dev/null
@@ -1,57 +0,0 @@
-.include "macros.inc"
-
-start
-
-test_name SRU_1
-mvi r1, 1
-mvi r2, 0
-sru r3, r1, r2
-check_r3 1
-
-test_name SRU_2
-mvi r1, 0
-mvi r2, 1
-sru r3, r1, r2
-check_r3 0
-
-test_name SRU_3
-load r1 0x40000000
-mvi r2, 30
-sru r3, r1, r2
-check_r3 1
-
-test_name SRU_4
-load r1 0x40000000
-mvi r2, 31
-sru r3, r1, r2
-check_r3 0
-
-test_name SRU_5
-mvi r1, 16
-mvi r2, 34
-sru r3, r1, r2
-check_r3 4
-
-test_name SRU_6
-mvi r1, 2
-sru r3, r1, r1
-check_r3 0
-
-test_name SRU_7
-mvi r3, 2
-sru r3, r3, r3
-check_r3 0
-
-test_name SRU_8
-mvi r1, 0xfffffff0
-mvi r2, 2
-sru r3, r1, r2
-check_r3 0x3ffffffc
-
-test_name SRU_9
-mvi r1, 0xfffffff0
-mvi r2, 4
-sru r3, r1, r2
-check_r3 0x0fffffff
-
-end
diff --git a/tests/tcg/lm32/test_srui.S b/tests/tcg/lm32/test_srui.S
deleted file mode 100644
index 872c374121..0000000000
--- a/tests/tcg/lm32/test_srui.S
+++ /dev/null
@@ -1,40 +0,0 @@
-.include "macros.inc"
-
-start
-
-test_name SRUI_1
-mvi r1, 1
-srui r3, r1, 0
-check_r3 1
-
-test_name SRUI_2
-mvi r1, 0
-srui r3, r1, 1
-check_r3 0
-
-test_name SRUI_3
-load r1 0x40000000
-srui r3, r1, 30
-check_r3 1
-
-test_name SRUI_4
-load r1 0x40000000
-srui r3, r1, 31
-check_r3 0
-
-test_name SRUI_5
-mvi r3, 2
-srui r3, r3, 2
-check_r3 0
-
-test_name SRUI_6
-mvi r1, 0xfffffff0
-srui r3, r1, 2
-check_r3 0x3ffffffc
-
-test_name SRUI_7
-mvi r1, 0xfffffff0
-srui r3, r1, 4
-check_r3 0x0fffffff
-
-end
diff --git a/tests/tcg/lm32/test_sub.S b/tests/tcg/lm32/test_sub.S
deleted file mode 100644
index 44b74a9e10..0000000000
--- a/tests/tcg/lm32/test_sub.S
+++ /dev/null
@@ -1,75 +0,0 @@
-.include "macros.inc"
-
-start
-
-test_name SUB_1
-mvi r1, 0
-mvi r2, 0
-sub r3, r1, r2
-check_r3 0
-
-test_name SUB_2
-mvi r1, 0
-mvi r2, 1
-sub r3, r1, r2
-check_r3 -1
-
-test_name SUB_3
-mvi r1, 1
-mvi r2, 0
-sub r3, r1, r2
-check_r3 1
-
-test_name SUB_4
-mvi r1, 1
-mvi r2, -1
-sub r3, r1, r2
-check_r3 2
-
-test_name SUB_5
-mvi r1, -1
-mvi r2, 1
-sub r3, r1, r2
-check_r3 -2
-
-test_name SUB_6
-mvi r1, -1
-mvi r2, 0
-sub r3, r1, r2
-check_r3 -1
-
-test_name SUB_7
-mvi r1, 0
-mvi r2, -1
-sub r3, r1, r2
-check_r3 1
-
-test_name SUB_8
-mvi r3, 2
-sub r3, r3, r3
-check_r3 0
-
-test_name SUB_9
-mvi r1, 4
-mvi r3, 2
-sub r3, r1, r3
-check_r3 2
-
-test_name SUB_10
-mvi r1, 4
-mvi r3, 2
-sub r3, r3, r1
-check_r3 -2
-
-test_name SUB_11
-mvi r1, 4
-sub r3, r1, r1
-check_r3 0
-
-test_name SUB_12
-load r1 0x12345678
-load r2 0xabcdef97
-sub r3, r1, r2
-check_r3 0x666666e1
-
-end
diff --git a/tests/tcg/lm32/test_sw.S b/tests/tcg/lm32/test_sw.S
deleted file mode 100644
index 2b1c017e7b..0000000000
--- a/tests/tcg/lm32/test_sw.S
+++ /dev/null
@@ -1,38 +0,0 @@
-.include "macros.inc"
-
-start
-
-test_name SW_1
-load r1 data
-load r2 0xaabbccdd
-sw (r1+0), r2
-check_mem data 0xaabbccdd
-
-test_name SW_2
-load r1 data
-load r2 0x00112233
-sw (r1+4), r2
-check_mem data1 0x00112233
-
-test_name SW_3
-load r1 data
-load r2 0x44556677
-sw (r1+-4), r2
-check_mem data0 0x44556677
-
-test_name SW_4
-load r1 data
-sw (r1+0), r1
-lw r3, (r1+0)
-check_r3 data
-
-end
-
-.data
-	.align 4
-data0:
-	.byte 0, 0, 0, 0
-data:
-	.byte 0, 0, 0, 0
-data1:
-	.byte 0, 0, 0, 0
diff --git a/tests/tcg/lm32/test_xnor.S b/tests/tcg/lm32/test_xnor.S
deleted file mode 100644
index 14a62075f6..0000000000
--- a/tests/tcg/lm32/test_xnor.S
+++ /dev/null
@@ -1,51 +0,0 @@
-.include "macros.inc"
-
-start
-
-test_name XNOR_1
-mvi r1, 0
-mvi r2, 0
-xnor r3, r1, r2
-check_r3 0xffffffff
-
-test_name XNOR_2
-mvi r1, 0
-mvi r2, 1
-xnor r3, r1, r2
-check_r3 0xfffffffe
-
-test_name XNOR_3
-mvi r1, 1
-mvi r2, 1
-xnor r3, r1, r2
-check_r3 0xffffffff
-
-test_name XNOR_4
-mvi r1, 1
-mvi r2, 0
-xnor r3, r1, r2
-check_r3 0xfffffffe
-
-test_name XNOR_5
-load r1 0xaa55aa55
-load r2 0x55aa55aa
-xnor r3, r1, r2
-check_r3 0
-
-test_name XNOR_6
-load r1 0xaa550000
-load r2 0x0000aa55
-xnor r3, r1, r2
-check_r3 0x55aa55aa
-
-test_name XNOR_7
-load r1 0xaa55aa55
-xnor r3, r1, r1
-check_r3 0xffffffff
-
-test_name XNOR_8
-load r3 0xaa55aa55
-xnor r3, r3, r3
-check_r3 0xffffffff
-
-end
diff --git a/tests/tcg/lm32/test_xnori.S b/tests/tcg/lm32/test_xnori.S
deleted file mode 100644
index 9d9c3c6780..0000000000
--- a/tests/tcg/lm32/test_xnori.S
+++ /dev/null
@@ -1,35 +0,0 @@
-.include "macros.inc"
-
-start
-
-test_name XNORI_1
-mvi r1, 0
-xnori r3, r1, 0
-check_r3 0xffffffff
-
-test_name XNORI_2
-mvi r1, 0
-xnori r3, r1, 1
-check_r3 0xfffffffe
-
-test_name XNORI_3
-mvi r1, 1
-xnori r3, r1, 1
-check_r3 0xffffffff
-
-test_name XNORI_4
-mvi r1, 1
-xnori r3, r1, 0
-check_r3 0xfffffffe
-
-test_name XNORI_5
-load r1 0xaa55aa55
-xnori r3, r1, 0x5555
-check_r3 0x55aa00ff
-
-test_name XNORI_6
-load r3 0xaa55aa55
-xnori r3, r3, 0x5555
-check_r3 0x55aa00ff
-
-end
diff --git a/tests/tcg/lm32/test_xor.S b/tests/tcg/lm32/test_xor.S
deleted file mode 100644
index 6c6e712bae..0000000000
--- a/tests/tcg/lm32/test_xor.S
+++ /dev/null
@@ -1,51 +0,0 @@
-.include "macros.inc"
-
-start
-
-test_name XOR_1
-mvi r1, 0
-mvi r2, 0
-xor r3, r1, r2
-check_r3 0
-
-test_name XOR_2
-mvi r1, 0
-mvi r2, 1
-xor r3, r1, r2
-check_r3 1
-
-test_name XOR_3
-mvi r1, 1
-mvi r2, 1
-xor r3, r1, r2
-check_r3 0
-
-test_name XOR_4
-mvi r1, 1
-mvi r2, 0
-xor r3, r1, r2
-check_r3 1
-
-test_name XOR_5
-load r1 0xaa55aa55
-load r2 0x55aa55aa
-xor r3, r1, r2
-check_r3 0xffffffff
-
-test_name XOR_6
-load r1 0xaa550000
-load r2 0x0000aa55
-xor r3, r1, r2
-check_r3 0xaa55aa55
-
-test_name XOR_7
-load r1 0xaa55aa55
-xor r3, r1, r1
-check_r3 0
-
-test_name XOR_8
-load r3 0xaa55aa55
-xor r3, r3, r3
-check_r3 0
-
-end
diff --git a/tests/tcg/lm32/test_xori.S b/tests/tcg/lm32/test_xori.S
deleted file mode 100644
index 2051699f12..0000000000
--- a/tests/tcg/lm32/test_xori.S
+++ /dev/null
@@ -1,35 +0,0 @@
-.include "macros.inc"
-
-start
-
-test_name XORI_1
-mvi r1, 0
-xori r3, r1, 0
-check_r3 0
-
-test_name XORI_2
-mvi r1, 0
-xori r3, r1, 1
-check_r3 1
-
-test_name XORI_3
-mvi r1, 1
-xori r3, r1, 1
-check_r3 0
-
-test_name XORI_4
-mvi r1, 1
-xori r3, r1, 0
-check_r3 1
-
-test_name XORI_5
-load r1 0xaa55aa55
-xori r3, r1, 0x5555
-check_r3 0xaa55ff00
-
-test_name XORI_6
-load r3 0xaa55aa55
-xori r3, r3, 0x5555
-check_r3 0xaa55ff00
-
-end
-- 
2.26.3


