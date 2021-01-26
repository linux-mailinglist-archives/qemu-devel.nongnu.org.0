Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C5C43304033
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jan 2021 15:25:33 +0100 (CET)
Received: from localhost ([::1]:43004 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4PHg-0004ge-Ra
	for lists+qemu-devel@lfdr.de; Tue, 26 Jan 2021 09:25:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46100)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1l4PCm-0007Wn-IX
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 09:20:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20092)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1l4PCi-0005nT-9F
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 09:20:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611670823;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=PKHq15FqKxiNMwMV8oCy6Ka0+PjG1i4kpfDn76+6IR0=;
 b=Cf5wZ61IWRoP7uwu3pAXirgqQEufkrRGKrfH4XAku/Y63oRZBznCIo8Ctjrgi60DR+fAIx
 7si0t+/p7AYGpUtEPki86DZqk8j3hw0YMuyegMfq2WrsA6kNpkvz0rX0lnk+ViXs8Hyeqf
 kAG22ra0/fRtEK3yKy04CZwc+JqOoPg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-555-mx_DlIKyN06qS8eN7_Ti6w-1; Tue, 26 Jan 2021 09:20:19 -0500
X-MC-Unique: mx_DlIKyN06qS8eN7_Ti6w-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 74073800491;
 Tue, 26 Jan 2021 14:20:18 +0000 (UTC)
Received: from localhost (ovpn-114-175.ams2.redhat.com [10.36.114.175])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0F89770939;
 Tue, 26 Jan 2021 14:20:17 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 00/53] Block patches
Date: Tue, 26 Jan 2021 15:19:23 +0100
Message-Id: <20210126142016.806073-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.255,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 31ee895047bdcf7387e3570cbd2a473c6f744b08:

  Merge remote-tracking branch 'remotes/jasowang/tags/net-pull-request' into staging (2021-01-25 15:56:13 +0000)

are available in the Git repository at:

  https://github.com/XanClic/qemu.git tags/pull-block-2021-01-26

for you to fetch changes up to bb24cdc5efee580e81f71c5ff0fd980f2cc179d0:

  iotests/178: Pass value to invalid option (2021-01-26 14:36:37 +0100)

----------------------------------------------------------------
Block patches:
- Make backup block jobs use asynchronous requests with the block-copy
  module
- Use COR filter node for stream block jobs
- Make coroutine-sigaltstack’s qemu_coroutine_new() function thread-safe
- Report error string when file locking fails with an unexpected errno
- iotest fixes, additions, and some refactoring

----------------------------------------------------------------
Alberto Garcia (1):
  iotests: Add test for the regression fixed in c8bf9a9169

Andrey Shinkevich (10):
  copy-on-read: support preadv/pwritev_part functions
  block: add API function to insert a node
  copy-on-read: add filter drop function
  qapi: add filter-node-name to block-stream
  qapi: copy-on-read filter: add 'bottom' option
  iotests: add #310 to test bottom node in COR driver
  block: include supported_read_flags into BDS structure
  copy-on-read: skip non-guest reads if no copy needed
  stream: rework backing-file changing
  block: apply COR-filter to block-stream jobs

David Edmondson (1):
  block: report errno when flock fcntl fails

Max Reitz (14):
  iotests.py: Assume a couple of variables as given
  iotests/297: Rewrite in Python and extend reach
  iotests: Move try_remove to iotests.py
  iotests/129: Remove test images in tearDown()
  iotests/129: Do not check @busy
  iotests/129: Use throttle node
  iotests/129: Actually test a commit job
  iotests/129: Limit mirror job's buffer size
  iotests/129: Clean up pylint and mypy complaints
  iotests/300: Clean up pylint and mypy complaints
  coroutine-sigaltstack: Add SIGUSR2 mutex
  iotests/129: Limit backup's max-chunk/max-workers
  iotests/118: Drop 'change' test
  iotests/178: Pass value to invalid option

