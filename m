Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BCFEB6DC060
	for <lists+qemu-devel@lfdr.de>; Sun,  9 Apr 2023 16:42:24 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1plWER-0003hi-PK; Sun, 09 Apr 2023 10:41:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <minhquangbui99@gmail.com>)
 id 1plWEL-0003h6-6u
 for qemu-devel@nongnu.org; Sun, 09 Apr 2023 10:41:21 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <minhquangbui99@gmail.com>)
 id 1plWEH-0000iW-Dl
 for qemu-devel@nongnu.org; Sun, 09 Apr 2023 10:41:18 -0400
Received: by mail-pl1-x629.google.com with SMTP id e13so2330731plc.12
 for <qemu-devel@nongnu.org>; Sun, 09 Apr 2023 07:41:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1681051275;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=5RvaBYf5DJbYCJbZ1zrXW81aVK60dNU0B/e+fl2F9uE=;
 b=GSdAdR1sTxQNlaG8yJMR7GL9En4rLKPyvEbCC+7Y3Q9cyBEBE7NEKVCiqClhKRvvHq
 uLBAS5rBsUsSZ6zLSEs8TXEDQJ4iCcwPiT530SbjpYKlNiypRigQjzwMSpjSHC7Z8Qyu
 V0gqtW7c01gOiHvyzCiYHY/gJZA4QB9GEj3n96XNjreOltN6sbuWSACcK0x+BzSmvmN5
 Tmff2duwDGcbzgFRH8ZQNtL5K1bEoNAw/ogHY6P2hOFvtUqTRKG1hhFukral+qWEz5bj
 oQdLe3CSu7eJXLoPTPi4O9S+LcJkfzBrxB1bMzNEbMHeb3r27JaUgHSqE2F7D9DZObQ9
 71yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681051275;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5RvaBYf5DJbYCJbZ1zrXW81aVK60dNU0B/e+fl2F9uE=;
 b=YKxnRtDkOxSiBuW77sj1O9hGlHW0iiROf3BNJ0DODEbCrbUSpXO3l5Qx2/gJpic+d+
 h/TKPtY7RvR/FzprxnxJHOu4FBWMEbmdGJqruK38BYawMFM/GOLzIoQxx0Pv/2FQdByu
 YBAICbjNw9V28imjE99zWDpVYuLfL/Ef8unGAVrTThM6wezAHVCLzJ7KUUNbAkOPpGBs
 pFeAS12eAUd90XBG9dOocfDQksigNAQNCtVVwRf4WqT1PEJD3XRwsSCbU+sxzRFzoSSX
 jNeJahTe+zqqfedlI7TA6eYyIQV7FM14MHicaZ3ZLm7yZ6C/7Le0sCT3iRk7m4KMf+IR
 8G2Q==
X-Gm-Message-State: AAQBX9e/Yu2+uLyGXem0trJhzo4BcTogmDJ3rbNVOYnJF9DjnSvJM/yt
 ugZKznu/tzw7gZM3xw37IQfRtjUzfJcnrw==
X-Google-Smtp-Source: AKy350Zb1xszT0m87wVKDT/XA+guBOhsw+MFTt5zMfML/xNsuv7MUVzCte86zB5Vk+pVAPQlqsdPNQ==
X-Received: by 2002:a17:902:f543:b0:19c:ff5d:1fd2 with SMTP id
 h3-20020a170902f54300b0019cff5d1fd2mr8993359plf.8.1681051275027; 
 Sun, 09 Apr 2023 07:41:15 -0700 (PDT)
Received: from localhost.localdomain ([113.173.97.170])
 by smtp.googlemail.com with ESMTPSA id
 iw5-20020a170903044500b0019a91895cdfsm5999724plb.50.2023.04.09.07.41.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Apr 2023 07:41:14 -0700 (PDT)
From: Bui Quang Minh <minhquangbui99@gmail.com>
To: qemu-devel@nongnu.org
Cc: David Woodhouse <dwmw2@infradead.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Bui Quang Minh <minhquangbui99@gmail.com>
Subject: [PATCH v3 0/5] Support x2APIC mode with TCG accelerator
Date: Sun,  9 Apr 2023 21:40:22 +0700
Message-Id: <20230409144022.8111-1-minhquangbui99@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=minhquangbui99@gmail.com; helo=mail-pl1-x629.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Hi everyone,

This series implements x2APIC mode in userspace local APIC and the
RDMSR/WRMSR helper to access x2APIC registers in x2APIC mode. Intel iommu
and AMD iommu are adjusted to support x2APIC interrupt remapping. With this
series, we can now boot Linux kernel into x2APIC mode with TCG accelerator
using either Intel or AMD iommu.

