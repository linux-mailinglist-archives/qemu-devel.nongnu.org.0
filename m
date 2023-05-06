Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A3D526F9298
	for <lists+qemu-devel@lfdr.de>; Sat,  6 May 2023 17:02:42 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pvJPe-0004Pl-Ex; Sat, 06 May 2023 11:01:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yin31149@gmail.com>)
 id 1pvJPc-0004P0-Gq; Sat, 06 May 2023 11:01:28 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yin31149@gmail.com>)
 id 1pvJPa-0000EH-UE; Sat, 06 May 2023 11:01:28 -0400
Received: by mail-pl1-x635.google.com with SMTP id
 d9443c01a7336-1aaff9c93a5so19142375ad.2; 
 Sat, 06 May 2023 08:01:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683385285; x=1685977285;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=sQcJww+tK3jo1g57lln2zj62XytskH9OTRJmBKZntj8=;
 b=gbXqaKyxu3FYvFRVmPmM3NrQVr+GJAr6Y+CWQraEr8eh85L6kTnY3pNXhtczPrD6Yr
 zF9yK8IKr9wHRN84QbKlKzIHtstuxcuOEII4bIzB/Jz7CzSKF8/PNMOUpm5nZGd3oA5i
 VrRCMT8tB/csRx7kadTGH1cT5wO2jnhYgIqzNRzAX6RkWAEOIxmbvfg8u/Ul5MiXuUc7
 tvgKAA8JfZpITt0AQxcWB/6bxOwm6SToSdkUW1/MZwsFekaGVDX7V/vShXEpirAeE0nC
 lfavAXDOC+CLpo10UT0OGhO4rSUn3BXfEZvJyFFOsw7JoTnDfzXqRzFkGrXnQrbzKqJN
 1UEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683385285; x=1685977285;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=sQcJww+tK3jo1g57lln2zj62XytskH9OTRJmBKZntj8=;
 b=gM0ndlXuq5VMtrqt+L+iarvQ4DsjPGpLzP3b1SUeoWVi16oZ004uf9hQ/pexSxxWRK
 xAy287Vqi18PIbEfzVIqyoQ9zr4FWBTcMNXi1C6qaqaeZ0gktP4eOE4OINxspqA4A+8u
 vDiPwmdOZOS8IuH3qfW2HujQwvKfCRx0r57jNiQ6e82xszoNW913Orm72I9/NYz1oE+0
 3qQLY+s7FKBgbghXGtNJaHrm0xHdPR6giaEUmKx6VMZZHRg46ubaLm/VRE3uHa7lVVhs
 lKqNvIeOUPONnrBSlyq5jgRxHtTA1MgeO4eJ+a5+zh0yDwywUewcfusuZbeyrcYRXOWS
 HJzQ==
X-Gm-Message-State: AC+VfDzl5UEeXYt74Ab5zpnwE9x28fhO8Fz3O57macuYLrxcLGSjMSQQ
 o3estmvecCkB2sxkIdQn7H0=
X-Google-Smtp-Source: ACHHUZ4FrLQj/ZX3JZtL+YgB6oXFmWs8hRqR6ayU/Py88dmKowqZs7Gx0HyAf8Ycbu12Pflp1bCndQ==
X-Received: by 2002:a17:902:c945:b0:1a9:546c:1593 with SMTP id
 i5-20020a170902c94500b001a9546c1593mr5985860pla.14.1683385284877; 
 Sat, 06 May 2023 08:01:24 -0700 (PDT)
Received: from localhost ([159.226.94.115]) by smtp.gmail.com with ESMTPSA id
 v13-20020a170903238d00b001aafdf8063dsm3753551plh.157.2023.05.06.08.01.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 06 May 2023 08:01:24 -0700 (PDT)
From: Hawkins Jiawei <yin31149@gmail.com>
To: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
Cc: yin31149@gmail.com, 18801353760@163.com, qemu-devel@nongnu.org,
 qemu-stable@nongnu.org
Subject: [PATCH RESEND] vhost: fix possible wrap in SVQ descriptor ring
Date: Sat,  6 May 2023 23:01:11 +0800
Message-Id: <20230506150111.2496-1-yin31149@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=yin31149@gmail.com; helo=mail-pl1-x635.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

QEMU invokes vhost_svq_add() when adding a guest's element into SVQ.
In vhost_svq_add(), it uses vhost_svq_available_slots() to check
whether QEMU can add the element into the SVQ. If there is
enough space, then QEMU combines some out descriptors and
some in descriptors into one descriptor chain, and add it into
svq->vring.desc by vhost_svq_vring_write_descs().

