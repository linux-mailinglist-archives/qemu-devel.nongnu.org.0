Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FFAA4AB778
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Feb 2022 10:23:55 +0100 (CET)
Received: from localhost ([::1]:50728 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nH0FV-0004a8-DL
	for lists+qemu-devel@lfdr.de; Mon, 07 Feb 2022 04:23:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51196)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nGysy-00063n-2e
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 02:56:35 -0500
Received: from [2a00:1450:4864:20::32d] (port=41592
 helo=mail-wm1-x32d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nGyst-0002Fz-CF
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 02:56:30 -0500
Received: by mail-wm1-x32d.google.com with SMTP id
 bg21-20020a05600c3c9500b0035283e7a012so8006068wmb.0
 for <qemu-devel@nongnu.org>; Sun, 06 Feb 2022 23:55:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SMo/CGxUgzIKbpkLKDtLmMsQNbN4r6vJbpso8Oc0Oi4=;
 b=TbTBfZS3YRC6K2en1Rz0iYhRQhvXcUW+qcTBz2LVkCaJV78VizUBUCRKnZ5VTLFxJ9
 FY2kmYCNFwgxFOHSO+TAPSDO6anG3xhKUVxKcbjOtH8zFtWSyC+tbnq9mKdO9BvSMNzS
 KeUZCbRkYAhnl+sdfz95gjv8qEs31XLGUtO/Z9QBgwRwAq8Cf5cI/abGyu0P+79tT6rG
 /2ZsC6Qz6zkGwmc9Ip2M2X4cV454PzuUDK0BCd3KZCfzrVM9c6ZldOpY53FhU+wv7vFg
 mWpbPPLmdvEDGCaKYtkAwvvSK4PM4pF/wW9q2nZWBAb+ZjPFBFxE8t4KgMhryvcQ3jVD
 EXng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=SMo/CGxUgzIKbpkLKDtLmMsQNbN4r6vJbpso8Oc0Oi4=;
 b=dWBEVYrWyA23LhRPrpTZa4JOJcWbTZPDJ5OM6mOzDfdXdmIdfIaUW3bqiHg98S9OgE
 u00FKkfgDRI1MarYlT8hZNJhxB1xKSzaaJkq2WrQVMc8/YUeAmahgicTMFrw/iFob3/v
 aPGWIBTD9oPsp0128mUqUf0UoFOXOEz336ZDSN+Ne6S8OLnZEQWp63IwF69sw3W4GnpG
 /7A1E9qqex4l+TVEbFxugkc24f5QkxZJzyIjFkze4cRQW6Wuh8XKWP/2o6TIkIs1N4XA
 HMbDLDQ+lQoRFimMtouEClnpAW/i45Mo5j7TazNMoeYFzxOJ1r0hg+qz+nooLMqQv8Vn
 DY0Q==
X-Gm-Message-State: AOAM530jLu5e97qYrqJyvtQ/Hux6di9i6g49R/pNMg0dUfkUy8VYBRtX
 +URVlVZahEV+mUItBb4KjB+93bOsREM=
X-Google-Smtp-Source: ABdhPJwnOExTY5T3fYJB/6lmtkBoQBiky048FmJzM1sUcveYa78HPiReDDaeaN5W2AwLIWc87uAYEg==
X-Received: by 2002:a05:600c:4982:: with SMTP id
 h2mr3288655wmp.140.1644220545850; 
 Sun, 06 Feb 2022 23:55:45 -0800 (PST)
Received: from localhost.localdomain (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id z3sm9279083wmp.42.2022.02.06.23.55.45
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sun, 06 Feb 2022 23:55:45 -0800 (PST)
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v3 17/21] misc: Add missing "sysemu/cpu-timers.h" include
Date: Mon,  7 Feb 2022 08:54:22 +0100
Message-Id: <20220207075426.81934-18-f4bug@amsat.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220207075426.81934-1-f4bug@amsat.org>
References: <20220207075426.81934-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32d
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Reply-to:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
From:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= via <qemu-devel@nongnu.org>

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 accel/tcg/tcg-accel-ops-icount.c | 1 +
 accel/tcg/tcg-accel-ops-mttcg.c  | 1 +
 accel/tcg/tcg-accel-ops-rr.c     | 1 +
 accel/tcg/tcg-accel-ops.c        | 1 +
 include/exec/exec-all.h          | 1 -
 target/riscv/csr.c               | 1 +
 6 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/accel/tcg/tcg-accel-ops-icount.c b/accel/tcg/tcg-accel-ops-icount.c
index ea42d1d51b..bdaf2c943b 100644
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
index 29632bd4c0..dc421c8fd7 100644
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
index bf59f53dbc..a805fb6bdd 100644
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
index 1a8e8390bd..ea7dcad674 100644
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
diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
index 35d8e93976..87df70fa8f 100644
--- a/include/exec/exec-all.h
+++ b/include/exec/exec-all.h
@@ -24,7 +24,6 @@
 #ifdef CONFIG_TCG
 #include "exec/cpu_ldst.h"
 #endif
-#include "sysemu/cpu-timers.h"
 
 /* allow to see translation results - the slowdown should be negligible, so we leave it */
 #define DEBUG_DISAS
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index e5f9d4ef93..a4db40769b 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -22,6 +22,7 @@
 #include "cpu.h"
 #include "qemu/main-loop.h"
 #include "exec/exec-all.h"
+#include "sysemu/cpu-timers.h"
 
 /* CSR function table public API */
 void riscv_get_csr_ops(int csrno, riscv_csr_operations *ops)
-- 
2.34.1


