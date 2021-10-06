Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E9A5B424186
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Oct 2021 17:43:17 +0200 (CEST)
Received: from localhost ([::1]:52738 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mY94d-0006yV-Mi
	for lists+qemu-devel@lfdr.de; Wed, 06 Oct 2021 11:43:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47126)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mY8ir-0002W7-Sw
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 11:20:45 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:37643)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mY8id-0007m8-LY
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 11:20:45 -0400
Received: by mail-pj1-x1036.google.com with SMTP id
 oa6-20020a17090b1bc600b0019ffc4b9c51so4650281pjb.2
 for <qemu-devel@nongnu.org>; Wed, 06 Oct 2021 08:20:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=SoFSN8+dHYCK0kdXO3TXf53JpLQWlg0CB5x5qJyQaHs=;
 b=eXfnjptmzY9V94e/Y6gOXxkDKHCgOaSlH9Ffr+vIOcyhxvoK3WRWuKg/uMhFHd4ZS7
 ahz8rKBcv22v2aStOcvus231m0U5R1dAGpa8Agvynt/9fEmsEizFmmHW7MdKWFmmL/qn
 8E60Vt6aiNEqZR/uIf/NqGvBEZkKI+MjhgMM9RBsFaHnsLmDg2CUhNsW6EZWi9+0V8Mh
 LcWiA7hWsb2rt/b665BHqUr5TxR0c1+D/eHIEiB92ANPwNlQ91Qimj+6u4Jaw/jN1caW
 SH0VEuohKi+nqE8E/4rfHbdEGLITL4eGpqoXAT7y/Nfr2OvmdtxYODEFquo3BCf4uDJR
 7hCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SoFSN8+dHYCK0kdXO3TXf53JpLQWlg0CB5x5qJyQaHs=;
 b=qnleeKValgayFH2Q6rQTd8y90lV51jZin977JVbxJoUq2JlZjPfOcHmXXvTgz6InTz
 DBCRtD1bBg/JLKyc6D9VIa2iDYyeecQdJQZSAzWW6Meh4gC5U9ksH/VA5SaoUo1YaAHf
 iYKRW7Z0FwSr3wlPHEzjwspGOgWCo1jBRcBjGdeiVRxc3aMeNB4+4YSo0egLLGUppz6s
 wLeIc6VD5omUWsv1hdOpChkwhyGz2DH9ap9UR3F1ENiYfZRIlrrMm5n90avDAt7rQ/+R
 XxRfQHQPOmD+16O54mH1HbMXLNwOpYushBe78SSh2Pm5Qq039t9B0ZgdHiisRA2xoWLl
 jZsg==
X-Gm-Message-State: AOAM532Ot4tnWat8cFogeZHqyghZ4HWh7cN5LD05wOAxjIb+32QnaRcv
 cqKyMKqwXCbCkb/EVaj0ymNhAtu5NX+uRw==
X-Google-Smtp-Source: ABdhPJzLtJ7CfeTmYZqd2uJyzzKsK838UMcSZSOrCqJ+p5xx0vfoO9kGXAxAVeYjbk3Ey1QhJXdULw==
X-Received: by 2002:a17:902:7804:b0:13e:d4c6:e701 with SMTP id
 p4-20020a170902780400b0013ed4c6e701mr11522169pll.66.1633533627130; 
 Wed, 06 Oct 2021 08:20:27 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id 130sm22239256pfz.77.2021.10.06.08.20.26
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Oct 2021 08:20:26 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 13/28] tcg: Expand usadd/ussub with umin/umax
Date: Wed,  6 Oct 2021 08:19:59 -0700
Message-Id: <20211006152014.741026-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211006152014.741026-1-richard.henderson@linaro.org>
References: <20211006152014.741026-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

For usadd, we only have to consider overflow.  Since ~B + B == -1,
the maximum value for A that saturates is ~B.

For ussub, we only have to consider underflow.  The minimum value
that saturates to 0 from A - B is B.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tcg-op-vec.c | 37 +++++++++++++++++++++++++++++++++++--
 1 file changed, 35 insertions(+), 2 deletions(-)

diff --git a/tcg/tcg-op-vec.c b/tcg/tcg-op-vec.c
index 15e026ae49..faf30f9cdd 100644
--- a/tcg/tcg-op-vec.c
+++ b/tcg/tcg-op-vec.c
@@ -119,6 +119,18 @@ bool tcg_can_emit_vecop_list(const TCGOpcode *list,
                 continue;
             }
             break;
+        case INDEX_op_usadd_vec:
+            if (tcg_can_emit_vec_op(INDEX_op_umin_vec, type, vece) ||
+                tcg_can_emit_vec_op(INDEX_op_cmp_vec, type, vece)) {
+                continue;
+            }
+            break;
+        case INDEX_op_ussub_vec:
+            if (tcg_can_emit_vec_op(INDEX_op_umax_vec, type, vece) ||
+                tcg_can_emit_vec_op(INDEX_op_cmp_vec, type, vece)) {
+                continue;
+            }
+            break;
         case INDEX_op_cmpsel_vec:
         case INDEX_op_smin_vec:
         case INDEX_op_smax_vec:
@@ -603,7 +615,18 @@ void tcg_gen_ssadd_vec(unsigned vece, TCGv_vec r, TCGv_vec a, TCGv_vec b)
 
 void tcg_gen_usadd_vec(unsigned vece, TCGv_vec r, TCGv_vec a, TCGv_vec b)
 {
-    do_op3_nofail(vece, r, a, b, INDEX_op_usadd_vec);
+    if (!do_op3(vece, r, a, b, INDEX_op_usadd_vec)) {
+        const TCGOpcode *hold_list = tcg_swap_vecop_list(NULL);
+        TCGv_vec t = tcg_temp_new_vec_matching(r);
+
+        /* usadd(a, b) = min(a, ~b) + b */
+        tcg_gen_not_vec(vece, t, b);
+        tcg_gen_umin_vec(vece, t, t, a);
+        tcg_gen_add_vec(vece, r, t, b);
+
+        tcg_temp_free_vec(t);
+        tcg_swap_vecop_list(hold_list);
+    }
 }
 
 void tcg_gen_sssub_vec(unsigned vece, TCGv_vec r, TCGv_vec a, TCGv_vec b)
@@ -613,7 +636,17 @@ void tcg_gen_sssub_vec(unsigned vece, TCGv_vec r, TCGv_vec a, TCGv_vec b)
 
 void tcg_gen_ussub_vec(unsigned vece, TCGv_vec r, TCGv_vec a, TCGv_vec b)
 {
-    do_op3_nofail(vece, r, a, b, INDEX_op_ussub_vec);
+    if (!do_op3(vece, r, a, b, INDEX_op_ussub_vec)) {
+        const TCGOpcode *hold_list = tcg_swap_vecop_list(NULL);
+        TCGv_vec t = tcg_temp_new_vec_matching(r);
+
+        /* ussub(a, b) = max(a, b) - b */
+        tcg_gen_umax_vec(vece, t, a, b);
+        tcg_gen_sub_vec(vece, r, t, b);
+
+        tcg_temp_free_vec(t);
+        tcg_swap_vecop_list(hold_list);
+    }
 }
 
 static void do_minmax(unsigned vece, TCGv_vec r, TCGv_vec a,
-- 
2.25.1


