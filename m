Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3206A387152
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 07:35:20 +0200 (CEST)
Received: from localhost ([::1]:52176 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lisNz-0006xJ-92
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 01:35:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38392)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lisKX-00070j-Dw
 for qemu-devel@nongnu.org; Tue, 18 May 2021 01:31:45 -0400
Received: from mout.kundenserver.de ([217.72.192.73]:49463)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lisKT-0006wT-QU
 for qemu-devel@nongnu.org; Tue, 18 May 2021 01:31:45 -0400
Received: from quad ([82.142.31.78]) by mrelayeu.kundenserver.de (mreue106
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1Mg6qO-1lGxl710Aw-00hdsl; Tue, 18
 May 2021 07:31:39 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 14/59] linux-user/sparc: Merge sparc64 target_syscall.h
Date: Tue, 18 May 2021 07:30:46 +0200
Message-Id: <20210518053131.87212-15-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210518053131.87212-1-laurent@vivier.eu>
References: <20210518053131.87212-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:zP0eWViHxxDL9FfgmA6x+3t6FcO1YueMs/xzTNXd9Vai0futfoA
 D0iEp65oAkJurH/le9OQckNuCW/V+jo7i0UuM5KIvEBPkx6lDBJlN1na4NHMtX7AjNX5frp
 vSSM7aLelUN4hJfsVniJg48rcyGvP5WIIJog/QlQzhhWlt1xULMkAvOwjIItpQCRIIGnQP+
 7bXwOKu1MubGgGUuWIK+A==
X-UI-Out-Filterresults: notjunk:1;V03:K0:rCrVIjbhFDk=:etvdoAc6TsiaSvyfR3DWK6
 WeRV+AX8w7gyxOiSESRzbUco7TGImALfqvTXnmKOpZCQb1lGO+fdTczTiQ0vrYBxaDUqaYnkd
 MVI7Plv/DztQ0CSrAdyUcMYP0/OpNAYK7rJzvcibsYEvVAlcGhb++IwaC5pzJtIFVvcEctKqQ
 YqHNEDgffGejxVRKiA6I+Z8EQkEqWXp9JZsrRu/VvUngzeES1LKQVsbuliPeokM8Qg3F066fY
 zvfhOztsfNzOjKpbVym2ZsXIHCAm5h71tr7HzT4sY0OKrenq/4jHByrarIwZnLsMqPouLWhmB
 Ka3lTE6tNKTbjprue8MmIlj82gt+TeZG9ytjPWYLihbMcRRV3t+XXbDQr2T/1VDzAgaCO8ko+
 HaSK+vF64qQ3sHlllAp3VEDBFPkvExCVnHzY6lWqW7a42T5s1cdJnQdy2n+Gj2W7MSQ8nOjDk
 aUlMN2lXmcyghuluhoPa3z3LhUDzAlIDsO4vKzHdLz8z9pWYxGJWwSvgUxK6mVdAVgvJI507I
 RbPHAo6+UVVvV4IU3QptTo=
Received-SPF: none client-ip=217.72.192.73; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

There are only a few differences in sparc32 vs sparc64.
This fixes target_shmlba for sparc32plus, which is v9.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210426025334.1168495-8-richard.henderson@linaro.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/sparc/target_syscall.h   | 42 +++++++++++++++++++++--------
 linux-user/sparc64/target_syscall.h | 36 +------------------------
 2 files changed, 32 insertions(+), 46 deletions(-)

diff --git a/linux-user/sparc/target_syscall.h b/linux-user/sparc/target_syscall.h
index d8ea04ea837a..15d531f38978 100644
--- a/linux-user/sparc/target_syscall.h
+++ b/linux-user/sparc/target_syscall.h
@@ -3,18 +3,34 @@
 
 #include "target_errno.h"
 
+#if defined(TARGET_SPARC64) && !defined(TARGET_ABI32)
 struct target_pt_regs {
-	abi_ulong psr;
-	abi_ulong pc;
-	abi_ulong npc;
-	abi_ulong y;
-	abi_ulong u_regs[16];
+    abi_ulong u_regs[16];
+    abi_ulong tstate;
+    abi_ulong pc;
+    abi_ulong npc;
+    uint32_t y;
+    uint32_t magic;
 };
