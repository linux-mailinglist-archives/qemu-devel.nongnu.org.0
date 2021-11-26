Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C615145E475
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Nov 2021 03:28:48 +0100 (CET)
Received: from localhost ([::1]:59062 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mqQyl-00054s-UM
	for lists+qemu-devel@lfdr.de; Thu, 25 Nov 2021 21:28:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37808)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1mqQtf-0007Fz-LC
 for qemu-devel@nongnu.org; Thu, 25 Nov 2021 21:23:33 -0500
Received: from mail.loongson.cn ([114.242.206.163]:40414 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1mqQtP-0000U4-6W
 for qemu-devel@nongnu.org; Thu, 25 Nov 2021 21:23:31 -0500
Received: from kvm-dev1.localdomain (unknown [10.2.5.134])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxT8sNRaBhLQAAAA--.8S4;
 Fri, 26 Nov 2021 10:23:10 +0800 (CST)
From: Song Gao <gaosong@loongson.cn>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 2/3] linux-user: target_syscall.h remove definition
 TARGET_MINSIGSTKSZ
Date: Fri, 26 Nov 2021 10:23:07 +0800
Message-Id: <1637893388-10282-3-git-send-email-gaosong@loongson.cn>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1637893388-10282-1-git-send-email-gaosong@loongson.cn>
References: <1637893388-10282-1-git-send-email-gaosong@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9DxT8sNRaBhLQAAAA--.8S4
X-Coremail-Antispam: 1UD129KBjvJXoW3Ar43uryxCFyrAw4xuF47XFb_yoWftF1rpF
 WDWwn8Kw4rJFWak3s3Kr4UZF18Z3W7Gr1UC3Z7Xr4rAa43J395WF1DuayfGrsxZF4kCFWj
 qF1Dt3429rZ8XFUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
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

TARGET_MINSIGSTKSZ has been defined in generic/signal.h
or target_signal.h, We don't need to define it again.

Signed-off-by: Song Gao <gaosong@loongson.cn>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 linux-user/aarch64/target_syscall.h    | 1 -
 linux-user/alpha/target_syscall.h      | 1 -
 linux-user/arm/target_syscall.h        | 1 -
 linux-user/cris/target_syscall.h       | 1 -
 linux-user/hppa/target_syscall.h       | 1 -
 linux-user/i386/target_syscall.h       | 1 -
 linux-user/m68k/target_syscall.h       | 1 -
 linux-user/microblaze/target_syscall.h | 1 -
 linux-user/mips/target_syscall.h       | 1 -
 linux-user/mips64/target_syscall.h     | 1 -
 linux-user/nios2/target_syscall.h      | 1 -
 linux-user/openrisc/target_syscall.h   | 1 -
 linux-user/ppc/target_syscall.h        | 1 -
 linux-user/riscv/target_syscall.h      | 1 -
 linux-user/s390x/target_syscall.h      | 1 -
 linux-user/sh4/target_syscall.h        | 1 -
 linux-user/sparc/target_syscall.h      | 1 -
 linux-user/x86_64/target_syscall.h     | 1 -
 18 files changed, 18 deletions(-)

