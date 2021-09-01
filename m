Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EC3F3FDE77
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Sep 2021 17:19:24 +0200 (CEST)
Received: from localhost ([::1]:40094 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLS1L-0006Cs-Ez
	for lists+qemu-devel@lfdr.de; Wed, 01 Sep 2021 11:19:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49018)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mLRya-0002ks-Gk
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 11:16:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29762)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mLRyV-0002vr-Sc
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 11:16:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630509385;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=iJYolQ1J9SeuKrg4IiTaLjO/SHpAonxD8tWbRflJNpM=;
 b=ZpRt32/IE2QJ8dzPGwjWHrr9jw4tG1YGDSVBbQ2Xy5gkTASJJYr1691Dby35egBqU8Kkge
 V+F/EyolgV1z5XvTiaVhDyHOBal7b6UFb1DmUN+NUdtQ3o5qQGr+Jvcy9YHpNKAn0rkR/g
 fj4iHeFlJKgqm1cJ8LkITlWFwITcnUM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-421-5F4KB3J4OYKMlMgJ89uatw-1; Wed, 01 Sep 2021 11:16:22 -0400
X-MC-Unique: 5F4KB3J4OYKMlMgJ89uatw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BCBF21B2C980;
 Wed,  1 Sep 2021 15:16:21 +0000 (UTC)
Received: from localhost (unknown [10.39.193.250])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 05A4A6060F;
 Wed,  1 Sep 2021 15:16:20 +0000 (UTC)
From: Hanna Reitz <hreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 00/56] Block patches
Date: Wed,  1 Sep 2021 17:15:23 +0200
Message-Id: <20210901151619.689075-1-hreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.392,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Hanna Reitz <hreitz@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit ec397e90d21269037280633b6058d1f280e27667:

  Merge remote-tracking branch 'remotes/alistair/tags/pull-riscv-to-apply-20210901-2' into staging (2021-09-01 08:33:02 +0100)

are available in the Git repository at:

  https://github.com/XanClic/qemu.git tags/pull-block-2021-09-01

for you to fetch changes up to ebd979c74e2b8a7275090475df36dde4ab858320:

  block/file-win32: add reopen handlers (2021-09-01 14:38:08 +0200)


**Note:** I’ve signed the pull request tag with my new GPG key, which I
have uploaded here:

  https://xanclic.moe/A1FA40D098019CDF

Included in that key should be the signature I made with my old key
(F407DB0061D5CF40), and I hope that’s sufficient to establish a
reasonable level of trust.

(I’ve also tried uploading this key to several keyservers, but it
appears to me that keyservers are kind of a thing of the past now,
especially when it comes to uploading keys with signatures on them...)

----------------------------------------------------------------
Block patches:
- Make the backup-top filter driver available for user-created block
  nodes (i.e. via blockdev-add)
- Allow running iotests with gdb or valgrind being attached to qemu
  instances
- Fix the raw format driver's permissions: There is no metadata, so we
  only need WRITE or RESIZE when the parent needs it
- Basic reopen implementation for win32 files (file-win32.c) so that
  qemu-img commit can work
- uclibc/musl build fix for the FUSE export code
- Some iotests delinting
- block-hmp-cmds.c refactoring

----------------------------------------------------------------
Emanuele Giuseppe Esposito (15):
  python: qemu: add timer parameter for qmp.accept socket
  python: qemu: pass the wrapper field from QEMUQtestmachine to
    QEMUMachine
  docs/devel/testing: add debug section to the QEMU iotests chapter
  qemu-iotests: add option to attach gdbserver
  qemu-iotests: delay QMP socket timers
  qemu_iotests: insert gdbserver command line as wrapper for qemu binary
  qemu-iotests: add gdbserver option to script tests too
  docs/devel/testing: add -gdb option to the debugging section of QEMU
    iotests
  qemu-iotests: extend the check script to prepare supporting valgrind
    for python tests
  qemu-iotests: extend QMP socket timeout when using valgrind
  qemu-iotests: allow valgrind to read/delete the generated log file
  qemu-iotests: insert valgrind command line as wrapper for qemu binary
  docs/devel/testing: add -valgrind option to the debug section of QEMU
    iotests
  qemu-iotests: add option to show qemu binary logs on stdout
  docs/devel/testing: add -p option to the debug section of QEMU iotests

Fabrice Fontaine (1):
  block/export/fuse.c: fix fuse-lseek on uclibc or musl

John Snow (3):
  python: Reduce strictness of pylint's duplicate-code check
  iotests: use with-statement for open() calls
  iotests: use subprocess.DEVNULL instead of open("/dev/null")

Mao Zhongyi (1):
  block/monitor: Consolidate hmp_handle_error calls to reduce redundant
    code

