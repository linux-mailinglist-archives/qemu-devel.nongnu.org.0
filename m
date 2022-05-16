Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CEF09528414
	for <lists+qemu-devel@lfdr.de>; Mon, 16 May 2022 14:21:52 +0200 (CEST)
Received: from localhost ([::1]:42038 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqZjT-0005Sa-RX
	for lists+qemu-devel@lfdr.de; Mon, 16 May 2022 08:21:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49638)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nqY96-0002UG-Kw
 for qemu-devel@nongnu.org; Mon, 16 May 2022 06:40:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:54178)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nqY94-0005jw-7r
 for qemu-devel@nongnu.org; Mon, 16 May 2022 06:40:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652697609;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2YbWnEu5E2rijaHJiD+eoN7xDKLcXglpGNvVzvkLJCc=;
 b=FXtV2ybSJ4nHEdYdVNTuuUlmbpEns4iVb2U58/3YYpqzK1Pln/+zArm0c7vbyPVavR5hKS
 bVocg2WuZr2OYGOZlrjN/eVBvsoJwpqiCvBr7D5vDo1Jv/cF2Y+iI791VSMeaKDe1VFmDn
 2IRWu9/Nnby/uSMeBU30Qyi4EKdXVm8=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-589-e_ju7jeCOKOBwI0d-uwSmQ-1; Mon, 16 May 2022 06:40:08 -0400
X-MC-Unique: e_ju7jeCOKOBwI0d-uwSmQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 i131-20020a1c3b89000000b00393fbb0718bso10165747wma.0
 for <qemu-devel@nongnu.org>; Mon, 16 May 2022 03:40:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=2YbWnEu5E2rijaHJiD+eoN7xDKLcXglpGNvVzvkLJCc=;
 b=cH8/78Bgr+XmqT6mRc6TZJQtvaY9lkvrPH5Bmyw1FbrPoQv6uyS9hHYE3L3y8BU5cZ
 9r8NHOZiq3eP2+aHZ5PlbpOMCgc24EDFDijTFAl8+gK2EwpWm3JsNKyjScbmOgrrRfif
 hRc3XHgO9AwFzmau8d4ObCq/n3asVIeTHmqKeJtx9+El4c3/29iQM2/lZo2+cR4zIm0h
 uB5/nAghTqkviNZhO2bzfKTYEgIyI99S9jUKVgoLDGSR60c6ZnXiyn0owgcPyQoWEnrg
 B09pdWs2krETLgOtbud20e0nxhJ1rSqPunRD6TJ5QWibf8SwVyZy9vK97iGt7EbJeD+Y
 /JxQ==
X-Gm-Message-State: AOAM530pj/Jsvq0dYWCd1Z1JZG8q+PZNh7tk/8MUgnteO/k+2ChFiLyw
 UA43mGQtkI0pI1gfuHD+AZKHxlmXarutIokBwYGyIIRqxrfdSEDzP+o4U6wS64fuu6GcKiPCM4S
 dOIoA8TSj9tNm/UeVIRBcpNnuRpYzmUed6NtF8BbFRJh4X8fTo8flvdD8Xzvk
X-Received: by 2002:a5d:4b47:0:b0:20a:d4b5:83e2 with SMTP id
 w7-20020a5d4b47000000b0020ad4b583e2mr13543572wrs.503.1652697606632; 
 Mon, 16 May 2022 03:40:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw+FCiiuVctNxXx9zryq3/wbhLSCc6nfLTGuTX7HbCyhLY6eK2X6GiDwvVRLrftJcJpgQWv1A==
X-Received: by 2002:a5d:4b47:0:b0:20a:d4b5:83e2 with SMTP id
 w7-20020a5d4b47000000b0020ad4b583e2mr13543543wrs.503.1652697606252; 
 Mon, 16 May 2022 03:40:06 -0700 (PDT)
