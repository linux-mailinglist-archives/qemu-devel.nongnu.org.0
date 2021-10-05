Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DECCA422DE0
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Oct 2021 18:24:24 +0200 (CEST)
Received: from localhost ([::1]:37246 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXnEt-0007R8-UN
	for lists+qemu-devel@lfdr.de; Tue, 05 Oct 2021 12:24:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46778)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mXmsN-0008O1-DS
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 12:01:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23824)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mXmsL-0004dv-OE
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 12:01:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633449664;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3fYa6vJLW2VmUzZYvrPmX+saUCEhMTSNzZACWsAw/4Q=;
 b=YF5iPDd/Xmwll4JfJTMO9teFDppC0HHB/jM9GWcyDT6m8Wr7Fn7UgxPCUwCv0MsY0R3jWm
 jY150vJFcRoNy+SIJEC4lkSlRBWow5qR7HUHP7vrgZ6GQS9qhsZkYKdDNvsxzs04KHdI+w
 q1AJLKMXdJLeZo2BAnITNrQ3lk21eig=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-270-WvNToLLRO464PcI5AiX1sQ-1; Tue, 05 Oct 2021 12:01:03 -0400
X-MC-Unique: WvNToLLRO464PcI5AiX1sQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 m9-20020a05600c4f4900b003057c761567so1500971wmq.1
 for <qemu-devel@nongnu.org>; Tue, 05 Oct 2021 09:01:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=3fYa6vJLW2VmUzZYvrPmX+saUCEhMTSNzZACWsAw/4Q=;
 b=PhlEGoMqphysDKnqTRz8aSEVGNB9JBvbRR3bDG3hnwxEPAcECXdQXLGIfTi2u+j8WD
 +Ei2vyCp6A110O3z38jeKIL03fZkjjZ0x0xXiqLvCyLq7WAk1m6OuoTDsa0b5DugSzXX
 5APDNnryG9jRU4w1radnbzsPyxPAoCJr61nzopPsXby0CAA5sRViji1FFwhmeJRVyK2U
 T92vQwjJulyQqyVEmXxkoCHCu8qUWELBIxsxgLUJRRQ6GwX9WoD9EwRM/R4i7D2031sa
 A/ZcHl6ujgNKhPNjAJZOfFlq4iQVQLFMJq5N1vVCDZgJ3Qh4PfEhFIzepFduOmmDyli2
 sJUw==
X-Gm-Message-State: AOAM533SRtJDrfTYbBVLxZK9bdwdbjWFkjtEa8EurDZM/pNd+3dhdT01
 li+6yyLLsugkZS0INGDps1IFBxJCTfomVocQu7sW/a5CNolkyZsCXcQl1/0Cn19JvpC5QWEa5eh
 F0wP4K8dBmHAXz6Npyl6gzoD3w8/UiDgRzmeyyXdnjSAPlF7a2wWKvfFwh4Gi
X-Received: by 2002:a7b:cd82:: with SMTP id y2mr4315894wmj.106.1633449662028; 
 Tue, 05 Oct 2021 09:01:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzbZcD03Hex8BrEAzzjN5PPcIhbuVC43tn2bYZQDLJC+5B2j2ThZH7UK9W8kD1ycHWxztPVDg==
X-Received: by 2002:a7b:cd82:: with SMTP id y2mr4315859wmj.106.1633449661718; 
 Tue, 05 Oct 2021 09:01:01 -0700 (PDT)
Received: from redhat.com ([2.55.147.134])
 by smtp.gmail.com with ESMTPSA id o12sm2995040wms.15.2021.10.05.09.01.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Oct 2021 09:01:01 -0700 (PDT)
Date: Tue, 5 Oct 2021 12:00:58 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 05/57] vhost-vdpa: prepare for the multiqueue support
Message-ID: <20211005155946.513818-6-mst@redhat.com>
References: <20211005155946.513818-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211005155946.513818-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.066,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Jason Wang <jasowang@redhat.com>

Unlike vhost-kernel, vhost-vdpa adapts a single device multiqueue
model. So we need to simply use virtqueue index as the vhost virtqueue
index. This is a must for multiqueue to work for vhost-vdpa.

Signed-off-by: Jason Wang <jasowang@redhat.com>
Message-Id: <20210907090322.1756-4-jasowang@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/virtio/vhost-vdpa.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
index edac4017da..8587d30918 100644
--- a/hw/virtio/vhost-vdpa.c
+++ b/hw/virtio/vhost-vdpa.c
@@ -504,8 +504,8 @@ static int vhost_vdpa_get_vq_index(struct vhost_dev *dev, int idx)
 {
     assert(idx >= dev->vq_index && idx < dev->vq_index + dev->nvqs);
 
-    trace_vhost_vdpa_get_vq_index(dev, idx, idx - dev->vq_index);
-    return idx - dev->vq_index;
+    trace_vhost_vdpa_get_vq_index(dev, idx, idx);
+    return idx;
 }
 
 static int vhost_vdpa_set_vring_ready(struct vhost_dev *dev)
-- 
MST


