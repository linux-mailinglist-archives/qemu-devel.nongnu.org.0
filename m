Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B81073B5D95
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Jun 2021 14:07:22 +0200 (CEST)
Received: from localhost ([::1]:60592 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lxq2r-0004zH-PI
	for lists+qemu-devel@lfdr.de; Mon, 28 Jun 2021 08:07:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51130)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1lxq0Y-00027u-5y
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 08:04:58 -0400
Received: from mail.loongson.cn ([114.242.206.163]:45298 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1lxq0T-00014T-8X
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 08:04:57 -0400
Received: from kvm-dev1.localdomain (unknown [10.2.5.134])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxL0LdutlgOrYZAA--.8747S3;
 Mon, 28 Jun 2021 20:04:45 +0800 (CST)
From: Song Gao <gaosong@loongson.cn>
To: qemu-devel@nongnu.org
Subject: [PATCH 01/20] target/loongarch: Add README
Date: Mon, 28 Jun 2021 20:04:26 +0800
Message-Id: <1624881885-31692-2-git-send-email-gaosong@loongson.cn>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1624881885-31692-1-git-send-email-gaosong@loongson.cn>
References: <1624881885-31692-1-git-send-email-gaosong@loongson.cn>
X-CM-TRANSID: AQAAf9DxL0LdutlgOrYZAA--.8747S3
X-Coremail-Antispam: 1UD129KBjvJXoW7WF15Cw17Cr4UWr18XFyDAwb_yoW8GF13pr
 4fuFyfKr48GrZrJrn3Way3XFn8Xr4fGr47Wa129ry8CrsxJw1qvFn5twnFyFy7Zw1rKrW0
 vryrCr1jgF4Uua7anT9S1TB71UUUUjDqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
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
Cc: peter.maydell@linaro.org, thuth@redhat.com, richard.henderson@linaro.org,
 laurent@vivier.eu, maobibo@loongson.cn, alistair.francis@wdc.com,
 pbonzini@redhat.com, philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch give an introduction to the LoongArch target.

Signed-off-by: Song Gao <gaosong@loongson.cn>
---
 MAINTAINERS             |  5 +++++
 target/loongarch/README | 16 ++++++++++++++++
 2 files changed, 21 insertions(+)
 create mode 100644 target/loongarch/README

diff --git a/MAINTAINERS b/MAINTAINERS
index 3ff56f5..f207805 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -209,6 +209,11 @@ F: disas/hppa.c
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
index 0000000..0addfc7
--- /dev/null
+++ b/target/loongarch/README
@@ -0,0 +1,16 @@
+LoongArch is the general processor architecture of Loongson.
+
+The following versions of the LoongArch core are supported
+    core: 3A5000
+    https://github.com/loongson/LoongArch-Documentation/releases/download/LoongArch-Vol1-v3/LoongArch-Vol1-v1.00-EN.pdf
+
+There are several code directories
+
+    1 qemu/target/loongarch
+        This is the instruction emulation directory
+    2 qemu/linux-user/loongarch64
+        Linux-user simulation
+    3 qemu/hw/loongarch
+        System simulation
+    4 qemu/tests/tcg/loongarch
+        Linux-user test
-- 
1.8.3.1


