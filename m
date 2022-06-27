Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E10155B940
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Jun 2022 12:49:12 +0200 (CEST)
Received: from localhost ([::1]:45112 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o5mIp-0002Z4-4J
	for lists+qemu-devel@lfdr.de; Mon, 27 Jun 2022 06:49:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41476)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o5ltL-0002LQ-6g
 for qemu-devel@nongnu.org; Mon, 27 Jun 2022 06:22:52 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:40848)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o5ltJ-0004tX-FP
 for qemu-devel@nongnu.org; Mon, 27 Jun 2022 06:22:50 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 v65-20020a1cac44000000b003a03c76fa38so4562710wme.5
 for <qemu-devel@nongnu.org>; Mon, 27 Jun 2022 03:22:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=wY3OykP5QHqWmEIls0rL9GmMD7xE9ejKcExTSvnF+xk=;
 b=Zf1v4eWRh/SE1p02CbKsz5aSK16JlJcMOyqii3YAU4v2aR2iXHmxCM5lliEvU+WIAg
 wuJj0d2nCePOfPYEyAj2VEwli0KqMcRaTVXUKLGHN80oTeWWwITV9lXCvYqJ+0dpEOhM
 YqZqxQWM/iWLnhdRNMEPvPaUWJ8mYx/3ftvu2ImULNRNpUbFaKAUCh+q/nVDYhhiAHc1
 2dycGIDJvmMlAfFc/qoYWwd5gjFzflCwQd7dHlxmETQ4AmrqijF41Tghppz1I5c2voLd
 3BTy+lZCdhXBO3xjdar36KpVYj7rXfAs8vm3EXGkMdBrr6yp72j6H1ic2Lvq6xwttD6E
 XXHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wY3OykP5QHqWmEIls0rL9GmMD7xE9ejKcExTSvnF+xk=;
 b=zwzJW42H+D+UBbFimTk/x7D4RAWrXNeZh31Q8DpJNBUzz1bLLkk3rHgt7tyCL3O8jl
 x2Vyodh7ZEdSTYWpWKmvChX2j0JDByxjuyjs00GdhJtuC1rnhDD6SML22LP7FbyxKO1I
 CaUts20vrEyuEBWCVPNi3AWFWBw5Hx5e+9+H0o2xVPN4MfaDL63qGP9mFd6DMtRuNlJ/
 qn2RrD0VE7T9smrC+egAe+m/g2fLARUhQEH5+LZZ3lQfdNNnkHpp4L96v7iRlog38SH9
 44gAJ0u58UiZ5hpWHK5zvmSXmezKcn+3hqA6WW98gZLm209us7XN/jXEosSETbNSfL5Z
 s5Yg==
X-Gm-Message-State: AJIora/uuOBA9hLefKUunXmbkwZTieCoeKZoxse7xnrEnWoX6zDeEXuE
 ydLasrJ0uQsdzsi4W08ZhuHKQmIhDWx8MA==
X-Google-Smtp-Source: AGRyM1sKaTTlAuxru2DCq3YDKpoyCPl6E4DTmv/OmMW3aYuSNUbXMl0pGtaA3/9gov4A3KXUO83GYQ==
X-Received: by 2002:a05:600c:3d8b:b0:3a0:466c:b08d with SMTP id
 bi11-20020a05600c3d8b00b003a0466cb08dmr8818225wmb.125.1656325367254; 
 Mon, 27 Jun 2022 03:22:47 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 d11-20020a5d6dcb000000b0020e6ce4dabdsm9754335wrz.103.2022.06.27.03.22.46
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jun 2022 03:22:46 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 12/25] target/arm: Add the SME ZA storage to CPUARMState
Date: Mon, 27 Jun 2022 11:22:23 +0100
Message-Id: <20220627102236.3097629-13-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220627102236.3097629-1-peter.maydell@linaro.org>
References: <20220627102236.3097629-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: Richard Henderson <richard.henderson@linaro.org>

Place this late in the resettable section of the structure,
to keep the most common element offsets from being > 64k.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220620175235.60881-10-richard.henderson@linaro.org
[PMM: expanded comment on zarray[] format]
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu.h     | 22 ++++++++++++++++++++++
 target/arm/machine.c | 34 ++++++++++++++++++++++++++++++++++
 2 files changed, 56 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 05d369e690a..52ab6f9bb99 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -694,6 +694,28 @@ typedef struct CPUArchState {
     } keys;
 
     uint64_t scxtnum_el[4];
+
+    /*
+     * SME ZA storage -- 256 x 256 byte array, with bytes in host word order,
+     * as we do with vfp.zregs[].  This corresponds to the architectural ZA
+     * array, where ZA[N] is in the least-significant bytes of env->zarray[N].
+     * When SVL is less than the architectural maximum, the accessible
+     * storage is restricted, such that if the SVL is X bytes the guest can
+     * see only the bottom X elements of zarray[], and only the least
+     * significant X bytes of each element of the array. (In other words,
+     * the observable part is always square.)
+     *
+     * The ZA storage can also be considered as a set of square tiles of
+     * elements of different sizes. The mapping from tiles to the ZA array
+     * is architecturally defined, such that for tiles of elements of esz
+     * bytes, the Nth row (or "horizontal slice") of tile T is in
+     * ZA[T + N * esz]. Note that this means that each tile is not contiguous
+     * in the ZA storage, because its rows are striped through the ZA array.
+     *
+     * Because this is so large, keep this toward the end of the reset area,
+     * to keep the offsets into the rest of the structure smaller.
+     */
+    ARMVectorReg zarray[ARM_MAX_VQ * 16];
 #endif
 
 #if defined(CONFIG_USER_ONLY)
diff --git a/target/arm/machine.c b/target/arm/machine.c
index 285e387d2c3..54c5c62433d 100644
--- a/target/arm/machine.c
+++ b/target/arm/machine.c
@@ -167,6 +167,39 @@ static const VMStateDescription vmstate_sve = {
         VMSTATE_END_OF_LIST()
     }
 };
+
+static const VMStateDescription vmstate_vreg = {
+    .name = "vreg",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .fields = (VMStateField[]) {
+        VMSTATE_UINT64_ARRAY(d, ARMVectorReg, ARM_MAX_VQ * 2),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
+static bool za_needed(void *opaque)
+{
+    ARMCPU *cpu = opaque;
+
+    /*
+     * When ZA storage is disabled, its contents are discarded.
+     * It will be zeroed when ZA storage is re-enabled.
+     */
+    return FIELD_EX64(cpu->env.svcr, SVCR, ZA);
+}
+
+static const VMStateDescription vmstate_za = {
+    .name = "cpu/sme",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .needed = za_needed,
+    .fields = (VMStateField[]) {
+        VMSTATE_STRUCT_ARRAY(env.zarray, ARMCPU, ARM_MAX_VQ * 16, 0,
+                             vmstate_vreg, ARMVectorReg),
+        VMSTATE_END_OF_LIST()
+    }
+};
 #endif /* AARCH64 */
 
 static bool serror_needed(void *opaque)
@@ -884,6 +917,7 @@ const VMStateDescription vmstate_arm_cpu = {
         &vmstate_m_security,
 #ifdef TARGET_AARCH64
         &vmstate_sve,
+        &vmstate_za,
 #endif
         &vmstate_serror,
         &vmstate_irq_line_state,
-- 
2.25.1


