Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B6712D7C97
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Dec 2020 18:16:44 +0100 (CET)
Received: from localhost ([::1]:41860 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knm27-0002CJ-6C
	for lists+qemu-devel@lfdr.de; Fri, 11 Dec 2020 12:16:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49686)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1knlu6-0003PX-5N
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 12:08:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:59592)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1knlu3-00021Y-4O
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 12:08:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607706501;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=xq++aSMwBhRTbs9+hFmixujebYNzhIUauAZnUjJmXy4=;
 b=HvynsFKa/XjiPNbhDZkiOq1zOoPl9Ptfnwf+AGbG1uuRlFjiLapsZPA2EgSXai09V34guI
 4iiQz/b81zX9nRwycUevU32+5r10M9td6hLiY7g1/m0WEoCl5koTRx/TcwNCNgTaVyFcmS
 tHpIHYvogIPTKBdxVsEh6g0J7VpE8M4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-380-zPTEkZgjPXWLGufYp5xAtA-1; Fri, 11 Dec 2020 12:08:17 -0500
X-MC-Unique: zPTEkZgjPXWLGufYp5xAtA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9F583858181;
 Fri, 11 Dec 2020 17:08:15 +0000 (UTC)
Received: from merkur.redhat.com (ovpn-114-231.ams2.redhat.com [10.36.114.231])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9D95F5D740;
 Fri, 11 Dec 2020 17:08:14 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 00/34] Block layer patches
Date: Fri, 11 Dec 2020 18:07:38 +0100
Message-Id: <20201211170812.228643-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: kwolf@redhat.com, peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit b785d25e91718a660546a6550f64b3c543af7754:

  Merge remote-tracking branch 'remotes/bonzini-gitlab/tags/for-upstream' into staging (2020-12-11 13:50:35 +0000)

are available in the Git repository at:

  git://repo.or.cz/qemu/kevin.git tags/for-upstream

for you to fetch changes up to 960d5fb3e8ee09bc5f1a5c84f66dce42a6cef920:

  block: Fix deadlock in bdrv_co_yield_to_drain() (2020-12-11 17:52:40 +0100)

----------------------------------------------------------------
Block layer patches:

- Support for FUSE exports
- Fix deadlock in bdrv_co_yield_to_drain()
- Use lock guard macros
- Some preparational patches for 64 bit block layer
- file-posix: Fix request extension to INT64_MAX in raw_do_pwrite_zeroes()

----------------------------------------------------------------
Gan Qixin (4):
      block/accounting: Use lock guard macros
      block/curl: Use lock guard macros
      block/throttle-groups: Use lock guard macros
      block/iscsi: Use lock guard macros

Kevin Wolf (4):
      can-host: Fix crash when 'canbus' property is not set
      block: Simplify qmp_block_resize() error paths
      block: Fix locking in qmp_block_resize()
      block: Fix deadlock in bdrv_co_yield_to_drain()

Li Feng (1):
      file-posix: check the use_lock before setting the file lock

Max Reitz (21):
      meson: Detect libfuse
      fuse: Allow exporting BDSs via FUSE
      fuse: Implement standard FUSE operations
      fuse: Allow growable exports
      fuse: (Partially) implement fallocate()
      fuse: Implement hole detection through lseek
      iotests: Do not needlessly filter _make_test_img
      iotests: Do not pipe _make_test_img
      iotests: Use convert -n in some cases
      iotests/046: Avoid renaming images
      iotests: Derive image names from $TEST_IMG
      iotests/091: Use _cleanup_qemu instad of "wait"
      iotests: Restrict some Python tests to file
      iotests: Let _make_test_img guess $TEST_IMG_FILE
      iotests/287: Clean up subshell test image
      storage-daemon: Call bdrv_close_all() on exit
      iotests: Give access to the qemu-storage-daemon
      iotests: Allow testing FUSE exports
      iotests: Enable fuse for many tests
      iotests/308: Add test for FUSE exports
      iotests/221: Discard image before qemu-img map

