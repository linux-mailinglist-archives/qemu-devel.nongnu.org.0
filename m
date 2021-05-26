Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 696B1392376
	for <lists+qemu-devel@lfdr.de>; Thu, 27 May 2021 01:57:20 +0200 (CEST)
Received: from localhost ([::1]:53136 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lm3Op-0006k8-19
	for lists+qemu-devel@lfdr.de; Wed, 26 May 2021 19:57:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34834)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lm3FM-0005eP-7u
 for qemu-devel@nongnu.org; Wed, 26 May 2021 19:47:32 -0400
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f]:41485)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lm3FC-0004U6-Pg
 for qemu-devel@nongnu.org; Wed, 26 May 2021 19:47:31 -0400
Received: by mail-pg1-x52f.google.com with SMTP id r1so2295985pgk.8
 for <qemu-devel@nongnu.org>; Wed, 26 May 2021 16:47:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+qXhpK9E+3ZMIr8DgyUCNEWWCWtWcLGiTUcEr5+3/Pc=;
 b=JELvpquGO2TsBjw4UD0TAUsdgW7P9SVA1gAgGZk1iUmuyev+MfNSXDgUY+oMOYBQqa
 Z0Di4a+9NNZwVddHMiX0JXpWXCTSMXvqeHTrb8lPSxV28UBk+KTO2LIGLwq8XaHVu97D
 tOdY/b3lWVDBDx6f4XWzRmvkIzowsuscuoIVLl8Y60jI0LzVnNZGiH3TojqGCXr0hIQY
 BRNS92tNeF+Ve+qrByy7aSkRNov5yz1jbeROyM9f1C1QRxIUbeBqahnpvhRmyYO06Kf7
 ZvDncu3/eZpRDrHhBbjqNS24yjad+7vZ7umeX7RjVyWhNk2iwkELGFN0ij3dvEmQtG5O
 bX6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+qXhpK9E+3ZMIr8DgyUCNEWWCWtWcLGiTUcEr5+3/Pc=;
 b=YqweHJeozG7ey6MZxGq2BsQcRjMBFafdlKxdEDd0pgQteGdXHl/Ple/pTOLXdyflUD
 E5K5cIX+hxXtXvArrk8oR1JzYdlJn4WTvOehh454+3eY0qvklf3+X6xRuyGei0PoxKKa
 Nm2LQdWUMpzBg0BsFLZpR5Jj0l+gCPgS8jl/Svm+x3Z4TZ4oH74LDo48g8uT3zLtlRYI
 lrVwWOrcLBHEYRp0j85qOoNaB7yFkr1iSufsS8D9DboClJJipSLH47QgfUo7+bI1CMCX
 Mago5kJVxWj7V9h/9N287UhyjBkwW60FvP33Pv6t8/KbG8hIo4UP+aY5b+BQf+9NmHQK
 z+vw==
X-Gm-Message-State: AOAM533f+tBVJI20XPyIfiMhSdD5XJTUtTSJVrBCJmbwUCMzYcu2HgD0
 zUov38Pnhp4ldgjcKS6CIBMBDgkGQ6kwcw==
X-Google-Smtp-Source: ABdhPJxT6B5VQm9mSG9ShM/giRWeOrjXiHlUo8gtxcQrD1e9+/KeCb7BVYyVXkH/22Tc7/6h+rcwpA==
X-Received: by 2002:aa7:8b4f:0:b029:2bd:ea13:c4b4 with SMTP id
 i15-20020aa78b4f0000b02902bdea13c4b4mr936498pfd.48.1622072839318; 
 Wed, 26 May 2021 16:47:19 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id g13sm285355pfi.18.2021.05.26.16.47.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 May 2021 16:47:19 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 08/31] accel/tcg: Keep TranslationBlock headers local to TCG
Date: Wed, 26 May 2021 16:46:47 -0700
Message-Id: <20210526234710.125396-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210526234710.125396-1-richard.henderson@linaro.org>
References: <20210526234710.125396-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

Only the TCG accelerator uses the TranslationBlock API.
Move the tb-context.h / tb-hash.h / tb-lookup.h from the
global namespace to the TCG one (in accel/tcg).

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20210524170453.3791436-3-f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 {include/exec => accel/tcg}/tb-context.h | 0
 {include/exec => accel/tcg}/tb-hash.h    | 0
 {include/exec => accel/tcg}/tb-lookup.h  | 2 +-
 accel/tcg/cpu-exec.c                     | 6 +++---
 accel/tcg/cputlb.c                       | 2 +-
 accel/tcg/tcg-runtime.c                  | 2 +-
 accel/tcg/translate-all.c                | 4 ++--
 MAINTAINERS                              | 1 -
 8 files changed, 8 insertions(+), 9 deletions(-)
 rename {include/exec => accel/tcg}/tb-context.h (100%)
 rename {include/exec => accel/tcg}/tb-hash.h (100%)
 rename {include/exec => accel/tcg}/tb-lookup.h (98%)

