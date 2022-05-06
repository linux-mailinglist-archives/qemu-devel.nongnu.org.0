Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 003D251D9A2
	for <lists+qemu-devel@lfdr.de>; Fri,  6 May 2022 15:52:51 +0200 (CEST)
Received: from localhost ([::1]:47330 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmyO0-0000BH-Rp
	for lists+qemu-devel@lfdr.de; Fri, 06 May 2022 09:52:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33836)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nmyKd-0005uG-BQ
 for qemu-devel@nongnu.org; Fri, 06 May 2022 09:49:23 -0400
Received: from us-smtp-delivery-74.mimecast.com ([170.10.129.74]:44059)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nmyKa-0005q4-1b
 for qemu-devel@nongnu.org; Fri, 06 May 2022 09:49:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651844954;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=H/HYpmkAnlGF1w1XfD7jQepRZoWCCfPeInF/CPv6I2s=;
 b=N6ehpCWX+X4zglmjUjRwzj4zYHJPHzCPAxKy+yUzYyOtiQFQNrKIt2458PX1SeoLk0oKfL
 UBl5xyNwbmEfXgxpZpv7G8PXJRoXy1fZ7K0wXilBmb4LCToSSgVQ8iCqSRN4BsfIfPQm+y
 Cfzgi16DJXhtTpeR1q6Q1sGEHLR1E6A=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-675-nY0K2N4LMh2OVOA3gm8zdw-1; Fri, 06 May 2022 09:49:13 -0400
X-MC-Unique: nY0K2N4LMh2OVOA3gm8zdw-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2B9081014A64
 for <qemu-devel@nongnu.org>; Fri,  6 May 2022 13:49:13 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.36.112.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E15BB468A6F
 for <qemu-devel@nongnu.org>; Fri,  6 May 2022 13:49:12 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id B3A7C21E6887; Fri,  6 May 2022 15:49:11 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/4] Normalize header guard symbol definition
Date: Fri,  6 May 2022 15:49:10 +0200
Message-Id: <20220506134911.2856099-4-armbru@redhat.com>
In-Reply-To: <20220506134911.2856099-1-armbru@redhat.com>
References: <20220506134911.2856099-1-armbru@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.74; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-74.mimecast.com
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

We commonly define the header guard symbol without an explicit value.
Normalize the exceptions.

Done with scripts/clean-header-guards.pl.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 include/exec/memopidx.h       | 2 +-
 include/tcg/tcg-ldst.h        | 2 +-
 target/alpha/cpu-param.h      | 2 +-
 target/arm/cpu-param.h        | 2 +-
 target/cris/cpu-param.h       | 2 +-
 target/hppa/cpu-param.h       | 2 +-
 target/i386/cpu-param.h       | 2 +-
 target/m68k/cpu-param.h       | 2 +-
 target/microblaze/cpu-param.h | 2 +-
 target/mips/cpu-param.h       | 2 +-
 target/nios2/cpu-param.h      | 2 +-
 target/openrisc/cpu-param.h   | 2 +-
 target/ppc/cpu-param.h        | 2 +-
 target/riscv/cpu-param.h      | 2 +-
 target/s390x/cpu-param.h      | 2 +-
 target/sh4/cpu-param.h        | 2 +-
 target/sparc/cpu-param.h      | 2 +-
 target/tricore/cpu-param.h    | 2 +-
 target/xtensa/cpu-param.h     | 2 +-
 tcg/tcg-internal.h            | 2 +-
 20 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/include/exec/memopidx.h b/include/exec/memopidx.h
index 83bce97874..eb7f1591a3 100644
--- a/include/exec/memopidx.h
+++ b/include/exec/memopidx.h
@@ -9,7 +9,7 @@
  */
 
 #ifndef EXEC_MEMOPIDX_H
-#define EXEC_MEMOPIDX_H 1
+#define EXEC_MEMOPIDX_H
 
 #include "exec/memop.h"
 
diff --git a/include/tcg/tcg-ldst.h b/include/tcg/tcg-ldst.h
index 121a156933..2ba22bd5fe 100644
--- a/include/tcg/tcg-ldst.h
+++ b/include/tcg/tcg-ldst.h
@@ -23,7 +23,7 @@
  */
 
 #ifndef TCG_LDST_H
-#define TCG_LDST_H 1
+#define TCG_LDST_H
 
 #ifdef CONFIG_SOFTMMU
 
diff --git a/target/alpha/cpu-param.h b/target/alpha/cpu-param.h
index 1153992e42..17cd14e590 100644
--- a/target/alpha/cpu-param.h
+++ b/target/alpha/cpu-param.h
@@ -6,7 +6,7 @@
  */
 
 #ifndef ALPHA_CPU_PARAM_H
