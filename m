Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C00D39BD48
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Jun 2021 18:34:44 +0200 (CEST)
Received: from localhost ([::1]:34580 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lpCmR-0001xa-EK
	for lists+qemu-devel@lfdr.de; Fri, 04 Jun 2021 12:34:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52014)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lpCRR-0003A6-PO
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 12:13:02 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:33721)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lpCRH-0003qy-Vh
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 12:13:01 -0400
Received: by mail-wr1-x431.google.com with SMTP id a20so9911918wrc.0
 for <qemu-devel@nongnu.org>; Fri, 04 Jun 2021 09:12:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=A8D3uaI26zG4k8R6VTxbVafLxnun9Bh7qIkAIQc8YNo=;
 b=eEtNeKbN82V6LymS6u8H8344VDVMVL8QN6nYVyCLRFw+pxOjdwXE+BzSChELpacNoH
 Jlu+2i/mRKmX0VLxPJORs3EwDhmgAf3DTQRSFd7jRHUNiU53vK2Tgo8BpgNCDGNZGCod
 X5gK0sIwgg3eVtlK49AgnR9NocenTD4VSzw0shmHjQ2HFDw1lQuGgpcW2U/jkHomVLjH
 n3OnPN8O0G8YFGHRIlROK8jz0ihMnwgpUuS52AywAKrfbsf432YGk7hC2F07/Ib2tgGz
 dJYXNQ8OGwPA2Vd1DyNrFguJgsRwmN5RgCW4rnnkgh3QbQj4OnLgOr3Ih/fi0BtXjhC8
 1xiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=A8D3uaI26zG4k8R6VTxbVafLxnun9Bh7qIkAIQc8YNo=;
 b=U10KQ6lhn7i+QxZTP/D+rS1VGmprNNSQ7rNscKnfXJflnGI2sVWO2RQtYTcD8rokYH
 WemtnfWMJzJIWRRKC+w9RPmnxPzUvlJIkaZKIbMpxboUkvvVvJsOlG8Y054HXVYZm1/l
 S1XkscAn37By06ZyWPIbIBB9gxo8LMEBRUuPy5PW4CgYH7M+MiN/rir50ej+PgbmO1/R
 Q+zOUxF6X0qJqVNzZnldY1k1H0lKtf6dcDpaflQByXnGlOUalnPmySt2+nD+oTGILC1w
 FK9pHhrz7yWpEUMFgMbF/sq6ZTA5CvvPRJh2VoBg6eQGQvzNJqHIvQAqqSu0gbHPJxI4
 xbxQ==
X-Gm-Message-State: AOAM532qfmu5NyTqsS4U0tqA8eUPx392ER5e1CcvHYDfwjHaHCmwQ/NY
 u3d4srTCcUrC7mddXDc1X3YzRA==
X-Google-Smtp-Source: ABdhPJymNEPS7GSfrGej3MD84/1SbHAL8trdGc6R4XiXEGIvX3wYpPqciTPIZt0aUX3o5A6YGFpeYA==
X-Received: by 2002:adf:f68c:: with SMTP id v12mr4795061wrp.122.1622823170649; 
 Fri, 04 Jun 2021 09:12:50 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id q20sm8970286wrf.45.2021.06.04.09.12.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Jun 2021 09:12:43 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 0B6251FF9F;
 Fri,  4 Jun 2021 16:53:14 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v16 16/99] target/arm: move helpers to tcg/
Date: Fri,  4 Jun 2021 16:51:49 +0100
Message-Id: <20210604155312.15902-17-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210604155312.15902-1-alex.bennee@linaro.org>
References: <20210604155312.15902-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x431.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-arm@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Claudio Fontana <cfontana@suse.de>, Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Claudio Fontana <cfontana@suse.de>

