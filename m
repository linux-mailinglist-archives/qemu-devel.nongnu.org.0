Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B513A6A7CE4
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 09:37:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXeHa-0006EZ-Ti; Thu, 02 Mar 2023 03:27:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pXeHE-0005gz-VI
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 03:27:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pXeH4-0002bg-46
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 03:26:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677745609;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=KXKJYPHxmk6txH9lWOLxXYxCMI6HULeDlaEu87sqk8Y=;
 b=EB9HmQF4GIEUmAx/jITwRRF0ygs+x+e/YGS2rfUNkidZ9LvZRRYVfU9wyLN/Z+Tg/mPV3T
 j92mvpPQ+gv4QRIn+1upkBktVOxgFxhTNRXYM96GnlmZVfBjwx8FoKjAsxI3keQVoayToh
 D2gEBTuChlYgiAynpbrvrNB3Vi5aMCY=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-433-FpC0A7OVPf6fOLa2fX2ZLQ-1; Thu, 02 Mar 2023 03:26:48 -0500
X-MC-Unique: FpC0A7OVPf6fOLa2fX2ZLQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 t1-20020a7bc3c1000000b003dfe223de49so924514wmj.5
 for <qemu-devel@nongnu.org>; Thu, 02 Mar 2023 00:26:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677745606;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KXKJYPHxmk6txH9lWOLxXYxCMI6HULeDlaEu87sqk8Y=;
 b=Yc7HWq0KMUk1pHdEowRWm5Isy3VBdWAW7eol7mXOxeLhsORrK5B7Y+nAGN9Ta9P1WZ
 6pbDNu76zDe8TfF6c1uXq5V2ekm3OPnjkrPSaUtP5Fscg7whYHSdZqMI9PPRVnkdsDnz
 Borrj6nI0efxR/1b6KJIIlmVhBUR/+NoBUhX0DjHoOX35QiFXyM+HZO9EhNT9igbUiTk
 VwZjlqEeK6jXhCkY4gCt2SW7iNXblHDY0vKgI4pJDnzlXVB2ftW9ch5PzKA/D4RQXJSD
 lVyJVUIGiqqSEkjIikfUQ25vSnLGoGMzRTrGZpcPZBad9q53RbLrKyqWRHW4Y48WEV/N
 Mlig==
X-Gm-Message-State: AO0yUKVQL9zaB8MXBCEb8Yvk0nxl7jLdqTygVyjCsBRhdxsluHIfxEws
 JfHBZM3oPj8QrH+njs625UwG3Vmo3blXW/jQptjBhkHqqbhbhfqWx8qKiE3aiOyfPzPOClZKxeq
 ljv0epCW2Rp1EpwNuQVufLwWzgI4S4godH2KU6IpBsGL+NOT4E7A3xEABdgbgVioPqw==
X-Received: by 2002:a05:600c:3542:b0:3eb:2b88:5af2 with SMTP id
 i2-20020a05600c354200b003eb2b885af2mr7494470wmq.20.1677745606508; 
 Thu, 02 Mar 2023 00:26:46 -0800 (PST)
X-Google-Smtp-Source: AK7set/e6e3+0kjIHFhg0ff0K8memG7EK/ajFzZdMMBYU/qCuXCNWCgjpDD8U8r1+OjHmJpgas8lJg==
X-Received: by 2002:a05:600c:3542:b0:3eb:2b88:5af2 with SMTP id
 i2-20020a05600c354200b003eb2b885af2mr7494456wmq.20.1677745606257; 
 Thu, 02 Mar 2023 00:26:46 -0800 (PST)
Received: from redhat.com ([2.52.141.194]) by smtp.gmail.com with ESMTPSA id
 i15-20020adffdcf000000b002c58ca558b6sm14710566wrs.88.2023.03.02.00.26.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Mar 2023 00:26:45 -0800 (PST)
Date: Thu, 2 Mar 2023 03:26:43 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Ira Weiny <ira.weiny@intel.com>,
 Gregory Price <gregory.price@memverge.com>,
 Fan Ni <fan.ni@samsung.com>, Ben Widawsky <ben.widawsky@intel.com>
Subject: [PULL 43/53] hw/mem/cxl_type3: Improve error handling in realize()
Message-ID: <20230302082343.560446-44-mst@redhat.com>
References: <20230302082343.560446-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230302082343.560446-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Jonathan Cameron <Jonathan.Cameron@huawei.com>

msix_init_exclusive_bar() can fail, so if it does cleanup the address space.

Reviewed-by: Ira Weiny <ira.weiny@intel.com>
Reviewed-by: Gregory Price <gregory.price@memverge.com>
Tested-by: Gregory Price <gregory.price@memverge.com>
Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Message-Id: <20230206172816.8201-2-Jonathan.Cameron@huawei.com>
Reviewed-by: Fan Ni <fan.ni@samsung.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/mem/cxl_type3.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/hw/mem/cxl_type3.c b/hw/mem/cxl_type3.c
index dae4fd89ca..252822bd82 100644
--- a/hw/mem/cxl_type3.c
+++ b/hw/mem/cxl_type3.c
@@ -401,7 +401,7 @@ static void ct3_realize(PCIDevice *pci_dev, Error **errp)
     MemoryRegion *mr = &regs->component_registers;
     uint8_t *pci_conf = pci_dev->config;
     unsigned short msix_num = 1;
-    int i;
+    int i, rc;
 
     if (!cxl_setup_memory(ct3d, errp)) {
         return;
@@ -438,7 +438,10 @@ static void ct3_realize(PCIDevice *pci_dev, Error **errp)
                      &ct3d->cxl_dstate.device_registers);
 
     /* MSI(-X) Initailization */
-    msix_init_exclusive_bar(pci_dev, msix_num, 4, NULL);
+    rc = msix_init_exclusive_bar(pci_dev, msix_num, 4, NULL);
+    if (rc) {
+        goto err_address_space_free;
+    }
     for (i = 0; i < msix_num; i++) {
         msix_vector_use(pci_dev, i);
     }
@@ -450,6 +453,11 @@ static void ct3_realize(PCIDevice *pci_dev, Error **errp)
     cxl_cstate->cdat.free_cdat_table = ct3_free_cdat_table;
     cxl_cstate->cdat.private = ct3d;
     cxl_doe_cdat_init(cxl_cstate, errp);
+    return;
+
+err_address_space_free:
+    address_space_destroy(&ct3d->hostmem_as);
+    return;
 }
 
 static void ct3_exit(PCIDevice *pci_dev)
-- 
MST


