Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 513A72486D5
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Aug 2020 16:12:48 +0200 (CEST)
Received: from localhost ([::1]:36268 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k82M3-0005BP-9x
	for lists+qemu-devel@lfdr.de; Tue, 18 Aug 2020 10:12:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60028)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1k82Jx-0002z3-31
 for qemu-devel@nongnu.org; Tue, 18 Aug 2020 10:10:37 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:48361
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1k82Jv-0007I2-3k
 for qemu-devel@nongnu.org; Tue, 18 Aug 2020 10:10:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597759834;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0a0pdxj8URCPTrQRCRURzIJ/7kye+CS6zcsdxJWquRA=;
 b=ALRaEHU2ogdloX+cmgynuMa3aqGiA7Q1KrBDmg6yvlEzJDCXwmct2HDVzV9bD9o0skLoBs
 30I1F4vxcz8DWX7u8sIios1H5VGxRdm8HRdlcnCXLqEeCoAekuLIZIYo2jJlvB64hpV/k5
 Uz5RhOOA01o6wJmk2O9b2CASrU78E54=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-158-SiN8vMfoOFGYmVaqP0jUFg-1; Tue, 18 Aug 2020 10:10:32 -0400
X-MC-Unique: SiN8vMfoOFGYmVaqP0jUFg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9B985100CA89
 for <qemu-devel@nongnu.org>; Tue, 18 Aug 2020 14:10:31 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 60C162CFC6
 for <qemu-devel@nongnu.org>; Tue, 18 Aug 2020 14:10:31 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 006/150] meson: rename .inc.h files to .h.inc
Date: Tue, 18 Aug 2020 10:08:01 -0400
Message-Id: <20200818141025.21608-7-pbonzini@redhat.com>
In-Reply-To: <20200818141025.21608-1-pbonzini@redhat.com>
References: <20200818141025.21608-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.120; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/18 03:19:25
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Make it consistent with '.c.inc' and '.rst.inc'.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 include/exec/cpu-all.h                               | 10 +++++-----
 include/exec/memory.h                                | 12 ++++++------
 .../exec/{memory_ldst.inc.h => memory_ldst.h.inc}    |  0
 ...ry_ldst_cached.inc.h => memory_ldst_cached.h.inc} |  0
 ...memory_ldst_phys.inc.h => memory_ldst_phys.h.inc} |  0
 target/s390x/cpu_features.c                          |  2 +-
 target/s390x/cpu_features_def.h                      |  2 +-
 ...cpu_features_def.inc.h => cpu_features_def.h.inc} |  0
 8 files changed, 13 insertions(+), 13 deletions(-)
 rename include/exec/{memory_ldst.inc.h => memory_ldst.h.inc} (100%)
 rename include/exec/{memory_ldst_cached.inc.h => memory_ldst_cached.h.inc} (100%)
 rename include/exec/{memory_ldst_phys.inc.h => memory_ldst_phys.h.inc} (100%)
 rename target/s390x/{cpu_features_def.inc.h => cpu_features_def.h.inc} (100%)

diff --git a/include/exec/cpu-all.h b/include/exec/cpu-all.h
index fc403d456b..f6439c4705 100644
--- a/include/exec/cpu-all.h
+++ b/include/exec/cpu-all.h
@@ -189,13 +189,13 @@ extern unsigned long reserved_va;
 #define ARG1         as
 #define ARG1_DECL    AddressSpace *as
 #define TARGET_ENDIANNESS
-#include "exec/memory_ldst.inc.h"
+#include "exec/memory_ldst.h.inc"
 
 #define SUFFIX       _cached_slow
 #define ARG1         cache
 #define ARG1_DECL    MemoryRegionCache *cache
 #define TARGET_ENDIANNESS
