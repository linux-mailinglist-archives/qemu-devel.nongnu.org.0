Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BCAC348A198
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Jan 2022 22:14:01 +0100 (CET)
Received: from localhost ([::1]:50010 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n71zM-0008PU-QS
	for lists+qemu-devel@lfdr.de; Mon, 10 Jan 2022 16:14:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41326)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n71rS-0007x4-I0
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 16:05:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:41790)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n71rO-0004aj-G0
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 16:05:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641848712;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qOwvnPS0tFGGKbP3ny4Wc98smh67WP4F4eYZ8L2rGtg=;
 b=YWH9/z6BmhkacMAQnnF9Ez+H01phi6hBXF4Z2A4Xsk3bYMFfFPj2kpnFR9nwivpZQOILxc
 dbQnhojt6sb6WV5u/8lmlIbPXaI/uKgEIxJ0lbEC3kA7PDojwm/WZGFIVFWrodICi4cOno
 oJlU67ZPK5NchZyC7aAkBefUHWxcPb0=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-83-wwvc-r0jMmO2utYT93PFkQ-1; Mon, 10 Jan 2022 16:05:09 -0500
X-MC-Unique: wwvc-r0jMmO2utYT93PFkQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 v23-20020a05600c215700b0034566adb612so2652916wml.0
 for <qemu-devel@nongnu.org>; Mon, 10 Jan 2022 13:05:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=qOwvnPS0tFGGKbP3ny4Wc98smh67WP4F4eYZ8L2rGtg=;
 b=qUilQSeCfarnE3ajEyXLx0LeI6Q2kspAVyh9t4/p/g5MIlV0mBX65c7RZf+axDej48
 bLX627BaM2+Cj5yKDsemzkXBd0JhBvPO/LJQcjlSDpnJU46O6B8gOpEHlEkNmua55cp+
 3cQSdOoORrsMdo0Sn1HrnrGBD7b3a82AQPqxIks2cSW5AWvFjSKVjYqnM1GtMqvxY9z4
 NyLRvAFO4Uj1skZ0hu7U+AOwPnMj7ViZA7ta1agbpCtxV+UZPrAs3aA8Ejc3F+IP9rD1
 pvj7e4BYBe6uO4SDEuwH3guxLOJoNaRF4pwsqk2+8zfJutj5k/7QHzP/NNGDI/e9b/sm
 leYQ==
X-Gm-Message-State: AOAM5313kUnspNw55U+lMAsPLv2R3Q8S79F3EtRhAqdN29ja8skELoh/
 adxBkR+w/UIpwaYm6SzVCj9q8VcIp4+/8nKhi6zif4lOJNLrsjhBQIk2/w2SlnDj2Mazp7ttx8D
 USqsEMaCb6uvFZfvNTsJ1piY6kbEc1EAoiriCQgCsVaQ3rnhTOX1eeMD9VAQC
X-Received: by 2002:a05:600c:3b18:: with SMTP id
 m24mr1057127wms.4.1641848707359; 
 Mon, 10 Jan 2022 13:05:07 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxBmIELuNI1t093fptzwWzSFkzZC/eH1l5wlIrsMkC1tUy3LACofZCk2XFpNc5dXU9A/5OWKw==
X-Received: by 2002:a05:600c:3b18:: with SMTP id
 m24mr1057111wms.4.1641848707088; 
 Mon, 10 Jan 2022 13:05:07 -0800 (PST)
Received: from redhat.com ([2.55.19.241])
 by smtp.gmail.com with ESMTPSA id g18sm8588183wmq.5.2022.01.10.13.05.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Jan 2022 13:05:06 -0800 (PST)
Date: Mon, 10 Jan 2022 16:05:04 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 07/10] Revert "vhost: introduce new VhostOps
 vhost_set_config_call"
Message-ID: <20220110210416.18779-8-mst@redhat.com>
References: <20220110210416.18779-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220110210416.18779-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.597,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Cindy Lu <lulu@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This reverts commit 88062372340d33090b7f089ed3b1a00f530a8914.

Fixes: 8806237234 ("vhost: introduce new VhostOps vhost_set_config_call")
Cc: "Cindy Lu" <lulu@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/hw/virtio/vhost-backend.h | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/include/hw/virtio/vhost-backend.h b/include/hw/virtio/vhost-backend.h
index ff34eb7c8a..81bf3109f8 100644
--- a/include/hw/virtio/vhost-backend.h
+++ b/include/hw/virtio/vhost-backend.h
@@ -126,8 +126,6 @@ typedef int (*vhost_get_device_id_op)(struct vhost_dev *dev, uint32_t *dev_id);
 
 typedef bool (*vhost_force_iommu_op)(struct vhost_dev *dev);
 
-typedef int (*vhost_set_config_call_op)(struct vhost_dev *dev,
-                                       int fd);
 typedef struct VhostOps {
     VhostBackendType backend_type;
     vhost_backend_init vhost_backend_init;
@@ -173,7 +171,6 @@ typedef struct VhostOps {
     vhost_vq_get_addr_op  vhost_vq_get_addr;
     vhost_get_device_id_op vhost_get_device_id;
     vhost_force_iommu_op vhost_force_iommu;
-    vhost_set_config_call_op vhost_set_config_call;
 } VhostOps;
 
 int vhost_backend_update_device_iotlb(struct vhost_dev *dev,
-- 
MST


