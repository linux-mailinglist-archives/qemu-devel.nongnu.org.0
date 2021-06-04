Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 173A139BE14
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Jun 2021 19:07:12 +0200 (CEST)
Received: from localhost ([::1]:59018 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lpDHr-0000rJ-5F
	for lists+qemu-devel@lfdr.de; Fri, 04 Jun 2021 13:07:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33232)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lpCkU-0007tH-Aj
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 12:32:42 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:39910)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lpCkS-00025T-DP
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 12:32:42 -0400
Received: by mail-wr1-x433.google.com with SMTP id l2so9930108wrw.6
 for <qemu-devel@nongnu.org>; Fri, 04 Jun 2021 09:32:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wznjsiz23B2i+j4Jb69yS0BiQR4HsYX/WkLwF6wNHTg=;
 b=X/drSWWOPGk5OgiTbAmO0AX/ImlgJgeiLiTuEI3GrTYxtsWCa/KhrhFcfqHuaGiULC
 FnJonLSWN+vIAfDYQV1TO71GTAvpagvy2GVS2n+KSw8xqZ/JmCFsvvsm9K4NqRImxeGq
 ZVKtjfMiYVSXdplnNicjULyqQHKCEjPrAmbpV6IfYEtvb8783qy/MUUO/WAjlm1TxXw9
 UbYL9zrI/fBeQs/VFQwuRrma9csH6q+tlCxl6d1jqHrwHpgDEIYJkI+PodB7xkPEl/6L
 upnvd1cJl64bdrqS+LEQ4ZS35SzlQs8ox7sI8BI/eldQOgXS2Kj0OKE+sVNfBdmwLx8t
 5cUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wznjsiz23B2i+j4Jb69yS0BiQR4HsYX/WkLwF6wNHTg=;
 b=KinOLTZwtxBEojrEzHSsACTSYRfTx1nK2B4APWfUXkB/ApcWl0sX+OFhqnm3/IhFCZ
 GmfDbq5cA3mtyecDWBLBYNVuoJjMfLAkvbMiAbpnrttVr+9L9Jtv0fzFT86DVUy09i08
 Ef+IRXmHrjrI69r4Ep2PY9CWGo3+yp3M1ugRdrD74TPNhclMWYkenhTeWnLhUUZkBCxp
 fGGXTrs60ZZ2hzwZ/FPWytxriIfSpLmDUKs8Uqwc2enAE3zcnnlpsmPvMjmBEBUVfwA1
 Mq4hxuhTkfEslV6ZsDfzQgzt/IAKUyh227NxKyNctUJC28qRvMiqMmlRqmzs/e0Ovn/c
 jyUQ==
X-Gm-Message-State: AOAM533jja/QIXnM2lfPgUj9RqY7i3vyDRBE92D4/R54WDsaFQA3cgI9
 qGviOayNMhlioYrdW/4y13cLsQ==
X-Google-Smtp-Source: ABdhPJyf4YrHSwNuI6nmyErgckfo7XyTL62AryAaML8Yp0U9dt439tUai+DM77ySCNBksXzkBMy7EA==
X-Received: by 2002:adf:df86:: with SMTP id z6mr4798136wrl.255.1622824359086; 
 Fri, 04 Jun 2021 09:32:39 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id a77sm7630225wmd.14.2021.06.04.09.32.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Jun 2021 09:32:37 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 4A9B41FFCC;
 Fri,  4 Jun 2021 16:53:19 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v16 53/99] target/arm: replace CONFIG_TCG with tcg_enabled
Date: Fri,  4 Jun 2021 16:52:26 +0100
Message-Id: <20210604155312.15902-54-alex.bennee@linaro.org>
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

for "all" builds (tcg + kvm), we want to avoid doing
the psci and semihosting checks if tcg is built-in, but not enabled.

Signed-off-by: Claudio Fontana <cfontana@suse.de>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 target/arm/cpu-sysemu.c | 30 +++++++++++++++---------------
 1 file changed, 15 insertions(+), 15 deletions(-)

diff --git a/target/arm/cpu-sysemu.c b/target/arm/cpu-sysemu.c
index 7569241339..e83d55b9f7 100644
--- a/target/arm/cpu-sysemu.c
+++ b/target/arm/cpu-sysemu.c
@@ -1141,22 +1141,22 @@ void arm_cpu_do_interrupt(CPUState *cs)
                       env->exception.syndrome);
     }
 
-#ifdef CONFIG_TCG
-    if (arm_is_psci_call(cpu, cs->exception_index)) {
-        arm_handle_psci_call(cpu);
-        qemu_log_mask(CPU_LOG_INT, "...handled as PSCI call\n");
-        return;
-    }
-    /*
-     * Semihosting semantics depend on the register width of the code
-     * that caused the exception, not the target exception level, so
-     * must be handled here.
-     */
-    if (cs->exception_index == EXCP_SEMIHOST) {
-        tcg_handle_semihosting(cs);
-        return;
+    if (tcg_enabled()) {
+        if (arm_is_psci_call(cpu, cs->exception_index)) {
+            arm_handle_psci_call(cpu);
+            qemu_log_mask(CPU_LOG_INT, "...handled as PSCI call\n");
+            return;
+        }
+        /*
+         * Semihosting semantics depend on the register width of the code
+         * that caused the exception, not the target exception level, so
+         * must be handled here.
+         */
+        if (cs->exception_index == EXCP_SEMIHOST) {
+            tcg_handle_semihosting(cs);
+            return;
+        }
     }
-#endif /* CONFIG_TCG */
     /*
      * Hooks may change global state so BQL should be held, also the
      * BQL needs to be held for any modification of
-- 
2.20.1


