Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4067451D9A5
	for <lists+qemu-devel@lfdr.de>; Fri,  6 May 2022 15:53:57 +0200 (CEST)
Received: from localhost ([::1]:50274 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmyP6-0002E8-Am
	for lists+qemu-devel@lfdr.de; Fri, 06 May 2022 09:53:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33838)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nmyKe-0005uH-5y
 for qemu-devel@nongnu.org; Fri, 06 May 2022 09:49:23 -0400
Received: from us-smtp-delivery-74.mimecast.com ([170.10.133.74]:60084)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nmyKa-0005q2-2G
 for qemu-devel@nongnu.org; Fri, 06 May 2022 09:49:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651844954;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=8z4V3y6EHASJShqks+3kwFADzdkSZNZqOzgOvcA/XpA=;
 b=WIlJ2tVn7dI/DjqIto+fqpY/NuAaZsV2bcK4AtMhOeeNkNQdI5rGYBheK4cc+h/F/7xtbU
 gIaW7SnFbVJu7Dl0hwJBJxC6ai5DfYExpBswrBpVOOPikW1MzTcJVtoIDWJqKuYfX2GTlR
 kxXGJQ++04BVT45r0Dcxm1cDXWa6IhE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-530-rEbWCyPfOTOiAIuuBhFN-A-1; Fri, 06 May 2022 09:49:13 -0400
X-MC-Unique: rEbWCyPfOTOiAIuuBhFN-A-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2B1D486B8AF
 for <qemu-devel@nongnu.org>; Fri,  6 May 2022 13:49:13 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.36.112.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E11F84010E48
 for <qemu-devel@nongnu.org>; Fri,  6 May 2022 13:49:12 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id AD0B121E6880; Fri,  6 May 2022 15:49:11 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/4] Clean up header guards again
Date: Fri,  6 May 2022 15:49:07 +0200
Message-Id: <20220506134911.2856099-1-armbru@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.74; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-74.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

Our use of header guards is rather sloppy.  Sloppiness there can lead
to confusing compilation errors.  This series cleans up existing
header guards.  In particular, it normalizes guard symbols to follow a
common pattern, in the hope of making clashes less likely.  It doesn't
add new header guards.  We have more than 250 headers without a
recognizable header guard.  A few of them are for multiple inclusion,
a few more don't need header guards because they don't do anything but
include, but the majority probably should have one.  Left for another
day.

Previously cleaned up in merge commit 01807c8b0e9 (2019) and merge
commit ca3d87d4c84 (2016).

