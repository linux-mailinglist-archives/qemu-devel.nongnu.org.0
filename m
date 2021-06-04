Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D01B339BDB2
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Jun 2021 18:54:34 +0200 (CEST)
Received: from localhost ([::1]:42430 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lpD5d-0004E1-7a
	for lists+qemu-devel@lfdr.de; Fri, 04 Jun 2021 12:54:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52156)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lpCRZ-0003Sp-Ul
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 12:13:09 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:40624)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lpCRQ-0003tH-U7
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 12:13:09 -0400
Received: by mail-wr1-x435.google.com with SMTP id y7so5220350wrh.7
 for <qemu-devel@nongnu.org>; Fri, 04 Jun 2021 09:12:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jHTHPK7EVjgaDIrR0C18cgN5rIwMNuNIJkwhJ0GA1a8=;
 b=adNs06f9qKR686LUipzpgnO+ktPDZyAZz6BNdqaxK+SMqnDN7ZKkXPaZY9cc5aLNvL
 eccy7qRHtop8bTWC3TEF1cdc5OLXmDj4EoQ3b736zv0F2YFWRcHwb1UogNMLagnLGrXf
 INh7lnm+32pIVeZF+GGxN+RxD1/BnMMwbAlXiBpqnqIaCgfepnFC15pziSyKfJ6Cq7GT
 eYdG3GVdDGQqTCEn/643ailO5lRD7kdBHAwkyWh0gd1LG9ro1hcprFvMOycpxacRs4nN
 jRy678TwxR+h35AkoFBywm0oK/zoFwlprsSPoNt9r0xaPBUWjxfgojhCX6vYNgLRZFvO
 FEMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jHTHPK7EVjgaDIrR0C18cgN5rIwMNuNIJkwhJ0GA1a8=;
 b=G4ajDCoEkZSJi7QmutXpBq0hGHsRIRq1m3lY4lroOUBMLGFIbHu4Ljl9PJNZ5i/9uz
 Qc6JgSZjBD7UTPJmXcnpqgtSa4mp3xwrQZ3NvghqqmRPNsAib0S++6gnVNN8UqRRzzeP
 aS+92hhWl1xU5f4Nr5G0f7ksPi0Oyqf9Pb6a4DpvkEcyokufeOBtzdZy4goqMJRqdIfo
 DAJngBJ9TtrCn4L9bbtCRbOYX0eJlZTCJ0jXjYRjmrjkxwASFnZreTiKCU/KO7hkn7Th
 X0zeX5tmhfTABqoAm8KRmFA0xxDPxpFc6jF7qBLxekainoTeEmCanBAMBv75QAHCesa1
 CnDw==
X-Gm-Message-State: AOAM531oBHSO/pOdryZGXpl+ZTAOEDjh5d3zcJfAMpmWRju4FXzriG96
 TtT7brjv7TNUVyNKc1mJ3NfEtw==
X-Google-Smtp-Source: ABdhPJw8JKdOgVEzNPYzlOp1VdPwfqBZPzYztvQfZx+o+A2q3L13WcoxfUg9D1tQvEeDTG9Vnfx67Q==
X-Received: by 2002:a5d:4fc6:: with SMTP id h6mr4820531wrw.1.1622823178645;
 Fri, 04 Jun 2021 09:12:58 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id c12sm8185315wrr.90.2021.06.04.09.12.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Jun 2021 09:12:53 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id C61851FFB7;
 Fri,  4 Jun 2021 16:53:16 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v16 31/99] target/arm: tcg: add stubs for some helpers for
 non-tcg builds
Date: Fri,  4 Jun 2021 16:52:04 +0100
Message-Id: <20210604155312.15902-32-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210604155312.15902-1-alex.bennee@linaro.org>
References: <20210604155312.15902-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x435.google.com
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

this first armv7m one should go away with proper
configuration changes (only enabling possible boards for KVM).

Signed-off-by: Claudio Fontana <cfontana@suse.de>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 target/arm/tcg/tcg-stubs.c | 16 ++++++++++++++++
 target/arm/tcg/meson.build |  3 +++
 2 files changed, 19 insertions(+)
 create mode 100644 target/arm/tcg/tcg-stubs.c

diff --git a/target/arm/tcg/tcg-stubs.c b/target/arm/tcg/tcg-stubs.c
new file mode 100644
index 0000000000..14220d59a1
--- /dev/null
+++ b/target/arm/tcg/tcg-stubs.c
@@ -0,0 +1,16 @@
+/*
+ * QEMU ARM stubs for some TCG helper functions
+ *
+ * Copyright 2021 SUSE LLC
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+
+#include "qemu/osdep.h"
+#include "cpu.h"
+
+void write_v7m_exception(CPUARMState *env, uint32_t new_exc)
+{
+    g_assert_not_reached();
+}
diff --git a/target/arm/tcg/meson.build b/target/arm/tcg/meson.build
index 3d34723eee..78c34742ec 100644
--- a/target/arm/tcg/meson.build
+++ b/target/arm/tcg/meson.build
@@ -30,6 +30,9 @@ arm_ss.add(when: 'CONFIG_TCG', if_true: files(
   'vfp_helper.c',
   'crypto_helper.c',
   'debug_helper.c',
+
+), if_false: files(
+  'tcg-stubs.c',
 ))
 
 arm_ss.add(when: ['TARGET_AARCH64','CONFIG_TCG'], if_true: files(
-- 
2.20.1


