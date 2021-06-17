Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 529E03AAFE0
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Jun 2021 11:36:36 +0200 (CEST)
Received: from localhost ([::1]:45642 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltoRv-000248-CP
	for lists+qemu-devel@lfdr.de; Thu, 17 Jun 2021 05:36:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54820)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1ltoN9-0002XZ-Lh
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 05:31:39 -0400
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e]:33461)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1ltoN7-00060K-Do
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 05:31:39 -0400
Received: by mail-ed1-x52e.google.com with SMTP id d7so3135554edx.0
 for <qemu-devel@nongnu.org>; Thu, 17 Jun 2021 02:31:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=NcjDYoL3W80mCDRR6VL1iJbKZtYxw1lZNebyHgcUn2M=;
 b=SMUvQFEPtdaeh8AaKPxMjusM9vOpBQOzo6/j4Y4+OyJUMeTWvCCm4zFNvb2B8JRtxQ
 LBxk0JlwiNFVcQmIB/xLGOaLaGO17jIMKjXfMsqZfgcDOXJQDNDzSXPsNl3H58wLqYsV
 FafVLZ21WFfdPgQes5PWeesYbnvkGev1nFt1SIWVPYOFtbYCNuKuK+QRbMQo5KKPt3vN
 iUbp6yLITia3rf85V3j/M2m5kZTYfFqWBcPVBzoiyxeMmITsOMC8vUFEYN4CAbrizwib
 ysApy/a7xvL3q865vBLJUW40PZbzxyj5AoCWxRZ4EanGItA7SlIW8OebkTX2bzpLThaN
 Vwkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=NcjDYoL3W80mCDRR6VL1iJbKZtYxw1lZNebyHgcUn2M=;
 b=KU2FifrEpP5ywh4EKG7+yy8wvuMfdz27ak3ZVO6q6cp6anzlW4vBjVQBSIP7UKz71B
 0Z5rrLXRr/mBWqDl49d8hIx8vsOWzicqNWL8DlNPCScXEsUp8vCBPWATZVEdWGF5M/Nv
 eclTRCaHhTfe84ucVga4ckdWPZ7ZfoUG/JJFYx/ctOLzUS0VA5K+ra08QTaG3RutJucT
 kv2acBUfe9vg4cf+UzQc0/5oJ9QAqpcPUOsLm5/82d7AK6lU25TMbdEEkaQkPzDxpEQe
 j/uyN1YE2mB3PzgKG+zb1uvVYsVZzUdDhf+OIbvugD0NJq9/p+FUfSLtuRKet5z0gmB+
 mfaA==
X-Gm-Message-State: AOAM532oZVrl3HXN7+L2ezvVDYs5meAXZsw645kdkq3C34c3Y7pSUMY3
 RGEW+XiZWxnmdOByarWo496RvTtbuX8=
X-Google-Smtp-Source: ABdhPJzJdaScNZiMlHDFqz8FmqJ5iK//cSERwd/LUA7hoUqUPkumdVTbyUKsIwegQyiFNj3DxF2lwQ==
X-Received: by 2002:a05:6402:c03:: with SMTP id
 co3mr4348777edb.21.1623922295263; 
 Thu, 17 Jun 2021 02:31:35 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id m18sm3328140ejx.56.2021.06.17.02.31.34
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Jun 2021 02:31:34 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 00/45] Memory, i386, compilation, bugfix changes for 2021-06-17
Date: Thu, 17 Jun 2021 11:30:49 +0200
Message-Id: <20210617093134.900014-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52e.google.com
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

The following changes since commit 1ea06abceec61b6f3ab33dadb0510b6e09fb61e2:

  Merge remote-tracking branch 'remotes/berrange-gitlab/tags/misc-fixes-pull-request' into staging (2021-06-14 15:59:13 +0100)

are available in the Git repository at:

  https://gitlab.com/bonzini/qemu.git tags/for-upstream

for you to fetch changes up to f51f8e3591393f7f274e1435ac22188e2dafdfe8:

  configure: Remove probe for _Static_assert (2021-06-16 15:03:26 +0200)

----------------------------------------------------------------
* avoid deprecation warnings for SASL on macOS 10.11 or newer
* fix -readconfig when config blocks have an id (like [chardev "qmp"])
* Error* initialization fixes
* Improvements to ESP emulation (Mark)
* Allow creating noreserve memory backends (David)
* Improvements to query-memdev (David)
* Bump compiler to C11 (Richard)
* First round of SVM fixes from GSoC project (Lara)

----------------------------------------------------------------
David Hildenbrand (18):
      softmmu/physmem: Mark shared anonymous memory RAM_SHARED
      softmmu/physmem: Fix ram_block_discard_range() to handle shared anonymous memory
      softmmu/physmem: Fix qemu_ram_remap() to handle shared anonymous memory
      util/mmap-alloc: Factor out calculation of the pagesize for the guard page
      util/mmap-alloc: Factor out reserving of a memory region to mmap_reserve()
      util/mmap-alloc: Factor out activating of memory to mmap_activate()
      softmmu/memory: Pass ram_flags to qemu_ram_alloc_from_fd()
      softmmu/memory: Pass ram_flags to memory_region_init_ram_shared_nomigrate()
      softmmu/memory: Pass ram_flags to qemu_ram_alloc() and qemu_ram_alloc_internal()
      util/mmap-alloc: Pass flags instead of separate bools to qemu_ram_mmap()
      memory: Introduce RAM_NORESERVE and wire it up in qemu_ram_mmap()
      util/mmap-alloc: Support RAM_NORESERVE via MAP_NORESERVE under Linux
      hostmem: Wire up RAM_NORESERVE via "reserve" property
      qmp: Clarify memory backend properties returned via query-memdev
      qmp: Include "share" property of memory backends
      hmp: Print "share" property of memory backends with "info memdev"
      qmp: Include "reserve" property of memory backends
      hmp: Print "reserve" property of memory backends with "info memdev"

