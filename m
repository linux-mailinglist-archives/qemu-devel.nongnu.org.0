Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2265633966F
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 19:28:28 +0100 (CET)
Received: from localhost ([::1]:42794 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKmWP-0002NL-OG
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 13:28:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59374)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lKlaf-00043X-0P
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 12:28:45 -0500
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b]:34568)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lKlaN-0002C3-71
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 12:28:44 -0500
Received: by mail-ed1-x52b.google.com with SMTP id y6so9031581eds.1
 for <qemu-devel@nongnu.org>; Fri, 12 Mar 2021 09:28:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5JNRepraAPHTlu3+kN/T3414bS3r0zFc9RKsC+Bnhh0=;
 b=Jm22Vkh5yJbiYY4PmYX8BRxsYtvCVvxfF2/ZTKDgmD2SnF5QdzNhNWFnJZ/E7oRctn
 S8UuumFnLPlY75R3nNXvn4HQOeel7hTZ5X0nIMtrtCuAdD4ZG4KYF+3XlVPdbDm21LWb
 1ZqjuFzraoPZkx9rMuOs+OWP8uVp4SxA+yo0R4vJwvm6NBJVV3tqK+mvYdXgdU767LLi
 O2O1UCRqpvMiGBeF6X4dsrcy8vZLJ5lXOqmNbV731XcyaOop5ap8u6+g9w4MRorD3KbV
 NaTY68n9WjkpEz7qyvxmVWR25lr254uLThCosRMsIfRQ4XVGHRkrY+em2tvSLEWcfMuY
 C1gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5JNRepraAPHTlu3+kN/T3414bS3r0zFc9RKsC+Bnhh0=;
 b=nL14Ska2MxnfnTJ+OY6s6cAkDGU9SLd6+wFR4pfeeHp9fAyoNkB1cGfZsw6dt94k3T
 7BDfExgffr6N35Qzx0PMyKYwaeBOe50I05otiaMcUuTJV/tTOqcdg373VCwTmA09jz2q
 EsrrZtSzSkG3Lj89iiUqUtNN9GL5typXqb5wMfqnb+cQHiMxzZSd9OZQdo3KPOk36ntD
 TLosVGy80IYCe05HdRlmN99U6wVeG47EQ1ri0UktqS+1zcdjJLdfwLR2e8BAug6yCw9H
 bgMYIpLwWZyjMNA4ZGBDs+pxk/dimUkgvNm1oyhqPoXIoa0dWJQRcSGe6gS6rrwnVAGL
 HGtg==
X-Gm-Message-State: AOAM530TmofQY/IpEGMSQhYmbJehCu3n57PL1yX8awLPPPsrWmWlut0/
 Zl8ZlAS6aUln+J2NpGfs7Vz+JQ==
X-Google-Smtp-Source: ABdhPJzki7ZMYY1WatOhrepc23lJzgh5aFTrE5beDjhqgfZr9lQz+W9j+NDiNFOUnT0e9VKf01dzYg==
X-Received: by 2002:a05:6402:6cb:: with SMTP id
 n11mr15772141edy.198.1615570105853; 
 Fri, 12 Mar 2021 09:28:25 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id 90sm3555711edr.69.2021.03.12.09.28.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Mar 2021 09:28:22 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id E037C1FF8C;
 Fri, 12 Mar 2021 17:28:21 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 02/14] plugins: Expose physical addresses instead of device
 offsets
Date: Fri, 12 Mar 2021 17:28:09 +0000
Message-Id: <20210312172821.31647-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210312172821.31647-1-alex.bennee@linaro.org>
References: <20210312172821.31647-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x52b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: robhenry@microsoft.com, mahmoudabdalghany@outlook.com,
 aaron@os.amperecomputing.com, cota@braap.org, kuhn.chenqun@huawei.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Aaron Lindsay <aaron@os.amperecomputing.com>

This allows plugins to query for full virtual-to-physical address
translation for a given `qemu_plugin_hwaddr` and stops exposing the
offset within the device itself. As this change breaks the API,
QEMU_PLUGIN_VERSION is incremented.

Signed-off-by: Aaron Lindsay <aaron@os.amperecomputing.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20210309202802.211756-1-aaron@os.amperecomputing.com>
---
 include/qemu/qemu-plugin.h  | 32 +++++++++++++++++++++++++-------
 contrib/plugins/hotpages.c  |  2 +-
 contrib/plugins/hwprofile.c |  2 +-
 plugins/api.c               | 17 ++++++++++++-----
 4 files changed, 39 insertions(+), 14 deletions(-)

diff --git a/include/qemu/qemu-plugin.h b/include/qemu/qemu-plugin.h
index c66507fe8f..3303dce862 100644
--- a/include/qemu/qemu-plugin.h
+++ b/include/qemu/qemu-plugin.h
@@ -47,7 +47,7 @@ typedef uint64_t qemu_plugin_id_t;
 
 extern QEMU_PLUGIN_EXPORT int qemu_plugin_version;
 