Vladimir Sementsov-Ogievskiy (27):
  iotests: fix _check_o_direct
  qapi: block-stream: add "bottom" argument
  iotests: 30: prepare to COR filter insertion by stream job
  block/stream: add s->target_bs
  qapi: backup: add perf.use-copy-range parameter
  block/block-copy: More explicit call_state
  block/block-copy: implement block_copy_async
  block/block-copy: add max_chunk and max_workers parameters
  block/block-copy: add list of all call-states
  block/block-copy: add ratelimit to block-copy
  block/block-copy: add block_copy_cancel
  blockjob: add set_speed to BlockJobDriver
  job: call job_enter from job_pause
  qapi: backup: add max-chunk and max-workers to x-perf struct
  iotests: 56: prepare for backup over block-copy
  iotests: 185: prepare for backup over block-copy
  iotests: 219: prepare for backup over block-copy
  iotests: 257: prepare for backup over block-copy
  block/block-copy: make progress_bytes_callback optional
  block/backup: drop extra gotos from backup_run()
  backup: move to block-copy
  qapi: backup: disable copy_range by default
  block/block-copy: drop unused block_copy_set_progress_callback()
  block/block-copy: drop unused argument of block_copy()
  simplebench/bench_block_job: use correct shebang line with python3
  simplebench: bench_block_job: add cmd_options argument
  simplebench: add bench-backup.py

 qapi/block-core.json                   |  66 +++++-
 block/backup-top.h                     |   1 +
 block/copy-on-read.h                   |  32 +++
 include/block/block-copy.h             |  61 ++++-
 include/block/block.h                  |  10 +-
 include/block/block_int.h              |  15 +-
 include/block/blockjob_int.h           |   2 +
 block.c                                |  25 ++
 block/backup-top.c                     |   6 +-
 block/backup.c                         | 233 ++++++++++++-------
 block/block-copy.c                     | 227 +++++++++++++++---
 block/copy-on-read.c                   | 184 ++++++++++++++-
 block/file-posix.c                     |  38 ++-
 block/io.c                             |  10 +-
 block/monitor/block-hmp-cmds.c         |   7 +-
 block/replication.c                    |   2 +
 block/stream.c                         | 185 +++++++++------
 blockdev.c                             |  83 +++++--
 blockjob.c                             |   6 +
 job.c                                  |   3 +
 util/coroutine-sigaltstack.c           |   9 +
 scripts/simplebench/bench-backup.py    | 167 ++++++++++++++
 scripts/simplebench/bench-example.py   |   2 +-
 scripts/simplebench/bench_block_job.py |  13 +-
 tests/qemu-iotests/030                 |  12 +-
 tests/qemu-iotests/056                 |   9 +-
 tests/qemu-iotests/109.out             |  24 ++
 tests/qemu-iotests/118                 |  20 +-
 tests/qemu-iotests/118.out             |   4 +-
 tests/qemu-iotests/124                 |   8 +-
 tests/qemu-iotests/129                 |  79 ++++---
 tests/qemu-iotests/141.out             |   2 +-
 tests/qemu-iotests/178                 |   2 +-
 tests/qemu-iotests/178.out.qcow2       |   2 +-
 tests/qemu-iotests/178.out.raw         |   2 +-
 tests/qemu-iotests/185                 |   3 +-
 tests/qemu-iotests/185.out             |   3 +-
 tests/qemu-iotests/219                 |  13 +-
 tests/qemu-iotests/245                 |  20 +-
 tests/qemu-iotests/257                 |   1 +
 tests/qemu-iotests/257.out             | 306 ++++++++++++-------------
 tests/qemu-iotests/297                 | 112 +++++++--
 tests/qemu-iotests/297.out             |   5 +-
 tests/qemu-iotests/300                 |  19 +-
 tests/qemu-iotests/310                 | 117 ++++++++++
 tests/qemu-iotests/310.out             |  15 ++
 tests/qemu-iotests/313                 | 104 +++++++++
 tests/qemu-iotests/313.out             |  29 +++
 tests/qemu-iotests/common.rc           |   7 +-
 tests/qemu-iotests/group               |   2 +
 tests/qemu-iotests/iotests.py          |  37 +--
 51 files changed, 1797 insertions(+), 547 deletions(-)
 create mode 100644 block/copy-on-read.h
 create mode 100755 scripts/simplebench/bench-backup.py
 create mode 100755 tests/qemu-iotests/310
 create mode 100644 tests/qemu-iotests/310.out
 create mode 100755 tests/qemu-iotests/313
 create mode 100644 tests/qemu-iotests/313.out

-- 
2.29.2


