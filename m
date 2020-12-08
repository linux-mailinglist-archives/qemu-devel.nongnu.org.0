Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E029E2D32FE
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 21:11:35 +0100 (CET)
Received: from localhost ([::1]:34364 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmjKg-0000hr-Vx
	for lists+qemu-devel@lfdr.de; Tue, 08 Dec 2020 15:11:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49994)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kmims-00077D-Mp
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 14:36:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:25365)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kmimg-0005ej-Pc
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 14:36:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607456185;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bkqcL6Zyg/x8ymWrEnxQRMEnalGx2orBZXKaXR9zuFE=;
 b=LpWDLMOUdGnqVjKNuC3+Gi0jpiLG8MQ21Du/97C0uHQwRf7F/4Fl2OiDue89sdk2DrAYLy
 Fxu3faDl1+Rk5rF2EKeyKYifvahf+UAFOkaCe/tR/3kezJNh907yU392eTJEWUMe7PH05h
 ssLgwTIXidkil/l2TpJXnIRuQH8QrRI=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-301-b2CYHippPAOrOp9YzaaH0w-1; Tue, 08 Dec 2020 14:36:22 -0500
X-MC-Unique: b2CYHippPAOrOp9YzaaH0w-1
Received: by mail-wm1-f70.google.com with SMTP id f12so1275473wmf.6
 for <qemu-devel@nongnu.org>; Tue, 08 Dec 2020 11:36:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=bkqcL6Zyg/x8ymWrEnxQRMEnalGx2orBZXKaXR9zuFE=;
 b=R65DVAWVsNZf+UP6G7VwRH2iyWgWC1dwhgis5rcNnrYZmgBQRvjNIAEq87XeWK6G3F
 0iv7fVWJdCF4hkrgXorkS/lfAiguhw1lloKOxyz2cHk8jCIOzsVw2FGNORzdg2zFyBji
 KFprujQPVhFyX2AdIr8EOfHGk3ADOMDWuIV42Sixo7B7zJzt47kPVZmU+tM3518KJmSz
 V+sv+F6ikeQAfFdszEaj6QPY9F/L7be4oEJgJmMtd+5z2I2aBhYR7bLgbEe0zDTvInyp
 GWfTeuofRlYtl4lAwo1VbojdfVge/zrVzkaTU69s7qo7T/7KhBWQBrCN7uxW5jb/qn0r
 0xaQ==
X-Gm-Message-State: AOAM530pqKxB7Pgvkww4LX24LJEArNQLnW1xLjDysI8fMv+TjSDsHsXu
 d/R1IQTShkm8wdTp0qQ0vSM2OrqEAqkOu+8THuAqF/J/up1/p4XaIOB0nuF1eI/AHk+k46a0UpQ
 Ofw+9ybRO6T2SGwHEiHLc4nu1gzI1RBuc9GZFyq+m5Uu3UL3B4z8J/fbeuOsJ
X-Received: by 2002:a05:6000:11c1:: with SMTP id
 i1mr10364298wrx.16.1607456181070; 
 Tue, 08 Dec 2020 11:36:21 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzgZJfNeubpqSTO/duySzd6CKailLQ+STkLhG4a5ctu/Tvilyor1JUZl/sVJiy972mS9QbLOg==
X-Received: by 2002:a05:6000:11c1:: with SMTP id
 i1mr10364273wrx.16.1607456180833; 
 Tue, 08 Dec 2020 11:36:20 -0800 (PST)
Received: from redhat.com (bzq-79-176-44-197.red.bezeqint.net. [79.176.44.197])
 by smtp.gmail.com with ESMTPSA id g78sm5065354wme.33.2020.12.08.11.36.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Dec 2020 11:36:20 -0800 (PST)
