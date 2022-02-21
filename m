Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 65E674BD8C6
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Feb 2022 10:58:02 +0100 (CET)
Received: from localhost ([::1]:60908 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nM5SD-0008WH-H1
	for lists+qemu-devel@lfdr.de; Mon, 21 Feb 2022 04:58:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44058)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nM4zf-00006X-Fl
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 04:28:31 -0500
Received: from [2a00:1450:4864:20::42b] (port=36533
 helo=mail-wr1-x42b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nM4zZ-000139-5s
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 04:28:31 -0500
Received: by mail-wr1-x42b.google.com with SMTP id o24so25919430wro.3
 for <qemu-devel@nongnu.org>; Mon, 21 Feb 2022 01:28:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=fmYyVBia74m6vtBMKDMDPPY8ORAeWnoGyOrzfR/JNX4=;
 b=D4/l/gBOik5biplI74uCXbWVQXlVbuu5gZVgdz/ejetxES3MyOysupgexJNWdzLzYb
 rvpIkBxkMUrMAnM48dJs0+YSxVJjlsDSHf7X7xA5taWWtXUDjRk0sPyhtPdqcRR9kXzU
 Qqt0WQBgPYiL4SjOQplfTZ7YSKfClPRPHT/Cf4ecxuTI2UJ2iJYNJ7HBhiNKDYv8g6YB
 oK4G8qbeTO5y5HgT5KrkMlv3RssIlV8WC78d1lu02WxfFYwDeWeIbkaGW1oZJUvEpfg1
 oh4+ua+vCVOKPeCnojlxWjMzyqmDOSTFunOLz3HGw96BO0sySwLzDSsOALrq+x1fUaI/
 WiTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fmYyVBia74m6vtBMKDMDPPY8ORAeWnoGyOrzfR/JNX4=;
 b=JWdZX43VnnGETcC6y4J/j41PnZykCz4HmIK2Lwjvgt7gsNqiL4j15QjZPne0YES+XN
 CUcQgxmCC5e4OqEjwgAPN2SRqDdXCob1me1PRtoJpduRG0q/WSPYFk6BB+B5tDcCNOti
 j4K4dZgs7kJjyQyHvHnnvBR+BuumMby/MURAqlG/xXWo1HLSonVWJxXtExa+SxsAJegB
 wldWXSZr8hOr38xEa/yedwCsLhSZZ3kUpT2beZv9+9MtQ9q8Q5vfN0iWXwH8IcpUm7xK
 JscKV1oMlRYtQFN7GbBBhrn9k8er1gpwtMUy4o6Hh3+ES0iGlV1NhdxC62Aj7ENY+xGX
 dQdw==
X-Gm-Message-State: AOAM532sBcPKLrRjZ1c+XR6tuuTtlhw0DTMeEHH4hOi6afymS4/x78GA
 36uW9nQFVgG8PrrjmR9ThRb5drfo9HAMjw==
X-Google-Smtp-Source: ABdhPJyqjb9Zhvs1/r7XQTTaUWzvweg/22IdzPeIW6VTRblzp+NW5wXRUfNRZhIwx8ph+TM2Arodpg==
X-Received: by 2002:adf:ce8f:0:b0:1e4:bcd3:3aa6 with SMTP id
 r15-20020adfce8f000000b001e4bcd33aa6mr14460115wrn.561.1645435697835; 
 Mon, 21 Feb 2022 01:28:17 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id q76sm7555778wme.1.2022.02.21.01.28.17
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Feb 2022 01:28:17 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 19/26] include: Move qemu_[id]cache_* declarations to new
 qemu/cacheinfo.h
Date: Mon, 21 Feb 2022 09:27:53 +0000
Message-Id: <20220221092800.404870-20-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220221092800.404870-1-peter.maydell@linaro.org>
References: <20220221092800.404870-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42b
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The qemu_icache_linesize, qemu_icache_linesize_log,
qemu_dcache_linesize, and qemu_dcache_linesize_log variables are not
used in many files.  Move them out of osdep.h to a new
qemu/cacheinfo.h, and document them.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220208200856.3558249-5-peter.maydell@linaro.org
---
 include/qemu/cacheinfo.h  | 21 +++++++++++++++++++++
 include/qemu/osdep.h      |  5 -----
 accel/tcg/translate-all.c |  1 +
 plugins/loader.c          |  1 +
 tcg/region.c              |  1 +
 tcg/tcg.c                 |  1 +
 util/atomic64.c           |  1 +
 util/cacheflush.c         |  1 +
 util/cacheinfo.c          |  1 +
 9 files changed, 28 insertions(+), 5 deletions(-)
 create mode 100644 include/qemu/cacheinfo.h

