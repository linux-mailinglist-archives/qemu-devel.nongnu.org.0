Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AF734CD635
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Mar 2022 15:18:53 +0100 (CET)
Received: from localhost ([::1]:34968 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQ8lg-0007yV-6d
	for lists+qemu-devel@lfdr.de; Fri, 04 Mar 2022 09:18:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56428)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nQ8AQ-0002lD-77
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 08:40:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:39965)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nQ8AO-0000rO-EC
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 08:40:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646401219;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=JMuvtu5n6lVU0KTov6tttqgUMeVGZs5d6LsC2M1zLP4=;
 b=EavHM9Ty3hdmkRuT8a6z5d6mxPhD4GdrY0l3543qJiD6cAHUb8tQfnGGMVyr4YCoaHAJdr
 HWiCQOQ+nN71QvDma7/ZyVCo5HRLrbvLe/gWCUKUus5ucHh7f/FCYWDEIFZEKASsu+Bu61
 GxwbGCwYLszipWV3STRT5rBx0+XKLy0=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-641-ySDVolVUOjKLng1n6Faycg-1; Fri, 04 Mar 2022 08:40:19 -0500
X-MC-Unique: ySDVolVUOjKLng1n6Faycg-1
Received: by mail-wm1-f69.google.com with SMTP id
 o207-20020a1ca5d8000000b0038977354e75so803002wme.1
 for <qemu-devel@nongnu.org>; Fri, 04 Mar 2022 05:40:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=JMuvtu5n6lVU0KTov6tttqgUMeVGZs5d6LsC2M1zLP4=;
 b=5scSBoKAeWx2/XRbAXUOhokxq+x1ztDVu8AtrERf3ED1Hj2VhOtozIMwLiq5P2wXCY
 BoVUsJwvsT6znBPBJUBYX85m6m4u3GilDIzkAcqiUDfN4lpuK/9RmL4OBn+Gh3DrBVRx
 5pMXi0HgPMsMa0ADKLMCicBaLOM06Jrw/0QbybmqhFBLZ4vrrdxiQCzts4rD5VfFK5EF
 RwNppKgLiQDfd10ZzFmgU2dsYVuGgI7UJT1JOseAhTEdrFgYjtiWgJwS6bbh7OmfbO/c
 Qa8PiBwp9rRlWhMRLhFvi3Ybm3YR5WXRlY6D6Vnh8FmnwqkJGnB8hK2YXFjW4fjWvPou
 RdLw==
X-Gm-Message-State: AOAM5333Xi/SYEPMreJydR6hYYs4rIXwdDzUtSftvGvHwpUb876NHn/V
 RNsBTwvQGcwMYjQLvZwj/67ew57M6iNFX6+YgCMGq9PD6NoOltYM+nJZsRxkbeLNAWq0dFHeJQz
 z2Y33WRLUnTyiPa5T7OlGuk9Cl5N4f8wp8UDngn+Ld0UaI2EoILKE2o+dqrlG
X-Received: by 2002:adf:dcc2:0:b0:1f0:4c38:d6be with SMTP id
 x2-20020adfdcc2000000b001f04c38d6bemr6312408wrm.79.1646401217217; 
 Fri, 04 Mar 2022 05:40:17 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyia2OmWpG9F9/9geucx930yD5x93em/O8xL5P332HKB8quo8c6zdpcQHND9qGhyAgzXiqUbw==
X-Received: by 2002:adf:dcc2:0:b0:1f0:4c38:d6be with SMTP id
 x2-20020adfdcc2000000b001f04c38d6bemr6312387wrm.79.1646401216913; 
 Fri, 04 Mar 2022 05:40:16 -0800 (PST)
Received: from redhat.com ([2.52.16.157]) by smtp.gmail.com with ESMTPSA id
 r1-20020a5d4941000000b001ed89dcacbbsm4598790wrs.23.2022.03.04.05.40.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Mar 2022 05:40:15 -0800 (PST)
Date: Fri, 4 Mar 2022 08:40:12 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 23/45] virtio-iommu: Support bypass domain
Message-ID: <20220304133556.233983-24-mst@redhat.com>
References: <20220304133556.233983-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220304133556.233983-1-mst@redhat.com>
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
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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


