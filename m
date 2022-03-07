Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D58034D047F
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 17:48:59 +0100 (CET)
Received: from localhost ([::1]:36010 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRGXa-0003qC-VP
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 11:48:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33878)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nRGVv-0001Kx-RM
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 11:47:15 -0500
Received: from [2a00:1450:4864:20::329] (port=43777
 helo=mail-wm1-x329.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nRGVt-0007id-Vx
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 11:47:15 -0500
Received: by mail-wm1-x329.google.com with SMTP id
 l1-20020a05600c4f0100b00389645443d2so6802409wmq.2
 for <qemu-devel@nongnu.org>; Mon, 07 Mar 2022 08:47:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=liZ3xRTODiBMa4k66UOtkpnhJqUkO3fe1jV3llOVjQQ=;
 b=nZL9l6AL82j9//H/A+QvqN8NFhfiUz2MkQ0N74KmQxAne2Lu1Xp5IU/YV8ZkwWsMfz
 EpO1mfIazwN0inf4SxYAqdN4LYFDxRxC6+MsivWrTqLV6GAG8Vvxga2YOHXnNVpiCnka
 h8rLdf9+o60flVOR192dnHEZS6O/4djojrPVG1S77sx/Hzi0qp61GixsthkApQgoklWW
 0e6o794nw0wBaY75NFXrZnK5EIIPGZkonLwZ+j/Y3Kvop7X4xcmdzLmuID4n4iffpwCe
 gu48rDidjVl3FXQNatIluV1cLrA058aCqdJWOW8Mo7bAE4l+154MpaMK4GqvVAnG5rLq
 VFQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=liZ3xRTODiBMa4k66UOtkpnhJqUkO3fe1jV3llOVjQQ=;
 b=XjQ63EXpnYff46yXDgmNL/+THm5qHp/6l1l0h5ZA8h6R13Z17yUQE0LOtJLlZJZFEG
 ao6RYyNaqAzCU+eO7mcMXegs+4e7nEUPuF12GeLly1eISLdTT6rPK5BXHcmzpEgPyi8G
 3T7XDaDCVA9rnwBVTiIfBFK+QPtrbqshMuTp2+1DItWsf873aFDRuxA7rZnbvV/9U9Q1
 wiWUvvzOuwfVXTekkNU4Vy2AP0vW+ls3OGTzl32jZEiVDK4RfqUgpPaSACMB3EZNcnQ9
 mOz5xFMT7wx5QM+ETIe4PNFRyhSzsI+FPy9SFa/mKOIIxYvRORpQveaGYIL5himqgj65
 Nr0w==
X-Gm-Message-State: AOAM530AzTkcskvL0fmTmLQ0kEyp2Rf17/IG6VYb8tYVVwHRqP+dmn+Y
 zT1nNRXekbfOCP0lAi7HFW76x1mMf/mJYA==
X-Google-Smtp-Source: ABdhPJwIp7CM5iqJfxpwU8HSTptTC3lqgBWPMFXbp86FIIuMqKdyH266I/D3Up3dCx24MyOkS5F+Ew==
X-Received: by 2002:a05:600c:1f18:b0:381:691c:b481 with SMTP id
 bd24-20020a05600c1f1800b00381691cb481mr9649494wmb.44.1646671631860; 
 Mon, 07 Mar 2022 08:47:11 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 v188-20020a1cacc5000000b00384b71a50d5sm13806652wme.24.2022.03.07.08.47.11
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Mar 2022 08:47:11 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 00/18] target-arm queue
Date: Mon,  7 Mar 2022 16:46:51 +0000
Message-Id: <20220307164709.2503250-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::329
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x329.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

Last lot of target-arm stuff: cleanups, bug fixes; nothing major here.

-- PMM

The following changes since commit 9d662a6b22a0838a85c5432385f35db2488a33a5:

  Merge remote-tracking branch 'remotes/legoater/tags/pull-ppc-20220305' into staging (2022-03-05 18:03:15 +0000)

are available in the Git repository at:

  https://git.linaro.org/people/pmaydell/qemu-arm.git tags/pull-target-arm-20220307

for you to fetch changes up to 0942820408dc788560f6968e9b5f011803b846c2:

  hw/arm/virt: Disable LPA2 for -machine virt-6.2 (2022-03-07 14:32:21 +0000)

----------------------------------------------------------------
target-arm queue:
 * cleanups of qemu_oom_check() and qemu_memalign()
 * target/arm/translate-neon: UNDEF if VLD1/VST1 stride bits are non-zero
 * target/arm/translate-neon: Simplify align field check for VLD3
 * GICv3 ITS: add more trace events
 * GICv3 ITS: implement 8-byte accesses properly
 * GICv3: fix minor issues with some trace/log messages
 * ui/cocoa: Use the standard about panel
 * target/arm: Provide cpu property for controling FEAT_LPA2
 * hw/arm/virt: Disable LPA2 for -machine virt-6.2

