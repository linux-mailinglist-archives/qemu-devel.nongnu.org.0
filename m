Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 45EBC52834C
	for <lists+qemu-devel@lfdr.de>; Mon, 16 May 2022 13:32:49 +0200 (CEST)
Received: from localhost ([::1]:34216 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqYy0-00077g-4j
	for lists+qemu-devel@lfdr.de; Mon, 16 May 2022 07:32:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48290)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nqY5y-0006dT-PJ
 for qemu-devel@nongnu.org; Mon, 16 May 2022 06:36:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:28284)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nqY5x-0005Km-5H
 for qemu-devel@nongnu.org; Mon, 16 May 2022 06:36:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652697416;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4HtdWmww//lDGQFKryJf9RwkbRk0DQ8igQoyt75Czj8=;
 b=YdKSICWSiDcU7ZhYRqZEncQbbXYWWQIEpHNL6mWi8qet0YA0NhUwBra9+Ck6RKGeJZUzeu
 Dk6FkKSMMqxieqczpsGFMdMfm3uMQwOovIUFr8WrJbOTgbKxm0t8bXujrz85vqhbFtEZwH
 bTdqYc8RY5VpNfTzWd9uHOXZYCjhK9Q=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-459--iHapqT2ME2S86myNZpDIA-1; Mon, 16 May 2022 06:36:55 -0400
X-MC-Unique: -iHapqT2ME2S86myNZpDIA-1
Received: by mail-wr1-f72.google.com with SMTP id
 o11-20020adfca0b000000b0020adc114131so3786135wrh.8
 for <qemu-devel@nongnu.org>; Mon, 16 May 2022 03:36:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=4HtdWmww//lDGQFKryJf9RwkbRk0DQ8igQoyt75Czj8=;
 b=LeAxtNu59Ed6pnxCrqIu1vTWcMWBCaqTC9X46SOiVQxYW/Dq1+kUUZulr0OZ5z5/ka
 0NYDNW1z1yYQxVGz9y+vBm1+EQYAivFJucoZ/31yAANupSFbXsMd0rvRbJvWo2Omdr6j
 9OffH1lD6zZycbM7WSjqb4OUQjTugzpPPZSxe6I2kwHYvttRlFplbVvXDVk3QHE3ObPO
 P5Em+ihgG6s8ApsTeiXKKIZ7kjY1ZQ2fLyEQ4xjB7jv1EGBS6qUEq26B6OzdLI21L8yS
 f7xoKSoHo2zrWkuFE7UQIJwQHONThN82KJEvLd6pL1Bp6HomyfegPEEAs4GEdJkFj9z+
 3mSA==
X-Gm-Message-State: AOAM530a8XwZ9FecfrFBpNZ2nZoCPTd6lZeKxYqS4TmnxnwS4UpDSYAO
 NCwNLLlhYLDG44Co9ug4XerFM9MaCIFoLFDpC16cRo8VMQRIzsAODw2fquAYlo3JSpi8akL7uFK
 1mA6h5fzVgln3iUvPkpG3vM/AJ55U2Ae+CdGHowEsmRusGqCdtCBmdsQYrWuJ
X-Received: by 2002:adf:e28e:0:b0:20c:fdbf:b136 with SMTP id
 v14-20020adfe28e000000b0020cfdbfb136mr7918241wri.544.1652697414179; 
 Mon, 16 May 2022 03:36:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwaFD58N2aWPcsKCUtHBVEQI1wPdiA9ksqn5azYwWRjwIrx/IYv8Xz44EdJIP1Ktz3mDIfqUg==
X-Received: by 2002:adf:e28e:0:b0:20c:fdbf:b136 with SMTP id
 v14-20020adfe28e000000b0020cfdbfb136mr7918195wri.544.1652697413269; 
 Mon, 16 May 2022 03:36:53 -0700 (PDT)
Received: from redhat.com ([2.55.141.66]) by smtp.gmail.com with ESMTPSA id
 l16-20020a1ced10000000b00396f8c79d22sm6043982wmh.11.2022.05.16.03.36.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 May 2022 03:36:52 -0700 (PDT)
Date: Mon, 16 May 2022 06:36:50 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Ben Widawsky <ben.widawsky@intel.com>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>
Subject: [PULL 22/91] hw/cxl/device: Plumb real Label Storage Area (LSA) sizing
Message-ID: <20220516095448.507876-23-mst@redhat.com>
References: <20220516095448.507876-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220516095448.507876-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
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


