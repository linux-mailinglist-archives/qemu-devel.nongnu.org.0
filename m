Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C01952A08E
	for <lists+qemu-devel@lfdr.de>; Tue, 17 May 2022 13:38:08 +0200 (CEST)
Received: from localhost ([::1]:48160 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqvWf-0007Ab-9H
	for lists+qemu-devel@lfdr.de; Tue, 17 May 2022 07:38:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40156)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yangxiaojuan@loongson.cn>)
 id 1nqvPY-00041c-JP
 for qemu-devel@nongnu.org; Tue, 17 May 2022 07:30:48 -0400
Received: from mail.loongson.cn ([114.242.206.163]:51362 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <yangxiaojuan@loongson.cn>) id 1nqvPU-0001re-AR
 for qemu-devel@nongnu.org; Tue, 17 May 2022 07:30:44 -0400
Received: from localhost.localdomain (unknown [10.2.5.185])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9BxcNpPh4Ni4sEZAA--.25635S3; 
 Tue, 17 May 2022 19:30:31 +0800 (CST)
From: Xiaojuan Yang <yangxiaojuan@loongson.cn>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org, gaosong@loongson.cn,
 mark.cave-ayland@ilande.co.uk, mst@redhat.com, imammedo@redhat.com,
 ani@anisinha.ca
Subject: [PATCH v4 01/43] target/loongarch: Add README
Date: Tue, 17 May 2022 19:29:41 +0800
Message-Id: <20220517113023.3051143-2-yangxiaojuan@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220517113023.3051143-1-yangxiaojuan@loongson.cn>
References: <20220517113023.3051143-1-yangxiaojuan@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9BxcNpPh4Ni4sEZAA--.25635S3
X-Coremail-Antispam: 1UD129KBjvJXoW7Zw4xCw4fGw43ArW5Jr4UXFb_yoW8Xr1Upr
 4furyfKFWktrZrJrnag34rXFn5tr4fGF47XanFkr10krnxt34kZrnYq3ZrAFy7Z3WrJFW0
 q3s5Cr1UKa1UZaDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnUUvcSsGvfC2KfnxnUUI43ZEXa7xR_UUUUUUUUU==
X-CM-SenderInfo: p1dqw5xldry3tdq6z05rqj20fqof0/
Received-SPF: pass client-ip=114.242.206.163;
 envelope-from=yangxiaojuan@loongson.cn; helo=loongson.cn
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

From: Song Gao <gaosong@loongson.cn>

This patch gives an introduction to the LoongArch target.

Signed-off-by: Song Gao <gaosong@loongson.cn>
Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 MAINTAINERS             |  6 ++++++
 target/loongarch/README | 10 ++++++++++
 2 files changed, 16 insertions(+)
 create mode 100644 target/loongarch/README

diff --git a/MAINTAINERS b/MAINTAINERS
index dff0200f70..fc3c02f0e5 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -212,6 +212,12 @@ S: Maintained
 F: target/hppa/
 F: disas/hppa.c
 
+LoongArch TCG CPUs
+M: Song Gao <gaosong@loongson.cn>
+M: Xiaojuan Yang <yangxiaojuan@loongson.cn>
+S: Maintained
+F: target/loongarch/
+
 M68K TCG CPUs
 M: Laurent Vivier <laurent@vivier.eu>
 S: Maintained
diff --git a/target/loongarch/README b/target/loongarch/README
new file mode 100644
index 0000000000..de141c1a58
--- /dev/null
+++ b/target/loongarch/README
@@ -0,0 +1,10 @@
+- Introduction
+
+  LoongArch is the general processor architecture of Loongson.
+
+  The following versions of the LoongArch core are supported
+    core: 3A5000
+    https://github.com/loongson/LoongArch-Documentation/releases/download/2021.08.17/LoongArch-Vol1-v1.00-EN.pdf
+
+  We can get the latest loongarch documents at https://github.com/loongson/LoongArch-Documentation/tags.
+
-- 
2.31.1


