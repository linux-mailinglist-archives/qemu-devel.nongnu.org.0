Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 406FA528352
	for <lists+qemu-devel@lfdr.de>; Mon, 16 May 2022 13:34:09 +0200 (CEST)
Received: from localhost ([::1]:37676 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqYzI-00016v-A2
	for lists+qemu-devel@lfdr.de; Mon, 16 May 2022 07:34:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48728)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nqY7G-0007qS-JE
 for qemu-devel@nongnu.org; Mon, 16 May 2022 06:38:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:36971)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nqY7E-0005Th-1t
 for qemu-devel@nongnu.org; Mon, 16 May 2022 06:38:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652697495;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2MX7GRtcGWhweVhH9nwZohY+y+oXcbntcjH/J+Q42jg=;
 b=Pu+3Puz7TBksPD+wkY6PZaqqJ1GjISWzwImOh3nHCewW3TIqJzfdz8ChuAZQcDl3fAkGnx
 Nm8fefaL8frfn29i6RH7L8dQvpvwGpjtU/Vw31agb4E6ordgdN3/Q/SY23faoZKi+IWLbP
 PFEiJgrrAJS2TEzTocuEYaLfrH2IYQQ=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-665-0FpJq-VVOZajDDWJtKI34A-1; Mon, 16 May 2022 06:38:14 -0400
X-MC-Unique: 0FpJq-VVOZajDDWJtKI34A-1
Received: by mail-wm1-f69.google.com with SMTP id
 g14-20020a1c4e0e000000b0039425ef54d6so5435975wmh.9
 for <qemu-devel@nongnu.org>; Mon, 16 May 2022 03:38:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=2MX7GRtcGWhweVhH9nwZohY+y+oXcbntcjH/J+Q42jg=;
 b=aESe3Z3LSUGukdn6utI3v9B6fBjw4qqWvVG5OvF3Fv8zXc7wmUE1BbPlLPzxpiymuv
 QYAGcYkHMBVQl157c7or42/zsvgzPpdxnso4zT3585b8k/DLETRrTxOHanECg4YXx6Ro
 QMGx2qDYcrTDYm/lzJA5tKGbxn25EWSInt1dfffu43lhXeXSKuVHs8P1jXDmDGK0r0cM
 hDxCwDTA3E7p9zNrpLngiYjW//ZbuZc0tSdIDAzIpcG8qJ90AEib4tYfL8AfKqTl581l
 0LSZP+/Or/Yh+/4Nsbb11nvzHMs96FV9r3LNeUXYL8F4Na9t2Ny8tLDoS8oMjhRHbjWE
 GMzQ==
X-Gm-Message-State: AOAM532TmFj0e91yQp2V04SWAV6grfVHfMgMI29nJvjShEfStw3saFPf
 egKZvqBIFUcYbi8L3lZgp8l0sknRdLUsImTC4tB7rIWROaTu1l73ZukOBENmGvS760I0slsqvDt
 JIp5A3N4tB5DZOeEC0Zr0obTO+VsAvFDzj0S8g3ozLWs6ktxJ0a8sG5hFI6bh
X-Received: by 2002:a05:600c:5113:b0:394:800c:4c36 with SMTP id
 o19-20020a05600c511300b00394800c4c36mr16350822wms.93.1652697492784; 
 Mon, 16 May 2022 03:38:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzuH1f32gX7zp8qZoQG+UcmE48Mo4k6E8mOKfd2YL5xUjXFP/vU85dTRuhs0XhWV5tG1QTceA==
X-Received: by 2002:a05:600c:5113:b0:394:800c:4c36 with SMTP id
 o19-20020a05600c511300b00394800c4c36mr16350801wms.93.1652697492573; 
 Mon, 16 May 2022 03:38:12 -0700 (PDT)
Received: from redhat.com ([2.55.141.66]) by smtp.gmail.com with ESMTPSA id
 i13-20020adfb64d000000b0020ce1c1cf31sm9145785wre.21.2022.05.16.03.38.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 May 2022 03:38:12 -0700 (PDT)
Date: Mon, 16 May 2022 06:38:10 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eugenio =?utf-8?B?UMOpcmV6?= <eperezma@redhat.com>
Subject: [PULL 44/91] vhost: Fix device's used descriptor dequeue
Message-ID: <20220516095448.507876-45-mst@redhat.com>
References: <20220516095448.507876-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
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

From: Eugenio Pérez <eperezma@redhat.com>

Only the first one of them were properly enqueued back.

Fixes: 100890f7ca ("vhost: Shadow virtqueue buffers forwarding")

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
Message-Id: <20220512175747.142058-3-eperezma@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/virtio/vhost-shadow-virtqueue.c | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/hw/virtio/vhost-shadow-virtqueue.c b/hw/virtio/vhost-shadow-virtqueue.c
index 1d6552b0fe..a8376ef82b 100644
--- a/hw/virtio/vhost-shadow-virtqueue.c
+++ b/hw/virtio/vhost-shadow-virtqueue.c
@@ -334,12 +334,22 @@ static void vhost_svq_disable_notification(VhostShadowVirtqueue *svq)
     svq->vring.avail->flags |= cpu_to_le16(VRING_AVAIL_F_NO_INTERRUPT);
 }
 
+static uint16_t vhost_svq_last_desc_of_chain(const VhostShadowVirtqueue *svq,
+                                             uint16_t num, uint16_t i)
+{
+    for (uint16_t j = 0; j < (num - 1); ++j) {
+        i = le16_to_cpu(svq->desc_next[i]);
+    }
+
+    return i;
+}
+
 static VirtQueueElement *vhost_svq_get_buf(VhostShadowVirtqueue *svq,
                                            uint32_t *len)
 {
     const vring_used_t *used = svq->vring.used;
     vring_used_elem_t used_elem;
-    uint16_t last_used;
+    uint16_t last_used, last_used_chain, num;
 
     if (!vhost_svq_more_used(svq)) {
         return NULL;
@@ -365,7 +375,10 @@ static VirtQueueElement *vhost_svq_get_buf(VhostShadowVirtqueue *svq,
         return NULL;
     }
 
-    svq->desc_next[used_elem.id] = svq->free_head;
+    num = svq->ring_id_maps[used_elem.id]->in_num +
+          svq->ring_id_maps[used_elem.id]->out_num;
+    last_used_chain = vhost_svq_last_desc_of_chain(svq, num, used_elem.id);
+    svq->desc_next[last_used_chain] = svq->free_head;
     svq->free_head = used_elem.id;
 
     *len = used_elem.len;
-- 
MST


