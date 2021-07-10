Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B0EE13C363F
	for <lists+qemu-devel@lfdr.de>; Sat, 10 Jul 2021 21:01:29 +0200 (CEST)
Received: from localhost ([::1]:58752 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2IEC-0001ga-P8
	for lists+qemu-devel@lfdr.de; Sat, 10 Jul 2021 15:01:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53496)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1m2IBF-00080k-ON
 for qemu-devel@nongnu.org; Sat, 10 Jul 2021 14:58:25 -0400
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535]:33346)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1m2IBC-00058W-IN
 for qemu-devel@nongnu.org; Sat, 10 Jul 2021 14:58:25 -0400
Received: by mail-ed1-x535.google.com with SMTP id eb14so19642760edb.0
 for <qemu-devel@nongnu.org>; Sat, 10 Jul 2021 11:58:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mJkSuqyUoBbdf74tRm6CtSWV5YueRNxGNFTQ74a2xvM=;
 b=Qsz4Jq5VNYst8YLYN/rkn5dwICLAFWBtwFv5vH1XB+S3Z/hgB8zHHYNNO1uY4OmlBn
 gua+1Itf0Wrc/GA6K/yXhfnFX/KJhrpsIHci1yvAVgXDNCrDY4Bx6NXYGWmPdmJIzCQq
 jbvHYrG46USFbWBEu6yy5ywb/sP4jkvm32aZhi3Jo8FoFrrcF1AjTsxiroLR1qAAFCZb
 FzQzAxLK3sQKyYrZ/qeh4KShH94enYIs5fodKhKkeALe2C6CvsqXmswrYh+mnmN0/bbn
 PrQtWIlExjVB31kbb+Vuw1WGwXtS+1+vuXG0wpowlpDRNpETDqImDlyJ1cUc7Mkr0fs0
 8oFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=mJkSuqyUoBbdf74tRm6CtSWV5YueRNxGNFTQ74a2xvM=;
 b=VrMO4gSoueRgZbaWfyO4U9sL85rSkm7+c0l/hWxnsMZtPsEsreCi83u5S0LPRu/vEm
 tgbEy7Z+yFjHD8iazrAvgUiqbKg/iiyEGJ34dQEresUgtlapkayl8RIedAhQqOmQ2Z38
 c1bO39OZCJborp9g17iHQLMeWOp6ko30RBZ8zeqvSh4f09an1sZCrn2t6C3J/0gAQnUn
 a1YTlI8fCH0QomLtujMN+i8BEXWTdo18LPtOpBoQJuqsokJ0zcJjlcX5BakViRbYy2kC
 foZ5EIKwNI0kY0spas7f6lt/Cmh2/VbAT0wEFr6Cc7oFnBhI5I9W6s6wnfVYJ7qaD9wu
 0ByA==
X-Gm-Message-State: AOAM532GzkmbALnvXA2odN24W2wfsRNg3dJH2jvddBNBreqak7HGOVK2
 A41eTVsqc8ere2JQPs7kHp6ZfcUuY/w=
X-Google-Smtp-Source: ABdhPJxaH1oydNdbZ7DQbpk2KFqp9IaIaYvXB2kMy0YoJA0EVosvAyyj9/baxqDtIEUvf1N68+uJPA==
X-Received: by 2002:a50:fd99:: with SMTP id o25mr6509332edt.285.1625943500511; 
 Sat, 10 Jul 2021 11:58:20 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id g8sm5096976edw.89.2021.07.10.11.58.19
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Jul 2021 11:58:19 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 00/48] Misc patches for QEMU 6.1 soft freeze
Date: Sat, 10 Jul 2021 20:58:16 +0200
Message-Id: <20210710185818.444407-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x535.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 05de778b5b8ab0b402996769117b88c7ea5c7c61:

  Merge remote-tracking branch 'remotes/mst/tags/for_upstream' into staging (2021-07-09 14:30:01 +0100)

are available in the Git repository at:

  https://gitlab.com/bonzini/qemu.git tags/for-upstream