diff --git a/linux-user/aarch64/target_syscall.h b/linux-user/aarch64/target_syscall.h
index 76f6c33..508219d 100644
--- a/linux-user/aarch64/target_syscall.h
+++ b/linux-user/aarch64/target_syscall.h
@@ -15,7 +15,6 @@ struct target_pt_regs {
 #endif
 #define UNAME_MINIMUM_RELEASE "3.8.0"
 #define TARGET_CLONE_BACKWARDS
-#define TARGET_MINSIGSTKSZ       2048
 #define TARGET_MCL_CURRENT 1
 #define TARGET_MCL_FUTURE  2
 #define TARGET_MCL_ONFAULT 4
diff --git a/linux-user/alpha/target_syscall.h b/linux-user/alpha/target_syscall.h
index 03091bf..fda3a49 100644
--- a/linux-user/alpha/target_syscall.h
+++ b/linux-user/alpha/target_syscall.h
@@ -63,7 +63,6 @@ struct target_pt_regs {
 #define TARGET_UAC_NOPRINT		1
 #define TARGET_UAC_NOFIX		2
 #define TARGET_UAC_SIGBUS		4
-#define TARGET_MINSIGSTKSZ              4096
 #define TARGET_MCL_CURRENT     0x2000
 #define TARGET_MCL_FUTURE      0x4000
 #define TARGET_MCL_ONFAULT     0x8000
diff --git a/linux-user/arm/target_syscall.h b/linux-user/arm/target_syscall.h
index e870ed7..f04f9c9 100644
--- a/linux-user/arm/target_syscall.h
+++ b/linux-user/arm/target_syscall.h
@@ -27,7 +27,6 @@ struct target_pt_regs {
 
 #define TARGET_CLONE_BACKWARDS
 
-#define TARGET_MINSIGSTKSZ 2048
 #define TARGET_MCL_CURRENT 1
 #define TARGET_MCL_FUTURE  2
 #define TARGET_MCL_ONFAULT 4
diff --git a/linux-user/cris/target_syscall.h b/linux-user/cris/target_syscall.h
index 19e1281..0b5ebf1 100644
--- a/linux-user/cris/target_syscall.h
+++ b/linux-user/cris/target_syscall.h
@@ -39,7 +39,6 @@ struct target_pt_regs {
 };
 
 #define TARGET_CLONE_BACKWARDS2
-#define TARGET_MINSIGSTKSZ 2048
 #define TARGET_MCL_CURRENT 1
 #define TARGET_MCL_FUTURE  2
 #define TARGET_MCL_ONFAULT 4
diff --git a/linux-user/hppa/target_syscall.h b/linux-user/hppa/target_syscall.h
index 0018bcb..4b382c1 100644
--- a/linux-user/hppa/target_syscall.h
+++ b/linux-user/hppa/target_syscall.h
@@ -22,7 +22,6 @@ struct target_pt_regs {
 #define UNAME_MACHINE "parisc"
 #define UNAME_MINIMUM_RELEASE "2.6.32"
 #define TARGET_CLONE_BACKWARDS
-#define TARGET_MINSIGSTKSZ       2048
 #define TARGET_MCL_CURRENT 1
 #define TARGET_MCL_FUTURE  2
 #define TARGET_MCL_ONFAULT 4
diff --git a/linux-user/i386/target_syscall.h b/linux-user/i386/target_syscall.h
index ed356b3..aaade06 100644
--- a/linux-user/i386/target_syscall.h
+++ b/linux-user/i386/target_syscall.h
@@ -150,7 +150,6 @@ struct target_vm86plus_struct {
 #define UNAME_MINIMUM_RELEASE "2.6.32"
 
 #define TARGET_CLONE_BACKWARDS
-#define TARGET_MINSIGSTKSZ 2048
 #define TARGET_MCL_CURRENT 1
 #define TARGET_MCL_FUTURE  2
 #define TARGET_MCL_ONFAULT 4
diff --git a/linux-user/m68k/target_syscall.h b/linux-user/m68k/target_syscall.h
index 23359a6..8d4ddbd 100644
--- a/linux-user/m68k/target_syscall.h
+++ b/linux-user/m68k/target_syscall.h
@@ -20,7 +20,6 @@ struct target_pt_regs {
 #define UNAME_MACHINE "m68k"
 #define UNAME_MINIMUM_RELEASE "2.6.32"
 
-#define TARGET_MINSIGSTKSZ 2048
 #define TARGET_MCL_CURRENT 1
 #define TARGET_MCL_FUTURE  2
 #define TARGET_MCL_ONFAULT 4
diff --git a/linux-user/microblaze/target_syscall.h b/linux-user/microblaze/target_syscall.h
index 7f653db..43362a1 100644
--- a/linux-user/microblaze/target_syscall.h
+++ b/linux-user/microblaze/target_syscall.h
@@ -49,7 +49,6 @@ struct target_pt_regs {
 };
 
 #define TARGET_CLONE_BACKWARDS
-#define TARGET_MINSIGSTKSZ      2048
 #define TARGET_MCL_CURRENT 1
 #define TARGET_MCL_FUTURE  2
 #define TARGET_MCL_ONFAULT 4
diff --git a/linux-user/mips/target_syscall.h b/linux-user/mips/target_syscall.h
index f590574..7a82661 100644
--- a/linux-user/mips/target_syscall.h
+++ b/linux-user/mips/target_syscall.h
@@ -24,7 +24,6 @@ struct target_pt_regs {
 #define UNAME_MINIMUM_RELEASE "2.6.32"
 
 #define TARGET_CLONE_BACKWARDS
-#define TARGET_MINSIGSTKSZ 2048
 #define TARGET_MCL_CURRENT 1
 #define TARGET_MCL_FUTURE  2
 #define TARGET_MCL_ONFAULT 4
diff --git a/linux-user/mips64/target_syscall.h b/linux-user/mips64/target_syscall.h
index cd1e1b4..2c7a881 100644
--- a/linux-user/mips64/target_syscall.h
+++ b/linux-user/mips64/target_syscall.h
@@ -21,7 +21,6 @@ struct target_pt_regs {
 #define UNAME_MINIMUM_RELEASE "2.6.32"
 
 #define TARGET_CLONE_BACKWARDS
-#define TARGET_MINSIGSTKSZ      2048
 #define TARGET_MCL_CURRENT 1
 #define TARGET_MCL_FUTURE  2
 #define TARGET_MCL_ONFAULT 4
diff --git a/linux-user/nios2/target_syscall.h b/linux-user/nios2/target_syscall.h
index 78006c2..561b28d 100644
--- a/linux-user/nios2/target_syscall.h
+++ b/linux-user/nios2/target_syscall.h
@@ -30,7 +30,6 @@ struct target_pt_regs {
     unsigned long  orig_r7;
 };
 
-#define TARGET_MINSIGSTKSZ 2048
 #define TARGET_MCL_CURRENT 1
 #define TARGET_MCL_FUTURE  2
 #define TARGET_MCL_ONFAULT 4
diff --git a/linux-user/openrisc/target_syscall.h b/linux-user/openrisc/target_syscall.h
index ef0d89a..7fe5b73 100644
--- a/linux-user/openrisc/target_syscall.h
+++ b/linux-user/openrisc/target_syscall.h
@@ -15,7 +15,6 @@ struct target_pt_regs {
 #define UNAME_MACHINE "openrisc"
 #define UNAME_MINIMUM_RELEASE "2.6.32"
 
-#define TARGET_MINSIGSTKSZ 2048
 #define TARGET_MCL_CURRENT 1
 #define TARGET_MCL_FUTURE  2
 #define TARGET_MCL_ONFAULT 4
diff --git a/linux-user/ppc/target_syscall.h b/linux-user/ppc/target_syscall.h
index b9c4b81..8b36469 100644
--- a/linux-user/ppc/target_syscall.h
+++ b/linux-user/ppc/target_syscall.h
@@ -71,7 +71,6 @@ struct target_revectored_struct {
 
 #define TARGET_CLONE_BACKWARDS
 
-#define TARGET_MINSIGSTKSZ 2048
 #define TARGET_MCL_CURRENT 0x2000
 #define TARGET_MCL_FUTURE  0x4000
 #define TARGET_MCL_ONFAULT 0x8000
diff --git a/linux-user/riscv/target_syscall.h b/linux-user/riscv/target_syscall.h
index dc597c8..8d4b372 100644
--- a/linux-user/riscv/target_syscall.h
+++ b/linux-user/riscv/target_syscall.h
@@ -50,7 +50,6 @@ struct target_pt_regs {
 #endif
 #define UNAME_MINIMUM_RELEASE "4.15.0"
 
-#define TARGET_MINSIGSTKSZ 2048
 #define TARGET_MCL_CURRENT 1
 #define TARGET_MCL_FUTURE  2
 #define TARGET_MCL_ONFAULT 4
diff --git a/linux-user/s390x/target_syscall.h b/linux-user/s390x/target_syscall.h
index 94f8417..4018988 100644
--- a/linux-user/s390x/target_syscall.h
+++ b/linux-user/s390x/target_syscall.h
@@ -27,7 +27,6 @@ struct target_pt_regs {
 #define UNAME_MINIMUM_RELEASE "2.6.32"
 
 #define TARGET_CLONE_BACKWARDS2
-#define TARGET_MINSIGSTKSZ        2048
 #define TARGET_MCL_CURRENT 1
 #define TARGET_MCL_FUTURE  2
 #define TARGET_MCL_ONFAULT 4
diff --git a/linux-user/sh4/target_syscall.h b/linux-user/sh4/target_syscall.h
index c1437ad..1483988 100644
--- a/linux-user/sh4/target_syscall.h
+++ b/linux-user/sh4/target_syscall.h
@@ -15,7 +15,6 @@ struct target_pt_regs {
 #define UNAME_MACHINE "sh4"
 #define UNAME_MINIMUM_RELEASE "2.6.32"
 
-#define TARGET_MINSIGSTKSZ 2048
 #define TARGET_MCL_CURRENT 1
 #define TARGET_MCL_FUTURE  2
 #define TARGET_MCL_ONFAULT 4
diff --git a/linux-user/sparc/target_syscall.h b/linux-user/sparc/target_syscall.h
index 087b39d..be77e44 100644
--- a/linux-user/sparc/target_syscall.h
+++ b/linux-user/sparc/target_syscall.h
@@ -34,7 +34,6 @@ struct target_pt_regs {
  * and copy_thread().
  */
 #define TARGET_CLONE_BACKWARDS
-#define TARGET_MINSIGSTKSZ      4096
 #define TARGET_MCL_CURRENT 0x2000
 #define TARGET_MCL_FUTURE  0x4000
 #define TARGET_MCL_ONFAULT 0x8000
diff --git a/linux-user/x86_64/target_syscall.h b/linux-user/x86_64/target_syscall.h
index 3ecccb7..fb55834 100644
--- a/linux-user/x86_64/target_syscall.h
+++ b/linux-user/x86_64/target_syscall.h
@@ -100,7 +100,6 @@ struct target_msqid64_ds {
 #define TARGET_ARCH_SET_FS 0x1002
 #define TARGET_ARCH_GET_FS 0x1003
 #define TARGET_ARCH_GET_GS 0x1004
-#define TARGET_MINSIGSTKSZ 2048
 #define TARGET_MCL_CURRENT 1
 #define TARGET_MCL_FUTURE  2
 #define TARGET_MCL_ONFAULT 4
-- 
1.8.3.1


