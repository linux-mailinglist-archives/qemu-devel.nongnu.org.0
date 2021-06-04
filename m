Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7977F39BD71
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Jun 2021 18:43:01 +0200 (CEST)
Received: from localhost ([::1]:58854 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lpCuS-0002DX-Ht
	for lists+qemu-devel@lfdr.de; Fri, 04 Jun 2021 12:43:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51676)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lpCRC-0002iU-Tb
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 12:12:46 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:55930)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lpCR6-0003n3-J0
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 12:12:46 -0400
Received: by mail-wm1-x32e.google.com with SMTP id g204so5685922wmf.5
 for <qemu-devel@nongnu.org>; Fri, 04 Jun 2021 09:12:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OjGXb7X5f/RV9s4a2gQrpM53TYKYVdPrN+K7LbjNZd0=;
 b=DQPgJ414R5YMAqouvs6BLK9liTnc8PVZhojoyUvd8wVnLHDlCnCU1ZSrEu/IUHDsjA
 3wecGKhPjUVBUvrMV8x8f7mGpIDjJedP68ThbWwlHIRU61T6RQN+mZV5DT/nusoAEnVx
 IomLez84oWWVRqmU0yOLLceBKqHbqZTv5zXKc/HqRhMCbcB4htifS03DAkAs8PBhWlhx
 5Ltem084vwDTHx1oK3BH31a24Q8QPB7PtnwtQs46hnAg4s9ggR+yhdyXTgZ36h2g3eSH
 apwzL7BN4mCnGlEsqaSgJe/fj1DbcynPb/prQjr3oUnKH+zwDsBUW9BMdZc22k0EI3l4
 EgyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OjGXb7X5f/RV9s4a2gQrpM53TYKYVdPrN+K7LbjNZd0=;
 b=QdZHewO/yGt8WwMeH1MgDhcjJB9QeL99s0+tEvqRNSs6rDoayjus4qK9XVbCPhFYfB
 /Ndaz+BwIrNNkTNi/veGpLoGHfoPI99xcdvF/pVnEWy47cpsFh7IefA9wa4yj9sFdTst
 UwdnBv0WDTaw5kjmL3suGyZvpckBWLC2yBeU+3aUubJUn3IVSn5/rQ4PlRvdBa5Jv/Qe
 PRzTXpRFcYABrDsZi/WnMf0d4Fv6k1qAVN/gs6Ko3yau0y1nQkDmtyAQnSGc5CutUNWT
 xqS/ofOEn5eN0nrM50Lmpc+aNJhVavtpwv08SbrXNG3gcOFDbo1a7YTX3kBgdX86x2ob
 Tgbg==
X-Gm-Message-State: AOAM533IaNgCmSmDCKL+4ILZ6/ZDHbAjnoxj6wxtwswFNIcUXZUfhLF+
 0e292DXr4UiS6h/hkUzzdgo6dg==
X-Google-Smtp-Source: ABdhPJyMnqLwFA2dcwldiDHwMbWIhNZx2GBj5e7OAqw86YSrXSFiaVyYXAKp8ByR4RHx2SdamtEscQ==
X-Received: by 2002:a05:600c:3795:: with SMTP id
 o21mr4432038wmr.99.1622823159079; 
 Fri, 04 Jun 2021 09:12:39 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id y22sm10838514wma.36.2021.06.04.09.12.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Jun 2021 09:12:37 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 368EA1FF91;
 Fri,  4 Jun 2021 16:53:20 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v16 60/99] target/arm: cleanup cpu includes
Date: Fri,  4 Jun 2021 16:52:33 +0100
Message-Id: <20210604155312.15902-61-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210604155312.15902-1-alex.bennee@linaro.org>
References: <20210604155312.15902-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32e.google.com
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-arm@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Claudio Fontana <cfontana@suse.de>, Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Claudio Fontana <cfontana@suse.de>

cpu.c,
cpu32.c,
cpu64.c,
tcg/sysemu/tcg-cpu.c,

all need a good cleanup when it comes to included header files.

