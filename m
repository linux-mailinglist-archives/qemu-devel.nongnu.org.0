Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B6AE43F9549
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Aug 2021 09:42:58 +0200 (CEST)
Received: from localhost ([::1]:60114 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJWVt-0001K3-Qs
	for lists+qemu-devel@lfdr.de; Fri, 27 Aug 2021 03:42:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53088)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1mJW4z-0000gG-35
 for qemu-devel@nongnu.org; Fri, 27 Aug 2021 03:15:09 -0400
Received: from mail.loongson.cn ([114.242.206.163]:59308 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1mJW4v-00033s-IV
 for qemu-devel@nongnu.org; Fri, 27 Aug 2021 03:15:08 -0400
Received: from kvm-dev1.localdomain (unknown [10.2.5.134])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9AxtOTvkChhno4AAA--.2304S3;
 Fri, 27 Aug 2021 15:14:56 +0800 (CST)
From: Song Gao <gaosong@loongson.cn>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 01/19] target/loongarch: Add README
Date: Fri, 27 Aug 2021 15:14:36 +0800
Message-Id: <1630048494-2143-2-git-send-email-gaosong@loongson.cn>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1630048494-2143-1-git-send-email-gaosong@loongson.cn>
References: <1630048494-2143-1-git-send-email-gaosong@loongson.cn>
X-CM-TRANSID: AQAAf9AxtOTvkChhno4AAA--.2304S3
X-Coremail-Antispam: 1UD129KBjvdXoW7GryUWF1rWw4ktF1fZFy7ZFb_yoWkGrc_GF
 WfZFWkGr48W3WUt39Ygr98Jw15GF48GF1Sk3Z3Xr4xCa4Ut3y7J3yqy3ZrZF1ayrZ7Wrsx
 Xay7Jr1DCr1a9jkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUIcSsGvfJ3UbIYCTnIWIevJa73UjIFyTuYvj4RJUUUUUUUU
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
Received-SPF: pass client-ip=114.242.206.163; envelope-from=gaosong@loongson.cn;
 helo=loongson.cn
X-Spam_score_int: 0
X-Spam_score: -0.0
X-Spam_bar: /
X-Spam_report: (-0.0 / 5.0 requ) SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org, thuth@redhat.com, chenhuacai@gmail.com,
 richard.henderson@linaro.org, f4bug@amsat.org, maobibo@loongson.cn,
 laurent@vivier.eu, yangxiaojuan@loongson.cn, alistair.francis@wdc.com,
 pbonzini@redhat.com, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch give an introduction to the LoongArch target.

Signed-off-by: Song Gao <gaosong@loongson.cn>
---
 MAINTAINERS             | 5 +++++
 target/loongarch/README | 5 +++++
 2 files changed, 10 insertions(+)
 create mode 100644 target/loongarch/README

diff --git a/MAINTAINERS b/MAINTAINERS
index dffcb65..396f970 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -210,6 +210,11 @@ F: disas/hppa.c
 F: hw/net/*i82596*
 F: include/hw/net/lasi_82596.h
 
+LoongArch TCG CPUS
+M: Song Gao <gaosong@loongson.cn>
+S: Maintained
+F: target/loongarch/
+
 M68K TCG CPUs
 M: Laurent Vivier <laurent@vivier.eu>
 S: Maintained
diff --git a/target/loongarch/README b/target/loongarch/README
new file mode 100644
index 0000000..fe7a36f
--- /dev/null
+++ b/target/loongarch/README
@@ -0,0 +1,5 @@
+LoongArch is the general processor architecture of Loongson.
+
+The following versions of the LoongArch core are supported
+    core: 3A5000
+    https://github.com/loongson/LoongArch-Documentation/releases/download/LoongArch-Vol1-v3/LoongArch-Vol1-v1.00-EN.pdf
-- 
1.8.3.1


