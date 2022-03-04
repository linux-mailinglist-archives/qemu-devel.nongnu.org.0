Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EEEF4CD982
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Mar 2022 17:54:21 +0100 (CET)
Received: from localhost ([::1]:38388 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQBC6-0005vD-TF
	for lists+qemu-devel@lfdr.de; Fri, 04 Mar 2022 11:54:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51136)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nQB5R-0004M0-Rc
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 11:47:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23909)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nQB5O-0007Fe-S2
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 11:47:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646412442;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=3rXtrFiwiCq4oDBxC1zm+gZKNat6ftDV1kFCOf+aa3Y=;
 b=JjPY1GUQCoIcG9GSJ38BrxLu4mkW60euzx6+fdHgqjADSWeu0AO/rxoeeiFnr86TB80Feg
 R59tb3DJHablATrsPVLr7atNLqfaDSmNXHdF9WsHk4MkNTa1m0m56uGhLMMHu06ubJQV0K
 Nu60vlCV8cCwhAMUlwdV6lOtaUCnmRY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-322-Tf9TWDAGMZyq4jwrZixU8A-1; Fri, 04 Mar 2022 11:47:18 -0500
X-MC-Unique: Tf9TWDAGMZyq4jwrZixU8A-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F1363824FAA;
 Fri,  4 Mar 2022 16:47:16 +0000 (UTC)
Received: from merkur.redhat.com (unknown [10.39.194.38])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C20B585473;
 Fri,  4 Mar 2022 16:47:15 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 00/50] Block layer patches
Date: Fri,  4 Mar 2022 17:46:21 +0100
Message-Id: <20220304164711.474713-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: kwolf@redhat.com, peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 6629bf78aac7e53f83fd0bcbdbe322e2302dfd1f:

  Merge remote-tracking branch 'remotes/pmaydell/tags/pull-target-arm-20220302' into staging (2022-03-03 14:46:48 +0000)

are available in the Git repository at:

  https://gitlab.com/kmwolf/qemu.git tags/for-upstream

for you to fetch changes up to a5df6d1db7db37636c8624bf4a9df9da645853aa:

  block/amend: Keep strong reference to BDS (2022-03-04 17:15:33 +0100)

----------------------------------------------------------------
Block layer patches

- qemu-storage-daemon: Add --daemonize
- Fix x-blockdev-amend and block node activation code which incorrectly
  executed code in the iothread that must run in the main thread.
- Add macros for coroutine-safe TLS variables (required for correctness
  with LTO)
- Fix crashes with concurrent I/O and bdrv_refresh_limits()
- Split block APIs in global state and I/O
- iotests: Don't refuse to run at all without GNU sed, just skip tests
  that need it

----------------------------------------------------------------
Emanuele Giuseppe Esposito (36):
      crypto: perform permission checks under BQL
      crypto: distinguish between main loop and I/O in block_crypto_amend_options_generic_luks
      block: introduce bdrv_activate
      block: rename bdrv_invalidate_cache_all, blk_invalidate_cache and test_sync_op_invalidate_cache
      block: move BQL logic of bdrv_co_invalidate_cache in bdrv_activate
      main-loop.h: introduce qemu_in_main_thread()
      main loop: macros to mark GS and I/O functions
      include/block/block: split header into I/O and global state API
      assertions for block global state API
      IO_CODE and IO_OR_GS_CODE for block I/O API
      block/export/fuse.c: allow writable exports to take RESIZE permission
      include/sysemu/block-backend: split header into I/O and global state (GS) API
      block/block-backend.c: assertions for block-backend
      IO_CODE and IO_OR_GS_CODE for block-backend I/O API
      block.c: assertions to the block layer permissions API
      include/block/block_int: split header into I/O and global state API
      assertions for block_int global state API
      IO_CODE and IO_OR_GS_CODE for block_int I/O API
      block: introduce assert_bdrv_graph_writable
      include/block/blockjob_int.h: split header into I/O and GS API
      GS and IO CODE macros for blockjob_int.h
      block.c: add assertions to static functions
      include/block/blockjob.h: global state API
      assertions for blockjob.h global state API
      include/sysemu/blockdev.h: global state API
      assertions for blockdev.h global state API
      include/block/snapshot: global state API + assertions
      block/copy-before-write.h: global state API + assertions
      block/coroutines: I/O and "I/O or GS" API
      block_int-common.h: split function pointers in BlockDriver
      block_int-common.h: assertions in the callers of BlockDriver function pointers
      block_int-common.h: split function pointers in BdrvChildClass
      block_int-common.h: assertions in the callers of BdrvChildClass function pointers
      block-backend-common.h: split function pointers in BlockDevOps
      job.h: split function pointers in JobDriver
      job.h: assertions in the callers of JobDriver function pointers

Hanna Reitz (9):
      os-posix: Add os_set_daemonize()
      qsd: Add pre-init argument parsing pass
      qsd: Add --daemonize
      iotests/185: Add post-READY quit tests
      block: Make bdrv_refresh_limits() non-recursive
      iotests: Allow using QMP with the QSD
      iotests/graph-changes-while-io: New test
      block/amend: Always call .bdrv_amend_clean()
      block/amend: Keep strong reference to BDS

