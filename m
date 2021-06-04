Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 725EC39BCE4
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Jun 2021 18:18:57 +0200 (CEST)
Received: from localhost ([::1]:36222 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lpCXA-0006Xu-Dy
	for lists+qemu-devel@lfdr.de; Fri, 04 Jun 2021 12:18:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44772)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lpC8i-0003N3-Cc
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 11:53:40 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:39548)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lpC8f-0000CU-T8
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 11:53:40 -0400
Received: by mail-wr1-x430.google.com with SMTP id l2so9813729wrw.6
 for <qemu-devel@nongnu.org>; Fri, 04 Jun 2021 08:53:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OSMTOGHNpqVDrWKBS5w0Ojq5CsCdFRCX6CpyFDgYeFE=;
 b=q96mASnmKRNkqqhVOYy6ncNg91A9TgllizfE3UQXVyrVQTEaj59noi+dbN5AEB+xiK
 /vLyjGF1Ca6+MWWN8Zw3rq2r6y2/DDgcmaJCyaJcHo6bDP9IRzP74GY883jjJMDsFkD6
 lbrANKs83N+VL6uOjwRHtNmyH8+W65mYrC5/zsET5nqKm9Z6ue50xz8nMrvEe8kVr0R9
 eSf7ib1cCBsHKLgH9aBt/TQq/byC9dZsXgs5KSnXaASbI2MAsq8w0PZAn3ejFOTwjIKT
 cW6laUC1Brf5x6i49QKPHs8Ld4NxngS1p+4L1MMhH78l0RSrORs1YeFksfmp35tUFGIW
 n1uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OSMTOGHNpqVDrWKBS5w0Ojq5CsCdFRCX6CpyFDgYeFE=;
 b=bVxSKEzkjxNPMVKYoLdolsrI0ouUWJZx4o/riAOtppvjPL7NowraaGGyEg5rDVFe9v
 gk/+LiwI4Y8DHJ9OatKB+X9OK3nuflv7K0MESBXbIMe+s91b2lpKGo+XbCGzzQpELDba
 vQICLxfFvl5spUq01qkE+xRLoi3ILRoVfBP1HVx1jrvXZj/RmjXiItVRy/PfTaM6OpKO
 FbogMKDIYOLgWazIx+CING9zLBV92wYjuKKgccgcW80gD4iuMy3tLXsOpb76tVkUW+S+
 CXqWlAvw/GxE2fn4EC+OYjbE1JkcdxKt5GSdNy9DLAt0VE6z6cTo1Ru1xEY/2+MtZkuF
 0zEQ==
X-Gm-Message-State: AOAM5319Ok9EuqbjA4f3yhBBE05DDIZGAwbPbsTKGnZjYrUF34kBfbKO
 2IziLB8GGwJiPE2P8Nl9WYp2ew==
X-Google-Smtp-Source: ABdhPJwE1gdhJQDlppCfA0gwvjff3MrrRQaDYGxVmJShahLLeJIZdrZqNni2pljsw6NjIRIWrxbiLw==
X-Received: by 2002:a5d:6546:: with SMTP id z6mr4683184wrv.100.1622822016391; 
 Fri, 04 Jun 2021 08:53:36 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id x10sm7152427wrt.65.2021.06.04.08.53.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Jun 2021 08:53:31 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 5572F20006;
 Fri,  4 Jun 2021 16:53:23 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v16 86/99] target/arm: cpu-pauth: change
 arm_cpu_pauth_finalize name and sig
Date: Fri,  4 Jun 2021 16:52:59 +0100
Message-Id: <20210604155312.15902-87-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210604155312.15902-1-alex.bennee@linaro.org>
References: <20210604155312.15902-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x430.google.com
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

make arm_cpu_pauth_finalize return a bool,
and make the name canonical for the module (cpu_pauth_finalize).

Signed-off-by: Claudio Fontana <cfontana@suse.de>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 target/arm/tcg/cpu-pauth.h | 2 +-
 target/arm/cpu.c           | 3 +--
 target/arm/tcg/cpu-pauth.c | 5 ++++-
 3 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/target/arm/tcg/cpu-pauth.h b/target/arm/tcg/cpu-pauth.h
index af127876fe..a0ef74dc77 100644
--- a/target/arm/tcg/cpu-pauth.h
+++ b/target/arm/tcg/cpu-pauth.h
@@ -26,7 +26,7 @@
 #include "cpu.h"
 
 /* called by arm_cpu_finalize_features in realizefn */
-void arm_cpu_pauth_finalize(ARMCPU *cpu, Error **errp);
+bool cpu_pauth_finalize(ARMCPU *cpu, Error **errp);
 
 /* add the CPU Pointer Authentication properties */
 void cpu_pauth_add_props(Object *obj);
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 5359331bff..8709c11784 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -837,8 +837,7 @@ void arm_cpu_finalize_features(ARMCPU *cpu, Error **errp)
          * is in use, so the user will not be able to set them.
          */
         if (tcg_enabled()) {
-            arm_cpu_pauth_finalize(cpu, &local_err);
-            if (local_err != NULL) {
+            if (!cpu_pauth_finalize(cpu, &local_err)) {
                 error_propagate(errp, local_err);
                 return;
             }
diff --git a/target/arm/tcg/cpu-pauth.c b/target/arm/tcg/cpu-pauth.c
index f821087b14..4f087923ac 100644
--- a/target/arm/tcg/cpu-pauth.c
+++ b/target/arm/tcg/cpu-pauth.c
@@ -25,8 +25,9 @@
 #include "tcg/cpu-pauth.h"
 #include "hw/qdev-properties.h"
 
-void arm_cpu_pauth_finalize(ARMCPU *cpu, Error **errp)
+bool cpu_pauth_finalize(ARMCPU *cpu, Error **errp)
 {
+    bool result = true;
     int arch_val = 0, impdef_val = 0;
     uint64_t t;
 
@@ -40,6 +41,7 @@ void arm_cpu_pauth_finalize(ARMCPU *cpu, Error **errp)
     } else if (cpu->prop_pauth_impdef) {
         error_setg(errp, "cannot enable pauth-impdef without pauth");
         error_append_hint(errp, "Add pauth=on to the CPU property list.\n");
+        result = false;
     }
 
     t = cpu->isar.id_aa64isar1;
@@ -48,6 +50,7 @@ void arm_cpu_pauth_finalize(ARMCPU *cpu, Error **errp)
     t = FIELD_DP64(t, ID_AA64ISAR1, API, impdef_val);
     t = FIELD_DP64(t, ID_AA64ISAR1, GPI, impdef_val);
     cpu->isar.id_aa64isar1 = t;
+    return result;
 }
 
 static Property arm_cpu_pauth_property =
-- 
2.20.1


