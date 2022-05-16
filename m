Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D61A35292E4
	for <lists+qemu-devel@lfdr.de>; Mon, 16 May 2022 23:30:47 +0200 (CEST)
Received: from localhost ([::1]:41288 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqiIg-0005OD-UX
	for lists+qemu-devel@lfdr.de; Mon, 16 May 2022 17:30:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58804)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nqhht-0006gW-OI
 for qemu-devel@nongnu.org; Mon, 16 May 2022 16:52:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51709)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nqhhs-0006Y8-5x
 for qemu-devel@nongnu.org; Mon, 16 May 2022 16:52:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652734363;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=UmKaO9ErPymS/NDPUvKxYPd4cFxGnR8YHhKpxoKlU3Q=;
 b=SlqhOro/GY59Lj8wI8yhWmpuHAtrbYUd08pXgFYZgMV0onPnq+i7Qt2XWlIt9laoGTtehl
 CrSjr90ztWPnTYCX07LyNRViwzPFdwEd4E0EMJbGOQSKrR97fAwqSD50JTqo0G0tUzq50b
 qm0cgReE4qUTmVDBugZv79evWVmCpow=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-264-OkTTdcj6P-WzUOYLNKvKnQ-1; Mon, 16 May 2022 16:52:42 -0400
X-MC-Unique: OkTTdcj6P-WzUOYLNKvKnQ-1
Received: by mail-ed1-f71.google.com with SMTP id
 y1-20020a056402170100b0042aa8f679fdso3609443edu.1
 for <qemu-devel@nongnu.org>; Mon, 16 May 2022 13:52:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=UmKaO9ErPymS/NDPUvKxYPd4cFxGnR8YHhKpxoKlU3Q=;
 b=NmUUr0D9GXmPmcQPKerQR5aKd66NAREhab2soiQJwZqB01W3Z/IYpZw6iFEbq6h6aM
 MU+lgCcH5CFpsjBubOqnwSbbwYOg+TCSYS+kVmHfJoIC5mwHjVFg2y7AW10vkcfBiisC
 W+3EIB48eUXVgBxvfdwSf/LySrjr2+82hOaaNnKg4AJPCVnG0dAgaFFCXUc3WUvQwSSW
 VKTyzrgjWIqkq3GqiCngaKLbALQYu34G83Fb32lvPKnmZhctB3aUv9+L0iGS4PvJPpKK
 wg8Prwr402lLJFb5VArFEDJnFphu1wcVJEof6NsXlPy6klo3gGv4SUg8WkpPqHMlL5U3
 QBeQ==
X-Gm-Message-State: AOAM530KZS67WU7RnN7hpPxQgjYef+kZU03+cCekuYGJLnLvLQm+sWEQ
 P2X5qdCNWQ5xAq5r67kzU44+Uk2pgp0qx9qaeohtsizQQ+08sw/QQWEFv7Uc0+co9hgDFAAHlNw
 aCzRrfga/r8K7sXeI8DdZpsijWqOMo3oSz7mz+hCTVCyVHj+V8SrcQxjibuQB
X-Received: by 2002:a17:907:c22:b0:6f4:2cb6:7ba9 with SMTP id
 ga34-20020a1709070c2200b006f42cb67ba9mr16700287ejc.29.1652734361050; 
 Mon, 16 May 2022 13:52:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwokCTUpdC0Y1r5Py+97EsUtovk2Oa9UAk5223cUfV2orJtOmb4xGwjXq8kZ6szkjZsJnyyaQ==
X-Received: by 2002:a17:907:c22:b0:6f4:2cb6:7ba9 with SMTP id
 ga34-20020a1709070c2200b006f42cb67ba9mr16700265ejc.29.1652734360633; 
 Mon, 16 May 2022 13:52:40 -0700 (PDT)
Received: from redhat.com ([2.55.131.38]) by smtp.gmail.com with ESMTPSA id
 ig25-20020a1709072e1900b006f3ef214e7bsm143062ejc.225.2022.05.16.13.52.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 May 2022 13:52:40 -0700 (PDT)
Date: Mon, 16 May 2022 16:52:37 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Ben Widawsky <ben.widawsky@intel.com>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: [PULL v2 36/86] hw/cxl/component Add a dumb HDM decoder handler
Message-ID: <20220516204913.542894-37-mst@redhat.com>
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

Add a trivial handler for now to cover the root bridge
where we could do some error checking in future.

Signed-off-by: Ben Widawsky <ben.widawsky@intel.com>
Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Message-Id: <20220429144110.25167-35-Jonathan.Cameron@huawei.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/cxl/cxl-component-utils.c | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/hw/cxl/cxl-component-utils.c b/hw/cxl/cxl-component-utils.c
index 69cb07171c..7985c9bfca 100644
--- a/hw/cxl/cxl-component-utils.c
+++ b/hw/cxl/cxl-component-utils.c
@@ -32,6 +32,31 @@ static uint64_t cxl_cache_mem_read_reg(void *opaque, hwaddr offset,
     }
 }
 
+static void dumb_hdm_handler(CXLComponentState *cxl_cstate, hwaddr offset,
+                             uint32_t value)
+{
+    ComponentRegisters *cregs = &cxl_cstate->crb;
+    uint32_t *cache_mem = cregs->cache_mem_registers;
+    bool should_commit = false;
+
+    switch (offset) {
+    case A_CXL_HDM_DECODER0_CTRL:
+        should_commit = FIELD_EX32(value, CXL_HDM_DECODER0_CTRL, COMMIT);
+        break;
+    default:
+        break;
+    }
+
+    memory_region_transaction_begin();
+    stl_le_p((uint8_t *)cache_mem + offset, value);
+    if (should_commit) {
+        ARRAY_FIELD_DP32(cache_mem, CXL_HDM_DECODER0_CTRL, COMMIT, 0);
+        ARRAY_FIELD_DP32(cache_mem, CXL_HDM_DECODER0_CTRL, ERR, 0);
+        ARRAY_FIELD_DP32(cache_mem, CXL_HDM_DECODER0_CTRL, COMMITTED, 1);
+    }
+    memory_region_transaction_commit();
+}
+
 static void cxl_cache_mem_write_reg(void *opaque, hwaddr offset, uint64_t value,
                                     unsigned size)
 {
@@ -50,6 +75,12 @@ static void cxl_cache_mem_write_reg(void *opaque, hwaddr offset, uint64_t value,
     value |= ~mask & cregs->cache_mem_registers[offset / sizeof(*cregs->cache_mem_registers)];
     if (cregs->special_ops && cregs->special_ops->write) {
         cregs->special_ops->write(cxl_cstate, offset, value, size);
+        return;
+    }
+
+    if (offset >= A_CXL_HDM_DECODER_CAPABILITY &&
+        offset <= A_CXL_HDM_DECODER0_TARGET_LIST_HI) {
+        dumb_hdm_handler(cxl_cstate, offset, value);
     } else {
         cregs->cache_mem_registers[offset / sizeof(*cregs->cache_mem_registers)] = value;
     }
-- 
MST