Date: Tue, 8 Dec 2020 14:36:15 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 44/66] libvhost-user: replace qemu/bswap.h with glibc endian.h
Message-ID: <20201208193307.646726-45-mst@redhat.com>
References: <20201208193307.646726-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201208193307.646726-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Message-Id: <20201125100640.366523-2-marcandre.lureau@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 contrib/libvhost-user/libvhost-user.c | 77 ++++++++++++++-------------
 1 file changed, 40 insertions(+), 37 deletions(-)

diff --git a/contrib/libvhost-user/libvhost-user.c b/contrib/libvhost-user/libvhost-user.c
index 5c73ffdd6b..1c1cfbf1e7 100644
--- a/contrib/libvhost-user/libvhost-user.c
+++ b/contrib/libvhost-user/libvhost-user.c
@@ -26,6 +26,7 @@
 #include <sys/socket.h>
 #include <sys/eventfd.h>
 #include <sys/mman.h>
+#include <endian.h>
 #include "qemu/compiler.h"
 
 #if defined(__linux__)
@@ -42,7 +43,6 @@
 
 #include "qemu/atomic.h"
 #include "qemu/osdep.h"
-#include "qemu/bswap.h"
 #include "qemu/memfd.h"
 
 #include "libvhost-user.h"
@@ -1081,7 +1081,7 @@ vu_set_vring_addr_exec(VuDev *dev, VhostUserMsg *vmsg)
         return false;
     }
 
-    vq->used_idx = lduw_le_p(&vq->vring.used->idx);
+    vq->used_idx = le16toh(vq->vring.used->idx);
 
     if (vq->last_avail_idx != vq->used_idx) {
         bool resume = dev->iface->queue_is_processed_in_order &&
@@ -1198,7 +1198,7 @@ vu_check_queue_inflights(VuDev *dev, VuVirtq *vq)
         return 0;
     }
 
-    vq->used_idx = lduw_le_p(&vq->vring.used->idx);
+    vq->used_idx = le16toh(vq->vring.used->idx);
     vq->resubmit_num = 0;
     vq->resubmit_list = NULL;
     vq->counter = 0;
@@ -2031,13 +2031,13 @@ vu_queue_started(const VuDev *dev, const VuVirtq *vq)
 static inline uint16_t
 vring_avail_flags(VuVirtq *vq)
 {
-    return lduw_le_p(&vq->vring.avail->flags);
+    return le16toh(vq->vring.avail->flags);
 }
 
 static inline uint16_t
 vring_avail_idx(VuVirtq *vq)
 {
-    vq->shadow_avail_idx = lduw_le_p(&vq->vring.avail->idx);
+    vq->shadow_avail_idx = le16toh(vq->vring.avail->idx);
 
     return vq->shadow_avail_idx;
 }
@@ -2045,7 +2045,7 @@ vring_avail_idx(VuVirtq *vq)
 static inline uint16_t
 vring_avail_ring(VuVirtq *vq, int i)
 {
-    return lduw_le_p(&vq->vring.avail->ring[i]);
+    return le16toh(vq->vring.avail->ring[i]);
 }
 
 static inline uint16_t