Yet the problem is that, `svq->shadow_avail_idx - svq->shadow_used_idx`
in vhost_svq_available_slots() return the number of occupied elements,
or the number of descriptor chains, instead of the number of occupied
descriptors, which may cause wrapping in SVQ descriptor ring.

Here is an example. In vhost_handle_guest_kick(), QEMU forwards
as many available buffers to device by virtqueue_pop() and
vhost_svq_add_element(). virtqueue_pop() return a guest's element,
and use vhost_svq_add_elemnt(), a wrapper to vhost_svq_add(), to
add this element into SVQ. If QEMU invokes virtqueue_pop() and
vhost_svq_add_element() `svq->vring.num` times, vhost_svq_available_slots()
thinks QEMU just ran out of slots and everything should work fine.
But in fact, virtqueue_pop() return `svq-vring.num` elements or
descriptor chains, more than `svq->vring.num` descriptors, due to
guest memory fragmentation, and this cause wrapping in SVQ descriptor ring.

Therefore, this patch adds `num_free` field in VhostShadowVirtqueue
structure, updates this field in vhost_svq_add() and
vhost_svq_get_buf(), to record the number of free descriptors.
Then we can avoid wrap in SVQ descriptor ring by refactoring
vhost_svq_available_slots().

Fixes: 100890f7ca ("vhost: Shadow virtqueue buffers forwarding")
Signed-off-by: Hawkins Jiawei <yin31149@gmail.com>
---
 hw/virtio/vhost-shadow-virtqueue.c | 9 ++++++++-
 hw/virtio/vhost-shadow-virtqueue.h | 3 +++
 2 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/hw/virtio/vhost-shadow-virtqueue.c b/hw/virtio/vhost-shadow-virtqueue.c
index 8361e70d1b..e1c6952b10 100644
--- a/hw/virtio/vhost-shadow-virtqueue.c
+++ b/hw/virtio/vhost-shadow-virtqueue.c
@@ -68,7 +68,7 @@ bool vhost_svq_valid_features(uint64_t features, Error **errp)
  */
 static uint16_t vhost_svq_available_slots(const VhostShadowVirtqueue *svq)
 {
-    return svq->vring.num - (svq->shadow_avail_idx - svq->shadow_used_idx);
+    return svq->num_free;
 }
 
 /**
@@ -263,6 +263,9 @@ int vhost_svq_add(VhostShadowVirtqueue *svq, const struct iovec *out_sg,
         return -EINVAL;
     }
 
+    /* Update the size of SVQ vring free descriptors */
+    svq->num_free -= ndescs;
+
     svq->desc_state[qemu_head].elem = elem;
     svq->desc_state[qemu_head].ndescs = ndescs;
     vhost_svq_kick(svq);
@@ -450,6 +453,9 @@ static VirtQueueElement *vhost_svq_get_buf(VhostShadowVirtqueue *svq,
     svq->desc_next[last_used_chain] = svq->free_head;
     svq->free_head = used_elem.id;
 
+    /* Update the size of SVQ vring free descriptors */
+    svq->num_free += num;
+
     *len = used_elem.len;
     return g_steal_pointer(&svq->desc_state[used_elem.id].elem);
 }
@@ -659,6 +665,7 @@ void vhost_svq_start(VhostShadowVirtqueue *svq, VirtIODevice *vdev,
     svq->iova_tree = iova_tree;
 
     svq->vring.num = virtio_queue_get_num(vdev, virtio_get_queue_index(vq));
+    svq->num_free = svq->vring.num;
     driver_size = vhost_svq_driver_area_size(svq);
     device_size = vhost_svq_device_area_size(svq);
     svq->vring.desc = qemu_memalign(qemu_real_host_page_size(), driver_size);
diff --git a/hw/virtio/vhost-shadow-virtqueue.h b/hw/virtio/vhost-shadow-virtqueue.h
index 926a4897b1..6efe051a70 100644
--- a/hw/virtio/vhost-shadow-virtqueue.h
+++ b/hw/virtio/vhost-shadow-virtqueue.h
@@ -107,6 +107,9 @@ typedef struct VhostShadowVirtqueue {
 
     /* Next head to consume from the device */
     uint16_t last_used_idx;
+
+    /* Size of SVQ vring free descriptors */
+    uint16_t num_free;
 } VhostShadowVirtqueue;
 
 bool vhost_svq_valid_features(uint64_t features, Error **errp);
-- 
2.25.1


