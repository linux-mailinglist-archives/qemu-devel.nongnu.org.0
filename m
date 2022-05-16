Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BFAAE529350
	for <lists+qemu-devel@lfdr.de>; Tue, 17 May 2022 00:03:35 +0200 (CEST)
Received: from localhost ([::1]:41224 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqioQ-0005JF-Q9
	for lists+qemu-devel@lfdr.de; Mon, 16 May 2022 18:03:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59546)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nqhk9-00039V-Bt
 for qemu-devel@nongnu.org; Mon, 16 May 2022 16:55:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:25590)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nqhk3-0006oh-JM
 for qemu-devel@nongnu.org; Mon, 16 May 2022 16:55:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652734499;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zhjEctiUTjiy6J9SwVBbKJpcUcTX173hG9QfVjtla+w=;
 b=dZorIzTZwvCUZ9E/FLjILC3IUGqipe1zkSlbMUwvk6MC7H/jqtoe1Ad/V8tfZZ5kVvXXX+
 TENlmR3aSWZAqVKtvXAYbYgtZiu7xS79oWM2u4O0BWPbBcWEyqD0RNgZtbbZyShBftOJk1
 s+vDz3atfBhH/1jxCtYtxUfvJDwHS3g=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-27-NiomdnGSN5Klj24oFwzWHQ-1; Mon, 16 May 2022 16:54:57 -0400
X-MC-Unique: NiomdnGSN5Klj24oFwzWHQ-1
Received: by mail-ed1-f72.google.com with SMTP id
 f20-20020a50d554000000b0042abba35e60so1410084edj.15
 for <qemu-devel@nongnu.org>; Mon, 16 May 2022 13:54:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=zhjEctiUTjiy6J9SwVBbKJpcUcTX173hG9QfVjtla+w=;
 b=wXXfmn0sJEeY3rpSHlrF2y4MKFKnSdnl9g2wV/6J2kXNk5OINPKx6doxKEzzq+rwof
 BTFP8vjtlaGOTjKEEILXzy9EWoFCIkdBRvANAx0NUs4GRfY4Y69g8r55LJjv8A31wlVt
 iub5UWKEMA9lwkC8X9gqPHCIZBf1Io/WgZK7kQQ5gweO+7pHAwm121VdtA56etRMO825
 jcEEXUzTuUPt2qcAjWZB+r7UNvGtaJmM1HjUNGG7FirB2LkwbhGMQx6oQ9FhvH7crSfx
 XiFOp1vOjXZ7QH+Rna5qByEe2atxBh4Zl/apDl9Fe7ddmrL20rqeHRYiQfi04Muj9mFb
 +xrA==
X-Gm-Message-State: AOAM532bD6W1qh6WUg2hnlG4V4tYWAkbEp0Wprlsy9C3MhjWQ/J+iNzG
 2Sy8mlvOlRO+l0cCuyMGf/XEcnKwbtnhpYJpq3ebPKFBmIIofSFMLFs/hk3GxRcL3HSQ4Bg+lap
 8yHdwVmMJPBpLUg+iRspnmMYjXWzXKj3jYEG9MQnQ4xHAdRMpiQbkKrn8FjSp
X-Received: by 2002:a17:906:d9d1:b0:6fd:d8d5:5c9c with SMTP id
 qk17-20020a170906d9d100b006fdd8d55c9cmr16576170ejb.665.1652734495991; 
 Mon, 16 May 2022 13:54:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwN0uPkpiOhT950CqRiE2hAnSpVQRoay9boifw+PqvUA8s9CdEH/jXWpSFeG/DLeIxcMS/NlQ==
X-Received: by 2002:a17:906:d9d1:b0:6fd:d8d5:5c9c with SMTP id
 qk17-20020a170906d9d100b006fdd8d55c9cmr16576145ejb.665.1652734495632; 
 Mon, 16 May 2022 13:54:55 -0700 (PDT)
Received: from redhat.com ([2.55.131.38]) by smtp.gmail.com with ESMTPSA id
 v27-20020a17090651db00b006f3ef214e06sm158855ejk.108.2022.05.16.13.54.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 May 2022 13:54:55 -0700 (PDT)
Date: Mon, 16 May 2022 16:54:52 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PULL v2 69/86] virtio/vhost-user: dynamically assign
 VhostUserHostNotifiers
Message-ID: <20220516204913.542894-70-mst@redhat.com>
References: <20220516204913.542894-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220516204913.542894-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

From: Alex Bennée <alex.bennee@linaro.org>

At a couple of hundred bytes per notifier allocating one for every
potential queue is very wasteful as most devices only have a few
queues. Instead of having this handled statically dynamically assign
them and track in a GPtrArray.