Stefan Hajnoczi (1):
  raw-format: drop WRITE and RESIZE child perms when possible

Viktor Prutyanov (1):
  block/file-win32: add reopen handlers

Vladimir Sementsov-Ogievskiy (34):
  block: introduce bdrv_replace_child_bs()
  block: introduce blk_replace_bs
  qdev-properties: PropertyInfo: add realized_set_allowed field
  qdev: allow setting drive property for realized device
  block: rename backup-top to copy-before-write
  block-copy: move detecting fleecing scheme to block-copy
  block/block-copy: introduce block_copy_set_copy_opts()
  block/backup: set copy_range and compress after filter insertion
  block/backup: move cluster size calculation to block-copy
  block/copy-before-write: relax permission requirements when no parents
  block/copy-before-write: drop extra bdrv_unref on failure path
  block/copy-before-write: use file child instead of backing
  block/copy-before-write: bdrv_cbw_append(): replace child at last
  block/copy-before-write: introduce cbw_init()
  block/copy-before-write: cbw_init(): rename variables
  block/copy-before-write: cbw_init(): use file child after attaching
  block/copy-before-write: bdrv_cbw_append(): drop unused compress arg
  block/copy-before-write: cbw_init(): use options
  block/copy-before-write: initialize block-copy bitmap
  block/block-copy: make setting progress optional
  block/copy-before-write: make public block driver
  qapi: publish copy-before-write filter
  python/qemu/machine.py: refactor _qemu_args()
  python/qemu/machine: QEMUMachine: improve qmp() method
  python:QEMUMachine: template typing for self returning methods
  iotests/222: fix pylint and mypy complains
  iotests/222: constantly use single quotes for strings
  iotests: move 222 to tests/image-fleecing
  iotests.py: hmp_qemu_io: support qdev
  iotests/image-fleecing: proper source device
  iotests/image-fleecing: rename tgt_node
  iotests/image-fleecing: prepare for adding new test-case
  iotests/image-fleecing: add test-case for copy-before-write filter
  block/block-copy: block_copy_state_new(): drop extra arguments

 docs/devel/testing.rst                      |  29 +++
 qapi/block-core.json                        |  25 +-
 block/{backup-top.h => copy-before-write.h} |  25 +-
 include/block/block-copy.h                  |   6 +-
 include/block/block.h                       |   2 +
 include/hw/qdev-properties.h                |   1 +
 include/sysemu/block-backend.h              |   1 +
 block.c                                     |  31 +++
 block/backup-top.c                          | 253 -------------------
 block/backup.c                              | 116 ++-------
 block/block-backend.c                       |   8 +
 block/block-copy.c                          | 136 ++++++++---
 block/copy-before-write.c                   | 256 ++++++++++++++++++++
 block/export/fuse.c                         |   3 +
 block/file-win32.c                          | 101 +++++++-
 block/monitor/block-hmp-cmds.c              |  12 +-
 block/raw-format.c                          |  21 +-
 hw/core/qdev-properties-system.c            |  43 +++-
 hw/core/qdev-properties.c                   |   6 +-
 .gitlab-ci.d/buildtest.yml                  |   6 +-
 MAINTAINERS                                 |   4 +-
 block/meson.build                           |   2 +-
 python/qemu/machine/machine.py              |  56 +++--
 python/qemu/machine/qtest.py                |   9 +-
 python/setup.cfg                            |   5 +
 tests/qemu-iotests/222                      | 159 ------------
 tests/qemu-iotests/222.out                  |  67 -----
 tests/qemu-iotests/283                      |  35 ++-
 tests/qemu-iotests/283.out                  |   4 +-
 tests/qemu-iotests/297                      |   2 +-
 tests/qemu-iotests/check                    |  15 +-
 tests/qemu-iotests/common.qemu              |   7 +-
 tests/qemu-iotests/common.rc                |   8 +-
 tests/qemu-iotests/iotests.py               |  75 ++++--
 tests/qemu-iotests/testenv.py               |  23 +-
 tests/qemu-iotests/tests/image-fleecing     | 192 +++++++++++++++
 tests/qemu-iotests/tests/image-fleecing.out | 139 +++++++++++
 37 files changed, 1172 insertions(+), 711 deletions(-)
 rename block/{backup-top.h => copy-before-write.h} (56%)
 delete mode 100644 block/backup-top.c
 create mode 100644 block/copy-before-write.c
 delete mode 100755 tests/qemu-iotests/222
 delete mode 100644 tests/qemu-iotests/222.out
 create mode 100755 tests/qemu-iotests/tests/image-fleecing
 create mode 100644 tests/qemu-iotests/tests/image-fleecing.out

-- 
2.31.1