-#define ALPHA_CPU_PARAM_H 1
+#define ALPHA_CPU_PARAM_H
 
 #define TARGET_LONG_BITS 64
 #define TARGET_PAGE_BITS 13
diff --git a/target/arm/cpu-param.h b/target/arm/cpu-param.h
index b59d505761..68ffb12427 100644
--- a/target/arm/cpu-param.h
+++ b/target/arm/cpu-param.h
@@ -6,7 +6,7 @@
  */
 
 #ifndef ARM_CPU_PARAM_H
-#define ARM_CPU_PARAM_H 1
+#define ARM_CPU_PARAM_H
 
 #ifdef TARGET_AARCH64
 # define TARGET_LONG_BITS             64
diff --git a/target/cris/cpu-param.h b/target/cris/cpu-param.h
index 36a3058761..12ec22d8df 100644
--- a/target/cris/cpu-param.h
+++ b/target/cris/cpu-param.h
@@ -6,7 +6,7 @@
  */
 
 #ifndef CRIS_CPU_PARAM_H
-#define CRIS_CPU_PARAM_H 1
+#define CRIS_CPU_PARAM_H
 
 #define TARGET_LONG_BITS 32
 #define TARGET_PAGE_BITS 13
diff --git a/target/hppa/cpu-param.h b/target/hppa/cpu-param.h
index a97d1428df..a48a2701ae 100644
--- a/target/hppa/cpu-param.h
+++ b/target/hppa/cpu-param.h
@@ -6,7 +6,7 @@
  */
 
 #ifndef HPPA_CPU_PARAM_H
-#define HPPA_CPU_PARAM_H 1
+#define HPPA_CPU_PARAM_H
 
 #ifdef TARGET_HPPA64
 # define TARGET_LONG_BITS             64
diff --git a/target/i386/cpu-param.h b/target/i386/cpu-param.h
index 57abc64c0d..9740bd7abd 100644
--- a/target/i386/cpu-param.h
+++ b/target/i386/cpu-param.h
@@ -6,7 +6,7 @@
  */
 
 #ifndef I386_CPU_PARAM_H
-#define I386_CPU_PARAM_H 1
+#define I386_CPU_PARAM_H
 
 #ifdef TARGET_X86_64
 # define TARGET_LONG_BITS             64
diff --git a/target/m68k/cpu-param.h b/target/m68k/cpu-param.h
index 06556dfbf3..44a8d193f0 100644
--- a/target/m68k/cpu-param.h
+++ b/target/m68k/cpu-param.h
@@ -6,7 +6,7 @@
  */
 
 #ifndef M68K_CPU_PARAM_H
-#define M68K_CPU_PARAM_H 1
+#define M68K_CPU_PARAM_H
 
 #define TARGET_LONG_BITS 32
 /*
diff --git a/target/microblaze/cpu-param.h b/target/microblaze/cpu-param.h
index 4d8297fa94..5e54ea0108 100644
--- a/target/microblaze/cpu-param.h
+++ b/target/microblaze/cpu-param.h
@@ -6,7 +6,7 @@
  */
 
 #ifndef MICROBLAZE_CPU_PARAM_H
-#define MICROBLAZE_CPU_PARAM_H 1
+#define MICROBLAZE_CPU_PARAM_H
 
 /*
  * While system mode can address up to 64 bits of address space,
diff --git a/target/mips/cpu-param.h b/target/mips/cpu-param.h
index 1aebd01df9..f4c76994ea 100644
--- a/target/mips/cpu-param.h
+++ b/target/mips/cpu-param.h
@@ -5,7 +5,7 @@
  */
 
 #ifndef MIPS_CPU_PARAM_H
-#define MIPS_CPU_PARAM_H 1
+#define MIPS_CPU_PARAM_H
 
 #ifdef TARGET_MIPS64
 # define TARGET_LONG_BITS 64
diff --git a/target/nios2/cpu-param.h b/target/nios2/cpu-param.h
index 38bedbfd61..177d720864 100644
--- a/target/nios2/cpu-param.h
+++ b/target/nios2/cpu-param.h
@@ -6,7 +6,7 @@
  */
 
 #ifndef NIOS2_CPU_PARAM_H
-#define NIOS2_CPU_PARAM_H 1
+#define NIOS2_CPU_PARAM_H
 
 #define TARGET_LONG_BITS 32
 #define TARGET_PAGE_BITS 12
