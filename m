Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2845239BF8B
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Jun 2021 20:25:33 +0200 (CEST)
Received: from localhost ([::1]:45092 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lpEVg-0000YO-5R
	for lists+qemu-devel@lfdr.de; Fri, 04 Jun 2021 14:25:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42348)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lpET3-0000sR-98
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 14:22:49 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:39770)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lpESx-0000LY-N6
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 14:22:49 -0400
Received: by mail-wr1-x42a.google.com with SMTP id l2so10209678wrw.6
 for <qemu-devel@nongnu.org>; Fri, 04 Jun 2021 11:22:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3KAvFYDicdu7I7b7IT8uHA37bMcceuspcA95AajAGsA=;
 b=GI+fjp4jLaxZpQN5torVy0zwYR8zaOzI5CHG5ZYstagfUGHVKfx2vkG8tBc80c1MTS
 yEu4K5O/KlfZzokVbggY5rqI3SamKAG2Jd4IxC7KYDgNiyq7WshXs8TCjGLall/vbl3u
 A4z5GfWxEy8ttjkyEsbVnOE0HRg8CgLcA6adD1R5oi8M9cVdD4rCZ3MrBDQ9ruDZWIoJ
 MXsSdReA35V17MlW1oR5TvWnwWmmt7MxKcLCOHn1MyZE2FjOVw67x1r4p4iWuJ5Mku42
 psh7l7mC0aogOtAMENmZoc7/xWlMx0CtdJAhckZXMSqXAKGg+K6921xWGcN5Vx+3UTmP
 wV/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3KAvFYDicdu7I7b7IT8uHA37bMcceuspcA95AajAGsA=;
 b=KxU6UQKumX4d6cNKhpbm+Iiox/UYgewgzbIs53tGKbYz2MNvu59Vs9LmG4EnTXODO2
 z8Hg06r7+BvAZhvkDwhODv4qclRNs7ah+HwJ/KAV4FZja6piCjp4ItwYWyIFmriWM4Xi
 0UWymeZXbszpfCo1fQ2jx16O/HhT64WRi67GeroliiCBiNFIQwftReAKGXguecuplwHA
 rOrhxhDpio3kNzKVzW4T1dhv51eAyK0r9eUZhojwyAIuujtbgQP8lUjJXbb5+V5fkQO2
 Bbm6W5orS0C3gtqB74M9Lb8D7/Lwt7WKxpB3zwHmwZPPsews6YHzEgyZdbsGevG7PzyP
 fgHg==
X-Gm-Message-State: AOAM5328ReBCStpr5r5kVuLWJwk3D7D66Kj8dyezAVEPZtK1aA5alN0/
 EwrxXhvVWEyq3ElQ/Em0lzoKlg==
X-Google-Smtp-Source: ABdhPJzIMCZIK0Z9HYPc827mDj2CuvEe9FxCKtHpWigzurSkYxSr/2ipMkGi5CaCpryxW1oRUf93QQ==
X-Received: by 2002:adf:d204:: with SMTP id j4mr5196908wrh.3.1622830962339;
 Fri, 04 Jun 2021 11:22:42 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id n9sm6505994wmc.20.2021.06.04.11.22.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Jun 2021 11:22:38 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 88BB61FFC5;
 Fri,  4 Jun 2021 16:53:18 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v16 46/99] target/arm: fix comments style of fp_exception_el
 before moving it
Date: Fri,  4 Jun 2021 16:52:19 +0100
Message-Id: <20210604155312.15902-47-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210604155312.15902-1-alex.bennee@linaro.org>
References: <20210604155312.15902-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42a.google.com
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

Signed-off-by: Claudio Fontana <cfontana@suse.de>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 target/arm/tcg/helper.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/target/arm/tcg/helper.c b/target/arm/tcg/helper.c
index 8372089260..d4cafdbd95 100644
--- a/target/arm/tcg/helper.c
+++ b/target/arm/tcg/helper.c
@@ -1625,13 +1625,15 @@ uint32_t HELPER(crc32c)(uint32_t acc, uint32_t val, uint32_t bytes)
     return crc32c(acc, buf, bytes) ^ 0xffffffff;
 }
 
-/* Return the exception level to which FP-disabled exceptions should
+/*
+ * Return the exception level to which FP-disabled exceptions should
  * be taken, or 0 if FP is enabled.
  */
 int fp_exception_el(CPUARMState *env, int cur_el)
 {
 #ifndef CONFIG_USER_ONLY
-    /* CPACR and the CPTR registers don't exist before v6, so FP is
+    /*
+     * CPACR and the CPTR registers don't exist before v6, so FP is
      * always accessible
      */
     if (!arm_feature(env, ARM_FEATURE_V6)) {
@@ -1654,7 +1656,8 @@ int fp_exception_el(CPUARMState *env, int cur_el)
         return 0;
     }
 
-    /* The CPACR controls traps to EL1, or PL1 if we're 32 bit:
+    /*
+     * The CPACR controls traps to EL1, or PL1 if we're 32 bit:
      * 0, 2 : trap EL0 and EL1/PL1 accesses
      * 1    : trap only EL0 accesses
      * 3    : trap no accesses
@@ -1701,7 +1704,8 @@ int fp_exception_el(CPUARMState *env, int cur_el)
         }
     }
 
-    /* For the CPTR registers we don't need to guard with an ARM_FEATURE
+    /*
+     * For the CPTR registers we don't need to guard with an ARM_FEATURE
      * check because zero bits in the registers mean "don't trap".
      */
 
-- 
2.20.1


