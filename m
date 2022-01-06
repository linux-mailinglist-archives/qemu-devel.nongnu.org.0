Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2683C48658F
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Jan 2022 14:52:33 +0100 (CET)
Received: from localhost ([::1]:54944 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5TBw-0001UJ-85
	for lists+qemu-devel@lfdr.de; Thu, 06 Jan 2022 08:52:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42282)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n5Seo-0005Tk-3M
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 08:18:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51146)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n5Sek-000112-Pb
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 08:18:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641475094;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=i2tUq/4w6a20igW6k3dOKqvL8Uaj1gMW3dBfTlVIDqA=;
 b=U+ahPK1PE0vKqpqNNGQ8jxd3svegOkhy3s9IIRdIMPXhn5nraIGoGvrovihyVRuOPkrvSP
 HSthho9/VYgP0UgxeqshCCzzt8AlnsD3KQJZXBn+235CgdV+8n4vYPeXJiHV48Zzf83kS/
 ANqF3pvMWWukdu5gJ2ehk8Ws0r/RRNw=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-536-HX-B3jJxMnqj1i5-Peeu3g-1; Thu, 06 Jan 2022 08:18:13 -0500
X-MC-Unique: HX-B3jJxMnqj1i5-Peeu3g-1
Received: by mail-ed1-f69.google.com with SMTP id
 r8-20020a05640251c800b003f9a52daa3fso1893462edd.22
 for <qemu-devel@nongnu.org>; Thu, 06 Jan 2022 05:18:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=i2tUq/4w6a20igW6k3dOKqvL8Uaj1gMW3dBfTlVIDqA=;
 b=44eSHiR8d0UK8Rj4OhCTs9X/R5p7Pd5XR1iie8pVVcfGF1fdoMldZQ3DIS1TtdG7Is
 E7AVllnl9yDGb6y4dSK3yh+9KGKRBPDZHxQ6jIvOIc9ZBZ0QmCw38OGKwpCCqIbco4Qn
 5hRPwN2F2gzqwYZ6He1gKMyp9a8LQoHjnmKvKjBiJcR0oB5i+4vzKZYnB/nb+oYyo8RM
 1cfuXZLvRJT8oYrhL1NefymWKRqSMmIFSmL9UYAuF9k8DokoML1O64RBzZ0apLk3Jrkx
 6rG2rTRgixLCZgHnlWfS0Z3CJ0RWtiBpD2IWvZf5QIWGBySbjVpTxY2x8DUc+wv1YULv
 XVWQ==
X-Gm-Message-State: AOAM530uHBUkZ/ZtJPW197Yj0s6LqDAR0KMmA6EKBfoBuJiy/rCTLlNz
 WE5nDa9kLDUhfUYp7MCAOFhjHNw/9hiErOcHMXkOp8QGQAANofyBvU2CMbyW38siEdEKxTZFEYo
 jzQpHnA0acyYUGBdqkcudy/vBPbVpkkXJgt5TJGasZG0QUWH8IF+DAWKSYz34
X-Received: by 2002:aa7:d394:: with SMTP id x20mr56883952edq.268.1641475091181; 
 Thu, 06 Jan 2022 05:18:11 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz+bhLporZPqSHYfBpgkUi+skSCtMwYsQmLQ0bq5r1abKVVkPkPKQRfFF7KJuhce8394VkvBQ==
X-Received: by 2002:aa7:d394:: with SMTP id x20mr56883932edq.268.1641475090979; 
 Thu, 06 Jan 2022 05:18:10 -0800 (PST)
Received: from redhat.com ([2a03:c5c0:207e:991b:6857:5652:b903:a63b])
 by smtp.gmail.com with ESMTPSA id e16sm718122edu.15.2022.01.06.05.18.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Jan 2022 05:18:10 -0800 (PST)
Date: Thu, 6 Jan 2022 08:18:07 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 39/52] linux-headers: sync VIRTIO_MEM_F_UNPLUGGED_INACCESSIBLE
Message-ID: <20220106131534.423671-40-mst@redhat.com>
References: <20220106131534.423671-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220106131534.423671-1-mst@redhat.com>
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
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.372,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Michal Privoznik <mprivozn@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, David Hildenbrand <david@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: David Hildenbrand <david@redhat.com>

Let's synchronize the new feature flag, available in Linux since
v5.16-rc1.

Reviewed-by: Michal Privoznik <mprivozn@redhat.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
Message-Id: <20211217134039.29670-2-david@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/standard-headers/linux/virtio_mem.h | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/include/standard-headers/linux/virtio_mem.h b/include/standard-headers/linux/virtio_mem.h
index 05e5ade75d..18c74c527c 100644
--- a/include/standard-headers/linux/virtio_mem.h
+++ b/include/standard-headers/linux/virtio_mem.h
@@ -68,9 +68,10 @@
  * explicitly triggered (VIRTIO_MEM_REQ_UNPLUG).
  *
  * There are no guarantees what will happen if unplugged memory is
- * read/written. Such memory should, in general, not be touched. E.g.,
- * even writing might succeed, but the values will simply be discarded at
- * random points in time.
+ * read/written. In general, unplugged memory should not be touched, because
+ * the resulting action is undefined. There is one exception: without
+ * VIRTIO_MEM_F_UNPLUGGED_INACCESSIBLE, unplugged memory inside the usable
+ * region can be read, to simplify creation of memory dumps.
  *
  * It can happen that the device cannot process a request, because it is
  * busy. The device driver has to retry later.
@@ -87,6 +88,8 @@
 
 /* node_id is an ACPI PXM and is valid */
 #define VIRTIO_MEM_F_ACPI_PXM		0
+/* unplugged memory must not be accessed */
+#define VIRTIO_MEM_F_UNPLUGGED_INACCESSIBLE	1
 
 
 /* --- virtio-mem: guest -> host requests --- */
-- 
MST


