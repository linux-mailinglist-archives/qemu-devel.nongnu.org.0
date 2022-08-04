Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D43C589C70
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Aug 2022 15:17:40 +0200 (CEST)
Received: from localhost ([::1]:51872 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJajL-0001x2-4Q
	for lists+qemu-devel@lfdr.de; Thu, 04 Aug 2022 09:17:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44960)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1oJaUl-00009W-3F
 for qemu-devel@nongnu.org; Thu, 04 Aug 2022 09:02:35 -0400
Received: from mail.loongson.cn ([114.242.206.163]:52818 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1oJaUf-0008Al-Ot
 for qemu-devel@nongnu.org; Thu, 04 Aug 2022 09:02:34 -0400
Received: from localhost.localdomain (unknown [10.2.5.185])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9Axis1Vw+tiTugFAA--.19495S5; 
 Thu, 04 Aug 2022 21:02:14 +0800 (CST)
From: Song Gao <gaosong@loongson.cn>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org, peter.maydell@linaro.org,
 gaosong@loongson.cn, f4bug@amsat.org, alex.bennee@linaro.org,
 yangxiaojuan@loongson.cn
Subject: [PATCH for-7.1 3/5] target/loongarch: update loongarch-base64.xml
Date: Thu,  4 Aug 2022 21:02:11 +0800
Message-Id: <20220804130213.1364164-4-gaosong@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220804130213.1364164-1-gaosong@loongson.cn>
References: <20220804130213.1364164-1-gaosong@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9Axis1Vw+tiTugFAA--.19495S5
X-Coremail-Antispam: 1UD129KBjvJXoWxZr1xKF4kZr47Kw4xur18uFg_yoW5GrWUpF
 9Y9a4DCrs2g3y0yrWUZ3yj9Fn5Jw4DCFWFyF1rX34xC3y0qrWDGrs5J39xZr47Ga1fXrWj
 qFsaka1rGFsxKrJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
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

Update loongarch-base64.xml to match the upstream GDB [1].

[1]:https://github.com/bminor/binutils-gdb/blob/master/gdb/features/loongarch/base64.xml

Signed-off-by: Song Gao <gaosong@loongson.cn>
---
 gdb-xml/loongarch-base64.xml | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/gdb-xml/loongarch-base64.xml b/gdb-xml/loongarch-base64.xml
index a1dd4f2208..2d8a1f6b73 100644
--- a/gdb-xml/loongarch-base64.xml
+++ b/gdb-xml/loongarch-base64.xml
@@ -1,5 +1,5 @@
 <?xml version="1.0"?>
-<!-- Copyright (C) 2021 Free Software Foundation, Inc.
+<!-- Copyright (C) 2022 Free Software Foundation, Inc.
 
      Copying and distribution of this file, with or without modification,
      are permitted in any medium without royalty provided the copyright
@@ -8,9 +8,9 @@
 <!DOCTYPE feature SYSTEM "gdb-target.dtd">
 <feature name="org.gnu.gdb.loongarch.base">
   <reg name="r0" bitsize="64" type="uint64" group="general"/>
-  <reg name="r1" bitsize="64" type="uint64" group="general"/>
-  <reg name="r2" bitsize="64" type="uint64" group="general"/>
-  <reg name="r3" bitsize="64" type="uint64" group="general"/>
+  <reg name="r1" bitsize="64" type="code_ptr" group="general"/>
+  <reg name="r2" bitsize="64" type="data_ptr" group="general"/>
+  <reg name="r3" bitsize="64" type="data_ptr" group="general"/>
   <reg name="r4" bitsize="64" type="uint64" group="general"/>
   <reg name="r5" bitsize="64" type="uint64" group="general"/>
   <reg name="r6" bitsize="64" type="uint64" group="general"/>
@@ -29,7 +29,7 @@
   <reg name="r19" bitsize="64" type="uint64" group="general"/>
   <reg name="r20" bitsize="64" type="uint64" group="general"/>
   <reg name="r21" bitsize="64" type="uint64" group="general"/>
-  <reg name="r22" bitsize="64" type="uint64" group="general"/>
+  <reg name="r22" bitsize="64" type="data_ptr" group="general"/>
   <reg name="r23" bitsize="64" type="uint64" group="general"/>
   <reg name="r24" bitsize="64" type="uint64" group="general"/>
   <reg name="r25" bitsize="64" type="uint64" group="general"/>
@@ -41,5 +41,5 @@
   <reg name="r31" bitsize="64" type="uint64" group="general"/>
   <reg name="orig_a0" bitsize="64" type="uint64" group="general"/>
   <reg name="pc" bitsize="64" type="code_ptr" group="general"/>
-  <reg name="badvaddr" bitsize="64" type="code_ptr" group="general"/>
+  <reg name="badv" bitsize="64" type="code_ptr" group="general"/>
 </feature>
-- 
2.31.1


