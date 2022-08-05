Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 29A2858A50F
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Aug 2022 05:37:38 +0200 (CEST)
Received: from localhost ([::1]:35708 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJo9Z-0004de-9Q
	for lists+qemu-devel@lfdr.de; Thu, 04 Aug 2022 23:37:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54724)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1oJo7c-0000Hq-Hl
 for qemu-devel@nongnu.org; Thu, 04 Aug 2022 23:35:36 -0400
Received: from mail.loongson.cn ([114.242.206.163]:49468 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1oJo7a-00029v-29
 for qemu-devel@nongnu.org; Thu, 04 Aug 2022 23:35:36 -0400
Received: from localhost.localdomain (unknown [10.2.5.185])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9AxSs37j+xiQD4HAA--.15649S6; 
 Fri, 05 Aug 2022 11:35:30 +0800 (CST)
From: Song Gao <gaosong@loongson.cn>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org, peter.maydell@linaro.org,
 gaosong@loongson.cn, f4bug@amsat.org, alex.bennee@linaro.org,
 yangxiaojuan@loongson.cn
Subject: [PATCH for-7.1 v2 4/5] target/loongarch: Update loongarch-fpu.xml
Date: Fri,  5 Aug 2022 11:35:22 +0800
Message-Id: <20220805033523.1416837-5-gaosong@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220805033523.1416837-1-gaosong@loongson.cn>
References: <20220805033523.1416837-1-gaosong@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9AxSs37j+xiQD4HAA--.15649S6
X-Coremail-Antispam: 1UD129KBjvJXoWxKrykXrWkGF4ftr4xtF13Arb_yoW3tr48pF
 Z5A3yDJF1Ig3s2yr47Z3sY9w1kAw1DC3WayF1fW340kay09rWxJwn5Ja45Z3yUCayrJryj
 grZFkw4xJw45JrDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
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

Rename loongarch-fpu64.xml to loongarch-fpu.xml and update loongarch-fpu.xml to match upstream GDB [1]

[1]:https://github.com/bminor/binutils-gdb/blob/master/gdb/features/loongarch/fpu.xml

Signed-off-by: Song Gao <gaosong@loongson.cn>
---
 configs/targets/loongarch64-softmmu.mak |  2 +-
 gdb-xml/loongarch-fpu.xml               | 50 ++++++++++++++++++++++
 gdb-xml/loongarch-fpu64.xml             | 57 -------------------------
 target/loongarch/gdbstub.c              |  2 +-
 4 files changed, 52 insertions(+), 59 deletions(-)
 create mode 100644 gdb-xml/loongarch-fpu.xml
 delete mode 100644 gdb-xml/loongarch-fpu64.xml

diff --git a/configs/targets/loongarch64-softmmu.mak b/configs/targets/loongarch64-softmmu.mak
index 483474ba93..9abc99056f 100644
--- a/configs/targets/loongarch64-softmmu.mak
+++ b/configs/targets/loongarch64-softmmu.mak
@@ -1,5 +1,5 @@
 TARGET_ARCH=loongarch64
 TARGET_BASE_ARCH=loongarch
 TARGET_SUPPORTS_MTTCG=y
-TARGET_XML_FILES= gdb-xml/loongarch-base64.xml gdb-xml/loongarch-fpu64.xml
+TARGET_XML_FILES= gdb-xml/loongarch-base64.xml gdb-xml/loongarch-fpu.xml
 TARGET_NEED_FDT=y
diff --git a/gdb-xml/loongarch-fpu.xml b/gdb-xml/loongarch-fpu.xml
new file mode 100644
index 0000000000..78e42cf5dd
--- /dev/null
+++ b/gdb-xml/loongarch-fpu.xml
@@ -0,0 +1,50 @@
+<?xml version="1.0"?>
+<!-- Copyright (C) 2021 Free Software Foundation, Inc.
+
+     Copying and distribution of this file, with or without modification,
+     are permitted in any medium without royalty provided the copyright
+     notice and this notice are preserved.  -->
+
+<!DOCTYPE feature SYSTEM "gdb-target.dtd">
+<feature name="org.gnu.gdb.loongarch.fpu">
+
+  <union id="fputype">
+    <field name="f" type="ieee_single"/>
+    <field name="d" type="ieee_double"/>
+  </union>
+
+  <reg name="f0" bitsize="64" type="fputype" group="float"/>
+  <reg name="f1" bitsize="64" type="fputype" group="float"/>
+  <reg name="f2" bitsize="64" type="fputype" group="float"/>
+  <reg name="f3" bitsize="64" type="fputype" group="float"/>
+  <reg name="f4" bitsize="64" type="fputype" group="float"/>
+  <reg name="f5" bitsize="64" type="fputype" group="float"/>
+  <reg name="f6" bitsize="64" type="fputype" group="float"/>
+  <reg name="f7" bitsize="64" type="fputype" group="float"/>
+  <reg name="f8" bitsize="64" type="fputype" group="float"/>
+  <reg name="f9" bitsize="64" type="fputype" group="float"/>
+  <reg name="f10" bitsize="64" type="fputype" group="float"/>
+  <reg name="f11" bitsize="64" type="fputype" group="float"/>
+  <reg name="f12" bitsize="64" type="fputype" group="float"/>
+  <reg name="f13" bitsize="64" type="fputype" group="float"/>
+  <reg name="f14" bitsize="64" type="fputype" group="float"/>
+  <reg name="f15" bitsize="64" type="fputype" group="float"/>
+  <reg name="f16" bitsize="64" type="fputype" group="float"/>
+  <reg name="f17" bitsize="64" type="fputype" group="float"/>
+  <reg name="f18" bitsize="64" type="fputype" group="float"/>
+  <reg name="f19" bitsize="64" type="fputype" group="float"/>
+  <reg name="f20" bitsize="64" type="fputype" group="float"/>
+  <reg name="f21" bitsize="64" type="fputype" group="float"/>
+  <reg name="f22" bitsize="64" type="fputype" group="float"/>
+  <reg name="f23" bitsize="64" type="fputype" group="float"/>
+  <reg name="f24" bitsize="64" type="fputype" group="float"/>
+  <reg name="f25" bitsize="64" type="fputype" group="float"/>
+  <reg name="f26" bitsize="64" type="fputype" group="float"/>
+  <reg name="f27" bitsize="64" type="fputype" group="float"/>
+  <reg name="f28" bitsize="64" type="fputype" group="float"/>
+  <reg name="f29" bitsize="64" type="fputype" group="float"/>
+  <reg name="f30" bitsize="64" type="fputype" group="float"/>
+  <reg name="f31" bitsize="64" type="fputype" group="float"/>
+  <reg name="fcc" bitsize="64" type="uint64" group="float"/>
+  <reg name="fcsr" bitsize="32" type="uint32" group="float"/>
+</feature>
diff --git a/gdb-xml/loongarch-fpu64.xml b/gdb-xml/loongarch-fpu64.xml
deleted file mode 100644
index e52cf89fbc..0000000000
--- a/gdb-xml/loongarch-fpu64.xml
+++ /dev/null
@@ -1,57 +0,0 @@
-<?xml version="1.0"?>
-<!-- Copyright (C) 2021 Free Software Foundation, Inc.
-
-     Copying and distribution of this file, with or without modification,
-     are permitted in any medium without royalty provided the copyright
-     notice and this notice are preserved.  -->
-
-<!DOCTYPE feature SYSTEM "gdb-target.dtd">
-<feature name="org.gnu.gdb.loongarch.fpu">
-
-  <union id="fpu64type">
-    <field name="f" type="ieee_single"/>
-    <field name="d" type="ieee_double"/>
-  </union>
-
-  <reg name="f0" bitsize="64" type="fpu64type" group="float"/>
-  <reg name="f1" bitsize="64" type="fpu64type" group="float"/>
-  <reg name="f2" bitsize="64" type="fpu64type" group="float"/>
-  <reg name="f3" bitsize="64" type="fpu64type" group="float"/>
-  <reg name="f4" bitsize="64" type="fpu64type" group="float"/>
-  <reg name="f5" bitsize="64" type="fpu64type" group="float"/>
-  <reg name="f6" bitsize="64" type="fpu64type" group="float"/>
-  <reg name="f7" bitsize="64" type="fpu64type" group="float"/>
-  <reg name="f8" bitsize="64" type="fpu64type" group="float"/>
-  <reg name="f9" bitsize="64" type="fpu64type" group="float"/>
-  <reg name="f10" bitsize="64" type="fpu64type" group="float"/>
-  <reg name="f11" bitsize="64" type="fpu64type" group="float"/>
-  <reg name="f12" bitsize="64" type="fpu64type" group="float"/>
-  <reg name="f13" bitsize="64" type="fpu64type" group="float"/>
-  <reg name="f14" bitsize="64" type="fpu64type" group="float"/>
-  <reg name="f15" bitsize="64" type="fpu64type" group="float"/>
-  <reg name="f16" bitsize="64" type="fpu64type" group="float"/>
-  <reg name="f17" bitsize="64" type="fpu64type" group="float"/>
-  <reg name="f18" bitsize="64" type="fpu64type" group="float"/>
-  <reg name="f19" bitsize="64" type="fpu64type" group="float"/>
-  <reg name="f20" bitsize="64" type="fpu64type" group="float"/>
-  <reg name="f21" bitsize="64" type="fpu64type" group="float"/>
-  <reg name="f22" bitsize="64" type="fpu64type" group="float"/>
-  <reg name="f23" bitsize="64" type="fpu64type" group="float"/>
-  <reg name="f24" bitsize="64" type="fpu64type" group="float"/>
-  <reg name="f25" bitsize="64" type="fpu64type" group="float"/>
-  <reg name="f26" bitsize="64" type="fpu64type" group="float"/>
-  <reg name="f27" bitsize="64" type="fpu64type" group="float"/>
-  <reg name="f28" bitsize="64" type="fpu64type" group="float"/>
-  <reg name="f29" bitsize="64" type="fpu64type" group="float"/>
-  <reg name="f30" bitsize="64" type="fpu64type" group="float"/>
-  <reg name="f31" bitsize="64" type="fpu64type" group="float"/>
-  <reg name="fcc0" bitsize="8" type="uint8" group="float"/>
-  <reg name="fcc1" bitsize="8" type="uint8" group="float"/>
-  <reg name="fcc2" bitsize="8" type="uint8" group="float"/>
-  <reg name="fcc3" bitsize="8" type="uint8" group="float"/>
-  <reg name="fcc4" bitsize="8" type="uint8" group="float"/>
-  <reg name="fcc5" bitsize="8" type="uint8" group="float"/>
-  <reg name="fcc6" bitsize="8" type="uint8" group="float"/>
-  <reg name="fcc7" bitsize="8" type="uint8" group="float"/>
-  <reg name="fcsr" bitsize="32" type="uint32" group="float"/>
-</feature>
diff --git a/target/loongarch/gdbstub.c b/target/loongarch/gdbstub.c
index 5feb43445f..d3a5e404b0 100644
--- a/target/loongarch/gdbstub.c
+++ b/target/loongarch/gdbstub.c
@@ -80,5 +80,5 @@ static int loongarch_gdb_set_fpu(CPULoongArchState *env,
 void loongarch_cpu_register_gdb_regs_for_features(CPUState *cs)
 {
     gdb_register_coprocessor(cs, loongarch_gdb_get_fpu, loongarch_gdb_set_fpu,
-                             41, "loongarch-fpu64.xml", 0);
+                             41, "loongarch-fpu.xml", 0);
 }
-- 
2.31.1


