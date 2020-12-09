Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 217792D4A10
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Dec 2020 20:27:01 +0100 (CET)
Received: from localhost ([::1]:36272 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kn575-0002ke-Pg
	for lists+qemu-devel@lfdr.de; Wed, 09 Dec 2020 14:26:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53502)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kn3wU-0005Oh-Gs
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 13:12:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:36255)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kn3wQ-0000ng-CO
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 13:11:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607537512;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8nPRkjSHKPRfmK7HdWbx1E1TQS6U/DqNOGXcP9rxsMI=;
 b=B99omGekDL452roqc8aS4zAHp1ENO02InTkdqRCAuz8rPxCgrM8yCIwtkdVA56196uf/2g
 Gz13d0zl2gTrEwTx7cx7UPele4GSUBqPzbEB64qYMhGGei+wosdICE73nElVSfP44DZMlx
 nXGHHZ1IPFfFx/vo0NI3+hV0FUv3Qek=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-156-905onueaPO-WCKdS1-_hZA-1; Wed, 09 Dec 2020 13:11:50 -0500
X-MC-Unique: 905onueaPO-WCKdS1-_hZA-1
Received: by mail-wm1-f69.google.com with SMTP id u123so640956wmu.5
 for <qemu-devel@nongnu.org>; Wed, 09 Dec 2020 10:11:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=8nPRkjSHKPRfmK7HdWbx1E1TQS6U/DqNOGXcP9rxsMI=;
 b=mZ1HHD2f4mH8K63lVXhU/P14jPnomPXg8Z6lj+WxPMCWxpx2b5Fcizt2OQqCMsHnn6
 xu+VE+cSRaN2o7NWPx6094w4bC/KYmhCyDigEDcpMgrOCcm/8Gjo7SdHsoZ+JOGEyeay
 yixosTluC8jI34a9tPOJHSp1ecs4vgyNZnG9ynSxIHkvyTJFpFEZRRFrrs7+GtuXhluW
 tHZvM5HnyeI4fQjfVbtjuqoSqlg1x7H04XwEI6PtUeVBSVx+Or/3tpSKxVFcG/zk59hq
 uzsOmsAiveeUi2IMYVp7GLHiGcn2DNivqgHCYWg2nv0tuU0qhDJvS+pCleo2W5Mp0K5A
 /d2Q==
X-Gm-Message-State: AOAM531z1GrGdaFtHDgIZsyUD53rzNo5PeLVsOGpZ/+TDcDYNSEjlxw4
 nX1reJgB6iJgTWt2fEgWBgvAtHQccOrKb7xTp79bF4yo0XWkoWDw0w5yOwRMV5QO7bO4lH/Nos8
 BnndGKV4RFGHbVcq7BgxEMF/DY2Lww9bCdC/FxQFHlD//0mBKKF0LXmzu4wH6
X-Received: by 2002:a1c:7f90:: with SMTP id a138mr4148419wmd.61.1607537508517; 
 Wed, 09 Dec 2020 10:11:48 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwP1kZgEj5DQXyzg/fkLScNhUY2HKzGx9R0OYAdcrW5JoJ4toeiu9rxn7RLyumcxsISNbU6vw==
X-Received: by 2002:a1c:7f90:: with SMTP id a138mr4148399wmd.61.1607537508335; 
 Wed, 09 Dec 2020 10:11:48 -0800 (PST)
Received: from redhat.com (bzq-79-176-44-197.red.bezeqint.net. [79.176.44.197])
 by smtp.gmail.com with ESMTPSA id q4sm4639862wmc.2.2020.12.09.10.11.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Dec 2020 10:11:47 -0800 (PST)
Date: Wed, 9 Dec 2020 13:11:46 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 64/65] hw/virtio-pci Added counter for pcie capabilities
 offsets.
Message-ID: <20201209180546.721296-65-mst@redhat.com>
References: <20201209180546.721296-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201209180546.721296-1-mst@redhat.com>
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Andrew Melnychenko <andrew@daynix.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Andrew Melnychenko <andrew@daynix.com>

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