Markus Armbruster (4):
  Clean up header guards that don't match their file name
  Clean up ill-advised or unusual header guards
  Normalize header guard symbol definition
  Clean up decorations and whitespace around header guards

 accel/tcg/tcg-accel-ops-icount.h            | 6 +++---
 accel/tcg/tcg-accel-ops-mttcg.h             | 6 +++---
 accel/tcg/tcg-accel-ops-rr.h                | 6 +++---
 accel/tcg/tcg-accel-ops.h                   | 6 +++---
 block/copy-on-read.h                        | 6 +++---
 block/coroutines.h                          | 6 +++---
 bsd-user/arm/target.h                       | 2 +-
 bsd-user/arm/target_arch.h                  | 6 +++---
 bsd-user/arm/target_arch_cpu.h              | 6 +++---
 bsd-user/arm/target_arch_elf.h              | 7 ++++---
 bsd-user/arm/target_arch_reg.h              | 6 +++---
 bsd-user/arm/target_arch_signal.h           | 7 ++++---
 bsd-user/arm/target_arch_sigtramp.h         | 6 +++---
 bsd-user/arm/target_arch_sysarch.h          | 6 +++---
 bsd-user/arm/target_arch_thread.h           | 7 ++++---
 bsd-user/arm/target_arch_vmparam.h          | 7 ++++---
 bsd-user/arm/target_syscall.h               | 6 +++---
 bsd-user/bsd-file.h                         | 6 +++---
 bsd-user/errno_defs.h                       | 6 +++---
 bsd-user/freebsd/host-os.h                  | 6 +++---
 bsd-user/freebsd/target_os_elf.h            | 7 ++++---
 bsd-user/freebsd/target_os_siginfo.h        | 7 ++++---
 bsd-user/freebsd/target_os_signal.h         | 6 +++---
 bsd-user/freebsd/target_os_stack.h          | 6 +++---
 bsd-user/freebsd/target_os_thread.h         | 6 +++---
 bsd-user/freebsd/target_os_user.h           | 6 +++---
 bsd-user/freebsd/target_os_vmparam.h        | 7 ++++---
 bsd-user/i386/target.h                      | 7 +++----
 bsd-user/i386/target_arch.h                 | 6 +++---
 bsd-user/i386/target_arch_cpu.h             | 6 +++---
 bsd-user/i386/target_arch_elf.h             | 7 ++++---
 bsd-user/i386/target_arch_reg.h             | 6 +++---
 bsd-user/i386/target_arch_sigtramp.h        | 6 +++---
 bsd-user/i386/target_arch_sysarch.h         | 6 +++---
 bsd-user/i386/target_arch_thread.h          | 7 ++++---
 bsd-user/i386/target_arch_vmparam.h         | 7 ++++---
 bsd-user/netbsd/host-os.h                   | 6 +++---
 bsd-user/netbsd/target_os_elf.h             | 7 ++++---
 bsd-user/netbsd/target_os_siginfo.h         | 6 +++---
 bsd-user/netbsd/target_os_signal.h          | 6 +++---
 bsd-user/netbsd/target_os_stack.h           | 6 +++---
 bsd-user/netbsd/target_os_thread.h          | 6 +++---
 bsd-user/openbsd/host-os.h                  | 6 +++---
 bsd-user/openbsd/target_os_elf.h            | 7 ++++---
 bsd-user/openbsd/target_os_siginfo.h        | 6 +++---
 bsd-user/openbsd/target_os_signal.h         | 6 +++---
 bsd-user/openbsd/target_os_stack.h          | 6 +++---
 bsd-user/openbsd/target_os_thread.h         | 6 +++---
 bsd-user/syscall_defs.h                     | 6 +++---
 bsd-user/x86_64/target.h                    | 2 +-
 bsd-user/x86_64/target_arch.h               | 6 +++---
 bsd-user/x86_64/target_arch_cpu.h           | 6 +++---
 bsd-user/x86_64/target_arch_elf.h           | 7 ++++---
 bsd-user/x86_64/target_arch_reg.h           | 6 +++---
 bsd-user/x86_64/target_arch_signal.h        | 7 ++++---
 bsd-user/x86_64/target_arch_sigtramp.h      | 6 +++---
 bsd-user/x86_64/target_arch_sysarch.h       | 6 +++---
 bsd-user/x86_64/target_arch_thread.h        | 7 ++++---
 bsd-user/x86_64/target_arch_vmparam.h       | 7 ++++---
 chardev/chardev-internal.h                  | 3 ++-
 crypto/ivgen-plain.h                        | 6 +++---
 ebpf/rss.bpf.skeleton.h                     | 7 ++++---
 hw/i386/e820_memory_layout.h                | 4 ++--
 hw/net/can/ctu_can_fd_frame.h               | 4 ++--
 hw/net/can/ctu_can_fd_regs.h                | 4 ++--
 hw/nvme/nvme.h                              | 6 +++---
 hw/usb/hcd-dwc2.h                           | 4 ++--
 include/block/block-hmp-cmds.h              | 4 ++--
 include/block/block_int-global-state.h      | 3 ++-
 include/chardev/char-socket.h               | 7 ++++---
 include/crypto/tls-cipher-suites.h          | 6 +++---
 include/exec/memopidx.h                     | 2 +-
 include/exec/translator.h                   | 2 +-
 include/fpu/softfloat-helpers.h             | 2 +-
 include/hw/acpi/generic_event_device.h      | 4 ++--
 include/hw/gpio/aspeed_gpio.h               | 2 +-
 include/hw/i2c/arm_sbcon_i2c.h              | 7 ++++---
 include/hw/i2c/i2c_mux_pca954x.h            | 4 ++--
 include/hw/input/lm832x.h                   | 4 ++--
 include/hw/intc/exynos4210_combiner.h       | 4 ++--
 include/hw/intc/nios2_vic.h                 | 6 +++---
 include/hw/intc/rx_icu.h                    | 2 +-
 include/hw/misc/aspeed_hace.h               | 2 +-
 include/hw/misc/aspeed_lpc.h                | 2 +-
 include/hw/misc/aspeed_sbc.h                | 2 +-
 include/hw/misc/bcm2835_cprman.h            | 4 ++--
 include/hw/misc/bcm2835_cprman_internals.h  | 4 ++--
 include/hw/misc/stm32f4xx_exti.h            | 4 ++--
 include/hw/misc/stm32f4xx_syscfg.h          | 4 ++--
 include/hw/misc/xlnx-versal-pmc-iou-slcr.h  | 6 +++---
 include/hw/net/allwinner-sun8i-emac.h       | 2 +-
 include/hw/net/mv88w8618_eth.h              | 5 +++--
 include/hw/nubus/mac-nubus-bridge.h         | 4 ++--
 include/hw/pci-host/remote.h                | 4 ++--
 include/hw/ppc/pnv_pnor.h                   | 8 +++++---
 include/hw/riscv/boot_opensbi.h             | 5 +++--
 include/hw/riscv/shakti_c.h                 | 4 ++--
 include/hw/rtc/m48t59.h                     | 2 +-
 include/hw/rtc/mc146818rtc.h                | 2 +-
 include/hw/rtc/sun4v-rtc.h                  | 4 ++--
 include/hw/rtc/xlnx-zynqmp-rtc.h            | 4 ++--
 include/hw/rx/rx62n.h                       | 4 ++--
 include/hw/s390x/s390-pci-clp.h             | 4 ++--
 include/hw/sensor/emc141x_regs.h            | 4 ++--
 include/hw/ssi/xlnx-versal-ospi.h           | 6 +++---
 include/hw/timer/bcm2835_systmr.h           | 4 ++--
 include/hw/tricore/tc27x_soc.h              | 4 ++--
 include/hw/tricore/tricore_testdevice.h     | 5 ++---
 include/hw/usb/dwc2-regs.h                  | 6 +++---
 include/hw/usb/hcd-musb.h                   | 4 ++--
 include/hw/usb/xlnx-usb-subsystem.h         | 4 ++--
 include/hw/usb/xlnx-versal-usb2-ctrl-regs.h | 4 ++--
 include/hw/virtio/vhost-user-fs.h           | 6 +++---
 include/hw/virtio/vhost-user-i2c.h          | 6 +++---
 include/hw/virtio/vhost-user-rng.h          | 6 +++---
 include/hw/virtio/vhost-user-vsock.h        | 6 +++---
 include/hw/virtio/vhost-vsock-common.h      | 6 +++---
 include/hw/watchdog/wdt_imx2.h              | 6 +++---
 include/qemu/cpu-float.h                    | 6 +++---
 include/qemu/crc-ccitt.h                    | 6 +++---
 include/qemu/help-texts.h                   | 4 ++--
 include/qemu/keyval.h                       | 7 ++++---
 include/qemu/plugin-memory.h                | 2 +-
 include/qemu/qemu-plugin.h                  | 7 ++++---
 include/qemu/selfmap.h                      | 2 +-
 include/sysemu/block-backend-global-state.h | 6 +++---
 include/tcg/tcg-ldst.h                      | 2 +-
 include/ui/dbus-display.h                   | 6 +++---
 include/ui/dbus-module.h                    | 6 +++---
 include/user/syscall-trace.h                | 2 +-
 linux-user/hexagon/target_signal.h          | 2 +-
 plugins/plugin.h                            | 6 +++---
 target/alpha/cpu-param.h                    | 2 +-
 target/arm/cpu-param.h                      | 2 +-
 target/arm/translate-a32.h                  | 4 ++--
 target/arm/vec_internal.h                   | 6 +++---
 target/avr/cpu-qom.h                        | 6 +++---
 target/avr/cpu.h                            | 2 +-
 target/cris/cpu-param.h                     | 2 +-
 target/hexagon/attribs.h                    | 2 +-
 target/hexagon/hex_arch_types.h             | 4 ++--
 target/hexagon/hex_regs.h                   | 4 ++--
 target/hppa/cpu-param.h                     | 2 +-
 target/i386/cpu-param.h                     | 2 +-
 target/i386/hax/hax-accel-ops.h             | 6 +++---
 target/i386/nvmm/nvmm-accel-ops.h           | 6 +++---
 target/i386/sev.h                           | 4 ++--
 target/i386/whpx/whpx-accel-ops.h           | 6 +++---
 target/i386/whpx/whpx-internal.h            | 6 +++---
 target/m68k/cpu-param.h                     | 2 +-
 target/microblaze/cpu-param.h               | 2 +-
 target/mips/cpu-param.h                     | 2 +-
 target/nios2/cpu-param.h                    | 2 +-
 target/openrisc/cpu-param.h                 | 2 +-
 target/ppc/cpu-param.h                      | 2 +-
 target/ppc/power8-pmu.h                     | 4 ++--
 target/riscv/cpu-param.h                    | 2 +-
 target/riscv/sbi_ecall_interface.h          | 4 ++--
 target/s390x/cpu-param.h                    | 2 +-
 target/sh4/cpu-param.h                      | 2 +-
 target/sparc/cpu-param.h                    | 2 +-
 target/tricore/cpu-param.h                  | 2 +-
 target/xtensa/core-de233_fpu/core-isa.h     | 7 +++----
 target/xtensa/core-de233_fpu/core-matmap.h  | 4 +---
 target/xtensa/core-dsp3400/core-isa.h       | 8 +++-----
 target/xtensa/core-dsp3400/core-matmap.h    | 4 +---
 target/xtensa/cpu-param.h                   | 2 +-
 tcg/tcg-internal.h                          | 2 +-
 tests/qtest/fuzz/fuzz.h                     | 5 ++---
 tests/qtest/libqmp.h                        | 7 ++++---
 tests/qtest/migration-helpers.h             | 7 ++++---
 tools/virtiofsd/passthrough_seccomp.h       | 7 +++----
 ui/dbus.h                                   | 7 ++++---
 173 files changed, 428 insertions(+), 409 deletions(-)

-- 
2.35.1