@@ -2133,12 +2133,12 @@ virtqueue_read_next_desc(VuDev *dev, struct vring_desc *desc,
                          int i, unsigned int max, unsigned int *next)
 {
     /* If this descriptor says it doesn't chain, we're done. */
-    if (!(lduw_le_p(&desc[i].flags) & VRING_DESC_F_NEXT)) {
+    if (!(le16toh(desc[i].flags) & VRING_DESC_F_NEXT)) {
         return VIRTQUEUE_READ_DESC_DONE;
     }
 
     /* Check they're not leading us off end of descriptors. */
-    *next = lduw_le_p(&desc[i].next);
+    *next = le16toh(desc[i].next);
     /* Make sure compiler knows to grab that: we don't want it changing! */
     smp_wmb();
 
@@ -2181,8 +2181,8 @@ vu_queue_get_avail_bytes(VuDev *dev, VuVirtq *vq, unsigned int *in_bytes,
         }
         desc = vq->vring.desc;
 
-        if (lduw_le_p(&desc[i].flags) & VRING_DESC_F_INDIRECT) {
-            if (ldl_le_p(&desc[i].len) % sizeof(struct vring_desc)) {
+        if (le16toh(desc[i].flags) & VRING_DESC_F_INDIRECT) {
+            if (le32toh(desc[i].len) % sizeof(struct vring_desc)) {
                 vu_panic(dev, "Invalid size for indirect buffer table");
                 goto err;
             }
@@ -2195,8 +2195,8 @@ vu_queue_get_avail_bytes(VuDev *dev, VuVirtq *vq, unsigned int *in_bytes,
 
             /* loop over the indirect descriptor table */
             indirect = 1;
-            desc_addr = ldq_le_p(&desc[i].addr);
-            desc_len = ldl_le_p(&desc[i].len);
+            desc_addr = le64toh(desc[i].addr);
+            desc_len = le32toh(desc[i].len);
             max = desc_len / sizeof(struct vring_desc);
             read_len = desc_len;
             desc = vu_gpa_to_va(dev, &read_len, desc_addr);
@@ -2223,10 +2223,10 @@ vu_queue_get_avail_bytes(VuDev *dev, VuVirtq *vq, unsigned int *in_bytes,
                 goto err;
             }
 
-            if (lduw_le_p(&desc[i].flags) & VRING_DESC_F_WRITE) {
-                in_total += ldl_le_p(&desc[i].len);
+            if (le16toh(desc[i].flags) & VRING_DESC_F_WRITE) {
+                in_total += le32toh(desc[i].len);
             } else {
-                out_total += ldl_le_p(&desc[i].len);
+                out_total += le32toh(desc[i].len);
             }
             if (in_total >= max_in_bytes && out_total >= max_out_bytes) {
                 goto done;
@@ -2377,7 +2377,7 @@ vring_used_flags_set_bit(VuVirtq *vq, int mask)
 
     flags = (uint16_t *)((char*)vq->vring.used +
                          offsetof(struct vring_used, flags));
-    stw_le_p(flags, lduw_le_p(flags) | mask);
+    *flags = htole16(le16toh(*flags) | mask);
 }
 
 static inline void
@@ -2387,17 +2387,20 @@ vring_used_flags_unset_bit(VuVirtq *vq, int mask)
 
     flags = (uint16_t *)((char*)vq->vring.used +
                          offsetof(struct vring_used, flags));
-    stw_le_p(flags, lduw_le_p(flags) & ~mask);
+    *flags = htole16(le16toh(*flags) & ~mask);
 }
 
 static inline void
 vring_set_avail_event(VuVirtq *vq, uint16_t val)
 {
+    uint16_t *avail;
+
     if (!vq->notification) {
         return;
     }
 
-    stw_le_p(&vq->vring.used->ring[vq->vring.num], val);
+    avail = (uint16_t *)&vq->vring.used->ring[vq->vring.num];
+    *avail = htole16(val);
 }
 
 void
@@ -2487,15 +2490,15 @@ vu_queue_map_desc(VuDev *dev, VuVirtq *vq, unsigned int idx, size_t sz)
     struct vring_desc desc_buf[VIRTQUEUE_MAX_SIZE];
     int rc;
 
-    if (lduw_le_p(&desc[i].flags) & VRING_DESC_F_INDIRECT) {
-        if (ldl_le_p(&desc[i].len) % sizeof(struct vring_desc)) {
+    if (le16toh(desc[i].flags) & VRING_DESC_F_INDIRECT) {
+        if (le32toh(desc[i].len) % sizeof(struct vring_desc)) {
             vu_panic(dev, "Invalid size for indirect buffer table");
             return NULL;
         }
 
         /* loop over the indirect descriptor table */
-        desc_addr = ldq_le_p(&desc[i].addr);
-        desc_len = ldl_le_p(&desc[i].len);
+        desc_addr = le64toh(desc[i].addr);
+        desc_len = le32toh(desc[i].len);
         max = desc_len / sizeof(struct vring_desc);
         read_len = desc_len;
         desc = vu_gpa_to_va(dev, &read_len, desc_addr);
@@ -2517,11 +2520,11 @@ vu_queue_map_desc(VuDev *dev, VuVirtq *vq, unsigned int idx, size_t sz)
 
     /* Collect all the descriptors */
     do {
-        if (lduw_le_p(&desc[i].flags) & VRING_DESC_F_WRITE) {
+        if (le16toh(desc[i].flags) & VRING_DESC_F_WRITE) {
             if (!virtqueue_map_desc(dev, &in_num, iov + out_num,
                                VIRTQUEUE_MAX_SIZE - out_num, true,
-                               ldq_le_p(&desc[i].addr),
-                               ldl_le_p(&desc[i].len))) {
+                               le64toh(desc[i].addr),
+                               le32toh(desc[i].len))) {
                 return NULL;
             }
         } else {
@@ -2531,8 +2534,8 @@ vu_queue_map_desc(VuDev *dev, VuVirtq *vq, unsigned int idx, size_t sz)
             }
             if (!virtqueue_map_desc(dev, &out_num, iov,
                                VIRTQUEUE_MAX_SIZE, false,
-                               ldq_le_p(&desc[i].addr),
-                               ldl_le_p(&desc[i].len))) {
+                               le64toh(desc[i].addr),
+                               le32toh(desc[i].len))) {
                 return NULL;
             }
         }
@@ -2731,15 +2734,15 @@ vu_log_queue_fill(VuDev *dev, VuVirtq *vq,
     max = vq->vring.num;
     i = elem->index;
 
-    if (lduw_le_p(&desc[i].flags) & VRING_DESC_F_INDIRECT) {
-        if (ldl_le_p(&desc[i].len) % sizeof(struct vring_desc)) {
+    if (le16toh(desc[i].flags) & VRING_DESC_F_INDIRECT) {
+        if (le32toh(desc[i].len) % sizeof(struct vring_desc)) {
             vu_panic(dev, "Invalid size for indirect buffer table");
             return;
         }
 
         /* loop over the indirect descriptor table */
-        desc_addr = ldq_le_p(&desc[i].addr);
-        desc_len = ldl_le_p(&desc[i].len);
+        desc_addr = le64toh(desc[i].addr);
+        desc_len = le32toh(desc[i].len);
         max = desc_len / sizeof(struct vring_desc);
         read_len = desc_len;
         desc = vu_gpa_to_va(dev, &read_len, desc_addr);
@@ -2765,9 +2768,9 @@ vu_log_queue_fill(VuDev *dev, VuVirtq *vq,
             return;
         }
 
-        if (lduw_le_p(&desc[i].flags) & VRING_DESC_F_WRITE) {
-            min = MIN(ldl_le_p(&desc[i].len), len);
-            vu_log_write(dev, ldq_le_p(&desc[i].addr), min);
+        if (le16toh(desc[i].flags) & VRING_DESC_F_WRITE) {
+            min = MIN(le32toh(desc[i].len), len);
+            vu_log_write(dev, le64toh(desc[i].addr), min);
             len -= min;
         }
 
@@ -2792,15 +2795,15 @@ vu_queue_fill(VuDev *dev, VuVirtq *vq,
 
     idx = (idx + vq->used_idx) % vq->vring.num;
 
-    stl_le_p(&uelem.id, elem->index);
-    stl_le_p(&uelem.len, len);
+    uelem.id = htole32(elem->index);
+    uelem.len = htole32(len);
     vring_used_write(dev, vq, &uelem, idx);
 }
 
 static inline
 void vring_used_idx_set(VuDev *dev, VuVirtq *vq, uint16_t val)
 {
-    stw_le_p(&vq->vring.used->idx, val);
+    vq->vring.used->idx = htole16(val);
     vu_log_write(dev,
                  vq->vring.log_guest_addr + offsetof(struct vring_used, idx),
                  sizeof(vq->vring.used->idx));
-- 
MST


