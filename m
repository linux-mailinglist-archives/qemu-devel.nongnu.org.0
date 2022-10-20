Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3275D6062A1
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Oct 2022 16:15:01 +0200 (CEST)
Received: from localhost ([::1]:33542 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olWK2-0001xn-Pe
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 10:14:59 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olWDv-0008T6-SJ
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 10:08:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41494)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1olU7N-0004jB-4h
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 07:53:45 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:38716)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1olU7L-0000vQ-Cs
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 07:53:44 -0400
Received: by mail-pj1-x1035.google.com with SMTP id
 x1-20020a17090ab00100b001fda21bbc90so3201709pjq.3
 for <qemu-devel@nongnu.org>; Thu, 20 Oct 2022 04:53:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=zCtMHoOPMsKaLkXmKcpRImXO58gKxjrF6Vf3m+rKoTs=;
 b=QDUK+zjyxi1Rqy79iYVFZ6fiq8R5m31Qcpli1ChCPUU3XbocmzkqdTaQ7V0PPM/j0R
 mj6qLZMGwxS6vPplKcrOeUI/ggG7uO6JK4QHfBzBIwLgtFfDcvKcABurhgCJFVgt7vFq
 MP1+yjEiXD8hQV1YxR20946UBrF9b3J8KsGJ+QG7eIsa7zYDVkdij1kISnwPYoYzy4Mk
 09p5/OocEyGdQCkEpe0vnnYMakFJfG5Squ1D9GNZnNyprEDwcL1L1CBgg380OQ1fvAYg
 KAMqDJ46yAU9MO9uWnqfNrE1k313iKE4SXEp0uIJEt9CGGRyX1Cbw1hqjC5fyMPAwKH8
 0zaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zCtMHoOPMsKaLkXmKcpRImXO58gKxjrF6Vf3m+rKoTs=;
 b=k6MnFBOyYpNSvdLWmUVF7F9qmPdrULOQ0z2FXFt7rzTa3XSXG6rawCWRwyFmkMhka6
 am316HaPyIHH7AtUDdOkIv8Rl71kxZGEdEcARVyu8bJQqzcKXK48VvlG3BAslQDhA/hl
 oFqTEG88btucEj0Fh/pd3jkc1NO9iPYRGIDel5NRk8OVUQse9JVJntzCvsbAdB9z17xJ
 +xMYEOLuLdtWa7kP8otd/ccsq0ElRWbnsyWXv7ap9AhWxjPXzNpsT5YEjgdOgShYF0YJ
 7m7n9Ebg9kHYrjxZN/vQ4YV+BUZgB2EvNUxR6E6eZzAKyy+VN/2pCG15xOvObCewQzAs
 8rIw==
X-Gm-Message-State: ACrzQf3B3/mJwyD/gqKT8ws8qwNT/0MDkDHh4dkQYMUhmhFv2SyIlp/j
 6ZveI0VHoR3SEDeEu3bxlVsTw3RQ0bRvd17L
X-Google-Smtp-Source: AMsMyM744VHLRfmR+95KkT9TECEb7Su8ShplSx4emuCvbTGDc4MDHywxBr9Ruy2LIeoXZ0aTcX5BFw==
X-Received: by 2002:a17:903:2449:b0:186:1269:929c with SMTP id
 l9-20020a170903244900b001861269929cmr13942861pls.37.1666266822542; 
 Thu, 20 Oct 2022 04:53:42 -0700 (PDT)
Received: from localhost.localdomain ([149.135.10.35])
 by smtp.gmail.com with ESMTPSA id
 w206-20020a627bd7000000b0056109e15638sm13065464pfc.54.2022.10.20.04.53.40
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Oct 2022 04:53:42 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 09/31] tcg: Move TCG_{LOW,HIGH} to tcg-internal.h
Date: Thu, 20 Oct 2022 21:52:20 +1000
Message-Id: <20221020115242.2301066-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221020115242.2301066-1-richard.henderson@linaro.org>
References: <20221020115242.2301066-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Move the error-generating fallback from tcg-op.c, and
replace "_link_error" with modern QEMU_ERROR markup.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/tcg/tcg.h  | 12 ------------
 tcg/tcg-internal.h | 14 ++++++++++++++
 tcg/tcg-op.c       | 10 +---------
 3 files changed, 15 insertions(+), 21 deletions(-)

diff --git a/include/tcg/tcg.h b/include/tcg/tcg.h
index 5c2254ce9f..d207bc47be 100644
--- a/include/tcg/tcg.h
+++ b/include/tcg/tcg.h
@@ -737,18 +737,6 @@ static inline TCGv_vec temp_tcgv_vec(TCGTemp *t)
     return (TCGv_vec)temp_tcgv_i32(t);
 }
 
-#if TCG_TARGET_REG_BITS == 32
-static inline TCGv_i32 TCGV_LOW(TCGv_i64 t)
-{
-    return temp_tcgv_i32(tcgv_i64_temp(t));
-}
-
-static inline TCGv_i32 TCGV_HIGH(TCGv_i64 t)
-{
-    return temp_tcgv_i32(tcgv_i64_temp(t) + 1);
-}
-#endif
-
 static inline TCGArg tcg_get_insn_param(TCGOp *op, int arg)
 {
     return op->args[arg];
diff --git a/tcg/tcg-internal.h b/tcg/tcg-internal.h
index cc82088d52..a9ea27f67a 100644
--- a/tcg/tcg-internal.h
+++ b/tcg/tcg-internal.h
@@ -59,4 +59,18 @@ static inline unsigned tcg_call_flags(TCGOp *op)
     return tcg_call_info(op)->flags;
 }
 
+#if TCG_TARGET_REG_BITS == 32
+static inline TCGv_i32 TCGV_LOW(TCGv_i64 t)
+{
+    return temp_tcgv_i32(tcgv_i64_temp(t));
+}
+static inline TCGv_i32 TCGV_HIGH(TCGv_i64 t)
+{
+    return temp_tcgv_i32(tcgv_i64_temp(t) + 1);
+}
+#else
+extern TCGv_i32 TCGV_LOW(TCGv_i64) QEMU_ERROR("32-bit code path is reachable");
+extern TCGv_i32 TCGV_HIGH(TCGv_i64) QEMU_ERROR("32-bit code path is reachable");
+#endif
+
 #endif /* TCG_INTERNAL_H */
diff --git a/tcg/tcg-op.c b/tcg/tcg-op.c
index 019fab00cc..3ed98ffa01 100644
--- a/tcg/tcg-op.c
+++ b/tcg/tcg-op.c
@@ -28,16 +28,8 @@
 #include "tcg/tcg-op.h"
 #include "tcg/tcg-mo.h"
 #include "exec/plugin-gen.h"
+#include "tcg-internal.h"
 
-/* Reduce the number of ifdefs below.  This assumes that all uses of
-   TCGV_HIGH and TCGV_LOW are properly protected by a conditional that
-   the compiler can eliminate.  */
-#if TCG_TARGET_REG_BITS == 64
-extern TCGv_i32 TCGV_LOW_link_error(TCGv_i64);
-extern TCGv_i32 TCGV_HIGH_link_error(TCGv_i64);
-#define TCGV_LOW  TCGV_LOW_link_error
-#define TCGV_HIGH TCGV_HIGH_link_error
-#endif
 
 void tcg_gen_op1(TCGOpcode opc, TCGArg a1)
 {
-- 
2.34.1


