Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 543DC3A810C
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 15:42:33 +0200 (CEST)
Received: from localhost ([::1]:39460 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lt9Kq-0008Vk-Co
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 09:42:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59170)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lt9HT-0005Xr-44
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 09:39:03 -0400
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535]:37465)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lt9HR-0002dl-4D
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 09:39:02 -0400
Received: by mail-ed1-x535.google.com with SMTP id b11so51176376edy.4
 for <qemu-devel@nongnu.org>; Tue, 15 Jun 2021 06:38:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jST6g/SUpiCQMOLKThRlvLc6dCqzWRdd0Svsg3ZhFfU=;
 b=hJ8GHKzsTDQ9zSz8SBCWqK7pd/2rgOzhVhMvi/l/lylQ3jUKG7GLaND59hipMGDHTo
 Ft2LS9e9eFXFbBX0IpNue7FFIP/TS4YMXYVSdllDP/JHF448GuACnSzMddf8YUAEyOHA
 UJolrpLsNt6HHzdLpsWCpUh9kwmuvg9vqoOc/mLH4DkH9b+YGPEs49OO8o8Lw8vEJSRO
 6cDWhl67YibJVz1NKm8QdyV6tdJC6pQv3UWzGpZfKsNIHAygQ79Jrx/POm6r5KxNQkdw
 fXvdLoLzHSYjGWWqurpdsT5CddfP5FpK9PlVsUTeQl72PWHu7V6u/a5U2OwmfOk0TxzK
 cPSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=jST6g/SUpiCQMOLKThRlvLc6dCqzWRdd0Svsg3ZhFfU=;
 b=LirwCeqPJ+mJziyfHKKpEVZNfxaQzQ1lQdCudgawJdm92QGb/R9eLdJFyO12vFqBsA
 85Oq5hqHtFvJeAlzmBuNYcLljW47OxK5r9mwrQpevPd/uxS8z9O1BNTKUA2Xjri9PLrb
 eNJHsSVk76Mb1GK5V+QbZBslfqooh8EfUwDIP+//u7XIKiHNHTVgDI1ezJ6O9HqTwGMo
 nzFxVsG8ikpL/a32W4DpGUy0m2W5bi6eZl5w6d+kck6xp9f8Q0sQwTv3Zt9Ri5IF5m+w
 X1BECrgzEDjm11nKij51sKQY81MztQdTQ7F8Dqn/3+VJmrDBGrj2wV9xcu2YW1PESMDZ
 5hFg==
X-Gm-Message-State: AOAM530QElADrLgk4pqFs9tX9lVOhzM3SX7uyLfvEKMHiXM1Ouw25HAP
 PBoeN6CFlWKk3Dw17pUx0+8ik31w7BM=
X-Google-Smtp-Source: ABdhPJw88/QmCa8+b6orLnUJixFDBY0VrnIokxtso8O8bSpzRb/fYg+ls33qGw+yG0ojX5toEk88kA==
X-Received: by 2002:aa7:cdc5:: with SMTP id h5mr23083777edw.217.1623764337585; 
 Tue, 15 Jun 2021 06:38:57 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id r17sm11843769edt.33.2021.06.15.06.38.56
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Jun 2021 06:38:56 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 00/33] Misc patches for 2021-06-15
Date: Tue, 15 Jun 2021 15:38:22 +0200
Message-Id: <20210615133855.775687-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x535.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
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

The following changes since commit 894fc4fd670aaf04a67dc7507739f914ff4bacf2:

  Merge remote-tracking branch 'remotes/jasowang/tags/net-pull-request' into staging (2021-06-11 09:21:48 +0100)

are available in the Git repository at:

  https://gitlab.com/bonzini/qemu.git tags/for-upstream

for you to fetch changes up to 429f60abe15cca9046e6aeaffd81e991e34c9bf6:

  configure: map x32 to cpu_family x86_64 for meson (2021-06-14 20:17:55 +0200)

----------------------------------------------------------------
* avoid deprecation warnings for SASL on macOS 10.11 or newer
* fix -readconfig when config blocks have an id (like [chardev "qmp"])
* Error* initialization fixes
* Improvements to ESP emulation (Mark)
* Allow creating noreserve memory backends (David)
* Improvements to query-memdev (David)

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

Zhenzhong Duan (1):
      vl: Fix an assert failure in error path

 backends/hostmem-file.c                            |  11 +-
 backends/hostmem-memfd.c                           |   8 +-
 backends/hostmem-ram.c                             |   7 +-
 backends/hostmem.c                                 |  36 ++++
 configure                                          |   2 +-
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
 include/qemu/mmap-alloc.h                          |  16 +-
 include/qemu/osdep.h                               |  30 ++-
 include/sysemu/hostmem.h                           |   2 +-
 migration/ram.c                                    |   3 +-
 qapi/machine.json                                  |  16 +-
 qapi/qom.json                                      |  10 +
 .../coccinelle/memory-region-housekeeping.cocci    |   8 +-
 softmmu/memory.c                                   |  27 ++-
 softmmu/physmem.c                                  |  68 ++++---
 softmmu/runstate.c                                 |   2 +-
 softmmu/vl.c                                       |   2 +-
 ui/vnc-auth-sasl.c                                 |  20 ++
 ui/vnc-auth-sasl.h                                 |   1 +
 ui/vnc.c                                           |  10 +-
 util/mmap-alloc.c                                  | 212 +++++++++++++++------
 util/oslib-posix.c                                 |   7 +-
 util/oslib-win32.c                                 |  13 +-
 util/qemu-config.c                                 |  17 +-
 34 files changed, 549 insertions(+), 266 deletions(-)
-- 
2.31.1


