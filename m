Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 12CF860D896
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Oct 2022 02:52:09 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onUbn-0005UR-2R; Tue, 25 Oct 2022 20:49:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gourry.memverge@gmail.com>)
 id 1onUbg-0005LR-By
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 20:49:21 -0400
Received: from mail-qv1-xf42.google.com ([2607:f8b0:4864:20::f42])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <gourry.memverge@gmail.com>)
 id 1onUbe-0003aS-M9
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 20:49:19 -0400
Received: by mail-qv1-xf42.google.com with SMTP id n18so4889419qvt.11
 for <qemu-devel@nongnu.org>; Tue, 25 Oct 2022 17:49:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/u9Srr6RXjECMW/z6fGCEplaACCtFUVAvHpD6VsFGYI=;
 b=lb2uPwdsVV8+Qr+6+gRs0GsA/2YzAY3YGpgCAt07Nih5ihzeki8P8UUaaBA6BrAHgB
 roB4jvw+wtgqFnpXt3hOdgnZePM+QxjVDjSPavlhDDHdvFQAeHMKOELFRI2RKdOBAw3K
 bF6sJEv31boKoe66WJpxmYhCE59Z6dE9Y7HxK+NGDqxpKCd2pzylEYJ2UF6456wUNUdj
 haYjnui/Kbv/N4m7ALzWSVCEnbLMET/M3a0GkJbp/P6YE2Tgcf9kEXPBQ+365T9a0CfK
 1AbcQfoyNWwR7O+ltUkROuB2g3kDTIUwuYzV+rFqkSW+8ef5L3kks98s+uanuyB4VivB
 M47g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/u9Srr6RXjECMW/z6fGCEplaACCtFUVAvHpD6VsFGYI=;
 b=RdqmNLeO/Gv0uLeaPox3Tm3kT57gYobH2FiInFQ11Xjuc+GlT1G4mHFiBELiy3J6mH
 Hh7z9gFTwQCV22jBOV+ddTaG+0at1W4o4N8ZKfski6QHtlSNO1yPYGN4W1RUgEZhZKw9
 Hrpo05Nn9X6ADIP6Vg5qVXGcfrV5RaclCvCMNbQmVFDQBX+KU71htoU9lLri3nIwdQA6
 JcTYT7Zz5Jea/d5jVsNdoeTVcwbRGUYxUgM9Z9XdoWHykhNbhOkkrgYQ6l7joLmqWGCR
 /VawJwHTIZqdkzn87WiB2hSgwwxnQLzYMjZwQbLLNBZ9g+UMKvTrsAS6uUgzjA0Jk5A4
 ITiA==
X-Gm-Message-State: ACrzQf1CVXl44bZNojgmtsrz0DlSNF7v9BDz9PH8UdOv9x3BMqeosSBH
 DDC01WYVcPicJPvqVbFj9iy966OAvQ==
X-Google-Smtp-Source: AMsMyM7kWNgW/Qc08xbI2ipjZ7uhFkt3FM7NaxfvqlUw8LQ6GxNqwnQ5fjbsSSstj5XOfsinCWFTng==
X-Received: by 2002:ad4:5de8:0:b0:4b1:85db:3509 with SMTP id
 jn8-20020ad45de8000000b004b185db3509mr34393355qvb.121.1666745356253; 
 Tue, 25 Oct 2022 17:49:16 -0700 (PDT)
Received: from fedora.mshome.net (pool-173-79-56-208.washdc.fios.verizon.net.
 [173.79.56.208]) by smtp.gmail.com with ESMTPSA id
 j15-20020ac8550f000000b0039a610a04b1sm2408651qtq.37.2022.10.25.17.49.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Oct 2022 17:49:11 -0700 (PDT)
From: Gregory Price <gourry.memverge@gmail.com>
X-Google-Original-From: Gregory Price <gregory.price@memverge.com>
To: qemu-devel@nongnu.org
Cc: jonathan.cameron@huawei.com, linux-cxl@vger.kernel.org, mst@redhat.com,
 marcel.apfelbaum@gmail.com, imammedo@redhat.com, ani@anisinha.ca,
 alison.schofield@intel.com, dave@stgolabs.net, a.manzanares@samsung.com,
 bwidawsk@kernel.org, gregory.price@memverge.com,
 hchkuo@avery-design.com.tw, cbrowy@avery-design.com, ira.weiny@intel.com