-#include "exec/memory_ldst.inc.h"
+#include "exec/memory_ldst.h.inc"
 
 static inline void stl_phys_notdirty(AddressSpace *as, hwaddr addr, uint32_t val)
 {
@@ -207,17 +207,17 @@ static inline void stl_phys_notdirty(AddressSpace *as, hwaddr addr, uint32_t val
 #define ARG1         as
 #define ARG1_DECL    AddressSpace *as
 #define TARGET_ENDIANNESS
-#include "exec/memory_ldst_phys.inc.h"
+#include "exec/memory_ldst_phys.h.inc"
 
 /* Inline fast path for direct RAM access.  */
 #define ENDIANNESS
-#include "exec/memory_ldst_cached.inc.h"
+#include "exec/memory_ldst_cached.h.inc"
 
 #define SUFFIX       _cached
 #define ARG1         cache
 #define ARG1_DECL    MemoryRegionCache *cache
 #define TARGET_ENDIANNESS
-#include "exec/memory_ldst_phys.inc.h"
+#include "exec/memory_ldst_phys.h.inc"
 #endif
 
 /* page related stuff */
diff --git a/include/exec/memory.h b/include/exec/memory.h
index 307e527835..0cfe987ab4 100644
--- a/include/exec/memory.h
+++ b/include/exec/memory.h
@@ -2133,12 +2133,12 @@ MemTxResult address_space_write_rom(AddressSpace *as, hwaddr addr,
 #define SUFFIX
 #define ARG1         as
 #define ARG1_DECL    AddressSpace *as
-#include "exec/memory_ldst.inc.h"
+#include "exec/memory_ldst.h.inc"
 
 #define SUFFIX
 #define ARG1         as
 #define ARG1_DECL    AddressSpace *as
-#include "exec/memory_ldst_phys.inc.h"
+#include "exec/memory_ldst_phys.h.inc"
 
 struct MemoryRegionCache {
     void *ptr;
@@ -2179,7 +2179,7 @@ struct MemoryRegionCache {
 #define SUFFIX       _cached_slow
 #define ARG1         cache
 #define ARG1_DECL    MemoryRegionCache *cache
-#include "exec/memory_ldst.inc.h"
+#include "exec/memory_ldst.h.inc"
 
 /* Inline fast path for direct RAM access.  */
 static inline uint8_t address_space_ldub_cached(MemoryRegionCache *cache,
@@ -2205,15 +2205,15 @@ static inline void address_space_stb_cached(MemoryRegionCache *cache,
 }
 
 #define ENDIANNESS   _le
-#include "exec/memory_ldst_cached.inc.h"
+#include "exec/memory_ldst_cached.h.inc"
 
 #define ENDIANNESS   _be
-#include "exec/memory_ldst_cached.inc.h"
+#include "exec/memory_ldst_cached.h.inc"
 
 #define SUFFIX       _cached
 #define ARG1         cache
 #define ARG1_DECL    MemoryRegionCache *cache
-#include "exec/memory_ldst_phys.inc.h"
+#include "exec/memory_ldst_phys.h.inc"
 
 /* address_space_cache_init: prepare for repeated access to a physical
  * memory region
diff --git a/include/exec/memory_ldst.inc.h b/include/exec/memory_ldst.h.inc
similarity index 100%
rename from include/exec/memory_ldst.inc.h
rename to include/exec/memory_ldst.h.inc
diff --git a/include/exec/memory_ldst_cached.inc.h b/include/exec/memory_ldst_cached.h.inc
similarity index 100%
rename from include/exec/memory_ldst_cached.inc.h
rename to include/exec/memory_ldst_cached.h.inc
diff --git a/include/exec/memory_ldst_phys.inc.h b/include/exec/memory_ldst_phys.h.inc
similarity index 100%
rename from include/exec/memory_ldst_phys.inc.h
rename to include/exec/memory_ldst_phys.h.inc
diff --git a/target/s390x/cpu_features.c b/target/s390x/cpu_features.c
index 9f817e3cfa..31ea8df246 100644
--- a/target/s390x/cpu_features.c
+++ b/target/s390x/cpu_features.c
@@ -23,7 +23,7 @@
         .desc = _DESC,                             \
     },
 static const S390FeatDef s390_features[S390_FEAT_MAX] = {
-    #include "cpu_features_def.inc.h"
+    #include "cpu_features_def.h.inc"
 };
 #undef DEF_FEAT
 
diff --git a/target/s390x/cpu_features_def.h b/target/s390x/cpu_features_def.h
index 412d356feb..87df31848e 100644
--- a/target/s390x/cpu_features_def.h
+++ b/target/s390x/cpu_features_def.h
@@ -17,7 +17,7 @@
 
 #define DEF_FEAT(_FEAT, ...) S390_FEAT_##_FEAT,
 typedef enum {
-    #include "cpu_features_def.inc.h"
+    #include "cpu_features_def.h.inc"
     S390_FEAT_MAX,
 } S390Feat;
 #undef DEF_FEAT
diff --git a/target/s390x/cpu_features_def.inc.h b/target/s390x/cpu_features_def.h.inc
similarity index 100%
rename from target/s390x/cpu_features_def.inc.h
rename to target/s390x/cpu_features_def.h.inc
-- 
2.26.2