-#define QEMU_PLUGIN_VERSION 0
+#define QEMU_PLUGIN_VERSION 1
 
 typedef struct {
     /* string describing architecture */
@@ -307,8 +307,8 @@ bool qemu_plugin_mem_is_sign_extended(qemu_plugin_meminfo_t info);
 bool qemu_plugin_mem_is_big_endian(qemu_plugin_meminfo_t info);
 bool qemu_plugin_mem_is_store(qemu_plugin_meminfo_t info);
 
-/*
- * qemu_plugin_get_hwaddr():
+/**
+ * qemu_plugin_get_hwaddr() - return handle for memory operation
  * @vaddr: the virtual address of the memory operation
  *
  * For system emulation returns a qemu_plugin_hwaddr handle to query
@@ -323,12 +323,30 @@ struct qemu_plugin_hwaddr *qemu_plugin_get_hwaddr(qemu_plugin_meminfo_t info,
                                                   uint64_t vaddr);
 
 /*
- * The following additional queries can be run on the hwaddr structure
- * to return information about it. For non-IO accesses the device
- * offset will be into the appropriate block of RAM.
+ * The following additional queries can be run on the hwaddr structure to
+ * return information about it - namely whether it is for an IO access and the
+ * physical address associated with the access.
+ */
+
+/**
+ * qemu_plugin_hwaddr_is_io() - query whether memory operation is IO
+ * @haddr: address handle from qemu_plugin_get_hwaddr()
+ *
+ * Returns true if the handle's memory operation is to memory-mapped IO, or
+ * false if it is to RAM
  */
 bool qemu_plugin_hwaddr_is_io(const struct qemu_plugin_hwaddr *haddr);
-uint64_t qemu_plugin_hwaddr_device_offset(const struct qemu_plugin_hwaddr *haddr);
+
+/**
+ * qemu_plugin_hwaddr_phys_addr() - query physical address for memory operation
+ * @haddr: address handle from qemu_plugin_get_hwaddr()
+ *
+ * Returns the physical address associated with the memory operation
+ *
+ * Note that the returned physical address may not be unique if you are dealing
+ * with multiple address spaces.
+ */
+uint64_t qemu_plugin_hwaddr_phys_addr(const struct qemu_plugin_hwaddr *haddr);
 
 /*
  * Returns a string representing the device. The string is valid for
diff --git a/contrib/plugins/hotpages.c b/contrib/plugins/hotpages.c
index eacc678eac..bf53267532 100644
--- a/contrib/plugins/hotpages.c
+++ b/contrib/plugins/hotpages.c
@@ -122,7 +122,7 @@ static void vcpu_haddr(unsigned int cpu_index, qemu_plugin_meminfo_t meminfo,
         }
     } else {
         if (hwaddr && !qemu_plugin_hwaddr_is_io(hwaddr)) {
-            page = (uint64_t) qemu_plugin_hwaddr_device_offset(hwaddr);
+            page = (uint64_t) qemu_plugin_hwaddr_phys_addr(hwaddr);
         } else {
             page = vaddr;
         }
diff --git a/contrib/plugins/hwprofile.c b/contrib/plugins/hwprofile.c
index 6dac1d5f85..faf216ac00 100644
--- a/contrib/plugins/hwprofile.c
+++ b/contrib/plugins/hwprofile.c
@@ -201,7 +201,7 @@ static void vcpu_haddr(unsigned int cpu_index, qemu_plugin_meminfo_t meminfo,
         return;
     } else {
         const char *name = qemu_plugin_hwaddr_device_name(hwaddr);
-        uint64_t off = qemu_plugin_hwaddr_device_offset(hwaddr);
+        uint64_t off = qemu_plugin_hwaddr_phys_addr(hwaddr);
         bool is_write = qemu_plugin_mem_is_store(meminfo);
         DeviceCounts *counts;
 
diff --git a/plugins/api.c b/plugins/api.c
index 0b04380d57..3c7dc406e3 100644
--- a/plugins/api.c
+++ b/plugins/api.c
@@ -40,6 +40,7 @@
 #include "sysemu/sysemu.h"
 #include "tcg/tcg.h"
 #include "exec/exec-all.h"
+#include "exec/ram_addr.h"
 #include "disas/disas.h"
 #include "plugin.h"
 #ifndef CONFIG_USER_ONLY
@@ -298,19 +299,25 @@ bool qemu_plugin_hwaddr_is_io(const struct qemu_plugin_hwaddr *haddr)
 #endif
 }
 
-uint64_t qemu_plugin_hwaddr_device_offset(const struct qemu_plugin_hwaddr *haddr)
+uint64_t qemu_plugin_hwaddr_phys_addr(const struct qemu_plugin_hwaddr *haddr)
 {
 #ifdef CONFIG_SOFTMMU
     if (haddr) {
         if (!haddr->is_io) {
-            ram_addr_t ram_addr = qemu_ram_addr_from_host((void *) haddr->v.ram.hostaddr);
-            if (ram_addr == RAM_ADDR_INVALID) {
+            RAMBlock *block;
+            ram_addr_t offset;
+            void *hostaddr = (void *) haddr->v.ram.hostaddr;
+
+            block = qemu_ram_block_from_host(hostaddr, false, &offset);
+            if (!block) {
                 error_report("Bad ram pointer %"PRIx64"", haddr->v.ram.hostaddr);
                 abort();
             }
-            return ram_addr;
+
+            return block->offset + offset + block->mr->addr;
         } else {
-            return haddr->v.io.offset;
+            MemoryRegionSection *mrs = haddr->v.io.section;
+            return haddr->v.io.offset + mrs->mr->addr;
         }
     }
 #endif
-- 
2.20.1