Subject: [PATCH 2/4] hw/cxl: Add CXL_CAPACITY_MULTIPLIER definition
Date: Tue, 25 Oct 2022 20:47:35 -0400
Message-Id: <20221026004737.3646-3-gregory.price@memverge.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221026004737.3646-1-gregory.price@memverge.com>
References: <20221026004737.3646-1-gregory.price@memverge.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f42;
 envelope-from=gourry.memverge@gmail.com; helo=mail-qv1-xf42.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Remove usage of magic numbers when accessing capacity fields and replace
with CXL_CAPACITY_MULTIPLIER, matching the kernel definition.

Signed-off-by: Gregory Price <gregory.price@memverge.com>
Reviewed-by: Davidlohr Bueso <dave@stgolabs.net>
---
 hw/cxl/cxl-mailbox-utils.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/hw/cxl/cxl-mailbox-utils.c b/hw/cxl/cxl-mailbox-utils.c
index 3e23d29e2d..d7543fd5b4 100644
--- a/hw/cxl/cxl-mailbox-utils.c
+++ b/hw/cxl/cxl-mailbox-utils.c
@@ -15,6 +15,8 @@
 #include "qemu/log.h"
 #include "qemu/uuid.h"
 
+#define CXL_CAPACITY_MULTIPLIER   0x10000000 /* SZ_256M */
+
 /*
  * How to add a new command, example. The command set FOO, with cmd BAR.
  *  1. Add the command set and cmd to the enum.
@@ -267,7 +269,7 @@ static ret_code cmd_firmware_update_get_info(struct cxl_cmd *cmd,
     } QEMU_PACKED *fw_info;
     QEMU_BUILD_BUG_ON(sizeof(*fw_info) != 0x50);
 
-    if (cxl_dstate->pmem_size < (256 << 20)) {
+    if (cxl_dstate->pmem_size < CXL_CAPACITY_MULTIPLIER) {
         return CXL_MBOX_INTERNAL_ERROR;
     }
 
@@ -412,7 +414,7 @@ static ret_code cmd_identify_memory_device(struct cxl_cmd *cmd,
     CXLType3Class *cvc = CXL_TYPE3_GET_CLASS(ct3d);
     uint64_t size = cxl_dstate->pmem_size;
 
-    if (!QEMU_IS_ALIGNED(size, 256 << 20)) {
+    if (!QEMU_IS_ALIGNED(size, CXL_CAPACITY_MULTIPLIER)) {
         return CXL_MBOX_INTERNAL_ERROR;
     }
 
@@ -422,8 +424,8 @@ static ret_code cmd_identify_memory_device(struct cxl_cmd *cmd,
     /* PMEM only */
     snprintf(id->fw_revision, 0x10, "BWFW VERSION %02d", 0);
 
-    id->total_capacity = size / (256 << 20);
-    id->persistent_capacity = size / (256 << 20);
+    id->total_capacity = size / CXL_CAPACITY_MULTIPLIER;
+    id->persistent_capacity = size / CXL_CAPACITY_MULTIPLIER;
     id->lsa_size = cvc->get_lsa_size(ct3d);
     id->poison_list_max_mer[1] = 0x1; /* 256 poison records */
 
@@ -444,14 +446,14 @@ static ret_code cmd_ccls_get_partition_info(struct cxl_cmd *cmd,
     QEMU_BUILD_BUG_ON(sizeof(*part_info) != 0x20);
     uint64_t size = cxl_dstate->pmem_size;
 
-    if (!QEMU_IS_ALIGNED(size, 256 << 20)) {
+    if (!QEMU_IS_ALIGNED(size, CXL_CAPACITY_MULTIPLIER)) {
         return CXL_MBOX_INTERNAL_ERROR;
     }
 
     /* PMEM only */
     part_info->active_vmem = 0;
     part_info->next_vmem = 0;
-    part_info->active_pmem = size / (256 << 20);
+    part_info->active_pmem = size / CXL_CAPACITY_MULTIPLIER;
     part_info->next_pmem = 0;
 
     *len = sizeof(*part_info);
-- 
2.37.3


