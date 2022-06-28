Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D36F55BE6D
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jun 2022 07:21:20 +0200 (CEST)
Received: from localhost ([::1]:49674 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o63f5-0006Ep-4A
	for lists+qemu-devel@lfdr.de; Tue, 28 Jun 2022 01:21:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41500)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1o633o-0007my-9h
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 00:42:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:24669)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1o633b-0006nQ-KQ
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 00:42:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656391353;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=YLp/mOxNxnF8DObHBmdL/z0ALK0H7bOTQmMQTKlLt8Q=;
 b=eWBmjzvq0nBSRScWho9Jq0JdF1OKIxf71MVlwlBSetnRjn8RoKY8G4uKk9yJIh3Sx+cREJ
 ydWH4yO52nib2OUMqY1qJQnq7otCNzul/Totlz8EeDAPtWmV09InstXohgG8I7hXH+fKs2
 gxjpHd3w7ITNabhuFwYaeJVajsRgDfo=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-249-nr2UytLEPf-FbeDS67OXKQ-1; Tue, 28 Jun 2022 00:42:31 -0400
X-MC-Unique: nr2UytLEPf-FbeDS67OXKQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 k32-20020a05600c1ca000b0039c4cf75023so8316215wms.9
 for <qemu-devel@nongnu.org>; Mon, 27 Jun 2022 21:42:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=YLp/mOxNxnF8DObHBmdL/z0ALK0H7bOTQmMQTKlLt8Q=;
 b=RBw6JyQK0JA8bI4rQRIAzHjC/W15Rs1SLFkVkIrB4Y3/Ia28VyNhS+b9Gl1hpe2pc5
 vGQrj0jKf6JKzFyA3nsagExEuazV5EAikVHM05UQlm1KRWkqbkqeNjKQGIlnPlDWgRwW
 i8eDFm3f0F7Yw+0guC5ovS4QVygykuuMICfK6JC0gC5CVnTbMgsoBs+30oWejZhLhZZ4
 Zcmn6zNQQlx0OIBiUJRZvJLL+C+0LIkYqccXwIGa1BY5fNS5Yn442PPX70F16a7IRNLf
 ypI09Kpm9qW6tV+LbtXmK1mF5xr5uVJWesKA/Nl9Ijurkf2tnMvrGLuVme7LpPM/T0LH
 9FqQ==
X-Gm-Message-State: AJIora+lCIB9N08jK3HxJiTzsNx8vyNh7uE25/jreSw+Tru6Y4CP2Zsr
 9LBDdSrsTdbyrIdo6oHS0mX2QlisIqSV4DxxkOU4NBjM8lIz95xvSR1yXpNEhIvSGI2pPSfc8Pq
 SJKJLC73jTu/1dNcuqgi7d3ycu7LvHoh3x6NLWa1DbITzEtwvxvd0/djx8nHC
X-Received: by 2002:a5d:59a4:0:b0:218:4a29:f12b with SMTP id
 p4-20020a5d59a4000000b002184a29f12bmr14812326wrr.145.1656391350415; 
 Mon, 27 Jun 2022 21:42:30 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tBnMmDxviq/tnboUWtDs7Pw8mOVebCD+6EONITBiEpSCNZGjEX3AYdnfiCHHmVObM97mdz2A==
X-Received: by 2002:a5d:59a4:0:b0:218:4a29:f12b with SMTP id
 p4-20020a5d59a4000000b002184a29f12bmr14812303wrr.145.1656391350097; 
 Mon, 27 Jun 2022 21:42:30 -0700 (PDT)
Received: from redhat.com ([2.52.23.204]) by smtp.gmail.com with ESMTPSA id
 w9-20020a5d6089000000b0020e5b4ebaecsm12341291wrt.4.2022.06.27.21.42.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jun 2022 21:42:29 -0700 (PDT)
Date: Tue, 28 Jun 2022 00:42:27 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Zhenzhong Duan <zhenzhong.duan@intel.com>,
 Jean-Philippe Brucker <jean-philippe@linaro.org>,
 Eric Auger <eric.auger@redhat.com>
Subject: [PULL 01/12] virtio-iommu: Fix the partial copy of probe request
Message-ID: <20220628044201.217173-2-mst@redhat.com>
References: <20220628044201.217173-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220628044201.217173-1-mst@redhat.com>
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

From: Zhenzhong Duan <zhenzhong.duan@intel.com>

The structure of probe request doesn't include the tail, this leads
to a few field missed to be copied. Currently this isn't an issue as
those missed field belong to reserved field, just in case reserved
field will be used in the future.

Changed 4th parameter of virtio_iommu_iov_to_req() to receive size
of device-readable part.

Fixes: 1733eebb9e75b ("virtio-iommu: Implement RESV_MEM probe request")
Signed-off-by: Zhenzhong Duan <zhenzhong.duan@intel.com>
Message-Id: <20220623023152.3473231-1-zhenzhong.duan@intel.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
---
 hw/virtio/virtio-iommu.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c
index 7c122ab957..08b227e828 100644
--- a/hw/virtio/virtio-iommu.c
+++ b/hw/virtio/virtio-iommu.c
@@ -675,11 +675,10 @@ static int virtio_iommu_probe(VirtIOIOMMU *s,
 
 static int virtio_iommu_iov_to_req(struct iovec *iov,
                                    unsigned int iov_cnt,
-                                   void *req, size_t req_sz)
+                                   void *req, size_t payload_sz)
 {
-    size_t sz, payload_sz = req_sz - sizeof(struct virtio_iommu_req_tail);
+    size_t sz = iov_to_buf(iov, iov_cnt, 0, req, payload_sz);
 
-    sz = iov_to_buf(iov, iov_cnt, 0, req, payload_sz);
     if (unlikely(sz != payload_sz)) {
         return VIRTIO_IOMMU_S_INVAL;
     }
@@ -692,7 +691,8 @@ static int virtio_iommu_handle_ ## __req(VirtIOIOMMU *s,                \
                                          unsigned int iov_cnt)          \
 {                                                                       \
     struct virtio_iommu_req_ ## __req req;                              \
-    int ret = virtio_iommu_iov_to_req(iov, iov_cnt, &req, sizeof(req)); \
+    int ret = virtio_iommu_iov_to_req(iov, iov_cnt, &req,               \
+                    sizeof(req) - sizeof(struct virtio_iommu_req_tail));\
                                                                         \
     return ret ? ret : virtio_iommu_ ## __req(s, &req);                 \
 }
-- 
MST


