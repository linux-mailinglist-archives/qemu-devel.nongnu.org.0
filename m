Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 789E65AA84B
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Sep 2022 08:48:34 +0200 (CEST)
Received: from localhost ([::1]:55730 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oU0Tc-0004Y8-Eo
	for lists+qemu-devel@lfdr.de; Fri, 02 Sep 2022 02:48:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42450)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oU0NF-00072r-Sa
 for qemu-devel@nongnu.org; Fri, 02 Sep 2022 02:41:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33811)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oU0NB-0004kA-O5
 for qemu-devel@nongnu.org; Fri, 02 Sep 2022 02:41:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662100907;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=8iD/uHA6lqKkeISFO461cCTgS9iGkUQctpDdDa7E10s=;
 b=So41zRTqeH/mstNLu3gFq0eGnSAgq0Bcl0WK73li8RGXgDQ77cX8v5O0zYxoBScypJwhYA
 jQ6rx8pjrcelosOBTz8NoZC9XpoBi6mSiA1Bc4ya6VfD8K6g64Z/dF3+FcsMx3MfwkssRG
 XeFmQKBASlGtQyYafyTg0LsSg+50b7k=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-50-FbZIrFynNCyhx_mtE5F-zg-1; Fri, 02 Sep 2022 02:41:44 -0400
X-MC-Unique: FbZIrFynNCyhx_mtE5F-zg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BFF41101AA47;
 Fri,  2 Sep 2022 06:41:43 +0000 (UTC)
Received: from localhost.localdomain (ovpn-12-152.pek2.redhat.com
 [10.72.12.152])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EB82A1415137;
 Fri,  2 Sep 2022 06:41:41 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Cc: Jason Wang <jasowang@redhat.com>
Subject: [PULL 00/21] Net patches
Date: Fri,  2 Sep 2022 14:41:17 +0800
Message-Id: <20220902064138.56468-1-jasowang@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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

The following changes since commit 7dd9d7e0bd29abf590d1ac235c0a00606ef81153:

  Merge tag 'pull-ppc-20220831' of https://gitlab.com/danielhb/qemu into staging (2022-09-01 13:53:20 -0400)

are available in the git repository at:

  https://github.com/jasowang/qemu.git tags/net-pull-request

for you to fetch changes up to 36a894aeb64a2e02871016da1c37d4a4ca109182:

  net: tulip: Restrict DMA engine to memories (2022-09-02 10:22:39 +0800)

----------------------------------------------------------------

----------------------------------------------------------------
Eugenio Pérez (19):
      vdpa: Skip the maps not in the iova tree
      vdpa: do not save failed dma maps in SVQ iova tree
      util: accept iova_tree_remove_parameter by value
      vdpa: Remove SVQ vring from iova_tree at shutdown
      vdpa: Make SVQ vring unmapping return void
      vhost: Always store new kick fd on vhost_svq_set_svq_kick_fd
      vdpa: Use ring hwaddr at vhost_vdpa_svq_unmap_ring
      vhost: stop transfer elem ownership in vhost_handle_guest_kick
      vhost: use SVQ element ndescs instead of opaque data for desc validation
      vhost: Delete useless read memory barrier
      vhost: Do not depend on !NULL VirtQueueElement on vhost_svq_flush
      vhost_net: Add NetClientInfo start callback
      vhost_net: Add NetClientInfo stop callback
      vdpa: add net_vhost_vdpa_cvq_info NetClientInfo
      vdpa: Move command buffers map to start of net device
      vdpa: extract vhost_vdpa_net_cvq_add from vhost_vdpa_net_handle_ctrl_avail
      vhost_net: add NetClientState->load() callback
      vdpa: Add virtio-net mac address via CVQ at start
      vdpa: Delete CVQ migration blocker

Zhang Chen (1):
      net/colo.c: Fix the pointer issue reported by Coverity.

Zheyu Ma (1):
      net: tulip: Restrict DMA engine to memories

 hw/i386/intel_iommu.c              |   6 +-
 hw/net/tulip.c                     |   4 +-
 hw/net/vhost_net.c                 |  17 +++
 hw/virtio/vhost-iova-tree.c        |   2 +-
 hw/virtio/vhost-iova-tree.h        |   2 +-
 hw/virtio/vhost-shadow-virtqueue.c |  31 +++--
 hw/virtio/vhost-vdpa.c             |  90 +++++++--------
 include/hw/virtio/vhost-vdpa.h     |   1 -
 include/net/net.h                  |   6 +
 include/qemu/iova-tree.h           |   2 +-
 net/colo.c                         |  25 ++--
 net/colo.h                         |   1 +
 net/trace-events                   |   2 +-
 net/vhost-vdpa.c                   | 228 +++++++++++++++++++++++--------------
 util/iova-tree.c                   |   4 +-
 15 files changed, 248 insertions(+), 173 deletions(-)


