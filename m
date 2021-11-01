Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F6A5441963
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Nov 2021 11:04:51 +0100 (CET)
Received: from localhost ([::1]:44942 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhUBO-00060N-3r
	for lists+qemu-devel@lfdr.de; Mon, 01 Nov 2021 06:04:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54290)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1mhTzm-0005ua-HJ
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 05:52:50 -0400
Received: from mail.loongson.cn ([114.242.206.163]:50784 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1mhTzf-0008DJ-3U
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 05:52:50 -0400
Received: from kvm-dev1.localdomain (unknown [10.2.5.134])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxn2u3uH9hbKIjAA--.55994S19; 
 Mon, 01 Nov 2021 17:52:27 +0800 (CST)
From: Song Gao <gaosong@loongson.cn>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 17/29] linux-user: Add LoongArch generic header files
Date: Mon,  1 Nov 2021 17:51:39 +0800
Message-Id: <1635760311-20015-18-git-send-email-gaosong@loongson.cn>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1635760311-20015-1-git-send-email-gaosong@loongson.cn>
References: <1635760311-20015-1-git-send-email-gaosong@loongson.cn>
X-CM-TRANSID: AQAAf9Dxn2u3uH9hbKIjAA--.55994S19
X-Coremail-Antispam: 1UD129KBjvJXoW7Zw4xCw4DXF4rJr48GF4rKrg_yoW8uw17pF
 Z5ur1fGr48GrZ7t34DX345XF13Xa1q9F47ua4fWry8JryxC348ZwnxKr98Wa43Zw1jkFW0
 gryDGa1UKFWkXFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
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
Cc: peter.maydell@linaro.org, thuth@redhat.com, chenhuacai@loongson.cn,
 philmd@redhat.com, i.qemu@xen0n.name, richard.henderson@linaro.org,
 laurent@vivier.eu, peterx@redhat.com, f4bug@amsat.org,
 yangxiaojuan@loongson.cn, alistair.francis@wdc.com, maobibo@loongson.cn,
 pbonzini@redhat.com, bmeng.cn@gmail.com, alex.bennee@linaro.org,
 gaosong@loongson.cn
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
 linux-user/loongarch64/sockbits.h          |  1 +
 linux-user/loongarch64/target_errno_defs.h |  7 +++++++
 linux-user/loongarch64/target_fcntl.h      | 12 ++++++++++++
 linux-user/loongarch64/termbits.h          |  1 +
 4 files changed, 21 insertions(+)
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
index 0000000..b810293
--- /dev/null
+++ b/linux-user/loongarch64/target_fcntl.h
@@ -0,0 +1,12 @@
+/*
+ * Copyright (c) 2021 Loongson Technology Corporation Limited
+ *
+ * SPDX-License-Identifier: LGPL-2.1+
+ */
+
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


