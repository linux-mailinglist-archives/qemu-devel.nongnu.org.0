Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A6554D195B
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Mar 2022 14:39:39 +0100 (CET)
Received: from localhost ([::1]:51368 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRa3u-0004Sq-8w
	for lists+qemu-devel@lfdr.de; Tue, 08 Mar 2022 08:39:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43202)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nRZzx-0001Mu-80
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 08:35:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40912)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nRZzq-0001um-LO
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 08:35:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646746500;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Pn39dN3ashu/Ra3G0XoYJL55MV3TTBiCThF3eca5ezw=;
 b=Nk1bmKGmMnvSyytifMH5WLZ80F5oPW5piewVpKCfr/s45ln5pVJwKwL5Ji/RxwhQgRIKpI
 m9akaOnvFXdkOUs6JCz1lS6ZKVoWIXExlZv47xcZi1WoEKzYLWdmobJHsL+ALjRsxYTcbN
 iGOa/7qB5YUszuLa07T7hVNVvWfQWK8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-368-JlQaBsbUMJmFxVRkYKmezA-1; Tue, 08 Mar 2022 08:34:57 -0500
X-MC-Unique: JlQaBsbUMJmFxVRkYKmezA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 30A7F801DDC;
 Tue,  8 Mar 2022 13:34:56 +0000 (UTC)
Received: from localhost.localdomain (ovpn-12-181.pek2.redhat.com
 [10.72.12.181])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2B6B986588;
 Tue,  8 Mar 2022 13:34:53 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Subject: [PULL 00/15] Net patches
Date: Tue,  8 Mar 2022 21:34:36 +0800
Message-Id: <20220308133451.25378-1-jasowang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Jason Wang <jasowang@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit f45cc81911adc7726e8a2801986b6998b91b816e:

  Merge remote-tracking branch 'remotes/cschoenebeck/tags/pull-9p-20220307' into staging (2022-03-08 09:06:57 +0000)

are available in the git repository at:

  https://github.com/jasowang/qemu.git tags/net-pull-request

for you to fetch changes up to a10dd1e279fc56cebc7e738925e0db85d0cea089:

  vdpa: Expose VHOST_F_LOG_ALL on SVQ (2022-03-08 21:18:41 +0800)

----------------------------------------------------------------

----------------------------------------------------------------
Eugenio Pérez (14):
      vhost: Add VhostShadowVirtqueue
      vhost: Add Shadow VirtQueue kick forwarding capabilities
      vhost: Add Shadow VirtQueue call forwarding capabilities
      vhost: Add vhost_svq_valid_features to shadow vq
      virtio: Add vhost_svq_get_vring_addr
      vdpa: adapt vhost_ops callbacks to svq
      vhost: Shadow virtqueue buffers forwarding
      util: Add iova_tree_alloc_map
      util: add iova_tree_find_iova
      vhost: Add VhostIOVATree
      vdpa: Add custom IOTLB translations to SVQ
      vdpa: Adapt vhost_vdpa_get_vring_base to SVQ
      vdpa: Never set log_base addr if SVQ is enabled
      vdpa: Expose VHOST_F_LOG_ALL on SVQ

Jason Wang (1):
      virtio-net: fix map leaking on error during receive

 hw/net/virtio-net.c                |   1 +
 hw/virtio/meson.build              |   2 +-
 hw/virtio/vhost-iova-tree.c        | 110 +++++++
 hw/virtio/vhost-iova-tree.h        |  27 ++
 hw/virtio/vhost-shadow-virtqueue.c | 637 +++++++++++++++++++++++++++++++++++++
 hw/virtio/vhost-shadow-virtqueue.h |  87 +++++
 hw/virtio/vhost-vdpa.c             | 525 +++++++++++++++++++++++++++++-
 include/hw/virtio/vhost-vdpa.h     |   8 +
 include/qemu/iova-tree.h           |  38 ++-
 util/iova-tree.c                   | 169 ++++++++++
 10 files changed, 1587 insertions(+), 17 deletions(-)
 create mode 100644 hw/virtio/vhost-iova-tree.c
 create mode 100644 hw/virtio/vhost-iova-tree.h
 create mode 100644 hw/virtio/vhost-shadow-virtqueue.c
 create mode 100644 hw/virtio/vhost-shadow-virtqueue.h