diff --git a/include/exec/tb-context.h b/accel/tcg/tb-context.h
similarity index 100%
rename from include/exec/tb-context.h
rename to accel/tcg/tb-context.h
diff --git a/include/exec/tb-hash.h b/accel/tcg/tb-hash.h
similarity index 100%
rename from include/exec/tb-hash.h
rename to accel/tcg/tb-hash.h
diff --git a/include/exec/tb-lookup.h b/accel/tcg/tb-lookup.h
similarity index 98%
rename from include/exec/tb-lookup.h
rename to accel/tcg/tb-lookup.h
index 29d61ceb34..9c9e0079da 100644
--- a/include/exec/tb-lookup.h
+++ b/accel/tcg/tb-lookup.h
@@ -14,7 +14,7 @@
 #endif
 
 #include "exec/exec-all.h"
-#include "exec/tb-hash.h"
+#include "tb-hash.h"
 
 /* Might cause an exception, so have a longjmp destination ready */
 static inline TranslationBlock *tb_lookup(CPUState *cpu, target_ulong pc,
diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
index 10e11f27bb..ad1279d2ed 100644
--- a/accel/tcg/cpu-exec.c
+++ b/accel/tcg/cpu-exec.c
@@ -29,9 +29,6 @@
 #include "qemu/compiler.h"
 #include "qemu/timer.h"
 #include "qemu/rcu.h"
-#include "exec/tb-hash.h"
-#include "exec/tb-lookup.h"
-#include "exec/tb-context.h"
 #include "exec/log.h"
 #include "qemu/main-loop.h"
 #if defined(TARGET_I386) && !defined(CONFIG_USER_ONLY)
@@ -41,6 +38,9 @@
 #include "exec/cpu-all.h"
 #include "sysemu/cpu-timers.h"
 #include "sysemu/replay.h"
+#include "tb-hash.h"
+#include "tb-lookup.h"
+#include "tb-context.h"
 #include "internal.h"
 
 /* -icount align implementation. */
diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
index 2f7088614a..f24348e979 100644
--- a/accel/tcg/cputlb.c
+++ b/accel/tcg/cputlb.c
@@ -24,7 +24,6 @@
 #include "exec/memory.h"
 #include "exec/cpu_ldst.h"
 #include "exec/cputlb.h"
-#include "exec/tb-hash.h"
 #include "exec/memory-internal.h"
 #include "exec/ram_addr.h"
 #include "tcg/tcg.h"
@@ -36,6 +35,7 @@
 #include "exec/translate-all.h"
 #include "trace/trace-root.h"
 #include "trace/mem.h"
+#include "tb-hash.h"
 #include "internal.h"
 #ifdef CONFIG_PLUGIN
 #include "qemu/plugin-memory.h"
diff --git a/accel/tcg/tcg-runtime.c b/accel/tcg/tcg-runtime.c
index 49f5de37e8..66ac830e2f 100644
--- a/accel/tcg/tcg-runtime.c
+++ b/accel/tcg/tcg-runtime.c
@@ -30,7 +30,7 @@
 #include "disas/disas.h"
 #include "exec/log.h"
 #include "tcg/tcg.h"
-#include "exec/tb-lookup.h"
+#include "tb-lookup.h"
 
 /* 32-bit helpers */
 
diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
index e9f4de5190..1eefe6ea8d 100644
--- a/accel/tcg/translate-all.c
+++ b/accel/tcg/translate-all.c
@@ -47,8 +47,6 @@
 #endif
 
 #include "exec/cputlb.h"
-#include "exec/tb-hash.h"
-#include "exec/tb-context.h"
 #include "exec/translate-all.h"
 #include "qemu/bitmap.h"
 #include "qemu/error-report.h"
@@ -61,6 +59,8 @@
 #include "sysemu/tcg.h"
 #include "qapi/error.h"
 #include "hw/core/tcg-cpu-ops.h"
+#include "tb-hash.h"
+#include "tb-context.h"
 #include "internal.h"
 
 /* #define DEBUG_TB_INVALIDATE */
diff --git a/MAINTAINERS b/MAINTAINERS
index a77f246569..5f55404f2f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -128,7 +128,6 @@ F: docs/devel/decodetree.rst
 F: include/exec/cpu*.h
 F: include/exec/exec-all.h
 F: include/exec/helper*.h
-F: include/exec/tb-hash.h
 F: include/sysemu/cpus.h
 F: include/sysemu/tcg.h
 F: include/hw/core/tcg-cpu-ops.h
-- 
2.25.1


