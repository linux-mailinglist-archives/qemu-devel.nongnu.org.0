Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DEAE2E2C60
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Dec 2020 21:35:29 +0100 (CET)
Received: from localhost ([::1]:34312 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ksto8-0001DL-85
	for lists+qemu-devel@lfdr.de; Fri, 25 Dec 2020 15:35:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38636)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kstZS-0003Gs-2k
 for qemu-devel@nongnu.org; Fri, 25 Dec 2020 15:20:18 -0500
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630]:40310)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kstZP-0005GA-M9
 for qemu-devel@nongnu.org; Fri, 25 Dec 2020 15:20:17 -0500
Received: by mail-pl1-x630.google.com with SMTP id q4so2714971plr.7
 for <qemu-devel@nongnu.org>; Fri, 25 Dec 2020 12:20:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=4hWRe/MilldCXwfwUKlxB4qn+rTkcTstfPjX6z+KyaY=;
 b=uNLUB6weJ/Q5Tt+x0xIgwzbVq1ME1fVhTB9UIbMUlkBP8orIX5RsvOK2Vx91KJv/e8
 z9f5AIXxnwE8j0oN4CuUUDBNaLDTIgaXHUF0ZOiPMH//9BeK9XyYbsxX+KQETHgAbUNx
 xajZvh9qnvdRtal/FpRdDBkRlbvRmrpoZaitgf/6w8qkbPlaCIXw5bc8tj6lVCZWb0tE
 h/DdLsmSxGxK2XQv2qODvklLGTeNnHx5BW3KaYZhHwAzNR1UZ+yjfgUDIUUWZWx/wxkQ
 DSGZbaPj3JCU25Hd2XYla/QdIvEg+jM7byocdMhTRlQDR84F1TFUhGNP2Y3wpWOw2UzA
 C5Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4hWRe/MilldCXwfwUKlxB4qn+rTkcTstfPjX6z+KyaY=;
 b=sfXqn3hoxcu43IuQHHJ1uEO6OWvV+3KlxnlLBwR7vB+tQdhfRuQQ20PW4i3fc8AwJ7
 tmB6ApjrqatV6b8qNMoXLuLTCjVWHDqIt8L3becSuy7eMK8aGC0C5i9wPlnaO51vcaVJ
 r1OiC3aWuplWU/Av6ShCiepf94IxPlqHaUV1TEW+XjuZYu/6akz1QmuhshceQ+B/IJW7
 +CyRdDz0AMSjNdJpdGqI8UR+cnKUTCf2JCFUKsgsbOklVVhKsyhT0+3q8y/4EQ1M7Pf9
 xHyZdSSjkMAkZSDuV1LeYt7uB6aV+SQdM8/7z9BxsE7H+bu5hQBnUNPfAz8e6+3xgCIe
 irJw==
X-Gm-Message-State: AOAM532nereU8g113vtuhbO5dBfvlhhrClujNgqgNUjBTTpBL3M4Rfd7
 q8wwT/a/UX7F5e4yZPTGq6oJ5s4rqmn5TA==
X-Google-Smtp-Source: ABdhPJw9Lsh2NM7VPOce0LR+YpOf+J4DgMT13F8+57aF8LpJcXyoKt/ZbEQCIPjgOO07q12Wj9Z4fw==
X-Received: by 2002:a17:902:b943:b029:dc:6bd:5562 with SMTP id
 h3-20020a170902b943b02900dc06bd5562mr34498103pls.59.1608927613851; 
 Fri, 25 Dec 2020 12:20:13 -0800 (PST)
Received: from localhost.localdomain (174-21-150-71.tukw.qwest.net.
 [174.21.150.71])
 by smtp.gmail.com with ESMTPSA id l8sm5816497pjt.32.2020.12.25.12.20.13
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Dec 2020 12:20:13 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 14/16] tcg/s390x: Implement TCG_TARGET_HAS_sat_vec
Date: Fri, 25 Dec 2020 12:19:54 -0800
Message-Id: <20201225201956.692861-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201225201956.692861-1-richard.henderson@linaro.org>
References: <20201225201956.692861-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x630.google.com
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

The unsigned saturations are handled via generic code
using min/max.  The signed saturations are expanded using
double-sized arithmetic and a saturating pack.

Since all operations are done via expansion, do not
actually set TCG_TARGET_HAS_sat_vec.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/s390x/tcg-target.opc.h |  3 ++
 tcg/s390x/tcg-target.c.inc | 63 ++++++++++++++++++++++++++++++++++++++
 2 files changed, 66 insertions(+)

diff --git a/tcg/s390x/tcg-target.opc.h b/tcg/s390x/tcg-target.opc.h
index 7a4578e9b4..85d51cd65e 100644
--- a/tcg/s390x/tcg-target.opc.h
+++ b/tcg/s390x/tcg-target.opc.h
@@ -10,3 +10,6 @@
  * emitted by tcg_expand_vec_op.  For those familiar with GCC internals,
  * consider these to be UNSPEC with names.
  */
