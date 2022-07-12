Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA4FE572239
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jul 2022 20:10:53 +0200 (CEST)
Received: from localhost ([::1]:46862 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBKLP-0000Tp-Bs
	for lists+qemu-devel@lfdr.de; Tue, 12 Jul 2022 14:10:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51112)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1oBKHD-0002oG-QF
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 14:06:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:56936)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1oBKH9-0006QZ-D1
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 14:06:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657649182;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=C4nE9IzHc8NpkP5b9ZCkY6ILVL/c+m3ZBiZ/mAqp40I=;
 b=BLXtJMNBIWDViflf80CtcHMLbF8zdsWSlNJ40G3E+V4DjFCVfQLJBsak0a4EbmHWUgUFrB
 pQfDPUqkuUvuhPVRYlcjGe0A0iFLt/g/2biYfAQAFGnrQFYxE3QcN/qt1pkUVghCYrfMZM
 FAFry12TJweDKxKg9vxJuAgRPLGisTk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-169-N_uAouc7MaOvaFBb0ng38A-1; Tue, 12 Jul 2022 14:06:19 -0400
X-MC-Unique: N_uAouc7MaOvaFBb0ng38A-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 143C7101A58E;
 Tue, 12 Jul 2022 18:06:19 +0000 (UTC)
Received: from localhost (unknown [10.39.193.29])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C01C52026D64;
 Tue, 12 Jul 2022 18:06:18 +0000 (UTC)
From: Hanna Reitz <hreitz@redhat.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org,
	Hanna Reitz <hreitz@redhat.com>
Subject: [PULL 00/35] Block patches
Date: Tue, 12 Jul 2022 20:05:42 +0200
Message-Id: <20220712180617.1362407-1-hreitz@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

The following changes since commit 9548cbeffffd4253e38570d29b8cff0bf77c998f:

  iotests/copy-before-write: specify required_fmts (2022-07-12 13:21:02 +0530)

are available in the Git repository at:

  https://gitlab.com/hreitz/qemu.git tags/pull-block-2022-07-12

for you to fetch changes up to 85c4bf8aa6c93c24876e8870ae7cf8ab2e5a96cf:

  vl: Unlink absolute PID file path (2022-07-12 14:31:15 +0200)

----------------------------------------------------------------
Block patches:
- Refactoring for non-coroutine variants of bdrv/blk_co_* functions:
  Auto-generate more of them with the block coroutine wrapper generator
  script
- iotest fixes
- Both for the storage daemon and the system emulator: Fix PID file
  handling when daemonizing (store the absolute path and delete that on
  exit, which is necessary because daemonizing will change the working
  directory to /)

----------------------------------------------------------------
Alberto Faria (28):
  block: Add a 'flags' param to bdrv_{pread,pwrite,pwrite_sync}()
  block: Change bdrv_{pread,pwrite,pwrite_sync}() param order
  block: Make bdrv_{pread,pwrite}() return 0 on success
  crypto: Make block callbacks return 0 on success
  block: Make bdrv_co_pwrite() take a const buffer
  block: Make 'bytes' param of bdrv_co_{pread,pwrite,preadv,pwritev}()
    an int64_t
  block: Implement bdrv_{pread,pwrite,pwrite_zeroes}() using
    generated_co_wrapper
  block: Add bdrv_co_pwrite_sync()
  block: Use bdrv_co_pwrite_sync() when caller is coroutine_fn
  block/qcow2: Use bdrv_pwrite_sync() in qcow2_mark_dirty()
  block: Make blk_{pread,pwrite}() return 0 on success
  block: Add a 'flags' param to blk_pread()
  block: Change blk_{pread,pwrite}() param order
  block: Make 'bytes' param of blk_{pread,pwrite}() an int64_t
  block: Make blk_co_pwrite() take a const buffer
  block: Implement blk_{pread,pwrite}() using generated_co_wrapper
  block: Add blk_{preadv,pwritev}()
  block: Add blk_[co_]preadv_part()
  block: Export blk_pwritev_part() in block-backend-io.h
  block: Change blk_pwrite_compressed() param order
  block: Add blk_co_pwrite_compressed()
  block: Implement blk_pwrite_zeroes() using generated_co_wrapper
  block: Implement blk_pdiscard() using generated_co_wrapper
  block: Implement blk_flush() using generated_co_wrapper
  block: Add blk_co_ioctl()
  block: Add blk_co_truncate()
  block: Reorganize some declarations in block-backend-io.h
  block: Remove remaining unused symbols in coroutines.h

