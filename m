Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9691730A6A7
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Feb 2021 12:36:10 +0100 (CET)
Received: from localhost ([::1]:37526 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6XV3-0003aJ-I6
	for lists+qemu-devel@lfdr.de; Mon, 01 Feb 2021 06:36:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47650)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l6XOk-0006oV-Ur
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 06:29:38 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:45011)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l6XOj-0008Sa-Cw
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 06:29:38 -0500
Received: by mail-wr1-x42f.google.com with SMTP id d16so16133396wro.11
 for <qemu-devel@nongnu.org>; Mon, 01 Feb 2021 03:29:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RGHdflD40CpleI2qTHXo49VNZ9h44Tapyh7dWA7hgYU=;
 b=FmjS7JgVOCypovovv65rLivJnwALFuw37uvTf4RtBSvcme+5wkDBdr5zU4iNwMntrn
 Hgt/tdJZflBiPWoHmBRxbG99i1qLXeOQhLcOcdLq9qXB0TmlTxseS1ch4a/PWI2VGyNc
 KhQhMpM8iJtQ5GJSdlxU9A9hqZKd4pN6UylDzcX8C0OlBu12yLaR09B56wzP2rPTQjLP
 vVOdaRCOy8DqkeRS6zSuluHJq/mKNmWcbYvw77lsOx940Rm9a7a3DW/Tcykdz5FQtilS
 Hw5P7oc0/+gBflEG2AzBjwZyrKln8W4hxuuwJMVvRwX92wB1tr9GJV1L07lkC5+RAABP
 ywOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=RGHdflD40CpleI2qTHXo49VNZ9h44Tapyh7dWA7hgYU=;
 b=iKhrWpbyaKMqch6h4Jp6KMjc1DGWMqrKX9FFCr0++pDj+wFUpmA4SLrrS5sN9H9I6U
 f11Kggo+35HwbPc8oCxfktrk11FBs/B1pDNuzJDqokPZCqJK+eF2pKCODkwTca3AWMZN
 BCQ3dbwsB4jSkMlDTUTaJMhCK50T2di2dsHDAkAR5TGjrJtQjkeimLTJ89YPqKV5BmN/
 aGDUBod52pGQ1GbPy8TGE+a9bJBGm4aSwW3aHTRO9NgtEPy65gPhugqibJsFkxUbHpep
 23G1lt/fuzADfD1uVgfHILmiNzbEi9X8GAtRF5AIoYXO1ELUC36UkPNOkPhO3eWhJM5y
 yUxg==
X-Gm-Message-State: AOAM5326cte/GgnTRxpyc/8NN7g+XSTTVkhK5xPaihkT9kTNu8hiv0yL
 kOVDRz80UGgo5UmYGlfrWC0=
X-Google-Smtp-Source: ABdhPJzvuBjmMW0UYZ6d5GxA8BEVDlhSDPc0KocqiT7XJMYbQPMV9DKL5NtfvrqJaptzIHmm77u+zg==
X-Received: by 2002:adf:d1cb:: with SMTP id b11mr17935101wrd.118.1612178976190; 
 Mon, 01 Feb 2021 03:29:36 -0800 (PST)
Received: from localhost.localdomain (7.red-83-57-171.dynamicip.rima-tde.net.
 [83.57.171.7])
 by smtp.gmail.com with ESMTPSA id d30sm28931639wrc.92.2021.02.01.03.29.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Feb 2021 03:29:35 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Subject: [PATCH v3 5/7] hw/xen: Make xen_shutdown_fatal_error() available out
 of X86 HVM
Date: Mon,  1 Feb 2021 12:29:03 +0100
Message-Id: <20210201112905.545144-6-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210201112905.545144-1-f4bug@amsat.org>
References: <20210201112905.545144-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Paul Durrant <paul@xen.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 xen-devel@lists.xenproject.org, Anthony Perard <anthony.perard@citrix.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

xen_shutdown_fatal_error() is also used by XEN_PV.

