Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E9C526C9FF1
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Mar 2023 11:37:12 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pgjHc-0003cN-Ac; Mon, 27 Mar 2023 05:36:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1pgjHY-0003bu-Pi
 for qemu-devel@nongnu.org; Mon, 27 Mar 2023 05:36:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1pgjHV-0007OF-0c
 for qemu-devel@nongnu.org; Mon, 27 Mar 2023 05:36:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679909808;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hD9vHcxKDPhNlukJNlI5ywPhMyPRQUqjR6X9FTocMkA=;
 b=Ab/aJOzeo/Z1Ngkg1YT5DuhyEA9EK1fJrYpPgENAZJ+tHAfKgWG8S6Wn7zyuLHVMVdo+UQ
 XCO0Eyl5l09pk8L+zuod3lkGvL0zk78XhWTcVLw5npYbNgU+rfjG/hQJlXyV0eO97ao4oH
 7q+tUg+vS0ep5suTSD/xztRq90PUGWk=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-440-TeoImyjtMW-hL22bLbHKhw-1; Mon, 27 Mar 2023 05:36:47 -0400
X-MC-Unique: TeoImyjtMW-hL22bLbHKhw-1
Received: by mail-qt1-f197.google.com with SMTP id
 n10-20020a05622a11ca00b003e4e30c6c98so2908612qtk.19
 for <qemu-devel@nongnu.org>; Mon, 27 Mar 2023 02:36:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679909806;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=hD9vHcxKDPhNlukJNlI5ywPhMyPRQUqjR6X9FTocMkA=;
 b=cRKe4QDI1Sbr2Vni/i9bh3b/Ol7fWKnmwgu8hke1IpCfzCGKDDqUY2IBWOiPkd8/eX
 zFo0utRtN2stlxtvuLeJt0dnmmV3XhmAYKAe43cS3HChYWCfuUQ6Wj5Cmukp2fXY1c6h
 qqrHhzISrB2BqniQTo/L2tYPa/tG2m7Zk0gd5X4RKztGWEOHogubM3mHMr8SKhqx3A7W
 jgpt5EKvdfsUeOeolRmFBP+TmYoW6whkHhTHLwY9SLd+qgOst5uhDUdTKccjBgtxlUHI
 ZVBfcv5LtRiDrnXYUYgndNVZi/ZxOAIkRr7rrPuUfxMUgpk0TqyR3vrHzQhPyz1mD9B/
 7/oQ==
X-Gm-Message-State: AAQBX9eykUu3TMQXJI9WTFf5+KfgT3qh2d/kLp+qqzgKxgADVlg4mXZG
 II3HIwlNNfa9jYFYDcxkOSKT0RKF2WCDc6cr72bdEcMrT3pTH4YTjPwYuOjx0czQ4PFzTlco9xq
 XYnuqgpBDduaNUWM=
X-Received: by 2002:a05:6214:29e2:b0:5d8:ed66:3098 with SMTP id
 jv2-20020a05621429e200b005d8ed663098mr17282152qvb.42.1679909806523; 
 Mon, 27 Mar 2023 02:36:46 -0700 (PDT)
X-Google-Smtp-Source: AKy350bZcmXi1rC20N7rNhVd7b7ST+oLll/D8ND2T0qFRzO+BVXlmbc3yTDHkRuMZdFb2xjfUBqT8Q==
X-Received: by 2002:a05:6214:29e2:b0:5d8:ed66:3098 with SMTP id
 jv2-20020a05621429e200b005d8ed663098mr17282134qvb.42.1679909806183; 
 Mon, 27 Mar 2023 02:36:46 -0700 (PDT)
Received: from sgarzare-redhat (host-82-53-134-98.retail.telecomitalia.it.
 [82.53.134.98]) by smtp.gmail.com with ESMTPSA id
 t18-20020a37ea12000000b0074867573966sm980354qkj.101.2023.03.27.02.36.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Mar 2023 02:36:45 -0700 (PDT)
Date: Mon, 27 Mar 2023 11:36:40 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Eugenio =?utf-8?B?UMOpcmV6?= <eperezma@redhat.com>
Cc: qemu-devel@nongnu.org, Liuxiangdong <liuxiangdong5@huawei.com>, 
 Gautam Dawar <gdawar@xilinx.com>, Jason Wang <jasowang@redhat.com>,
 alvaro.karsz@solid-run.com, 
 "Gonglei (Arei)" <arei.gonglei@huawei.com>, Lei Yang <leiyang@redhat.com>,
 si-wei.liu@oracle.com, 
 Eli Cohen <eli@mellanox.com>, Shannon Nelson <snelson@pensando.io>, 
 Laurent Vivier <lvivier@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>, 
 Parav Pandit <parav@mellanox.com>, Zhu Lingshan <lingshan.zhu@intel.com>, 
 Cindy Lu <lulu@redhat.com>, longpeng2@huawei.com,
 Harpreet Singh Anand <hanand@xilinx.com>
