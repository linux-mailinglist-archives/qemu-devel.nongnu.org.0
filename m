Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B4FA7690CDD
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Feb 2023 16:25:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQ8ng-0004Ld-Lv; Thu, 09 Feb 2023 10:25:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1pQ8ne-0004LL-PO
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 10:25:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1pQ8nc-0000fL-Fj
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 10:25:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675956323;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=rfIQ+7Lm6CKn0FA0u7LAtG+B8G6X0OfYUNlaUV77oNc=;
 b=LyS+l+FishNT2iCmhfZzJC0Tg91TGe20n2UDib6YGIGGp4ZBD33Jq/krvLfem/9qI1vYLE
 RIiCzHK3Jjjf+ox/+Ga9Mc/WOtri0sh2QCAUmw56rTiVwXaBPILCuPOByM6LTzVbeGJJCp
 NRG0SaA6NHUU5/zuXVoSrl432iCqW4s=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-237-9SAniQzSPZuCQFTzuv_2TA-1; Thu, 09 Feb 2023 10:25:22 -0500
X-MC-Unique: 9SAniQzSPZuCQFTzuv_2TA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2BFDF2805589;
 Thu,  9 Feb 2023 15:25:22 +0000 (UTC)
Received: from localhost (unknown [10.39.193.208])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A2C50403D0CB;
 Thu,  9 Feb 2023 15:25:21 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, virtio-fs@redhat.com,
 qemu-block@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Fam Zheng <fam@euphon.net>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: [PULL 0/6] Block patches
Date: Thu,  9 Feb 2023 10:25:14 -0500
Message-Id: <20230209152520.434183-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

The following changes since commit 417296c8d8588f782018d01a317f88957e9786d6:

  tests/qtest/netdev-socket: Raise connection timeout to 60 seconds (2023-02-09 11:23:53 +0000)

are available in the Git repository at:

  https://gitlab.com/stefanha/qemu.git tags/block-pull-request

for you to fetch changes up to acbc8aee5b09222dc6a5cb88306b67bcbe37e30b:

  iotests/detect-zeroes-registered-buf: add new test (2023-02-09 10:22:30 -0500)

----------------------------------------------------------------
Pull request

A few fixes that I've picked up.

----------------------------------------------------------------

Akihiko Odaki (1):
  vhost-user-fs: Back up vqs before cleaning up vhost_dev

Emanuele Giuseppe Esposito (1):
  virtio-blk: add missing AioContext lock

Stefan Hajnoczi (4):
  block: fix detect-zeroes= with BDRV_REQ_REGISTERED_BUF
  qemu-io: use BdrvRequestFlags instead of int
  qemu-io: add -r option to register I/O buffer
  iotests/detect-zeroes-registered-buf: add new test

 block/io.c                                    |   3 +
 hw/block/virtio-blk.c                         |   5 +
 hw/virtio/vhost-user-fs.c                     |   4 +-
 qemu-io-cmds.c                                | 215 +++++++++++-------
 .../tests/detect-zeroes-registered-buf        |  58 +++++
 .../tests/detect-zeroes-registered-buf.out    |   7 +
 6 files changed, 210 insertions(+), 82 deletions(-)
 create mode 100755 tests/qemu-iotests/tests/detect-zeroes-registered-buf
 create mode 100644 tests/qemu-iotests/tests/detect-zeroes-registered-buf.out

-- 
2.39.1


