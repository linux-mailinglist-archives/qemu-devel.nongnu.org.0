Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 848D6529281
	for <lists+qemu-devel@lfdr.de>; Mon, 16 May 2022 23:13:54 +0200 (CEST)
Received: from localhost ([::1]:51508 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqi2L-0007KU-DO
	for lists+qemu-devel@lfdr.de; Mon, 16 May 2022 17:13:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58488)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nqhgi-0005dl-8h
 for qemu-devel@nongnu.org; Mon, 16 May 2022 16:51:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42253)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nqhgg-0006QG-Ke
 for qemu-devel@nongnu.org; Mon, 16 May 2022 16:51:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652734290;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4HtdWmww//lDGQFKryJf9RwkbRk0DQ8igQoyt75Czj8=;
 b=Xd/ptj6uvoIdVkN1SjnHQwdz1aOLi4Jt8vISWSGOdP2n3cTKRuSwXDtYaA+eJo7rxchct1
 m1DQgaf7smyfQs+0aRSi/4zp4oAI9/6k4pTW2O3XAAX4iF2h6dy6+qFr3xtk9llsc2lhPp
 ZfxzPQoI6Z5t8Qcc771hDNK4jzVfIDE=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-204-qElfiM4xMDakT85NMPlL8w-1; Mon, 16 May 2022 16:51:28 -0400
X-MC-Unique: qElfiM4xMDakT85NMPlL8w-1
Received: by mail-ed1-f69.google.com with SMTP id
 b14-20020a05640202ce00b0042aa312ff51so3988534edx.18
 for <qemu-devel@nongnu.org>; Mon, 16 May 2022 13:51:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=4HtdWmww//lDGQFKryJf9RwkbRk0DQ8igQoyt75Czj8=;
 b=qe2zhbTpuf8m9/c/jhWVD/GmDN4tXcisKlZXzeLur3lTdgi9l2A1UN71zPsv6XyR/7
 4blntl8/YJ4vTuhEWk+8DlI8vWTwaYhFnZ8wOgNasI2MnnKhlv2jLVjXbvUxJtbDmRgF
 zc0946r97IbptpfYt3WqFcgg/JoEtq6gBXquAU4Z7F0GMKYai2AczNh+VHkUPbsYv7ww
 HQIflkWdSmp1gGpGJ4JqrXDPRMj5cFQUkuNFIABykHe9O29HJLH/T//F/cPEHZxfKfLU
 LkwUyFoNbNWLOSpyoeRCPuJsCt04avo4TK0+XCwPXABQrCr/B9AQlPJRVS16kh0ehZSa
 2FAg==
X-Gm-Message-State: AOAM531Mem7alLy6JQZIkbnHJHdCYqGB0+RDFmc7oXiw0u0biga4l4XZ
 nNMBu/dI6bRV8/7sQcZ/Xc0wJPXKkfnbQikqBpQF2D7J2P1JW/NKJp6TegPHqUikjptj9K/kVvY
 Sx72xafg3rgAwcgrOO3RcChrZC9HxXG8+1xCYFhAljdWsyXrrp53gaDXN986n
X-Received: by 2002:a05:6402:2709:b0:428:3ed9:abe3 with SMTP id
 y9-20020a056402270900b004283ed9abe3mr15584325edd.51.1652734287190; 
 Mon, 16 May 2022 13:51:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyKjKAYBilpJ4hhYFy3kL9LxnOwGU309C3YSVWAU2TwogmFtrBD1rWjyOW5Mic8tAFDmCy6bg==
X-Received: by 2002:a05:6402:2709:b0:428:3ed9:abe3 with SMTP id
 y9-20020a056402270900b004283ed9abe3mr15584295edd.51.1652734286865; 
 Mon, 16 May 2022 13:51:26 -0700 (PDT)
Received: from redhat.com ([2.55.131.38]) by smtp.gmail.com with ESMTPSA id
 n19-20020a17090673d300b006fdd4cfb600sm168328ejl.89.2022.05.16.13.51.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 May 2022 13:51:26 -0700 (PDT)
Date: Mon, 16 May 2022 16:51:23 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Ben Widawsky <ben.widawsky@intel.com>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>
Subject: [PULL v2 22/86] hw/cxl/device: Plumb real Label Storage Area (LSA)
 sizing
Message-ID: <20220516204913.542894-23-mst@redhat.com>
References: <20220516204913.542894-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220516204913.542894-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: Ben Widawsky <ben.widawsky@intel.com>

