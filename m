Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E5F639BC9F
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Jun 2021 18:10:54 +0200 (CEST)
Received: from localhost ([::1]:36928 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lpCPN-0003XS-D6
	for lists+qemu-devel@lfdr.de; Fri, 04 Jun 2021 12:10:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44952)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lpC8t-0003iU-Vj
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 11:53:52 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:35601)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lpC8k-0000FN-08
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 11:53:51 -0400
Received: by mail-wr1-x42b.google.com with SMTP id m18so9808618wrv.2
 for <qemu-devel@nongnu.org>; Fri, 04 Jun 2021 08:53:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5gJQqbGfLehWu6/WKjXXSxpXerROzKZPZuw1dGRbuWs=;
 b=ecI5C9iHpGahiuAd6kGHn2T1Vgm+O82KxDUcwAyMKnqWUORmt2zoxH498n4KK8Pmbs
 qfnhh8mUH35HxneeHDpcEaF/PjZfwvukOVx0lbCVg+fTCZqRwQFdnjYU0HvYOnmXH7ZZ
 cAICKEU71eYBaXKMOl9Ch/GcR0xjTCZgHwOW3LNPMB8ABrok3E5oTuUgwLDRu0G+e0zN
 hfOJgwGktA/O1MC2zqXfS1kwKunato2WTFHuIhJWqWCbDN4EGFpFVW6UAVW/E/oinmVB
 4jSd+pAtEyn5tfiSs8fhR6tmtkZtmUhEpyWARSOz4oZMqvQBAGSUCRzqv8tH/PoPeHVe
 AxbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5gJQqbGfLehWu6/WKjXXSxpXerROzKZPZuw1dGRbuWs=;
 b=E9RkODmx6pE+ymtoA5KcvJ9GXkd+ge4Nm+bd2YKPfgh1ogVZsp+VU3fKieXZTnn4Yz
 +zIjVr53pPxwfo25FEV5NK4+G7rQJ9dB1KTXCwv0vMnesxx1C6EwSMWWJHjt9RxqgD0W
 r0WrSefhyWk6njd5Omh4xgKrVo6AJ6J3QEowWrXFNFStKYdxHHkdg7XZgNxw62XPkIrQ
 6ntN90lcDIT0Rd19RoBaABke41oZIroTJVHtBxcjd5gU+bnTnFQBd9iZlsexQpUmZKI7
 J81s/MxqgJhyun3ND72NifrpCeGwgggEU8fw26kx1BhoQQ8jJPLZ02/6l858FBSauoXe
 Cy8Q==
X-Gm-Message-State: AOAM5304w6XQNwvXyUWic9kT+Sq7tNIryXRRBUgivMmRNPtLgtS8O952
 YVIeZ1GGiRi1dIXQ+VCtWZN3+A==
X-Google-Smtp-Source: ABdhPJy6FsJlKu+8lAGw7npdL0tsj5q5RDxAR5Y95f+MtvZ99/q5SzbuXO5UzRNL8+UcmBd8/f6HPA==
X-Received: by 2002:adf:fe8c:: with SMTP id l12mr4722858wrr.26.1622822020659; 
 Fri, 04 Jun 2021 08:53:40 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id a15sm8466956wrs.63.2021.06.04.08.53.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Jun 2021 08:53:31 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id E274D1FF96;
 Fri,  4 Jun 2021 16:53:21 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v16 75/99] target/arm: make is_aa64 and arm_el_is_aa64 a macro
 for !TARGET_AARCH64
Date: Fri,  4 Jun 2021 16:52:48 +0100
Message-Id: <20210604155312.15902-76-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210604155312.15902-1-alex.bennee@linaro.org>
References: <20210604155312.15902-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42b.google.com
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

when TARGET_AARCH64 is not defined, it is helpful to make
is_aa64() and arm_el_is_aa64 macros defined to "false".

This way we can make more code TARGET_AARCH64-only.

Signed-off-by: Claudio Fontana <cfontana@suse.de>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 target/arm/cpu.h | 37 ++++++++++++++++++++++++-------------
 1 file changed, 24 insertions(+), 13 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index b9b9bd8b01..8614948543 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1060,6 +1060,11 @@ void aarch64_sve_narrow_vq(CPUARMState *env, unsigned vq);
 void aarch64_sve_change_el(CPUARMState *env, int old_el,
                            int new_el, bool el0_a64);
 
+static inline bool is_a64(CPUARMState *env)
+{
+    return env->aarch64;
+}
+
 /*
  * SVE registers are encoded in KVM's memory in an endianness-invariant format.
  * The byte at offset i from the start of the in-memory representation contains
@@ -1089,7 +1094,10 @@ static inline void aarch64_sve_narrow_vq(CPUARMState *env, unsigned vq) { }
 static inline void aarch64_sve_change_el(CPUARMState *env, int o,
                                          int n, bool a)
 { }
-#endif
+
+#define is_a64(env) ((void)env, false)
+
+#endif /* TARGET_AARCH64 */
 
 void aarch64_sync_32_to_64(CPUARMState *env);
 void aarch64_sync_64_to_32(CPUARMState *env);
@@ -1098,11 +1106,6 @@ int fp_exception_el(CPUARMState *env, int cur_el);
 int sve_exception_el(CPUARMState *env, int cur_el);
 uint32_t sve_zcr_len_for_el(CPUARMState *env, int el);
 
-static inline bool is_a64(CPUARMState *env)
-{
-    return env->aarch64;
-}
-
 /* you can call this signal handler from your SIGBUS and SIGSEGV
    signal handlers to inform the virtual CPU of exceptions. non zero
    is returned if the signal was handled by the virtual CPU.  */
@@ -2212,13 +2215,7 @@ static inline bool arm_is_el2_enabled(CPUARMState *env)
 }
 #endif
 
-/**
- * arm_hcr_el2_eff(): Return the effective value of HCR_EL2.
- * E.g. when in secure state, fields in HCR_EL2 are suppressed,
- * "for all purposes other than a direct read or write access of HCR_EL2."
- * Not included here is HCR_RW.
- */
-uint64_t arm_hcr_el2_eff(CPUARMState *env);
+#ifdef TARGET_AARCH64
 
 /* Return true if the specified exception level is running in AArch64 state. */
 static inline bool arm_el_is_aa64(CPUARMState *env, int el)
@@ -2253,6 +2250,20 @@ static inline bool arm_el_is_aa64(CPUARMState *env, int el)
     return aa64;
 }
 
+#else
+
+#define arm_el_is_aa64(env, el) ((void)env, (void)el, false)
+
+#endif /* TARGET_AARCH64 */
+
+/**
+ * arm_hcr_el2_eff(): Return the effective value of HCR_EL2.
+ * E.g. when in secure state, fields in HCR_EL2 are suppressed,
+ * "for all purposes other than a direct read or write access of HCR_EL2."
+ * Not included here is HCR_RW.
+ */
+uint64_t arm_hcr_el2_eff(CPUARMState *env);
+
 /* Function for determing whether guest cp register reads and writes should
  * access the secure or non-secure bank of a cp register.  When EL3 is
  * operating in AArch32 state, the NS-bit determines whether the secure
-- 
2.20.1