Vladimir Sementsov-Ogievskiy (4):
      block/file-posix: fix workaround in raw_do_pwrite_zeroes()
      block/io: bdrv_refresh_limits(): use ERRP_GUARD
      block/io: bdrv_check_byte_request(): drop bdrv_is_inserted()
      block: introduce BDRV_MAX_LENGTH

 qapi/block-export.json               |  27 +-
 meson_options.txt                    |   4 +
 configure                            |  13 +
 include/block/block.h                |  10 +
 include/block/block_int.h            |   8 +
 include/block/fuse.h                 |  30 ++
 block.c                              |  18 +-
 block/accounting.c                   |  32 +-
 block/curl.c                         |  28 +-
 block/export/export.c                |   4 +
 block/export/fuse.c                  | 726 +++++++++++++++++++++++++++++++++++
 block/file-posix.c                   |   9 +-
 block/io.c                           | 110 ++++--
 block/iscsi.c                        |  50 ++-
 block/throttle-groups.c              |  48 ++-
 blockdev.c                           |  14 +-
 net/can/can_host.c                   |   5 +
 storage-daemon/qemu-storage-daemon.c |   3 +
 tests/test-write-threshold.c         |   4 +
 MAINTAINERS                          |   6 +
 block/export/meson.build             |   2 +
 meson.build                          |  26 ++
 tests/qemu-iotests/025               |   2 +-
 tests/qemu-iotests/026               |   2 +-
 tests/qemu-iotests/028               |  16 +-
 tests/qemu-iotests/028.out           |   3 +
 tests/qemu-iotests/031               |   2 +-
 tests/qemu-iotests/034               |   2 +-
 tests/qemu-iotests/036               |   2 +-
 tests/qemu-iotests/037               |   2 +-
 tests/qemu-iotests/038               |   2 +-
 tests/qemu-iotests/039               |   2 +-
 tests/qemu-iotests/046               |   7 +-
 tests/qemu-iotests/046.out           |   2 +-
 tests/qemu-iotests/050               |   2 +-
 tests/qemu-iotests/054               |   2 +-
 tests/qemu-iotests/060               |   2 +-
 tests/qemu-iotests/071               |  21 +-
 tests/qemu-iotests/079               |   2 +-
 tests/qemu-iotests/080               |   2 +-
 tests/qemu-iotests/089               |   5 +-
 tests/qemu-iotests/089.out           |   1 +
 tests/qemu-iotests/090               |   2 +-
 tests/qemu-iotests/091               |   5 +-
 tests/qemu-iotests/095               |   2 +-
 tests/qemu-iotests/097               |   2 +-
 tests/qemu-iotests/098               |   2 +-
 tests/qemu-iotests/102               |   2 +-
 tests/qemu-iotests/103               |   2 +-
 tests/qemu-iotests/106               |   2 +-
 tests/qemu-iotests/107               |   2 +-
 tests/qemu-iotests/108               |   2 +-
 tests/qemu-iotests/111               |   2 +-
 tests/qemu-iotests/112               |   2 +-
 tests/qemu-iotests/115               |   2 +-
 tests/qemu-iotests/117               |   2 +-
 tests/qemu-iotests/120               |   2 +-
 tests/qemu-iotests/121               |   2 +-
 tests/qemu-iotests/127               |   2 +-
 tests/qemu-iotests/133               |   2 +-
 tests/qemu-iotests/137               |   2 +-
 tests/qemu-iotests/138               |   2 +-
 tests/qemu-iotests/140               |   2 +-
 tests/qemu-iotests/154               |   2 +-
 tests/qemu-iotests/161               |  14 +-
 tests/qemu-iotests/171               |   2 +-
 tests/qemu-iotests/174               |  10 +-
 tests/qemu-iotests/175               |   8 +-
 tests/qemu-iotests/176               |   2 +-
 tests/qemu-iotests/177               |   2 +-
 tests/qemu-iotests/179               |   2 +-
 tests/qemu-iotests/183               |   2 +-
 tests/qemu-iotests/186               |   2 +-
 tests/qemu-iotests/187               |   2 +-
 tests/qemu-iotests/191               |   2 +-
 tests/qemu-iotests/195               |   2 +-
 tests/qemu-iotests/200               |   5 +-
 tests/qemu-iotests/200.out           |   4 +-
 tests/qemu-iotests/204               |   2 +-
 tests/qemu-iotests/206               |   5 +-
 tests/qemu-iotests/206.out           |   6 +
 tests/qemu-iotests/214               |   2 +-
 tests/qemu-iotests/217               |   2 +-
 tests/qemu-iotests/220               |   2 +-
 tests/qemu-iotests/221               |   9 +-
 tests/qemu-iotests/221.out           |  14 +-
 tests/qemu-iotests/229               |   5 +-
 tests/qemu-iotests/229.out           |   6 +-
 tests/qemu-iotests/242               |   3 +-
 tests/qemu-iotests/247               |   2 +-
 tests/qemu-iotests/249               |   8 +-
 tests/qemu-iotests/250               |   2 +-
 tests/qemu-iotests/252               |   2 +-
 tests/qemu-iotests/265               |   2 +-
 tests/qemu-iotests/268               |   2 +-
 tests/qemu-iotests/272               |   2 +-
 tests/qemu-iotests/273               |   2 +-
 tests/qemu-iotests/279               |   2 +-
 tests/qemu-iotests/286               |   2 +-
 tests/qemu-iotests/287               |   6 +-
 tests/qemu-iotests/289               |   2 +-
 tests/qemu-iotests/290               |   2 +-
 tests/qemu-iotests/291               |   2 +-
 tests/qemu-iotests/292               |   2 +-
 tests/qemu-iotests/293               |   2 +-
 tests/qemu-iotests/294               |   2 +-
 tests/qemu-iotests/305               |   2 +-
 tests/qemu-iotests/308               | 339 ++++++++++++++++
 tests/qemu-iotests/308.out           |  97 +++++
 tests/qemu-iotests/check             |  17 +
 tests/qemu-iotests/common.filter     |   5 +-
 tests/qemu-iotests/common.rc         | 181 ++++++++-
 tests/qemu-iotests/group             |   1 +
 113 files changed, 1841 insertions(+), 265 deletions(-)
 create mode 100644 include/block/fuse.h
 create mode 100644 block/export/fuse.c
 create mode 100755 tests/qemu-iotests/308
 create mode 100644 tests/qemu-iotests/308.out