This should introduce no change. Subsequent work will make use of this
new class member.

Signed-off-by: Ben Widawsky <ben.widawsky@intel.com>
Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Message-Id: <20220429144110.25167-21-Jonathan.Cameron@huawei.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/hw/cxl/cxl_device.h | 11 ++++++++++-
 hw/cxl/cxl-mailbox-utils.c  |  3 +++
 hw/mem/cxl_type3.c          |  9 +++++++++
 3 files changed, 22 insertions(+), 1 deletion(-)

diff --git a/include/hw/cxl/cxl_device.h b/include/hw/cxl/cxl_device.h
index d8da2c7b68..ea2571a69b 100644
--- a/include/hw/cxl/cxl_device.h
+++ b/include/hw/cxl/cxl_device.h
@@ -236,6 +236,7 @@ struct CXLType3Dev {
 
     /* Properties */
     HostMemoryBackend *hostmem;
+    HostMemoryBackend *lsa;
 
     /* State */
     CXLComponentState cxl_cstate;
@@ -243,6 +244,14 @@ struct CXLType3Dev {
 };
 
 #define TYPE_CXL_TYPE3 "cxl-type3"
-OBJECT_DECLARE_SIMPLE_TYPE(CXLType3Dev, CXL_TYPE3)
+OBJECT_DECLARE_TYPE(CXLType3Dev, CXLType3Class, CXL_TYPE3)
+
+struct CXLType3Class {
+    /* Private */
+    PCIDeviceClass parent_class;
+
+    /* public */
+    uint64_t (*get_lsa_size)(CXLType3Dev *ct3d);
+};
 
 #endif
diff --git a/hw/cxl/cxl-mailbox-utils.c b/hw/cxl/cxl-mailbox-utils.c
index c8188d7087..492739aef3 100644
--- a/hw/cxl/cxl-mailbox-utils.c
+++ b/hw/cxl/cxl-mailbox-utils.c
@@ -277,6 +277,8 @@ static ret_code cmd_identify_memory_device(struct cxl_cmd *cmd,
     } QEMU_PACKED *id;
     QEMU_BUILD_BUG_ON(sizeof(*id) != 0x43);
 
+    CXLType3Dev *ct3d = container_of(cxl_dstate, CXLType3Dev, cxl_dstate);
+    CXLType3Class *cvc = CXL_TYPE3_GET_CLASS(ct3d);
     uint64_t size = cxl_dstate->pmem_size;
 
     if (!QEMU_IS_ALIGNED(size, 256 << 20)) {
@@ -291,6 +293,7 @@ static ret_code cmd_identify_memory_device(struct cxl_cmd *cmd,
 
     id->total_capacity = size / (256 << 20);
     id->persistent_capacity = size / (256 << 20);
+    id->lsa_size = cvc->get_lsa_size(ct3d);
 
     *len = sizeof(*id);
     return CXL_MBOX_SUCCESS;
diff --git a/hw/mem/cxl_type3.c b/hw/mem/cxl_type3.c
index 318b6f9fbc..b5aa1067df 100644
--- a/hw/mem/cxl_type3.c
+++ b/hw/mem/cxl_type3.c
@@ -179,10 +179,16 @@ static Property ct3_props[] = {
     DEFINE_PROP_END_OF_LIST(),
 };
 
+static uint64_t get_lsa_size(CXLType3Dev *ct3d)
+{
+    return 0;
+}
+
 static void ct3_class_init(ObjectClass *oc, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(oc);
     PCIDeviceClass *pc = PCI_DEVICE_CLASS(oc);
+    CXLType3Class *cvc = CXL_TYPE3_CLASS(oc);
 
     pc->realize = ct3_realize;
     pc->exit = ct3_exit;
@@ -195,11 +201,14 @@ static void ct3_class_init(ObjectClass *oc, void *data)
     dc->desc = "CXL PMEM Device (Type 3)";
     dc->reset = ct3d_reset;
     device_class_set_props(dc, ct3_props);
+
+    cvc->get_lsa_size = get_lsa_size;
 }
 
 static const TypeInfo ct3d_info = {
     .name = TYPE_CXL_TYPE3,
     .parent = TYPE_PCI_DEVICE,
+    .class_size = sizeof(struct CXLType3Class),
     .class_init = ct3_class_init,
     .instance_size = sizeof(CXLType3Dev),
     .interfaces = (InterfaceInfo[]) {
-- 
MST


