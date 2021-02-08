Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA64A31432F
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 23:50:08 +0100 (CET)
Received: from localhost ([::1]:38642 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9FM7-0006wy-MG
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 17:50:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50208)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1l9BCG-0002rx-72
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 13:23:43 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:40449)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1l9BCE-00060k-0X
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 13:23:39 -0500
Received: by mail-wm1-x332.google.com with SMTP id o24so41971wmh.5
 for <qemu-devel@nongnu.org>; Mon, 08 Feb 2021 10:23:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Zl1fdjyB1XzMCBfQrn5qcWhgd4C3TSjOG7DDl30h0qU=;
 b=JiICDW1PDgR+kGggFe1jhaqUQoLkb8UyrZ7+m3ohZrnYFgPwxDSbS/+8QzSjRM8C4L
 uhTTDjDIItvRfXdHyY+8I9D8t9MusL0UE8B1uRvzasZXrEkQAc5k5gdmdblXuC0mEhys
 kdwCJHAjZz9boWN0NVNQJUk5loNs1f0mhbL5K7UNCgofrCIgRAGcQGCiXmkpXbtALkPB
 7q6jIT/6Cnun1810Psy8YOzomem69yF8PnipXwdB63L2bFfcpiB8/mvRTGXtFZ9KZ2bo
 ue1YduSNaSXXTmaezPU9QB6WP94kets9XFc70btD77H6xwP7u4R7dwHGHCmKRoE1+zpn
 g4dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=Zl1fdjyB1XzMCBfQrn5qcWhgd4C3TSjOG7DDl30h0qU=;
 b=gO5t5Iiy6DfwLEIFAfIA53gXaXGx7CuoLWBdh/1Kht0eGiu+GOCd0wDVil36ynPeR9
 Zu0G0/tBqlMJWpXzAHTsxzVHzea4DHt2Kk0fpw4JHsb238aWljxYrH0B27uV93kuhQyy
 ccBXUcEyVC69O0GwJExYySD10l/2Uy8RLvXq3URPb2fSvc/MJjdD2WYghNKgKrWoR9Ld
 OlV8HHsGc25hIkqxYJqMszBuVu/PzwY4v4GBkXjme/Wt1j3LITg9Y/MYybK0gjsiPx/T
 ZYaGRLrZ1jiZFWj2HEzROEHHkPFJwJ3kTsoxORjTm1ojILDUsQSTjtQS4uxae9w3VUXP
 u3iw==
X-Gm-Message-State: AOAM533MbJXnMKofsVh4Si2KrA8P1xer08vm5ylHANl+7NO/0ORhFrZ+
 5WRC06Q+1solteV4uD52GpEwTKN4zRD1aQ==
X-Google-Smtp-Source: ABdhPJz2VHOVLJdw7g1VnI5L5BdQf6wsRnrUdO+vU4Er8MwkAG91hcT929ByAHWZDGkhcTLdETt/yQ==
X-Received: by 2002:a7b:c451:: with SMTP id l17mr73350wmi.158.1612808613698;
 Mon, 08 Feb 2021 10:23:33 -0800 (PST)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 x22sm19670wmc.25.2021.02.08.10.23.32 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Feb 2021 10:23:32 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 00/46] Misc patches for 2021-02-08
Date: Mon,  8 Feb 2021 19:22:45 +0100
Message-Id: <20210208182331.58897-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x332.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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

The following changes since commit 6f0e9c26dbae9ac18b89d359791008fe3432ca91:

  Merge remote-tracking branch 'remotes/dg-gitlab/tags/cgs-pull-request' into staging (2021-02-08 11:11:26 +0000)

are available in the Git repository at:

  https://gitlab.com/bonzini/qemu.git tags/for-upstream

for you to fetch changes up to 52a44ad2b92ba4cd81c2b271cd5e4a2d820e91fc:

  target/i386: Expose VMX entry/exit load pkrs control bits (2021-02-08 15:15:32 +0100)

----------------------------------------------------------------
* Fuzzing improvements (Qiuhao, Alexander)
* i386: Fix BMI decoding for instructions with the 0x66 prefix (David)
* initial attempt at fixing event_notifier emulation (Maxim)
* i386: PKS emulation, fix for "qemu-system-i386 -cpu host" (myself)
* meson: RBD test fixes (myself)
* meson: TCI warnings (Philippe)
* Leaner build for --disable-guest-agent, --disable-system and
  --disable-tools (Philippe, Stefan)
* --enable-tcg-interpreter fix (Richard)
* i386: SVM feature bits (Wei)
* KVM bugfix (Thomas H.)
* Add missing MemoryRegionOps callbacks (PJP)

----------------------------------------------------------------
Alexander Bulekov (7):
      fuzz: ignore address_space_map is_write flag
      fuzz: refine the ide/ahci fuzzer configs
      docs/fuzz: fix pre-meson path
      fuzz: log the arguments used to initialize QEMU
      fuzz: enable dynamic args for generic-fuzz configs
      docs/fuzz: add some information about OSS-Fuzz
      fuzz: add virtio-9p configurations for fuzzing

Chenyi Qiang (2):
      target/i386: Add support for save/load IA32_PKRS MSR
      target/i386: Expose VMX entry/exit load pkrs control bits

