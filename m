Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C4203C4869
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Oct 2019 09:22:12 +0200 (CEST)
Received: from localhost ([::1]:52232 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iFYxf-0003Pf-Qf
	for lists+qemu-devel@lfdr.de; Wed, 02 Oct 2019 03:22:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56686)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mikhail.sennikovskii@cloud.ionos.com>)
 id 1iFYva-0001xX-Gv
 for qemu-devel@nongnu.org; Wed, 02 Oct 2019 03:20:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mikhail.sennikovskii@cloud.ionos.com>)
 id 1iFYvZ-0006DL-1R
 for qemu-devel@nongnu.org; Wed, 02 Oct 2019 03:20:02 -0400
Received: from mail-ed1-x542.google.com ([2a00:1450:4864:20::542]:45725)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <mikhail.sennikovskii@cloud.ionos.com>)
 id 1iFYvY-0006Bw-PQ
 for qemu-devel@nongnu.org; Wed, 02 Oct 2019 03:20:00 -0400
Received: by mail-ed1-x542.google.com with SMTP id h33so14209569edh.12
 for <qemu-devel@nongnu.org>; Wed, 02 Oct 2019 00:20:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cloud.ionos.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=19W0eOoTuraQeZeHO2eZBSMYlX1E0zDD99C78StSA/I=;
 b=S/mJf//tO1OqMZiMWNRLlMwiWPVJVFtpDBGPuYi44ApGysKV5TiU5hFdMOOpN+H6+m
 PxsSVKic6oUoX1xr9KzBRqdM8mmGxgko2v+tDvaIgiLITgbesH3SJfrVFxY4S7xMtJp5
 +vnfpEL8hR3Oll7v7ot26Q5PdYDQMTRWhiGfKZxBVMPGIgusFCHzsvh/3fyn7WaegQFf
 pYb8R5KnT9ZVwVXb5xPqTEB9hqKwX59E0iyQB+1oE+rVwP/pm6pOVYQcGMIh0ITlYVJa
 gvfSRUNrS+eIkcdIMOKjWx0twMcdxFcfDH+rrtYwGcvznGAVb6W2Jn9oGxwnJk4Y/jsV
 rgWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=19W0eOoTuraQeZeHO2eZBSMYlX1E0zDD99C78StSA/I=;
 b=etu2NOxsPH27pSWylWt2OYyTzAIhb/CT0cDfYS8pu0Ti2Hcr2NEhYRF+50Jg1gkbVM
 DkyOWwCG9Nac8KvJs4UEWx+C7SqVnyYcrCj9w73B5W+tlP997ll0ck+6AYbPoHfWq9Ut
 b87dzXSgOi0H9a+W7HrHq/Dw08PwEZrnUUQ5UoThVabZUfrq+VhuRE9869BwQ87U7pu0
 uDjzuiSjj8DTxu/DePMdvVHrgO/4U78CxFzYahT91sD5o0j75CYgamvSl8Olb0cdr7By
 2JqpIRd18vnZnPUdMicb6ac0YJUUAm/cq6CmTwJ1vV0+saa517u8Ijqc/+O2WIMqArXm
 Ataw==
X-Gm-Message-State: APjAAAW7iisn1mFGSM70LofPaQSX0o4lzIeu3PYdbbR5bYY3aeZPD27V
 NNpW5f2UPmUvkcH6zKQc2zlCB9rzsXc=
X-Google-Smtp-Source: APXvYqwrs68l9tn7G7xqxYuJQRhyf6YM1OUP/BT74oSB8fdXPiqIxq0H5twVux4zU9POMEAtE2x1pg==
X-Received: by 2002:a17:907:441d:: with SMTP id
 om21mr1845482ejb.188.1570000799263; 
 Wed, 02 Oct 2019 00:19:59 -0700 (PDT)
