Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6971F4D4794
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Mar 2022 14:02:26 +0100 (CET)
Received: from localhost ([::1]:59254 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSIQz-00027Q-GD
	for lists+qemu-devel@lfdr.de; Thu, 10 Mar 2022 08:02:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57336)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nSHNq-0007IP-UW
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 06:55:06 -0500
Received: from [2a00:1450:4864:20::32f] (port=37506
 helo=mail-wm1-x32f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nSHNp-0003xN-DZ
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 06:55:06 -0500
Received: by mail-wm1-x32f.google.com with SMTP id
 q7-20020a7bce87000000b00382255f4ca9so5282533wmj.2
 for <qemu-devel@nongnu.org>; Thu, 10 Mar 2022 03:55:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=z+VRN1sFvtTMS9CAG9ReHaJC/19bI1hhn4s9TiCXO4E=;
 b=nxpNCqWhmvSKNgBOGWcQ60iLL1Zq686bTTOfDYzUke/vp2CtRbGuoObRJnpuQg4anM
 xaytDUdaQTt8+wo9Ly9IffgjnHLoCoLtC06wikFJoN8Xkj/wN97socmmsb5jVDMSGVro
 sS7PoTPlDf3oeO8cz35Y21LGxw11jqwnr7xv40fo37U3QQd9v+4aFFEp8Xqu+gdlQCgA
 vi7WD/JakEr8HBTESOn1Ensg4FRgKNyzhxFzRhywHgltW7RblV9fTbeV6fdvjKI/6XCM
 D/Vk7pMKfTuHtpf9dP9lspaaZ/FSxGZIqxAwVtyrtDrORUu/6vqddTDFroEX6c2uqaZh
 6wmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=z+VRN1sFvtTMS9CAG9ReHaJC/19bI1hhn4s9TiCXO4E=;
 b=CsxVX4pCopaVkBdFzrMzOCYY1C+/n983hLEv8RVf3QehvLYe9Y85V9VmGHqdVhttBI
 4C3MQrDvKKXuE5kOaXr8ZIRnDTJnSCQgBqWj2NENyORqRh2QpDwI0si215CzsQry7blT
 r4IREmdc/3z1SP6PQkdj/vibj40bN8aje6FkIblguEoNAOsdW/E3nVPxvFZ2PlAXe1qt
 LBvYku1UlKa+420GC5xSufj049OHa5teDgaqj88gESTpzXrB7zU7FFuH5bGCsB32l6MJ
 fugbDtXybDMC5QUm9wpY0URASgMxiCrVEaZUmCKrsk3ZdeUJFuIfa5qauOynF3AiGwdt
 Jgcg==
X-Gm-Message-State: AOAM531fkaNucSoCsGHIYodAHVa/zr5Gq04Tt7kuM6elqy0+7ZrrWeoK
 4f+GcA2CDLuNNfLArJ145CtrS75gbdU=
X-Google-Smtp-Source: ABdhPJwCpkdpYX53GzIEOofiTlSYb/95AU5iQy/qXwssDP3wO0zBsElIsZk3lwwoaYYEsdEm60PD1w==
X-Received: by 2002:a7b:c455:0:b0:380:a646:eb0e with SMTP id
 l21-20020a7bc455000000b00380a646eb0emr11454442wmi.170.1646913303878; 
 Thu, 10 Mar 2022 03:55:03 -0800 (PST)
Received: from localhost.localdomain (71.red-83-50-68.dynamicip.rima-tde.net.
 [83.50.68.71]) by smtp.gmail.com with ESMTPSA id
 t14-20020a5d49ce000000b001f036a29f42sm3861815wrs.116.2022.03.10.03.55.03
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 10 Mar 2022 03:55:03 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH-for-7.0] softmmu: List CPU types again
Date: Thu, 10 Mar 2022 12:55:02 +0100
Message-Id: <20220310115502.3311-1-philippe.mathieu.daude@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32f
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32f.google.com
X-Spam_score_int: 23
X-Spam_score: 2.3
X-Spam_bar: ++
X-Spam_report: (2.3 / 5.0 requ) AC_FROM_MANY_DOTS=2.996, BAYES_00=-1.9,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Max Filippov <jcmvbkbc@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

Commit e0220bb5b2 made cpus.c target-agnostic but didn't notice
the cpu_list() function is only defined in target-specific code
in "cpu.h". Extract list_cpus() from the generic cpus.c into a
new target-specific unit.

Fixes: e0220bb5b2 ("softmmu: Build target-agnostic objects once")
Reported-by: Max Filippov <jcmvbkbc@gmail.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 softmmu/cpus.c      |  8 --------
 softmmu/cpus_list.c | 36 ++++++++++++++++++++++++++++++++++++
 softmmu/meson.build |  1 +
 3 files changed, 37 insertions(+), 8 deletions(-)
 create mode 100644 softmmu/cpus_list.c

diff --git a/softmmu/cpus.c b/softmmu/cpus.c
index e1d84c8ccb..7b75bb66d5 100644
--- a/softmmu/cpus.c
+++ b/softmmu/cpus.c
@@ -728,14 +728,6 @@ int vm_stop_force_state(RunState state)
     }
 }
 
-void list_cpus(const char *optarg)
-{
-    /* XXX: implement xxx_cpu_list for targets that still miss it */
-#if defined(cpu_list)
-    cpu_list();
-#endif
-}
-
 void qmp_memsave(int64_t addr, int64_t size, const char *filename,
                  bool has_cpu, int64_t cpu_index, Error **errp)
 {
diff --git a/softmmu/cpus_list.c b/softmmu/cpus_list.c
new file mode 100644
index 0000000000..59ef604423
--- /dev/null
+++ b/softmmu/cpus_list.c
@@ -0,0 +1,36 @@
+/*
+ * QEMU per target CPU list
+ *
+ * Copyright (c) 2003-2008 Fabrice Bellard
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a copy
+ * of this software and associated documentation files (the "Software"), to deal
+ * in the Software without restriction, including without limitation the rights
+ * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
+ * copies of the Software, and to permit persons to whom the Software is
+ * furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
+ * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
+ * THE SOFTWARE.
+ */
+
+#include "qemu/osdep.h"
+#include "sysemu/cpus.h"
+#include "cpu.h"
+
+void list_cpus(const char *optarg)
+{
+    /* XXX: implement xxx_cpu_list for targets that still miss it */
+#if defined(cpu_list)
+    cpu_list();
+#endif
+}
+
diff --git a/softmmu/meson.build b/softmmu/meson.build
index 8138248661..1df0ad286a 100644
--- a/softmmu/meson.build
+++ b/softmmu/meson.build
@@ -1,5 +1,6 @@
 specific_ss.add(when: 'CONFIG_SOFTMMU', if_true: [files(
   'arch_init.c',
+  'cpus_list.c',
   'ioport.c',
   'memory.c',
   'physmem.c',
-- 
2.34.1


