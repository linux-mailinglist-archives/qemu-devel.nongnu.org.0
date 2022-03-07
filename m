Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DDB4C4CFC49
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 12:08:18 +0100 (CET)
Received: from localhost ([::1]:53388 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRBDt-00087j-VA
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 06:08:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42744)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nRAil-0004qf-Qz
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 05:36:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27793)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nRAik-0008C2-8o
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 05:36:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646649365;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=kZqxgNPTY9BHeT7GCjTAP0aB3/jRKNhmRImFi+ZHg7M=;
 b=OxTIYp5v9xBwca7DWOM/Z1yF0g/BWguvlS1HQ3yHz848a01/7lxFKAMIGYeMr8UG57Fk+5
 xJs8ouWo9HLoRRksq5zDIsH45jDtAwNe3GqZgnGmeyRk0k2pgHDOG6s2XOalpJhu1RmAYk
 3JiHW0Lv7vOiYGqN48706u++F+KrSzA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-398-FLl5EvD-Nd2Ry4P7YweAng-1; Mon, 07 Mar 2022 05:35:52 -0500
X-MC-Unique: FLl5EvD-Nd2Ry4P7YweAng-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D84DE805EE8;
 Mon,  7 Mar 2022 10:35:51 +0000 (UTC)
Received: from localhost (unknown [10.39.194.98])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 777C7783AA;
 Mon,  7 Mar 2022 10:35:51 +0000 (UTC)
From: Hanna Reitz <hreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 00/23] Block patches
Date: Mon,  7 Mar 2022 11:35:26 +0100
Message-Id: <20220307103549.808809-1-hreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Hanna Reitz <hreitz@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 9d662a6b22a0838a85c5432385f35db2488a33a5:

  Merge remote-tracking branch 'remotes/legoater/tags/pull-ppc-20220305' into staging (2022-03-05 18:03:15 +0000)

are available in the Git repository at:

  https://gitlab.com/hreitz/qemu.git tags/pull-block-2022-03-07

for you to fetch changes up to 743da0b401cdc3ee94bc519975e339a3cdbe0ad1:

  iotests/image-fleecing: test push backup with fleecing (2022-03-07 09:33:31 +0100)

----------------------------------------------------------------
Block patches for 7.0-rc0:
- New fleecing backup scheme
- iotest fixes
- Fixes for the curl block driver
- Fix for the preallocate block driver
- IDE fix for zero-length TRIM requests

----------------------------------------------------------------
Hanna Reitz (2):
  ide: Increment BB in-flight counter for TRIM BH
  iotests: Write test output to TEST_DIR

Peter Maydell (2):
  block/curl.c: Set error message string if curl_init_state() fails
  block/curl.c: Check error return from curl_easy_setopt()

Thomas Huth (2):
  tests/qemu-iotests/040: Skip TestCommitWithFilters without 'throttle'
  tests/qemu-iotests/testrunner: Quote "case not run" lines in TAP mode

Vladimir Sementsov-Ogievskiy (17):
  block: fix preallocate filter: don't do unaligned preallocate requests
  block/block-copy: move copy_bitmap initialization to
    block_copy_state_new()
  block/dirty-bitmap: bdrv_merge_dirty_bitmap(): add return value
  block/block-copy: block_copy_state_new(): add bitmap parameter
  block/copy-before-write: add bitmap open parameter
  block/block-copy: add block_copy_reset()
  block: intoduce reqlist
  block/reqlist: reqlist_find_conflict(): use ranges_overlap()
  block/dirty-bitmap: introduce bdrv_dirty_bitmap_status()
  block/reqlist: add reqlist_wait_all()
  block/io: introduce block driver snapshot-access API
  block: introduce snapshot-access block driver
  block: copy-before-write: realize snapshot-access API
  iotests/image-fleecing: add test-case for fleecing format node
  iotests.py: add qemu_io_pipe_and_status()
  iotests/image-fleecing: add test case with bitmap
  iotests/image-fleecing: test push backup with fleecing

 qapi/block-core.json                        |  14 +-
 include/block/block-common.h                |   3 +-
 include/block/block-copy.h                  |   2 +
 include/block/block_int-common.h            |  24 ++
 include/block/block_int-io.h                |   9 +
 include/block/dirty-bitmap.h                |   4 +-
 include/block/reqlist.h                     |  75 ++++++
 include/qemu/hbitmap.h                      |  12 +
 block/block-copy.c                          | 150 +++++------
 block/copy-before-write.c                   | 265 +++++++++++++++++++-
 block/curl.c                                |  92 ++++---
 block/dirty-bitmap.c                        |  15 +-
 block/io.c                                  |  76 ++++++
 block/monitor/bitmap-qmp-cmds.c             |   5 +-
 block/preallocate.c                         |  15 +-
 block/reqlist.c                             |  85 +++++++
 block/snapshot-access.c                     | 132 ++++++++++
 hw/ide/core.c                               |   7 +
 util/hbitmap.c                              |  33 +++
 MAINTAINERS                                 |   5 +-
 block/meson.build                           |   2 +
 tests/qemu-iotests/040                      |   1 +
 tests/qemu-iotests/257.out                  | 224 +++++++++++++++++
 tests/qemu-iotests/common.rc                |   6 +-
 tests/qemu-iotests/iotests.py               |   8 +-
 tests/qemu-iotests/testenv.py               |   5 +-
 tests/qemu-iotests/testrunner.py            |  19 +-
 tests/qemu-iotests/tests/image-fleecing     | 185 +++++++++++---
 tests/qemu-iotests/tests/image-fleecing.out | 221 +++++++++++++++-
 29 files changed, 1499 insertions(+), 195 deletions(-)
 create mode 100644 include/block/reqlist.h
 create mode 100644 block/reqlist.c
 create mode 100644 block/snapshot-access.c

-- 
2.34.1


