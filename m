Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6268450FD9A
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Apr 2022 14:51:28 +0200 (CEST)
Received: from localhost ([::1]:55828 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njKf9-0004AO-6J
	for lists+qemu-devel@lfdr.de; Tue, 26 Apr 2022 08:51:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43580)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1njKaA-0006F7-Su; Tue, 26 Apr 2022 08:46:18 -0400
Received: from mout.kundenserver.de ([212.227.17.13]:53513)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1njKa9-0007Cj-53; Tue, 26 Apr 2022 08:46:18 -0400
Received: from quad ([82.142.9.138]) by mrelayeu.kundenserver.de (mreue106
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1Mv2gw-1o0iuL0iTA-00r0u6; Tue, 26
 Apr 2022 14:46:13 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 2/5] vdpa: Add missing tracing to batch mapping functions
Date: Tue, 26 Apr 2022 14:46:07 +0200
Message-Id: <20220426124610.639614-3-laurent@vivier.eu>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220426124610.639614-1-laurent@vivier.eu>
References: <20220426124610.639614-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:jORt3lnNj4XyXmtbvkqEmtnODLHUMHrEPABvFO0gDoDJrmnZaJ4
 Hy2jGyboilxEOyO4daanT/+8qmfRJONUvcv4w8imN0ZXqRz7xt/jn9LA0FDRxPDY3rlr030
 SuwhSYy+/h+ZeyPdcEDxJjQbCWoFJLqB8wyLJcQ32JRNFUrY5qFrzsIelOdhRZj/q9iiXgC
 5NJ9ybHHqH3mbIqpeiq6w==
X-UI-Out-Filterresults: notjunk:1;V03:K0:37X0dHEP1cY=:f+df+o/j9DHZ+Eej+9Z+xr
 pzuRKXbvwWllpS2G1Roy2jw/K8ewH5AFnrY9N4DURFcYGmwR7Mt2IlCwt5mPsqrUyolUGZ3JW
 eYnIKqtxTpLfYyQh8y2MeYcmHExZhOh3UPOHPqeTtwxC2iAHxsIrZV5IlIsW/EP1Jk+agey2g
 9m3FLysA/G8Hp2fEJZxU6jUl/XDN7g/Bn0AXFmm/5ofW+c9rdVonT/rS0FffKu26jxs0nE2qS
 cnIj2j5cc6+Pkg5EwndLPm/2mp9FnI+r8gImhDwf4MwwNx8hliWEDnaG+nxBdOD+zLV99N8rI
 m7ZIYgxjGummn4Y5cuT2TyqHDwdKbhyotA/G96tFCyyRppAJhFRrkbkTYyGXe4z3nAeFjKaPC
 dP9Y03x13HtDj+12cgN9TiaHPNyslzjmESThPNbJVvMSxIwbQYLfmTPmsOFZLsmi3bj84ePF3
 IZbvU8s/SmE4HHcO8nkBAkIq8fTtHFpqbcKkhRO3Uz4H4LiL0P7Up0vxwAtjwKK0OgcacH862
 2H0jAhQodZrR4ZB/6xorT9fvjc2Da0e+WN61HwYmMUhR0XGBVUIn4Y7uCzGWdPmvJBauBPrjq
 1wVYaOtUNhr5p+BdWKQdAFt/dmykSLWSR+XmqRfvppdb5F3CFDW03pXOCrDabf9bsMMq7n5WG
 fgkpbbDs30kZ550UWfOl0AyYT7jawPrPIqXTb5nKGJDRLw4JzVCT/cmduMHQj16j+ji4=
Received-SPF: none client-ip=212.227.17.13; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>, qemu-trivial@nongnu.org,
 Jason Wang <jasowang@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Eugenio Pérez <eperezma@redhat.com>

These functions were not traced properly.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
Reviewed-by: Laurent Vivier <lvivier@redhat.com>
Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>
Acked-by: Jason Wang <jasowang@redhat.com>
Message-Id: <20220405063628.853745-1-eperezma@redhat.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 hw/virtio/trace-events | 2 ++
 hw/virtio/vhost-vdpa.c | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/hw/virtio/trace-events b/hw/virtio/trace-events
index a5102eac9e57..333348d9d5d0 100644
--- a/hw/virtio/trace-events
+++ b/hw/virtio/trace-events
@@ -25,6 +25,8 @@ vhost_user_postcopy_waker_nomatch(const char *rb, uint64_t rb_offset) "%s + 0x%"
 # vhost-vdpa.c
 vhost_vdpa_dma_map(void *vdpa, int fd, uint32_t msg_type, uint64_t iova, uint64_t size, uint64_t uaddr, uint8_t perm, uint8_t type) "vdpa:%p fd: %d msg_type: %"PRIu32" iova: 0x%"PRIx64" size: 0x%"PRIx64" uaddr: 0x%"PRIx64" perm: 0x%"PRIx8" type: %"PRIu8
 vhost_vdpa_dma_unmap(void *vdpa, int fd, uint32_t msg_type, uint64_t iova, uint64_t size, uint8_t type) "vdpa:%p fd: %d msg_type: %"PRIu32" iova: 0x%"PRIx64" size: 0x%"PRIx64" type: %"PRIu8
+vhost_vdpa_listener_begin_batch(void *v, int fd, uint32_t msg_type, uint8_t type)  "vdpa:%p fd: %d msg_type: %"PRIu32" type: %"PRIu8
+vhost_vdpa_listener_commit(void *v, int fd, uint32_t msg_type, uint8_t type)  "vdpa:%p fd: %d msg_type: %"PRIu32" type: %"PRIu8
 vhost_vdpa_listener_region_add(void *vdpa, uint64_t iova, uint64_t llend, void *vaddr, bool readonly) "vdpa: %p iova 0x%"PRIx64" llend 0x%"PRIx64" vaddr: %p read-only: %d"
 vhost_vdpa_listener_region_del(void *vdpa, uint64_t iova, uint64_t llend) "vdpa: %p iova 0x%"PRIx64" llend 0x%"PRIx64
 vhost_vdpa_add_status(void *dev, uint8_t status) "dev: %p status: 0x%"PRIx8
diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
index b57be529c7eb..a30510ed17e4 100644
--- a/hw/virtio/vhost-vdpa.c
+++ b/hw/virtio/vhost-vdpa.c
@@ -129,6 +129,7 @@ static void vhost_vdpa_listener_begin_batch(struct vhost_vdpa *v)
         .iotlb.type = VHOST_IOTLB_BATCH_BEGIN,
     };
 
+    trace_vhost_vdpa_listener_begin_batch(v, fd, msg.type, msg.iotlb.type);
     if (write(fd, &msg, sizeof(msg)) != sizeof(msg)) {
         error_report("failed to write, fd=%d, errno=%d (%s)",
                      fd, errno, strerror(errno));
@@ -163,6 +164,7 @@ static void vhost_vdpa_listener_commit(MemoryListener *listener)
     msg.type = v->msg_type;
     msg.iotlb.type = VHOST_IOTLB_BATCH_END;
 
+    trace_vhost_vdpa_listener_commit(v, fd, msg.type, msg.iotlb.type);
     if (write(fd, &msg, sizeof(msg)) != sizeof(msg)) {
         error_report("failed to write, fd=%d, errno=%d (%s)",
                      fd, errno, strerror(errno));
-- 
2.35.1


