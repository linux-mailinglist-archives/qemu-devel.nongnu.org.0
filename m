Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 76B52770D6
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Jul 2019 20:03:06 +0200 (CEST)
Received: from localhost ([::1]:42660 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hr4Ya-0000Mx-Uj
	for lists+qemu-devel@lfdr.de; Fri, 26 Jul 2019 14:03:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58755)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <richard.henderson@linaro.org>) id 1hr4NO-00055R-K2
 for qemu-devel@nongnu.org; Fri, 26 Jul 2019 13:51:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1hr4NL-0000dg-Au
 for qemu-devel@nongnu.org; Fri, 26 Jul 2019 13:51:29 -0400
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542]:41331)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1hr4NL-0000c6-4p
 for qemu-devel@nongnu.org; Fri, 26 Jul 2019 13:51:27 -0400
Received: by mail-pg1-x542.google.com with SMTP id x15so14765467pgg.8
 for <qemu-devel@nongnu.org>; Fri, 26 Jul 2019 10:51:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=W3BPBGeDUmZyQaUuLRW8yTB0WQP3Hy+VMnlWae7mNLI=;
 b=e2fvHXQIMl+wPOnNu8W2rqNL50WX5PTNxKgxp9oViVF2Nim5/j+AP4LFKxtn9xE34Z
 csnLdnCeetCKbD/GthGFGI7aiYowxav48QoktypnxNu2IpK0O4VJRbwMtXyMvXcV1f9F
 4ANePOseex7d16MGcl6GK3oeebjVVya2f/tw2VQ4kkKBLtskwxQUNPJAmBDpWSbq/Jb3
 DIllizJ9tLPPW9YGyS0WMHIUG6mad/nEkCHSAdb1btmILxccoFGQ1p5ukr2mwQa873dV
 b/+wX7xUQFNBhsP6NMRCL/dWbM3/2NvHOyflAINZ0UtZL8rf7jpBk+VP3lcn1kfpSf9j
 nBsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=W3BPBGeDUmZyQaUuLRW8yTB0WQP3Hy+VMnlWae7mNLI=;
 b=MPr0VNTaHMMETRMK7xK6/UHsz30BjY6bes9zeZvYDTQFgyOKvmH6zndEXfh7zW2OPY
 BguiCyRqACKFssSuWo/afDP1b0k+4ySP8y3WGb887L7TFWFZHtJl+imINB9Lv4PcPpX3
 TqCXlzbK/YASfBPI5E6MqV3b1ZqqHVK3JuJOACr4RKS8s/NEPsTiEgZ+DujOxL5AAr7c
 7VNoC7/Sl5AjuXn6b0bkc6Qns3sOb05mixJyAtC7BKB3QWt/YZZYRnnpCnHekPr99sY5
 nxkxiBAu6a4RFd0xrJNtvfbQi5TDOejfp9F+aXyFmzG1gDkTozPgZJM6VLweVMYdnmvt
 NK8g==
X-Gm-Message-State: APjAAAVx59t3iATr2hVEc0l1oR/JiV0nXPiRei/kkwfERGdYpKyflc9N
 SJkSQDhz6MrWBVHeS121GyFEHoYaHuA=
X-Google-Smtp-Source: APXvYqwEalD0r43IGyBY6NPFx5rHSCx/4gI+8fTOG4l5V80U9nIibdl82rLGe+Yz3ID35xhXwv9vOw==
X-Received: by 2002:a17:90a:c68c:: with SMTP id
 n12mr100875680pjt.29.1564163485938; 
 Fri, 26 Jul 2019 10:51:25 -0700 (PDT)
