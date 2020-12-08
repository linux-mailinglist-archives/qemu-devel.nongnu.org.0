Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E5D402D32F3
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 21:03:52 +0100 (CET)
Received: from localhost ([::1]:41240 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmjDD-00006J-UW
	for lists+qemu-devel@lfdr.de; Tue, 08 Dec 2020 15:03:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49394)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kmilv-000628-Fl
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 14:35:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41123)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kmilt-0005LF-Q6
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 14:35:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607456136;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/3+qUeIA+zTj+aCO/5vf0lMi8Wl7ZhxONweA15S3yAs=;
 b=V9rGh0r7+xNHNsl5JZxq6ne2PAsHC3IEsXAQ4CJGjq9ymikcgwMV7R+eBPK60zuzOJYdqu
 a+C8QM6nFr6X5p4hGDVPnWiPMeKC4PEjToEtPm/3t6pCChSuejAqH6eIhKAlQ1MMERQbqa
 Z7Pw0Xj9a1+B1cTtgyRkUaaVocJbPW8=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-391-FGjozLV5NWKgaSg-E-_91g-1; Tue, 08 Dec 2020 14:35:35 -0500
X-MC-Unique: FGjozLV5NWKgaSg-E-_91g-1
Received: by mail-wr1-f69.google.com with SMTP id m2so6631746wro.1
 for <qemu-devel@nongnu.org>; Tue, 08 Dec 2020 11:35:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=/3+qUeIA+zTj+aCO/5vf0lMi8Wl7ZhxONweA15S3yAs=;
 b=K+o2Hr4z2L9Bndd88pubpjRpogLHPvNVX1ClGfIJPUP2M2u0fHEvKGSJL/daAknAz6
 oLlYUWB0/pdTyg9c/+YBzi6XTUKTmTDO6bgY45zOzfO1JhgLlrHgEEFOgTjeeaPvCbbJ
 vhovq83O+3uqqCORUQdsXfx8t0JxNEMbvr3At/JyDwhvnC8attg9RIJfq3XJE2MSDZZF
 Y9WY3dLXW/1VVbFYKNHLi5fDB09epR990DXUrds9TuhckzJukVajlsknPZ73oytGynlx
 3fBBPLN3Rkznyn1w099eQPHoFkszT/66LM1t6aYx3D7/c/6DQ5pGMJHMpW9RotlKyAus
 a3hA==
X-Gm-Message-State: AOAM533xbdzDCQLavn4w6ANV1jrxmva6IKT5kE4xzMi4WJW81JPQ8vm4
 OYrcwZNPTPj0gqq9KDKy9ENg7ah/FHMYfNCrPRleDdSB1q+4O2sk7w1/iYbreXsFfI6ePpSbUpE
 XfRCLM5dTt7BBs15g8S2ajEo34ipX5bDj0woHcEto+vI71f0NEK7Ft2x/gq0b
X-Received: by 2002:a1c:1c1:: with SMTP id 184mr5176411wmb.112.1607456133628; 
 Tue, 08 Dec 2020 11:35:33 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxlLGwaOiMMIyBQRES+T3u6g6fT5qGxe/pcxCsHLneYmzwPFiw7z1rNHo62if7PVai2bZ+I3A==
X-Received: by 2002:a1c:1c1:: with SMTP id 184mr5176389wmb.112.1607456133347; 
 Tue, 08 Dec 2020 11:35:33 -0800 (PST)
Received: from redhat.com (bzq-79-176-44-197.red.bezeqint.net. [79.176.44.197])
 by smtp.gmail.com with ESMTPSA id q16sm21803795wrn.13.2020.12.08.11.35.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Dec 2020 11:35:32 -0800 (PST)
Date: Tue, 8 Dec 2020 14:35:29 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 33/66] failover: Rename to failover_find_primary_device()
Message-ID: <20201208193307.646726-34-mst@redhat.com>
References: <20201208193307.646726-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201208193307.646726-1-mst@redhat.com>
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
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Juan Quintela <quintela@redhat.com>

This commit:
* Rename them to failover_find_primary_devices() so
  - it starts with failover_
  - it don't connect anything, just find the primary device
* Create documentation for the function

Signed-off-by: Juan Quintela <quintela@redhat.com>
Message-Id: <20201118083748.1328-19-quintela@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/net/virtio-net.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
index c6200b924e..ff82f1017d 100644
--- a/hw/net/virtio-net.c
+++ b/hw/net/virtio-net.c
@@ -826,7 +826,13 @@ static int is_my_primary(void *opaque, QemuOpts *opts, Error **errp)
     return ret;
 }
 
-static DeviceState *virtio_net_find_primary(VirtIONet *n, Error **errp)
+/**
+ * Find the primary device for this failover virtio-net
+ *
+ * @n: VirtIONet device
+ * @errp: returns an error if this function fails
+ */
+static DeviceState *failover_find_primary_device(VirtIONet *n, Error **errp)
 {
     Error *err = NULL;
 
@@ -891,7 +897,7 @@ static void virtio_net_set_features(VirtIODevice *vdev, uint64_t features)
         qatomic_set(&n->failover_primary_hidden, false);
         failover_add_primary(n, &err);
         if (err) {
-            n->primary_dev = virtio_net_find_primary(n, &err);
+            n->primary_dev = failover_find_primary_device(n, &err);
             if (err) {
                 goto out_err;
             }
@@ -3115,7 +3121,7 @@ static void virtio_net_handle_migration_primary(VirtIONet *n,
     should_be_hidden = qatomic_read(&n->failover_primary_hidden);
 
     if (!n->primary_dev) {
-        n->primary_dev = virtio_net_find_primary(n, &err);
+        n->primary_dev = failover_find_primary_device(n, &err);
         if (!n->primary_dev) {
             return;
         }
-- 
MST


