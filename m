Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 111C7BF952
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Sep 2019 20:39:52 +0200 (CEST)
Received: from localhost ([::1]:42584 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iDYgA-0001Dr-8n
	for lists+qemu-devel@lfdr.de; Thu, 26 Sep 2019 14:39:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41864)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alex.bennee@linaro.org>) id 1iDYcQ-0007ru-HJ
 for qemu-devel@nongnu.org; Thu, 26 Sep 2019 14:35:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.bennee@linaro.org>) id 1iDYcO-0006Ky-SP
 for qemu-devel@nongnu.org; Thu, 26 Sep 2019 14:35:57 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:38631)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
 id 1iDYcO-0006Jk-Ir
 for qemu-devel@nongnu.org; Thu, 26 Sep 2019 14:35:56 -0400
Received: by mail-wm1-x332.google.com with SMTP id 3so3631360wmi.3
 for <qemu-devel@nongnu.org>; Thu, 26 Sep 2019 11:35:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=I9t9HbRAChyL469lXJJXjoiJvXFmRmv+kGwIMQEV8U8=;
 b=tPw6Y/WqcXL/SjU6+KxPpPvn/bwwPTHRjfbrjvQ6bE4Jg/YbmlaRoxcQL2NG9OMIr/
 kGEzAjBr637DO2J9dkcesa4sfJuw9HNW/gKiBOslJO3XFAdIPSdbG51/c2bB2bm26q/t
 Mg3kYbi3NAVXXOmGJPeTQ+D+tyXJ5AV0Gux0AfpaIvplekvRQtJtuzP6oL71AITrbKkN
 rjfPJHr4G2uTcvY5kmvf45Yd48k52eyjndLmzzLyD/ET2ogu8a9XnD9nOkP696QyF9r9
 8NfLyR5/4bJIRdVtX33ptB17uOPkf7//0UXbXxdufo9++5WBh9qJDdNCmC0Ha+s74WUU
 d5XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=I9t9HbRAChyL469lXJJXjoiJvXFmRmv+kGwIMQEV8U8=;
 b=mZxwEOgOmBf6bA2FztxOiIC4xja8+goW3zROjcRI+oz1oSu5nNagnSZtt76AbDBciA
 3mPLtKOQKCTEkHSASaNh6wqcmbFUPwV4hly/fWoBAm3LWbHicsh/nqsYPaKt+GAG2jSe
 ZiOr+ZFGgzpxk1ZJ17iTfHQKIUJFlhHgxEeLCvvJLL3p3fBr/ZKqiF7x5xnrvqRwfYMM
 oeAKquEXOKzJGtFXpye4aRdosrRWaPhGKV3wnYYe8YVnKiLhOGIrKslp+0ETJooYpowE
 HmNF5Lv4RgeIwF+9dpPKCsvAPmWX96qNxAtzeqcH1En6QQ74rwKTRp4cbkJbaKIV37oh
 1TnA==
X-Gm-Message-State: APjAAAVCmAdlb2OW6iWH3no6h0/FLTXCB1kMrAxr9NdXyjhIsiRmVrIx
 YvbAvcq35GBeaNirUIgmJ0TUKQ==
X-Google-Smtp-Source: APXvYqyHBhl+D+MQ3i6sJm1zbwQP9DnO8kNO0/zpGVFt10wd6WIgoFYtxxXUxifcnylkAohVlTNbvA==
X-Received: by 2002:a05:600c:2386:: with SMTP id
 m6mr4280563wma.164.1569522954555; 
 Thu, 26 Sep 2019 11:35:54 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id r7sm21296wrx.87.2019.09.26.11.35.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Sep 2019 11:35:53 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 5020F1FF8C;
 Thu, 26 Sep 2019 19:35:53 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 01/28] target/alpha: Use array for FPCR_DYN conversion
Date: Thu, 26 Sep 2019 19:35:26 +0100
Message-Id: <20190926183553.13895-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190926183553.13895-1-alex.bennee@linaro.org>
References: <20190926183553.13895-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::332
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
 Richard Henderson <rth@twiddle.net>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

This is a bit more straight-forward than using a switch statement.
No functional change.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20190921043256.4575-2-richard.henderson@linaro.org>

diff --git a/target/alpha/helper.c b/target/alpha/helper.c
index 19cda0a2db..6c1703682e 100644
--- a/target/alpha/helper.c
+++ b/target/alpha/helper.c
@@ -36,6 +36,13 @@ uint64_t cpu_alpha_load_fpcr(CPUAlphaState *env)
 
 void cpu_alpha_store_fpcr(CPUAlphaState *env, uint64_t val)
 {
+    static const uint8_t rm_map[] = {
+        [FPCR_DYN_NORMAL >> FPCR_DYN_SHIFT] = float_round_nearest_even,
+        [FPCR_DYN_CHOPPED >> FPCR_DYN_SHIFT] = float_round_to_zero,
+        [FPCR_DYN_MINUS >> FPCR_DYN_SHIFT] = float_round_down,
+        [FPCR_DYN_PLUS >> FPCR_DYN_SHIFT] = float_round_up,
+    };
+
     uint32_t fpcr = val >> 32;
     uint32_t t = 0;
 
@@ -48,22 +55,7 @@ void cpu_alpha_store_fpcr(CPUAlphaState *env, uint64_t val)
     env->fpcr = fpcr;
     env->fpcr_exc_enable = ~t & FPCR_STATUS_MASK;
 
-    switch (fpcr & FPCR_DYN_MASK) {
-    case FPCR_DYN_NORMAL:
-    default:
-        t = float_round_nearest_even;
-        break;
-    case FPCR_DYN_CHOPPED:
-        t = float_round_to_zero;
-        break;
-    case FPCR_DYN_MINUS:
-        t = float_round_down;
-        break;
-    case FPCR_DYN_PLUS:
-        t = float_round_up;
-        break;
-    }
-    env->fpcr_dyn_round = t;
+    env->fpcr_dyn_round = rm_map[(fpcr & FPCR_DYN_MASK) >> FPCR_DYN_SHIFT];
 
     env->fpcr_flush_to_zero = (fpcr & FPCR_UNFD) && (fpcr & FPCR_UNDZ);
     env->fp_status.flush_inputs_to_zero = (fpcr & FPCR_DNZ) != 0;
-- 
2.20.1


