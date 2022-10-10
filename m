Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 45CC55FA352
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Oct 2022 20:23:37 +0200 (CEST)
Received: from localhost ([::1]:60972 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ohxRA-000379-5i
	for lists+qemu-devel@lfdr.de; Mon, 10 Oct 2022 14:23:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45010)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1ohwc7-0002zJ-Td
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 13:30:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59795)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1ohwc5-00075a-PP
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 13:30:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665423048;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=y2BU0beyMHYAmxpgtdUqHlk2qyLNMIAsJObAZ7rSWfo=;
 b=WT25WjewejQLYSiGeCMKMlwvI4Ls6dWjhEJhIbT4zUUqltjuMnuksshuhy4E5mXAtejfBc
 ZbR9Brk609fwf88gL3HIwwFUMotayX6WJhcbjzwlUqDVFI+fDG/RT+QwArVXLHzDlpYWJE
 RYaiQbqc14hwAEo550JVAzb5GyNvfkc=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-210-_tcSYkXwMY20VUnyzuir_w-1; Mon, 10 Oct 2022 13:30:47 -0400
X-MC-Unique: _tcSYkXwMY20VUnyzuir_w-1
Received: by mail-wr1-f70.google.com with SMTP id
 g4-20020adfbc84000000b0022fc417f87cso1104841wrh.12
 for <qemu-devel@nongnu.org>; Mon, 10 Oct 2022 10:30:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=y2BU0beyMHYAmxpgtdUqHlk2qyLNMIAsJObAZ7rSWfo=;
 b=t1MMd/US6d069wvX9FZ531H7vDWUiFKbH8yIsAhqG7iMxYZ4dwF275AkenZgiWnbjB
 zGyo0dgEeR3MgmXSCKyCYL34mh3asiibB5PX/iNapYgnUh56vh4D0UttH2ojmkMzUIEr
 s/Xgj1V7QZqAXBbHQM8ElGDVf/WArbZ5bNAEYs2w/vlh0829JPtsvQlsVqZZp6iDoxaY
 tygynEEz4Gt2qwmQuYTezBVPkr+e8GVdSGha1BnV79KgTGGUkwX31YLcnHSlRVA02j+r
 7sWU3yptHlQjne2DyJe0rNhE6xM4wJ0NdhMZN2oMg5PmUh1nRnYKLpwu/cJ6g9Vyaxxr
 +diA==
X-Gm-Message-State: ACrzQf0zRbmWT40fyrfbibQh9wU3a7HSHNZ7boqQRvJvhJueQmAe7wYX
 lUAjknlixMXxE+TN2JS4Tg05AE0TxBSbaqGSavwnXm2SZNwMO5w2xaiTkFXs/z52iyG3X/+Wiie
 NAIiGl5JpBEgOqAl0BBGfwucLm2lnyIg6NQZwnrUyOhPHmIKDz1e3xwRkNp8f
X-Received: by 2002:a05:600c:b4e:b0:3c5:c61c:8e20 with SMTP id
 k14-20020a05600c0b4e00b003c5c61c8e20mr6060507wmr.103.1665423046062; 
 Mon, 10 Oct 2022 10:30:46 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5IxZRLTOL79Rt0P4k1f8bnZqAuiG2KKBJqwFQ8W+dKcIqJEObDMtmPOJrs/Uyr5+4WtRpIWg==
X-Received: by 2002:a05:600c:b4e:b0:3c5:c61c:8e20 with SMTP id
 k14-20020a05600c0b4e00b003c5c61c8e20mr6060485wmr.103.1665423045750; 
 Mon, 10 Oct 2022 10:30:45 -0700 (PDT)
Received: from redhat.com ([2.55.183.131]) by smtp.gmail.com with ESMTPSA id
 d34-20020a05600c4c2200b003c6b874a0dfsm2862024wmp.14.2022.10.10.10.30.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Oct 2022 10:30:45 -0700 (PDT)
Date: Mon, 10 Oct 2022 13:30:41 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Ben Widawsky <bwidawsk@kernel.org>, Ben Widawsky <ben.widawsky@intel.com>
Subject: [PULL 28/55] mem/cxl-type3: Add sn option to provide serial number
 for PCI ecap
Message-ID: <20221010172813.204597-29-mst@redhat.com>
References: <20221010172813.204597-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221010172813.204597-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Jonathan Cameron <Jonathan.Cameron@huawei.com>

The Device Serial Number Extended Capability PCI r6.0 sec 7.9.3
provides a standard way to provide a device serial number as
an IEEE defined 64-bit extended unique identifier EUI-64.

CXL 2.0 section 8.1.12.2 Memory Device PCIe Capabilities and
Extended Capabilities requires this to be used to uniquely
identify CXL memory devices.

Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Message-Id: <20220923161835.9805-1-Jonathan.Cameron@huawei.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Ben Widawsky <bwidawsk@kernel.org>
---
 include/hw/cxl/cxl_device.h |  1 +
 hw/mem/cxl_type3.c          | 14 +++++++++++++-
 2 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/include/hw/cxl/cxl_device.h b/include/hw/cxl/cxl_device.h
index 1e141b6621..e4d221cdb3 100644
--- a/include/hw/cxl/cxl_device.h
+++ b/include/hw/cxl/cxl_device.h
@@ -237,6 +237,7 @@ struct CXLType3Dev {
     /* Properties */
     HostMemoryBackend *hostmem;
     HostMemoryBackend *lsa;
+    uint64_t sn;
 
     /* State */
     AddressSpace hostmem_as;
diff --git a/hw/mem/cxl_type3.c b/hw/mem/cxl_type3.c
index ada2108fac..a71bf1afeb 100644
--- a/hw/mem/cxl_type3.c
+++ b/hw/mem/cxl_type3.c
@@ -14,6 +14,12 @@
 #include "sysemu/hostmem.h"
 #include "hw/cxl/cxl.h"
 
+/*
+ * Null value of all Fs suggested by IEEE RA guidelines for use of
+ * EU, OUI and CID
+ */
+#define UI64_NULL ~(0ULL)
+
 static void build_dvsecs(CXLType3Dev *ct3d)
 {
     CXLComponentState *cxl_cstate = &ct3d->cxl_cstate;
@@ -149,7 +155,12 @@ static void ct3_realize(PCIDevice *pci_dev, Error **errp)
     pci_config_set_class(pci_conf, PCI_CLASS_MEMORY_CXL);
 
     pcie_endpoint_cap_init(pci_dev, 0x80);
-    cxl_cstate->dvsec_offset = 0x100;
+    if (ct3d->sn != UI64_NULL) {
+        pcie_dev_ser_num_init(pci_dev, 0x100, ct3d->sn);
+        cxl_cstate->dvsec_offset = 0x100 + 0x0c;
+    } else {
+        cxl_cstate->dvsec_offset = 0x100;
+    }
 
     ct3d->cxl_cstate.pdev = pci_dev;
     build_dvsecs(ct3d);
@@ -275,6 +286,7 @@ static Property ct3_props[] = {
                      HostMemoryBackend *),
     DEFINE_PROP_LINK("lsa", CXLType3Dev, lsa, TYPE_MEMORY_BACKEND,
                      HostMemoryBackend *),
+    DEFINE_PROP_UINT64("sn", CXLType3Dev, sn, UI64_NULL),
     DEFINE_PROP_END_OF_LIST(),
 };
 
-- 
MST