+#else
+struct target_pt_regs {
+    abi_ulong psr;
+    abi_ulong pc;
+    abi_ulong npc;
+    abi_ulong y;
+    abi_ulong u_regs[16];
+};
+#endif
 
-#define UNAME_MACHINE "sparc"
+#ifdef TARGET_SPARC64
+# define UNAME_MACHINE "sparc64"
+#else
+# define UNAME_MACHINE "sparc"
+#endif
 #define UNAME_MINIMUM_RELEASE "2.6.32"
 
-/* SPARC kernels don't define this in their Kconfig, but they have the
+/*
+ * SPARC kernels don't define this in their Kconfig, but they have the
  * same ABI as if they did, implemented by sparc-specific code which fishes
  * directly in the u_regs() struct for half the parameters in sparc_do_fork()
  * and copy_thread().
@@ -25,20 +41,24 @@ struct target_pt_regs {
 #define TARGET_MCL_FUTURE  0x4000
 #define TARGET_MCL_ONFAULT 0x8000
 
-/* For SPARC SHMLBA is determined at runtime in the kernel, and
- * libc has to runtime-detect it using the hwcaps (see glibc
- * sysdeps/unix/sysv/linux/sparc/getshmlba; we follow the same
- * logic here, though we know we're not the sparc v9 64-bit case).
+/*
+ * For SPARC SHMLBA is determined at runtime in the kernel, and
+ * libc has to runtime-detect it using the hwcaps.
+ * See glibc sysdeps/unix/sysv/linux/sparc/getshmlba.
  */
 #define TARGET_FORCE_SHMLBA
 
 static inline abi_ulong target_shmlba(CPUSPARCState *env)
 {
+#ifdef TARGET_SPARC64
+    return MAX(TARGET_PAGE_SIZE, 16 * 1024);
+#else
     if (!(env->def.features & CPU_FEATURE_FLUSH)) {
         return 64 * 1024;
     } else {
         return 256 * 1024;
     }
+#endif
 }
 
 #endif /* SPARC_TARGET_SYSCALL_H */
diff --git a/linux-user/sparc64/target_syscall.h b/linux-user/sparc64/target_syscall.h
index 696a68b1ed4e..164a5fc6322f 100644
--- a/linux-user/sparc64/target_syscall.h
+++ b/linux-user/sparc64/target_syscall.h
@@ -1,35 +1 @@
-#ifndef SPARC64_TARGET_SYSCALL_H
-#define SPARC64_TARGET_SYSCALL_H
-
-#include "../sparc/target_errno.h"
-
-struct target_pt_regs {
-	abi_ulong u_regs[16];
-	abi_ulong tstate;
-	abi_ulong pc;
-	abi_ulong npc;
-	abi_ulong y;
-	abi_ulong fprs;
-};
-
-#define UNAME_MACHINE "sparc64"
-#define UNAME_MINIMUM_RELEASE "2.6.32"
-
-/* SPARC kernels don't define this in their Kconfig, but they have the
- * same ABI as if they did, implemented by sparc-specific code which fishes
- * directly in the u_regs() struct for half the parameters in sparc_do_fork()
- * and copy_thread().
- */
-#define TARGET_CLONE_BACKWARDS
-#define TARGET_MINSIGSTKSZ      4096
-#define TARGET_MCL_CURRENT 0x2000
-#define TARGET_MCL_FUTURE  0x4000
-#define TARGET_MCL_ONFAULT 0x8000
-
-#define TARGET_FORCE_SHMLBA
-
-static inline abi_ulong target_shmlba(CPUSPARCState *env)
-{
-    return MAX(TARGET_PAGE_SIZE, 16 * 1024);
-}
-#endif /* SPARC64_TARGET_SYSCALL_H */
+#include "../sparc/target_syscall.h"
-- 
2.31.1


