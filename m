Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 14871382B72
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 13:48:08 +0200 (CEST)
Received: from localhost ([::1]:59836 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1libjD-0001Wu-4q
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 07:48:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33776)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1libAM-00055O-C9
 for qemu-devel@nongnu.org; Mon, 17 May 2021 07:12:06 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:41565)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1libAI-0000k6-QB
 for qemu-devel@nongnu.org; Mon, 17 May 2021 07:12:06 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 o6-20020a05600c4fc6b029015ec06d5269so3372444wmq.0
 for <qemu-devel@nongnu.org>; Mon, 17 May 2021 04:12:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=21MwD1xvRVhA8I16eM1nxg+vXsRbeWwb/Kbif9L3QsM=;
 b=vGiP9QaoS3wdF7FHK6pPeKt6izqO1z8+Pcci5542gknK0pjX3PERdcL9HBDahB1qFr
 cICfiuRnwJVjO6XTc7I+5sRkv+BRl3tYO8Ijumg0mz3o1kgFqQDzMidHO19stOnDDp06
 MBgFA0sje6BBb1ERHs01ku2/JqIwGHPxnEc5husjL+W4BkffRg/wL9qA1AkkJmHzg1b8
 GuuU0h4gK+2iGR8J++gS9XbvN4p1UrMm4tq2StQeIYH/RswiL/IwZj3cLvIRVOf0ilGj
 ceQOXkmPmNo/LvX61d+5awrXm1+Vlc5Du51tRJA6bPF3ogrvXr0sNYxzQa+e36DZ050E
 RwxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=21MwD1xvRVhA8I16eM1nxg+vXsRbeWwb/Kbif9L3QsM=;
 b=rmvPvhdvFM44tcArT3PBeXF0YidC5M88SVFxEN+opfdSc3GzRFpKUjEUR9XmcYfJkX
 HaDhXqQhIAvt19yph3aXCwO5F3g3llPJR+SBrStKfNUfCdZdyp1J9Y5CorEtdgVUsyhn
 M8XuVs6wHA/vYN7lKtDTf7xxUfOsDYX/kC8cCFkbOcCUTy99XJlUAUt93g7cuAPx8C9+
 5YnYm94E8WPCrh+Iyb8ZLJmxRkXVCQDsJKSRQXMLw0PUk5FEVG7NuebB5t3qcQiYuqsY
 evTKqjbzwoqhSciQ2Qvo+HEoE1Wzu3mWhq95NHmk2REQ8PaRZs6oucYvloRCG8Q5GqEa
 N/rQ==
X-Gm-Message-State: AOAM532uQPzE5t2x3H3lEwTFuEaX0coQNcOR7QYdzD1Y7h7ynDiKJmah
 /QkTL7yxvT7vHQI6WE83QoSY8BVDACxGig==
X-Google-Smtp-Source: ABdhPJzKRoWRCs6oszN1DCNCHFx34Mc9kIJToD+X3rBQ94jP+QQ/MJJm47E7DIn1nsrD4z8quQct7Q==
X-Received: by 2002:a7b:c056:: with SMTP id u22mr22676141wmc.181.1621249921208; 
 Mon, 17 May 2021 04:12:01 -0700 (PDT)
Received: from localhost.localdomain (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id e10sm17265551wrw.20.2021.05.17.04.11.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 May 2021 04:12:00 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 10/11] exec: Restrict ramblock.h to sysemu/
Date: Mon, 17 May 2021 13:11:10 +0200
Message-Id: <20210517111111.1068153-11-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210517111111.1068153-1-f4bug@amsat.org>
References: <20210517111111.1068153-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Claudio Fontana <cfontana@suse.de>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

To make it clearer the ramblock.h header is sysemu specific,
move it to the sysemu/ directory.

Patch created mechanically using:

  $ sed -i s,exec/ramblock.h,sysemu/ramblock.h, $(git grep -l exec/ramblock.h)

Then the #ifdef'ry conditional on CONFIG_USER_ONLY has
been replaced by an #error.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/sysemu/ram_addr.h           |  2 +-
 include/{exec => sysemu}/ramblock.h | 13 ++++++++-----
 migration/dirtyrate.c               |  2 +-
 migration/multifd.c                 |  2 +-
 migration/postcopy-ram.c            |  2 +-
 tests/qtest/fuzz/generic_fuzz.c     |  2 +-
 MAINTAINERS                         |  2 +-
 7 files changed, 14 insertions(+), 11 deletions(-)
 rename include/{exec => sysemu}/ramblock.h (92%)

