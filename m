Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CFB1579F6E
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jul 2022 15:19:58 +0200 (CEST)
Received: from localhost ([::1]:42262 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDn8n-000466-DG
	for lists+qemu-devel@lfdr.de; Tue, 19 Jul 2022 09:19:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40432)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oDn5x-0006sa-O7
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 09:17:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38403)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oDn5v-0004nq-0O
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 09:17:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658236617;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=0yfyPzcyWSGtjI5YZg1bISU0acbGBxZCF1oEftgnuqw=;
 b=PTTs0O0ByihG+yVTzQQhzmsw0/noU6GR6KX1ktRWi0XHKVk716ZTmYILbOgIISS42azT04
 yyRg/rRPyd868HQZKIHTUzEhoHQRzlAqgM/74SCtn7cREnjRqshSFddCYmX9jw576cC4ju
 8tjqjJFbTDfxsgjlh9xB4mUoRa6d8o8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-620-2gIWUVdAPZGW5dwjpfz1tQ-1; Tue, 19 Jul 2022 09:16:50 -0400
X-MC-Unique: 2gIWUVdAPZGW5dwjpfz1tQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9203185A589;
 Tue, 19 Jul 2022 13:16:50 +0000 (UTC)
Received: from localhost.localdomain (ovpn-12-77.pek2.redhat.com [10.72.12.77])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F319A40CF8E5;
 Tue, 19 Jul 2022 13:16:48 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Cc: Jason Wang <jasowang@redhat.com>
Subject: [PULL 00/24] Net Patches
Date: Tue, 19 Jul 2022 21:16:13 +0800
Message-Id: <20220719131637.46131-1-jasowang@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

The following changes since commit f9d9fff72eed03acde97ea2d66104748dc474b2e:

  Merge tag 'qemu-sparc-20220718' of https://github.com/mcayland/qemu into staging (2022-07-19 09:57:13 +0100)

are available in the git repository at:

  https://github.com/jasowang/qemu.git tags/net-pull-request

for you to fetch changes up to f8a9fd7b7ab6601b76e253bbcbfe952f8c1887ec:

  net/colo.c: fix segmentation fault when packet is not parsed correctly (2022-07-19 21:05:20 +0800)

----------------------------------------------------------------

----------------------------------------------------------------
Eugenio Pérez (20):
      vhost: move descriptor translation to vhost_svq_vring_write_descs
      virtio-net: Expose MAC_TABLE_ENTRIES
      virtio-net: Expose ctrl virtqueue logic
      vdpa: Avoid compiler to squash reads to used idx
      vhost: Reorder vhost_svq_kick
      vhost: Move vhost_svq_kick call to vhost_svq_add
      vhost: Check for queue full at vhost_svq_add
      vhost: Decouple vhost_svq_add from VirtQueueElement
      vhost: Add SVQDescState
      vhost: Track number of descs in SVQDescState
      vhost: add vhost_svq_push_elem
      vhost: Expose vhost_svq_add
      vhost: add vhost_svq_poll
      vhost: Add svq avail_handler callback
      vdpa: Export vhost_vdpa_dma_map and unmap calls
      vdpa: manual forward CVQ buffers
      vdpa: Buffer CVQ support on shadow virtqueue
      vdpa: Extract get features part from vhost_vdpa_get_max_queue_pairs
      vdpa: Add device migration blocker
      vdpa: Add x-svq to NetdevVhostVDPAOptions

Zhang Chen (4):
      softmmu/runstate.c: add RunStateTransition support form COLO to PRELAUNCH
      net/colo: Fix a "double free" crash to clear the conn_list
      net/colo.c: No need to track conn_list for filter-rewriter
      net/colo.c: fix segmentation fault when packet is not parsed correctly

 hw/net/virtio-net.c                |  85 +++++----
 hw/virtio/vhost-shadow-virtqueue.c | 210 +++++++++++++++-------
 hw/virtio/vhost-shadow-virtqueue.h |  52 +++++-
 hw/virtio/vhost-vdpa.c             |  26 ++-
 include/hw/virtio/vhost-vdpa.h     |   8 +
 include/hw/virtio/virtio-net.h     |   7 +
 net/colo-compare.c                 |   2 +-
 net/colo.c                         |  11 +-
 net/filter-rewriter.c              |   2 +-
 net/trace-events                   |   1 +
 net/vhost-vdpa.c                   | 357 +++++++++++++++++++++++++++++++++++--
 qapi/net.json                      |   9 +-
 softmmu/runstate.c                 |   1 +
 13 files changed, 648 insertions(+), 123 deletions(-)