Received: from redhat.com ([2.55.141.66]) by smtp.gmail.com with ESMTPSA id
 j6-20020a05600c2b8600b00395cf2c55d5sm9133681wmc.42.2022.05.16.03.40.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 May 2022 03:40:05 -0700 (PDT)
Date: Mon, 16 May 2022 06:40:02 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Laurent Vivier <lvivier@redhat.com>,
 Jonah Palmer <jonah.palmer@oracle.com>, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Subject: [PULL 75/91] qmp: add QMP commands for virtio/vhost queue-status
Message-ID: <20220516095448.507876-76-mst@redhat.com>
References: <20220516095448.507876-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220516095448.507876-1-mst@redhat.com>
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

From: Laurent Vivier <lvivier@redhat.com>

These new commands show the internal status of a VirtIODevice's
VirtQueue and a vhost device's vhost_virtqueue (if active).

Signed-off-by: Jonah Palmer <jonah.palmer@oracle.com>
Message-Id: <1648819405-25696-7-git-send-email-jonah.palmer@oracle.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 qapi/virtio.json        | 252 ++++++++++++++++++++++++++++++++++++++++
 hw/virtio/virtio-stub.c |  14 +++
 hw/virtio/virtio.c      | 103 ++++++++++++++++
 3 files changed, 369 insertions(+)

diff --git a/qapi/virtio.json b/qapi/virtio.json
index 474a8bd64e..44cc05ceeb 100644
--- a/qapi/virtio.json
+++ b/qapi/virtio.json
@@ -404,3 +404,255 @@
   'data': { 'transports': [ 'str' ],
             '*dev-features': [ 'str' ],
             '*unknown-dev-features': 'uint64' } }
