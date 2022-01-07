Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AE2D487642
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Jan 2022 12:09:24 +0100 (CET)
Received: from localhost ([::1]:42834 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5n7b-0007SR-DY
	for lists+qemu-devel@lfdr.de; Fri, 07 Jan 2022 06:09:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44756)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n5n1x-0006dM-Ut
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 06:03:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:30446)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n5n1w-0001ks-Do
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 06:03:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641553411;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Gv52akJFHQiv170C8mObbPapN00kjPRMbnaS61dDiXs=;
 b=CRVrvz/xsLGrNtHPTR10W8ZxDQfqGfLkFY32yVlmyubCBxPurNkoMU3Y9PI7q8mG9GmX1K
 d5H+C8aAV+e4D6Ch+EM/K3/HBgGIXsWURJw2FhhE45q4CpgFUnCUZzsHCC9Tk8gIuWgFD4
 WO4yd4XyQfKmodXmU5Z+VO/+kMa4wr8=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-13-ldPrOLCfMkWGZS6RhFf93g-1; Fri, 07 Jan 2022 06:03:31 -0500
X-MC-Unique: ldPrOLCfMkWGZS6RhFf93g-1
Received: by mail-wm1-f72.google.com with SMTP id
 m15-20020a05600c3b0f00b003465ede5e04so1349786wms.2
 for <qemu-devel@nongnu.org>; Fri, 07 Jan 2022 03:03:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Gv52akJFHQiv170C8mObbPapN00kjPRMbnaS61dDiXs=;
 b=4dcgHtJ8WebbrQxSNBdAkUznL3uZ8ktiWNiamYQVmgD0m+GTlySiSakONm576gj8Ok
 MVx2DiO0OzoNqr+83cqyd0gOVVf+a5Cb4PACwJBg/jhNbP0TzzUmR2pDUhYyQo3jLTgW
 H6pDIVEzJ7fKnOjy8FkVhKCZDaZJHwWHgKAztEUue1kmllS1uqSjE8MKJXEExZkeyVu3
 BTV8MNbMFObN4nSEZb3w1Vp0eadj+iYq/HKOXQf/ghx1B3MPqNX+Vnpao/YVkDVw0/0K
 1jSNxAg1Sq0xB6KbHL/bTD2blula3sp7m5gQt5T0B330e82w50qW3BLNIkIVB0Uu1MKT
 W9eQ==
X-Gm-Message-State: AOAM531Z/RwoYxnme+rZdBfbmiMLFV2tD3gph5neCy5avXh3mWEQTLIu
 SxZ+yT9h1ouE3ZrcrQhuws2eYuVpMZCYxHw9tL1TT17QsAj8fkUUOU53Q6g63pidqt2WtjqH/vS
 NJQpzyE2TDJf2PW0XSJbDd6Jc/gzFl+/QNLaB1PM7EDJTm+vnhanQBtgIjZEg
X-Received: by 2002:a7b:c0ce:: with SMTP id s14mr10724503wmh.135.1641553409425; 
 Fri, 07 Jan 2022 03:03:29 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwHpIyG0Xjumrt1f/H9n8R5doq1sTMF/zenriTPQQN0wT1VVDXo2pGoRruKm+1efrKEsbTsbg==
X-Received: by 2002:a7b:c0ce:: with SMTP id s14mr10724481wmh.135.1641553409163; 
 Fri, 07 Jan 2022 03:03:29 -0800 (PST)
Received: from redhat.com ([2.55.16.192])
 by smtp.gmail.com with ESMTPSA id 5sm4549260wrb.77.2022.01.07.03.03.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jan 2022 03:03:28 -0800 (PST)
Date: Fri, 7 Jan 2022 06:03:26 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 07/55] vhost-vdpa: add support for config interrupt
Message-ID: <20220107102526.39238-8-mst@redhat.com>
References: <20220107102526.39238-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220107102526.39238-1-mst@redhat.com>
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
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.372,
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

From: Cindy Lu <lulu@redhat.com>

Add new call back function in vhost-vdpa, this function will
set the event fd to kernel. This function will be called
in the vhost_dev_start and vhost_dev_stop

Signed-off-by: Cindy Lu <lulu@redhat.com>
Message-Id: <20211104164827.21911-6-lulu@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/virtio/vhost-vdpa.c | 7 +++++++
 hw/virtio/trace-events | 1 +
 2 files changed, 8 insertions(+)

diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
index bcaf00e09f..0a4a83713c 100644
--- a/hw/virtio/vhost-vdpa.c
+++ b/hw/virtio/vhost-vdpa.c
@@ -725,6 +725,12 @@ static int vhost_vdpa_set_vring_call(struct vhost_dev *dev,
     trace_vhost_vdpa_set_vring_call(dev, file->index, file->fd);
     return vhost_vdpa_call(dev, VHOST_SET_VRING_CALL, file);
 }
+static int vhost_vdpa_set_config_call(struct vhost_dev *dev,
+                                       int fd)
+{
+    trace_vhost_vdpa_set_config_call(dev, fd);
+    return vhost_vdpa_call(dev, VHOST_VDPA_SET_CONFIG_CALL, &fd);
+}
 
 static int vhost_vdpa_get_features(struct vhost_dev *dev,
                                      uint64_t *features)
@@ -795,4 +801,5 @@ const VhostOps vdpa_ops = {
         .vhost_get_device_id = vhost_vdpa_get_device_id,
         .vhost_vq_get_addr = vhost_vdpa_vq_get_addr,
         .vhost_force_iommu = vhost_vdpa_force_iommu,
+        .vhost_set_config_call = vhost_vdpa_set_config_call,
 };
diff --git a/hw/virtio/trace-events b/hw/virtio/trace-events
index f7ad6be5fb..595ce015ff 100644
--- a/hw/virtio/trace-events
+++ b/hw/virtio/trace-events
@@ -53,6 +53,7 @@ vhost_vdpa_get_features(void *dev, uint64_t features) "dev: %p features: 0x%"PRI
 vhost_vdpa_set_owner(void *dev) "dev: %p"
 vhost_vdpa_vq_get_addr(void *dev, void *vq, uint64_t desc_user_addr, uint64_t avail_user_addr, uint64_t used_user_addr) "dev: %p vq: %p desc_user_addr: 0x%"PRIx64" avail_user_addr: 0x%"PRIx64" used_user_addr: 0x%"PRIx64
 vhost_vdpa_get_iova_range(void *dev, uint64_t first, uint64_t last) "dev: %p first: 0x%"PRIx64" last: 0x%"PRIx64
+vhost_vdpa_set_config_call(void *dev, int fd)"dev: %p fd: %d"
 
 # virtio.c
 virtqueue_alloc_element(void *elem, size_t sz, unsigned in_num, unsigned out_num) "elem %p size %zd in_num %u out_num %u"
-- 
MST


