Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EABD4D0B87
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 23:55:23 +0100 (CET)
Received: from localhost ([::1]:48254 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRMGA-0000aY-Bl
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 17:55:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52856)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nRM6l-00079F-2g
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 17:45:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:44676)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nRM6j-0005YV-9M
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 17:45:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646693136;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=JMuvtu5n6lVU0KTov6tttqgUMeVGZs5d6LsC2M1zLP4=;
 b=WxpzfPzQjEbz9apgDruyOL9GWCDmpZdL7H9PaafI3fQ48Qh/s7HHGzGx4O64+6XJPGM40x
 R32bd3zWBOkg1E91dodPZQ0H/nQxpybi1i8nwHBkuYVEc7nfyGmUfl3D61J/ljrZ1ekoNY
 Ih5wqKFKLBL9Q/2PHKxsgG86it65nYE=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-235-l1HbBBJnOg6Yju-nFZEx0w-1; Mon, 07 Mar 2022 17:45:35 -0500
X-MC-Unique: l1HbBBJnOg6Yju-nFZEx0w-1
Received: by mail-wm1-f72.google.com with SMTP id
 c19-20020a05600c0ad300b00385bb3db625so257254wmr.4
 for <qemu-devel@nongnu.org>; Mon, 07 Mar 2022 14:45:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=JMuvtu5n6lVU0KTov6tttqgUMeVGZs5d6LsC2M1zLP4=;
 b=h/l2NiIIsykCM9BKDDo10gp0pyGQeVB/GRD71RbCSRaVjQWtuSeJfSnwaoGzX9QFUf
 qSyefeLUunxpZmD1zEWLVAa9wRXSgUNMdpot1g4NRekFYpHyrwWgbITOkwhPj5Y9tT2i
 7ujn9WvZ2fpdVxR1r2hHH9l3SwagvDLXbI//0QZfzezxuhWb90MICjtsr598ira5mpfL
 BvdkrD8rpDmzJuKPt/8Vz4v1xp3nOpvrMwHgqtW+dOdz4QzM4vWHXfzZCDnzUAEZVDsu
 qv6c+pYqRv5LMlZo+utPiSr42s1mYCYoBYZV/bdJobRI1PR4xVPWEnA5khSAB6sQrKLc
 DQYw==
X-Gm-Message-State: AOAM533HYfkxqre7Zcyg4/+RtnlmrjljwcAd7UJ7tnoK/E20drykpYN2
 lMsz6UWe8hYnl1mmYkCfDn9BuP6tI3JCFfo93IRH64re2FOGKdbrW4YiKNllCcdlaEm6D6bwJ40
 Wf9BD0CC2quwz7ra/6aL7eGakSGfWc5crsboAJtMiiKbfw4zVa4cjgjB+boyJ
X-Received: by 2002:a05:6000:1549:b0:1f1:e566:eb87 with SMTP id
 9-20020a056000154900b001f1e566eb87mr8224936wry.87.1646693134260; 
 Mon, 07 Mar 2022 14:45:34 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxXvYljVKBc0F3vp2xlIQ9BYr3eTpyI/pwSXE60ZQ92xuCg6DF2/2bThMgByiEph+8EnLmd4g==
X-Received: by 2002:a05:6000:1549:b0:1f1:e566:eb87 with SMTP id
 9-20020a056000154900b001f1e566eb87mr8224922wry.87.1646693133943; 
 Mon, 07 Mar 2022 14:45:33 -0800 (PST)
Received: from redhat.com ([2.55.138.228]) by smtp.gmail.com with ESMTPSA id
 r188-20020a1c2bc5000000b00387c81c32e7sm555903wmr.8.2022.03.07.14.45.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Mar 2022 14:45:33 -0800 (PST)
Date: Mon, 7 Mar 2022 17:45:31 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v4 19/47] virtio-iommu: Support bypass domain
Message-ID: <20220307224357.682101-20-mst@redhat.com>
References: <20220307224357.682101-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220307224357.682101-1-mst@redhat.com>
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Cornelia Huck <cohuck@redhat.com>,
 Eric Auger <eric.auger@redhat.com>,
 Jean-Philippe Brucker <jean-philippe@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Jean-Philippe Brucker <jean-philippe@linaro.org>

The driver can create a bypass domain by passing the
VIRTIO_IOMMU_ATTACH_F_BYPASS flag on the ATTACH request. Bypass domains
perform slightly better than domains with identity mappings since they
skip translation.

Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
Message-Id: <20220214124356.872985-4-jean-philippe@linaro.org>
Acked-by: Cornelia Huck <cohuck@redhat.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
Tested-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/virtio/virtio-iommu.c | 39 ++++++++++++++++++++++++++++++++++-----
 1 file changed, 34 insertions(+), 5 deletions(-)

diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c
index 4ca36db4ac..239fe97b12 100644
--- a/hw/virtio/virtio-iommu.c
+++ b/hw/virtio/virtio-iommu.c
@@ -43,6 +43,7 @@
 
 typedef struct VirtIOIOMMUDomain {
     uint32_t id;
+    bool bypass;
     GTree *mappings;
     QLIST_HEAD(, VirtIOIOMMUEndpoint) endpoint_list;
 } VirtIOIOMMUDomain;