Signed-off-by: Claudio Fontana <cfontana@suse.de>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 meson.build                          |  1 +
 target/arm/{ => tcg}/op_addsub.h     |  0
 target/arm/tcg/trace.h               |  1 +
 target/arm/{ => tcg}/vec_internal.h  |  0
 target/arm/{ => tcg}/crypto_helper.c |  0
 target/arm/{ => tcg}/debug_helper.c  |  0
 target/arm/{ => tcg}/helper-a64.c    |  0
 target/arm/{ => tcg}/helper.c        |  0
 target/arm/{ => tcg}/iwmmxt_helper.c |  0
 target/arm/{ => tcg}/m_helper.c      |  0
 target/arm/{ => tcg}/mte_helper.c    |  0
 target/arm/{ => tcg}/neon_helper.c   |  0
 target/arm/{ => tcg}/op_helper.c     |  0
 target/arm/{ => tcg}/pauth_helper.c  |  0
 target/arm/{ => tcg}/sve_helper.c    |  0
 target/arm/{ => tcg}/tlb_helper.c    |  0
 target/arm/{ => tcg}/vec_helper.c    |  0
 target/arm/{ => tcg}/vfp_helper.c    |  0
 target/arm/meson.build               | 14 --------------
 target/arm/tcg/meson.build           | 14 ++++++++++++++
 target/arm/tcg/trace-events          | 10 ++++++++++
 target/arm/trace-events              |  9 ---------
 22 files changed, 26 insertions(+), 23 deletions(-)
 rename target/arm/{ => tcg}/op_addsub.h (100%)
 create mode 100644 target/arm/tcg/trace.h
 rename target/arm/{ => tcg}/vec_internal.h (100%)
 rename target/arm/{ => tcg}/crypto_helper.c (100%)
 rename target/arm/{ => tcg}/debug_helper.c (100%)
 rename target/arm/{ => tcg}/helper-a64.c (100%)
 rename target/arm/{ => tcg}/helper.c (100%)
 rename target/arm/{ => tcg}/iwmmxt_helper.c (100%)
 rename target/arm/{ => tcg}/m_helper.c (100%)
 rename target/arm/{ => tcg}/mte_helper.c (100%)
 rename target/arm/{ => tcg}/neon_helper.c (100%)
 rename target/arm/{ => tcg}/op_helper.c (100%)
 rename target/arm/{ => tcg}/pauth_helper.c (100%)
 rename target/arm/{ => tcg}/sve_helper.c (100%)
 rename target/arm/{ => tcg}/tlb_helper.c (100%)
 rename target/arm/{ => tcg}/vec_helper.c (100%)
 rename target/arm/{ => tcg}/vfp_helper.c (100%)
 create mode 100644 target/arm/tcg/trace-events

diff --git a/meson.build b/meson.build
index a876155969..eb22030571 100644
--- a/meson.build
+++ b/meson.build
@@ -1860,6 +1860,7 @@ if have_system or have_user
     'accel/tcg',
     'hw/core',
     'target/arm',
+    'target/arm/tcg',
     'target/hppa',
     'target/i386',
     'target/i386/kvm',
diff --git a/target/arm/op_addsub.h b/target/arm/tcg/op_addsub.h
similarity index 100%
rename from target/arm/op_addsub.h
rename to target/arm/tcg/op_addsub.h
diff --git a/target/arm/tcg/trace.h b/target/arm/tcg/trace.h
new file mode 100644
index 0000000000..c6e89d018b
--- /dev/null
+++ b/target/arm/tcg/trace.h
@@ -0,0 +1 @@
+#include "trace/trace-target_arm_tcg.h"
diff --git a/target/arm/vec_internal.h b/target/arm/tcg/vec_internal.h
similarity index 100%
rename from target/arm/vec_internal.h
rename to target/arm/tcg/vec_internal.h
diff --git a/target/arm/crypto_helper.c b/target/arm/tcg/crypto_helper.c
similarity index 100%
rename from target/arm/crypto_helper.c
rename to target/arm/tcg/crypto_helper.c
diff --git a/target/arm/debug_helper.c b/target/arm/tcg/debug_helper.c
similarity index 100%
rename from target/arm/debug_helper.c
rename to target/arm/tcg/debug_helper.c
diff --git a/target/arm/helper-a64.c b/target/arm/tcg/helper-a64.c
similarity index 100%
rename from target/arm/helper-a64.c
rename to target/arm/tcg/helper-a64.c
diff --git a/target/arm/helper.c b/target/arm/tcg/helper.c
similarity index 100%
rename from target/arm/helper.c
rename to target/arm/tcg/helper.c
diff --git a/target/arm/iwmmxt_helper.c b/target/arm/tcg/iwmmxt_helper.c
similarity index 100%
rename from target/arm/iwmmxt_helper.c
rename to target/arm/tcg/iwmmxt_helper.c
diff --git a/target/arm/m_helper.c b/target/arm/tcg/m_helper.c
similarity index 100%
rename from target/arm/m_helper.c
rename to target/arm/tcg/m_helper.c
diff --git a/target/arm/mte_helper.c b/target/arm/tcg/mte_helper.c
similarity index 100%
rename from target/arm/mte_helper.c
rename to target/arm/tcg/mte_helper.c
diff --git a/target/arm/neon_helper.c b/target/arm/tcg/neon_helper.c
similarity index 100%
rename from target/arm/neon_helper.c
rename to target/arm/tcg/neon_helper.c
diff --git a/target/arm/op_helper.c b/target/arm/tcg/op_helper.c
similarity index 100%
rename from target/arm/op_helper.c
rename to target/arm/tcg/op_helper.c
diff --git a/target/arm/pauth_helper.c b/target/arm/tcg/pauth_helper.c
similarity index 100%
rename from target/arm/pauth_helper.c
rename to target/arm/tcg/pauth_helper.c
diff --git a/target/arm/sve_helper.c b/target/arm/tcg/sve_helper.c
similarity index 100%
rename from target/arm/sve_helper.c
rename to target/arm/tcg/sve_helper.c
diff --git a/target/arm/tlb_helper.c b/target/arm/tcg/tlb_helper.c
similarity index 100%
rename from target/arm/tlb_helper.c
rename to target/arm/tcg/tlb_helper.c
diff --git a/target/arm/vec_helper.c b/target/arm/tcg/vec_helper.c
similarity index 100%
rename from target/arm/vec_helper.c
rename to target/arm/tcg/vec_helper.c
diff --git a/target/arm/vfp_helper.c b/target/arm/tcg/vfp_helper.c
similarity index 100%
rename from target/arm/vfp_helper.c
rename to target/arm/tcg/vfp_helper.c
diff --git a/target/arm/meson.build b/target/arm/meson.build
index 229ec7fa11..0172937b40 100644
--- a/target/arm/meson.build
+++ b/target/arm/meson.build
@@ -1,17 +1,7 @@
 arm_ss = ss.source_set()
 arm_ss.add(files(
   'cpu.c',
-  'crypto_helper.c',
-  'debug_helper.c',
   'gdbstub.c',
-  'helper.c',
-  'iwmmxt_helper.c',
-  'm_helper.c',
-  'neon_helper.c',
-  'op_helper.c',
-  'tlb_helper.c',
-  'vec_helper.c',
-  'vfp_helper.c',
   'cpu_tcg.c',
 ))
 arm_ss.add(zlib)
