Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B99448805E
	for <lists+qemu-devel@lfdr.de>; Sat,  8 Jan 2022 02:18:25 +0100 (CET)
Received: from localhost ([::1]:35182 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n60NE-0000uR-FR
	for lists+qemu-devel@lfdr.de; Fri, 07 Jan 2022 20:18:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43754)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n609G-00036m-Es
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 20:03:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28723)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n609E-0002Ka-Ph
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 20:03:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641603836;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=873JIwL0Ssx4x2GI9hqUqv8te9fEzO/xVfFKyB9oXJQ=;
 b=U46NjA0C/2B8LP2sTGy4cMU1KnPgf+HBdjaMRW8VTyOkxzWiakVM1USaAmejwxoTDSDWi4
 uqowdG4Abc0LGi7QFkQTzIxazoFoE5tN6aZgHIIyrG13Inx/3qkpW/d7EIA64UOBOP7YCT
 1vqgmzB2Kblk/iayNwiJ8018hItWw8M=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-448-AJqxWQwxPy2ieaEN1iZmpQ-1; Fri, 07 Jan 2022 20:03:55 -0500
X-MC-Unique: AJqxWQwxPy2ieaEN1iZmpQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 l34-20020a05600c08a200b003478e251a32so1951979wmp.0
 for <qemu-devel@nongnu.org>; Fri, 07 Jan 2022 17:03:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=873JIwL0Ssx4x2GI9hqUqv8te9fEzO/xVfFKyB9oXJQ=;
 b=IhYgrwSg3H+MHigPICUjszgd6TyjrR4OB4FSruw1ezP/mczbySM5xDd9RT0QWs3a8i
 hc6QIoQSxczFdF0rfgEuiuRq3XnZ0CheK+E+rMUPPcziAj7rrUNcCisNHFmzGe8rQZgf
 d7UWNzbxdzgIyKfJdIWltZQBAOBwvX/LTwl6SoWL+VtDMAtVpxFaVvYaVz07xwPDqNsU
 2l80bCsy6DX55VrFPhrHidbMupJnyGVAZdDE0Vdba8SuxwmxwS1oJZsCYwMrWb3vWWop
 lKEaaui9aRoAxhGljSkBKH3M9x54cO55owljmlfcW9IR6wyWWz6Dl5gpkCgBvBCCEH2n
 YliQ==
X-Gm-Message-State: AOAM532f+zqrPI9JIg98lHnTJKwhhFb+0vjLtoPFX6z3HDlwZ8OIAyNa
 R5V/JVllRhBt1xO0PUGfcSsBrmz2YyfTXm+3bqErh17T03/bwhdgBqH3CxOmNfhvCmFPEKUk6it
 T9sa18L+P3l5RXcElzwSLe9q97CtphsDF8hPVbVCC3kyQf1eH0mcOdSxKwSCG
X-Received: by 2002:a5d:47c6:: with SMTP id o6mr58909637wrc.343.1641603833592; 
 Fri, 07 Jan 2022 17:03:53 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxTlOZ+6MYhGTNsfnSF7uBRDmObcNSdwP7gneiabJ9Dh1T0NiAuYKG+/j4J6Nbb7/eXZfePKw==
X-Received: by 2002:a5d:47c6:: with SMTP id o6mr58909630wrc.343.1641603833394; 
 Fri, 07 Jan 2022 17:03:53 -0800 (PST)
Received: from redhat.com ([147.161.13.99])
 by smtp.gmail.com with ESMTPSA id c7sm241110wri.21.2022.01.07.17.03.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jan 2022 17:03:53 -0800 (PST)
Date: Fri, 7 Jan 2022 20:03:50 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v3 06/55] vhost: introduce new VhostOps vhost_set_config_call
Message-ID: <20220108003423.15830-7-mst@redhat.com>
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Cindy Lu <lulu@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Cindy Lu <lulu@redhat.com>

This patch introduces new VhostOps vhost_set_config_call. This function allows the
vhost to set the event fd to kernel

Signed-off-by: Cindy Lu <lulu@redhat.com>
Message-Id: <20211104164827.21911-5-lulu@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/hw/virtio/vhost-backend.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/include/hw/virtio/vhost-backend.h b/include/hw/virtio/vhost-backend.h
index 81bf3109f8..ff34eb7c8a 100644
--- a/include/hw/virtio/vhost-backend.h
+++ b/include/hw/virtio/vhost-backend.h
@@ -126,6 +126,8 @@ typedef int (*vhost_get_device_id_op)(struct vhost_dev *dev, uint32_t *dev_id);
 
 typedef bool (*vhost_force_iommu_op)(struct vhost_dev *dev);
 
+typedef int (*vhost_set_config_call_op)(struct vhost_dev *dev,
+                                       int fd);
 typedef struct VhostOps {
     VhostBackendType backend_type;
     vhost_backend_init vhost_backend_init;
@@ -171,6 +173,7 @@ typedef struct VhostOps {
     vhost_vq_get_addr_op  vhost_vq_get_addr;
     vhost_get_device_id_op vhost_get_device_id;
     vhost_force_iommu_op vhost_force_iommu;
+    vhost_set_config_call_op vhost_set_config_call;
 } VhostOps;
 
 int vhost_backend_update_device_iotlb(struct vhost_dev *dev,
-- 
MST