Stefan Hajnoczi (4):
      tls: add macros for coroutine-safe TLS variables
      util/async: replace __thread with QEMU TLS macros
      rcu: use coroutine TLS macros
      cpus: use coroutine TLS macros for iothread_locked

Thomas Huth (1):
      tests/qemu-iotests: Rework the checks and spots using GNU sed

 docs/tools/qemu-storage-daemon.rst                 |    7 +
 block/copy-before-write.h                          |    7 +
 block/coroutines.h                                 |   81 +-
 include/block/block-common.h                       |  418 ++++++
 include/block/block-global-state.h                 |  253 ++++
 include/block/block-io.h                           |  368 +++++
 include/block/block.h                              |  878 +-----------
 include/block/block_int-common.h                   | 1222 ++++++++++++++++
 include/block/block_int-global-state.h             |  329 +++++
 include/block/block_int-io.h                       |  185 +++
 include/block/block_int.h                          | 1475 +-------------------
 include/block/blockjob.h                           |   29 +-
 include/block/blockjob_int.h                       |   28 +
 include/block/snapshot.h                           |   13 +-
 include/qemu/coroutine-tls.h                       |  165 +++
 include/qemu/job.h                                 |   22 +
 include/qemu/main-loop.h                           |   42 +
 include/qemu/rcu.h                                 |    7 +-
 include/sysemu/block-backend-common.h              |  102 ++
 include/sysemu/block-backend-global-state.h        |  116 ++
 include/sysemu/block-backend-io.h                  |  161 +++
 include/sysemu/block-backend.h                     |  269 +---
 include/sysemu/blockdev.h                          |   13 +-
 include/sysemu/os-posix.h                          |    1 +
 include/sysemu/os-win32.h                          |    8 +
 block.c                                            |  321 ++++-
 block/amend.c                                      |   28 +
 block/backup.c                                     |    1 +
 block/block-backend.c                              |  166 ++-
 block/commit.c                                     |    4 +
 block/copy-before-write.c                          |    2 +
 block/create.c                                     |    2 +
 block/crypto.c                                     |   68 +-
 block/dirty-bitmap.c                               |    5 +
 block/export/export.c                              |    2 +-
 block/export/fuse.c                                |   25 +-
 block/io.c                                         |   75 +-
 block/mirror.c                                     |    4 +
 block/monitor/bitmap-qmp-cmds.c                    |    6 +
 block/nbd.c                                        |    1 +
 block/parallels.c                                  |    2 +-
 block/snapshot.c                                   |   28 +
 block/stream.c                                     |    2 +
 blockdev.c                                         |   29 +
 blockjob.c                                         |   16 +
 hw/block/pflash_cfi01.c                            |    2 +-
 hw/nvram/spapr_nvram.c                             |    2 +-
 job.c                                              |   10 +
 migration/block.c                                  |    2 +-
 migration/migration.c                              |   14 +-
 migration/savevm.c                                 |    8 +-
 monitor/qmp-cmds.c                                 |    2 +-
 os-posix.c                                         |    6 +
 softmmu/cpus.c                                     |   14 +-
 softmmu/qdev-monitor.c                             |    2 +
 storage-daemon/qemu-storage-daemon.c               |   58 +-
 stubs/iothread-lock.c                              |    5 +
 tests/unit/rcutorture.c                            |   10 +-
 tests/unit/test-block-iothread.c                   |    8 +-
 tests/unit/test-rcu-list.c                         |    4 +-
 util/async.c                                       |   12 +-
 util/rcu.c                                         |   10 +-
 tests/qemu-iotests/iotests.py                      |   32 +-
 block/meson.build                                  |    7 +-
 tests/check-block.sh                               |   12 -
 tests/qemu-iotests/185                             |  190 ++-
 tests/qemu-iotests/185.out                         |   48 +
 tests/qemu-iotests/271                             |    2 +-
 tests/qemu-iotests/296                             |    8 +-
 tests/qemu-iotests/296.out                         |   17 +-
 tests/qemu-iotests/common.filter                   |   65 +-
 tests/qemu-iotests/common.rc                       |   45 +-
 tests/qemu-iotests/tests/graph-changes-while-io    |   91 ++
 .../qemu-iotests/tests/graph-changes-while-io.out  |    5 +
 74 files changed, 4854 insertions(+), 2823 deletions(-)
 create mode 100644 include/block/block-common.h
 create mode 100644 include/block/block-global-state.h
 create mode 100644 include/block/block-io.h
 create mode 100644 include/block/block_int-common.h
 create mode 100644 include/block/block_int-global-state.h
 create mode 100644 include/block/block_int-io.h
 create mode 100644 include/qemu/coroutine-tls.h
 create mode 100644 include/sysemu/block-backend-common.h
 create mode 100644 include/sysemu/block-backend-global-state.h
 create mode 100644 include/sysemu/block-backend-io.h
 create mode 100755 tests/qemu-iotests/tests/graph-changes-while-io
 create mode 100644 tests/qemu-iotests/tests/graph-changes-while-io.out


