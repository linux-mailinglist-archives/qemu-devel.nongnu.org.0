Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5511B2A6D47
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Nov 2020 19:57:32 +0100 (CET)
Received: from localhost ([::1]:50628 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kaNyN-00016G-Bq
	for lists+qemu-devel@lfdr.de; Wed, 04 Nov 2020 13:57:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52720)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kaNk0-0001px-KV
 for qemu-devel@nongnu.org; Wed, 04 Nov 2020 13:42:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36882)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kaNjz-00027Z-3F
 for qemu-devel@nongnu.org; Wed, 04 Nov 2020 13:42:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1604515358;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ay6G7kYGtMwl+/IxEdsu272p/jXvwydr69tjR0/ihX0=;
 b=PU4Xn2Hdj0y/8jueB+noMuUrYu+psXSGPu8peyw9BdJIGTAGtkfzCirRPgFWgfnnDE54ei
 C1yuPtP9Eqokk2LSAvM9tc3H3w0a/H9bOga7UfgJKL2g/avNg6jBiMCLq7UZdBp8iPb2po
 xjMZdw7MjapWIGwWHLNNsgWjrIVs1+8=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-59-lX5IxxSFO0mQzDQJWYHGHw-1; Wed, 04 Nov 2020 13:42:35 -0500
X-MC-Unique: lX5IxxSFO0mQzDQJWYHGHw-1
Received: by mail-wm1-f71.google.com with SMTP id u207so1557107wmu.4
 for <qemu-devel@nongnu.org>; Wed, 04 Nov 2020 10:42:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ay6G7kYGtMwl+/IxEdsu272p/jXvwydr69tjR0/ihX0=;
 b=mWrqeqGwRVOO8Mj9Nn+TSQxGbJWxGafNoADLKessGDJBf5+zdAc2zsX0kfiOkERejm
 jCP1nkdbdtjYH5yzVwGcpLTvHxw/ZSEeoCZcDyimX7R0ACxA625EnTIGg6CKiAYFU/Ue
 KGkvfFQnZUYz8qjFvOIcBEunh0oSFSckY/ls9uHzt5S3JSgwWiIIVjLUZ6J6jXOjla2b
 NsMh/azvNTVazMYkONMjYKnb/ROSFPU4lUmDD5UJyXsmU29bqNH82HWFgQqrrCjCKQO9
 odbHcpPnwHJFTR3xWaYKePzaIVpDpmHXWptJYxNk64xAtNgawy2on4qN9R4q8ojjO55g
 6EcA==
X-Gm-Message-State: AOAM530oIaMpiYVz4GujtREFdCIZBg0W3+BISPrk5/yZ0adu+QpUfItX
 I7NzflGnXOxhbRRlo3boU5h5NGczARO9yCdENruA237bmqmcicWkqxqsOK5qGYhhIokNEOtA5KY
 Q348FGA5040zEMDU=
X-Received: by 2002:a5d:6591:: with SMTP id q17mr33550208wru.173.1604515353167; 
 Wed, 04 Nov 2020 10:42:33 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzXECzrQuVn9IfSdJ+vYUw+quDcsRPWouSCF0TH4H2d19YITkdlRxK7JRP8Gymv92ujn254FQ==
X-Received: by 2002:a5d:6591:: with SMTP id q17mr33550196wru.173.1604515352961; 
 Wed, 04 Nov 2020 10:42:32 -0800 (PST)
Received: from redhat.com (bzq-79-176-118-93.red.bezeqint.net. [79.176.118.93])
 by smtp.gmail.com with ESMTPSA id v8sm3486040wmg.28.2020.11.04.10.42.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Nov 2020 10:42:32 -0800 (PST)
Date: Wed, 4 Nov 2020 13:42:30 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v3 26/31] vhost-blk: set features before setting inflight
 feature
Message-ID: <20201104184040.285057-27-mst@redhat.com>
References: <20201104184040.285057-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201104184040.285057-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/03 00:03:41
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-block@nongnu.org, Jin Yu <jin.yu@intel.com>,
 Max Reitz <mreitz@redhat.com>, Raphael Norwitz <raphael.norwitz@nutanix.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Jin Yu <jin.yu@intel.com>

Virtqueue has split and packed, so before setting inflight,
you need to inform the back-end virtqueue format.

Signed-off-by: Jin Yu <jin.yu@intel.com>
Acked-by: Raphael Norwitz <raphael.norwitz@nutanix.com>
Message-Id: <20201103123617.28256-1-jin.yu@intel.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/hw/virtio/vhost.h |  1 +
 hw/block/vhost-user-blk.c |  6 ++++++
 hw/virtio/vhost.c         | 20 ++++++++++++++++++++
 3 files changed, 27 insertions(+)

diff --git a/include/hw/virtio/vhost.h b/include/hw/virtio/vhost.h
index 94585067f7..4a8bc75415 100644
--- a/include/hw/virtio/vhost.h
+++ b/include/hw/virtio/vhost.h
@@ -141,6 +141,7 @@ void vhost_dev_reset_inflight(struct vhost_inflight *inflight);
 void vhost_dev_free_inflight(struct vhost_inflight *inflight);
 void vhost_dev_save_inflight(struct vhost_inflight *inflight, QEMUFile *f);
 int vhost_dev_load_inflight(struct vhost_inflight *inflight, QEMUFile *f);
+int vhost_dev_prepare_inflight(struct vhost_dev *hdev, VirtIODevice *vdev);
 int vhost_dev_set_inflight(struct vhost_dev *dev,
                            struct vhost_inflight *inflight);
 int vhost_dev_get_inflight(struct vhost_dev *dev, uint16_t queue_size,
diff --git a/hw/block/vhost-user-blk.c b/hw/block/vhost-user-blk.c
index a076b1e54d..2dd3d93ca0 100644
--- a/hw/block/vhost-user-blk.c
+++ b/hw/block/vhost-user-blk.c
@@ -131,6 +131,12 @@ static int vhost_user_blk_start(VirtIODevice *vdev)
 
     s->dev.acked_features = vdev->guest_features;
 
+    ret = vhost_dev_prepare_inflight(&s->dev, vdev);
+    if (ret < 0) {
+        error_report("Error set inflight format: %d", -ret);
+        goto err_guest_notifiers;
+    }
+
     if (!s->inflight->addr) {
         ret = vhost_dev_get_inflight(&s->dev, s->queue_size, s->inflight);
         if (ret < 0) {
diff --git a/hw/virtio/vhost.c b/hw/virtio/vhost.c
index 79b2be20df..614ccc2bcb 100644
--- a/hw/virtio/vhost.c
+++ b/hw/virtio/vhost.c
@@ -1645,6 +1645,26 @@ int vhost_dev_load_inflight(struct vhost_inflight *inflight, QEMUFile *f)
     return 0;
 }
 
+int vhost_dev_prepare_inflight(struct vhost_dev *hdev, VirtIODevice *vdev)
+{
+    int r;
+
+    if (hdev->vhost_ops->vhost_get_inflight_fd == NULL ||
+        hdev->vhost_ops->vhost_set_inflight_fd == NULL) {
+        return 0;
+    }
+
+    hdev->vdev = vdev;
+
+    r = vhost_dev_set_features(hdev, hdev->log_enabled);
+    if (r < 0) {
+        VHOST_OPS_DEBUG("vhost_dev_prepare_inflight failed");
+        return r;
+    }
+
+    return 0;
+}
+
 int vhost_dev_set_inflight(struct vhost_dev *dev,
                            struct vhost_inflight *inflight)
 {
-- 
MST


