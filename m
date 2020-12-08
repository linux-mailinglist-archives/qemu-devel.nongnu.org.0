Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 438362D3326
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 21:26:30 +0100 (CET)
Received: from localhost ([::1]:44486 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmjZ7-00005o-AX
	for lists+qemu-devel@lfdr.de; Tue, 08 Dec 2020 15:26:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50478)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kmio3-0008BM-Mh
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 14:37:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:51929)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kmio1-00060h-RW
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 14:37:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607456269;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=dSzwVw/hkV56GLy5TZF/v4GucSr1UWG0d48xB0yK0m8=;
 b=Lt6yE8QsrkCpdXkVkoKzdJ38oO07IQLMkx9FEdorrX1L4VwW47ANqbDxmdTRoS7Ja1xkhU
 i+qpvd6Gzv5PmWbshORiW8CXSYM9gnhzZfFMamjYIqLfK6JGUoIKsPKwyMOP224hTzNjXa
 A+pH+aW+4Dvod4PpBzlVrvYyjQwDMWs=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-564-RRICeIEnPn2l3wNbmQpFog-1; Tue, 08 Dec 2020 14:37:47 -0500
X-MC-Unique: RRICeIEnPn2l3wNbmQpFog-1
Received: by mail-wr1-f70.google.com with SMTP id r11so4697286wrs.23
 for <qemu-devel@nongnu.org>; Tue, 08 Dec 2020 11:37:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=dSzwVw/hkV56GLy5TZF/v4GucSr1UWG0d48xB0yK0m8=;
 b=E/Fdb8kCuCOVAFdqaQJMtPeQyBfsXEb9N/8MQLktNFwXLBlsnmw123cV5giz6Jz8cZ
 zHuUmdBsUQHzHtbujMJc0Sebp1z7mj2Q8n3jhUk5vmE1NJh3Y5CJD1Y9rMMdvjd/JjrZ
 iT1MaYLUB4DnP4V07qiHdF0bAeJwxYUxmZuq99lp6UmF7zfDhMmKYMSaRN7T8oUyFYDw
 Zm13clktZH5M7v3sN6dHt571RyRqWof73acasVtNOxhSqkH5znd0oLNlvcZ1xSYM0tzO
 I1MFTfQzO/Cmeog2eyoI1c+2FkzabA9q1hfsqDhcss6yqRDZiA306ORt3LB11QGcVsK0
 HRtA==
X-Gm-Message-State: AOAM53109TiUgsO6NLyAyDFRttzfNC0pavg1mhMynE+uVQfU8sAdiTNc
 FuuEKJhCfIOvHsLAiQscwarbg26kAUOQUFcm+6TWLSfpfEyfPZp+GXSB9uPQeM5byKRTAMqa/dS
 2CUHvvbOGRGJN1+sIKIcbWsuicnS9IjHp/vKoxZ+k/7Ta4AQnLxPS15FLlfZn
X-Received: by 2002:adf:ed12:: with SMTP id a18mr26519265wro.5.1607456265567; 
 Tue, 08 Dec 2020 11:37:45 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz0Ljky2ukm72d7uy4g1XsLfZID54Kgw8SKpnlrqj3LrQ7GeW/RKuLX1gVWe7ZT4fgzn5fMog==
X-Received: by 2002:adf:ed12:: with SMTP id a18mr26519250wro.5.1607456265381; 
 Tue, 08 Dec 2020 11:37:45 -0800 (PST)
Received: from redhat.com (bzq-79-176-44-197.red.bezeqint.net. [79.176.44.197])
 by smtp.gmail.com with ESMTPSA id d9sm14505771wrc.87.2020.12.08.11.37.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Dec 2020 11:37:44 -0800 (PST)
Date: Tue, 8 Dec 2020 14:37:41 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 65/66] hw/virtio-pci Added counter for pcie capabilities
 offsets.
Message-ID: <20201208193307.646726-66-mst@redhat.com>
References: <20201208193307.646726-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201208193307.646726-1-mst@redhat.com>
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
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew <andrew@daynix.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Andrew <andrew@daynix.com>

Removed hardcoded offset for ats. Added cap offset counter
for future capabilities like AER.

Signed-off-by: Andrew Melnychenko <andrew@daynix.com>
Message-Id: <20201203110713.204938-2-andrew@daynix.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/virtio/virtio-pci.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/hw/virtio/virtio-pci.c b/hw/virtio/virtio-pci.c
index 36524a5728..ceaa233129 100644
--- a/hw/virtio/virtio-pci.c
+++ b/hw/virtio/virtio-pci.c
@@ -1798,6 +1798,7 @@ static void virtio_pci_realize(PCIDevice *pci_dev, Error **errp)
 
     if (pcie_port && pci_is_express(pci_dev)) {
         int pos;
+        uint16_t last_pcie_cap_offset = PCI_CONFIG_SPACE_SIZE;
 
         pos = pcie_endpoint_cap_init(pci_dev, 0);
         assert(pos > 0);
@@ -1833,7 +1834,8 @@ static void virtio_pci_realize(PCIDevice *pci_dev, Error **errp)
         }
 
         if (proxy->flags & VIRTIO_PCI_FLAG_ATS) {
-            pcie_ats_init(pci_dev, 256);
+            pcie_ats_init(pci_dev, last_pcie_cap_offset);
+            last_pcie_cap_offset += PCI_EXT_CAP_ATS_SIZEOF;
         }
 
         if (proxy->flags & VIRTIO_PCI_FLAG_INIT_FLR) {
-- 
MST


