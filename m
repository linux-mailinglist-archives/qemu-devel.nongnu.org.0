Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0531F391D4F
	for <lists+qemu-devel@lfdr.de>; Wed, 26 May 2021 18:51:07 +0200 (CEST)
Received: from localhost ([::1]:40006 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llwkL-0004PV-W5
	for lists+qemu-devel@lfdr.de; Wed, 26 May 2021 12:51:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38282)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1llwVh-0005Dc-1s
 for qemu-devel@nongnu.org; Wed, 26 May 2021 12:35:57 -0400
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b]:37634)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1llwVf-000063-8G
 for qemu-devel@nongnu.org; Wed, 26 May 2021 12:35:56 -0400
Received: by mail-ed1-x52b.google.com with SMTP id g7so2307418edm.4
 for <qemu-devel@nongnu.org>; Wed, 26 May 2021 09:35:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=H2OMTfD9ZMC0aIJY9ue0nRxH/2tpQamsYEymkh9t1LM=;
 b=X/FwojVufJoAnMGFi3Obk0FpyN/FVU3hKn2fWAsmRljN4jJNVvkWvR3QzqmIM4HyLk
 KnA0YOxtp0KHdd6Yu3KHTPKvtCUP+8/2h1Xmj/5Y6DY/Q472u9n1+yVs0/z11SfkHiKs
 REwJ2HoikEIG2T8C4O2gLPEx31WDN2jIgTln4mnkoC2wI1Z0k4LJnuW7QfbcKHPl6bqL
 ei40fg2nvG56r6zOVJakq8tqYdVSH/oqGagcdaRnqy3BrJbiWpC0GTOuD42g501gOebm
 arXEGyuEjPBXRfJMbNoZ9oq/NBm6PHhIBErNzLF76rqBSCieA0cHM0O4yXqKv03G0kdT
 BbCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=H2OMTfD9ZMC0aIJY9ue0nRxH/2tpQamsYEymkh9t1LM=;
 b=td5pViu4I5Ih5cZm+sEiEbhtLB6bpcDHsKpuBeqcmskHYsxJNH/AAR9Pg8/9g068qG
 qFzvW1G11P6ep/8oU4EhjSIzP84U32WS8m75uLL0082gwyUbhvGGx+bBsWQJ5iIgbE2S
 Q0ljb+3oznyHQGnhu9PuuYWM7gn7Wu3qIa/UzztJPAt/1Luis6U48Jzz/Qvg4eEoaUzk
 7ydq6fSBAw3O+Rohwo1/y8AHYT3uXk1f2LcHIXmVZJwNgs8Q1/7COh5Azef9gqlrzeL3
 wYnvZ034Sa8fDJlaS0/hpa5IW7ZIWC9uo+lejODa5YjqHUBkFQyeOZl0DP1foW3O+U7N
 xnhw==
X-Gm-Message-State: AOAM532LDA41XdfSpDn7x9nmiSvnv41Gmwv/hbvuHB5LA/XHq5nkkaBx
 QJoQiJhEEVrNrTHsBs7Px3Wl2yUTGW+0Eg==
X-Google-Smtp-Source: ABdhPJyu5MLd1nA2KMsO19VPgHcXTZvk7Murnbr4Qr2Ff4yVMK9csmeA04u3m3Zh2XXrP735uUo/+w==
X-Received: by 2002:aa7:da99:: with SMTP id q25mr39565059eds.198.1622046952838; 
 Wed, 26 May 2021 09:35:52 -0700 (PDT)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 a8sm1342001ejt.102.2021.05.26.09.35.51 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 May 2021 09:35:51 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 00/28] Misc patches for 2021-05-24
Date: Wed, 26 May 2021 18:35:49 +0200
Message-Id: <20210526163550.501367-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52b.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
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

The following changes since commit 92f8c6fef13b31ba222c4d20ad8afd2b79c4c28e:

  Merge remote-tracking branch 'remotes/pmaydell/tags/pull-target-arm-20210525' into staging (2021-05-25 16:17:06 +0100)

are available in the Git repository at:

  https://gitlab.com/bonzini/qemu.git tags/for-upstream

for you to fetch changes up to 7cf333a37260c4aafa465453adc8e073e408967e:

  gitlab-ci: use --meson=git for CFI jobs (2021-05-26 14:50:05 +0200)

----------------------------------------------------------------
* submodule cleanups (Philippe, myself)
* tiny step towards a usable preconfig mode (myself)
* Kconfig and LOCK_GUARD cleanups (philippe)
* new x86 CPUID feature (Yang Zhong)
* "-object qtest" support (myself)
* Dirty ring support for KVM (Peter)
* Fixes for 6.0 command line parsing breakage (myself)
* Fix for macOS 11.3 SDK (Katsuhiro)

----------------------------------------------------------------
Ali Shirvani (1):
      doc: Add notes about -mon option mode=control argument.

Katsuhiro Ueno (1):
      meson: Set implicit_include_directories to false

Kit Westneat (1):
      hw/scsi: Fix sector translation bug in scsi_unmap_complete_noio

Paolo Bonzini (10):
      configure: check for submodules if --with-git-submodules=ignore
      configure: simplify assignment to GIT_SUBMODULES
      object: add more commands to preconfig mode
      qtest: add a QOM object for qtest
      KVM: do not allow setting properties at runtime
      remove qemu-options* from root directory
      replication: move include out of root directory
      vl: allow not specifying size in -m when using -M memory-backend
      qemu-config: load modules when instantiating option groups
      gitlab-ci: use --meson=git for CFI jobs

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

Thomas Huth (1):
      configure: Avoid error messages about missing *-config-*.h files

Yang Zhong (1):
      i386/cpu: Expose AVX_VNNI instruction to guest

 .gitlab-ci.yml                                |   4 +-
 Makefile                                      |   2 +
 accel/kvm/kvm-all.c                           | 615 ++++++++++++++++++++++----
 accel/kvm/trace-events                        |   7 +
 block/replication.c                           |   2 +-
 configure                                     |  79 ++--
 default-configs/devices/ppc64-softmmu.mak     |   1 -
 hmp-commands.hx                               |   2 +
 hw/arm/Kconfig                                |   1 +
 hw/i386/Kconfig                               |   1 +
 hw/mem/Kconfig                                |   2 -
 hw/ppc/Kconfig                                |   1 +
 hw/scsi/scsi-disk.c                           |  12 +-
 replication.h => include/block/replication.h  |   4 +-
 include/exec/memory.h                         |  12 +
 include/hw/core/cpu.h                         |   7 +
 include/qemu/config-file.h                    |   2 +-
 qemu-options.h => include/qemu/qemu-options.h |   9 +-
 include/sysemu/kvm_int.h                      |   7 +-
 meson.build                                   |   1 +
 migration/colo.c                              |   2 +-
 os-posix.c                                    |   2 +-
 os-win32.c                                    |   1 -
 qapi/qom.json                                 |  23 +-
 qemu-options-wrapper.h                        |  40 --
 qemu-options.hx                               |  23 +-
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
 37 files changed, 924 insertions(+), 227 deletions(-)
 rename replication.h => include/block/replication.h (98%)
 rename qemu-options.h => include/qemu/qemu-options.h (88%)
 delete mode 100644 qemu-options-wrapper.h
 create mode 100644 stubs/module-opts.c
-- 
2.31.1