Received: from msennikovskii2.pb.local
 ([2001:1438:4010:2558:d098:3701:97c4:7b4e])
 by smtp.googlemail.com with ESMTPSA id y22sm2147648eje.42.2019.10.02.00.19.58
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Wed, 02 Oct 2019 00:19:58 -0700 (PDT)
From: Mikhail Sennikovsky <mikhail.sennikovskii@cloud.ionos.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2] virtio-net: prevent offloads reset on migration
Date: Wed,  2 Oct 2019 09:19:45 +0200
Message-Id: <1570000785-9257-2-git-send-email-mikhail.sennikovskii@cloud.ionos.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1570000785-9257-1-git-send-email-mikhail.sennikovskii@cloud.ionos.com>
References: <1570000785-9257-1-git-send-email-mikhail.sennikovskii@cloud.ionos.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::542
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
Cc: Mikhail Sennikovsky <mikhail.sennikovskii@cloud.ionos.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Currently offloads disabled by guest via the VIRTIO_NET_CTRL_GUEST_OFFLOADS_SET
command are not preserved on VM migration.
Instead all offloads reported by guest features (via VIRTIO_PCI_GUEST_FEATURES)
get enabled.
What happens is: first the VirtIONet::curr_guest_offloads gets restored and offloads
are getting set correctly:

 #0  qemu_set_offload (nc=0x555556a11400, csum=1, tso4=0, tso6=0, ecn=0, ufo=0) at net/net.c:474
 #1  virtio_net_apply_guest_offloads (n=0x555557701ca0) at hw/net/virtio-net.c:720
 #2  virtio_net_post_load_device (opaque=0x555557701ca0, version_id=11) at hw/net/virtio-net.c:2334
 #3  vmstate_load_state (f=0x5555569dc010, vmsd=0x555556577c80 <vmstate_virtio_net_device>, opaque=0x555557701ca0, version_id=11)
     at migration/vmstate.c:168
 #4  virtio_load (vdev=0x555557701ca0, f=0x5555569dc010, version_id=11) at hw/virtio/virtio.c:2197
 #5  virtio_device_get (f=0x5555569dc010, opaque=0x555557701ca0, size=0, field=0x55555668cd00 <__compound_literal.5>) at hw/virtio/virtio.c:2036
 #6  vmstate_load_state (f=0x5555569dc010, vmsd=0x555556577ce0 <vmstate_virtio_net>, opaque=0x555557701ca0, version_id=11) at migration/vmstate.c:143
 #7  vmstate_load (f=0x5555569dc010, se=0x5555578189e0) at migration/savevm.c:829
 #8  qemu_loadvm_section_start_full (f=0x5555569dc010, mis=0x5555569eee20) at migration/savevm.c:2211
 #9  qemu_loadvm_state_main (f=0x5555569dc010, mis=0x5555569eee20) at migration/savevm.c:2395
 #10 qemu_loadvm_state (f=0x5555569dc010) at migration/savevm.c:2467
 #11 process_incoming_migration_co (opaque=0x0) at migration/migration.c:449

However later on the features are getting restored, and offloads get reset to
everything supported by features:

 #0  qemu_set_offload (nc=0x555556a11400, csum=1, tso4=1, tso6=1, ecn=0, ufo=0) at net/net.c:474
 #1  virtio_net_apply_guest_offloads (n=0x555557701ca0) at hw/net/virtio-net.c:720
 #2  virtio_net_set_features (vdev=0x555557701ca0, features=5104441767) at hw/net/virtio-net.c:773
 #3  virtio_set_features_nocheck (vdev=0x555557701ca0, val=5104441767) at hw/virtio/virtio.c:2052
 #4  virtio_load (vdev=0x555557701ca0, f=0x5555569dc010, version_id=11) at hw/virtio/virtio.c:2220
 #5  virtio_device_get (f=0x5555569dc010, opaque=0x555557701ca0, size=0, field=0x55555668cd00 <__compound_literal.5>) at hw/virtio/virtio.c:2036
 #6  vmstate_load_state (f=0x5555569dc010, vmsd=0x555556577ce0 <vmstate_virtio_net>, opaque=0x555557701ca0, version_id=11) at migration/vmstate.c:143
 #7  vmstate_load (f=0x5555569dc010, se=0x5555578189e0) at migration/savevm.c:829
 #8  qemu_loadvm_section_start_full (f=0x5555569dc010, mis=0x5555569eee20) at migration/savevm.c:2211
 #9  qemu_loadvm_state_main (f=0x5555569dc010, mis=0x5555569eee20) at migration/savevm.c:2395
 #10 qemu_loadvm_state (f=0x5555569dc010) at migration/savevm.c:2467
 #11 process_incoming_migration_co (opaque=0x0) at migration/migration.c:449

This patch fixes this by adding an extra argument to the set_features callback,
specifying whether the offloads are to be reset, and setting it to false
for the migration case.

Signed-off-by: Mikhail Sennikovsky <mikhail.sennikovskii@cloud.ionos.com>
---
 hw/display/virtio-gpu-base.c |  3 ++-
 hw/net/virtio-net.c          |  5 +++--
 hw/virtio/virtio.c           | 11 ++++++-----
 include/hw/virtio/virtio.h   |  2 +-
 4 files changed, 12 insertions(+), 9 deletions(-)

diff --git a/hw/display/virtio-gpu-base.c b/hw/display/virtio-gpu-base.c
index 55e0799..04d8a23 100644
--- a/hw/display/virtio-gpu-base.c
+++ b/hw/display/virtio-gpu-base.c
@@ -193,7 +193,8 @@ virtio_gpu_base_get_features(VirtIODevice *vdev, uint64_t features,
 }
 
 static void
