Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5301A6FC1F2
	for <lists+qemu-devel@lfdr.de>; Tue,  9 May 2023 10:49:33 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwJ1Y-0006Ee-Sd; Tue, 09 May 2023 04:48:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yin31149@gmail.com>)
 id 1pwJ1I-0006DM-5m; Tue, 09 May 2023 04:48:28 -0400
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yin31149@gmail.com>)
 id 1pwJ1G-0001pT-7q; Tue, 09 May 2023 04:48:27 -0400
Received: by mail-pf1-x433.google.com with SMTP id
 d2e1a72fcca58-644d9bf05b7so2038550b3a.3; 
 Tue, 09 May 2023 01:48:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683622104; x=1686214104;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=8YWZznxekCGHOUt9lsXJL5/9fhxPUNXrQOeDoRF7DHg=;
 b=BbgDSusJ/aY04Qil4N2hgDAI6euzxUUBUR9NC2X2m//RDiVcthhkgeNAw0rPHBFApr
 UK/0UILjD6/ekspaX1YIoigBhCRwH03uLtpWEQduoqNMSCZdByXxtRBL7l0vHcf+D0Wk
 Co3dXLVHTBkDttX8U3E9dPatNIWqjflVRYcfGH/fb5P73pxCoXjeWtESS1HXeeRZaEcJ
 PER7DWcE3rohteuEfjX9mZVLszPvLEVspx6dUZZUI6ghRbp2hXjoOGe4z4eTV3+rGob8
 Jnvgb6T2/AjbWLeJEtlYts/N7x1tGTZh6kFmol83PWU37vQM3DZ/PgiHSHCANajM0uWS
 kXFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683622104; x=1686214104;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8YWZznxekCGHOUt9lsXJL5/9fhxPUNXrQOeDoRF7DHg=;
 b=HwkqzvnTVM9P2KQqWVxCa5X9fv6w+JvQRNSBjriJGJyga0pxCXUyu0G1863R3OUIl9
 w/n/4Bp0yuJKyAIfHR/e11pQACGmadsFaoANWoAE29Ow7el+aueON4B2MT8eTCdHbkim
 MJ24YY5VrPs6vceS4/8WmsICG9YW4Pgz17hNoPZBeJBIpGJG+o59xpoQMGHPFo0QVtkO
 gjd3MN1muT5ZDRQkNaqnbfDZDpHJ0IVAf0gNBE2+wGRMTcR+3caGLX6a9NZ/tx83GIUY
 fBSVNg35kzLtzhcFrRxZU82i0IVJtJop5whKzEOTwNtptqYmENbUE4nTnJcx11I3SsXS
 x7Jg==
X-Gm-Message-State: AC+VfDzbkSVC9O4WrrXhFxGWP404fNv7WrTYPG60z0j39exZaGE6PS7f
 ZAS0/jQL/fSXvcOQYzinnTo=
X-Google-Smtp-Source: ACHHUZ6po4dT3ZVKyiAPNG8P7pI1iGHlse9Jywed8G0fYCKhy0hFu/JNnE/nj3IzpRxN+YNEZY0+UA==
X-Received: by 2002:a05:6a20:e308:b0:f3:4de2:dd60 with SMTP id
 nb8-20020a056a20e30800b000f34de2dd60mr15386933pzb.61.1683622103929; 
 Tue, 09 May 2023 01:48:23 -0700 (PDT)
Received: from localhost ([183.242.254.166]) by smtp.gmail.com with ESMTPSA id
 t23-20020a634457000000b0051afa49e07asm832852pgk.50.2023.05.09.01.48.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 May 2023 01:48:23 -0700 (PDT)
From: Hawkins Jiawei <yin31149@gmail.com>
To: "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
Cc: yin31149@gmail.com, 18801353760@163.com, qemu-devel@nongnu.org,
 qemu-stable@nongnu.org
Subject: [PATCH v2] vhost: fix possible wrap in SVQ descriptor ring
Date: Tue,  9 May 2023 16:48:17 +0800
Message-Id: <20230509084817.3973-1-yin31149@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=yin31149@gmail.com; helo=mail-pf1-x433.google.com
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

QEMU invokes vhost_svq_add() when adding a guest's element
into SVQ. In vhost_svq_add(), it uses vhost_svq_available_slots()
to check whether QEMU can add the element into SVQ. If there is
enough space, then QEMU combines some out descriptors and some
in descriptors into one descriptor chain, and adds it into
`svq->vring.desc` by vhost_svq_vring_write_descs().

Yet the problem is that, `svq->shadow_avail_idx - svq->shadow_used_idx`
in vhost_svq_available_slots() returns the number of occupied elements,
or the number of descriptor chains, instead of the number of occupied
descriptors, which may cause wrapping in SVQ descriptor ring.

Here is an example. In vhost_handle_guest_kick(), QEMU forwards
as many available buffers to device by virtqueue_pop() and
vhost_svq_add_element(). virtqueue_pop() returns a guest's element,
and then this element is added into SVQ by vhost_svq_add_element(),
a wrapper to vhost_svq_add(). If QEMU invokes virtqueue_pop() and
vhost_svq_add_element() `svq->vring.num` times,
vhost_svq_available_slots() thinks QEMU just ran out of slots and
everything should work fine. But in fact, virtqueue_pop() returns
`svq->vring.num` elements or descriptor chains, more than
`svq->vring.num` descriptors due to guest memory fragmentation,
and this causes wrapping in SVQ descriptor ring.

This bug is valid even before marking the descriptors used.
If the guest memory is fragmented, SVQ must add chains
so it can try to add more descriptors than possible.

This patch solves it by adding `num_free` field in
VhostShadowVirtqueue structure and updating this field
in vhost_svq_add() and vhost_svq_get_buf(), to record
the number of free descriptors.

Fixes: 100890f7ca ("vhost: Shadow virtqueue buffers forwarding")
Signed-off-by: Hawkins Jiawei <yin31149@gmail.com>
Acked-by: Eugenio Pérez <eperezma@redhat.com>
---
v2:
  - update the commit message
  - remove the unnecessary comment
  - add the Acked-by tag

v1: https://lists.gnu.org/archive/html/qemu-devel/2023-05/msg01727.html

 hw/virtio/vhost-shadow-virtqueue.c | 5 ++++-
 hw/virtio/vhost-shadow-virtqueue.h | 3 +++
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/hw/virtio/vhost-shadow-virtqueue.c b/hw/virtio/vhost-shadow-virtqueue.c
index 8361e70d1b..bd7c12b6d3 100644
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
@@ -263,6 +263,7 @@ int vhost_svq_add(VhostShadowVirtqueue *svq, const struct iovec *out_sg,
         return -EINVAL;
     }
 
+    svq->num_free -= ndescs;
     svq->desc_state[qemu_head].elem = elem;
     svq->desc_state[qemu_head].ndescs = ndescs;
     vhost_svq_kick(svq);
@@ -449,6 +450,7 @@ static VirtQueueElement *vhost_svq_get_buf(VhostShadowVirtqueue *svq,
     last_used_chain = vhost_svq_last_desc_of_chain(svq, num, used_elem.id);
     svq->desc_next[last_used_chain] = svq->free_head;
     svq->free_head = used_elem.id;
+    svq->num_free += num;
 
     *len = used_elem.len;
     return g_steal_pointer(&svq->desc_state[used_elem.id].elem);
@@ -659,6 +661,7 @@ void vhost_svq_start(VhostShadowVirtqueue *svq, VirtIODevice *vdev,
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