@@ -21,10 +11,6 @@ arm_ss.add(when: 'CONFIG_KVM', if_true: files('kvm.c', 'kvm64.c'), if_false: fil
 arm_ss.add(when: 'TARGET_AARCH64', if_true: files(
   'cpu64.c',
   'gdbstub64.c',
-  'helper-a64.c',
-  'mte_helper.c',
-  'pauth_helper.c',
-  'sve_helper.c',
 ))
 
 arm_softmmu_ss = ss.source_set()
diff --git a/target/arm/tcg/meson.build b/target/arm/tcg/meson.build
index 53a17ae6e6..b3c9d808f5 100644
--- a/target/arm/tcg/meson.build
+++ b/target/arm/tcg/meson.build
@@ -19,9 +19,23 @@ arm_ss.add(files(
   'translate-m-nocp.c',
   'translate-neon.c',
   'translate-vfp.c',
+  'helper.c',
+  'iwmmxt_helper.c',
+  'm_helper.c',
+  'neon_helper.c',
+  'op_helper.c',
+  'tlb_helper.c',
+  'vec_helper.c',
+  'vfp_helper.c',
+  'crypto_helper.c',
+  'debug_helper.c',
 ))
 
 arm_ss.add(when: 'TARGET_AARCH64', if_true: files(
   'translate-a64.c',
   'translate-sve.c',
+  'helper-a64.c',
+  'mte_helper.c',
+  'pauth_helper.c',
+  'sve_helper.c',
 ))
diff --git a/target/arm/tcg/trace-events b/target/arm/tcg/trace-events
new file mode 100644
index 0000000000..755373a5b1
--- /dev/null
+++ b/target/arm/tcg/trace-events
@@ -0,0 +1,10 @@
+# See docs/devel/tracing.txt for syntax documentation.
+
+# helper.c
+arm_gt_recalc(int timer, int irqstate, uint64_t nexttick) "gt recalc: timer %d irqstate %d next tick 0x%" PRIx64
+arm_gt_recalc_disabled(int timer) "gt recalc: timer %d irqstate 0 timer disabled"
+arm_gt_cval_write(int timer, uint64_t value) "gt_cval_write: timer %d value 0x%" PRIx64
+arm_gt_tval_write(int timer, uint64_t value) "gt_tval_write: timer %d value 0x%" PRIx64
+arm_gt_ctl_write(int timer, uint64_t value) "gt_ctl_write: timer %d value 0x%" PRIx64
+arm_gt_imask_toggle(int timer, int irqstate) "gt_ctl_write: timer %d IMASK toggle, new irqstate %d"
+arm_gt_cntvoff_write(uint64_t value) "gt_cntvoff_write: value 0x%" PRIx64
diff --git a/target/arm/trace-events b/target/arm/trace-events
index 2a0ba7bffc..23af2d710e 100644
--- a/target/arm/trace-events
+++ b/target/arm/trace-events
@@ -1,13 +1,4 @@
 # See docs/devel/tracing.rst for syntax documentation.
 
-# helper.c
-arm_gt_recalc(int timer, int irqstate, uint64_t nexttick) "gt recalc: timer %d irqstate %d next tick 0x%" PRIx64
-arm_gt_recalc_disabled(int timer) "gt recalc: timer %d irqstate 0 timer disabled"
-arm_gt_cval_write(int timer, uint64_t value) "gt_cval_write: timer %d value 0x%" PRIx64
-arm_gt_tval_write(int timer, uint64_t value) "gt_tval_write: timer %d value 0x%" PRIx64
-arm_gt_ctl_write(int timer, uint64_t value) "gt_ctl_write: timer %d value 0x%" PRIx64
-arm_gt_imask_toggle(int timer, int irqstate) "gt_ctl_write: timer %d IMASK toggle, new irqstate %d"
-arm_gt_cntvoff_write(uint64_t value) "gt_cntvoff_write: value 0x%" PRIx64
-
 # kvm.c
 kvm_arm_fixup_msi_route(uint64_t iova, uint64_t gpa) "MSI iova = 0x%"PRIx64" is translated into 0x%"PRIx64
-- 
2.20.1