+
+##
+# @VirtQueueStatus:
+#
+# Information of a VirtIODevice VirtQueue, including most members of
+# the VirtQueue data structure.
+#
+# @name: Name of the VirtIODevice that uses this VirtQueue
+#
+# @queue-index: VirtQueue queue_index
+#
+# @inuse: VirtQueue inuse
+#
+# @vring-num: VirtQueue vring.num
+#
+# @vring-num-default: VirtQueue vring.num_default
+#
+# @vring-align: VirtQueue vring.align
+#
+# @vring-desc: VirtQueue vring.desc (descriptor area)
+#
+# @vring-avail: VirtQueue vring.avail (driver area)
+#
+# @vring-used: VirtQueue vring.used (device area)
+#
+# @last-avail-idx: VirtQueue last_avail_idx or return of vhost_dev
+#                  vhost_get_vring_base (if vhost active)
+#
+# @shadow-avail-idx: VirtQueue shadow_avail_idx
+#
+# @used-idx: VirtQueue used_idx
+#
+# @signalled-used: VirtQueue signalled_used
+#
+# @signalled-used-valid: VirtQueue signalled_used_valid flag
+#
+# Since: 7.0
+#
+##
+
+{ 'struct': 'VirtQueueStatus',
+  'data': { 'name': 'str',
+            'queue-index': 'uint16',
+            'inuse': 'uint32',
+            'vring-num': 'uint32',
+            'vring-num-default': 'uint32',
+            'vring-align': 'uint32',
+            'vring-desc': 'uint64',
+            'vring-avail': 'uint64',
+            'vring-used': 'uint64',
+            '*last-avail-idx': 'uint16',
+            '*shadow-avail-idx': 'uint16',
+            'used-idx': 'uint16',
+            'signalled-used': 'uint16',
+            'signalled-used-valid': 'bool' } }
+
+##
+# @x-query-virtio-queue-status:
+#
+# Return the status of a given VirtIODevice's VirtQueue
+#
+# @path: VirtIODevice canonical QOM path
+#
+# @queue: VirtQueue index to examine
+#
+# Features:
+# @unstable: This command is meant for debugging.
+#
+# Returns: VirtQueueStatus of the VirtQueue
+#
+# Notes: last_avail_idx will not be displayed in the case where
+#        the selected VirtIODevice has a running vhost device and
+#        the VirtIODevice VirtQueue index (queue) does not exist for
+#        the corresponding vhost device vhost_virtqueue. Also,
+#        shadow_avail_idx will not be displayed in the case where
+#        the selected VirtIODevice has a running vhost device.
+#
+# Since: 7.0
+#
+# Examples:
+#
+# 1. Get VirtQueueStatus for virtio-vsock (vhost-vsock running)
+#
+# -> { "execute": "x-query-virtio-queue-status",
+#      "arguments": { "path": "/machine/peripheral/vsock0/virtio-backend",
+#                     "queue": 1 }
+#    }
+# <- { "return": {
+#            "signalled-used": 0,
+#            "inuse": 0,
+#            "vring-align": 4096,
+#            "vring-desc": 5217370112,
+#            "signalled-used-valid": false,
+#            "vring-num-default": 128,
+#            "vring-avail": 5217372160,
+#            "queue-index": 1,
+#            "last-avail-idx": 0,
+#            "vring-used": 5217372480,
+#            "used-idx": 0,
+#            "name": "vhost-vsock",
+#            "vring-num": 128 }
+#    }
+#
+# 2. Get VirtQueueStatus for virtio-serial (no vhost)
+#
+# -> { "execute": "x-query-virtio-queue-status",
+#      "arguments": { "path": "/machine/peripheral-anon/device[0]/virtio-backend",
+#                     "queue": 20 }
+#    }
+# <- { "return": {
+#            "signalled-used": 0,
+#            "inuse": 0,
+#            "vring-align": 4096,
+#            "vring-desc": 5182074880,
+#            "signalled-used-valid": false,
+#            "vring-num-default": 128,
+#            "vring-avail": 5182076928,
+#            "queue-index": 20,
+#            "last-avail-idx": 0,
+#            "vring-used": 5182077248,
+#            "used-idx": 0,
+#            "name": "virtio-serial",
+#            "shadow-avail-idx": 0,
+#            "vring-num": 128 }
+#    }
+#
+##
+
+{ 'command': 'x-query-virtio-queue-status',
+  'data': { 'path': 'str', 'queue': 'uint16' },
+  'returns': 'VirtQueueStatus',
+  'features': [ 'unstable' ] }
+
+##
+# @VirtVhostQueueStatus:
+#
+# Information of a vhost device's vhost_virtqueue, including most
+# members of the vhost_dev vhost_virtqueue data structure.
+#
+# @name: Name of the VirtIODevice that uses this vhost_virtqueue
+#
+# @kick: vhost_virtqueue kick
+#
+# @call: vhost_virtqueue call
+#
+# @desc: vhost_virtqueue desc
+#
+# @avail: vhost_virtqueue avail
+#
+# @used: vhost_virtqueue used
+#
+# @num: vhost_virtqueue num
+#
+# @desc-phys: vhost_virtqueue desc_phys (descriptor area phys. addr.)
+#
+# @desc-size: vhost_virtqueue desc_size
+#
+# @avail-phys: vhost_virtqueue avail_phys (driver area phys. addr.)
+#
+# @avail-size: vhost_virtqueue avail_size
+#
+# @used-phys: vhost_virtqueue used_phys (device area phys. addr.)
+#
+# @used-size: vhost_virtqueue used_size
+#
+# Since: 7.0
+#
+##
+
+{ 'struct': 'VirtVhostQueueStatus',
+  'data': { 'name': 'str',
+            'kick': 'int',
+            'call': 'int',
+            'desc': 'uint64',
+            'avail': 'uint64',
+            'used': 'uint64',
+            'num': 'int',
+            'desc-phys': 'uint64',
+            'desc-size': 'uint32',
+            'avail-phys': 'uint64',
+            'avail-size': 'uint32',
+            'used-phys': 'uint64',
+            'used-size': 'uint32' } }
+
+##
+# @x-query-virtio-vhost-queue-status:
+#
+# Return information of a given vhost device's vhost_virtqueue
+#
+# @path: VirtIODevice canonical QOM path
+#
+# @queue: vhost_virtqueue index to examine
+#
+# Features:
+# @unstable: This command is meant for debugging.
+#
+# Returns: VirtVhostQueueStatus of the vhost_virtqueue
+#
+# Since: 7.0
+#
+# Examples:
+#
+# 1. Get vhost_virtqueue status for vhost-crypto
+#
+# -> { "execute": "x-query-virtio-vhost-queue-status",
+#      "arguments": { "path": "/machine/peripheral/crypto0/virtio-backend",
+#                     "queue": 0 }
+#    }
+# <- { "return": {
+#            "avail-phys": 5216124928,
+#            "used-phys": 5216127040,
+#            "avail-size": 2054,
+#            "desc-size": 16384,
+#            "used-size": 8198,
+#            "desc": 140141447430144,
+#            "num": 1024,
+#            "name": "virtio-crypto",
+#            "call": 0,
+#            "avail": 140141447446528,
+#            "desc-phys": 5216108544,
+#            "used": 140141447448640,
+#            "kick": 0 }
+#    }
+#
+# 2. Get vhost_virtqueue status for vhost-vsock
+#
+# -> { "execute": "x-query-virtio-vhost-queue-status",
+#      "arguments": { "path": "/machine/peripheral/vsock0/virtio-backend",
+#                     "queue": 0 }
+#    }
+# <- { "return": {
+#            "avail-phys": 5182261248,
+#            "used-phys": 5182261568,
+#            "avail-size": 262,
+#            "desc-size": 2048,
+#            "used-size": 1030,
+#            "desc": 140141413580800,
+#            "num": 128,
+#            "name": "vhost-vsock",
+#            "call": 0,
+#            "avail": 140141413582848,
+#            "desc-phys": 5182259200,
+#            "used": 140141413583168,
+#            "kick": 0 }
+#    }
+#
+##
+
+{ 'command': 'x-query-virtio-vhost-queue-status',
+  'data': { 'path': 'str', 'queue': 'uint16' },
+  'returns': 'VirtVhostQueueStatus',
+  'features': [ 'unstable' ] }
diff --git a/hw/virtio/virtio-stub.c b/hw/virtio/virtio-stub.c
index 0b432e8de7..13e5f93652 100644
--- a/hw/virtio/virtio-stub.c
+++ b/hw/virtio/virtio-stub.c
@@ -17,3 +17,17 @@ VirtioStatus *qmp_x_query_virtio_status(const char *path, Error **errp)
 {
     return qmp_virtio_unsupported(errp);
 }
