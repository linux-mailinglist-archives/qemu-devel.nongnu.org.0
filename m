Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E829639BEA2
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Jun 2021 19:26:19 +0200 (CEST)
Received: from localhost ([::1]:40724 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lpDaM-0005fC-J1
	for lists+qemu-devel@lfdr.de; Fri, 04 Jun 2021 13:26:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33840)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lpCkx-0000Ob-3A
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 12:33:11 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:40802)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lpCkj-0002E0-EN
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 12:33:10 -0400
Received: by mail-wr1-x431.google.com with SMTP id y7so5278165wrh.7
 for <qemu-devel@nongnu.org>; Fri, 04 Jun 2021 09:32:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TGls5/xkSiHs03kC6I1GwTGP4oM62lUtA402V/b7XoA=;
 b=AWlGkHoBjDmLboTSeIgJAIFnHs3uSzsXAglphhqsOnLeoWXAk5rJpXknTQnefHCY8O
 tPvsg6BCnNmX/N/65jZpUL/4uUuTJnLkAsLnBxIw4tA4rJcNW325hSpJTS5yzMdmFSd0
 rRh/uxrr5nfzHz1H5Wyk53vIFqfts2LzIHAgYdUp+M8Zh/jbtY4qkVU+BrKPW7RwVFLU
 le4/tX1K8l+oQS7P0pO4qIO9phPrv6X/MLN8YD4NU+3ukWxnWynWSmV0Ayp5TPB6D6gh
 laI0jpB8AmZwo4DKpltJTN+Hu/J339fcOFJGxxM4iTSA4AzPIpDnRnp0D0o4j2pfCSZo
 wvuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TGls5/xkSiHs03kC6I1GwTGP4oM62lUtA402V/b7XoA=;
 b=UcrMmBuQt8hIq/FGWm/j0laQWKCjoAh7hd6gO7lhxV7TshJVgynIBzr5k8r+aQ0hxl
 B6+1tKlu5V5c9zO0eu56RxuONSBVZgrxLeUtFTe4wXBicq4ANL5aehk6EMO4Ly9VFJGs
 qGeXIu/siZgL7It84GtXSTjKI9FV0k76MSFP3vgx8UEIK/tJZ5j55xmJ7BGYK8MuNO8h
 +dswEAocVIY7BpIJW167T1aiy/b6qGnqU39QrQvFyBKvAAuKkgK7KCvSkCK75WB4ch4m
 wr0aX4nvbmH3oNjsZvdi9+gxknuHwn+mxrxVRHsURBIEqu2OLRRIwZQsvaNZ2Q/kPirO
 KZrg==
X-Gm-Message-State: AOAM530ZrGfhIjNZAGIghKY2tTcTqssYpGjMRjQDA+TLqkSOjWPg2g2x
 +c+yvhl7zp2QHl9FapY3RS9COQ==
X-Google-Smtp-Source: ABdhPJzbo3W+julGBk+CbWKKadH49wN6Yl1QZyP9dZ29zTzVpGlEHvkazrJr6hAKX05FmzGwncqO2A==
X-Received: by 2002:a5d:6e92:: with SMTP id k18mr4873333wrz.94.1622824375706; 
 Fri, 04 Jun 2021 09:32:55 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id z188sm6319994wme.38.2021.06.04.09.32.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Jun 2021 09:32:51 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id CDBD01FFC8;
 Fri,  4 Jun 2021 16:53:18 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v16 49/99] target/arm: make further preparation for the
 exception code to move
Date: Fri,  4 Jun 2021 16:52:22 +0100
Message-Id: <20210604155312.15902-50-alex.bennee@linaro.org>
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Claudio Fontana <cfontana@suse.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Claudio Fontana <cfontana@suse.de>

the exception code in tcg/ needs some adjustment before being exposed
to KVM-only builds. We need to call arm_rebuild_hflags only when
TCG is enabled, or we will error out.

The direct call to helper_rebuild_hflags_a64(env, new_el) will not
be possible when extracting out to common code,
it seems safe to replace it with a call to arm_rebuild_hflags, since
the write to pstate is already done.

Also, some CONFIG_TCG needs to be extended further, so that all
the tcg-only code is marked as such.

Signed-off-by: Claudio Fontana <cfontana@suse.de>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 target/arm/tcg/helper.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/target/arm/tcg/helper.c b/target/arm/tcg/helper.c
index e55209491f..7a9eaec5cb 100644
--- a/target/arm/tcg/helper.c
+++ b/target/arm/tcg/helper.c
@@ -755,7 +755,9 @@ static void take_aarch32_exception(CPUARMState *env, int new_mode,
         env->regs[14] = env->regs[15] + offset;
     }
     env->regs[15] = newpc;
-    arm_rebuild_hflags(env);
+    if (tcg_enabled()) {
+        arm_rebuild_hflags(env);
+    }
 }
 
 static void arm_cpu_do_interrupt_aarch32_hyp(CPUState *cs)
@@ -1242,7 +1244,11 @@ static void arm_cpu_do_interrupt_aarch64(CPUState *cs)
     pstate_write(env, PSTATE_DAIF | new_mode);
     env->aarch64 = 1;
     aarch64_restore_sp(env, new_el);
-    helper_rebuild_hflags_a64(env, new_el);
+
+    if (tcg_enabled()) {
+        /* pstate already written, so we can use arm_rebuild_hflags here */
+        arm_rebuild_hflags(env);
+    }
 
     env->pc = addr;
 
@@ -1306,6 +1312,7 @@ void arm_cpu_do_interrupt(CPUState *cs)
                       env->exception.syndrome);
     }
 
+#ifdef CONFIG_TCG
     if (arm_is_psci_call(cpu, cs->exception_index)) {
         arm_handle_psci_call(cpu);
         qemu_log_mask(CPU_LOG_INT, "...handled as PSCI call\n");
@@ -1317,7 +1324,6 @@ void arm_cpu_do_interrupt(CPUState *cs)
      * that caused the exception, not the target exception level, so
      * must be handled here.
      */
-#ifdef CONFIG_TCG
     if (cs->exception_index == EXCP_SEMIHOST) {
         handle_semihosting(cs);
         return;
-- 
2.20.1