David Michael (1):
      configure: map x32 to cpu_family x86_64 for meson

Lara Lazier (4):
      target/i386: Refactored intercept checks into cpu_svm_has_intercept
      target/i386: Added consistency checks for VMRUN intercept and ASID
      target/i386: Added consistency checks for CR0
      target/i386: Added Intercept CR0 writes check

Mark Cave-Ayland (8):
      esp: only assert INTR_DC interrupt flag if selection fails
      esp: only set ESP_RSEQ at the start of the select sequence
      esp: allow non-DMA callback in esp_transfer_data() initial transfer
      esp: handle non-DMA transfers from the target one byte at a time
      esp: ensure PDMA write transfers are flushed from the FIFO to the target immediately
      esp: revert 75ef849696 "esp: correctly fill bus id with requested lun"
      esp: correctly accumulate extended messages for PDMA
      esp: fix migration version check in esp_is_version_5()

Maxim Levitsky (1):
      block/scsi: correctly emulate the VPD block limits page

Paolo Bonzini (3):
      vnc: avoid deprecation warnings for SASL on OS X
      qemu-config: use qemu_opts_from_qdict
      esp: store lun coming from the MESSAGE OUT phase

Peng Liang (1):
      runstate: Initialize Error * to NULL

Richard Henderson (8):
      configure: Use -std=gnu11
      softfloat: Use _Generic instead of QEMU_GENERIC
      util: Use real functions for thread-posix QemuRecMutex
      util: Pass file+line to qemu_rec_mutex_unlock_impl
      util: Use unique type for QemuRecMutex in thread-posix.h
      include/qemu/lockable: Use _Generic instead of QEMU_GENERIC
      qemu/compiler: Remove QEMU_GENERIC
      configure: Remove probe for _Static_assert

Zhenzhong Duan (1):
      vl: Fix an assert failure in error path

 backends/hostmem-file.c                            |  11 +-
 backends/hostmem-memfd.c                           |   8 +-
 backends/hostmem-ram.c                             |   7 +-
 backends/hostmem.c                                 |  36 ++++
 configure                                          |  24 +--
 fpu/softfloat.c                                    |  16 +-
 hw/core/machine-hmp-cmds.c                         |   6 +
 hw/core/machine-qmp-cmds.c                         |   8 +
 hw/m68k/next-cube.c                                |   4 +-
 hw/misc/ivshmem.c                                  |   5 +-
 hw/scsi/esp.c                                      | 199 ++++++++++++-------
 hw/scsi/scsi-generic.c                             |   9 +-
 hw/scsi/trace-events                               |   3 +-
 include/exec/cpu-common.h                          |   1 +
 include/exec/memory.h                              |  42 ++--
 include/exec/ram_addr.h                            |   9 +-
 include/hw/scsi/esp.h                              |   1 +
 include/qemu/compiler.h                            |  51 -----
 include/qemu/lockable.h                            |  90 ++++-----
 include/qemu/mmap-alloc.h                          |  16 +-
 include/qemu/osdep.h                               |  34 +++-
 include/qemu/thread-posix.h                        |  14 +-
 include/qemu/thread-win32.h                        |   6 -
 include/qemu/thread.h                              |  15 +-
 include/sysemu/hostmem.h                           |   2 +-
 meson.build                                        |   2 +-
 migration/ram.c                                    |   3 +-
 qapi/machine.json                                  |  16 +-
 qapi/qom.json                                      |  10 +
 .../coccinelle/memory-region-housekeeping.cocci    |   8 +-
 softmmu/memory.c                                   |  27 ++-
 softmmu/physmem.c                                  |  68 ++++---
 softmmu/runstate.c                                 |   2 +-
 softmmu/vl.c                                       |   2 +-
 target/i386/cpu.h                                  |   6 +
 target/i386/svm.h                                  |   2 +
 target/i386/tcg/sysemu/misc_helper.c               |   9 +
 target/i386/tcg/sysemu/svm_helper.c                | 155 ++++++++-------
 ui/vnc-auth-sasl.c                                 |  20 ++
 ui/vnc-auth-sasl.h                                 |   1 +
 ui/vnc.c                                           |  10 +-
 util/mmap-alloc.c                                  | 212 +++++++++++++++------
 util/oslib-posix.c                                 |   7 +-
 util/oslib-win32.c                                 |  13 +-
 util/qemu-config.c                                 |  17 +-
 util/qemu-thread-posix.c                           |  24 ++-
 util/qemu-thread-win32.c                           |   2 +-
 47 files changed, 757 insertions(+), 476 deletions(-)
-- 
2.31.1


