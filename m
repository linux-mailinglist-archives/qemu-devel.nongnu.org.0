Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 656A430A6AA
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Feb 2021 12:37:00 +0100 (CET)
Received: from localhost ([::1]:39064 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6XVr-0004NH-Gl
	for lists+qemu-devel@lfdr.de; Mon, 01 Feb 2021 06:36:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47696)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l6XOq-000726-Ce
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 06:29:44 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:33153)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l6XOo-0008Ut-PE
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 06:29:44 -0500
Received: by mail-wr1-x429.google.com with SMTP id 7so16199621wrz.0
 for <qemu-devel@nongnu.org>; Mon, 01 Feb 2021 03:29:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XRtUPL4N+Vif4bfdhtAFgCO/ETkuGGWOvk7Qu3281fs=;
 b=otz4MVF8iuJeP0O61dnQoLLdWj7yRHoLIPiCQts39X7Iz45omjLW6B5RPKA0Ji8grr
 TaSCvFwiR5a4nyf8A49BwsSX6wD8hGldzi9ObmoQMYTN4EcsB6LLt+JE4crwXoA/Qwkd
 +v/aCY2PpUQZdG6YBQvHtLAhEhdzr6vGVZBvJFEd3QWL7lxOeg367jIC8KtdxkJkEIGa
 bxhcoJZxJVW9PcUVwMCed91ItAi23w2JLJqvnxc4jq/89yFFL+RirWl9fRoTqM/UfJIp
 olTqK+WR7XOw/vm5aC5mEmtouWIpsAPYBPUMZAEJgGJKcfDsc2qwHnZvE6Gp86q3FH26
 Ljzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=XRtUPL4N+Vif4bfdhtAFgCO/ETkuGGWOvk7Qu3281fs=;
 b=V/UoaykV4xaN6SY1ifyXH7HQMSIo6wXzzJJizgMEq3gsk5Z6nJ0zkcgHcvGqBhH/ME
 60mwtbCgpX5V8jLr28wrStaDGfxv6aRcfSQ7zb7FOWP0rdo+FpQGDwsAQcVLKDD7EVoz
 D6R6AgvrvHMx29hmyCrAuYlJqdmX5DlQ0iCCCyMNk+t5kyMNikLHaKDj64nsZp1ET0ZG
 aLh2258jOB5KyMeJP3M2F6n5SNmLraIIxLuSV4C97J5ZVnFE0pYVPJHfMA5j/L52CEbx
 Eq0ZCd1ZNurFh1Fj8vKjbZsIazz/qK8xdVnlccsAspE7YgieWwqDvqEpekhAfZXyNh36
 kNXQ==
X-Gm-Message-State: AOAM531S4zHe+raPpX1iBzskdjpcJ9PkrtYVWUFLW2JetH6UmCoZXrBK
 nLLN+1Y+ooeUiWfZ7dO5PXM=
X-Google-Smtp-Source: ABdhPJyOAdkL8yCg3T/QnJEGkqZccdLOHBM22xLPE323hR3HQAe/aPubKmDcduC4ijItMwsDSxlZ+w==
X-Received: by 2002:a5d:6b47:: with SMTP id x7mr16884630wrw.170.1612178981514; 
 Mon, 01 Feb 2021 03:29:41 -0800 (PST)
Received: from localhost.localdomain (7.red-83-57-171.dynamicip.rima-tde.net.
 [83.57.171.7])
 by smtp.gmail.com with ESMTPSA id o12sm26789769wrx.82.2021.02.01.03.29.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Feb 2021 03:29:40 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Subject: [PATCH v3 6/7] hw/xen: Make qmp_xen_set_global_dirty_log() available
 out of X86 HVM
Date: Mon,  1 Feb 2021 12:29:04 +0100
Message-Id: <20210201112905.545144-7-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210201112905.545144-1-f4bug@amsat.org>
References: <20210201112905.545144-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x429.google.com
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

qmp_xen_set_global_dirty_log() is also used by XEN_PV.

This fixes when XEN_PV without XEN_FV:

  /usr/bin/ld: libqemuutil.a(meson-generated_.._qapi_qapi-commands-migration.c.o): in function `qmp_marshal_xen_set_global_dirty_log':
  qapi/qapi-commands-migration.c:626: undefined reference to `qmp_xen_set_global_dirty_log'

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/i386/xen/xen-hvm.c  | 10 ----------
 hw/xen/xen-migration.c | 22 ++++++++++++++++++++++
 hw/xen/meson.build     |  1 +
 3 files changed, 23 insertions(+), 10 deletions(-)
 create mode 100644 hw/xen/xen-migration.c

diff --git a/hw/i386/xen/xen-hvm.c b/hw/i386/xen/xen-hvm.c
index 69196754a30..85859ea0ba3 100644
--- a/hw/i386/xen/xen-hvm.c
+++ b/hw/i386/xen/xen-hvm.c
@@ -24,7 +24,6 @@
 #include "hw/xen/xen-bus.h"
 #include "hw/xen/xen-x86.h"
 #include "qapi/error.h"
-#include "qapi/qapi-commands-migration.h"
 #include "qemu/error-report.h"
 #include "qemu/main-loop.h"
 #include "qemu/range.h"
@@ -1591,12 +1590,3 @@ void xen_hvm_modified_memory(ram_addr_t start, ram_addr_t length)
         }
     }
 }
-
-void qmp_xen_set_global_dirty_log(bool enable, Error **errp)
-{
-    if (enable) {
-        memory_global_dirty_log_start();
-    } else {
-        memory_global_dirty_log_stop();
-    }
-}
diff --git a/hw/xen/xen-migration.c b/hw/xen/xen-migration.c
new file mode 100644
index 00000000000..1c53f1af08d
--- /dev/null
+++ b/hw/xen/xen-migration.c
@@ -0,0 +1,22 @@
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
+#include "exec/memory.h"
+#include "qapi/qapi-commands-migration.h"
+
+void qmp_xen_set_global_dirty_log(bool enable, Error **errp)
+{
+    if (enable) {
+        memory_global_dirty_log_start();
+    } else {
+        memory_global_dirty_log_stop();
+    }
+}
diff --git a/hw/xen/meson.build b/hw/xen/meson.build
index 6c836ae06e4..21f94625dc7 100644
--- a/hw/xen/meson.build
+++ b/hw/xen/meson.build
@@ -4,6 +4,7 @@
   'xen-bus.c',
   'xen_devconfig.c',
   'xen_pvdev.c',
+  'xen-migration.c',
   'xen-utils.c',
 ))
 
-- 
2.26.2


