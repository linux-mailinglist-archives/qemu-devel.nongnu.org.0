Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A91A139BEEB
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Jun 2021 19:36:18 +0200 (CEST)
Received: from localhost ([::1]:43926 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lpDk1-0001qE-PF
	for lists+qemu-devel@lfdr.de; Fri, 04 Jun 2021 13:36:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48794)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lpDNM-0008H3-2f
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 13:12:52 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:39725)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lpDNH-00023P-GO
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 13:12:51 -0400
Received: by mail-wr1-x429.google.com with SMTP id l2so10038197wrw.6
 for <qemu-devel@nongnu.org>; Fri, 04 Jun 2021 10:12:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OyxWPhUmqlvRtQOK1rZ3n99TcV2f8SKQ96wxoL9+DN8=;
 b=BxJmN116dfKYjZlKy++1ajEbL+naUiUruIVUyq8HsrKkI6C0E7jmcGmI8pmBI1wMG8
 Rlh+HwvqY/rvxOoJIlbTbh+Vn+kMpRkW15OcCvehSorYhBcTuw4lFOI4/+N96hWofZM8
 Ri5mDsKDgsv/jrhl5/byOg+z3E6nI2lq9wSKQ089gRAX88RSQolz19OafQio39zb1TBO
 AxSaL0smXJ3xdXH5FsJKfSjXdKfdfdFN+PaXtuqwmLmydASyCcCBu/OrpKXCD+okm/K5
 8BOTkdDMCysUG7CbZiMnsgc4YjYKR5fYc5IG44GjxbtY+8fltKkhxK54vNaEPhIx51Ic
 H1Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OyxWPhUmqlvRtQOK1rZ3n99TcV2f8SKQ96wxoL9+DN8=;
 b=hNzHQWD7qtz1H9Rc0mjtiLNRa2AAugpo24Drd+7DRF/5kwr5Wc++0TJ8RpO6ybUXn5
 rjv+wepZ9B23jrxHBO0c9HtuK9hfwMc6iGZ34gzX3nPcNaSPhbML4oslGyGB1IGyTLYE
 ttOwK0v5T92moVccdUqoC/j0Si3LktixXa6WQA2o2NWjZFoLdjzOvaPygq4CGtamjLLk
 O8VfLMjjKWi/MtYr9v4H9LF7ZM7TeFY3TtPb3VU++0dQ2iWSyZ+2NLIZ+SNQq6F1KMzD
 7h58be7+Ol6zJkwpKGyJ6KIvAwW+WTuqmfIl9gx+fSXaAirjKEvHG1QseYCkBSd3Ogjo
 vtwg==
X-Gm-Message-State: AOAM533+Q35M+Y6SMRFx6gS9SJ3xqXjfXOdoIBGcd+EMQ+nvkVBb4lAg
 ZSiGiUb88J+XiGTpjWJzBclKZQ==
X-Google-Smtp-Source: ABdhPJyu0IeJSDouvD43+NpgBUFrxcj0SOFXdYpom/GmLalQzpOxhKMSeQYEKwRG4qS6BA6VKkNtJw==
X-Received: by 2002:a5d:4f8f:: with SMTP id d15mr4815833wru.85.1622826764825; 
 Fri, 04 Jun 2021 10:12:44 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id m132sm6351030wmf.10.2021.06.04.10.12.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Jun 2021 10:12:38 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id CAC8E1FFE6;
 Fri,  4 Jun 2021 16:53:21 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v16 74/99] target/arm: cpu-sve: make cpu_sve_finalize_features
 return bool
Date: Fri,  4 Jun 2021 16:52:47 +0100
Message-Id: <20210604155312.15902-75-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210604155312.15902-1-alex.bennee@linaro.org>
References: <20210604155312.15902-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x429.google.com
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

return false on error, true on success.

Signed-off-by: Claudio Fontana <cfontana@suse.de>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 target/arm/cpu-sve.h |  2 +-
 target/arm/cpu-sve.c | 17 +++++++++--------
 target/arm/cpu.c     |  3 +--
 3 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/target/arm/cpu-sve.h b/target/arm/cpu-sve.h
index ece36d2a0c..6ab74b1d8f 100644
--- a/target/arm/cpu-sve.h
+++ b/target/arm/cpu-sve.h
@@ -26,7 +26,7 @@
 #include "cpu.h"
 
 /* called by arm_cpu_finalize_features in realizefn */
