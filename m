Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 15C704CEBB1
	for <lists+qemu-devel@lfdr.de>; Sun,  6 Mar 2022 14:23:32 +0100 (CET)
Received: from localhost ([::1]:51988 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQqrD-0007dR-6G
	for lists+qemu-devel@lfdr.de; Sun, 06 Mar 2022 08:23:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42216)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nQqVv-0001BG-A4
 for qemu-devel@nongnu.org; Sun, 06 Mar 2022 08:01:31 -0500
Received: from [2a00:1450:4864:20::334] (port=51898
 helo=mail-wm1-x334.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nQqVt-00040P-Lk
 for qemu-devel@nongnu.org; Sun, 06 Mar 2022 08:01:31 -0500
Received: by mail-wm1-x334.google.com with SMTP id q20so5313825wmq.1
 for <qemu-devel@nongnu.org>; Sun, 06 Mar 2022 05:01:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KUt+8wpV0mRsQqp2vfwRoKfbIs6XuvDdnlEwDZLYsRk=;
 b=LQz5xM7PEWY5LBoH4jahXugx+XkIXJg6aJaCvVwumZEtmUYRtDjg8N8Q+g76gwpp/o
 h+bEht4uGrPfBoNVE4/EUdRgaiSBMpzGrF4z5QepBfOK2/I6XOAQAaxywR4RJU1UQzrr
 QlZQ5fmFlCJxMC8K6BGlEWN2O81/rjWo+/h7Eo1XWjIPx/30+Dq05aB7o+LiSYLQ+tlZ
 v+46wOzpME+KGR+zrAg8tnqsQfSjnt2KIhQJo1D/W7YVNU9pUrhDYhCClgBKEWf4JfrM
 HKnrEMskBT3XIdH6+KUko4SI2QXwK3p8cY7j8rkLaqeNGDHABDMbRvrXHa9U36ZQO36E
 NZig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KUt+8wpV0mRsQqp2vfwRoKfbIs6XuvDdnlEwDZLYsRk=;
 b=sHa3l0IezNj4NYJwVw6Y8Iwmo7+HXvBep0Zj7MSXpJ+5DXh7bj05N0+uyKR+NFaDp9
 2NR3l3vwnmJRnayx6vPQp9nRAI2Ufxhnwo0HZSxX7NHlCPOqxok9Om1h2PQOR7/oFjh5
 mfcpQ/duBQ1wIWVp2MYU7qlrWqqbuIr3UhrTGAeOa6vLSghOW9Cw3zd1ssD6YgdhGOEJ
 RN1ddfdYewB6nLQ9Xgz1LuPbZuNYOyrwTgE5Aq58vDuBjjd7mArQw0ddqOGa/hsxpzg8
 p7wGPfX7QQ09x7R0pCPk5kPPFQdQCjHss4+9VtyDJ8r05/ulxMUXX6GlYwzJeptzRFL4
 GUEw==
X-Gm-Message-State: AOAM532SBRQHhrtoU1+OmfUla02wGEz3HjKqGtNZcgVIXugpjU9g5uNQ
 HtUWAbbo1Yac/UXrbr7/tDuUz4ozyDk=
X-Google-Smtp-Source: ABdhPJxqJOqmnVrslJPE/WCkPLSDtX2m/hLQ7fW1f1c5EkZLyEtD6fqKeHF9RoTtbn6ywq2/mca3Og==
X-Received: by 2002:a05:600c:3d14:b0:381:67f9:8fd8 with SMTP id
 bh20-20020a05600c3d1400b0038167f98fd8mr5651112wmb.157.1646571688137; 
 Sun, 06 Mar 2022 05:01:28 -0800 (PST)
Received: from nuc.lan ([185.126.107.38]) by smtp.gmail.com with ESMTPSA id
 v6-20020a5d5906000000b001f0639f69e6sm7498770wrd.55.2022.03.06.05.01.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Mar 2022 05:01:27 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PULL 16/33] misc: Add missing "sysemu/cpu-timers.h" include