David Greenaway (1):
      target/i386: Fix decoding of certain BMI instructions

Igor Mammedov (1):
      machine: add missing doc for memory-backend option

Maxim Levitsky (2):
      virtio-scsi: don't uninitialize queues that we didn't initialize
      event_notifier: handle initialization failure better

Paolo Bonzini (4):
      target/i386: do not set LM for 32-bit emulation "-cpu host/max"
      meson: accept either shared or static libraries if --disable-static
      meson: honor --enable-rbd if cc.links test fails
      target/i86: implement PKS

Pavel Dovgalyuk (2):
      replay: fix replay of the interrupts
      replay: rng-builtin support

Philippe Mathieu-Daudé (13):
      configure: Improve TCI feature description
      meson: Explicit TCG backend used
      meson: Warn when TCI is selected but TCG backend is available
      tests/meson: Only build softfloat objects if TCG is selected
      pc-bios/meson: Only install EDK2 blob firmwares with system emulation
      meson: Restrict block subsystem processing
      meson: Merge trace_events_subdirs array
      meson: Restrict some trace event directories to user/system emulation
      meson: Restrict emulation code
      qapi/meson: Restrict qdev code to system-mode emulation
      qapi/meson: Remove QMP from user-mode emulation
      qapi/meson: Restrict system-mode specific modules
      qapi/meson: Restrict UI module to system emulation and tools

Prasad J Pandit (8):
      hw/pci-host: add pci-intack write method
      pci-host: designware: add pcie-msi read method
      vfio: add quirk device write method
      prep: add ppc-parity write method
      nvram: add nrf51_soc flash read method
      spapr_pci: add spapr msi read method
      tz-ppc: add dummy read/write methods
      imx7-ccm: add digprog mmio write method

Qiuhao Li (1):
      fuzz: fix wrong index in clear_bits

Sergei Trofimovich (1):
      pc-bios/descriptors: fix paths in json files

Stefan Reiter (1):
      docs: don't install corresponding man page if guest agent is disabled

Thomas Huth (1):
      accel/kvm/kvm-all: Fix wrong return code handling in dirty log code

Utkarsh Tripathi (1):
      cpu-throttle: Remove timer_mod() from cpu_throttle_set()

Wei Huang (1):
      x86/cpu: Populate SVM CPUID feature bits

 MAINTAINERS                              |   1 +
 accel/kvm/kvm-all.c                      |  21 +--
 accel/tcg/tcg-accel-ops-icount.c         |   8 +-
 backends/hostmem.c                       |  10 ++
 backends/rng-builtin.c                   |   3 +-
 configure                                |   2 +-
 docs/devel/build-system.rst              |   2 +-
 docs/devel/fuzzing.rst                   |  35 ++++-
 docs/meson.build                         |   6 +-
 hw/misc/imx7_ccm.c                       |   8 ++
 hw/misc/tz-ppc.c                         |  14 ++
 hw/nvram/nrf51_nvm.c                     |  10 ++
 hw/pci-host/designware.c                 |  19 +++
 hw/pci-host/prep.c                       |   8 ++
 hw/ppc/prep_systemio.c                   |   8 ++
 hw/ppc/spapr_pci.c                       |  14 +-
 hw/scsi/virtio-scsi-dataplane.c          |   8 +-
 hw/vfio/pci-quirks.c                     |   8 ++
 include/exec/memory.h                    |   8 +-
 include/exec/memory_ldst_cached.h.inc    |   6 +-
 include/qemu/event_notifier.h            |   1 +
 memory_ldst.c.inc                        |   8 +-
 meson.build                              | 214 +++++++++++++++++--------------
 meson_options.txt                        |   2 +-
 pc-bios/descriptors/meson.build          |   2 +-
 pc-bios/meson.build                      |   1 +
 qapi/meson.build                         |  34 +++--
 qemu-options.hx                          |  26 +++-
 scripts/oss-fuzz/minimize_qtest_trace.py |   2 +-
 softmmu/cpu-throttle.c                   |  11 +-
 softmmu/memory.c                         |   5 +-
 softmmu/physmem.c                        |   4 +-
 stubs/meson.build                        |   2 +
 stubs/qdev.c                             |  23 ++++
 target/i386/cpu.c                        |  19 ++-
 target/i386/cpu.h                        |  31 +++--
 target/i386/helper.c                     |   3 +
 target/i386/kvm/kvm.c                    |  13 ++
 target/i386/machine.c                    |  24 +++-
 target/i386/tcg/excp_helper.c            |  32 +++--
 target/i386/tcg/misc_helper.c            |  14 ++
 target/i386/tcg/translate.c              |   2 +-
 tests/meson.build                        |  11 +-
 tests/qtest/fuzz/fuzz.c                  |  11 +-
 tests/qtest/fuzz/generic_fuzz.c          |  19 ++-
 tests/qtest/fuzz/generic_fuzz_configs.h  |  41 +++++-
 util/event_notifier-posix.c              |  16 +++
 47 files changed, 576 insertions(+), 194 deletions(-)
 create mode 100644 stubs/qdev.c
-- 
2.29.2


