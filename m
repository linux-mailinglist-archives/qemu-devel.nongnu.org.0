Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B99672AC2CD
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Nov 2020 18:48:22 +0100 (CET)
Received: from localhost ([::1]:56010 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcBHB-0000Ls-Pj
	for lists+qemu-devel@lfdr.de; Mon, 09 Nov 2020 12:48:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40678)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1kcB83-0006ag-2x
 for qemu-devel@nongnu.org; Mon, 09 Nov 2020 12:38:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:39171)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1kcB7v-0000N1-Pb
 for qemu-devel@nongnu.org; Mon, 09 Nov 2020 12:38:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1604943526;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=P4/+0CG9OEASe231HqF3py41P+Pq1Je5KSnIUs6xYK8=;
 b=GxU+x4cpCSPAycTpQ1AnhkVSbMQaDtl/V3WHbETTtD+WWkGK+fznxFozffsz01yRc0UoNZ
 xS4ewEaly6+RQzqjc0/VxbQIwOnnB/kKb6cQK6WHQaa7TDsum+pJ7N7Zeb8lwpnFwWZUsP
 HqT2/6gKs+76ajLDC3eQN+jjgVewUz4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-140-D3HZoR7LMumLH4NhpsChgw-1; Mon, 09 Nov 2020 12:38:42 -0500
X-MC-Unique: D3HZoR7LMumLH4NhpsChgw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C10B65F9CB;
 Mon,  9 Nov 2020 17:38:41 +0000 (UTC)
Received: from localhost (ovpn-113-179.ams2.redhat.com [10.36.113.179])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 602236EF67;
 Mon,  9 Nov 2020 17:38:41 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 00/15] Block patches for 5.2.0-rc1
Date: Mon,  9 Nov 2020 18:38:24 +0100
Message-Id: <20201109173839.2135984-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/09 01:25:23
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

The following changes since commit 2a190a7256a3e0563b29ffd67e0164097b4a6dac:

  Merge remote-tracking branch 'remotes/philmd-gitlab/tags/renesas-fixes-20201109' into staging (2020-11-09 11:20:25 +0000)

are available in the Git repository at:

  https://github.com/XanClic/qemu.git tags/pull-block-2020-11-09

for you to fetch changes up to 8f88cb77b06be0c2e45ed31c9fd6817d2ce3836a:

  block: make bdrv_drop_intermediate() less wrong (2020-11-09 15:44:21 +0100)

----------------------------------------------------------------
Block patches for 5.2.0-rc1:
- Some nvme fixes (addressing problems spotted by Coverity)
- Fix nfs compiling on mingw (and enable it in Cirrus)
- Fix an error path in bdrv_co_invalidate_cache() (permission update
  was initiated, but not aborted)
- Fix (on-error) roll back in bdrv_drop_intermediate(): Instead of
  inlining bdrv_replace_node() (wrongly), call that function
- Fix for iotest 240
- Fix error handling in bdrv_getlength()
- Be more explicit about how QCowL2Meta objects are handled
- Cleanups

----------------------------------------------------------------
Alberto Garcia (1):
  qcow2: Document and enforce the QCowL2Meta invariants

AlexChen (1):
  block: Remove unused include

Eric Blake (1):
  block: Fix integer promotion error in bdrv_getlength()

Greg Kurz (1):
  block: Move bdrv_drain_all_end_quiesce() to block_int.h

Klaus Jensen (3):
  hw/block/nvme: fix null ns in register namespace
  hw/block/nvme: fix uint16_t use of uint32_t sgls member
  hw/block/nvme: fix free of array-typed value

Maxim Levitsky (2):
  iotests: add filter_qmp_virtio_scsi function
  iotests: rewrite iotest 240 in python

Vladimir Sementsov-Ogievskiy (3):
  block: add forgotten bdrv_abort_perm_update() to
    bdrv_co_invalidate_cache()
  block: add bdrv_replace_node_common()
  block: make bdrv_drop_intermediate() less wrong

Yonggang Luo (2):
  block: Fixes nfs compiling error on msys2/mingw
  block: enable libnfs on msys2/mingw in cirrus.yml

shiliyang (1):
  block: Fix some code style problems, "foo* bar" should be "foo *bar"

 block/qcow2.h                 |  25 ++--
 include/block/block.h         |   6 -
 include/block/block_int.h     |   9 ++
 block.c                       |  89 ++++++++------
 block/blkdebug.c              |   2 +-
 block/dmg-lzfse.c             |   1 -
 block/dmg.c                   |   2 +-
 block/nfs.c                   |  13 +-
 block/qcow2-cluster.c         |   5 +-
 block/qcow2.c                 |  23 +++-
 block/vpc.c                   |  10 +-
 hw/block/nvme.c               |   6 +-
 .cirrus.yml                   |   1 +
 tests/qemu-iotests/240        | 219 ++++++++++++++--------------------
 tests/qemu-iotests/240.out    |  76 ++++++------
 tests/qemu-iotests/iotests.py |  10 ++
 16 files changed, 259 insertions(+), 238 deletions(-)

-- 
2.28.0


