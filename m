Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB76145E465
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Nov 2021 03:25:47 +0100 (CET)
Received: from localhost ([::1]:53040 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mqQvq-0000rZ-OG
	for lists+qemu-devel@lfdr.de; Thu, 25 Nov 2021 21:25:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37788)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1mqQte-0007FD-1A
 for qemu-devel@nongnu.org; Thu, 25 Nov 2021 21:23:31 -0500
Received: from mail.loongson.cn ([114.242.206.163]:40424 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1mqQtN-0000U6-Gl
 for qemu-devel@nongnu.org; Thu, 25 Nov 2021 21:23:15 -0500
Received: from kvm-dev1.localdomain (unknown [10.2.5.134])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxT8sNRaBhLQAAAA--.8S5;
 Fri, 26 Nov 2021 10:23:11 +0800 (CST)
From: Song Gao <gaosong@loongson.cn>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 3/3] linux-user: Remove TARGET_SIGSTKSZ
Date: Fri, 26 Nov 2021 10:23:08 +0800
Message-Id: <1637893388-10282-4-git-send-email-gaosong@loongson.cn>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1637893388-10282-1-git-send-email-gaosong@loongson.cn>
References: <1637893388-10282-1-git-send-email-gaosong@loongson.cn>
X-CM-TRANSID: AQAAf9DxT8sNRaBhLQAAAA--.8S5
X-Coremail-Antispam: 1UD129KBjvJXoWxXF1DJryfWFy3Gry5AF1kKrg_yoW5ZF17pF
 WUXwn7G3y8JrWxCr95Jw1rX3y8X3WYkr4UGFn3Z3y8J3WrXayrWryDKF4fG345XFWvkFWY
 qFWqqws293y8G3DanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
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
Cc: alex.bennee@linaro.org, richard.henderson@linaro.org, laurent@vivier.eu,
 f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

TARGET_SIGSTKSZ is not used, we should remove it.

Signed-off-by: Song Gao <gaosong@loongson.cn>
---
 linux-user/alpha/target_signal.h  | 1 -
 linux-user/generic/signal.h       | 1 -
 linux-user/hppa/target_signal.h   | 1 -
 linux-user/mips/target_signal.h   | 1 -
 linux-user/mips64/target_signal.h | 1 -
 linux-user/sparc/target_signal.h  | 1 -
 6 files changed, 6 deletions(-)

diff --git a/linux-user/alpha/target_signal.h b/linux-user/alpha/target_signal.h
index 0b6a39d..bbb06e5 100644
--- a/linux-user/alpha/target_signal.h
+++ b/linux-user/alpha/target_signal.h
@@ -62,7 +62,6 @@ typedef struct target_sigaltstack {
 #define TARGET_SA_SIGINFO       0x00000040
 
 #define TARGET_MINSIGSTKSZ	4096
-#define TARGET_SIGSTKSZ		16384
 
 /* From <asm/gentrap.h>.  */
 #define TARGET_GEN_INTOVF      -1      /* integer overflow */
diff --git a/linux-user/generic/signal.h b/linux-user/generic/signal.h
index ceaf8a8..6fd05b7 100644
--- a/linux-user/generic/signal.h
+++ b/linux-user/generic/signal.h
@@ -69,7 +69,6 @@ typedef struct target_sigaltstack {
 #define TARGET_SS_DISABLE 2
 
 #define TARGET_MINSIGSTKSZ     2048
-#define TARGET_SIGSTKSZ        8192
 
 /* bit-flags */
 #define TARGET_SS_AUTODISARM (1U << 31) /* disable sas during sighandling */
diff --git a/linux-user/hppa/target_signal.h b/linux-user/hppa/target_signal.h
index d558119..af6c2fc 100644
--- a/linux-user/hppa/target_signal.h
+++ b/linux-user/hppa/target_signal.h
@@ -64,7 +64,6 @@ typedef struct target_sigaltstack {
 #define TARGET_SA_NOCLDWAIT     0x00000080
 
 #define TARGET_MINSIGSTKSZ	2048
-#define TARGET_SIGSTKSZ		8192
 
 /* bit-flags */
 #define TARGET_SS_AUTODISARM (1U << 31) /* disable sas during sighandling */
diff --git a/linux-user/mips/target_signal.h b/linux-user/mips/target_signal.h
index 780a4dd..fa542c1 100644
--- a/linux-user/mips/target_signal.h
+++ b/linux-user/mips/target_signal.h
@@ -67,7 +67,6 @@ typedef struct target_sigaltstack {
 #define TARGET_SA_RESTORER      0x04000000      /* Only for O32 */
 
 #define TARGET_MINSIGSTKSZ    2048
-#define TARGET_SIGSTKSZ       8192
 
 #if defined(TARGET_ABI_MIPSO32)
 /* compare linux/arch/mips/kernel/signal.c:setup_frame() */
diff --git a/linux-user/mips64/target_signal.h b/linux-user/mips64/target_signal.h
index 275e9b7..b05098f 100644
--- a/linux-user/mips64/target_signal.h
+++ b/linux-user/mips64/target_signal.h
@@ -65,7 +65,6 @@ typedef struct target_sigaltstack {
 #define TARGET_SA_RESETHAND     0x80000000
 
 #define TARGET_MINSIGSTKSZ    2048
-#define TARGET_SIGSTKSZ       8192
 
 /* bit-flags */
 #define TARGET_SS_AUTODISARM (1U << 31) /* disable sas during sighandling */
diff --git a/linux-user/sparc/target_signal.h b/linux-user/sparc/target_signal.h
index e661ddd..87757f0 100644
--- a/linux-user/sparc/target_signal.h
+++ b/linux-user/sparc/target_signal.h
@@ -65,7 +65,6 @@ typedef struct target_sigaltstack {
 #define TARGET_ARCH_HAS_KA_RESTORER 1
 
 #define TARGET_MINSIGSTKSZ	4096
-#define TARGET_SIGSTKSZ		16384
 
 #ifdef TARGET_ABI32
 #define TARGET_ARCH_HAS_SETUP_FRAME
-- 
1.8.3.1


