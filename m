Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B140389FD1
	for <lists+qemu-devel@lfdr.de>; Thu, 20 May 2021 10:30:42 +0200 (CEST)
Received: from localhost ([::1]:37508 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lje4n-0002jH-EA
	for lists+qemu-devel@lfdr.de; Thu, 20 May 2021 04:30:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50326)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1ljdxU-0005Ma-Hg
 for qemu-devel@nongnu.org; Thu, 20 May 2021 04:23:09 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:43788)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1ljdxM-0001SE-Ix
 for qemu-devel@nongnu.org; Thu, 20 May 2021 04:23:02 -0400
Received: by mail-wr1-x432.google.com with SMTP id p7so12939793wru.10
 for <qemu-devel@nongnu.org>; Thu, 20 May 2021 01:22:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LbsX/0Zl5aR3mKf3/HFCjswwVuUnU990G1ukApX+aSs=;
 b=dpmM7DMIrwdH0n38JmLIpxXohKjudh96OQe39H5FoKhEKhPTMdnjipMDnynPQitusF
 pnEOLSYTG+LMD7qRgjndEtAtnb71G8Bwi7fWiChkwtDct2naRcG7OVEFUyDWhtktgoyB
 pA9pva7SAM76vANQ5lcdIEHPVWq3O0BI181a49rf2cadIpzozCKsEHJe4HMGfQg9Fm4a
 3Ce9TNF5Xj8LA3rExFAHfqOX+Or79sbChFi7O2wmrXdDNfRRLgEnZNfKMjGCTg6obtkP
 akxcxr3tqCZp/WlDOLt19C4sQUVRgG2jihLumFwjKLcoVwaVz+jgSd/HXPtx03bOcPf+
 thRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=LbsX/0Zl5aR3mKf3/HFCjswwVuUnU990G1ukApX+aSs=;
 b=OSE6kXe1z5V6OHqHBQtJ/vsxV/HSWCmUbNprcyWcfh8Q73s1HJJVEipveEPHplWUDK
 Dk5ODiwsjVQR/VBP8gBKU1D8i6ZOd5vii6rdT+zd536ok+ucEEIHZBAo3Yq2KmeNes0T
 NMBZtXwOEpp229i5FD8iN3uOlB7RWuUYhssTQqFXyp9ZKw9TnKLutzrqsiNbDh4b+vSe
 9IWLW1EzoAHJJr90mZAgUOdH/TvHEeOr9vfRcRIsSrkzGz6OU57gHtbQ3YoOuCIgHpw6
 yNSIidseruB+zqwRYd5K4nTqLUuvmXOEfCW71uLgiZQA7X0t/rjdrQxZ7Ee7ktjwRLPi
 6PJw==
X-Gm-Message-State: AOAM531YJwWS4ExojZEdkOh5+f4rHnf6eV5+CjoHzZI/yXPYAAgQrqIJ
 lUwTVGtVx+zEJ750SKXZpM6efmTitLWqeQ==
X-Google-Smtp-Source: ABdhPJzeOzLCZzVpK00asTW3+Gb4MHgMeRimXlgGnZkE+eF7NnEtGPrCrRMfHN/EaLmZSOecEaZLwg==
X-Received: by 2002:adf:e484:: with SMTP id i4mr2928973wrm.117.1621498978822; 
 Thu, 20 May 2021 01:22:58 -0700 (PDT)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 v10sm2603506wrq.0.2021.05.20.01.22.58 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 May 2021 01:22:58 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 00/26] Misc patches for 2021-05-20
Date: Thu, 20 May 2021 10:22:31 +0200
Message-Id: <20210520082257.187061-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x432.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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

The following changes since commit 15e147b3c778f9f4c08c79b99747b848b6e2117b:

  Merge remote-tracking branch 'remotes/nvme/tags/nvme-next-pull-request' into staging (2021-05-18 12:22:16 +0100)

are available in the Git repository at:

  https://gitlab.com/bonzini/qemu.git tags/tags/for-upstream-v2

for you to fetch changes up to 976551ba504a3284f9ab9862d9434b422c6841a1:

  scsi-generic: pass max_segments via max_iov field in BlockLimits (2021-05-18 17:51:15 +0200)