for you to fetch changes up to 411ad8dd80077e98ed465775b044caf1a9482f6c:

  meson: Use input/output for entitlements target (2021-07-09 18:21:34 +0200)

v1->v2: fix docs build, add final patch for entitlements target

----------------------------------------------------------------
* More SVM fixes (Lara)
* Module annotation database (Gerd)
* Memory leak fixes (myself)
* Build fixes (myself)
* --with-devices-* support (Alex)

----------------------------------------------------------------
Akihiko Odaki (1):
      meson: Use input/output for entitlements target

Alex Bennée (4):
      hw/arm: add dependency on OR_IRQ for XLNX_VERSAL
      hw/arm: move CONFIG_V7M out of default-devices
      configs: rename default-configs to configs and reorganise
      configure: allow the selection of alternate config in the build

Gerd Hoffmann (32):
      modules: add modinfo macros
      modules: collect module meta-data
      modules: generate modinfo.c
      modules: add qxl module annotations
      modules: add virtio-gpu module annotations
      modules: add chardev module annotations
      modules: add audio module annotations
      modules: add usb-redir module annotations
      modules: add ccid module annotations
      modules: add ui module annotations
      modules: add s390x module annotations
      modules: add block module annotations
      modules: use modinfo for dependencies
      modules: use modinfo for qom load
      modules: use modinfo for qemu opts load
      modules: add tracepoints
      modules: check arch and block load on mismatch
      modules: check arch on qom lookup
      modules: target-specific module build infrastructure
      modules: add documentation for module sourcesets
      modules: add module_obj() note to QOM docs
      modules: hook up modules.h to docs build
      accel: autoload modules
      accel: add qtest module annotations
      accel: build qtest modular
      accel: add tcg module annotations
      accel: build tcg modular
      monitor: allow register hmp commands
      usb: drop usb_host_dev_is_scsi_storage hook
      monitor/usb: register 'info usbhost' dynamically
      usb: build usb-host as module
      monitor/tcg: move tcg hmp commands to accel/tcg, register them dynamically

Jose R. Ziviani (1):
      modules: check if all dependencies can be satisfied

Lara Lazier (2):
      target/i386: Added MSRPM and IOPM size check
      target/i386: Added DR6 and DR7 consistency checks

Miroslav Rezanina (2):
      configure: fix libdaxctl options
      configure: fix libpmem configuration option

Paolo Bonzini (5):
      meson: fix missing preprocessor symbols
      osdep: fix HAVE_BROKEN_SIZE_MAX case
      target/i386: fix exceptions for MOV to DR
      vl: fix leak of qdict_crumple return value
      meson: switch function tests from compilation to linking

