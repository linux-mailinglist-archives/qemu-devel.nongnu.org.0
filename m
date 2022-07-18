Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C4DFC578545
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jul 2022 16:24:28 +0200 (CEST)
Received: from localhost ([::1]:59712 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDRff-0000xW-RU
	for lists+qemu-devel@lfdr.de; Mon, 18 Jul 2022 10:24:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51662)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oDRHW-00026W-AF
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 09:59:33 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:42786)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oDRHT-0003A4-K4
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 09:59:29 -0400
Received: by mail-wr1-x432.google.com with SMTP id bu1so17166499wrb.9
 for <qemu-devel@nongnu.org>; Mon, 18 Jul 2022 06:59:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=jUzTz5s5zsxreDDQya4YCpzbBiN04ee02WSt0TzEGbo=;
 b=eaOPIy9/HReAEhFwDTbs+kBLOGSrlLv3Q1A+LuwuTfCxmfWtdmjG3xh7F0MMaFt8k5
 ZmDXv265ipb0z9lLjm3nIp7veqrRM7bDrkF4FGj3PZjLD7I9IWpQa/t96MXRnojxcICT
 W2S6hUqIK50jeg4aC8DDj5VBx/aqSPg23A4wkGZ7dbClrZPZl6IYcXme7ZlyL278FjEK
 Skxs/dwpbpP8/RaShOKbftrK6gfh2PjuB0dC/6pnGcgkMrqpHdPKaozoBjVaMTRfRXL4
 r9GLyKXHoValPdxdBdhIlNISTW5AeyEVaJNgkShOJbwyfoz1T8eM096BD5Vvi7811AZj
 PNjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jUzTz5s5zsxreDDQya4YCpzbBiN04ee02WSt0TzEGbo=;
 b=yPKhEurJqzwQFb4VcrelpRy84B/86o2qwGDjfDhtkOjaxA2FsHeAB6Ku65yEpSh+5g
 4lJJ8RXbGwtP3Phq48iw73elxFcf9oD8gK5clahItE8N9Za5v1EJ24PzPEBFOfe/D2VY
 OZGsAYpDlbcmY9I87v2K+Ov9llP11+t1x0Mzkr86EAhlbSUIMpdZucM1zSrp7Wmki+XH
 GRTnWhGAs/KvOhj2Q8lMkOloEA7QU7M/TKwUgUkDgmalq5fP1a3kHVCpe2zxSIc3uZau
 AiDKRXuIRst7243QOVxbDMuwYo16SkkwAcASQXbWEk4L5cO0n8uSjCoUu5VlpmIxgK/k
 P3aA==
X-Gm-Message-State: AJIora+JuFFY+W1wHO48k7nKatuYrcBsWrFw2svvZglpY8oCprJGwPMp
 GXpF4Y6zvuXMPbAJ+MmLBiAx6D1ZuUwXpw==
X-Google-Smtp-Source: AGRyM1uEJubVUbx139wvBt3Mm91v+XC6YkJTNRFQOeUjQvek7NfvlaElBr8dHroi1yUeLOLG6duMNA==
X-Received: by 2002:a5d:5586:0:b0:21e:294d:6003 with SMTP id
 i6-20020a5d5586000000b0021e294d6003mr1177366wrv.595.1658152766212; 
 Mon, 18 Jul 2022 06:59:26 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 id15-20020a05600ca18f00b003a31f1edfa7sm1805798wmb.41.2022.07.18.06.59.25
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Jul 2022 06:59:25 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 03/15] target/arm: Fix aarch64_sve_change_el for SME
Date: Mon, 18 Jul 2022 14:59:08 +0100
Message-Id: <20220718135920.13667-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220718135920.13667-1-peter.maydell@linaro.org>
References: <20220718135920.13667-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x432.google.com
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

We were only checking for SVE disabled and not taking into
account PSTATE.SM to check SME disabled, which resulted in
vectors being incorrectly truncated.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220713045848.217364-3-richard.henderson@linaro.org
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper.c | 31 +++++++++++++++++++++++++------
 1 file changed, 25 insertions(+), 6 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 6fff7fc64fd..24c45a9bf31 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -11228,6 +11228,21 @@ void aarch64_sve_narrow_vq(CPUARMState *env, unsigned vq)
     }
 }
 
+static uint32_t sve_vqm1_for_el_sm_ena(CPUARMState *env, int el, bool sm)
+{
+    int exc_el;
+
+    if (sm) {
+        exc_el = sme_exception_el(env, el);
+    } else {
+        exc_el = sve_exception_el(env, el);
+    }
+    if (exc_el) {
+        return 0; /* disabled */
+    }
+    return sve_vqm1_for_el_sm(env, el, sm);
+}
+
 /*
  * Notice a change in SVE vector size when changing EL.
  */
@@ -11236,7 +11251,7 @@ void aarch64_sve_change_el(CPUARMState *env, int old_el,
 {
     ARMCPU *cpu = env_archcpu(env);
     int old_len, new_len;
-    bool old_a64, new_a64;
+    bool old_a64, new_a64, sm;
 
     /* Nothing to do if no SVE.  */
     if (!cpu_isar_feature(aa64_sve, cpu)) {
@@ -11256,7 +11271,8 @@ void aarch64_sve_change_el(CPUARMState *env, int old_el,
      * invoke ResetSVEState when taking an exception from, or
      * returning to, AArch32 state when PSTATE.SM is enabled.
      */
-    if (old_a64 != new_a64 && FIELD_EX64(env->svcr, SVCR, SM)) {
+    sm = FIELD_EX64(env->svcr, SVCR, SM);
+    if (old_a64 != new_a64 && sm) {
         arm_reset_sve_state(env);
         return;
     }
@@ -11273,10 +11289,13 @@ void aarch64_sve_change_el(CPUARMState *env, int old_el,
      * we already have the correct register contents when encountering the
      * vq0->vq0 transition between EL0->EL1.
      */
-    old_len = (old_a64 && !sve_exception_el(env, old_el)
-               ? sve_vqm1_for_el(env, old_el) : 0);
-    new_len = (new_a64 && !sve_exception_el(env, new_el)
-               ? sve_vqm1_for_el(env, new_el) : 0);
+    old_len = new_len = 0;
+    if (old_a64) {
+        old_len = sve_vqm1_for_el_sm_ena(env, old_el, sm);
+    }
+    if (new_a64) {
+        new_len = sve_vqm1_for_el_sm_ena(env, new_el, sm);
+    }
 
     /* When changing vector length, clear inaccessible state.  */
     if (new_len < old_len) {
-- 
2.25.1


