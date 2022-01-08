Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BDFC4880C8
	for <lists+qemu-devel@lfdr.de>; Sat,  8 Jan 2022 03:02:42 +0100 (CET)
Received: from localhost ([::1]:39474 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6145-0007JH-E1
	for lists+qemu-devel@lfdr.de; Fri, 07 Jan 2022 21:02:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44402)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n60B2-0005Rr-Sx
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 20:05:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44137)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n60B1-0002jm-Ex
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 20:05:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641603945;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=i2tUq/4w6a20igW6k3dOKqvL8Uaj1gMW3dBfTlVIDqA=;
 b=c/YoFKdohkvC4tyU1v27pdGGJRF1YIMni936aN8TtbArk+XzD3+GpEaGT8SQ8DsRHDJLhc
 bA12QanNJLLt+AU723++264fr2HoXcXJPJfde++jBvxHDhj+vK5gFKvfBXUpEAqMGytDIk
 V06vXiRHzwV4VfKge1ek9H984t5fYPg=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-232-jIR8379ZNb2QPdG3yBpElw-1; Fri, 07 Jan 2022 20:05:45 -0500
X-MC-Unique: jIR8379ZNb2QPdG3yBpElw-1
Received: by mail-wm1-f70.google.com with SMTP id
 s190-20020a1ca9c7000000b00347c6c39d9aso1458141wme.5
 for <qemu-devel@nongnu.org>; Fri, 07 Jan 2022 17:05:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=i2tUq/4w6a20igW6k3dOKqvL8Uaj1gMW3dBfTlVIDqA=;
 b=e7qdk+eubjGLsVi/XqSin0mhNZ2pLFFOCBBTe6jnwR7TV4BvrjzJJB7A7j4Z75c2/N
 mWpDCNrf0X/3XiMLAxUkzv9f8vl4b535O2jnD0UqkIz07c+hH77sqVFLUGFyMXwS08XH
 X27NDO7r0ANPzHjqkslGgtC8oYD6buOqkBgWJswKzq5Pa8/kmX/4Kz3q8hSpIfun7PV3
 dF4hCLxCKpMAR8MD2QHbpeiAYvm2Rek1kBsY9mG2cnqjCDJmdcQ5YC7IXH/8lQ+A8qML
 ujXGSsQOEEm4cdx4FDXPyN1I2vMSAJ6MmRXG556uY7FgGtCTR+yM+kKSam2wYSWT92YU
 w2fA==
X-Gm-Message-State: AOAM533B08U28lBmqxQV2gA39huTBeGASLfKDEtf9h3a91pzY8H9D/pN
 M030xn2YSCDmO4nXXwRyEklvEBiRMrr1klViPMUAhyGY5tHWIlM8bQ4F0bx8sWBVZ/1RPW+RPoE
 FxxH8nEtXkrgGH2w2YS+BrSG42ZK9WsRB8nu4ym9gN0hequ3r+OAiUb4Ux7cd
X-Received: by 2002:adf:cd07:: with SMTP id w7mr56567277wrm.137.1641603943683; 
 Fri, 07 Jan 2022 17:05:43 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwKJbTJo+ow8ch+fpzOPZI1bvFeUpQ4J2uWf7lwKGbCVVp1ZHw32z8s5zqNdye0/X368ev+sw==
X-Received: by 2002:adf:cd07:: with SMTP id w7mr56567264wrm.137.1641603943447; 
 Fri, 07 Jan 2022 17:05:43 -0800 (PST)
Received: from redhat.com ([147.161.13.99])
 by smtp.gmail.com with ESMTPSA id a20sm79181wmb.27.2022.01.07.17.05.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jan 2022 17:05:43 -0800 (PST)
Date: Fri, 7 Jan 2022 20:05:40 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v3 39/55] linux-headers: sync
 VIRTIO_MEM_F_UNPLUGGED_INACCESSIBLE
Message-ID: <20220108003423.15830-40-mst@redhat.com>
References: <20220108003423.15830-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220108003423.15830-1-mst@redhat.com>
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


