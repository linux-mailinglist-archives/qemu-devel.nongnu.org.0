Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 162B2601941
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Oct 2022 22:19:33 +0200 (CEST)
Received: from localhost ([::1]:57504 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okWaB-00039c-FT
	for lists+qemu-devel@lfdr.de; Mon, 17 Oct 2022 16:19:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54798)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1okUil-0002vy-Pa
 for qemu-devel@nongnu.org; Mon, 17 Oct 2022 14:20:15 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:36590)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1okUij-0001hd-82
 for qemu-devel@nongnu.org; Mon, 17 Oct 2022 14:20:15 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 c3-20020a1c3503000000b003bd21e3dd7aso13298835wma.1
 for <qemu-devel@nongnu.org>; Mon, 17 Oct 2022 11:20:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=WwriwgPckdQGGmRjODyD61bHWQpF6gIlrO0l6YC5nWA=;
 b=qNkD2vKjZp57IpPAVQeBaI+oaUQ/HImSqmUzVc27cU2sjb/UVmqkmb8tBwLA2xN2sJ
 K84lc1YbqNO2LV8kT9Gi3shqiDhkussgmiVUun8AVKruBlH6/RwH2HOfjZGKRrFi/r+3
 ySX2ZBgVos8yB6/hh8h6zsbcsYU9Yhz3Y1ocn3Si/g1Fur6nsZ6PftwMuOwQLFv82ved
 +zLGTKCXkXI+iu7HIs7hjAUlFCqbZeNG9reWLlUdaquQdl9OkcMUFj8Lik0HwhOP5R5F
 Cj2ttP8YoPZWYHdFPPut0QXr73f9MguqjP3AskFSeYo0uiVRJdx9WN+kCwmu5fWnUBUL
 qaEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=WwriwgPckdQGGmRjODyD61bHWQpF6gIlrO0l6YC5nWA=;
 b=hYo/69DRrNyrWbf1BPctW3F6fAMLV6ZV0lvg3ZUGPBSprt24M7dfK0MvHJYf7uihZm
 dRN5igiTQaSNPCSevLAKbVNZTORm4SclSWYnHYSRKvH8Qunh3D5wGNSWHnBGbb4C9Wf6
 28yHOU+cBgdua9ydRAxskysYiPM4SbXlPScdy46wJeGoVBTgDqzeapOunlwHpeeJLFrz
 SZ/X5uq5My9GfzZapBwttg8i9BgZjaSEfKqNwOCdDk6VvuSgKmfuJxy0kwNluIca/pm7
 vqUhgBx7ntWm2g8dHb/t0+IK/QGrQzgah5z2HPAGNow3kKHHHd6dDuH4+Y2XN29H6Kkc
 3Q7Q==
X-Gm-Message-State: ACrzQf2sNhYRCtoZlsE/1aDoU8d8rxB5fUSBXtssODiTYADF/SgYsrdT
 YskrRrhNlCfh41DTSyLBl49rp6fXuaM9fVtr
X-Google-Smtp-Source: AMsMyM5YR1CzhLYbfy1zH/2+3TzrLM2+YL6cFvnTrEvVmQ1zGdprXk1iMBJCRVwVLPjt/QUaVq/4tA==
X-Received: by 2002:a05:600c:a04:b0:3b4:f20e:63f4 with SMTP id
 z4-20020a05600c0a0400b003b4f20e63f4mr8348841wmp.201.1666030808854; 
 Mon, 17 Oct 2022 11:20:08 -0700 (PDT)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 c15-20020a5d414f000000b002285f73f11dsm10971165wrq.81.2022.10.17.11.20.06
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 17 Oct 2022 11:20:07 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <huth@tuxfamily.org>, Akihiko Odaki <akihiko.odaki@gmail.com>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH] MAINTAINERS: Replace my amsat.org email address
Date: Mon, 17 Oct 2022 20:20:05 +0200
Message-Id: <20221017182005.43015-1-philmd@linaro.org>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 17 Oct 2022 16:15:06 -0400
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

