Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E2CF431E33B
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Feb 2021 00:51:03 +0100 (CET)
Received: from localhost ([::1]:34516 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCWb0-00034v-Ty
	for lists+qemu-devel@lfdr.de; Wed, 17 Feb 2021 18:51:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50628)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lCWRA-0008Ds-ES
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 18:40:52 -0500
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531]:42627)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lCWR7-0004ch-Rk
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 18:40:52 -0500
Received: by mail-pg1-x531.google.com with SMTP id o38so9502133pgm.9
 for <qemu-devel@nongnu.org>; Wed, 17 Feb 2021 15:40:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rT3fdfxLOBUZePBBIZU0/yFNFGueWion3u26dnymBfY=;
 b=OQYuTL8isULqJrBXjgnJVlNqgNrk0eKil7Vjvhiq1Op/OM3W5pRGihovrKl1p22zVd
 61APAvQhsOjnqWkKcjP/ZWPGzG//XaOFlB3NWuJiOQz9yYKffwKRhuxpZB9IwjikxDRv
 qBdSi5IwssUGT5BQFSQBs4nwu5tn76HH+sRo+dAUnwpw07urlfBvTw788GN/8uB81wzg
 m8X7qIfmRD/KZXz25QoARpN/7ySpJK3BiOUD6Q5Hq6vtt9Nl/rk4MDch60UFow77GvLY
 QnewiY42gVHGS9yoUmO1Pdr3J8yjtYwjwfQKoUd+qecWgZtRWjCtrCJGMTYUzTpYOKWu
 gn3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rT3fdfxLOBUZePBBIZU0/yFNFGueWion3u26dnymBfY=;
 b=k7Wj0HtqPx5DGGWaheO6fW/n1MQsuVDXswD/E2q+wUpJqs0hcnuB1CZcyO8b3kWcIP
 hJuhuqdeJP+sRRsXs66b8As4Kcf5Lp8KEt5isJdnGecINZYleT3tIcH3AEgguy1buHwm
 dI5+pJk/2l/cgaIMQEFs2H6jgI3upwTx+OI6YebKNnHyde9nzSTrYoM7/vWlVWevG+em
 d+zglp6+C0zreRawM1TLHOsBecS8g5OHglkaXjkHYVA26Jm7Rvaa6RaDnCvvefzapMOE
 7Hc9VTuBNjwd4xU3RVBVv2BC5WENOIZI0Jqjc5WtzpigRY2S9F6u9rFD6A87vateBAeu
 2j7A==
X-Gm-Message-State: AOAM530/yXGFfHK6EgnuoXY7I3E0Bb9JSSIgiYzI2QCDCPzTkmKlYOZs
 2UzQzMlEFG/4qOLG+bwq4V55pINECRKGAg==
X-Google-Smtp-Source: ABdhPJy00T6nb1KPiVkGZkBZo02g3NvddI6TPx9RMqR1X5naE8tluCNtyU93IEyTkP78BpqAMLawrA==
X-Received: by 2002:a62:2c50:0:b029:1b9:1846:b490 with SMTP id
 s77-20020a622c500000b02901b91846b490mr1551788pfs.76.1613605248196; 
 Wed, 17 Feb 2021 15:40:48 -0800 (PST)
Received: from localhost.localdomain (047-051-160-125.biz.spectrum.com.
 [47.51.160.125])
 by smtp.gmail.com with ESMTPSA id c21sm3950355pgh.0.2021.02.17.15.40.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Feb 2021 15:40:47 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 09/35] Hexagon (target/hexagon) GDB Stub
Date: Wed, 17 Feb 2021 15:39:57 -0800
Message-Id: <20210217234023.1742406-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210217234023.1742406-1-richard.henderson@linaro.org>
References: <20210217234023.1742406-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x531.google.com
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
Cc: peter.maydell@linaro.org, Taylor Simpson <tsimpson@quicinc.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Taylor Simpson <tsimpson@quicinc.com>

GDB register read and write routines

Signed-off-by: Taylor Simpson <tsimpson@quicinc.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <1612763186-18161-9-git-send-email-tsimpson@quicinc.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/hexagon/internal.h |  2 ++
 target/hexagon/gdbstub.c  | 47 +++++++++++++++++++++++++++++++++++++++
 2 files changed, 49 insertions(+)
 create mode 100644 target/hexagon/gdbstub.c

diff --git a/target/hexagon/internal.h b/target/hexagon/internal.h
index c839796cd1..2da85c8606 100644
--- a/target/hexagon/internal.h
+++ b/target/hexagon/internal.h
@@ -28,6 +28,8 @@
 #define HEX_DEBUG_LOG(...) do { } while (0)
 #endif
 
+int hexagon_gdb_read_register(CPUState *cpu, GByteArray *buf, int reg);
+int hexagon_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg);
 void hexagon_debug(CPUHexagonState *env);
 
 extern const char * const hexagon_regnames[TOTAL_PER_THREAD_REGS];
diff --git a/target/hexagon/gdbstub.c b/target/hexagon/gdbstub.c
new file mode 100644
index 0000000000..9c8c04c961
--- /dev/null
+++ b/target/hexagon/gdbstub.c
@@ -0,0 +1,47 @@
+/*
+ *  Copyright(c) 2019-2021 Qualcomm Innovation Center, Inc. All Rights Reserved.
+ *
+ *  This program is free software; you can redistribute it and/or modify
+ *  it under the terms of the GNU General Public License as published by
+ *  the Free Software Foundation; either version 2 of the License, or
+ *  (at your option) any later version.
+ *
+ *  This program is distributed in the hope that it will be useful,
+ *  but WITHOUT ANY WARRANTY; without even the implied warranty of
+ *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ *  GNU General Public License for more details.
+ *
+ *  You should have received a copy of the GNU General Public License
+ *  along with this program; if not, see <http://www.gnu.org/licenses/>.
+ */
+
+#include "qemu/osdep.h"
+#include "qemu-common.h"
+#include "exec/gdbstub.h"
+#include "cpu.h"
+#include "internal.h"
+
+int hexagon_gdb_read_register(CPUState *cs, GByteArray *mem_buf, int n)
+{
+    HexagonCPU *cpu = HEXAGON_CPU(cs);
+    CPUHexagonState *env = &cpu->env;
+
+    if (n < TOTAL_PER_THREAD_REGS) {
+        return gdb_get_regl(mem_buf, env->gpr[n]);
+    }
+
+    g_assert_not_reached();
+}
+
+int hexagon_gdb_write_register(CPUState *cs, uint8_t *mem_buf, int n)
+{
+    HexagonCPU *cpu = HEXAGON_CPU(cs);
+    CPUHexagonState *env = &cpu->env;
+
+    if (n < TOTAL_PER_THREAD_REGS) {
+        env->gpr[n] = ldtul_p(mem_buf);
+        return sizeof(target_ulong);
+    }
+
+    g_assert_not_reached();
+}
-- 
2.25.1


