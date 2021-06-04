Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2016539BDAB
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Jun 2021 18:53:15 +0200 (CEST)
Received: from localhost ([::1]:38500 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lpD4M-0001d0-4s
	for lists+qemu-devel@lfdr.de; Fri, 04 Jun 2021 12:53:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33714)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lpCkq-0008UQ-GM
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 12:33:06 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:33391)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lpCke-0002Ci-Bv
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 12:33:04 -0400
Received: by mail-wr1-x433.google.com with SMTP id a20so9970592wrc.0
 for <qemu-devel@nongnu.org>; Fri, 04 Jun 2021 09:32:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=g+Q0O4/5dNcGlD5UswsObaT0lA+we8GvoPB9oAtz7uU=;
 b=ZUqdxDtOXBlUTU70E4QInDY4qg3i0sn6r4uCyhH4FcORUrlcmUbbb066JybG0E5tgl
 zN/5YDs1jwsArbJa0ViqtUITGzqr5aW4+hHDncXPx7P9YHH/30MLRienUPO1kL960nwE
 SkB5m35SdySz4NmDgKEAWMB04gEfIQVtZlwHoEalOhPKEIhTnppnIwPNrpA4j9oVzGwU
 5OIl684i6YYmyv4QjsHLAeSTkiaz4N3yI59yIw6saEq455CdtcGHm+T1v9ztqUrV1ovc
 a5MNtl9hifxKHik8We3xKiGhovBj2HhJt8ndh5m32mpCjNYdPn0VJoyJvL6MBuBu2oNJ
 hMpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=g+Q0O4/5dNcGlD5UswsObaT0lA+we8GvoPB9oAtz7uU=;
 b=V4UFSPb/i+PdjTxdvKK4wWH1YxPOh8Ah0kWYw1Y8vmE1CFA+ITdBGi6TQ+owJUrxQB
 Mx69zkfyJDX82B35m5e/gZxrPjaUZQoO0nt07dJ4+Vp9NeJxkOzpUfeajkfW3tgm806+
 45tzCjL/JgQk/TrfiAHU80+KlwICBaOIqJxsjgvN9r5wLiEuY76D6IAbQMRDtS0yo6vP
 G9ouwuLQFIGJfjLW3A+0d7P6KK95ODYGw5dqsou0NPz7TDQAOnN0CXrPQoMON2XC4d7u
 sLGrsOfB9PZ/w7H04Ap3bf7sIVfwaEie9HyTuSszAsXYXNfP2Z3QRPiauS7Nq2PJSP7o
 ud7w==
X-Gm-Message-State: AOAM532EqgwVS7Opc7IgtLFcDkjEyCoTKjHHBnGVD2kAcAL63qRkq0gf
 pJY0m05QZiKFzoPAY8cBngJN8Q==
X-Google-Smtp-Source: ABdhPJyz3iDA2pzrdJQCz+DUQDsJMf3BZJoQ51Ct4UOvdiO+XwfxCDeiL7zreld2GdS0OQNnkLgLwg==
X-Received: by 2002:a05:6000:18ac:: with SMTP id
 b12mr4660754wri.44.1622824371142; 
 Fri, 04 Jun 2021 09:32:51 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id m11sm5748495wmq.33.2021.06.04.09.32.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Jun 2021 09:32:43 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id A8E821FF8F;
 Fri,  4 Jun 2021 16:53:17 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v16 38/99] target/arm: move arm_sctlr away from tcg helpers
Date: Fri,  4 Jun 2021 16:52:11 +0100
Message-Id: <20210604155312.15902-39-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210604155312.15902-1-alex.bennee@linaro.org>
References: <20210604155312.15902-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x433.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Claudio Fontana <cfontana@suse.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Claudio Fontana <cfontana@suse.de>

this function is used for kvm too, add it to the
cpu-common module.

Signed-off-by: Claudio Fontana <cfontana@suse.de>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 target/arm/cpu-common.c | 11 +++++++++++
 target/arm/tcg/helper.c | 11 -----------
 2 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/target/arm/cpu-common.c b/target/arm/cpu-common.c
index a34f7f19d8..93aea216cc 100644
--- a/target/arm/cpu-common.c
+++ b/target/arm/cpu-common.c
@@ -342,3 +342,14 @@ uint32_t sve_zcr_len_for_el(CPUARMState *env, int el)
 }
 
 /* #endif TARGET_AARCH64 , see matching comment above */
+
+uint64_t arm_sctlr(CPUARMState *env, int el)
+{
+    /* Only EL0 needs to be adjusted for EL1&0 or EL2&0. */
+    if (el == 0) {
+        ARMMMUIdx mmu_idx = arm_mmu_idx_el(env, 0);
+        el = (mmu_idx == ARMMMUIdx_E20_0 || mmu_idx == ARMMMUIdx_SE20_0)
+            ? 2 : 1;
+    }
+    return env->cp15.sctlr_el[el];
+}
diff --git a/target/arm/tcg/helper.c b/target/arm/tcg/helper.c
index 93fa3fa2a9..b9ea043f20 100644
--- a/target/arm/tcg/helper.c
+++ b/target/arm/tcg/helper.c
@@ -1675,17 +1675,6 @@ void arm_cpu_do_interrupt(CPUState *cs)
 }
 #endif /* !CONFIG_USER_ONLY */
 
-uint64_t arm_sctlr(CPUARMState *env, int el)
-{
-    /* Only EL0 needs to be adjusted for EL1&0 or EL2&0. */
-    if (el == 0) {
-        ARMMMUIdx mmu_idx = arm_mmu_idx_el(env, 0);
-        el = (mmu_idx == ARMMMUIdx_E20_0 || mmu_idx == ARMMMUIdx_SE20_0)
-             ? 2 : 1;
-    }
-    return env->cp15.sctlr_el[el];
-}
-
 /* Returns true if the stage 1 translation regime is using LPAE format page
  * tables. Used when raising alignment exceptions, whose FSR changes depending
  * on whether the long or short descriptor format is in use. */
-- 
2.20.1