Philippe Mathieu-Daudé (1):
      meson: Introduce target-specific Kconfig

 Kconfig                                            |   1 +
 MAINTAINERS                                        |  22 ++-
 accel/accel-common.c                               |   2 +-
 accel/accel-softmmu.c                              |   2 +-
 accel/qtest/meson.build                            |   8 +-
 accel/qtest/qtest.c                                |   2 +
 accel/tcg/hmp.c                                    |  29 +++
 accel/tcg/meson.build                              |   6 +-
 accel/tcg/tcg-accel-ops.c                          |   1 +
 accel/tcg/tcg-all.c                                |   1 +
 audio/spiceaudio.c                                 |   2 +
 block/iscsi-opts.c                                 |   1 +
 block/meson.build                                  |   2 +-
 chardev/baum.c                                     |   1 +
 chardev/spice.c                                    |   4 +
 .../devices/aarch64-softmmu/default.mak            |   2 +-
 configs/devices/aarch64-softmmu/minimal.mak        |   9 +
 .../devices/alpha-softmmu/default.mak              |   0
 .../devices/arm-softmmu/default.mak                |   3 -
 .../devices/avr-softmmu/default.mak                |   0
 .../devices/cris-softmmu/default.mak               |   0
 .../devices/hppa-softmmu/default.mak               |   0
 .../devices/i386-softmmu/default.mak               |   0
 .../devices/m68k-softmmu/default.mak               |   0
 .../devices/microblaze-softmmu/default.mak         |   0
 .../devices/microblazeel-softmmu/default.mak       |   2 +-
 .../devices/mips-softmmu/common.mak                |   0
 .../devices/mips-softmmu/default.mak               |   2 +-
 .../devices/mips64-softmmu/default.mak             |   2 +-
 .../devices/mips64el-softmmu/default.mak           |   2 +-
 .../devices/mipsel-softmmu/default.mak             |   2 +-
 .../devices/nios2-softmmu/default.mak              |   0
 .../devices/or1k-softmmu/default.mak               |   0
 .../devices/ppc-softmmu/default.mak                |   0
 .../devices/ppc64-softmmu/default.mak              |   2 +-
 .../devices/riscv32-softmmu/default.mak            |   0
 .../devices/riscv64-softmmu/default.mak            |   0
 .../devices/rx-softmmu/default.mak                 |   0
 .../devices/s390x-softmmu/default.mak              |   0
 .../devices/sh4-softmmu/default.mak                |   0
 .../devices/sh4eb-softmmu/default.mak              |   2 +-
 .../devices/sparc-softmmu/default.mak              |   0
 .../devices/sparc64-softmmu/default.mak            |   0
 .../devices/tricore-softmmu/default.mak            |   0
 .../devices/x86_64-softmmu/default.mak             |   2 +-
 .../devices/xtensa-softmmu/default.mak             |   0
 configs/devices/xtensaeb-softmmu/default.mak       |   3 +
 .../targets/aarch64-linux-user.mak                 |   0
 .../targets/aarch64-softmmu.mak                    |   0
 .../targets/aarch64_be-linux-user.mak              |   0
 .../targets/alpha-linux-user.mak                   |   0
 .../targets/alpha-softmmu.mak                      |   0
 .../targets/arm-linux-user.mak                     |   0
 .../targets/arm-softmmu.mak                        |   0
 .../targets/armeb-linux-user.mak                   |   0
 .../targets/avr-softmmu.mak                        |   0
 .../targets/cris-linux-user.mak                    |   0
 .../targets/cris-softmmu.mak                       |   0
 .../targets/hexagon-linux-user.mak                 |   0
 .../targets/hppa-linux-user.mak                    |   0
 .../targets/hppa-softmmu.mak                       |   0
 .../targets/i386-bsd-user.mak                      |   0
 .../targets/i386-linux-user.mak                    |   0
 .../targets/i386-softmmu.mak                       |   0
 .../targets/m68k-linux-user.mak                    |   0
 .../targets/m68k-softmmu.mak                       |   0
 .../targets/microblaze-linux-user.mak              |   0
 .../targets/microblaze-softmmu.mak                 |   0
 .../targets/microblazeel-linux-user.mak            |   0
 .../targets/microblazeel-softmmu.mak               |   0
 .../targets/mips-linux-user.mak                    |   0
 .../targets/mips-softmmu.mak                       |   0
 .../targets/mips64-linux-user.mak                  |   0
 .../targets/mips64-softmmu.mak                     |   0
 .../targets/mips64el-linux-user.mak                |   0
 .../targets/mips64el-softmmu.mak                   |   0
 .../targets/mipsel-linux-user.mak                  |   0
 .../targets/mipsel-softmmu.mak                     |   0
 .../targets/mipsn32-linux-user.mak                 |   0
 .../targets/mipsn32el-linux-user.mak               |   0
 .../targets/nios2-linux-user.mak                   |   0
 .../targets/nios2-softmmu.mak                      |   0
 .../targets/or1k-linux-user.mak                    |   0
 .../targets/or1k-softmmu.mak                       |   0
 .../targets/ppc-linux-user.mak                     |   0
 .../targets/ppc-softmmu.mak                        |   0
 .../targets/ppc64-linux-user.mak                   |   0
 .../targets/ppc64-softmmu.mak                      |   0
 .../targets/ppc64abi32-linux-user.mak              |   0
 .../targets/ppc64le-linux-user.mak                 |   0
 .../targets/riscv32-linux-user.mak                 |   0
 .../targets/riscv32-softmmu.mak                    |   0
 .../targets/riscv64-linux-user.mak                 |   0
 .../targets/riscv64-softmmu.mak                    |   0
 .../targets/rx-softmmu.mak                         |   0
 .../targets/s390x-linux-user.mak                   |   0
 .../targets/s390x-softmmu.mak                      |   0
 .../targets/sh4-linux-user.mak                     |   0
 .../targets/sh4-softmmu.mak                        |   0
 .../targets/sh4eb-linux-user.mak                   |   0
 .../targets/sh4eb-softmmu.mak                      |   0
 .../targets/sparc-linux-user.mak                   |   0
 .../targets/sparc-softmmu.mak                      |   0
 .../targets/sparc32plus-linux-user.mak             |   0
 .../targets/sparc64-linux-user.mak                 |   0
 .../targets/sparc64-softmmu.mak                    |   0
 .../targets/tricore-softmmu.mak                    |   0
 .../targets/x86_64-bsd-user.mak                    |   0
 .../targets/x86_64-linux-user.mak                  |   0
 .../targets/x86_64-softmmu.mak                     |   0
 .../targets/xtensa-linux-user.mak                  |   0
 .../targets/xtensa-softmmu.mak                     |   0
 .../targets/xtensaeb-linux-user.mak                |   0
 .../targets/xtensaeb-softmmu.mak                   |   0
 configure                                          |  44 +++--
 contrib/vhost-user-gpu/meson.build                 |   2 +-
 default-configs/devices/xtensaeb-softmmu.mak       |   3 -
 docs/devel/build-system.rst                        |  17 ++
 docs/devel/index.rst                               |   1 +
 docs/devel/modules.rst                             |   5 +
 docs/devel/qom.rst                                 |   8 +
 hmp-commands-info.hx                               |   3 -
 hw/arm/Kconfig                                     |   4 +
 hw/display/qxl.c                                   |   4 +
 hw/display/vhost-user-gpu-pci.c                    |   1 +
 hw/display/vhost-user-gpu.c                        |   1 +
 hw/display/vhost-user-vga.c                        |   1 +
 hw/display/virtio-gpu-base.c                       |   1 +
 hw/display/virtio-gpu-gl.c                         |   3 +
 hw/display/virtio-gpu-pci-gl.c                     |   3 +
 hw/display/virtio-gpu-pci.c                        |   2 +
 hw/display/virtio-gpu.c                            |   1 +
 hw/display/virtio-vga-gl.c                         |   3 +
 hw/display/virtio-vga.c                            |   2 +
 hw/ppc/spapr.c                                     |   2 +-
 hw/s390x/virtio-ccw-gpu.c                          |   3 +
 hw/usb/ccid-card-emulated.c                        |   1 +
 hw/usb/ccid-card-passthru.c                        |   1 +
 hw/usb/dev-storage-bot.c                           |   1 +
 hw/usb/dev-storage-classic.c                       |   1 +
 hw/usb/dev-uas.c                                   |   1 +
 hw/usb/host-libusb.c                               |  38 +---
 hw/usb/host-stub.c                                 |  45 -----
 hw/usb/meson.build                                 |  10 +-
 hw/usb/redirect.c                                  |   1 +
 include/hw/usb.h                                   |   7 +-
 include/monitor/monitor.h                          |   3 +
 include/qemu/module.h                              |  79 ++++++++
 include/qemu/osdep.h                               |   2 +-
 meson.build                                        | 142 ++++++++++++---
 monitor/hmp.c                                      |   7 +
 monitor/misc.c                                     |  34 ++--
 scripts/entitlement.sh                             |  10 +-
 scripts/modinfo-collect.py                         |  67 +++++++
 scripts/modinfo-generate.py                        |  97 ++++++++++
 softmmu/vl.c                                       |  37 ++--
 stubs/module-opts.c                                |   4 -
 target/Kconfig                                     |  19 ++
 target/alpha/Kconfig                               |   2 +
 target/arm/Kconfig                                 |   6 +
 target/avr/Kconfig                                 |   2 +
 target/cris/Kconfig                                |   2 +
 target/hppa/Kconfig                                |   2 +
 target/i386/Kconfig                                |   5 +
 target/i386/cpu.h                                  |   2 +
 target/i386/helper.h                               |   3 +-
 target/i386/svm.h                                  |   3 +
 target/i386/tcg/bpt_helper.c                       |  21 ---
 target/i386/tcg/sysemu/bpt_helper.c                |  47 +++--
 target/i386/tcg/sysemu/svm_helper.c                |  24 ++-
 target/i386/tcg/translate.c                        |   1 +
 target/m68k/Kconfig                                |   2 +
 target/microblaze/Kconfig                          |   2 +
 target/mips/Kconfig                                |   6 +
 target/nios2/Kconfig                               |   2 +
 target/openrisc/Kconfig                            |   2 +
 target/ppc/Kconfig                                 |   5 +
 target/riscv/Kconfig                               |   5 +
 target/rx/Kconfig                                  |   2 +
 target/s390x/Kconfig                               |   2 +
 target/sh4/Kconfig                                 |   2 +
 target/sparc/Kconfig                               |   5 +
 target/tricore/Kconfig                             |   2 +
 target/xtensa/Kconfig                              |   2 +
 tests/Makefile.include                             |   2 +-
 ui/egl-headless.c                                  |   4 +
 ui/gtk.c                                           |   4 +
 ui/sdl2.c                                          |   4 +
 ui/spice-app.c                                     |   3 +
 ui/spice-core.c                                    |   5 +
 util/meson.build                                   |   2 +-
 util/module.c                                      | 200 ++++++++++++---------
 util/trace-events                                  |   4 +
 193 files changed, 885 insertions(+), 340 deletions(-)
 create mode 100644 accel/tcg/hmp.c
 rename default-configs/devices/aarch64-softmmu.mak => configs/devices/aarch64-softmmu/default.mak (82%)
 create mode 100644 configs/devices/aarch64-softmmu/minimal.mak
 rename default-configs/devices/alpha-softmmu.mak => configs/devices/alpha-softmmu/default.mak (100%)
 rename default-configs/devices/arm-softmmu.mak => configs/devices/arm-softmmu/default.mak (89%)
 rename default-configs/devices/avr-softmmu.mak => configs/devices/avr-softmmu/default.mak (100%)
 rename default-configs/devices/cris-softmmu.mak => configs/devices/cris-softmmu/default.mak (100%)
 rename default-configs/devices/hppa-softmmu.mak => configs/devices/hppa-softmmu/default.mak (100%)
 rename default-configs/devices/i386-softmmu.mak => configs/devices/i386-softmmu/default.mak (100%)
 rename default-configs/devices/m68k-softmmu.mak => configs/devices/m68k-softmmu/default.mak (100%)
 rename default-configs/devices/microblaze-softmmu.mak => configs/devices/microblaze-softmmu/default.mak (100%)
 rename default-configs/devices/microblazeel-softmmu.mak => configs/devices/microblazeel-softmmu/default.mak (54%)
 rename default-configs/devices/mips-softmmu-common.mak => configs/devices/mips-softmmu/common.mak (100%)
 rename default-configs/devices/mips-softmmu.mak => configs/devices/mips-softmmu/default.mak (56%)
 rename default-configs/devices/mips64-softmmu.mak => configs/devices/mips64-softmmu/default.mak (62%)
 rename default-configs/devices/mips64el-softmmu.mak => configs/devices/mips64el-softmmu/default.mak (88%)
 rename default-configs/devices/mipsel-softmmu.mak => configs/devices/mipsel-softmmu/default.mak (55%)
 rename default-configs/devices/nios2-softmmu.mak => configs/devices/nios2-softmmu/default.mak (100%)
 rename default-configs/devices/or1k-softmmu.mak => configs/devices/or1k-softmmu/default.mak (100%)
 rename default-configs/devices/ppc-softmmu.mak => configs/devices/ppc-softmmu/default.mak (100%)
 rename default-configs/devices/ppc64-softmmu.mak => configs/devices/ppc64-softmmu/default.mak (79%)
 rename default-configs/devices/riscv32-softmmu.mak => configs/devices/riscv32-softmmu/default.mak (100%)
 rename default-configs/devices/riscv64-softmmu.mak => configs/devices/riscv64-softmmu/default.mak (100%)
 rename default-configs/devices/rx-softmmu.mak => configs/devices/rx-softmmu/default.mak (100%)
 rename default-configs/devices/s390x-softmmu.mak => configs/devices/s390x-softmmu/default.mak (100%)
 rename default-configs/devices/sh4-softmmu.mak => configs/devices/sh4-softmmu/default.mak (100%)
 rename default-configs/devices/sh4eb-softmmu.mak => configs/devices/sh4eb-softmmu/default.mak (55%)
 rename default-configs/devices/sparc-softmmu.mak => configs/devices/sparc-softmmu/default.mak (100%)
 rename default-configs/devices/sparc64-softmmu.mak => configs/devices/sparc64-softmmu/default.mak (100%)
 rename default-configs/devices/tricore-softmmu.mak => configs/devices/tricore-softmmu/default.mak (100%)
 rename default-configs/devices/x86_64-softmmu.mak => configs/devices/x86_64-softmmu/default.mak (55%)
 rename default-configs/devices/xtensa-softmmu.mak => configs/devices/xtensa-softmmu/default.mak (100%)
 create mode 100644 configs/devices/xtensaeb-softmmu/default.mak
 rename {default-configs => configs}/targets/aarch64-linux-user.mak (100%)
 rename {default-configs => configs}/targets/aarch64-softmmu.mak (100%)
 rename {default-configs => configs}/targets/aarch64_be-linux-user.mak (100%)
 rename {default-configs => configs}/targets/alpha-linux-user.mak (100%)
 rename {default-configs => configs}/targets/alpha-softmmu.mak (100%)
 rename {default-configs => configs}/targets/arm-linux-user.mak (100%)
 rename {default-configs => configs}/targets/arm-softmmu.mak (100%)
 rename {default-configs => configs}/targets/armeb-linux-user.mak (100%)
 rename {default-configs => configs}/targets/avr-softmmu.mak (100%)
 rename {default-configs => configs}/targets/cris-linux-user.mak (100%)
 rename {default-configs => configs}/targets/cris-softmmu.mak (100%)
 rename {default-configs => configs}/targets/hexagon-linux-user.mak (100%)
 rename {default-configs => configs}/targets/hppa-linux-user.mak (100%)
 rename {default-configs => configs}/targets/hppa-softmmu.mak (100%)
 rename {default-configs => configs}/targets/i386-bsd-user.mak (100%)
 rename {default-configs => configs}/targets/i386-linux-user.mak (100%)
 rename {default-configs => configs}/targets/i386-softmmu.mak (100%)
 rename {default-configs => configs}/targets/m68k-linux-user.mak (100%)
 rename {default-configs => configs}/targets/m68k-softmmu.mak (100%)
 rename {default-configs => configs}/targets/microblaze-linux-user.mak (100%)
 rename {default-configs => configs}/targets/microblaze-softmmu.mak (100%)
 rename {default-configs => configs}/targets/microblazeel-linux-user.mak (100%)
 rename {default-configs => configs}/targets/microblazeel-softmmu.mak (100%)
 rename {default-configs => configs}/targets/mips-linux-user.mak (100%)
 rename {default-configs => configs}/targets/mips-softmmu.mak (100%)
 rename {default-configs => configs}/targets/mips64-linux-user.mak (100%)
 rename {default-configs => configs}/targets/mips64-softmmu.mak (100%)
 rename {default-configs => configs}/targets/mips64el-linux-user.mak (100%)
 rename {default-configs => configs}/targets/mips64el-softmmu.mak (100%)
 rename {default-configs => configs}/targets/mipsel-linux-user.mak (100%)
 rename {default-configs => configs}/targets/mipsel-softmmu.mak (100%)
 rename {default-configs => configs}/targets/mipsn32-linux-user.mak (100%)
 rename {default-configs => configs}/targets/mipsn32el-linux-user.mak (100%)
 rename {default-configs => configs}/targets/nios2-linux-user.mak (100%)
 rename {default-configs => configs}/targets/nios2-softmmu.mak (100%)
 rename {default-configs => configs}/targets/or1k-linux-user.mak (100%)
 rename {default-configs => configs}/targets/or1k-softmmu.mak (100%)
 rename {default-configs => configs}/targets/ppc-linux-user.mak (100%)
 rename {default-configs => configs}/targets/ppc-softmmu.mak (100%)
 rename {default-configs => configs}/targets/ppc64-linux-user.mak (100%)
 rename {default-configs => configs}/targets/ppc64-softmmu.mak (100%)
 rename {default-configs => configs}/targets/ppc64abi32-linux-user.mak (100%)
 rename {default-configs => configs}/targets/ppc64le-linux-user.mak (100%)
 rename {default-configs => configs}/targets/riscv32-linux-user.mak (100%)
 rename {default-configs => configs}/targets/riscv32-softmmu.mak (100%)
 rename {default-configs => configs}/targets/riscv64-linux-user.mak (100%)
 rename {default-configs => configs}/targets/riscv64-softmmu.mak (100%)
 rename {default-configs => configs}/targets/rx-softmmu.mak (100%)
 rename {default-configs => configs}/targets/s390x-linux-user.mak (100%)
 rename {default-configs => configs}/targets/s390x-softmmu.mak (100%)
 rename {default-configs => configs}/targets/sh4-linux-user.mak (100%)
 rename {default-configs => configs}/targets/sh4-softmmu.mak (100%)
 rename {default-configs => configs}/targets/sh4eb-linux-user.mak (100%)
 rename {default-configs => configs}/targets/sh4eb-softmmu.mak (100%)
 rename {default-configs => configs}/targets/sparc-linux-user.mak (100%)
 rename {default-configs => configs}/targets/sparc-softmmu.mak (100%)
 rename {default-configs => configs}/targets/sparc32plus-linux-user.mak (100%)
 rename {default-configs => configs}/targets/sparc64-linux-user.mak (100%)
 rename {default-configs => configs}/targets/sparc64-softmmu.mak (100%)
 rename {default-configs => configs}/targets/tricore-softmmu.mak (100%)
 rename {default-configs => configs}/targets/x86_64-bsd-user.mak (100%)
 rename {default-configs => configs}/targets/x86_64-linux-user.mak (100%)
 rename {default-configs => configs}/targets/x86_64-softmmu.mak (100%)
 rename {default-configs => configs}/targets/xtensa-linux-user.mak (100%)
 rename {default-configs => configs}/targets/xtensa-softmmu.mak (100%)
 rename {default-configs => configs}/targets/xtensaeb-linux-user.mak (100%)
 rename {default-configs => configs}/targets/xtensaeb-softmmu.mak (100%)
 delete mode 100644 default-configs/devices/xtensaeb-softmmu.mak
 create mode 100644 docs/devel/modules.rst
 delete mode 100644 hw/usb/host-stub.c
 create mode 100755 scripts/modinfo-collect.py
 create mode 100755 scripts/modinfo-generate.py
 create mode 100644 target/Kconfig
 create mode 100644 target/alpha/Kconfig
 create mode 100644 target/arm/Kconfig
 create mode 100644 target/avr/Kconfig
 create mode 100644 target/cris/Kconfig
 create mode 100644 target/hppa/Kconfig
 create mode 100644 target/i386/Kconfig
 create mode 100644 target/m68k/Kconfig
 create mode 100644 target/microblaze/Kconfig
 create mode 100644 target/mips/Kconfig
 create mode 100644 target/nios2/Kconfig
 create mode 100644 target/openrisc/Kconfig
 create mode 100644 target/ppc/Kconfig
 create mode 100644 target/riscv/Kconfig
 create mode 100644 target/rx/Kconfig
 create mode 100644 target/s390x/Kconfig
 create mode 100644 target/sh4/Kconfig
 create mode 100644 target/sparc/Kconfig
 create mode 100644 target/tricore/Kconfig
 create mode 100644 target/xtensa/Kconfig
-- 
2.31.1