----------------------------------------------------------------
Akihiko Odaki (1):
      ui/cocoa: Use the standard about panel

Peter Maydell (15):
      util: Make qemu_oom_check() a static function
      util: Unify implementations of qemu_memalign()
      util: Return valid allocation for qemu_try_memalign() with zero size
      meson.build: Don't misdetect posix_memalign() on Windows
      util: Share qemu_try_memalign() implementation between POSIX and Windows
      util: Use meson checks for valloc() and memalign() presence
      util: Put qemu_vfree() in memalign.c
      osdep: Move memalign-related functions to their own header
      target/arm/translate-neon: UNDEF if VLD1/VST1 stride bits are non-zero
      target/arm/translate-neon: Simplify align field check for VLD3
      hw/intc/arm_gicv3_its: Add trace events for commands
      hw/intc/arm_gicv3_its: Add trace events for table reads and writes
      hw/intc/arm_gicv3: Specify valid and impl in MemoryRegionOps
      hw/intc/arm_gicv3: Fix missing spaces in error log messages
      hw/intc/arm_gicv3_cpuif: Fix register names in ICV_HPPIR read trace event

Richard Henderson (2):
      target/arm: Provide cpu property for controling FEAT_LPA2
      hw/arm/virt: Disable LPA2 for -machine virt-6.2

 meson.build                    |   7 ++-
 include/hw/arm/virt.h          |   1 +
 include/qemu-common.h          |   2 -
 include/qemu/memalign.h        |  61 ++++++++++++++++++++++
 include/qemu/osdep.h           |  18 -------
 target/arm/cpu.h               |   5 +-
 block/blkverify.c              |   1 +
 block/block-copy.c             |   1 +
 block/commit.c                 |   1 +
 block/crypto.c                 |   1 +
 block/dmg.c                    |   1 +
 block/export/fuse.c            |   1 +
 block/file-posix.c             |   1 +
 block/io.c                     |   1 +
 block/mirror.c                 |   1 +
 block/nvme.c                   |   1 +
 block/parallels-ext.c          |   1 +
 block/parallels.c              |   1 +
 block/qcow.c                   |   1 +
 block/qcow2-cache.c            |   1 +
 block/qcow2-cluster.c          |   1 +
 block/qcow2-refcount.c         |   1 +
 block/qcow2-snapshot.c         |   1 +
 block/qcow2.c                  |   1 +
 block/qed-l2-cache.c           |   1 +
 block/qed-table.c              |   1 +
 block/qed.c                    |   1 +
 block/quorum.c                 |   1 +
 block/raw-format.c             |   1 +
 block/vdi.c                    |   1 +
 block/vhdx-log.c               |   1 +
 block/vhdx.c                   |   1 +
 block/vmdk.c                   |   1 +
 block/vpc.c                    |   1 +
 block/win32-aio.c              |   1 +
 hw/arm/virt.c                  |   7 +++
 hw/block/dataplane/xen-block.c |   1 +
 hw/block/fdc.c                 |   1 +
 hw/ide/core.c                  |   1 +
 hw/intc/arm_gicv3.c            |   8 +++
 hw/intc/arm_gicv3_cpuif.c      |   3 +-
 hw/intc/arm_gicv3_dist.c       |   4 +-
 hw/intc/arm_gicv3_its.c        |  69 +++++++++++++++++++++----
 hw/ppc/spapr.c                 |   1 +
 hw/ppc/spapr_softmmu.c         |   1 +
 hw/scsi/scsi-disk.c            |   1 +
 hw/tpm/tpm_ppi.c               |   2 +-
 nbd/server.c                   |   1 +
 net/l2tpv3.c                   |   2 +-
 plugins/loader.c               |   1 +
 qemu-img.c                     |   1 +
 qemu-io-cmds.c                 |   1 +
 qom/object.c                   |   1 +
 softmmu/physmem.c              |   1 +
 target/arm/cpu.c               |   6 +++
 target/arm/cpu64.c             |  24 +++++++++
 target/arm/translate-neon.c    |  13 +++--
 target/i386/hvf/hvf.c          |   1 +
 target/i386/kvm/kvm.c          |   1 +
 tcg/region.c                   |   1 +
 tests/bench/atomic_add-bench.c |   1 +
 tests/bench/qht-bench.c        |   1 +
 util/atomic64.c                |   1 +
 util/memalign.c                |  92 +++++++++++++++++++++++++++++++++
 util/oslib-posix.c             |  46 -----------------
 util/oslib-win32.c             |  35 -------------
 util/qht.c                     |   1 +
 hw/intc/trace-events           |  21 ++++++++
 tests/avocado/boot_linux.py    |   2 +
 ui/cocoa.m                     | 112 +++++++++--------------------------------
 util/meson.build               |   1 +
 71 files changed, 377 insertions(+), 212 deletions(-)
 create mode 100644 include/qemu/memalign.h
 create mode 100644 util/memalign.c