[AJB: it's hard to trigger the vhost notifiers code, I assume as it
requires a KVM guest with appropriate backend]

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20220321153037.3622127-14-alex.bennee@linaro.org>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/hw/virtio/vhost-user.h | 42 ++++++++++++++++-
 hw/virtio/vhost-user.c         | 83 +++++++++++++++++++++++++++-------
 hw/virtio/trace-events         |  1 +
 3 files changed, 108 insertions(+), 18 deletions(-)

diff --git a/include/hw/virtio/vhost-user.h b/include/hw/virtio/vhost-user.h
index 6e0e8a71a3..c6e693cd3f 100644
--- a/include/hw/virtio/vhost-user.h
+++ b/include/hw/virtio/vhost-user.h
@@ -11,21 +11,61 @@
 #include "chardev/char-fe.h"
 #include "hw/virtio/virtio.h"
 
+/**
+ * VhostUserHostNotifier - notifier information for one queue
+ * @rcu: rcu_head for cleanup
+ * @mr: memory region of notifier
+ * @addr: current mapped address
+ * @unmap_addr: address to be un-mapped
+ * @idx: virtioqueue index
+ *
+ * The VhostUserHostNotifier entries are re-used. When an old mapping
+ * is to be released it is moved to @unmap_addr and @addr is replaced.
+ * Once the RCU process has completed the unmap @unmap_addr is
+ * cleared.
+ */
 typedef struct VhostUserHostNotifier {
     struct rcu_head rcu;
     MemoryRegion mr;
     void *addr;
     void *unmap_addr;
+    int idx;
 } VhostUserHostNotifier;
 
+/**
+ * VhostUserState - shared state for all vhost-user devices
+ * @chr: the character backend for the socket
+ * @notifiers: GPtrArray of @VhostUserHostnotifier
+ * @memory_slots:
+ */
 typedef struct VhostUserState {
     CharBackend *chr;
-    VhostUserHostNotifier notifier[VIRTIO_QUEUE_MAX];
+    GPtrArray *notifiers;
     int memory_slots;
     bool supports_config;
 } VhostUserState;
 
+/**
+ * vhost_user_init() - initialise shared vhost_user state
+ * @user: allocated area for storing shared state
+ * @chr: the chardev for the vhost socket
+ * @errp: error handle
+ *
+ * User can either directly g_new() space for the state or embed
+ * VhostUserState in their larger device structure and just point to
+ * it.
+ *
+ * Return: true on success, false on error while setting errp.
+ */
 bool vhost_user_init(VhostUserState *user, CharBackend *chr, Error **errp);
+
+/**
+ * vhost_user_cleanup() - cleanup state
+ * @user: ptr to use state
+ *
+ * Cleans up shared state and notifiers, callee is responsible for
+ * freeing the @VhostUserState memory itself.
+ */
 void vhost_user_cleanup(VhostUserState *user);
 
 #endif
diff --git a/hw/virtio/vhost-user.c b/hw/virtio/vhost-user.c
index b0d417651d..b040c1ad2b 100644
--- a/hw/virtio/vhost-user.c
+++ b/hw/virtio/vhost-user.c
@@ -1174,14 +1174,16 @@ static void vhost_user_host_notifier_free(VhostUserHostNotifier *n)
     n->unmap_addr = NULL;
 }
 
