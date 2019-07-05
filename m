Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 769A16024F
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Jul 2019 10:39:29 +0200 (CEST)
Received: from localhost ([::1]:50554 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hjJke-00040d-Mq
	for lists+qemu-devel@lfdr.de; Fri, 05 Jul 2019 04:39:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56988)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <ysato@users.sourceforge.jp>) id 1hjJdj-0003ML-5A
 for qemu-devel@nongnu.org; Fri, 05 Jul 2019 04:32:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <ysato@users.sourceforge.jp>) id 1hjJdg-00063M-2i
 for qemu-devel@nongnu.org; Fri, 05 Jul 2019 04:32:19 -0400
Received: from mail03.asahi-net.or.jp ([202.224.55.15]:39718)
 by eggs.gnu.org with esmtp (Exim 4.71)
 (envelope-from <ysato@users.sourceforge.jp>) id 1hjJdf-0005sh-Md
 for qemu-devel@nongnu.org; Fri, 05 Jul 2019 04:32:15 -0400
Received: from h61-195-96-97.vps.ablenet.jp (h61-195-96-97.ablenetvps.ne.jp
 [61.195.96.97]) (Authenticated sender: PQ4Y-STU)
 by mail03.asahi-net.or.jp (Postfix) with ESMTPA id 0E9AF4DEAD;
 Fri,  5 Jul 2019 17:32:08 +0900 (JST)
Received: from yo-satoh-debian.localdomain (ZM005235.ppp.dion.ne.jp
 [222.8.5.235])
 by h61-195-96-97.vps.ablenet.jp (Postfix) with ESMTPSA id A0350240086;
 Fri,  5 Jul 2019 17:32:07 +0900 (JST)
From: Yoshinori Sato <ysato@users.sourceforge.jp>
To: qemu-devel@nongnu.org
Date: Fri,  5 Jul 2019 17:31:41 +0900
Message-Id: <20190705083141.106254-23-ysato@users.sourceforge.jp>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190705083141.106254-1-ysato@users.sourceforge.jp>
References: <20190705083141.106254-1-ysato@users.sourceforge.jp>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 202.224.55.15
Subject: [Qemu-devel] [PATCH v22 22/22] target/rx: remove unused functions.
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
Cc: peter.maydell@linaro.org, imammedo@redhat.com, richard.henderson@linaro.org,
 Yoshinori Sato <ysato@users.sourceforge.jp>, philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Yoshinori Sato <ysato@users.sourceforge.jp>
---
 target/rx/monitor.c     | 38 --------------------------------------
 target/rx/Makefile.objs |  1 -
 2 files changed, 39 deletions(-)
 delete mode 100644 target/rx/monitor.c

diff --git a/target/rx/monitor.c b/target/rx/monitor.c
deleted file mode 100644
index 5d7a1e58b5..0000000000
--- a/target/rx/monitor.c
+++ /dev/null
@@ -1,38 +0,0 @@
-/*
- * QEMU monitor
- *
- * Copyright (c) 2003-2004 Fabrice Bellard
- *
- * Permission is hereby granted, free of charge, to any person obtaining a copy
- * of this software and associated documentation files (the "Software"), to deal
- * in the Software without restriction, including without limitation the rights
- * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
- * copies of the Software, and to permit persons to whom the Software is
- * furnished to do so, subject to the following conditions:
- *
- * The above copyright notice and this permission notice shall be included in
- * all copies or substantial portions of the Software.
- *
- * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
- * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
- * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
- * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
- * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
- * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
- * THE SOFTWARE.
- */
-#include "qemu/osdep.h"
-#include "cpu.h"
-#include "monitor/monitor.h"
-#include "monitor/hmp-target.h"
-#include "hmp.h"
-
-void hmp_info_tlb(Monitor *mon, const QDict *qdict)
-{
-    CPUArchState *env = mon_get_cpu_env();
-
-    if (!env) {
-        monitor_printf(mon, "No CPU available\n");
-        return;
-    }
-}
diff --git a/target/rx/Makefile.objs b/target/rx/Makefile.objs
index aa6f2d2d6c..a0018d5bc5 100644
--- a/target/rx/Makefile.objs
+++ b/target/rx/Makefile.objs
@@ -1,5 +1,4 @@
 obj-y += translate.o op_helper.o helper.o cpu.o gdbstub.o disas.o
-obj-$(CONFIG_SOFTMMU) += monitor.o
 
 DECODETREE = $(SRC_PATH)/scripts/decodetree.py
 
-- 
2.11.0


