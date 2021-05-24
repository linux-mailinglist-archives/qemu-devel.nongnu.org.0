Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5533038F1D2
	for <lists+qemu-devel@lfdr.de>; Mon, 24 May 2021 18:53:52 +0200 (CEST)
Received: from localhost ([::1]:51826 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llDpv-0004N9-CP
	for lists+qemu-devel@lfdr.de; Mon, 24 May 2021 12:53:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45020)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1llDeI-0004gi-PU
 for qemu-devel@nongnu.org; Mon, 24 May 2021 12:41:50 -0400
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534]:37686)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1llDe2-0004Kt-7M
 for qemu-devel@nongnu.org; Mon, 24 May 2021 12:41:40 -0400
Received: by mail-ed1-x534.google.com with SMTP id g7so20567797edm.4
 for <qemu-devel@nongnu.org>; Mon, 24 May 2021 09:41:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yGoIzXYIX9m4RsP0fZOD66ClwKN/HxFed9M81Yci264=;
 b=l/I6TwqRh6FJnHlX+BSUGiyBjUmZhfGZW246xLD+GGbwZYuXkqwVo1kZVJFzWy0ELo
 DJwKYh2jCc3P47gMLvG4dwD3BpFLeYMVQF3j8YqUQLtnQvP6NKTlaOwwQ9ep5PnkEd4I
 QLsE3phUGLkwtkKdR3z2eO6tmiw5q/QbV1JkGMu3FRO2vvrbqchRexIbMfqN3ALulg6k
 TwxrzTMzgnFhhsilpfd10S9KQkEjA7AmPSKydntBI9+rlkCLclBoPfyBo7PgY7MpjFhY
 wT8jEPJExf/6JSg/6lEaXXgal8oPzkGzCyG7KW9BCAZfGKcYdmtx3aTPGB+aElrDFaOz
 wT7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=yGoIzXYIX9m4RsP0fZOD66ClwKN/HxFed9M81Yci264=;
 b=NKSFKV4AhhaBX9YecSSlrFqhhdadAaUaFWgn3FYLa+IdXYpLLm6D+QaSpuwXJ+OFwc
 qC54uh3GOc0uZqNSwGNxPCHt9GXuBSZ1RlKnsKHvzgsw0NR592hHuElspwXUGfKLcr60
 TQlrL6PUYBEQH7sN71Uj39Cg7OAmF8apKJaD7I0JTNoN3Vduf9DkyXbqsZODW7+2yRBz
 Pz2zmnEM+j7OiFOn0I/jIni8WrycChas5rVrjMPfbDRC8uH+faEm6nOsaS7ZV+NHApxI
 0fAYGUC8oEMwEMs+w55g4AE1KC0NXjVDewVthFD+ZJx43kRfp2CKmzRvfUTyV+a6bFAT
 XmZQ==
X-Gm-Message-State: AOAM530LWUUy/MrxCGG+sptBeXGYeNj36rOOX7qZuZ5s4kolycg20IZH
 53kJTeFsvQ6qpyoUYUlaPC/Zm3188BIG5w==
X-Google-Smtp-Source: ABdhPJw2dG8dzZYjvXXDEzgoSFIGrd70GFzZ5N+FHwBfS6X9OCakO9CB6Ax0JrCI/0OHqkVwT72ulQ==
X-Received: by 2002:a05:6402:c8:: with SMTP id
 i8mr8125875edu.380.1621874492243; 
 Mon, 24 May 2021 09:41:32 -0700 (PDT)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 g4sm9581922edm.83.2021.05.24.09.41.31 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 May 2021 09:41:31 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 00/28] Misc patches for 2021-05-24
Date: Mon, 24 May 2021 18:41:03 +0200
Message-Id: <20210524164131.383778-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x534.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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

The following changes since commit 371ebfe28600fc5a435504b841cd401208a68f07:

  Merge remote-tracking branch 'remotes/xtensa/tags/20210521-xtensa' into staging (2021-05-24 12:00:33 +0100)

are available in the Git repository at:

  https://gitlab.com/bonzini/qemu.git tags/for-upstream

for you to fetch changes up to b304cc9bc94950a4b9100634db6dc3c885f99216:

  gitlab-ci: use --meson=git for CFI jobs (2021-05-24 18:39:02 +0200)

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
Ali Shirvani via (1):
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


