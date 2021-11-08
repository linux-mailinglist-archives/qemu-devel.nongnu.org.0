Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F9444478E4
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Nov 2021 04:26:38 +0100 (CET)
Received: from [::1] (port=35198 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mjvIr-0003f0-8J
	for lists+qemu-devel@lfdr.de; Sun, 07 Nov 2021 22:26:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39918)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1mjv23-0003j2-Ih
 for qemu-devel@nongnu.org; Sun, 07 Nov 2021 22:09:16 -0500
Received: from mail.loongson.cn ([114.242.206.163]:55110 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1mjv1z-0003hW-0w
 for qemu-devel@nongnu.org; Sun, 07 Nov 2021 22:09:15 -0500
Received: from kvm-dev1.localdomain (unknown [10.2.5.134])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9CxGdGflIhh9g8BAA--.2390S19; 
 Mon, 08 Nov 2021 11:08:55 +0800 (CST)
From: Song Gao <gaosong@loongson.cn>
To: qemu-devel@nongnu.org
Subject: [RESEND PATCH v9 17/28] linux-user: Add LoongArch generic header files
Date: Mon,  8 Nov 2021 11:08:04 +0800
Message-Id: <1636340895-5255-18-git-send-email-gaosong@loongson.cn>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1636340895-5255-1-git-send-email-gaosong@loongson.cn>
References: <1636340895-5255-1-git-send-email-gaosong@loongson.cn>
X-CM-TRANSID: AQAAf9CxGdGflIhh9g8BAA--.2390S19
X-Coremail-Antispam: 1UD129KBjvJXoW7Zw4xCw4DXF1rWrykJF45GFg_yoW8ZFWDpF
 s5ur1xGr48GrZ7t34DX345XF15Xa1q9F47ua4fWry8Jry8C34UZwnxKr98Wa43Zw1YkFW0
 gryDGa1UKFWDXFJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
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
Cc: Xiaojuan Yang <yangxiaojuan@loongson.cn>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This includes:
- sockbits.h
- target_errno_defs.h
- target_fcntl.h
- termbits.h

Signed-off-by: Song Gao <gaosong@loongson.cn>
Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
---
 linux-user/loongarch64/sockbits.h          | 1 +
 linux-user/loongarch64/target_errno_defs.h | 7 +++++++
 linux-user/loongarch64/target_fcntl.h      | 6 ++++++
 linux-user/loongarch64/termbits.h          | 1 +
 4 files changed, 15 insertions(+)
 create mode 100644 linux-user/loongarch64/sockbits.h
 create mode 100644 linux-user/loongarch64/target_errno_defs.h
 create mode 100644 linux-user/loongarch64/target_fcntl.h
 create mode 100644 linux-user/loongarch64/termbits.h

diff --git a/linux-user/loongarch64/sockbits.h b/linux-user/loongarch64/sockbits.h
new file mode 100644
index 0000000..0e4c8f0
--- /dev/null
+++ b/linux-user/loongarch64/sockbits.h
@@ -0,0 +1 @@
+#include "../generic/sockbits.h"
diff --git a/linux-user/loongarch64/target_errno_defs.h b/linux-user/loongarch64/target_errno_defs.h
new file mode 100644
index 0000000..17165c1
--- /dev/null
+++ b/linux-user/loongarch64/target_errno_defs.h
@@ -0,0 +1,7 @@
+#ifndef LOONGARCH_TARGET_ERRNO_DEFS_H
+#define LOONGARCH_TARGET_ERRNO_DEFS_H
+
+/* Target uses generic errno */
+#include "../generic/target_errno_defs.h"
+
+#endif
diff --git a/linux-user/loongarch64/target_fcntl.h b/linux-user/loongarch64/target_fcntl.h
new file mode 100644
index 0000000..9fa3c99
--- /dev/null
+++ b/linux-user/loongarch64/target_fcntl.h
@@ -0,0 +1,6 @@
+#ifndef LOONGARCH_TARGET_FCNTL_H
+#define LOONGARCH_TARGET_FCNTL_H
+
+#include "../generic/fcntl.h"
+
+#endif  /* LOONGARCH_TARGET_FCNTL_H */
diff --git a/linux-user/loongarch64/termbits.h b/linux-user/loongarch64/termbits.h
new file mode 100644
index 0000000..b1d4f4f
--- /dev/null
+++ b/linux-user/loongarch64/termbits.h
@@ -0,0 +1 @@
+#include "../generic/termbits.h"
-- 
1.8.3.1


