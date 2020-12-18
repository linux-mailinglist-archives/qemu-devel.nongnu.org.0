Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EEDA82DE64B
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Dec 2020 16:15:43 +0100 (CET)
Received: from localhost ([::1]:40990 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kqHTq-0003Dx-IG
	for lists+qemu-devel@lfdr.de; Fri, 18 Dec 2020 10:15:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53538)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1kqHRG-0001Lb-9y
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 10:13:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23222)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1kqHRB-0005DX-KB
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 10:13:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608304376;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=M3ojrGybTY+e8AnNBn0ia7nrr8Z1mmxSdOQLIvL7pUQ=;
 b=bDa6Mpdqz/rWxdDqT/09AfGZyZq7d/cq/wMyWuSd7q3VSp03TZhhawkh+SK0iIpiyZ0abK
 fqPLtCr7KAvHMl48NCaYWR03BapFUBafjcfE7SeEtJNM7djw8y/ySgjxMWS98DrjzfCQJJ
 944ZcgmIFoGgTd+YUoGsDR6K4thgs0U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-179-q90FYya1Oj24ygmylFMQ-Q-1; Fri, 18 Dec 2020 10:12:52 -0500
X-MC-Unique: q90FYya1Oj24ygmylFMQ-Q-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2682E190B2A1;
 Fri, 18 Dec 2020 15:12:51 +0000 (UTC)
Received: from localhost (ovpn-114-84.ams2.redhat.com [10.36.114.84])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BB25C5C1C5;
 Fri, 18 Dec 2020 15:12:50 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 00/30] Block patches
Date: Fri, 18 Dec 2020 16:12:19 +0100
Message-Id: <20201218151249.715731-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

The following changes since commit 75ee62ac606bfc9eb59310b9446df3434bf6e8c2:

  Merge remote-tracking branch 'remotes/ehabkost-gl/tags/x86-next-pull-request' into staging (2020-12-17 18:53:36 +0000)

are available in the Git repository at:

  https://github.com/XanClic/qemu.git tags/pull-block-2020-12-18

for you to fetch changes up to 0e72078128229bf9efb542e396ab44bf91b91340:

  iotests: Fix _send_qemu_cmd with bash 5.1 (2020-12-18 12:47:38 +0100)

----------------------------------------------------------------
Block patches:
- New block filter: preallocate (which, on writes beyond an image file's
  end, allocates big chunks of data so that such post-EOF writes will
  occur less frequently)
- write-zeroes and block-status support for Quorum
- Implementation of truncate for the nvme block driver similarly to the
  existing implementations for host block devices and iscsi devices
- Block layer refactoring: Drop the tighten_restrictions concept in the
  block permission functions
- iotest fixes

----------------------------------------------------------------
Alberto Garcia (2):
  quorum: Implement bdrv_co_block_status()
  quorum: Implement bdrv_co_pwrite_zeroes()

Max Reitz (2):
  iotests/102: Pass $QEMU_HANDLE to _send_qemu_cmd
  iotests: Fix _send_qemu_cmd with bash 5.1

Philippe Mathieu-Daudé (1):
  block/nvme: Implement fake truncate() coroutine