The amsat.org domain is having issues with DMARC / SPF / DKIM:
https://lore.kernel.org/qemu-devel/CAMVc7JUy5NeEN0q=4zfZvn_rppgqn9wicV1z=TsLuHKS3RY3Sw@mail.gmail.com/

Consolidate all of my MAINTAINERS entries on my work address.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 .mailmap    |  4 +++-
 MAINTAINERS | 62 ++++++++++++++++++++++++++---------------------------
 2 files changed, 34 insertions(+), 32 deletions(-)

diff --git a/.mailmap b/.mailmap
index 1f7319b70b..35dddbe27b 100644
--- a/.mailmap
+++ b/.mailmap
@@ -70,7 +70,9 @@ Paul Burton <paulburton@kernel.org> <paul.burton@mips.com>
 Paul Burton <paulburton@kernel.org> <paul.burton@imgtec.com>
 Paul Burton <paulburton@kernel.org> <paul@archlinuxmips.org>
 Paul Burton <paulburton@kernel.org> <pburton@wavecomp.com>
-Philippe Mathieu-Daudé <f4bug@amsat.org> <philmd@redhat.com>
+Philippe Mathieu-Daudé <philmd@linaro.org> <f4bug@amsat.org>
+Philippe Mathieu-Daudé <philmd@linaro.org> <philmd@redhat.com>
+Philippe Mathieu-Daudé <philmd@linaro.org> <philmd@fungible.com>
 Stefan Brankovic <stefan.brankovic@syrmia.com> <stefan.brankovic@rt-rk.com.com>
 Yongbok Kim <yongbok.kim@mips.com> <yongbok.kim@imgtec.com>
 
diff --git a/MAINTAINERS b/MAINTAINERS
index 8ae2e43c83..f169fec6fc 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -110,7 +110,7 @@ T: git https://gitlab.com/cohuck/qemu.git s390-next
 L: qemu-s390x@nongnu.org
 
 MIPS general architecture support
-M: Philippe Mathieu-Daudé <f4bug@amsat.org>
+M: Philippe Mathieu-Daudé <philmd@linaro.org>
 R: Jiaxun Yang <jiaxun.yang@flygoat.com>
 S: Odd Fixes
 K: ^Subject:.*(?i)mips
@@ -233,7 +233,7 @@ F: tests/docker/dockerfiles/debian-microblaze-cross.d/build-toolchain.sh
 F: tests/tcg/nios2/Makefile.target
 
 MIPS TCG CPUs
-M: Philippe Mathieu-Daudé <f4bug@amsat.org>
+M: Philippe Mathieu-Daudé <philmd@linaro.org>
 R: Aurelien Jarno <aurelien@aurel32.net>
 R: Jiaxun Yang <jiaxun.yang@flygoat.com>
 R: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>
@@ -550,7 +550,7 @@ X: qga/*win32*
 F: qemu.nsi
 
 Darwin (macOS, iOS)
-M: Philippe Mathieu-Daudé <f4bug@amsat.org>
+M: Philippe Mathieu-Daudé <philmd@linaro.org>
 S: Odd Fixes
 F: .gitlab-ci.d/cirrus/macos-*
 F: */*.m
@@ -681,7 +681,7 @@ F: include/hw/rtc/goldfish_rtc.h
 
 Gumstix
 M: Peter Maydell <peter.maydell@linaro.org>
-R: Philippe Mathieu-Daudé <f4bug@amsat.org>
+R: Philippe Mathieu-Daudé <philmd@linaro.org>
 L: qemu-arm@nongnu.org
 S: Odd Fixes
 F: hw/arm/gumstix.c
@@ -832,7 +832,7 @@ F: docs/system/arm/palm.rst
 
 Raspberry Pi
 M: Peter Maydell <peter.maydell@linaro.org>
