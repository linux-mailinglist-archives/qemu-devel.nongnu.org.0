Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2844E6C928D
	for <lists+qemu-devel@lfdr.de>; Sun, 26 Mar 2023 07:23:40 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pgIqC-0007Ml-Ef; Sun, 26 Mar 2023 01:22:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <minhquangbui99@gmail.com>)
 id 1pgIqA-0007Ln-0w
 for qemu-devel@nongnu.org; Sun, 26 Mar 2023 01:22:50 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <minhquangbui99@gmail.com>)
 id 1pgIq7-0007nS-G1
 for qemu-devel@nongnu.org; Sun, 26 Mar 2023 01:22:49 -0400
Received: by mail-pj1-x1030.google.com with SMTP id
 e15-20020a17090ac20f00b0023d1b009f52so8901106pjt.2
 for <qemu-devel@nongnu.org>; Sat, 25 Mar 2023 22:22:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1679808165;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=FB88WkvgPHLOsj30dEt9pHTZsQbkJgH396D+jhT2auc=;
 b=A0JkSvys+6bLptRJ6+c0HJhuDGnoMeqlrUU730oQ6PRcGQaqx7yfDERDAzPiQsrlTO
 tzBBRueIpWBMPtJ13cMPY9bsXKttVcJktb9HxIz21AeSwiGK6btG3i6wOKg2V1VjI/dP
 CgFH2/LVSq2sTTTjaSIMEcAn8cibmOX0s0c9gQLAHZBYAgwdnSpHv6kORpsnZB1MIV6X
 BORGc3zVx4whX0oG9A2EzaqsGNaW0YNTDm3WGYyYIPJaM1z1d2j6td5aInajGc/Y6QBi
 t3ZFLvt2MZ/Hr69I3vz2hsRhh8PYFNAvzsS9/8SPzLMcrlCwW8vmnNRXxN3t+YUwQ4UF
 9Oqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679808165;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=FB88WkvgPHLOsj30dEt9pHTZsQbkJgH396D+jhT2auc=;
 b=MjHR9/GW2uQvqdFsAMeA+z29+B3SxNVgo8704MXvpPC/O1hcezE/RHc6vdS7mQ3r1E
 0njNbUdZ+uZqKwf4lyta7XXHwIlZaK6QIkzY+iR8ECB4sIJAaE/+P9OOpuu/DMgGt5GQ
 RR2+/C7PJLheVr7571T7uYOvpm2VV3al5xhzsuWridWxyP2wuuiQJuIsd3ofuYVMhP3B
 NtEiPxXLRrO6uck9gKFshkRdWUXlewDeCQ70eWk25s/zFv/ER1tkWmlA19MPM4e2sTr5
 lS62lnNOtyR4udToqaI4mn2lmu0n6LVcVQS7x6ZJv2RY88wShW5MJRmn7GFuhi3OlBNT
 25tQ==
X-Gm-Message-State: AAQBX9caFGwxDdxGCTOFC8FvNFIadI4r/9FjtokqIgN3ncEbDU+MB/pA
 U3KmDPuyPyhQJhmIjPXUQpMIfIb6SqFNAA==
X-Google-Smtp-Source: AKy350bEzkZ+VZqVdrwyYiXjqvMflsPr6ocwjWKR/S0xR8Gek5JoKQPyfrzIlIVvk1lpOhHMctPNVQ==
X-Received: by 2002:a17:902:d04b:b0:1a1:bd50:a9e with SMTP id
 l11-20020a170902d04b00b001a1bd500a9emr6046404pll.47.1679808164698; 
 Sat, 25 Mar 2023 22:22:44 -0700 (PDT)
Received: from localhost.localdomain ([113.173.97.170])
 by smtp.googlemail.com with ESMTPSA id
 bc9-20020a170902930900b001a20b31a23fsm5020258plb.293.2023.03.25.22.22.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Mar 2023 22:22:44 -0700 (PDT)
From: Bui Quang Minh <minhquangbui99@gmail.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, Igor Mammedov <imammedo@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Bui Quang Minh <minhquangbui99@gmail.com>
Subject: [PATCH v2 0/5] Support x2APIC mode with TCG accelerator
Date: Sun, 26 Mar 2023 12:20:34 +0700
Message-Id: <20230326052039.33717-1-minhquangbui99@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=minhquangbui99@gmail.com; helo=mail-pj1-x1030.google.com
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

 hw/i386/acpi-build.c                 |  28 +--
 hw/i386/amd_iommu.c                  |  21 +-
 hw/i386/amd_iommu.h                  |  16 +-
 hw/i386/intel_iommu.c                |  11 -
 hw/i386/x86.c                        |   8 +-
 hw/intc/apic.c                       | 358 ++++++++++++++++++++-------
 hw/intc/apic_common.c                |  15 +-
 hw/intc/trace-events                 |   4 +-
 include/hw/i386/apic.h               |   6 +-
 include/hw/i386/apic_internal.h      |   2 +-
 target/i386/cpu-sysemu.c             |  10 +
 target/i386/cpu.c                    |   5 +-
 target/i386/cpu.h                    |   9 +
 target/i386/tcg/sysemu/misc_helper.c |  31 +++
 14 files changed, 389 insertions(+), 135 deletions(-)

-- 
2.25.1


