Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 18F486AFBD6
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Mar 2023 02:12:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZiLF-00011C-Az; Tue, 07 Mar 2023 20:11:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pZiLC-0000zt-Nb
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 20:11:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pZiLA-0001Yr-PC
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 20:11:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678237896;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=e3Ohk9wF7jUIc7lyfPautXjbsnuEi5eU7cxKR4NhDqw=;
 b=KJO4xoo6+WexfTdFhEBWyCa5SPZ2mMPKPTR88mLUB9jR6i5ZbtBKl1Qu3zMJkGQv3lugKY
 7L+hnWU4HzzqZxBrKThoeYYLXqtYSRaZaR/5e46gOlUmMX/7dr3+u9PC/cR7SOLCyR18F8
 Nd/1/tBlFgOa/JReOUfKEMjisqI/MhY=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-97-lGwI2pjBMBicDYWCboKUZg-1; Tue, 07 Mar 2023 20:11:35 -0500
X-MC-Unique: lGwI2pjBMBicDYWCboKUZg-1
Received: by mail-ed1-f72.google.com with SMTP id
 ec11-20020a0564020d4b00b004e2cb85c8bcso12384878edb.16
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 17:11:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678237893;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=e3Ohk9wF7jUIc7lyfPautXjbsnuEi5eU7cxKR4NhDqw=;
 b=WzgUFuMh7SPzubbTzjFbmcaCBwYtY6mf8V55bs0alEVWxdh5fWKheVpTwlZbXyErl8
 M1qOS0z7lYxNdd7kjWG2tg8XHS52lzsUbc5m2VM6fT4y5kNHW18FI0E5v/8cK8Waczyd
 F1m8rWHEmqIhFA1CP+fJG69/oPdON58LJs8RkjJMtC6+ePltZTD+rybDUERBVSu2Y4UX
 grGfMLeyPJEpkRlmkRQA6WlyKYyozwZnr+YjTnIr8Fw1XqN7uujIAHakLsdUyNXK63E7
 GfkiDELR4/d3exQqY3Ejd1mPdm3dTSfU0wabKEaBs7MlgJQTaexZmhK8XwfwUIQd1ye0
 WfJg==
X-Gm-Message-State: AO0yUKXCwxvmMDTvXwpkIWRYi9Pd8PFlpehk0lk9Kyo1u0Zt+1IJ7Q5j
 zqlosQEZzZsjh5+chXBXHmD7FXrQelxwEM05RJarzleorfJr4AOzkzctF6tNkXZ0MyFnUPKy0RE
 eXPw7cFhG2xcDlJom4DhSzm4QWZhmy6JAkAoEctvbsbEMZJ6L3ZFLPsputTnr3AY8iHu7
X-Received: by 2002:a17:906:a042:b0:8aa:875d:9d9a with SMTP id
 bg2-20020a170906a04200b008aa875d9d9amr17224932ejb.50.1678237893296; 
 Tue, 07 Mar 2023 17:11:33 -0800 (PST)
X-Google-Smtp-Source: AK7set/vtCWuooc14yCGLUQNd9/koY37+e/cBVtS6SN9ttxrf1AexxIONkRGKq7O38MwH5ArFXd63Q==
X-Received: by 2002:a17:906:a042:b0:8aa:875d:9d9a with SMTP id
 bg2-20020a170906a04200b008aa875d9d9amr17224917ejb.50.1678237892977; 
 Tue, 07 Mar 2023 17:11:32 -0800 (PST)
Received: from redhat.com ([2.52.138.216]) by smtp.gmail.com with ESMTPSA id
 le16-20020a170907171000b008da6a37de1bsm6906861ejc.10.2023.03.07.17.11.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Mar 2023 17:11:32 -0800 (PST)
Date: Tue, 7 Mar 2023 20:11:30 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eugenio =?utf-8?B?UMOpcmV6?= <eperezma@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Lei Yang <leiyang@redhat.com>
Subject: [PULL 13/73] vdpa net: move iova tree creation from init to start
Message-ID: <00ef422e9fbfef1fb40447b08826db0951d788dd.1678237635.git.mst@redhat.com>
References: <cover.1678237635.git.mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cover.1678237635.git.mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Eugenio Pérez <eperezma@redhat.com>

Only create iova_tree if and when it is needed.

The cleanup keeps being responsible for the last VQ but this change
allows it to merge both cleanup functions.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
Acked-by: Jason Wang <jasowang@redhat.com>
Message-Id: <20230303172445.1089785-2-eperezma@redhat.com>
Tested-by: Lei Yang <leiyang@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 net/vhost-vdpa.c | 113 ++++++++++++++++++++++++++++++++++-------------
 1 file changed, 83 insertions(+), 30 deletions(-)

diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
index de5ed8ff22..d195f48776 100644
--- a/net/vhost-vdpa.c
+++ b/net/vhost-vdpa.c
@@ -178,13 +178,9 @@ err_init:
 static void vhost_vdpa_cleanup(NetClientState *nc)
 {
     VhostVDPAState *s = DO_UPCAST(VhostVDPAState, nc, nc);
-    struct vhost_dev *dev = &s->vhost_net->dev;
 
     qemu_vfree(s->cvq_cmd_out_buffer);
     qemu_vfree(s->status);
-    if (dev->vq_index + dev->nvqs == dev->vq_index_end) {
-        g_clear_pointer(&s->vhost_vdpa.iova_tree, vhost_iova_tree_delete);
-    }
     if (s->vhost_net) {
         vhost_net_cleanup(s->vhost_net);
         g_free(s->vhost_net);
@@ -234,10 +230,64 @@ static ssize_t vhost_vdpa_receive(NetClientState *nc, const uint8_t *buf,
     return size;
 }
 
+/** From any vdpa net client, get the netclient of the first queue pair */
+static VhostVDPAState *vhost_vdpa_net_first_nc_vdpa(VhostVDPAState *s)
+{
+    NICState *nic = qemu_get_nic(s->nc.peer);
+    NetClientState *nc0 = qemu_get_peer(nic->ncs, 0);
+
+    return DO_UPCAST(VhostVDPAState, nc, nc0);
+}
+
+static void vhost_vdpa_net_data_start_first(VhostVDPAState *s)
+{
+    struct vhost_vdpa *v = &s->vhost_vdpa;
+
+    if (v->shadow_vqs_enabled) {
+        v->iova_tree = vhost_iova_tree_new(v->iova_range.first,
+                                           v->iova_range.last);
+    }
+}
+
+static int vhost_vdpa_net_data_start(NetClientState *nc)
+{
+    VhostVDPAState *s = DO_UPCAST(VhostVDPAState, nc, nc);
+    struct vhost_vdpa *v = &s->vhost_vdpa;
+
+    assert(nc->info->type == NET_CLIENT_DRIVER_VHOST_VDPA);
+
+    if (v->index == 0) {
+        vhost_vdpa_net_data_start_first(s);
+        return 0;
+    }
+
+    if (v->shadow_vqs_enabled) {
+        VhostVDPAState *s0 = vhost_vdpa_net_first_nc_vdpa(s);
+        v->iova_tree = s0->vhost_vdpa.iova_tree;
+    }
+
+    return 0;
+}
+
+static void vhost_vdpa_net_client_stop(NetClientState *nc)
+{
+    VhostVDPAState *s = DO_UPCAST(VhostVDPAState, nc, nc);
+    struct vhost_dev *dev;
+
+    assert(nc->info->type == NET_CLIENT_DRIVER_VHOST_VDPA);
+
+    dev = s->vhost_vdpa.dev;
+    if (dev->vq_index + dev->nvqs == dev->vq_index_end) {
+        g_clear_pointer(&s->vhost_vdpa.iova_tree, vhost_iova_tree_delete);
+    }
+}
+
 static NetClientInfo net_vhost_vdpa_info = {
         .type = NET_CLIENT_DRIVER_VHOST_VDPA,
         .size = sizeof(VhostVDPAState),
         .receive = vhost_vdpa_receive,
+        .start = vhost_vdpa_net_data_start,
+        .stop = vhost_vdpa_net_client_stop,
         .cleanup = vhost_vdpa_cleanup,
         .has_vnet_hdr = vhost_vdpa_has_vnet_hdr,
         .has_ufo = vhost_vdpa_has_ufo,
@@ -351,7 +401,7 @@ dma_map_err:
 
 static int vhost_vdpa_net_cvq_start(NetClientState *nc)
 {
-    VhostVDPAState *s;
+    VhostVDPAState *s, *s0;
     struct vhost_vdpa *v;
     uint64_t backend_features;
     int64_t cvq_group;
@@ -415,8 +465,6 @@ static int vhost_vdpa_net_cvq_start(NetClientState *nc)
         return r;
     }
 
-    v->iova_tree = vhost_iova_tree_new(v->iova_range.first,
-                                       v->iova_range.last);
     v->shadow_vqs_enabled = true;
     s->vhost_vdpa.address_space_id = VHOST_VDPA_NET_CVQ_ASID;
 
@@ -425,6 +473,27 @@ out:
         return 0;
     }
 
+    s0 = vhost_vdpa_net_first_nc_vdpa(s);
+    if (s0->vhost_vdpa.iova_tree) {
+        /*
+         * SVQ is already configured for all virtqueues.  Reuse IOVA tree for
+         * simplicity, whether CVQ shares ASID with guest or not, because:
+         * - Memory listener need access to guest's memory addresses allocated
+         *   in the IOVA tree.
+         * - There should be plenty of IOVA address space for both ASID not to
+         *   worry about collisions between them.  Guest's translations are
+         *   still validated with virtio virtqueue_pop so there is no risk for
+         *   the guest to access memory that it shouldn't.
+         *
+         * To allocate a iova tree per ASID is doable but it complicates the
+         * code and it is not worth it for the moment.
+         */
+        v->iova_tree = s0->vhost_vdpa.iova_tree;
+    } else {
+        v->iova_tree = vhost_iova_tree_new(v->iova_range.first,
+                                           v->iova_range.last);
+    }
+
     r = vhost_vdpa_cvq_map_buf(&s->vhost_vdpa, s->cvq_cmd_out_buffer,
                                vhost_vdpa_net_cvq_cmd_page_len(), false);
     if (unlikely(r < 0)) {
@@ -449,15 +518,9 @@ static void vhost_vdpa_net_cvq_stop(NetClientState *nc)
     if (s->vhost_vdpa.shadow_vqs_enabled) {
         vhost_vdpa_cvq_unmap_buf(&s->vhost_vdpa, s->cvq_cmd_out_buffer);
         vhost_vdpa_cvq_unmap_buf(&s->vhost_vdpa, s->status);
-        if (!s->always_svq) {
-            /*
-             * If only the CVQ is shadowed we can delete this safely.
-             * If all the VQs are shadows this will be needed by the time the
-             * device is started again to register SVQ vrings and similar.
-             */
-            g_clear_pointer(&s->vhost_vdpa.iova_tree, vhost_iova_tree_delete);
-        }
     }
+
+    vhost_vdpa_net_client_stop(nc);
 }
 
 static ssize_t vhost_vdpa_net_cvq_add(VhostVDPAState *s, size_t out_len,
@@ -667,8 +730,7 @@ static NetClientState *net_vhost_vdpa_init(NetClientState *peer,
                                        int nvqs,
                                        bool is_datapath,
                                        bool svq,
-                                       struct vhost_vdpa_iova_range iova_range,
-                                       VhostIOVATree *iova_tree)
+                                       struct vhost_vdpa_iova_range iova_range)
 {
     NetClientState *nc = NULL;
     VhostVDPAState *s;
@@ -690,7 +752,6 @@ static NetClientState *net_vhost_vdpa_init(NetClientState *peer,
     s->vhost_vdpa.shadow_vqs_enabled = svq;
     s->vhost_vdpa.iova_range = iova_range;
     s->vhost_vdpa.shadow_data = svq;
-    s->vhost_vdpa.iova_tree = iova_tree;
     if (!is_datapath) {
         s->cvq_cmd_out_buffer = qemu_memalign(qemu_real_host_page_size(),
                                             vhost_vdpa_net_cvq_cmd_page_len());
@@ -760,7 +821,6 @@ int net_init_vhost_vdpa(const Netdev *netdev, const char *name,
     uint64_t features;
     int vdpa_device_fd;
     g_autofree NetClientState **ncs = NULL;
-    g_autoptr(VhostIOVATree) iova_tree = NULL;
     struct vhost_vdpa_iova_range iova_range;
     NetClientState *nc;
     int queue_pairs, r, i = 0, has_cvq = 0;
@@ -812,12 +872,8 @@ int net_init_vhost_vdpa(const Netdev *netdev, const char *name,
         goto err;
     }
 
-    if (opts->x_svq) {
-        if (!vhost_vdpa_net_valid_svq_features(features, errp)) {
-            goto err_svq;
-        }
-
-        iova_tree = vhost_iova_tree_new(iova_range.first, iova_range.last);
+    if (opts->x_svq && !vhost_vdpa_net_valid_svq_features(features, errp)) {
+        goto err;
     }
 
     ncs = g_malloc0(sizeof(*ncs) * queue_pairs);
@@ -825,7 +881,7 @@ int net_init_vhost_vdpa(const Netdev *netdev, const char *name,
     for (i = 0; i < queue_pairs; i++) {
         ncs[i] = net_vhost_vdpa_init(peer, TYPE_VHOST_VDPA, name,
                                      vdpa_device_fd, i, 2, true, opts->x_svq,
-                                     iova_range, iova_tree);
+                                     iova_range);
         if (!ncs[i])
             goto err;
     }
@@ -833,13 +889,11 @@ int net_init_vhost_vdpa(const Netdev *netdev, const char *name,
     if (has_cvq) {
         nc = net_vhost_vdpa_init(peer, TYPE_VHOST_VDPA, name,
                                  vdpa_device_fd, i, 1, false,
-                                 opts->x_svq, iova_range, iova_tree);
+                                 opts->x_svq, iova_range);
         if (!nc)
             goto err;
     }
 
-    /* iova_tree ownership belongs to last NetClientState */
-    g_steal_pointer(&iova_tree);
     return 0;
 
 err:
@@ -849,7 +903,6 @@ err:
         }
     }
 
-err_svq:
     qemu_close(vdpa_device_fd);
 
     return -1;
-- 
MST