diff --git a/include/sysemu/ram_addr.h b/include/sysemu/ram_addr.h
index d495c969f9f..aea30dfeb4e 100644
--- a/include/sysemu/ram_addr.h
+++ b/include/sysemu/ram_addr.h
@@ -27,7 +27,7 @@
 #include "sysemu/xen.h"
 #include "sysemu/tcg.h"
 #include "exec/ramlist.h"
-#include "exec/ramblock.h"
+#include "sysemu/ramblock.h"
 
 /**
  * clear_bmap_size: calculate clear bitmap size
diff --git a/include/exec/ramblock.h b/include/sysemu/ramblock.h
similarity index 92%
rename from include/exec/ramblock.h
rename to include/sysemu/ramblock.h
index 664701b7594..12a1b90a19b 100644
--- a/include/exec/ramblock.h
+++ b/include/sysemu/ramblock.h
@@ -16,11 +16,14 @@
  * The functions declared here will be removed soon.
  */
 
-#ifndef QEMU_EXEC_RAMBLOCK_H
-#define QEMU_EXEC_RAMBLOCK_H
+#ifndef QEMU_SYSEMU_RAMBLOCK_H
+#define QEMU_SYSEMU_RAMBLOCK_H
 
-#ifndef CONFIG_USER_ONLY
-#include "cpu-common.h"
+#ifdef CONFIG_USER_ONLY
+#error Cannot include sysemu specific header from user emulation
+#endif
+
+#include "exec/cpu-common.h"
 
 struct RAMBlock {
     struct rcu_head rcu;
@@ -70,5 +73,5 @@ struct RAMBlock {
      */
     ram_addr_t postcopy_length;
 };
-#endif
+
 #endif
diff --git a/migration/dirtyrate.c b/migration/dirtyrate.c
index ccb98147e89..5422b39784f 100644
--- a/migration/dirtyrate.c
+++ b/migration/dirtyrate.c
@@ -14,7 +14,7 @@
 #include <zlib.h>
 #include "qapi/error.h"
 #include "cpu.h"
-#include "exec/ramblock.h"
+#include "sysemu/ramblock.h"
 #include "qemu/rcu_queue.h"
 #include "qapi/qapi-commands-migration.h"
 #include "ram.h"
diff --git a/migration/multifd.c b/migration/multifd.c
index 0a4803cfccb..519f8dd4393 100644
--- a/migration/multifd.c
+++ b/migration/multifd.c
@@ -14,7 +14,7 @@
 #include "qemu/rcu.h"
 #include "exec/target_page.h"
 #include "sysemu/sysemu.h"
-#include "exec/ramblock.h"
+#include "sysemu/ramblock.h"
 #include "qemu/error-report.h"
 #include "qapi/error.h"
 #include "ram.h"
diff --git a/migration/postcopy-ram.c b/migration/postcopy-ram.c
index 2e9697bdd2e..fb8c625ffc3 100644
--- a/migration/postcopy-ram.c
+++ b/migration/postcopy-ram.c
@@ -31,7 +31,7 @@
 #include "qemu/error-report.h"
 #include "trace.h"
 #include "hw/boards.h"
-#include "exec/ramblock.h"
+#include "sysemu/ramblock.h"
 
 /* Arbitrary limit on size of each discard command,
  * keeps them around ~200 bytes
diff --git a/tests/qtest/fuzz/generic_fuzz.c b/tests/qtest/fuzz/generic_fuzz.c
index 05f9c9b06f9..613427f1a57 100644
--- a/tests/qtest/fuzz/generic_fuzz.c
+++ b/tests/qtest/fuzz/generic_fuzz.c
@@ -21,7 +21,7 @@
 #include "fork_fuzz.h"
 #include "string.h"
 #include "exec/sysemu/memory.h"
-#include "exec/ramblock.h"
+#include "sysemu/ramblock.h"
 #include "hw/qdev-core.h"
 #include "hw/pci/pci.h"
 #include "hw/boards.h"
diff --git a/MAINTAINERS b/MAINTAINERS
index 8caf3891dba..cea4f2e438a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2402,7 +2402,7 @@ F: include/sysemu/ioport.h
 F: include/exec/memop.h
 F: include/exec/sysemu/memory.h
 F: include/sysemu/ram_addr.h
-F: include/exec/ramblock.h
+F: include/sysemu/ramblock.h
 F: softmmu/dma-helpers.c
 F: softmmu/ioport.c
 F: softmmu/memory.c
-- 
2.26.3


