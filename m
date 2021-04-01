Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F30D351BBC
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Apr 2021 20:11:51 +0200 (CEST)
Received: from localhost ([::1]:54708 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lS1nK-0008PZ-3a
	for lists+qemu-devel@lfdr.de; Thu, 01 Apr 2021 14:11:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57562)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lS1ez-0003Eu-IZ
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 14:03:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:34824)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lS1ev-0005wo-RU
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 14:03:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617300188;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ez/MMpFKibI09ROEX070H6IVA/s8veikIBmthUwRu2A=;
 b=BPGDykdRj/N/UAAn6gJS25eXXv9VXYvrRClwLxm/P48rjQ3ImZR3OwkRX3NzfbJ4YwmL5G
 8h5EMqIMCMnT4xDB4qQPP6GjiaZnz1ZrKB490jng7hvaFu3eK/MOUdODpwM8l0nce8sDev
 WA8BckFKlMR8zEmASSefsvJ0wRYGh/Q=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-446-a2LRCMlTN0mFZDGeqd8WyA-1; Thu, 01 Apr 2021 14:03:06 -0400
X-MC-Unique: a2LRCMlTN0mFZDGeqd8WyA-1
Received: by mail-wm1-f69.google.com with SMTP id a65so1031634wmh.1
 for <qemu-devel@nongnu.org>; Thu, 01 Apr 2021 11:03:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ez/MMpFKibI09ROEX070H6IVA/s8veikIBmthUwRu2A=;
 b=mF38wJ0BMrxou48ePwS/9yN9T4mWxtKGaHHavaZJldhaxX4+3H00CX/jbduVU3nyPG
 1wyhwmQ/c3ae1XQZ4oMBhjgf9hON0O1/f8tR/1AyHKuTbjptxIJkOssDvgSoTOJtu9qc
 zx7jJ25J1sml1xCYsWrICgb3DYCyNIO/LJ84nZTbAhRsMDoABLjSOGa4BsYOOglFA/t4
 wk/U0CkV+taQTulFsaucKwtZbU3Bl2m+RXnAZ9dpTX+WzajlV44zudgyvL9c7L4UOEse
 tZm9pdSEp26lzEuTgRAEhp96NbbcP7a7SM4YQGVVyix6acSbaS2pRkfQKehvfWlHdyQb
 1h5g==
X-Gm-Message-State: AOAM533LFjs5riHSoHaHdqi4fTGZdCzhYaPyE/PtGQlta4r2IbOiYMxs
 vzkz7BZUfvSxqrm6I/PDT2yliGJzZ+jkcBMJcF2PkeX9v7aNIDeclHSHFsuWrDLolDSjEmiyhb3
 aiCGtnL4Nc6aLJMgfmSxKghMit4RvCuuY3kFRhz24JtmFQoL/nMCKZdwVqj6m
X-Received: by 2002:a05:600c:b50:: with SMTP id
 k16mr9355731wmr.149.1617300184765; 
 Thu, 01 Apr 2021 11:03:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx+TMroJzZdImKKKBNgjXCHNqXYk8fl6/HbHvibVntSvAgOW4J0lc5+hAFAMxVpGl+X7KfiLw==
X-Received: by 2002:a05:600c:b50:: with SMTP id
 k16mr9355715wmr.149.1617300184531; 
 Thu, 01 Apr 2021 11:03:04 -0700 (PDT)
Received: from redhat.com ([2a10:800e:f0d3:0:b69b:9fb8:3947:5636])
 by smtp.gmail.com with ESMTPSA id h62sm11192013wmf.37.2021.04.01.11.03.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Apr 2021 11:03:04 -0700 (PDT)
Date: Thu, 1 Apr 2021 14:03:02 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 5/9] virtio-pci: remove explicit initialization of val
Message-ID: <20210401180235.226321-6-mst@redhat.com>
References: <20210401180235.226321-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210401180235.226321-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Yuri Benditovich <yuri.benditovich@daynix.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Yuri Benditovich <yuri.benditovich@daynix.com>

The value is assigned later in this procedure.

Signed-off-by: Yuri Benditovich <yuri.benditovich@daynix.com>
Message-Id: <20210315115937.14286-3-yuri.benditovich@daynix.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/virtio/virtio-pci.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/hw/virtio/virtio-pci.c b/hw/virtio/virtio-pci.c
index 4a3dcee771..c1b67cf6fc 100644
--- a/hw/virtio/virtio-pci.c
+++ b/hw/virtio/virtio-pci.c
@@ -1385,10 +1385,10 @@ static uint64_t virtio_pci_device_read(void *opaque, hwaddr addr,
 {
     VirtIOPCIProxy *proxy = opaque;
     VirtIODevice *vdev = virtio_bus_get_device(&proxy->bus);
-    uint64_t val = 0;
+    uint64_t val;
 
     if (vdev == NULL) {
-        return val;
+        return 0;
     }
 
     switch (size) {
@@ -1401,6 +1401,9 @@ static uint64_t virtio_pci_device_read(void *opaque, hwaddr addr,
     case 4:
         val = virtio_config_modern_readl(vdev, addr);
         break;
+    default:
+        val = 0;
+        break;
     }
     return val;
 }
-- 
MST