-R: Philippe Mathieu-Daudé <f4bug@amsat.org>
+R: Philippe Mathieu-Daudé <philmd@linaro.org>
 L: qemu-arm@nongnu.org
 S: Odd Fixes
 F: hw/arm/raspi.c
@@ -1095,7 +1095,7 @@ F: include/hw/misc/avr_power.h
 F: hw/misc/avr_power.c
 
 Arduino
-M: Philippe Mathieu-Daudé <f4bug@amsat.org>
+M: Philippe Mathieu-Daudé <philmd@linaro.org>
 S: Maintained
 F: hw/avr/arduino.c
 
@@ -1210,7 +1210,7 @@ F: hw/microblaze/petalogix_ml605_mmu.c
 MIPS Machines
 -------------
 Overall MIPS Machines
-M: Philippe Mathieu-Daudé <f4bug@amsat.org>
+M: Philippe Mathieu-Daudé <philmd@linaro.org>
 S: Odd Fixes
 F: configs/devices/mips*/*
 F: hw/mips/
@@ -1225,7 +1225,7 @@ F: hw/display/jazz_led.c
 F: hw/dma/rc4030.c
 
 Malta
-M: Philippe Mathieu-Daudé <f4bug@amsat.org>
+M: Philippe Mathieu-Daudé <philmd@linaro.org>
 R: Aurelien Jarno <aurelien@aurel32.net>
 S: Odd Fixes
 F: hw/isa/piix4.c
@@ -1244,7 +1244,7 @@ F: hw/net/mipsnet.c
 
 Fuloong 2E
 M: Huacai Chen <chenhuacai@kernel.org>
-M: Philippe Mathieu-Daudé <f4bug@amsat.org>
+M: Philippe Mathieu-Daudé <philmd@linaro.org>
 R: Jiaxun Yang <jiaxun.yang@flygoat.com>
 S: Odd Fixes
 F: hw/mips/fuloong2e.c
@@ -1700,7 +1700,7 @@ F: pc-bios/bios-microvm.bin
 Machine core
 M: Eduardo Habkost <eduardo@habkost.net>
 M: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
-R: Philippe Mathieu-Daudé <f4bug@amsat.org>
+R: Philippe Mathieu-Daudé <philmd@linaro.org>
 R: Yanan Wang <wangyanan55@huawei.com>
 S: Supported
 F: cpu.c
@@ -1893,7 +1893,7 @@ F: docs/virtio-net-failover.rst
 T: git https://github.com/jasowang/qemu.git net
 
 Parallel NOR Flash devices
-M: Philippe Mathieu-Daudé <f4bug@amsat.org>
+M: Philippe Mathieu-Daudé <philmd@linaro.org>
 T: git https://gitlab.com/philmd/qemu.git pflash-next
 S: Maintained
 F: hw/block/pflash_cfi*.c
@@ -1926,7 +1926,7 @@ S: Maintained
 F: hw/ssi/xilinx_*
 
 SD (Secure Card)
-M: Philippe Mathieu-Daudé <f4bug@amsat.org>
+M: Philippe Mathieu-Daudé <philmd@linaro.org>
 M: Bin Meng <bin.meng@windriver.com>
 L: qemu-block@nongnu.org
 S: Odd Fixes
@@ -2233,14 +2233,14 @@ F: tests/qtest/vmgenid-test.c
 F: stubs/vmgenid.c
 
 LED
-M: Philippe Mathieu-Daudé <f4bug@amsat.org>
+M: Philippe Mathieu-Daudé <philmd@linaro.org>
 S: Maintained
 F: include/hw/misc/led.h
 F: hw/misc/led.c
 
 Unimplemented device
 M: Peter Maydell <peter.maydell@linaro.org>
-R: Philippe Mathieu-Daudé <f4bug@amsat.org>
+R: Philippe Mathieu-Daudé <philmd@linaro.org>
 R: Ani Sinha <ani@anisinha.ca>
 S: Maintained
 F: include/hw/misc/unimp.h
@@ -2248,7 +2248,7 @@ F: hw/misc/unimp.c
 
 Empty slot
 M: Artyom Tarasenko <atar4qemu@gmail.com>
-R: Philippe Mathieu-Daudé <f4bug@amsat.org>
+R: Philippe Mathieu-Daudé <philmd@linaro.org>
 R: Ani Sinha <ani@anisinha.ca>
 S: Maintained
 F: include/hw/misc/empty_slot.h
@@ -2312,13 +2312,13 @@ F: qemu-edid.c
 
 PIIX4 South Bridge (i82371AB)
 M: Hervé Poussineau <hpoussin@reactos.org>
-M: Philippe Mathieu-Daudé <f4bug@amsat.org>
+M: Philippe Mathieu-Daudé <philmd@linaro.org>
 S: Maintained
 F: hw/isa/piix4.c
 F: include/hw/southbridge/piix.h
 
 Firmware configuration (fw_cfg)
-M: Philippe Mathieu-Daudé <f4bug@amsat.org>
+M: Philippe Mathieu-Daudé <philmd@linaro.org>
 R: Gerd Hoffmann <kraxel@redhat.com>
 S: Supported
 F: docs/specs/fw_cfg.txt
@@ -2374,13 +2374,13 @@ F: hw/intc/openpic.c
 F: include/hw/ppc/openpic.h
 
 MIPS CPS
-M: Philippe Mathieu-Daudé <f4bug@amsat.org>
+M: Philippe Mathieu-Daudé <philmd@linaro.org>
 S: Odd Fixes
 F: hw/misc/mips_*
 F: include/hw/misc/mips_*
 
 MIPS GIC
-M: Philippe Mathieu-Daudé <f4bug@amsat.org>
+M: Philippe Mathieu-Daudé <philmd@linaro.org>
 S: Odd Fixes
 F: hw/intc/mips_gic.c
 F: hw/timer/mips_gictimer.c
@@ -2462,7 +2462,7 @@ F: audio/alsaaudio.c
 
 Core Audio framework backend
 M: Gerd Hoffmann <kraxel@redhat.com>
-M: Philippe Mathieu-Daudé <f4bug@amsat.org>
+M: Philippe Mathieu-Daudé <philmd@linaro.org>
 R: Christian Schoenebeck <qemu_oss@crudebyte.com>
 R: Akihiko Odaki <akihiko.odaki@gmail.com>
 S: Odd Fixes
@@ -2687,7 +2687,7 @@ F: scripts/coccinelle/errp-guard.cocci
 
 GDB stub
 M: Alex Bennée <alex.bennee@linaro.org>
-R: Philippe Mathieu-Daudé <f4bug@amsat.org>
+R: Philippe Mathieu-Daudé <philmd@linaro.org>
 S: Maintained
 F: gdbstub/*
 F: include/exec/gdbstub.h
@@ -2698,7 +2698,7 @@ Memory API
 M: Paolo Bonzini <pbonzini@redhat.com>
 M: Peter Xu <peterx@redhat.com>
 M: David Hildenbrand <david@redhat.com>
-R: Philippe Mathieu-Daudé <f4bug@amsat.org>
+R: Philippe Mathieu-Daudé <philmd@linaro.org>
 S: Supported
 F: include/exec/ioport.h
 F: include/exec/memop.h
@@ -2748,7 +2748,7 @@ F: util/drm.c
 
 Cocoa graphics
 M: Peter Maydell <peter.maydell@linaro.org>
-M: Philippe Mathieu-Daudé <f4bug@amsat.org>
+M: Philippe Mathieu-Daudé <philmd@linaro.org>
 R: Akihiko Odaki <akihiko.odaki@gmail.com>
 S: Odd Fixes
 F: ui/cocoa.m
@@ -3231,14 +3231,14 @@ F: tests/qtest/max34451-test.c
 F: tests/qtest/isl_pmbus_vr-test.c
 
 Firmware schema specifications
-M: Philippe Mathieu-Daudé <f4bug@amsat.org>
+M: Philippe Mathieu-Daudé <philmd@linaro.org>
 R: Daniel P. Berrange <berrange@redhat.com>
 R: Kashyap Chamarthy <kchamart@redhat.com>
 S: Maintained
 F: docs/interop/firmware.json
 
 EDK2 Firmware
-M: Philippe Mathieu-Daudé <f4bug@amsat.org>
+M: Philippe Mathieu-Daudé <philmd@linaro.org>
 M: Gerd Hoffmann <kraxel@redhat.com>
 S: Supported
 F: hw/i386/*ovmf*
@@ -3349,7 +3349,7 @@ S: Maintained
 F: tcg/loongarch64/
 
 MIPS TCG target
-M: Philippe Mathieu-Daudé <f4bug@amsat.org>
+M: Philippe Mathieu-Daudé <philmd@linaro.org>
 R: Aurelien Jarno <aurelien@aurel32.net>
 R: Huacai Chen <chenhuacai@kernel.org>
 R: Jiaxun Yang <jiaxun.yang@flygoat.com>
@@ -3472,7 +3472,7 @@ F: block/null.c
 NVMe Block Driver
 M: Stefan Hajnoczi <stefanha@redhat.com>
 R: Fam Zheng <fam@euphon.net>
-R: Philippe Mathieu-Daudé <f4bug@amsat.org>
+R: Philippe Mathieu-Daudé <philmd@linaro.org>
 L: qemu-block@nongnu.org
 S: Supported
 F: block/nvme*
@@ -3691,7 +3691,7 @@ Build and test automation
 -------------------------
 Build and test automation, general continuous integration
 M: Alex Bennée <alex.bennee@linaro.org>
-M: Philippe Mathieu-Daudé <f4bug@amsat.org>
+M: Philippe Mathieu-Daudé <philmd@linaro.org>
 M: Thomas Huth <thuth@redhat.com>
 R: Wainer dos Santos Moschetta <wainersm@redhat.com>
 R: Beraldo Leal <bleal@redhat.com>
@@ -3724,7 +3724,7 @@ W: https://cirrus-ci.com/github/qemu/qemu
 
 Guest Test Compilation Support
 M: Alex Bennée <alex.bennee@linaro.org>
-R: Philippe Mathieu-Daudé <f4bug@amsat.org>
+R: Philippe Mathieu-Daudé <philmd@linaro.org>
 S: Maintained
 F: tests/tcg/Makefile
 F: tests/tcg/Makefile.include
@@ -3732,7 +3732,7 @@ F: tests/tcg/Makefile.include
 Integration Testing with the Avocado framework
 W: https://trello.com/b/6Qi1pxVn/avocado-qemu
 R: Cleber Rosa <crosa@redhat.com>
-R: Philippe Mathieu-Daudé <f4bug@amsat.org>
+R: Philippe Mathieu-Daudé <philmd@linaro.org>
 R: Wainer dos Santos Moschetta <wainersm@redhat.com>
 R: Beraldo Leal <bleal@redhat.com>
 S: Odd Fixes
@@ -3740,7 +3740,7 @@ F: tests/avocado/
 
 GitLab custom runner (Works On Arm Sponsored)
 M: Alex Bennée <alex.bennee@linaro.org>
-M: Philippe Mathieu-Daudé <f4bug@amsat.org>
+M: Philippe Mathieu-Daudé <philmd@linaro.org>
 S: Maintained
 F: .gitlab-ci.d/custom-runners/ubuntu-22.04-aarch64.yml
 F: .gitlab-ci.d/custom-runners/ubuntu-22.04-aarch32.yml
-- 
2.37.3