Signed-off-by: Claudio Fontana <cfontana@suse.de>
Acked-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 target/arm/cpu.c                |  6 ++----
 target/arm/cpu32.c              | 14 --------------
 target/arm/cpu64.c              |  6 ------
 target/arm/tcg/sysemu/tcg-cpu.c | 22 +---------------------
 4 files changed, 3 insertions(+), 45 deletions(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 9b81cbe386..7e3726ff00 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -21,24 +21,22 @@
 #include "qemu/osdep.h"
 #include "qemu-common.h"
 #include "target/arm/idau.h"
-#include "qemu/module.h"
 #include "qapi/error.h"
-#include "qapi/visitor.h"
 #include "cpu.h"
 #include "cpregs.h"
+
 #ifdef CONFIG_TCG
 #include "tcg/tcg-cpu.h"
 #endif /* CONFIG_TCG */
 #include "cpu32.h"
-#include "internals.h"
 #include "exec/exec-all.h"
 #include "hw/qdev-properties.h"
 #if !defined(CONFIG_USER_ONLY)
 #include "hw/loader.h"
 #include "hw/boards.h"
 #endif
+
 #include "sysemu/tcg.h"
-#include "sysemu/hw_accel.h"
 #include "kvm/kvm_arm.h"
 #include "disas/capstone.h"
 #include "fpu/softfloat.h"
diff --git a/target/arm/cpu32.c b/target/arm/cpu32.c
index 56f02ca891..6c53245d66 100644
--- a/target/arm/cpu32.c
+++ b/target/arm/cpu32.c
@@ -20,26 +20,12 @@
 
 #include "qemu/osdep.h"
 #include "qemu/qemu-print.h"
-#include "qemu-common.h"
-#include "target/arm/idau.h"
 #include "qemu/module.h"
-#include "qapi/error.h"
-#include "qapi/visitor.h"
 #include "cpu.h"
 #include "cpregs.h"
-#include "internals.h"
-#include "exec/exec-all.h"
-#include "hw/qdev-properties.h"
 #if !defined(CONFIG_USER_ONLY)
-#include "hw/loader.h"
 #include "hw/boards.h"
 #endif
-#include "sysemu/sysemu.h"
-#include "sysemu/tcg.h"
-#include "sysemu/hw_accel.h"
-#include "kvm/kvm_arm.h"
-#include "disas/capstone.h"
-#include "fpu/softfloat.h"
 #include "cpu-mmu.h"
 #include "cpu32.h"
 
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index f5ead76374..a8ff1994ca 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -23,13 +23,7 @@
 #include "qemu/qemu-print.h"
 #include "cpu.h"
 #include "cpu32.h"
-#ifdef CONFIG_TCG
-#include "hw/core/tcg-cpu-ops.h"
-#endif /* CONFIG_TCG */
 #include "qemu/module.h"
-#if !defined(CONFIG_USER_ONLY)
-#include "hw/loader.h"
-#endif
 #include "sysemu/kvm.h"
 #include "kvm/kvm_arm.h"
 #include "qapi/visitor.h"
diff --git a/target/arm/tcg/sysemu/tcg-cpu.c b/target/arm/tcg/sysemu/tcg-cpu.c
index 6ab49ba614..327b2a5073 100644
--- a/target/arm/tcg/sysemu/tcg-cpu.c
+++ b/target/arm/tcg/sysemu/tcg-cpu.c
@@ -19,29 +19,9 @@
  */
 
 #include "qemu/osdep.h"
-#include "qemu/qemu-print.h"
-#include "qemu-common.h"
-#include "target/arm/idau.h"
-#include "qemu/module.h"
-#include "qapi/error.h"
-#include "qapi/visitor.h"
 #include "cpu.h"
-#include "hw/core/tcg-cpu-ops.h"
 #include "semihosting/common-semi.h"
-#include "cpregs.h"
-#include "internals.h"
-#include "exec/exec-all.h"
-#include "hw/qdev-properties.h"
-#if !defined(CONFIG_USER_ONLY)
-#include "hw/loader.h"
-#include "hw/boards.h"
-#endif
-#include "sysemu/sysemu.h"
-#include "sysemu/tcg.h"
-#include "sysemu/hw_accel.h"
-#include "disas/capstone.h"
-#include "fpu/softfloat.h"
-#include "cpu-mmu.h"
+#include "qemu/log.h"
 #include "tcg/tcg-cpu.h"
 
 /*
-- 
2.20.1


