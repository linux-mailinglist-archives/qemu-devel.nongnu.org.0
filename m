Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DFA9C36F928
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 13:21:47 +0200 (CEST)
Received: from localhost ([::1]:36816 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcRDO-0001ox-V1
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 07:21:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36306)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lcQkZ-0003Z2-Di
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 06:51:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20540)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lcQkX-0002GH-Fb
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 06:51:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619779916;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=ND7UM81496YG6PaHyIIQtEd37Cw4i033ZMjsyyUKdx8=;
 b=F471nEdlKwemTmcjiijDpxIQV5eI+BRov7/BeLoppGQHwM5J7vVoltz1taJY4+03c9KwMS
 GRE8IPRKXDj4jnk80yb003dIh6OHiv0vEziLI83ScCOT6U+I7wMCS6HSI9mYdSpDfhiHlT
 qOR0AkB2B5SEQxlGax8BOhnpfi8iU3U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-445-pnpV4FhdO0CCeWt3mgSFOQ-1; Fri, 30 Apr 2021 06:51:54 -0400
X-MC-Unique: pnpV4FhdO0CCeWt3mgSFOQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6CD4F18982A1;
 Fri, 30 Apr 2021 10:51:53 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-114-197.ams2.redhat.com [10.36.114.197])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7B62617177;
 Fri, 30 Apr 2021 10:51:52 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 00/39] Block layer patches
Date: Fri, 30 Apr 2021 12:51:08 +0200
Message-Id: <20210430105147.125840-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.22,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

The following changes since commit ccdf06c1db192152ac70a1dd974c624f566cb7d4:

  Open 6.1 development tree (2021-04-30 11:15:40 +0100)

are available in the Git repository at:

  git://repo.or.cz/qemu/kevin.git tags/for-upstream

for you to fetch changes up to 68bf7336533faa6aa90fdd4558edddbf5d8ef814:

  vhost-user-blk: Fail gracefully on too large queue size (2021-04-30 12:27:48 +0200)

----------------------------------------------------------------
Block layer patches

- Fix permission update order problems with block graph changes
- qemu-img convert: Unshare write permission for source
- vhost-user-blk: Fail gracefully on too large queue size

----------------------------------------------------------------
Kevin Wolf (3):
      block: Add BDRV_O_NO_SHARE for blk_new_open()
      qemu-img convert: Unshare write permission for source
      vhost-user-blk: Fail gracefully on too large queue size

Vladimir Sementsov-Ogievskiy (36):
      tests/test-bdrv-graph-mod: add test_parallel_exclusive_write
      tests/test-bdrv-graph-mod: add test_parallel_perm_update
      tests/test-bdrv-graph-mod: add test_append_greedy_filter
      block: bdrv_append(): don't consume reference
      block: BdrvChildClass: add .get_parent_aio_context handler
      block: drop ctx argument from bdrv_root_attach_child
      block: make bdrv_reopen_{prepare,commit,abort} private
      util: add transactions.c
      block: bdrv_refresh_perms: check for parents permissions conflict
      block: refactor bdrv_child* permission functions
      block: rewrite bdrv_child_try_set_perm() using bdrv_refresh_perms()
      block: inline bdrv_child_*() permission functions calls
      block: use topological sort for permission update
      block: add bdrv_drv_set_perm transaction action
      block: add bdrv_list_* permission update functions
      block: add bdrv_replace_child_safe() transaction action
      block: fix bdrv_replace_node_common
      block: add bdrv_attach_child_common() transaction action
      block: add bdrv_attach_child_noperm() transaction action
      block: split out bdrv_replace_node_noperm()
      block: adapt bdrv_append() for inserting filters
      block: add bdrv_remove_filter_or_cow transaction action
      block: introduce bdrv_drop_filter()
      block/backup-top: drop .active
      block: drop ignore_children for permission update functions
      block: make bdrv_unset_inherits_from to be a transaction action
      block: make bdrv_refresh_limits() to be a transaction action
      block: add bdrv_set_backing_noperm() transaction action
      block: bdrv_reopen_multiple(): move bdrv_flush to separate pre-prepare
      block: bdrv_reopen_multiple: refresh permissions on updated graph
      block: drop unused permission update functions
      block: inline bdrv_check_perm_common()
      block: inline bdrv_replace_child()
      block: refactor bdrv_child_set_perm_safe() transaction action
      block: rename bdrv_replace_child_safe() to bdrv_replace_child()
      block: refactor bdrv_node_check_perm()

 include/block/block.h                 |   14 +-
 include/block/block_int.h             |    8 +-
 include/qemu/transactions.h           |   63 ++
 block.c                               | 1329 ++++++++++++++++++++-------------
 block/backup-top.c                    |   48 +-
 block/block-backend.c                 |   30 +-
 block/commit.c                        |    1 +
 block/file-posix.c                    |   91 +--
 block/io.c                            |   31 +-
 block/mirror.c                        |    3 -
 blockdev.c                            |    4 -
 blockjob.c                            |   11 +-
 hw/block/vhost-user-blk.c             |    5 +
 qemu-img.c                            |    2 +-
 tests/unit/test-bdrv-drain.c          |    2 +-
 tests/unit/test-bdrv-graph-mod.c      |  209 +++++-
 util/transactions.c                   |   96 +++
 MAINTAINERS                           |    6 +
 tests/qemu-iotests/245                |    2 +-
 tests/qemu-iotests/283.out            |    2 +-
 tests/qemu-iotests/tests/qsd-jobs.out |    2 +-
 util/meson.build                      |    1 +
 22 files changed, 1280 insertions(+), 680 deletions(-)
 create mode 100644 include/qemu/transactions.h
 create mode 100644 util/transactions.c


