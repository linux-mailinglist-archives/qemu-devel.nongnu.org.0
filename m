Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 85F394890FE
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Jan 2022 08:28:30 +0100 (CET)
Received: from localhost ([::1]:34990 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6p6Q-00068j-DQ
	for lists+qemu-devel@lfdr.de; Mon, 10 Jan 2022 02:28:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34622)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n6ouo-0007Qs-Az
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 02:16:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:32994)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n6oum-0001o5-Pt
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 02:16:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641798984;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8WiqLc6NYHaR8eZg0R3KMpJyibUx99d+NRMkU4YwbkE=;
 b=SFlTMdfNshXRKM5bB6tNaKB30UiPQ6oCZhxnzy++e9EJQe6gHp5kjNhQP2v4rFVngpq2vA
 z+h5QRDxmS2qBW1ipjGMphbjLE1SOEeFatWEjtkwiQ83yz9/JwM63MVrTDCsz0DlsFo+fc
 WSH/WD1Q2MLBQKEwt9mCbMcPH7KaAco=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-625-KOSMfLO4NEKwzW8wr6Kr_g-1; Mon, 10 Jan 2022 02:16:23 -0500
X-MC-Unique: KOSMfLO4NEKwzW8wr6Kr_g-1
Received: by mail-wm1-f69.google.com with SMTP id
 r2-20020a05600c35c200b00345c3b82b22so8454021wmq.0
 for <qemu-devel@nongnu.org>; Sun, 09 Jan 2022 23:16:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=8WiqLc6NYHaR8eZg0R3KMpJyibUx99d+NRMkU4YwbkE=;
 b=s1MIVriAdmEqaNCeJwK8W3Z0tdI5acqzb58SC4S2DVJVau/RkNqWC+w2f5lfkdvujR
 VKyS86B7cD0ZimFDa9eKVkHvCNRC6naZaKM7kc+PwuYuyF1P+JDiiUGMiw75f+CMxSJd
 RQwXt8yiolpVq69kUvPYUi2ZcJ+96n7c8fEw1JigoLMtHTPBc3NzTw+L5H2wgwYH/nM6
 ulnPhWPPZoreIzXjseBD0XhJHrsRz2qUOSjTvzYSm+gVkoHRJ1QhQoq0j1WcHTS7Vobi
 z9SBnWj4yeNeBTbgPS3Ao+o5c2v15AcE6K60UxyiscPqenbDLW1WnE/MYzXNrouF4New
 DayQ==
X-Gm-Message-State: AOAM531KaTwOTsYMvN9+iaXwUO5wcSAkc5lhb/kMLGjxN/tkLE4zn5nR
 N94IFGhnxOYVT7vCo8aljApcQqzSTKD+oKiWJBuDyin1GF2OFJURPZpAoE5SN+PofexSoNKcMO/
 DRa/qNGyTMjq/CBLDO07hJgmTdEw0aOZ7zATr3dEJGP0y88Z4BsH4JwSvN44m
X-Received: by 2002:a05:6000:178c:: with SMTP id
 e12mr63557515wrg.563.1641798981613; 
 Sun, 09 Jan 2022 23:16:21 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz5pI+qwY1+o8g0kzYQgTwWZuILvRPh7CP1SgpwPpADvutv6ZASWo+zZRVcwiucYgjC398waQ==
X-Received: by 2002:a05:6000:178c:: with SMTP id
 e12mr63557507wrg.563.1641798981398; 
 Sun, 09 Jan 2022 23:16:21 -0800 (PST)
Received: from redhat.com ([2a03:c5c0:107d:b60c:c297:16fe:7528:e989])
 by smtp.gmail.com with ESMTPSA id z4sm1803530wmf.44.2022.01.09.23.16.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Jan 2022 23:16:20 -0800 (PST)
Date: Mon, 10 Jan 2022 02:16:18 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 06/10] Revert "vhost-vdpa: add support for config interrupt"
Message-ID: <20220110071547.195669-7-mst@redhat.com>
References: <20220110071547.195669-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220110071547.195669-1-mst@redhat.com>
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
Cc: Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This reverts commit 634f7c89fbd78f57d00d5d6b39c0ade9df1fe27f.
---
 hw/virtio/vhost-vdpa.c | 7 -------
 hw/virtio/trace-events | 1 -
 2 files changed, 8 deletions(-)

diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
index ac0cb575fb..04ea43704f 100644
--- a/hw/virtio/vhost-vdpa.c
+++ b/hw/virtio/vhost-vdpa.c
@@ -734,12 +734,6 @@ static int vhost_vdpa_set_vring_call(struct vhost_dev *dev,
     trace_vhost_vdpa_set_vring_call(dev, file->index, file->fd);
     return vhost_vdpa_call(dev, VHOST_SET_VRING_CALL, file);
 }
-static int vhost_vdpa_set_config_call(struct vhost_dev *dev,
-                                       int fd)
-{
-    trace_vhost_vdpa_set_config_call(dev, fd);
-    return vhost_vdpa_call(dev, VHOST_VDPA_SET_CONFIG_CALL, &fd);
-}
 
 static int vhost_vdpa_get_features(struct vhost_dev *dev,
                                      uint64_t *features)
@@ -810,5 +804,4 @@ const VhostOps vdpa_ops = {
         .vhost_get_device_id = vhost_vdpa_get_device_id,
         .vhost_vq_get_addr = vhost_vdpa_vq_get_addr,
         .vhost_force_iommu = vhost_vdpa_force_iommu,
-        .vhost_set_config_call = vhost_vdpa_set_config_call,
 };
diff --git a/hw/virtio/trace-events b/hw/virtio/trace-events
index 595ce015ff..f7ad6be5fb 100644
--- a/hw/virtio/trace-events
+++ b/hw/virtio/trace-events
@@ -53,7 +53,6 @@ vhost_vdpa_get_features(void *dev, uint64_t features) "dev: %p features: 0x%"PRI
 vhost_vdpa_set_owner(void *dev) "dev: %p"
 vhost_vdpa_vq_get_addr(void *dev, void *vq, uint64_t desc_user_addr, uint64_t avail_user_addr, uint64_t used_user_addr) "dev: %p vq: %p desc_user_addr: 0x%"PRIx64" avail_user_addr: 0x%"PRIx64" used_user_addr: 0x%"PRIx64
 vhost_vdpa_get_iova_range(void *dev, uint64_t first, uint64_t last) "dev: %p first: 0x%"PRIx64" last: 0x%"PRIx64
-vhost_vdpa_set_config_call(void *dev, int fd)"dev: %p fd: %d"
 
 # virtio.c
 virtqueue_alloc_element(void *elem, size_t sz, unsigned in_num, unsigned out_num) "elem %p size %zd in_num %u out_num %u"
-- 
MST