Testing the emulated userspace APIC with kvm-unit-tests, disable test
device with this patch

diff --git a/lib/x86/fwcfg.c b/lib/x86/fwcfg.c
index 1734afb..f56fe1c 100644
--- a/lib/x86/fwcfg.c
+++ b/lib/x86/fwcfg.c
@@ -27,6 +27,7 @@ static void read_cfg_override(void)
 
        if ((str = getenv("TEST_DEVICE")))
                no_test_device = !atol(str);
+       no_test_device = true;
 
        if ((str = getenv("MEMLIMIT")))
                fw_override[FW_CFG_MAX_RAM] = atol(str) * 1024 * 1024;

~ env QEMU=/home/minh/Desktop/oss/qemu/build/qemu-system-x86_64 ACCEL=tcg \
./run_tests.sh -v -g apic 

TESTNAME=apic-split TIMEOUT=90s ACCEL=tcg ./x86/run x86/apic.flat -smp 2
-cpu qemu64,+x2apic,+tsc-deadline -machine kernel_irqchip=split FAIL
apic-split (54 tests, 8 unexpected failures, 1 skipped)
TESTNAME=ioapic-split TIMEOUT=90s ACCEL=tcg ./x86/run x86/ioapic.flat -smp
1 -cpu qemu64 -machine kernel_irqchip=split PASS ioapic-split (19 tests)
TESTNAME=x2apic TIMEOUT=30 ACCEL=tcg ./x86/run x86/apic.flat -smp 2 -cpu
qemu64,+x2apic,+tsc-deadline FAIL x2apic (54 tests, 8 unexpected failures,
1 skipped) TESTNAME=xapic TIMEOUT=60 ACCEL=tcg ./x86/run x86/apic.flat -smp
2 -cpu qemu64,-x2apic,+tsc-deadline -machine pit=off FAIL xapic (43 tests,
6 unexpected failures, 2 skipped)

  FAIL: apic_disable: *0xfee00030: 50014
  FAIL: apic_disable: *0xfee00080: f0
  FAIL: apic_disable: *0xfee00030: 50014
  FAIL: apic_disable: *0xfee00080: f0 
  FAIL: apicbase: relocate apic

These errors are because we don't disable MMIO region when switching to
x2APIC and don't support relocate MMIO region yet. This is a problem
because, MMIO region is the same for all CPUs, in order to support these we
need to figure out how to allocate and manage different MMIO regions for
each CPUs. This can be an improvement in the future.

  FAIL: nmi-after-sti
  FAIL: multiple nmi

These errors are in the way we handle CPU_INTERRUPT_NMI in core TCG.

  FAIL: TMCCT should stay at zero

This error is related to APIC timer which should be addressed in separate
patch.

Version 3 changes,
- Patch 2:
  + Allow APIC ID > 255 only when x2APIC feature is supported on CPU
  + Make physical destination mode IPI which has destination id 0xffffffff
  a broadcast to xAPIC CPUs
  + Make cluster address 0xf in cluster model of xAPIC logical destination
  mode a broadcast to all clusters
  + Create new extended_log_dest to store APIC_LDR information in x2APIC
  instead of extending log_dest for backward compatibility in vmstate

Version 2 changes,
- Add support for APIC ID larger than 255
- Adjust AMD iommu for x2APIC suuport
- Reorganize and split patch 1,2 into patch 1,2,3 in version 2

Thanks,
Quang Minh.

Bui Quang Minh (5):
  i386/tcg: implement x2APIC registers MSR access
  apic: add support for x2APIC mode
  apic, i386/tcg: add x2apic transitions
  intel_iommu: allow Extended Interrupt Mode when using userspace APIC
  amd_iommu: report x2APIC support to the operating system

 hw/i386/acpi-build.c                 |  28 +-
 hw/i386/amd_iommu.c                  |  21 +-
 hw/i386/amd_iommu.h                  |  16 +-
 hw/i386/intel_iommu.c                |  11 -
 hw/i386/x86.c                        |   8 +-
 hw/intc/apic.c                       | 395 +++++++++++++++++++++------
 hw/intc/apic_common.c                |  16 +-
 hw/intc/trace-events                 |   4 +-
 include/hw/i386/apic.h               |   6 +-
 include/hw/i386/apic_internal.h      |   7 +-
 target/i386/cpu-sysemu.c             |  18 +-
 target/i386/cpu.c                    |   5 +-
 target/i386/cpu.h                    |   9 +
 target/i386/tcg/sysemu/misc_helper.c |  31 +++
 14 files changed, 436 insertions(+), 139 deletions(-)

-- 
2.25.1