----------------------------------------------------------------
* submodule cleanups (Philippe, myself)
* tiny step towards a usable preconfig mode (myself)
* bump Meson submodule (myself)
* Kconfig and LOCK_GUARD cleanups (philippe)
* new x86 CPUID feature (Yang Zhong)
* "-object qtest" support (myself)
* Dirty ring support for KVM (Peter)
* Fixes for 6.0 command line parsing breakage (myself)
* Fix for macOS 11.3 SDK (Katsuhiro)
* Fix for scsi-generic handling (myself)

----------------------------------------------------------------
Katsuhiro Ueno (1):
      meson: Set implicit_include_directories to false

Paolo Bonzini (11):
      configure: check for submodules if --with-git-submodules=ignore
      configure: simplify assignment to GIT_SUBMODULES
      meson: bump submodule to 0.57.2
      object: add more commands to preconfig mode
      qtest: add a QOM object for qtest
      KVM: do not allow setting properties at runtime
      remove qemu-options* from root directory
      replication: move include out of root directory
      vl: allow not specifying size in -m when using -M memory-backend
      qemu-config: load modules when instantiating option groups
      scsi-generic: pass max_segments via max_iov field in BlockLimits

Peter Xu (10):
      memory: Introduce log_sync_global() to memory listener
      KVM: Use a big lock to replace per-kml slots_lock
      KVM: Create the KVMSlot dirty bitmap on flag changes
      KVM: Provide helper to get kvm dirty log
      KVM: Provide helper to sync dirty bitmap from slot to ramblock
      KVM: Simplify dirty log sync in kvm_set_phys_mem
      KVM: Cache kvm slot dirty bitmap size
      KVM: Add dirty-ring-size property
      KVM: Disable manual dirty log when dirty ring enabled
      KVM: Dirty ring support

Philippe Mathieu-Daudé (3):
      configure: Only clone softfloat-3 repositories if TCG is enabled
      hw/mem/nvdimm: Use Kconfig 'imply' instead of 'depends on'
      tests/qtest/fuzz: Fix build failure

Yang Zhong (1):
      i386/cpu: Expose AVX_VNNI instruction to guest

 Makefile                                      |   2 +
 accel/kvm/kvm-all.c                           | 615 ++++++++++++++++++++++----
 accel/kvm/trace-events                        |   7 +
 block/file-posix.c                            |   3 +-
 block/replication.c                           |   2 +-
 configure                                     |  67 ++-
 default-configs/devices/ppc64-softmmu.mak     |   1 -
 hmp-commands.hx                               |   2 +
 hw/arm/Kconfig                                |   1 +
 hw/i386/Kconfig                               |   1 +
 hw/mem/Kconfig                                |   2 -
 hw/ppc/Kconfig                                |   1 +
 hw/scsi/scsi-generic.c                        |   6 +-
 replication.h => include/block/replication.h  |   4 +-
 include/exec/memory.h                         |  12 +
 include/hw/core/cpu.h                         |   7 +
 include/qemu/config-file.h                    |   2 +-
 qemu-options.h => include/qemu/qemu-options.h |   9 +-
 include/sysemu/kvm_int.h                      |   7 +-
 meson                                         |   2 +-
 meson.build                                   |   1 +
 migration/colo.c                              |   2 +-
 os-posix.c                                    |   2 +-
 os-win32.c                                    |   1 -
 qapi/qom.json                                 |  23 +-
 qemu-options-wrapper.h                        |  40 --
 qemu-options.hx                               |  16 +
 replication.c                                 |   2 +-
 softmmu/memory.c                              |  33 +-
 softmmu/qtest.c                               | 185 +++++++-
 softmmu/vl.c                                  |  52 ++-
 stubs/meson.build                             |   1 +
 stubs/module-opts.c                           |   6 +
 target/i386/cpu.c                             |   4 +-
 target/i386/cpu.h                             |   2 +
 tests/qtest/fuzz/fuzz.c                       |   1 +
 tests/unit/test-replication.c                 |   2 +-
 util/qemu-config.c                            |   1 +
 38 files changed, 908 insertions(+), 219 deletions(-)
 rename replication.h => include/block/replication.h (98%)
 rename qemu-options.h => include/qemu/qemu-options.h (88%)
 delete mode 100644 qemu-options-wrapper.h
 create mode 100644 stubs/module-opts.c
-- 
2.31.1


