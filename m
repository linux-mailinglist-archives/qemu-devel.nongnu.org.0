Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 599F554AD25
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Jun 2022 11:21:17 +0200 (CEST)
Received: from localhost ([::1]:55024 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o12jb-0007HI-G7
	for lists+qemu-devel@lfdr.de; Tue, 14 Jun 2022 05:21:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41982)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1o12Uo-0005ub-SF
 for qemu-devel@nongnu.org; Tue, 14 Jun 2022 05:05:59 -0400
Received: from mail.loongson.cn ([114.242.206.163]:57870 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1o12Um-0002qQ-Ia
 for qemu-devel@nongnu.org; Tue, 14 Jun 2022 05:05:58 -0400
Received: from localhost.localdomain (unknown [10.2.5.185])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dx_09gT6hixdVAAA--.2805S3;
 Tue, 14 Jun 2022 17:05:52 +0800 (CST)
From: Song Gao <gaosong@loongson.cn>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org, laurent@vivier.eu, gaosong@loongson.cn,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 WANG Xuerui <git@xen0n.name>
Subject: [PATCH v16 1/9] linux-user: Add LoongArch generic header files
Date: Tue, 14 Jun 2022 17:05:28 +0800
Message-Id: <20220614090536.1103616-2-gaosong@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220614090536.1103616-1-gaosong@loongson.cn>
References: <20220614090536.1103616-1-gaosong@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9Dx_09gT6hixdVAAA--.2805S3
X-Coremail-Antispam: 1UD129KBjvJXoWxXrWUGr17ZrW3AFyUXF4ktFb_yoWrtFW3pF
 Wfur18Gr48XrWxt3s8Xa4UZF13Xa109FW7ua4xWry8Jr97A340vw1DKrZ7G3W3Xw1jkrWj
 gF90ya1jkF48XaDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnUUvcSsGvfC2KfnxnUUI43ZEXa7xR_UUUUUUUUU==
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
Received-SPF: pass client-ip=114.242.206.163; envelope-from=gaosong@loongson.cn;
 helo=loongson.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

This includes:
- sockbits.h
- target_errno_defs.h
- target_fcntl.h
- termbits.h
- target_resource.h
- target_structs.h

Signed-off-by: Song Gao <gaosong@loongson.cn>
Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: WANG Xuerui <git@xen0n.name>
---
 linux-user/loongarch64/sockbits.h          | 11 +++++++++++
 linux-user/loongarch64/target_errno_defs.h | 12 ++++++++++++
 linux-user/loongarch64/target_fcntl.h      | 11 +++++++++++
 linux-user/loongarch64/target_prctl.h      |  1 +
 linux-user/loongarch64/target_resource.h   | 11 +++++++++++
 linux-user/loongarch64/target_structs.h    | 11 +++++++++++
 linux-user/loongarch64/termbits.h          | 11 +++++++++++
 7 files changed, 68 insertions(+)
 create mode 100644 linux-user/loongarch64/sockbits.h
 create mode 100644 linux-user/loongarch64/target_errno_defs.h
 create mode 100644 linux-user/loongarch64/target_fcntl.h
 create mode 100644 linux-user/loongarch64/target_prctl.h
 create mode 100644 linux-user/loongarch64/target_resource.h
 create mode 100644 linux-user/loongarch64/target_structs.h
 create mode 100644 linux-user/loongarch64/termbits.h

diff --git a/linux-user/loongarch64/sockbits.h b/linux-user/loongarch64/sockbits.h
new file mode 100644
index 0000000000..1cffcae120
--- /dev/null
+++ b/linux-user/loongarch64/sockbits.h
@@ -0,0 +1,11 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * Copyright (c) 2021 Loongson Technology Corporation Limited
+ */
+
+#ifndef LOONGARCH_TARGET_SOCKBITS_H
+#define LOONGARCH_TARGET_SOCKBITS_H
+
+#include "../generic/sockbits.h"
+
+#endif
diff --git a/linux-user/loongarch64/target_errno_defs.h b/linux-user/loongarch64/target_errno_defs.h
new file mode 100644
index 0000000000..c198b8aca9
--- /dev/null
+++ b/linux-user/loongarch64/target_errno_defs.h
@@ -0,0 +1,12 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * Copyright (c) 2021 Loongson Technology Corporation Limited
+ */
+
+#ifndef LOONGARCH_TARGET_ERRNO_DEFS_H
+#define LOONGARCH_TARGET_ERRNO_DEFS_H
+
+/* Target uses generic errno */
+#include "../generic/target_errno_defs.h"
+
+#endif
diff --git a/linux-user/loongarch64/target_fcntl.h b/linux-user/loongarch64/target_fcntl.h
new file mode 100644
index 0000000000..99bf586854
--- /dev/null
+++ b/linux-user/loongarch64/target_fcntl.h
@@ -0,0 +1,11 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * Copyright (c) 2021 Loongson Technology Corporation Limited
+ */
+
+#ifndef LOONGARCH_TARGET_FCNTL_H
+#define LOONGARCH_TARGET_FCNTL_H
+
+#include "../generic/fcntl.h"
+
+#endif
diff --git a/linux-user/loongarch64/target_prctl.h b/linux-user/loongarch64/target_prctl.h
new file mode 100644
index 0000000000..eb53b31ad5
--- /dev/null
+++ b/linux-user/loongarch64/target_prctl.h
@@ -0,0 +1 @@
+/* No special prctl support required. */
diff --git a/linux-user/loongarch64/target_resource.h b/linux-user/loongarch64/target_resource.h
new file mode 100644
index 0000000000..0f86bf24ee
--- /dev/null
+++ b/linux-user/loongarch64/target_resource.h
@@ -0,0 +1,11 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * Copyright (c) 2021 Loongson Technology Corporation Limited
+ */
+
+#ifndef LOONGARCH_TARGET_RESOURCE_H
+#define LOONGARCH_TARGET_RESOURCE_H
+
+#include "../generic/target_resource.h"
+
+#endif
diff --git a/linux-user/loongarch64/target_structs.h b/linux-user/loongarch64/target_structs.h
new file mode 100644
index 0000000000..6041441e15
--- /dev/null
+++ b/linux-user/loongarch64/target_structs.h
@@ -0,0 +1,11 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * Copyright (c) 2021 Loongson Technology Corporation Limited
+ */
+
+#ifndef LOONGARCH_TARGET_STRUCTS_H
+#define LOONGARCH_TARGET_STRUCTS_H
+
+#include "../generic/target_structs.h"
+
+#endif
diff --git a/linux-user/loongarch64/termbits.h b/linux-user/loongarch64/termbits.h
new file mode 100644
index 0000000000..d425db8748
--- /dev/null
+++ b/linux-user/loongarch64/termbits.h
@@ -0,0 +1,11 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * Copyright (c) 2021 Loongson Technology Corporation Limited
+ */
+
+#ifndef LOONGARCH_TARGET_TERMBITS_H
+#define LOONGARCH_TARGET_TERMBITS_H
+
+#include "../generic/termbits.h"
+
+#endif
-- 
2.31.1


