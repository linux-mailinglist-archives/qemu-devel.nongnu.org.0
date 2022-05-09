Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DBBA51FDC9
	for <lists+qemu-devel@lfdr.de>; Mon,  9 May 2022 15:14:33 +0200 (CEST)
Received: from localhost ([::1]:50664 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1no3Dc-000859-71
	for lists+qemu-devel@lfdr.de; Mon, 09 May 2022 09:14:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36944)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1no2tB-0006RF-BW
 for qemu-devel@nongnu.org; Mon, 09 May 2022 08:53:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:25324)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1no2t7-0002oD-II
 for qemu-devel@nongnu.org; Mon, 09 May 2022 08:53:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652100800;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=gTZHq5C+nDieZmdBKZwfQywqCUo0OfoTLvjfxyjDHeA=;
 b=hE/7BJp1OXfmm1HsbZwR8tK993VPmtyw3BECywuo2D37Lzn5sRBainyfp1QuIKpIIGvC6H
 KMdGb1GQlP42LKode5h7wiEB9aN+QDgRfFKq8uFsKM98JxkPcJtQos4b8mHVVO/braaFeI
 mb7psWmc99s1jwsLkwCQUU6+7M/hO4k=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-583-9CmhfSQSMHuOV3w1-ncmwQ-1; Mon, 09 May 2022 08:53:17 -0400
X-MC-Unique: 9CmhfSQSMHuOV3w1-ncmwQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 77CB31C00126;
 Mon,  9 May 2022 12:53:17 +0000 (UTC)
Received: from localhost (unknown [10.39.195.157])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 102B814A56A8;
 Mon,  9 May 2022 12:53:16 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Cc: <qemu-block@nongnu.org>, Richard Henderson <richard.henderson@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>
Subject: [PULL 0/9] Block patches
Date: Mon,  9 May 2022 13:53:06 +0100
Message-Id: <20220509125315.3746865-1-stefanha@redhat.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 554623226f800acf48a2ed568900c1c968ec9a8b:

  Merge tag 'qemu-sparc-20220508' of https://github.com/mcayland/qemu into staging (2022-05-08 17:03:26 -0500)

are available in the Git repository at:

  https://gitlab.com/stefanha/qemu.git tags/block-pull-request

for you to fetch changes up to 3dc584abeef0e1277c2de8c1c1974cb49444eb0a:

  virtio-scsi: move request-related items from .h to .c (2022-05-09 10:45:04 +0100)

----------------------------------------------------------------
Pull request

- Add new thread-pool-min/thread-pool-max parameters to control the thread pool
  used for async I/O.

- Fix virtio-scsi IOThread 100% CPU consumption QEMU 7.0 regression.

----------------------------------------------------------------

Nicolas Saenz Julienne (3):
  Introduce event-loop-base abstract class
  util/main-loop: Introduce the main loop into QOM
  util/event-loop-base: Introduce options to set the thread pool size

Stefan Hajnoczi (6):
  virtio-scsi: fix ctrl and event handler functions in dataplane mode
  virtio-scsi: don't waste CPU polling the event virtqueue
  virtio-scsi: clean up virtio_scsi_handle_event_vq()
  virtio-scsi: clean up virtio_scsi_handle_ctrl_vq()
  virtio-scsi: clean up virtio_scsi_handle_cmd_vq()
  virtio-scsi: move request-related items from .h to .c

 qapi/qom.json                    |  43 ++++++++--
 meson.build                      |  26 +++---
 include/block/aio.h              |  10 +++
 include/block/thread-pool.h      |   3 +
 include/hw/virtio/virtio-scsi.h  |  43 ----------
 include/hw/virtio/virtio.h       |   1 +
 include/qemu/main-loop.h         |  10 +++
 include/sysemu/event-loop-base.h |  41 +++++++++
 include/sysemu/iothread.h        |   6 +-
 event-loop-base.c                | 140 +++++++++++++++++++++++++++++++
 hw/scsi/virtio-scsi-dataplane.c  |   2 +-
 hw/scsi/virtio-scsi.c            | 101 +++++++++++++++-------
 hw/virtio/virtio.c               |  13 +++
 iothread.c                       |  68 +++++----------
 util/aio-posix.c                 |   1 +
 util/async.c                     |  20 +++++
 util/main-loop.c                 |  65 ++++++++++++++
 util/thread-pool.c               |  55 +++++++++++-
 18 files changed, 505 insertions(+), 143 deletions(-)
 create mode 100644 include/sysemu/event-loop-base.h
 create mode 100644 event-loop-base.c

-- 
2.35.1