+
+VirtVhostQueueStatus *qmp_x_query_virtio_vhost_queue_status(const char *path,
+                                                            uint16_t queue,
+                                                            Error **errp)
+{
+    return qmp_virtio_unsupported(errp);
+}
+
+VirtQueueStatus *qmp_x_query_virtio_queue_status(const char *path,
+                                                 uint16_t queue,
+                                                 Error **errp)
+{
+    return qmp_virtio_unsupported(errp);
+}
diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
index dd1ce5381b..0a4cf62bbe 100644
--- a/hw/virtio/virtio.c
+++ b/hw/virtio/virtio.c
@@ -4329,6 +4329,109 @@ VirtioStatus *qmp_x_query_virtio_status(const char *path, Error **errp)
     return status;
 }
 
+VirtVhostQueueStatus *qmp_x_query_virtio_vhost_queue_status(const char *path,
+                                                            uint16_t queue,
+                                                            Error **errp)
+{
+    VirtIODevice *vdev;
+    VirtVhostQueueStatus *status;
+
+    vdev = virtio_device_find(path);
+    if (vdev == NULL) {
+        error_setg(errp, "Path %s is not a VirtIODevice", path);
+        return NULL;
+    }
+
+    if (!vdev->vhost_started) {
+        error_setg(errp, "Error: vhost device has not started yet");
+        return NULL;
+    }
+
+    VirtioDeviceClass *vdc = VIRTIO_DEVICE_GET_CLASS(vdev);
+    struct vhost_dev *hdev = vdc->get_vhost(vdev);
+
+    if (queue < hdev->vq_index || queue >= hdev->vq_index + hdev->nvqs) {
+        error_setg(errp, "Invalid vhost virtqueue number %d", queue);
+        return NULL;
+    }
+
+    status = g_new0(VirtVhostQueueStatus, 1);
+    status->name = g_strdup(vdev->name);
+    status->kick = hdev->vqs[queue].kick;
+    status->call = hdev->vqs[queue].call;
+    status->desc = (uintptr_t)hdev->vqs[queue].desc;
+    status->avail = (uintptr_t)hdev->vqs[queue].avail;
+    status->used = (uintptr_t)hdev->vqs[queue].used;
+    status->num = hdev->vqs[queue].num;
+    status->desc_phys = hdev->vqs[queue].desc_phys;
+    status->desc_size = hdev->vqs[queue].desc_size;
+    status->avail_phys = hdev->vqs[queue].avail_phys;
+    status->avail_size = hdev->vqs[queue].avail_size;
+    status->used_phys = hdev->vqs[queue].used_phys;
+    status->used_size = hdev->vqs[queue].used_size;
+
+    return status;
+}
+
+VirtQueueStatus *qmp_x_query_virtio_queue_status(const char *path,
+                                                 uint16_t queue,
+                                                 Error **errp)
+{
+    VirtIODevice *vdev;
+    VirtQueueStatus *status;
+
+    vdev = virtio_device_find(path);
+    if (vdev == NULL) {
+        error_setg(errp, "Path %s is not a VirtIODevice", path);
+        return NULL;
+    }
+
+    if (queue >= VIRTIO_QUEUE_MAX || !virtio_queue_get_num(vdev, queue)) {
+        error_setg(errp, "Invalid virtqueue number %d", queue);
+        return NULL;
+    }
+
+    status = g_new0(VirtQueueStatus, 1);
+    status->name = g_strdup(vdev->name);
+    status->queue_index = vdev->vq[queue].queue_index;
+    status->inuse = vdev->vq[queue].inuse;
+    status->vring_num = vdev->vq[queue].vring.num;
+    status->vring_num_default = vdev->vq[queue].vring.num_default;
+    status->vring_align = vdev->vq[queue].vring.align;
+    status->vring_desc = vdev->vq[queue].vring.desc;
+    status->vring_avail = vdev->vq[queue].vring.avail;
+    status->vring_used = vdev->vq[queue].vring.used;
+    status->used_idx = vdev->vq[queue].used_idx;
+    status->signalled_used = vdev->vq[queue].signalled_used;
+    status->signalled_used_valid = vdev->vq[queue].signalled_used_valid;
+
+    if (vdev->vhost_started) {
+        VirtioDeviceClass *vdc = VIRTIO_DEVICE_GET_CLASS(vdev);
+        struct vhost_dev *hdev = vdc->get_vhost(vdev);
+
+        /* check if vq index exists for vhost as well  */
+        if (queue >= hdev->vq_index && queue < hdev->vq_index + hdev->nvqs) {
+            status->has_last_avail_idx = true;
+
+            int vhost_vq_index =
+                hdev->vhost_ops->vhost_get_vq_index(hdev, queue);
+            struct vhost_vring_state state = {
+                .index = vhost_vq_index,
+            };
+
+            status->last_avail_idx =
+                hdev->vhost_ops->vhost_get_vring_base(hdev, &state);
+        }
+    } else {
+        status->has_shadow_avail_idx = true;
+        status->has_last_avail_idx = true;
+        status->last_avail_idx = vdev->vq[queue].last_avail_idx;
+        status->shadow_avail_idx = vdev->vq[queue].shadow_avail_idx;
+    }
+
+    return status;
+}
+
 static const TypeInfo virtio_device_info = {
     .name = TYPE_VIRTIO_DEVICE,
     .parent = TYPE_DEVICE,
-- 
MST


