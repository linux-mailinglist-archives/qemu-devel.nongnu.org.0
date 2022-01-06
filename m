Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FF7548613A
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Jan 2022 09:08:03 +0100 (CET)
Received: from localhost ([::1]:53616 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5NoY-0001Ag-9c
	for lists+qemu-devel@lfdr.de; Thu, 06 Jan 2022 03:08:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51914)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1n5NVO-0005qb-2Q
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 02:48:15 -0500
Received: from mail.loongson.cn ([114.242.206.163]:54714 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1n5NVJ-0006aj-1X
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 02:48:10 -0500
Received: from localhost.localdomain (unknown [10.2.5.185])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dx_8ucntZhlwMAAA--.61S5;
 Thu, 06 Jan 2022 15:48:03 +0800 (CST)
From: Song Gao <gaosong@loongson.cn>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 3/3] linux-user: Remove TARGET_SIGSTKSZ
Date: Thu,  6 Jan 2022 02:47:40 -0500
Message-Id: <20220106074740.1754661-4-gaosong@loongson.cn>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220106074740.1754661-1-gaosong@loongson.cn>
References: <20220106074740.1754661-1-gaosong@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9Dx_8ucntZhlwMAAA--.61S5
X-Coremail-Antispam: 1UD129KBjvJXoWxXF1fCFy8ur1fWryUCw13XFb_yoW5urWfpF
 WUX3Z7Gr4rJrWxCrZ5Jw1rX3y8X3WYkr4UGFn3Z3y8J3WrXayrWr1DKF4fG345XFWvkFWY
 gFWqqws29rW8G3DanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnUUvcSsGvfC2KfnxnUUI43ZEXa7xR_UUUUUUUUU==
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
Received-SPF: pass client-ip=114.242.206.163; envelope-from=gaosong@loongson.cn;
 helo=loongson.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
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
Cc: Richard Henderson <richard.henderson@linaro.org>, gaosong@loongson.cn
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

TARGET_SIGSTKSZ is not used, we should remove it.

Signed-off-by: Song Gao <gaosong@loongson.cn>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/alpha/target_signal.h  | 1 -
 linux-user/generic/signal.h       | 1 -
 linux-user/hppa/target_signal.h   | 1 -
 linux-user/mips/target_signal.h   | 1 -
 linux-user/mips64/target_signal.h | 1 -
 linux-user/sparc/target_signal.h  | 1 -
 6 files changed, 6 deletions(-)

diff --git a/linux-user/alpha/target_signal.h b/linux-user/alpha/target_signal.h
index 0b6a39de65..bbb06e5463 100644
--- a/linux-user/alpha/target_signal.h
+++ b/linux-user/alpha/target_signal.h
@@ -62,7 +62,6 @@ typedef struct target_sigaltstack {
 #define TARGET_SA_SIGINFO       0x00000040
 
 #define TARGET_MINSIGSTKSZ	4096
-#define TARGET_SIGSTKSZ		16384
 
 /* From <asm/gentrap.h>.  */
 #define TARGET_GEN_INTOVF      -1      /* integer overflow */
diff --git a/linux-user/generic/signal.h b/linux-user/generic/signal.h
index ceaf8a876c..6fd05b77bb 100644
--- a/linux-user/generic/signal.h
+++ b/linux-user/generic/signal.h
@@ -69,7 +69,6 @@ typedef struct target_sigaltstack {
 #define TARGET_SS_DISABLE 2
 
 #define TARGET_MINSIGSTKSZ     2048
-#define TARGET_SIGSTKSZ        8192
 
 /* bit-flags */
 #define TARGET_SS_AUTODISARM (1U << 31) /* disable sas during sighandling */
diff --git a/linux-user/hppa/target_signal.h b/linux-user/hppa/target_signal.h
index d558119ee7..af6c2fce58 100644
--- a/linux-user/hppa/target_signal.h
+++ b/linux-user/hppa/target_signal.h
@@ -64,7 +64,6 @@ typedef struct target_sigaltstack {
 #define TARGET_SA_NOCLDWAIT     0x00000080
 
 #define TARGET_MINSIGSTKSZ	2048
-#define TARGET_SIGSTKSZ		8192
 
 /* bit-flags */
 #define TARGET_SS_AUTODISARM (1U << 31) /* disable sas during sighandling */
diff --git a/linux-user/mips/target_signal.h b/linux-user/mips/target_signal.h
index 780a4ddf29..fa542c1f4e 100644
--- a/linux-user/mips/target_signal.h
+++ b/linux-user/mips/target_signal.h
@@ -67,7 +67,6 @@ typedef struct target_sigaltstack {
 #define TARGET_SA_RESTORER      0x04000000      /* Only for O32 */
 
 #define TARGET_MINSIGSTKSZ    2048
-#define TARGET_SIGSTKSZ       8192
 
 #if defined(TARGET_ABI_MIPSO32)
 /* compare linux/arch/mips/kernel/signal.c:setup_frame() */
diff --git a/linux-user/mips64/target_signal.h b/linux-user/mips64/target_signal.h
index 275e9b7f9a..b05098f7f6 100644
--- a/linux-user/mips64/target_signal.h
+++ b/linux-user/mips64/target_signal.h
@@ -65,7 +65,6 @@ typedef struct target_sigaltstack {
 #define TARGET_SA_RESETHAND     0x80000000
 
 #define TARGET_MINSIGSTKSZ    2048
-#define TARGET_SIGSTKSZ       8192
 
 /* bit-flags */
 #define TARGET_SS_AUTODISARM (1U << 31) /* disable sas during sighandling */
diff --git a/linux-user/sparc/target_signal.h b/linux-user/sparc/target_signal.h
index e661ddd6ab..87757f0c4e 100644
--- a/linux-user/sparc/target_signal.h
+++ b/linux-user/sparc/target_signal.h
@@ -65,7 +65,6 @@ typedef struct target_sigaltstack {
 #define TARGET_ARCH_HAS_KA_RESTORER 1
 
 #define TARGET_MINSIGSTKSZ	4096
-#define TARGET_SIGSTKSZ		16384
 
 #ifdef TARGET_ABI32
 #define TARGET_ARCH_HAS_SETUP_FRAME
-- 
2.27.0


