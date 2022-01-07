Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB0094876A8
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Jan 2022 12:41:25 +0100 (CET)
Received: from localhost ([::1]:55000 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5ncb-0001HD-0z
	for lists+qemu-devel@lfdr.de; Fri, 07 Jan 2022 06:41:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45682)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n5n3y-0001RC-Tp
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 06:05:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:49986)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n5n3m-0002A3-6P
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 06:05:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641553506;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=i2tUq/4w6a20igW6k3dOKqvL8Uaj1gMW3dBfTlVIDqA=;
 b=f9qhX4o3fa5icmRQzRKZ4mUpwIHodDxyS01rBusU90S1yf5c3UVYPlKzwiLKYIu0TZkjLE
 /5onuRvFr01ohlhv/2WJ2VXJ+Oi1KG9vx8So8t9O/WEHBUqEfdtOqWw5lpSfUM1AH3/vPX
 P7UMhwihuIitPkbhhwxXbM0cZmKKDyQ=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-49-Od-AtKcOMZGh3JO_3uQRdw-1; Fri, 07 Jan 2022 06:05:05 -0500
X-MC-Unique: Od-AtKcOMZGh3JO_3uQRdw-1
Received: by mail-wm1-f72.google.com with SMTP id
 i81-20020a1c3b54000000b003467c58cbddso4119793wma.5
 for <qemu-devel@nongnu.org>; Fri, 07 Jan 2022 03:05:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=i2tUq/4w6a20igW6k3dOKqvL8Uaj1gMW3dBfTlVIDqA=;
 b=qVSFWHQYtT2/XbG4OiuzJPb5un+f2m8HNJcV68h1JDWgcyipN7AM9lrfpt5Jbtzuik
 jRRUqoVkeV93Pi7zpmokFt0IOEfoE0ZzHx/D0SCNRRbnFTQcRtGGriQAy2bsXTtxh58T
 M82VlIvZI6RrRoqmTqj0UclxvvDtGXFlEwX04cz4SLf88X9JdD8YiVAHbIi5gOomfEw+
 GcgUPtIIdxCFKQLh4Ib8fJ0md9ZSnXunqqaimJo3qRS3gnIxSgdeu1thlWhAnDHbxUQp
 LY8ytX85FeEzz6jbhsNcL7/6G0YHCmVgyAGO0q+aDRi3fghk2XYTOffagDf9IySUVU97
 Jx7A==
X-Gm-Message-State: AOAM533yKoK7HH3yO4leJd785y0eP90AllCMzS4mmI+64HburJuR+yN0
 aQaFNA5JywWXZ08JH3172DhvnUDH3s2jO0Y7/C1Q+HYEkLOQw/2PAYaoJ4DiEga2AdredLfeUv8
 Op5fyXw2dhodQ6SyooRyNT1PkzbMljRGAEfHTgHMtWm7nA9iYN8AdlUW23P6Y
X-Received: by 2002:a5d:4343:: with SMTP id u3mr29226434wrr.504.1641553504242; 
 Fri, 07 Jan 2022 03:05:04 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxHnEp7Xnl9ecOhWp/zL3jzNuBlqz/l2/oDUKJiRdnVQ3ZsFyJNHMQ/kc0KUkxV4Qjf/JywVQ==
X-Received: by 2002:a5d:4343:: with SMTP id u3mr29226418wrr.504.1641553503977; 
 Fri, 07 Jan 2022 03:05:03 -0800 (PST)
Received: from redhat.com ([2.55.16.192])
 by smtp.gmail.com with ESMTPSA id g84sm5039590wme.7.2022.01.07.03.05.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jan 2022 03:05:03 -0800 (PST)
Date: Fri, 7 Jan 2022 06:05:01 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 39/55] linux-headers: sync
 VIRTIO_MEM_F_UNPLUGGED_INACCESSIBLE
Message-ID: <20220107102526.39238-40-mst@redhat.com>
References: <20220107102526.39238-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220107102526.39238-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
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