Vladimir Sementsov-Ogievskiy (25):
  block: add bdrv_refresh_perms() helper
  block: bdrv_set_perm() drop redundant parameters.
  block: bdrv_child_set_perm() drop redundant parameters.
  block: drop tighten_restrictions
  block: simplify comment to BDRV_REQ_SERIALISING
  block/io.c: drop assertion on double waiting for request serialisation
  block/io: split out bdrv_find_conflicting_request
  block/io: bdrv_wait_serialising_requests_locked: drop extra bs arg
  block: bdrv_mark_request_serialising: split non-waiting function
  block: introduce BDRV_REQ_NO_WAIT flag
  block: bdrv_check_perm(): process children anyway
  block: introduce preallocate filter
  qemu-io: add preallocate mode parameter for truncate command
  iotests: qemu_io_silent: support --image-opts
  iotests.py: execute_setup_common(): add required_fmts argument
  iotests: add 298 to test new preallocate filter driver
  scripts/simplebench: fix grammar: s/successed/succeeded/
  scripts/simplebench: support iops
  scripts/simplebench: use standard deviation for +- error
  simplebench: rename ascii() to results_to_text()
  simplebench: move results_to_text() into separate file
  simplebench/results_to_text: improve view of the table
  simplebench/results_to_text: add difference line to the table
  simplebench/results_to_text: make executable
  scripts/simplebench: add bench_prealloc.py

 docs/system/qemu-block-drivers.rst.inc |  26 ++
 qapi/block-core.json                   |  20 +-
 include/block/block.h                  |  20 +-
 include/block/block_int.h              |   3 +-
 block.c                                | 185 +++-----
 block/file-posix.c                     |   2 +-
 block/io.c                             | 130 +++---
 block/nvme.c                           |  24 ++
 block/preallocate.c                    | 559 +++++++++++++++++++++++++
 block/quorum.c                         |  88 +++-
 qemu-io-cmds.c                         |  46 +-
 block/meson.build                      |   1 +
 scripts/simplebench/bench-example.py   |   3 +-
 scripts/simplebench/bench_prealloc.py  | 132 ++++++
 scripts/simplebench/bench_write_req.py |   3 +-
 scripts/simplebench/results_to_text.py | 126 ++++++
 scripts/simplebench/simplebench.py     |  66 ++-
 tests/qemu-iotests/085.out             | 167 ++++++--
 tests/qemu-iotests/094.out             |  10 +-
 tests/qemu-iotests/095.out             |   4 +-
 tests/qemu-iotests/102                 |   2 +-
 tests/qemu-iotests/102.out             |   2 +-
 tests/qemu-iotests/109.out             |  88 +++-
 tests/qemu-iotests/117.out             |  13 +-
 tests/qemu-iotests/127.out             |  12 +-
 tests/qemu-iotests/140.out             |  10 +-
 tests/qemu-iotests/141.out             | 128 ++++--
 tests/qemu-iotests/143.out             |   4 +-
 tests/qemu-iotests/144.out             |  28 +-
 tests/qemu-iotests/153.out             |  18 +-
 tests/qemu-iotests/156.out             |  39 +-
 tests/qemu-iotests/161.out             |  18 +-
 tests/qemu-iotests/173.out             |  25 +-
 tests/qemu-iotests/182.out             |  42 +-
 tests/qemu-iotests/183.out             |  19 +-
 tests/qemu-iotests/185.out             |  45 +-
 tests/qemu-iotests/191.out             |  12 +-
 tests/qemu-iotests/223.out             |  92 ++--
 tests/qemu-iotests/229.out             |  13 +-
 tests/qemu-iotests/249.out             |  16 +-
 tests/qemu-iotests/298                 | 186 ++++++++
 tests/qemu-iotests/298.out             |   5 +
 tests/qemu-iotests/308.out             | 103 ++++-
 tests/qemu-iotests/312                 | 159 +++++++
 tests/qemu-iotests/312.out             |  81 ++++
 tests/qemu-iotests/common.qemu         |  11 +-
 tests/qemu-iotests/group               |   2 +
 tests/qemu-iotests/iotests.py          |  16 +-
 48 files changed, 2357 insertions(+), 447 deletions(-)
 create mode 100644 block/preallocate.c
 create mode 100755 scripts/simplebench/bench_prealloc.py
 create mode 100755 scripts/simplebench/results_to_text.py
 create mode 100644 tests/qemu-iotests/298
 create mode 100644 tests/qemu-iotests/298.out
 create mode 100755 tests/qemu-iotests/312
 create mode 100644 tests/qemu-iotests/312.out

-- 
2.29.2