Subject: Re: [PATCH for 8.1 v2 5/6] vdpa: move CVQ isolation check to
 net_init_vhost_vdpa
Message-ID: <2udv7i6agrrvoxxg6aqxlz4hhejkubbleasmp3qahvn3c4czcc@c5y3ysrxdbrd>
References: <20230323195404.1247326-1-eperezma@redhat.com>
 <20230323195404.1247326-6-eperezma@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230323195404.1247326-6-eperezma@redhat.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=sgarzare@redhat.com;
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

On Thu, Mar 23, 2023 at 08:54:03PM +0100, Eugenio Pérez wrote:
>Evaluating it at start time instead of initialization time may make the
>guest capable of dynamically adding or removing migration blockers.
>
>Also, moving to initialization reduces the number of ioctls in the
>migration, reducing failure possibilities.
>
>As a drawback we need to check for CVQ isolation twice: one time with no
>MQ negotiated and another one acking it, as long as the device supports
>it.  This is because Vring ASID / group management is based on vq
>indexes, but we don't know the index of CVQ before negotiating MQ.

I don't know this code sufficiently to do a review, but now I understand
the motivation behind it ;-)

Thanks,
Stefano

>
>Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
>---
>v2: Take out the reset of the device from vhost_vdpa_cvq_is_isolated
>---
> net/vhost-vdpa.c | 194 ++++++++++++++++++++++++++++++++++++-----------
> 1 file changed, 151 insertions(+), 43 deletions(-)
>
>diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
>index 4397c0d4b3..db2c9afcb3 100644
>--- a/net/vhost-vdpa.c
>+++ b/net/vhost-vdpa.c
>@@ -43,6 +43,13 @@ typedef struct VhostVDPAState {
>
>     /* The device always have SVQ enabled */
>     bool always_svq;
>+
>+    /* The device can isolate CVQ in its own ASID if MQ is negotiated */
>+    bool cvq_isolated_mq;
>+
>+    /* The device can isolate CVQ in its own ASID if MQ is not negotiated */
>+    bool cvq_isolated;
>+
>     bool started;
> } VhostVDPAState;
>
>@@ -361,15 +368,8 @@ static NetClientInfo net_vhost_vdpa_info = {
>         .check_peer_type = vhost_vdpa_check_peer_type,
> };
>
>-/**
>- * Get vring virtqueue group
>- *
>- * @device_fd  vdpa device fd
>- * @vq_index   Virtqueue index
>- *
>- * Return -errno in case of error, or vq group if success.
>- */
>-static int64_t vhost_vdpa_get_vring_group(int device_fd, unsigned vq_index)
>+static int64_t vhost_vdpa_get_vring_group(int device_fd, unsigned vq_index,
>+                                          Error **errp)
> {
>     struct vhost_vring_state state = {
>         .index = vq_index,
>@@ -378,8 +378,7 @@ static int64_t vhost_vdpa_get_vring_group(int device_fd, unsigned vq_index)
>
>     if (unlikely(r < 0)) {
>         r = -errno;
>-        error_report("Cannot get VQ %u group: %s", vq_index,
>-                     g_strerror(errno));
>+        error_setg_errno(errp, errno, "Cannot get VQ %u group", vq_index);
>         return r;
>     }
>
>@@ -479,9 +478,9 @@ static int vhost_vdpa_net_cvq_start(NetClientState *nc)
> {
>     VhostVDPAState *s, *s0;
>     struct vhost_vdpa *v;
>-    uint64_t backend_features;
>     int64_t cvq_group;
>-    int cvq_index, r;
>+    int r;
>+    Error *err = NULL;
>
>     assert(nc->info->type == NET_CLIENT_DRIVER_VHOST_VDPA);
>
>@@ -501,42 +500,29 @@ static int vhost_vdpa_net_cvq_start(NetClientState *nc)
>     /*
>      * If we early return in these cases SVQ will not be enabled. The migration
>      * will be blocked as long as vhost-vdpa backends will not offer _F_LOG.
>-     *
>-     * Calling VHOST_GET_BACKEND_FEATURES as they are not available in v->dev
>-     * yet.
>      */
>-    r = ioctl(v->device_fd, VHOST_GET_BACKEND_FEATURES, &backend_features);
>-    if (unlikely(r < 0)) {
>-        error_report("Cannot get vdpa backend_features: %s(%d)",
>-            g_strerror(errno), errno);
>-        return -1;
>-    }
>-    if (!(backend_features & BIT_ULL(VHOST_BACKEND_F_IOTLB_ASID)) ||
>-        !vhost_vdpa_net_valid_svq_features(v->dev->features, NULL)) {
>+    if (!vhost_vdpa_net_valid_svq_features(v->dev->features, NULL)) {
>         return 0;
>     }
>
>-    /*
>-     * Check if all the virtqueues of the virtio device are in a different vq
>-     * than the last vq. VQ group of last group passed in cvq_group.
>-     */
>-    cvq_index = v->dev->vq_index_end - 1;
>-    cvq_group = vhost_vdpa_get_vring_group(v->device_fd, cvq_index);
>-    if (unlikely(cvq_group < 0)) {
>-        return cvq_group;
>-    }
>-    for (int i = 0; i < cvq_index; ++i) {
>-        int64_t group = vhost_vdpa_get_vring_group(v->device_fd, i);
>-
>-        if (unlikely(group < 0)) {
>-            return group;
>+    if (v->dev->features & BIT_ULL(VIRTIO_NET_F_MQ)) {
>+        if (!s->cvq_isolated_mq) {
>+            return 0;
>         }
>-
>-        if (group == cvq_group) {
>+    } else {
>+        if (!s->cvq_isolated) {
>             return 0;
>         }
>     }
>
>+    cvq_group = vhost_vdpa_get_vring_group(v->device_fd,
>+                                           v->dev->vq_index_end - 1,
>+                                           &err);
>+    if (unlikely(cvq_group < 0)) {
>+        error_report_err(err);
>+        return cvq_group;
>+    }
>+
>     r = vhost_vdpa_set_address_space_id(v, cvq_group, VHOST_VDPA_NET_CVQ_ASID);
>     if (unlikely(r < 0)) {
>         return r;
>@@ -798,6 +784,116 @@ static const VhostShadowVirtqueueOps vhost_vdpa_net_svq_ops = {
>     .avail_handler = vhost_vdpa_net_handle_ctrl_avail,
> };
>
>+/**
>+ * Probe the device to check control virtqueue is isolated.
>+ *
>+ * @device_fd vhost-vdpa file descriptor
>+ * @features features to negotiate
>+ * @cvq_index Control vq index
>+ *
>+ * Returns -1 in case of error, 0 if false and 1 if true
>+ */
>+static int vhost_vdpa_cvq_is_isolated(int device_fd, uint64_t features,
>+                                      unsigned cvq_index, Error **errp)
>+{
>+    int64_t cvq_group;
>+    int r;
>+
>+    r = vhost_vdpa_set_dev_features_fd(device_fd, features);
>+    if (unlikely(r < 0)) {
>+        error_setg_errno(errp, -r, "Cannot set device features");
>+        return r;
>+    }
>+
>+    cvq_group = vhost_vdpa_get_vring_group(device_fd, cvq_index, errp);
>+    if (unlikely(cvq_group < 0)) {
>+        return cvq_group;
>+    }
>+
>+    for (int i = 0; i < cvq_index; ++i) {
>+        int64_t group = vhost_vdpa_get_vring_group(device_fd, i, errp);
>+
>+        if (unlikely(group < 0)) {
>+            return group;
>+        }
>+
>+        if (group == (int64_t)cvq_group) {
>+            return 0;
>+        }
>+    }
>+
>+    return 1;
>+}
>+
>+/**
>+ * Probe if CVQ is isolated when the device is MQ and when it is not MQ
>+ *
>+ * @device_fd         The vdpa device fd
>+ * @features          Features offered by the device.
>+ * @cvq_index         The control vq index if mq is negotiated. Ignored
>+ *                    otherwise.
>+ * @cvq_isolated      It'll be set to true if cvq is isolated if mq is not
>+ *                    negotiated.
>+ * @cvq_isolated_mq   It'll be set to true if cvq is isolated if mq is
>+ *                    negotiated.
>+ *
>+ * Returns -1 in case of failure
>+ */
>+static int vhost_vdpa_probe_cvq_isolation(int device_fd, uint64_t features,
>+                                          int cvq_index, bool *cvq_isolated,
>+                                          bool *cvq_isolated_mq, Error **errp)
>+{
>+    uint64_t backend_features;
>+    int r;
>+
>+    ERRP_GUARD();
>+
>+    *cvq_isolated = false;
>+    *cvq_isolated_mq = false;
>+    r = ioctl(device_fd, VHOST_GET_BACKEND_FEATURES, &backend_features);
>+    if (unlikely(r < 0)) {
>+        error_setg_errno(errp, errno, "Cannot get vdpa backend_features");
>+        return r;
>+    }
>+
>+    if (!(backend_features & BIT_ULL(VHOST_BACKEND_F_IOTLB_ASID))) {
>+        return 0;
>+    }
>+
>+    r = vhost_vdpa_cvq_is_isolated(device_fd,
>+                                   features & ~BIT_ULL(VIRTIO_NET_F_MQ), 2,
>+                                   errp);
>+    if (unlikely(r < 0)) {
>+        if (r == -ENOTSUP) {
>+            /*
>+             * The kernel report VHOST_BACKEND_F_IOTLB_ASID if the vdpa
>+             * frontend support ASID but the parent driver does not.  The CVQ
>+             * cannot be isolated in this case.
>+             */
>+            error_free(*errp);
>+            *errp = NULL;
>+            return 0;
>+        }
>+
>+        return r;
>+    }
>+
>+    *cvq_isolated = r == 1;
>+    vhost_vdpa_reset_status_fd(device_fd);
>+    if (!(features & BIT_ULL(VIRTIO_NET_F_MQ))) {
>+        return 0;
>+    }
>+
>+    r = vhost_vdpa_cvq_is_isolated(device_fd, features, cvq_index * 2, errp);
>+    if (unlikely(r < 0)) {
>+        return r;
>+    }
>+
>+    *cvq_isolated_mq = r == 1;
>+    vhost_vdpa_reset_status_fd(device_fd);
>+    return 0;
>+}
>+
> static NetClientState *net_vhost_vdpa_init(NetClientState *peer,
>                                        const char *device,
>                                        const char *name,
>@@ -807,16 +903,26 @@ static NetClientState *net_vhost_vdpa_init(NetClientState *peer,
>                                        bool is_datapath,
>                                        bool svq,
>                                        struct vhost_vdpa_iova_range iova_range,
>-                                       uint64_t features)
>+                                       uint64_t features,
>+                                       Error **errp)
> {
>     NetClientState *nc = NULL;
>     VhostVDPAState *s;
>     int ret = 0;
>     assert(name);
>+    bool cvq_isolated, cvq_isolated_mq;
>+
>     if (is_datapath) {
>         nc = qemu_new_net_client(&net_vhost_vdpa_info, peer, device,
>                                  name);
>     } else {
>+        ret = vhost_vdpa_probe_cvq_isolation(vdpa_device_fd, features,
>+                                             queue_pair_index, &cvq_isolated,
>+                                             &cvq_isolated_mq, errp);
>+        if (unlikely(ret)) {
>+            return NULL;
>+        }
>+
>         nc = qemu_new_net_control_client(&net_vhost_vdpa_cvq_info, peer,
>                                          device, name);
>     }
>@@ -843,6 +949,8 @@ static NetClientState *net_vhost_vdpa_init(NetClientState *peer,
>
>         s->vhost_vdpa.shadow_vq_ops = &vhost_vdpa_net_svq_ops;
>         s->vhost_vdpa.shadow_vq_ops_opaque = s;
>+        s->cvq_isolated = cvq_isolated;
>+        s->cvq_isolated_mq = cvq_isolated_mq;
>
>         /*
>          * TODO: We cannot migrate devices with CVQ as there is no way to set
>@@ -971,7 +1079,7 @@ int net_init_vhost_vdpa(const Netdev *netdev, const char *name,
>     for (i = 0; i < queue_pairs; i++) {
>         ncs[i] = net_vhost_vdpa_init(peer, TYPE_VHOST_VDPA, name,
>                                      vdpa_device_fd, i, 2, true, opts->x_svq,
>-                                     iova_range, features);
>+                                     iova_range, features, errp);
>         if (!ncs[i])
>             goto err;
>     }
>@@ -979,7 +1087,7 @@ int net_init_vhost_vdpa(const Netdev *netdev, const char *name,
>     if (has_cvq) {
>         nc = net_vhost_vdpa_init(peer, TYPE_VHOST_VDPA, name,
>                                  vdpa_device_fd, i, 1, false,
>-                                 opts->x_svq, iova_range, features);
>+                                 opts->x_svq, iova_range, features, errp);
>         if (!nc)
>             goto err;
>     }
>-- 
>2.31.1
>


