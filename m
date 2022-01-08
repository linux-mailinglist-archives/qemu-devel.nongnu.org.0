Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0222E4880A7
	for <lists+qemu-devel@lfdr.de>; Sat,  8 Jan 2022 02:44:23 +0100 (CET)
Received: from localhost ([::1]:50202 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n60mM-0007n3-4T
	for lists+qemu-devel@lfdr.de; Fri, 07 Jan 2022 20:44:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44464)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n60B9-0005Yo-6a
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 20:05:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:25731)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n60B7-0002lT-JV
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 20:05:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641603953;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=DFg4dF0zL+6DjrQEApY58jy53XB520+11YNtoCyrIVs=;
 b=FrMQhnYdkyWN6R1MoXEQOTmy1zcsylSVz7puSj7PVHAC4iaFiULVPrGkpYyrSZCFsEZ2em
 FPQ7sRCeJjZyNzmNpA5GRk+bNc9fTseiNMtHF9UkMdYU/UbAnBIV70tlX0gru8NwCKWBUq
 drE0WgYzvSbLUYJNKQegr9v2IQbINpk=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-643-eTwWkwSBNW2TIZ7LPIIXEg-1; Fri, 07 Jan 2022 20:05:52 -0500
X-MC-Unique: eTwWkwSBNW2TIZ7LPIIXEg-1
Received: by mail-wm1-f71.google.com with SMTP id
 az9-20020a05600c600900b0034692565ca8so4587799wmb.9
 for <qemu-devel@nongnu.org>; Fri, 07 Jan 2022 17:05:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=DFg4dF0zL+6DjrQEApY58jy53XB520+11YNtoCyrIVs=;
 b=hzU3oTjK6b72JV/JqvsAJX5l0JwGspCEwgSOJy+Ljndt6z2Cp3xKUgiqW2JKh8nY3z
 aguOx5GrZXacRE8aTswkxdm9I65aGv0BRPLL1m2Xz0m9aCLAIyfb3q0BQEqSBTKeKcpE
 8GGMgq9FYOKeYbf5s/9I/lKaNH1dv4cpttvr3JtWlsZzAMi09zKimVtK9Joeg24xsf6X
 0FlDbFczTy6Yd/A0W4jmbQ/OHU5PUN9asVks9wEU/8pD7PXuYodn6bV57mZegancXAvt
 +WZKdnjGeMBNkAX6NQopqnIBCyMjnd2wXnlA9dNbnGTFfUCSWtq2yOuWiZGCfvtYHgJ3
 k1/w==
X-Gm-Message-State: AOAM530TqzigYv0nNuEx+lnCyETsFjzHJThpOBm0e1mWmXbFdoGdVplc
 CJte/6VSx6GB++ME3lryFbp6j9hw3cgnTtNGjMWmDAtV6VVPYhpQQvAzXdW/k8II9XCWF3br4br
 O9Sj8y54POOuJoI3bMo5VZN5X0VcSIe5vi5NTc37JpKv4BSD9Sp74mJMHkMu5
X-Received: by 2002:a05:600c:22ca:: with SMTP id
 10mr10072395wmg.114.1641603950330; 
 Fri, 07 Jan 2022 17:05:50 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzkm+/2HkLGFbwU6O4tbnHh1sy7L1Q5/tlRqpzudP42W9q+cxzaw15FdJYIiHs+xi9tjtv2Sg==
X-Received: by 2002:a05:600c:22ca:: with SMTP id
 10mr10072377wmg.114.1641603950046; 
 Fri, 07 Jan 2022 17:05:50 -0800 (PST)
Received: from redhat.com ([147.161.13.99])
 by smtp.gmail.com with ESMTPSA id l10sm86596wmq.7.2022.01.07.17.05.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jan 2022 17:05:49 -0800 (PST)
Date: Fri, 7 Jan 2022 20:05:46 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v3 41/55] virtio-mem: Set "unplugged-inaccessible=auto" for
 the 7.0 machine on x86
Message-ID: <20220108003423.15830-42-mst@redhat.com>
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
Cc: Eduardo Habkost <eduardo@habkost.net>,
 Peter Maydell <peter.maydell@linaro.org>, David Hildenbrand <david@redhat.com>,
 Michal Privoznik <mprivozn@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Pankaj Gupta <pankaj.gupta@ionos.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: David Hildenbrand <david@redhat.com>

Set the new default to "auto", keeping it set to "off" for compat
machines. This property is only available for x86 targets.

Reviewed-by: Michal Privoznik <mprivozn@redhat.com>
Reviewed-by: Pankaj Gupta <pankaj.gupta@ionos.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
Message-Id: <20211217134039.29670-4-david@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/i386/pc.c           | 4 +++-
 hw/virtio/virtio-mem.c | 2 +-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 959efa5b3f..718ab81ba8 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -95,7 +95,9 @@
 #include "trace.h"
 #include CONFIG_DEVICES
 
-GlobalProperty pc_compat_6_2[] = {};
+GlobalProperty pc_compat_6_2[] = {
+    { "virtio-mem", "unplugged-inaccessible", "off" },
+};
 const size_t pc_compat_6_2_len = G_N_ELEMENTS(pc_compat_6_2);
 
 GlobalProperty pc_compat_6_1[] = {
diff --git a/hw/virtio/virtio-mem.c b/hw/virtio/virtio-mem.c
index fb6687d4c7..04c223b0c9 100644
--- a/hw/virtio/virtio-mem.c
+++ b/hw/virtio/virtio-mem.c
@@ -1201,7 +1201,7 @@ static Property virtio_mem_properties[] = {
                      TYPE_MEMORY_BACKEND, HostMemoryBackend *),
 #if defined(VIRTIO_MEM_HAS_LEGACY_GUESTS)
     DEFINE_PROP_ON_OFF_AUTO(VIRTIO_MEM_UNPLUGGED_INACCESSIBLE_PROP, VirtIOMEM,
-                            unplugged_inaccessible, ON_OFF_AUTO_OFF),
+                            unplugged_inaccessible, ON_OFF_AUTO_AUTO),
 #endif
     DEFINE_PROP_END_OF_LIST(),
 };
-- 
MST