+DEF(s390_vuph_vec, 1, 1, 0, IMPLVEC)
+DEF(s390_vupl_vec, 1, 1, 0, IMPLVEC)
+DEF(s390_vpks_vec, 1, 2, 0, IMPLVEC)
diff --git a/tcg/s390x/tcg-target.c.inc b/tcg/s390x/tcg-target.c.inc
index 36e5924353..ab53c8a05c 100644
--- a/tcg/s390x/tcg-target.c.inc
+++ b/tcg/s390x/tcg-target.c.inc
@@ -276,7 +276,10 @@ typedef enum S390Opcode {
     VRRc_VNO    = 0xe76b,
     VRRc_VO     = 0xe76a,
     VRRc_VOC    = 0xe76f,
+    VRRc_VPKS   = 0xe797,   /* we leave the m5 cs field 0 */
     VRRc_VS     = 0xe7f7,
+    VRRa_VUPH   = 0xe7d7,
+    VRRa_VUPL   = 0xe7d6,
     VRRc_VX     = 0xe76d,
     VRRf_VLVGP  = 0xe762,
 
@@ -2761,6 +2764,16 @@ static void tcg_out_vec_op(TCGContext *s, TCGOpcode opc,
         }
         break;
 
+    case INDEX_op_s390_vuph_vec:
+        tcg_out_insn(s, VRRa, VUPH, a0, a1, vece);
+        break;
+    case INDEX_op_s390_vupl_vec:
+        tcg_out_insn(s, VRRa, VUPL, a0, a1, vece);
+        break;
+    case INDEX_op_s390_vpks_vec:
+        tcg_out_insn(s, VRRc, VPKS, a0, a1, a2, vece);
+        break;
+
     case INDEX_op_mov_vec:   /* Always emitted via tcg_out_mov.  */
     case INDEX_op_dup_vec:   /* Always emitted via tcg_out_dup_vec.  */
     default:
@@ -2803,6 +2816,9 @@ int tcg_can_emit_vec_op(TCGOpcode opc, TCGType type, unsigned vece)
         return -1;
     case INDEX_op_mul_vec:
         return vece < MO_64;
+    case INDEX_op_ssadd_vec:
+    case INDEX_op_sssub_vec:
+        return vece < MO_64 ? -1 : 0;
     default:
         return 0;
     }
@@ -2858,6 +2874,43 @@ static void expand_vec_cmp(TCGType type, unsigned vece, TCGv_vec v0,
     }
 }
 
+static void expand_vec_sat(TCGType type, unsigned vece, TCGv_vec v0,
+                           TCGv_vec v1, TCGv_vec v2, TCGOpcode add_sub_opc)
+{
+    TCGv_vec h1 = tcg_temp_new_vec(type);
+    TCGv_vec h2 = tcg_temp_new_vec(type);
+    TCGv_vec l1 = tcg_temp_new_vec(type);
+    TCGv_vec l2 = tcg_temp_new_vec(type);
+
+    tcg_debug_assert (vece < MO_64);
+
+    /* Unpack with sign-extension. */
+    vec_gen_2(INDEX_op_s390_vuph_vec, type, vece,
+              tcgv_vec_arg(h1), tcgv_vec_arg(v1));
+    vec_gen_2(INDEX_op_s390_vuph_vec, type, vece,
+              tcgv_vec_arg(h2), tcgv_vec_arg(v2));
+
+    vec_gen_2(INDEX_op_s390_vupl_vec, type, vece,
+              tcgv_vec_arg(l1), tcgv_vec_arg(v1));
+    vec_gen_2(INDEX_op_s390_vupl_vec, type, vece,
+              tcgv_vec_arg(l2), tcgv_vec_arg(v2));
+
+    /* Arithmetic on a wider element size. */
+    vec_gen_3(add_sub_opc, type, vece + 1, tcgv_vec_arg(h1),
+              tcgv_vec_arg(h1), tcgv_vec_arg(h2));
+    vec_gen_3(add_sub_opc, type, vece + 1, tcgv_vec_arg(l1),
+              tcgv_vec_arg(l1), tcgv_vec_arg(l2));
+
+    /* Pack with saturation. */
+    vec_gen_3(INDEX_op_s390_vpks_vec, type, vece + 1,
+              tcgv_vec_arg(v0), tcgv_vec_arg(h1), tcgv_vec_arg(l1));
+
+    tcg_temp_free_vec(h1);
+    tcg_temp_free_vec(h2);
+    tcg_temp_free_vec(l1);
+    tcg_temp_free_vec(l2);
+}
+
 void tcg_expand_vec_op(TCGOpcode opc, TCGType type, unsigned vece,
                        TCGArg a0, ...)
 {
@@ -2881,6 +2934,13 @@ void tcg_expand_vec_op(TCGOpcode opc, TCGType type, unsigned vece,
         tcg_temp_free_vec(t0);
         break;
 
+    case INDEX_op_ssadd_vec:
+        expand_vec_sat(type, vece, v0, v1, v2, INDEX_op_add_vec);
+        break;
+    case INDEX_op_sssub_vec:
+        expand_vec_sat(type, vece, v0, v1, v2, INDEX_op_sub_vec);
+        break;
+
     default:
         g_assert_not_reached();
     }
@@ -3041,6 +3101,8 @@ static int tcg_target_op_def(TCGOpcode op)
     case INDEX_op_sari_vec:
     case INDEX_op_shli_vec:
     case INDEX_op_shri_vec:
+    case INDEX_op_s390_vuph_vec:
+    case INDEX_op_s390_vupl_vec:
         return C_O1_I1(v, v);
     case INDEX_op_add_vec:
     case INDEX_op_sub_vec:
@@ -3060,6 +3122,7 @@ static int tcg_target_op_def(TCGOpcode op)
     case INDEX_op_smin_vec:
     case INDEX_op_umax_vec:
     case INDEX_op_umin_vec:
+    case INDEX_op_s390_vpks_vec:
         return C_O1_I2(v, v, v);
     case INDEX_op_rotls_vec:
     case INDEX_op_shls_vec:
-- 
2.25.1