Hanna Reitz (5):
  qsd: Do not use error_report() before monitor_init
  iotests/297: Have mypy ignore unused ignores
  qsd: Unlink absolute PID file path
  vl: Conditionally register PID file unlink notifier
  vl: Unlink absolute PID file path

John Snow (2):
  tests/qemu-iotests: hotfix for 307, 223 output
  tests/qemu-iotests: skip 108 when FUSE is not loaded

 block/coroutines.h                   |  44 --------
 include/block/block-io.h             |  22 ++--
 include/block/block_int-io.h         |   4 +-
 include/crypto/block.h               |  32 +++---
 include/sysemu/block-backend-io.h    |  97 ++++++++++-------
 block.c                              |  10 +-
 block/blklogwrites.c                 |   6 +-
 block/block-backend.c                | 150 +++++++++++---------------
 block/bochs.c                        |  10 +-
 block/cloop.c                        |  12 +--
 block/commit.c                       |   4 +-
 block/crypto.c                       |  58 +++++-----
 block/dmg.c                          |  36 +++----
 block/export/fuse.c                  |   4 +-
 block/io.c                           |  55 +---------
 block/parallels-ext.c                |   6 +-
 block/parallels.c                    |  14 +--
 block/qcow.c                         |  55 +++++-----
 block/qcow2-bitmap.c                 |  14 +--
 block/qcow2-cache.c                  |   9 +-
 block/qcow2-cluster.c                |  19 ++--
 block/qcow2-refcount.c               |  58 +++++-----
 block/qcow2-snapshot.c               |  53 +++++-----
 block/qcow2.c                        |  84 +++++++--------
 block/qed.c                          |  21 ++--
 block/vdi.c                          |  20 ++--
 block/vhdx-log.c                     |  23 ++--
 block/vhdx.c                         |  56 +++++-----
 block/vmdk.c                         |  80 +++++++-------
 block/vpc.c                          |  35 +++---
 block/vvfat.c                        |  11 +-
 crypto/block-luks.c                  |   8 +-
 crypto/block.c                       |   6 +-
 hw/arm/allwinner-h3.c                |   2 +-
 hw/arm/aspeed.c                      |   2 +-
 hw/block/block.c                     |   2 +-
 hw/block/fdc.c                       |  20 ++--
 hw/block/hd-geometry.c               |   2 +-
 hw/block/m25p80.c                    |   2 +-
 hw/block/nand.c                      |  47 ++++----
 hw/block/onenand.c                   |  32 +++---
 hw/block/pflash_cfi01.c              |   4 +-
 hw/block/pflash_cfi02.c              |   4 +-
 hw/ide/atapi.c                       |   4 +-
 hw/misc/mac_via.c                    |   6 +-
 hw/misc/sifive_u_otp.c               |  14 +--
 hw/nvram/eeprom_at24c.c              |   8 +-
 hw/nvram/spapr_nvram.c               |  16 +--
 hw/nvram/xlnx-bbram.c                |   4 +-
 hw/nvram/xlnx-efuse.c                |   4 +-
 hw/ppc/pnv_pnor.c                    |   6 +-
 hw/sd/sd.c                           |   4 +-
 migration/block.c                    |   8 +-
 nbd/server.c                         |   8 +-
 qemu-img.c                           |  41 +++----
 qemu-io-cmds.c                       |  20 ++--
 softmmu/vl.c                         |  42 ++++++--
 storage-daemon/qemu-storage-daemon.c |  17 ++-
 tests/unit/test-block-iothread.c     | 153 ++++++++++++++++++++++++---
 tests/unit/test-crypto-block.c       |  38 +++----
 block/meson.build                    |   1 +
 tests/qemu-iotests/108               |   5 +
 tests/qemu-iotests/223.out           |   4 +-
 tests/qemu-iotests/307.out           |   4 +-
 tests/qemu-iotests/mypy.ini          |   2 +-
 65 files changed, 856 insertions(+), 786 deletions(-)

-- 
2.35.3