diff --git a/include/qemu/cacheinfo.h b/include/qemu/cacheinfo.h
new file mode 100644
index 00000000000..019a157ea08
--- /dev/null
+++ b/include/qemu/cacheinfo.h
@@ -0,0 +1,21 @@
+/*
+ * QEMU host cacheinfo information
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+#ifndef QEMU_CACHEINFO_H
+#define QEMU_CACHEINFO_H
+
+/*
+ * These variables represent our best guess at the host icache and
+ * dcache sizes, expressed both as the size in bytes and as the
+ * base-2 log of the size in bytes. They are initialized at startup
+ * (via an attribute 'constructor' function).
+ */
+extern int qemu_icache_linesize;
+extern int qemu_icache_linesize_log;
+extern int qemu_dcache_linesize;
+extern int qemu_dcache_linesize_log;
+
+#endif
diff --git a/include/qemu/osdep.h b/include/qemu/osdep.h
index 165448b12f8..61808edc69f 100644
--- a/include/qemu/osdep.h
+++ b/include/qemu/osdep.h
@@ -616,11 +616,6 @@ pid_t qemu_fork(Error **errp);
 extern uintptr_t qemu_real_host_page_size;
 extern intptr_t qemu_real_host_page_mask;
 
-extern int qemu_icache_linesize;
-extern int qemu_icache_linesize_log;
-extern int qemu_dcache_linesize;
-extern int qemu_dcache_linesize_log;
-
 /*
  * After using getopt or getopt_long, if you need to parse another set
  * of options, then you must reset optind.  Unfortunately the way to
diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
index bd71db59a9a..5971cd53ab9 100644
--- a/accel/tcg/translate-all.c
+++ b/accel/tcg/translate-all.c
@@ -51,6 +51,7 @@
 #include "qemu/qemu-print.h"
 #include "qemu/timer.h"
 #include "qemu/main-loop.h"
+#include "qemu/cacheinfo.h"
 #include "exec/log.h"
 #include "sysemu/cpus.h"
 #include "sysemu/cpu-timers.h"
diff --git a/plugins/loader.c b/plugins/loader.c
index a4ec2816922..4883b0a1cbc 100644
--- a/plugins/loader.c
+++ b/plugins/loader.c
@@ -24,6 +24,7 @@
 #include "qemu/rcu_queue.h"
 #include "qemu/qht.h"
 #include "qemu/bitmap.h"
+#include "qemu/cacheinfo.h"
 #include "qemu/xxhash.h"
 #include "qemu/plugin.h"
 #include "hw/core/cpu.h"
diff --git a/tcg/region.c b/tcg/region.c
index 7b4e65a52e8..72afb357389 100644
--- a/tcg/region.c
+++ b/tcg/region.c
@@ -26,6 +26,7 @@
 #include "qemu/units.h"
 #include "qemu/madvise.h"
 #include "qemu/mprotect.h"
+#include "qemu/cacheinfo.h"
 #include "qapi/error.h"
 #include "exec/exec-all.h"
 #include "tcg/tcg.h"
diff --git a/tcg/tcg.c b/tcg/tcg.c
index 5d2f0d8b103..528277d1d3c 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -36,6 +36,7 @@
 #include "qemu/qemu-print.h"
 #include "qemu/timer.h"
 #include "qemu/cacheflush.h"
+#include "qemu/cacheinfo.h"
 
 /* Note: the long term plan is to reduce the dependencies on the QEMU
    CPU definitions. Currently they are used for qemu_ld/st
diff --git a/util/atomic64.c b/util/atomic64.c
index 93037d5b116..22983a970f1 100644
--- a/util/atomic64.c
+++ b/util/atomic64.c
@@ -7,6 +7,7 @@
 #include "qemu/osdep.h"
 #include "qemu/atomic.h"
 #include "qemu/thread.h"
+#include "qemu/cacheinfo.h"
 
 #ifdef CONFIG_ATOMIC64
 #error This file must only be compiled if !CONFIG_ATOMIC64
diff --git a/util/cacheflush.c b/util/cacheflush.c
index 933355b0c99..4b57186d89c 100644
--- a/util/cacheflush.c
+++ b/util/cacheflush.c
@@ -7,6 +7,7 @@
 
 #include "qemu/osdep.h"
 #include "qemu/cacheflush.h"
+#include "qemu/cacheinfo.h"
 #include "qemu/bitops.h"
 
 
diff --git a/util/cacheinfo.c b/util/cacheinfo.c
index b182f0b6936..ab1644d490f 100644
--- a/util/cacheinfo.c
+++ b/util/cacheinfo.c
@@ -9,6 +9,7 @@
 #include "qemu/osdep.h"
 #include "qemu/host-utils.h"
 #include "qemu/atomic.h"
+#include "qemu/cacheinfo.h"
 
 int qemu_icache_linesize = 0;
 int qemu_icache_linesize_log;
-- 
2.25.1