Date: Sun,  6 Mar 2022 13:59:43 +0100
Message-Id: <20220306130000.8104-17-philippe.mathieu.daude@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220306130000.8104-1-philippe.mathieu.daude@gmail.com>
References: <20220306130000.8104-1-philippe.mathieu.daude@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::334
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x334.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Eduardo Habkost <eduardo@habkost.net>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20220207075426.81934-18-f4bug@amsat.org>
---
 include/exec/exec-all.h          | 1 -
 accel/tcg/tcg-accel-ops-icount.c | 1 +
 accel/tcg/tcg-accel-ops-mttcg.c  | 1 +
 accel/tcg/tcg-accel-ops-rr.c     | 1 +
 accel/tcg/tcg-accel-ops.c        | 1 +
 target/riscv/csr.c               | 1 +
 6 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
index 227e10ba560..edc8e5fa1ec 100644
--- a/include/exec/exec-all.h
+++ b/include/exec/exec-all.h
@@ -24,7 +24,6 @@
 #ifdef CONFIG_TCG
 #include "exec/cpu_ldst.h"
 #endif
-#include "sysemu/cpu-timers.h"
 
 /* allow to see translation results - the slowdown should be negligible, so we leave it */
 #define DEBUG_DISAS
diff --git a/accel/tcg/tcg-accel-ops-icount.c b/accel/tcg/tcg-accel-ops-icount.c
index ea42d1d51b1..bdaf2c943b4 100644
--- a/accel/tcg/tcg-accel-ops-icount.c
+++ b/accel/tcg/tcg-accel-ops-icount.c
@@ -27,6 +27,7 @@
 #include "qemu-common.h"
 #include "sysemu/tcg.h"
 #include "sysemu/replay.h"
+#include "sysemu/cpu-timers.h"
 #include "qemu/main-loop.h"
 #include "qemu/guest-random.h"
 #include "exec/exec-all.h"
diff --git a/accel/tcg/tcg-accel-ops-mttcg.c b/accel/tcg/tcg-accel-ops-mttcg.c
index 29632bd4c0a..dc421c8fd71 100644
--- a/accel/tcg/tcg-accel-ops-mttcg.c
+++ b/accel/tcg/tcg-accel-ops-mttcg.c
@@ -27,6 +27,7 @@
 #include "qemu-common.h"
 #include "sysemu/tcg.h"
 #include "sysemu/replay.h"
+#include "sysemu/cpu-timers.h"
 #include "qemu/main-loop.h"
 #include "qemu/notify.h"
 #include "qemu/guest-random.h"
diff --git a/accel/tcg/tcg-accel-ops-rr.c b/accel/tcg/tcg-accel-ops-rr.c
index bf59f53dbc2..a805fb6bddc 100644
--- a/accel/tcg/tcg-accel-ops-rr.c
+++ b/accel/tcg/tcg-accel-ops-rr.c
@@ -27,6 +27,7 @@
 #include "qemu-common.h"
 #include "sysemu/tcg.h"
 #include "sysemu/replay.h"
+#include "sysemu/cpu-timers.h"
 #include "qemu/main-loop.h"
 #include "qemu/notify.h"
 #include "qemu/guest-random.h"
diff --git a/accel/tcg/tcg-accel-ops.c b/accel/tcg/tcg-accel-ops.c
index 1a8e8390bd6..ea7dcad674c 100644
--- a/accel/tcg/tcg-accel-ops.c
+++ b/accel/tcg/tcg-accel-ops.c
@@ -29,6 +29,7 @@
 #include "qemu-common.h"
 #include "sysemu/tcg.h"
 #include "sysemu/replay.h"
+#include "sysemu/cpu-timers.h"
 #include "qemu/main-loop.h"
 #include "qemu/guest-random.h"
 #include "exec/exec-all.h"
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index aea82dff4af..0606cd0ea80 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -23,6 +23,7 @@
 #include "cpu.h"
 #include "qemu/main-loop.h"
 #include "exec/exec-all.h"
+#include "sysemu/cpu-timers.h"
 
 /* CSR function table public API */
 void riscv_get_csr_ops(int csrno, riscv_csr_operations *ops)
-- 
2.35.1


