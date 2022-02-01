Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 194FD4A61DA
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Feb 2022 18:04:18 +0100 (CET)
Received: from localhost ([::1]:54440 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEwZk-0003iG-Tx
	for lists+qemu-devel@lfdr.de; Tue, 01 Feb 2022 12:04:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46466)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nEuyD-0002XD-Cw
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 10:21:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:58617)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nEuy8-0003tJ-PC
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 10:21:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643728880;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=CG7TIW4E6YOX0nYZ9aayIvp0Z2Odx6wFehYesDJlNKY=;
 b=AMqJArHL3EVRtA9XjKUbXWtpw4y5cN6yPDm8bz6P2n2mCA7EUpjrRmrcW8/BvS9EzwkKy1
 URJ4xheHgFcHAyy3f/1HPfyhE3ymaBwbHmy9kZ5E3Ud0nCgfgmGS+M0rgVHmQLqZJk8Dvx
 pX3eN6Blv7N7t8PkJR3IAO7YqpO9MU4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-461-kmnLXfhAPtC-aC_KAKnJaQ-1; Tue, 01 Feb 2022 10:21:16 -0500
X-MC-Unique: kmnLXfhAPtC-aC_KAKnJaQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CB6D784DA41;
 Tue,  1 Feb 2022 15:21:15 +0000 (UTC)
Received: from merkur.redhat.com (unknown [10.39.194.45])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BA05974E98;
 Tue,  1 Feb 2022 15:21:14 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 00/10] Block layer patches
Date: Tue,  1 Feb 2022 16:20:58 +0100
Message-Id: <20220201152108.171898-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.081,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
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

The following changes since commit 804b30d25f8d70dc2dea951883ea92235274a50c:

  Merge remote-tracking branch 'remotes/legoater/tags/pull-ppc-20220130' into staging (2022-01-31 11:10:08 +0000)

are available in the Git repository at:

  https://gitlab.com/kmwolf/qemu.git tags/for-upstream

for you to fetch changes up to fc176116cdea816ceb8dd969080b2b95f58edbc0:

  block/rbd: workaround for ceph issue #53784 (2022-02-01 15:16:32 +0100)

----------------------------------------------------------------
Block layer patches

- rbd: fix handling of holes in .bdrv_co_block_status
- Fix potential crash in bdrv_set_backing_hd()
- vhost-user-blk export: Fix shutdown with requests in flight
- FUSE export: Fix build failure on FreeBSD
- Documentation improvements

----------------------------------------------------------------
Emanuele Giuseppe Esposito (1):
      block.h: remove outdated comment

Hanna Reitz (2):
      qsd: Document fuse's allow-other option
      qemu-img: Unify [-b [-F]] documentation

Kevin Wolf (2):
      qemu-storage-daemon: Fix typo in vhost-user-blk help
      block/export: Fix vhost-user-blk shutdown with requests in flight

Peter Lieven (2):
      block/rbd: fix handling of holes in .bdrv_co_block_status
      block/rbd: workaround for ceph issue #53784

Philippe Mathieu-Daudé (2):
      block/export/fuse: Rearrange if-else-if ladder in fuse_fallocate()
      block/export/fuse: Fix build failure on FreeBSD

Vladimir Sementsov-Ogievskiy (1):
      block: bdrv_set_backing_hd(): use drained section

 docs/tools/qemu-img.rst              |  2 +-
 docs/tools/qemu-storage-daemon.rst   |  9 +++++--
 include/block/block.h                |  1 -
 include/qemu/vhost-user-server.h     |  5 ++++
 block.c                              |  4 +++
 block/export/fuse.c                  | 45 +++++++++++++++++--------------
 block/export/vhost-user-blk-server.c |  5 ++++
 block/rbd.c                          | 52 +++++++++++++++++++++++++++++++-----
 storage-daemon/qemu-storage-daemon.c |  4 +--
 util/vhost-user-server.c             | 22 +++++++++++++++
 qemu-img-cmds.hx                     |  4 +--
 11 files changed, 118 insertions(+), 35 deletions(-)