-virtio_gpu_base_set_features(VirtIODevice *vdev, uint64_t features)
+virtio_gpu_base_set_features(VirtIODevice *vdev, uint64_t features,
+                               bool reset_offloads)
 {
     static const uint32_t virgl = (1 << VIRTIO_GPU_F_VIRGL);
     VirtIOGPUBase *g = VIRTIO_GPU_BASE(vdev);
diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
index b9e1cd7..5d108e5 100644
--- a/hw/net/virtio-net.c
+++ b/hw/net/virtio-net.c
@@ -743,7 +743,8 @@ static inline uint64_t virtio_net_supported_guest_offloads(VirtIONet *n)
     return virtio_net_guest_offloads_by_features(vdev->guest_features);
 }
 
-static void virtio_net_set_features(VirtIODevice *vdev, uint64_t features)
+static void virtio_net_set_features(VirtIODevice *vdev, uint64_t features,
+                                        bool reset_offloads)
 {
     VirtIONet *n = VIRTIO_NET(vdev);
     int i;
@@ -767,7 +768,7 @@ static void virtio_net_set_features(VirtIODevice *vdev, uint64_t features)
     n->rsc6_enabled = virtio_has_feature(features, VIRTIO_NET_F_RSC_EXT) &&
         virtio_has_feature(features, VIRTIO_NET_F_GUEST_TSO6);
 
-    if (n->has_vnet_hdr) {
+    if (reset_offloads && n->has_vnet_hdr) {
         n->curr_guest_offloads =
             virtio_net_guest_offloads_by_features(features);
         virtio_net_apply_guest_offloads(n);
diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
index a94ea18..70759f2 100644
--- a/hw/virtio/virtio.c
+++ b/hw/virtio/virtio.c
@@ -2042,14 +2042,15 @@ const VMStateInfo  virtio_vmstate_info = {
     .put = virtio_device_put,
 };
 
-static int virtio_set_features_nocheck(VirtIODevice *vdev, uint64_t val)
+static int virtio_set_features_nocheck(VirtIODevice *vdev, uint64_t val,
+                              bool reset_offloads)
 {
     VirtioDeviceClass *k = VIRTIO_DEVICE_GET_CLASS(vdev);
     bool bad = (val & ~(vdev->host_features)) != 0;
 
     val &= vdev->host_features;
     if (k->set_features) {
-        k->set_features(vdev, val);
+        k->set_features(vdev, val, reset_offloads);
     }
     vdev->guest_features = val;
     return bad ? -1 : 0;
@@ -2065,7 +2066,7 @@ int virtio_set_features(VirtIODevice *vdev, uint64_t val)
     if (vdev->status & VIRTIO_CONFIG_S_FEATURES_OK) {
         return -EINVAL;
     }
-    ret = virtio_set_features_nocheck(vdev, val);
+    ret = virtio_set_features_nocheck(vdev, val, true);
     if (!ret) {
         if (virtio_vdev_has_feature(vdev, VIRTIO_RING_F_EVENT_IDX)) {
             /* VIRTIO_RING_F_EVENT_IDX changes the size of the caches.  */
@@ -2217,14 +2218,14 @@ int virtio_load(VirtIODevice *vdev, QEMUFile *f, int version_id)
          * host_features.
          */
         uint64_t features64 = vdev->guest_features;
-        if (virtio_set_features_nocheck(vdev, features64) < 0) {
+        if (virtio_set_features_nocheck(vdev, features64, false) < 0) {
             error_report("Features 0x%" PRIx64 " unsupported. "
                          "Allowed features: 0x%" PRIx64,
                          features64, vdev->host_features);
             return -1;
         }
     } else {
-        if (virtio_set_features_nocheck(vdev, features) < 0) {
+        if (virtio_set_features_nocheck(vdev, features, false) < 0) {
             error_report("Features 0x%x unsupported. "
                          "Allowed features: 0x%" PRIx64,
                          features, vdev->host_features);
diff --git a/include/hw/virtio/virtio.h b/include/hw/virtio/virtio.h
index b189788..fd8cac5 100644
--- a/include/hw/virtio/virtio.h
+++ b/include/hw/virtio/virtio.h
@@ -128,7 +128,7 @@ typedef struct VirtioDeviceClass {
                              uint64_t requested_features,
                              Error **errp);
     uint64_t (*bad_features)(VirtIODevice *vdev);
-    void (*set_features)(VirtIODevice *vdev, uint64_t val);
+    void (*set_features)(VirtIODevice *vdev, uint64_t val, bool reset_offloads);
     int (*validate_features)(VirtIODevice *vdev);
     void (*get_config)(VirtIODevice *vdev, uint8_t *config);
     void (*set_config)(VirtIODevice *vdev, const uint8_t *config);
-- 
2.7.4