Received: from localhost.localdomain (97-126-117-207.tukw.qwest.net.
 [97.126.117.207])
 by smtp.gmail.com with ESMTPSA id o24sm104287919pfp.135.2019.07.26.10.51.24
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 26 Jul 2019 10:51:25 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Fri, 26 Jul 2019 10:50:07 -0700
Message-Id: <20190726175032.6769-43-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190726175032.6769-1-richard.henderson@linaro.org>
References: <20190726175032.6769-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::542
Subject: [Qemu-devel] [PATCH 42/67] target/arm: Simplify disas_arm_insn
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Fold away all of the cases that now just goto illegal_op,
because all of their internal bits are now in decodetree.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c | 69 ++++++++++--------------------------------
 1 file changed, 16 insertions(+), 53 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 836b3752f7..65a74a963b 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -10257,7 +10257,7 @@ static bool trans_PLI(DisasContext *s, arg_PLD *a)
 
 static void disas_arm_insn(DisasContext *s, unsigned int insn)
 {
-    unsigned int cond, op1;
+    unsigned int cond = insn >> 28;
 
     /* M variants do not implement ARM mode; this must raise the INVSTATE
      * UsageFault exception.
@@ -10267,7 +10267,6 @@ static void disas_arm_insn(DisasContext *s, unsigned int insn)
                            default_exception_el(s));
         return;
     }
-    cond = insn >> 28;
 
     if (cond == 0xf) {
         /* In ARMv3 and v4 the NV condition is UNPREDICTABLE; we
@@ -10332,11 +10331,6 @@ static void disas_arm_insn(DisasContext *s, unsigned int insn)
                 goto illegal_op;
             }
             return;
-        } else if ((insn & 0x0fe00000) == 0x0c400000) {
-            /* Coprocessor double register transfer.  */
-            ARCH(5TE);
-        } else if ((insn & 0x0f000010) == 0x0e000010) {
-            /* Additional coprocessor register transfer.  */
         }
         goto illegal_op;
     }
@@ -10348,55 +10342,24 @@ static void disas_arm_insn(DisasContext *s, unsigned int insn)
     }
     /* fall back to legacy decoder */
 
-    if ((insn & 0x0f900000) == 0x03000000) {
-        /* All done in decodetree.  Illegal ops reach here.  */
-        goto illegal_op;
-    } else if ((insn & 0x0f900000) == 0x01000000
-               && (insn & 0x00000090) != 0x00000090) {
-        /* miscellaneous instructions */
-        /* All done in decodetree.  Illegal ops reach here.  */
-        goto illegal_op;
-    } else if (((insn & 0x0e000000) == 0 &&
-                (insn & 0x00000090) != 0x90) ||
-               ((insn & 0x0e000000) == (1 << 25))) {
-        /* Data-processing (reg, reg-shift-reg, imm).  */
-        /* All done in decodetree.  Reach here for illegal ops.  */
-        goto illegal_op;
-    } else {
-        /* other instructions */
-        op1 = (insn >> 24) & 0xf;
-        switch(op1) {
-        case 0x0:
-        case 0x1:
-        case 0x4:
-        case 0x5:
-        case 0x6:
-        case 0x7:
-        case 0x08:
-        case 0x09:
-        case 0xa:
-        case 0xb:
-        case 0xf:
-            /* All done in decodetree.  Reach here for illegal ops.  */
-            goto illegal_op;
-        case 0xc:
-        case 0xd:
-        case 0xe:
-            if (((insn >> 8) & 0xe) == 10) {
-                /* VFP.  */
-                if (disas_vfp_insn(s, insn)) {
-                    goto illegal_op;
-                }
-            } else if (disas_coproc_insn(s, insn)) {
-                /* Coprocessor.  */
+    switch ((insn >> 24) & 0xf) {
+    case 0xc:
+    case 0xd:
+    case 0xe:
+        if (((insn >> 8) & 0xe) == 10) {
+            /* VFP.  */
+            if (disas_vfp_insn(s, insn)) {
                 goto illegal_op;
             }
-            break;
-        default:
-        illegal_op:
-            gen_illegal_op(s);
-            break;
+        } else if (disas_coproc_insn(s, insn)) {
+            /* Coprocessor.  */
+            goto illegal_op;
         }
+        break;
+    default:
+    illegal_op:
+        gen_illegal_op(s);
+        break;
     }
 }
 
-- 
2.17.1