diff --git a/target/openrisc/cpu-param.h b/target/openrisc/cpu-param.h
index 06ee64d171..73be699f36 100644
--- a/target/openrisc/cpu-param.h
+++ b/target/openrisc/cpu-param.h
@@ -6,7 +6,7 @@
  */
 
 #ifndef OPENRISC_CPU_PARAM_H
-#define OPENRISC_CPU_PARAM_H 1
+#define OPENRISC_CPU_PARAM_H
 
 #define TARGET_LONG_BITS 32
 #define TARGET_PAGE_BITS 13
diff --git a/target/ppc/cpu-param.h b/target/ppc/cpu-param.h
index 37b458d33d..ea377b7d06 100644
--- a/target/ppc/cpu-param.h
+++ b/target/ppc/cpu-param.h
@@ -6,7 +6,7 @@
  */
 
 #ifndef PPC_CPU_PARAM_H
-#define PPC_CPU_PARAM_H 1
+#define PPC_CPU_PARAM_H
 
 #ifdef TARGET_PPC64
 # define TARGET_LONG_BITS 64
diff --git a/target/riscv/cpu-param.h b/target/riscv/cpu-param.h
index 80eb615f93..ebaf26d26d 100644
--- a/target/riscv/cpu-param.h
+++ b/target/riscv/cpu-param.h
@@ -6,7 +6,7 @@
  */
 
 #ifndef RISCV_CPU_PARAM_H
-#define RISCV_CPU_PARAM_H 1
+#define RISCV_CPU_PARAM_H
 
 #if defined(TARGET_RISCV64)
 # define TARGET_LONG_BITS 64
diff --git a/target/s390x/cpu-param.h b/target/s390x/cpu-param.h
index 472db648d7..bf951a002e 100644
--- a/target/s390x/cpu-param.h
+++ b/target/s390x/cpu-param.h
@@ -6,7 +6,7 @@
  */
 
 #ifndef S390_CPU_PARAM_H
-#define S390_CPU_PARAM_H 1
+#define S390_CPU_PARAM_H
 
 #define TARGET_LONG_BITS 64
 #define TARGET_PAGE_BITS 12
diff --git a/target/sh4/cpu-param.h b/target/sh4/cpu-param.h
index 81ace3503b..98a02509bb 100644
--- a/target/sh4/cpu-param.h
+++ b/target/sh4/cpu-param.h
@@ -6,7 +6,7 @@
  */
 
 #ifndef SH4_CPU_PARAM_H
-#define SH4_CPU_PARAM_H 1
+#define SH4_CPU_PARAM_H
 
 #define TARGET_LONG_BITS 32
 #define TARGET_PAGE_BITS 12  /* 4k */
diff --git a/target/sparc/cpu-param.h b/target/sparc/cpu-param.h
index 4746d89411..72ddc4a34f 100644
--- a/target/sparc/cpu-param.h
+++ b/target/sparc/cpu-param.h
@@ -5,7 +5,7 @@
  */
 
 #ifndef SPARC_CPU_PARAM_H
-#define SPARC_CPU_PARAM_H 1
+#define SPARC_CPU_PARAM_H
 
 #ifdef TARGET_SPARC64
 # define TARGET_LONG_BITS 64
diff --git a/target/tricore/cpu-param.h b/target/tricore/cpu-param.h
index cf5d9af89d..2727913047 100644
--- a/target/tricore/cpu-param.h
+++ b/target/tricore/cpu-param.h
@@ -6,7 +6,7 @@
  */
 
 #ifndef TRICORE_CPU_PARAM_H
-#define TRICORE_CPU_PARAM_H 1
+#define TRICORE_CPU_PARAM_H
 
 #define TARGET_LONG_BITS 32
 #define TARGET_PAGE_BITS 14
diff --git a/target/xtensa/cpu-param.h b/target/xtensa/cpu-param.h
index 4fde21b941..b53e9a3e08 100644
--- a/target/xtensa/cpu-param.h
+++ b/target/xtensa/cpu-param.h
@@ -6,7 +6,7 @@
  */
 
 #ifndef XTENSA_CPU_PARAM_H
-#define XTENSA_CPU_PARAM_H 1
+#define XTENSA_CPU_PARAM_H
 
 #define TARGET_LONG_BITS 32
 #define TARGET_PAGE_BITS 12
diff --git a/tcg/tcg-internal.h b/tcg/tcg-internal.h
index 92c91dcde9..cc82088d52 100644
--- a/tcg/tcg-internal.h
+++ b/tcg/tcg-internal.h
@@ -23,7 +23,7 @@
  */
 
 #ifndef TCG_INTERNAL_H
-#define TCG_INTERNAL_H 1
+#define TCG_INTERNAL_H
 
 #define TCG_HIGHWATER 1024
 
-- 
2.35.1