@@ -258,12 +259,16 @@ static void virtio_iommu_put_endpoint(gpointer data)
 }
 
 static VirtIOIOMMUDomain *virtio_iommu_get_domain(VirtIOIOMMU *s,
-                                                  uint32_t domain_id)
+                                                  uint32_t domain_id,
+                                                  bool bypass)
 {
     VirtIOIOMMUDomain *domain;
 
     domain = g_tree_lookup(s->domains, GUINT_TO_POINTER(domain_id));
     if (domain) {
+        if (domain->bypass != bypass) {
+            return NULL;
+        }
         return domain;
     }
     domain = g_malloc0(sizeof(*domain));
@@ -271,6 +276,7 @@ static VirtIOIOMMUDomain *virtio_iommu_get_domain(VirtIOIOMMU *s,
     domain->mappings = g_tree_new_full((GCompareDataFunc)interval_cmp,
                                    NULL, (GDestroyNotify)g_free,
                                    (GDestroyNotify)g_free);
+    domain->bypass = bypass;
     g_tree_insert(s->domains, GUINT_TO_POINTER(domain_id), domain);
     QLIST_INIT(&domain->endpoint_list);
     trace_virtio_iommu_get_domain(domain_id);
@@ -334,11 +340,16 @@ static int virtio_iommu_attach(VirtIOIOMMU *s,
 {
     uint32_t domain_id = le32_to_cpu(req->domain);
     uint32_t ep_id = le32_to_cpu(req->endpoint);
+    uint32_t flags = le32_to_cpu(req->flags);
     VirtIOIOMMUDomain *domain;
     VirtIOIOMMUEndpoint *ep;
 
     trace_virtio_iommu_attach(domain_id, ep_id);
 
+    if (flags & ~VIRTIO_IOMMU_ATTACH_F_BYPASS) {
+        return VIRTIO_IOMMU_S_INVAL;
+    }
+
     ep = virtio_iommu_get_endpoint(s, ep_id);
     if (!ep) {
         return VIRTIO_IOMMU_S_NOENT;
@@ -356,7 +367,12 @@ static int virtio_iommu_attach(VirtIOIOMMU *s,
         }
     }
 
-    domain = virtio_iommu_get_domain(s, domain_id);
+    domain = virtio_iommu_get_domain(s, domain_id,
+                                     flags & VIRTIO_IOMMU_ATTACH_F_BYPASS);
+    if (!domain) {
+        /* Incompatible bypass flag */
+        return VIRTIO_IOMMU_S_INVAL;
+    }
     QLIST_INSERT_HEAD(&domain->endpoint_list, ep, next);
 
     ep->domain = domain;
@@ -419,6 +435,10 @@ static int virtio_iommu_map(VirtIOIOMMU *s,
         return VIRTIO_IOMMU_S_NOENT;
     }
 
+    if (domain->bypass) {
+        return VIRTIO_IOMMU_S_INVAL;
+    }
+
     interval = g_malloc0(sizeof(*interval));
 
     interval->low = virt_start;
@@ -464,6 +484,11 @@ static int virtio_iommu_unmap(VirtIOIOMMU *s,
     if (!domain) {
         return VIRTIO_IOMMU_S_NOENT;
     }
+
+    if (domain->bypass) {
+        return VIRTIO_IOMMU_S_INVAL;
+    }
+
     interval.low = virt_start;
     interval.high = virt_end;
 
@@ -780,6 +805,9 @@ static IOMMUTLBEntry virtio_iommu_translate(IOMMUMemoryRegion *mr, hwaddr addr,
             entry.perm = flag;
         }
         goto unlock;
+    } else if (ep->domain->bypass) {
+        entry.perm = flag;
+        goto unlock;
     }
 
     found = g_tree_lookup_extended(ep->domain->mappings, (gpointer)(&interval),
@@ -1139,8 +1167,8 @@ static const VMStateDescription vmstate_endpoint = {
 
 static const VMStateDescription vmstate_domain = {
     .name = "domain",
-    .version_id = 1,
-    .minimum_version_id = 1,
+    .version_id = 2,
+    .minimum_version_id = 2,
     .pre_load = domain_preload,
     .fields = (VMStateField[]) {
         VMSTATE_UINT32(id, VirtIOIOMMUDomain),
@@ -1149,6 +1177,7 @@ static const VMStateDescription vmstate_domain = {
                         VirtIOIOMMUInterval, VirtIOIOMMUMapping),
         VMSTATE_QLIST_V(endpoint_list, VirtIOIOMMUDomain, 1,
                         vmstate_endpoint, VirtIOIOMMUEndpoint, next),
+        VMSTATE_BOOL_V(bypass, VirtIOIOMMUDomain, 2),
         VMSTATE_END_OF_LIST()
     }
 };
@@ -1186,7 +1215,7 @@ static const VMStateDescription vmstate_virtio_iommu_device = {
     .version_id = 2,
     .post_load = iommu_post_load,
     .fields = (VMStateField[]) {
-        VMSTATE_GTREE_DIRECT_KEY_V(domains, VirtIOIOMMU, 1,
+        VMSTATE_GTREE_DIRECT_KEY_V(domains, VirtIOIOMMU, 2,
                                    &vmstate_domain, VirtIOIOMMUDomain),
         VMSTATE_UINT8_V(config.bypass, VirtIOIOMMU, 2),
         VMSTATE_END_OF_LIST()
-- 
MST