-static void vhost_user_host_notifier_remove(VhostUserState *user,
-                                            VirtIODevice *vdev, int queue_idx)
+/*
+ * clean-up function for notifier, will finally free the structure
+ * under rcu.
+ */
+static void vhost_user_host_notifier_remove(VhostUserHostNotifier *n,
+                                            VirtIODevice *vdev)
 {
-    VhostUserHostNotifier *n = &user->notifier[queue_idx];
-
     if (n->addr) {
         if (vdev) {
-            virtio_queue_set_host_notifier_mr(vdev, queue_idx, &n->mr, false);
+            virtio_queue_set_host_notifier_mr(vdev, n->idx, &n->mr, false);
         }
         assert(!n->unmap_addr);
         n->unmap_addr = n->addr;
@@ -1225,6 +1227,15 @@ static int vhost_user_set_vring_enable(struct vhost_dev *dev, int enable)
     return 0;
 }
 
+static VhostUserHostNotifier *fetch_notifier(VhostUserState *u,
+                                             int idx)
+{
+    if (idx >= u->notifiers->len) {
+        return NULL;
+    }
+    return g_ptr_array_index(u->notifiers, idx);
+}
+
 static int vhost_user_get_vring_base(struct vhost_dev *dev,
                                      struct vhost_vring_state *ring)
 {
@@ -1237,7 +1248,10 @@ static int vhost_user_get_vring_base(struct vhost_dev *dev,
     };
     struct vhost_user *u = dev->opaque;
 
-    vhost_user_host_notifier_remove(u->user, dev->vdev, ring->index);
+    VhostUserHostNotifier *n = fetch_notifier(u->user, ring->index);
+    if (n) {
+        vhost_user_host_notifier_remove(n, dev->vdev);
+    }
 
     ret = vhost_user_write(dev, &msg, NULL, 0);
     if (ret < 0) {
@@ -1502,6 +1516,29 @@ static int vhost_user_slave_handle_config_change(struct vhost_dev *dev)
     return dev->config_ops->vhost_dev_config_notifier(dev);
 }
 
+/*
+ * Fetch or create the notifier for a given idx. Newly created
+ * notifiers are added to the pointer array that tracks them.
+ */
+static VhostUserHostNotifier *fetch_or_create_notifier(VhostUserState *u,
+                                                       int idx)
+{
+    VhostUserHostNotifier *n = NULL;
+    if (idx >= u->notifiers->len) {
+        g_ptr_array_set_size(u->notifiers, idx);
+    }
+
+    n = g_ptr_array_index(u->notifiers, idx);
+    if (!n) {
+        n = g_new0(VhostUserHostNotifier, 1);
+        n->idx = idx;
+        g_ptr_array_insert(u->notifiers, idx, n);
+        trace_vhost_user_create_notifier(idx, n);
+    }
+
+    return n;
+}
+
 static int vhost_user_slave_handle_vring_host_notifier(struct vhost_dev *dev,
                                                        VhostUserVringArea *area,
                                                        int fd)
@@ -1521,9 +1558,12 @@ static int vhost_user_slave_handle_vring_host_notifier(struct vhost_dev *dev,
         return -EINVAL;
     }
 
-    n = &user->notifier[queue_idx];
-
-    vhost_user_host_notifier_remove(user, vdev, queue_idx);
+    /*
+     * Fetch notifier and invalidate any old data before setting up
+     * new mapped address.
+     */
+    n = fetch_or_create_notifier(user, queue_idx);
+    vhost_user_host_notifier_remove(n, vdev);
 
     if (area->u64 & VHOST_USER_VRING_NOFD_MASK) {
         return 0;
@@ -2526,6 +2566,20 @@ static int vhost_user_set_inflight_fd(struct vhost_dev *dev,
     return vhost_user_write(dev, &msg, &inflight->fd, 1);
 }
 
+static void vhost_user_state_destroy(gpointer data)
+{
+    VhostUserHostNotifier *n = (VhostUserHostNotifier *) data;
+    if (n) {
+        vhost_user_host_notifier_remove(n, NULL);
+        object_unparent(OBJECT(&n->mr));
+        /*
+         * We can't free until vhost_user_host_notifier_remove has
+         * done it's thing so schedule the free with RCU.
+         */
+        g_free_rcu(n, rcu);
+    }
+}
+
 bool vhost_user_init(VhostUserState *user, CharBackend *chr, Error **errp)
 {
     if (user->chr) {
@@ -2534,23 +2588,18 @@ bool vhost_user_init(VhostUserState *user, CharBackend *chr, Error **errp)
     }
     user->chr = chr;
     user->memory_slots = 0;
+    user->notifiers = g_ptr_array_new_full(VIRTIO_QUEUE_MAX / 4,
+                                           &vhost_user_state_destroy);
     return true;
 }
 
 void vhost_user_cleanup(VhostUserState *user)
 {
-    int i;
-    VhostUserHostNotifier *n;
-
     if (!user->chr) {
         return;
     }
     memory_region_transaction_begin();
-    for (i = 0; i < VIRTIO_QUEUE_MAX; i++) {
-        n = &user->notifier[i];
-        vhost_user_host_notifier_remove(user, NULL, i);
-        object_unparent(OBJECT(&n->mr));
-    }
+    user->notifiers = (GPtrArray *) g_ptr_array_free(user->notifiers, true);
     memory_region_transaction_commit();
     user->chr = NULL;
 }
diff --git a/hw/virtio/trace-events b/hw/virtio/trace-events
index 65e3b704ec..ab8e095b73 100644
--- a/hw/virtio/trace-events
+++ b/hw/virtio/trace-events
@@ -23,6 +23,7 @@ vhost_user_postcopy_waker_found(uint64_t client_addr) "0x%"PRIx64
 vhost_user_postcopy_waker_nomatch(const char *rb, uint64_t rb_offset) "%s + 0x%"PRIx64
 vhost_user_read(uint32_t req, uint32_t flags) "req:%d flags:0x%"PRIx32""
 vhost_user_write(uint32_t req, uint32_t flags) "req:%d flags:0x%"PRIx32""
+vhost_user_create_notifier(int idx, void *n) "idx:%d n:%p"
 
 # vhost-vdpa.c
 vhost_vdpa_dma_map(void *vdpa, int fd, uint32_t msg_type, uint64_t iova, uint64_t size, uint64_t uaddr, uint8_t perm, uint8_t type) "vdpa:%p fd: %d msg_type: %"PRIu32" iova: 0x%"PRIx64" size: 0x%"PRIx64" uaddr: 0x%"PRIx64" perm: 0x%"PRIx8" type: %"PRIu8
-- 
MST