-void cpu_sve_finalize_features(ARMCPU *cpu, Error **errp);
+bool cpu_sve_finalize_features(ARMCPU *cpu, Error **errp);
 
 /* add the CPU SVE properties */
 void cpu_sve_add_props(Object *obj);
diff --git a/target/arm/cpu-sve.c b/target/arm/cpu-sve.c
index 5190e4a639..24bffbba8b 100644
--- a/target/arm/cpu-sve.c
+++ b/target/arm/cpu-sve.c
@@ -49,7 +49,7 @@ static bool apply_max_vq(unsigned long *sve_vq_map, unsigned long *sve_vq_init,
     return true;
 }
 
-void cpu_sve_finalize_features(ARMCPU *cpu, Error **errp)
+bool cpu_sve_finalize_features(ARMCPU *cpu, Error **errp)
 {
     /*
      * If any vector lengths are explicitly enabled with sve<N> properties,
@@ -86,7 +86,7 @@ void cpu_sve_finalize_features(ARMCPU *cpu, Error **errp)
                               "length, sve-max-vq=%d (%d bits)\n",
                               max_vq * 128, cpu->sve_max_vq,
                               cpu->sve_max_vq * 128);
-            return;
+            return false;
         }
         if (kvm_enabled()) {
             kvm_sve_enable_lens(cpu->sve_vq_map, cpu->sve_vq_init, max_vq,
@@ -98,7 +98,7 @@ void cpu_sve_finalize_features(ARMCPU *cpu, Error **errp)
         /* No explicit bits enabled, and no implicit bits from sve-max-vq. */
         if (!cpu_isar_feature(aa64_sve, cpu)) {
             /* SVE is disabled and so are all vector lengths.  Good. */
-            return;
+            return true;
         }
         if (kvm_enabled()) {
             max_vq = kvm_sve_disable_lens(cpu->sve_vq_map, cpu->sve_vq_init,
@@ -108,7 +108,7 @@ void cpu_sve_finalize_features(ARMCPU *cpu, Error **errp)
                                           errp);
         }
         if (!max_vq) {
-            return;
+            return false;
         }
         max_vq = find_last_bit(cpu->sve_vq_map, max_vq) + 1;
     }
@@ -122,7 +122,7 @@ void cpu_sve_finalize_features(ARMCPU *cpu, Error **errp)
         max_vq = cpu->sve_max_vq;
         if (!apply_max_vq(cpu->sve_vq_map, cpu->sve_vq_init, max_vq,
                           errp)) {
-            return;
+            return false;
         }
     }
     /*
@@ -136,11 +136,11 @@ void cpu_sve_finalize_features(ARMCPU *cpu, Error **errp)
     if (kvm_enabled()) {
         if (!kvm_sve_validate_lens(cpu->sve_vq_map, max_vq, kvm_supported,
                                    errp, cpu->sve_max_vq)) {
-            return;
+            return false;
         }
     } else if (tcg_enabled()) {
         if (!tcg_sve_validate_lens(cpu->sve_vq_map, max_vq, errp)) {
-            return;
+            return false;
         }
     }
 
@@ -153,11 +153,12 @@ void cpu_sve_finalize_features(ARMCPU *cpu, Error **errp)
         error_append_hint(errp, "SVE must be enabled to enable vector "
                           "lengths.\n");
         error_append_hint(errp, "Add sve=on to the CPU property list.\n");
-        return;
+        return false;
     }
 
     /* From now on sve_max_vq is the actual maximum supported length. */
     cpu->sve_max_vq = max_vq;
+    return true;
 }
 
 static void get_prop_max_vq(Object *obj, Visitor *v, const char *name,
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index e4ad92ffec..0b20faaca0 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -821,8 +821,7 @@ void arm_cpu_finalize_features(ARMCPU *cpu, Error **errp)
 
 #ifdef TARGET_AARCH64
     if (arm_feature(&cpu->env, ARM_FEATURE_AARCH64)) {
-        cpu_sve_finalize_features(cpu, &local_err);
-        if (local_err != NULL) {
+        if (!cpu_sve_finalize_features(cpu, &local_err)) {
             error_propagate(errp, local_err);
             return;
         }
-- 
2.20.1