This fixes when XEN_PV without XEN_FV:

  /usr/bin/ld: libqemu-x86_64-softmmu.fa.p/hw_xen_xen_pt_config_init.c.o: in function `xen_pt_status_reg_init':
  hw/xen/xen_pt_config_init.c:281: undefined reference to `xen_shutdown_fatal_error'
  /usr/bin/ld: hw/xen/xen_pt_config_init.c:275: undefined reference to `xen_shutdown_fatal_error'
  /usr/bin/ld: libqemu-x86_64-softmmu.fa.p/hw_xen_xen_pt.c.o: in function `xen_pt_pci_read_config':
  hw/xen/xen_pt.c:220: undefined reference to `xen_shutdown_fatal_error'
  /usr/bin/ld: libqemu-x86_64-softmmu.fa.p/hw_xen_xen_pt.c.o: in function `xen_pt_pci_write_config':
  hw/xen/xen_pt.c:369: undefined reference to `xen_shutdown_fatal_error'

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/i386/xen/xen-hvm.c | 13 -------------
 hw/xen/xen-utils.c    | 25 +++++++++++++++++++++++++
 hw/xen/meson.build    |  1 +
 3 files changed, 26 insertions(+), 13 deletions(-)
 create mode 100644 hw/xen/xen-utils.c

diff --git a/hw/i386/xen/xen-hvm.c b/hw/i386/xen/xen-hvm.c
index 7156ab13329..69196754a30 100644
--- a/hw/i386/xen/xen-hvm.c
+++ b/hw/i386/xen/xen-hvm.c
@@ -28,7 +28,6 @@
 #include "qemu/error-report.h"
 #include "qemu/main-loop.h"
 #include "qemu/range.h"
-#include "sysemu/runstate.h"
 #include "sysemu/sysemu.h"
 #include "sysemu/xen.h"
 #include "trace.h"
@@ -1570,18 +1569,6 @@ void xen_register_framebuffer(MemoryRegion *mr)
     framebuffer = mr;
 }
 
-void xen_shutdown_fatal_error(const char *fmt, ...)
-{
-    va_list ap;
-
-    va_start(ap, fmt);
-    vfprintf(stderr, fmt, ap);
-    va_end(ap);
-    fprintf(stderr, "Will destroy the domain.\n");
-    /* destroy the domain */
-    qemu_system_shutdown_request(SHUTDOWN_CAUSE_HOST_ERROR);
-}
-
 void xen_hvm_modified_memory(ram_addr_t start, ram_addr_t length)
 {
     if (unlikely(xen_in_migration)) {
diff --git a/hw/xen/xen-utils.c b/hw/xen/xen-utils.c
new file mode 100644
index 00000000000..d6003782420
--- /dev/null
+++ b/hw/xen/xen-utils.c
@@ -0,0 +1,25 @@
+/*
+ * Copyright (C) 2010       Citrix Ltd.
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2.  See
+ * the COPYING file in the top-level directory.
+ *
+ * Contributions after 2012-01-13 are licensed under the terms of the
+ * GNU GPL, version 2 or (at your option) any later version.
+ */
+
+#include "qemu/osdep.h"
+#include "sysemu/runstate.h"
+#include "hw/xen/xen_common.h"
+
+void xen_shutdown_fatal_error(const char *fmt, ...)
+{
+    va_list ap;
+
+    va_start(ap, fmt);
+    vfprintf(stderr, fmt, ap);
+    va_end(ap);
+    fprintf(stderr, "Will destroy the domain.\n");
+    /* destroy the domain */
+    qemu_system_shutdown_request(SHUTDOWN_CAUSE_HOST_ERROR);
+}
diff --git a/hw/xen/meson.build b/hw/xen/meson.build
index 3c2062b9b3e..6c836ae06e4 100644
--- a/hw/xen/meson.build
+++ b/hw/xen/meson.build
@@ -4,6 +4,7 @@
   'xen-bus.c',
   'xen_devconfig.c',
   'xen_pvdev.c',
+  'xen-utils.c',
 ))
 
 xen_specific_ss = ss.source_set()
-- 
2.26.2


