Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F7621051C
	for <lists+qemu-devel@lfdr.de>; Wed,  1 May 2019 07:16:45 +0200 (CEST)
Received: from localhost ([127.0.0.1]:36362 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hLhbo-0006PJ-Mi
	for lists+qemu-devel@lfdr.de; Wed, 01 May 2019 01:16:44 -0400
Received: from eggs.gnu.org ([209.51.188.92]:38326)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1hLhRS-0006Tz-02
	for qemu-devel@nongnu.org; Wed, 01 May 2019 01:06:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1hLhRO-0002t6-Uo
	for qemu-devel@nongnu.org; Wed, 01 May 2019 01:06:01 -0400
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642]:35810)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1hLhRO-0002sh-P9
	for qemu-devel@nongnu.org; Wed, 01 May 2019 01:05:58 -0400
Received: by mail-pl1-x642.google.com with SMTP id w24so7779141plp.2
	for <qemu-devel@nongnu.org>; Tue, 30 Apr 2019 22:05:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=4qREfMgDOvDIZnxD8mHxrlGbKtAgS56ZNj2GB4ImDXs=;
	b=bqscjG+Wp1YdwtS2sn/6hOniJqV8Nz2hTXcljNAAEFxLkBPj6WuZCNfaeNOBYx23y6
	Y1RKL+saVxc54xIT/zS5eiJ607avU0sUHP0djkwNNAkUCu+xqFKh8KTkK2c4HIIQHjbr
	ji7p27ssArwP0mBHVGMxIP1F/xSBufQbWV9Ng0s+tzU5drSsw6UZM1PVTfJm1pK6HQ7y
	MeMKB5NN9tGbaZMA50zCaaoMFddHViqopFAQO1dqadIv61Sqvd3pmrzGGnePU1twT9mV
	lr+1Z+3BOJVBv4X/FTOX6INqKE02jhMPHZYFRPY6NPe1OOxE9MAd/mwQPkL4kG0UztBb
	ZYfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=4qREfMgDOvDIZnxD8mHxrlGbKtAgS56ZNj2GB4ImDXs=;
	b=UgckV9LlxJsA9kLaoDh5WaqjWTUoA+zKB98WQ8Bod+83vUKnmBeBeyOmWGpKE//r2b
	o0MRfsiX0E7G7ll12ffHBH91lDdnwgctBQu8oewSFtqk3wwl++H44qY1YugJ3hFfrXtT
	r+soSG5TPDF1kU1DYddnZoUSkjNt7tlE76p93q8G97PMbUz30z3mIZfD7vsPeEkvlb+S
	mOKZ4y7i88/jr+LP3keoBuduQKlnWOQTypbfSEZ6mec9e6jgcnf3GbxBrSHjJ75pSFlC
	jwKN40P6Bq+k9On7CyvhOS5K/VyY9tm74LEjT0URS1ghDTpFd5t4rAIXxx4F4hSINpm4
	WEmA==
X-Gm-Message-State: APjAAAVZHSb4d+UsqLVqSaH2P5uiQ2sYnJNGVx8RVCSKO2JmnjNZz1++
	JJuSbvyEo21i32dwAfJvfVuujndUCbI=
X-Google-Smtp-Source: APXvYqzmls2xmx2MtZnqYrX/W8tN8eGoJLaBzUKFp+TIbR99i2Ra74plUflQAPgDmggs0YPMHZ0ggw==
X-Received: by 2002:a17:902:9a95:: with SMTP id
	w21mr75751535plp.74.1556687157479; 
	Tue, 30 Apr 2019 22:05:57 -0700 (PDT)
Received: from localhost.localdomain (97-113-189-189.tukw.qwest.net.
	[97.113.189.189]) by smtp.gmail.com with ESMTPSA id
	t127sm9687251pfb.106.2019.04.30.22.05.56 for <qemu-devel@nongnu.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 30 Apr 2019 22:05:56 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Tue, 30 Apr 2019 22:05:18 -0700
Message-Id: <20190501050536.15580-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190501050536.15580-1-richard.henderson@linaro.org>
References: <20190501050536.15580-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::642
Subject: [Qemu-devel] [PATCH v2 11/29] tcg/i386: Implement tcg_out_dupm_vec
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

At the same time, improve tcg_out_dupi_vec wrt broadcast
from the constant pool.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/i386/tcg-target.inc.c | 57 +++++++++++++++++++++++++++++----------
 1 file changed, 43 insertions(+), 14 deletions(-)

diff --git a/tcg/i386/tcg-target.inc.c b/tcg/i386/tcg-target.inc.c
index f04933bc19..f4bd00e24f 100644
--- a/tcg/i386/tcg-target.inc.c
+++ b/tcg/i386/tcg-target.inc.c
@@ -358,7 +358,6 @@ static inline int tcg_target_const_match(tcg_target_long val, TCGType type,
 #define OPC_MOVBE_MyGy  (0xf1 | P_EXT38)
 #define OPC_MOVD_VyEy   (0x6e | P_EXT | P_DATA16)
 #define OPC_MOVD_EyVy   (0x7e | P_EXT | P_DATA16)
-#define OPC_MOVDDUP     (0x12 | P_EXT | P_SIMDF2)
 #define OPC_MOVDQA_VxWx (0x6f | P_EXT | P_DATA16)
 #define OPC_MOVDQA_WxVx (0x7f | P_EXT | P_DATA16)
 #define OPC_MOVDQU_VxWx (0x6f | P_EXT | P_SIMDF3)
@@ -458,6 +457,10 @@ static inline int tcg_target_const_match(tcg_target_long val, TCGType type,
 #define OPC_UD2         (0x0b | P_EXT)
 #define OPC_VPBLENDD    (0x02 | P_EXT3A | P_DATA16)
 #define OPC_VPBLENDVB   (0x4c | P_EXT3A | P_DATA16)
+#define OPC_VPINSRB     (0x20 | P_EXT3A | P_DATA16)
+#define OPC_VPINSRW     (0xc4 | P_EXT | P_DATA16)
+#define OPC_VBROADCASTSS (0x18 | P_EXT38 | P_DATA16)
+#define OPC_VBROADCASTSD (0x19 | P_EXT38 | P_DATA16)
 #define OPC_VPBROADCASTB (0x78 | P_EXT38 | P_DATA16)
 #define OPC_VPBROADCASTW (0x79 | P_EXT38 | P_DATA16)
 #define OPC_VPBROADCASTD (0x58 | P_EXT38 | P_DATA16)
@@ -855,16 +858,17 @@ static bool tcg_out_mov(TCGContext *s, TCGType type, TCGReg ret, TCGReg arg)
     return true;
 }
 
+static const int avx2_dup_insn[4] = {
+    OPC_VPBROADCASTB, OPC_VPBROADCASTW,
+    OPC_VPBROADCASTD, OPC_VPBROADCASTQ,
+};
+
 static bool tcg_out_dup_vec(TCGContext *s, TCGType type, unsigned vece,
                             TCGReg r, TCGReg a)
 {
     if (have_avx2) {
-        static const int dup_insn[4] = {
-            OPC_VPBROADCASTB, OPC_VPBROADCASTW,
-            OPC_VPBROADCASTD, OPC_VPBROADCASTQ,
-        };
         int vex_l = (type == TCG_TYPE_V256 ? P_VEXL : 0);
-        tcg_out_vex_modrm(s, dup_insn[vece] + vex_l, r, 0, a);
+        tcg_out_vex_modrm(s, avx2_dup_insn[vece] + vex_l, r, 0, a);
     } else {
         switch (vece) {
         case MO_8:
@@ -894,10 +898,35 @@ static bool tcg_out_dup_vec(TCGContext *s, TCGType type, unsigned vece,
 static bool tcg_out_dupm_vec(TCGContext *s, TCGType type, unsigned vece,
                              TCGReg r, TCGReg base, intptr_t offset)
 {
-    return false;
+    if (have_avx2) {
+        int vex_l = (type == TCG_TYPE_V256 ? P_VEXL : 0);
+        tcg_out_vex_modrm_offset(s, avx2_dup_insn[vece] + vex_l,
+                                 r, 0, base, offset);
+    } else {
+        switch (vece) {
+        case MO_64:
+            tcg_out_vex_modrm_offset(s, OPC_VBROADCASTSD, r, 0, base, offset);
+            break;
+        case MO_32:
+            tcg_out_vex_modrm_offset(s, OPC_VBROADCASTSS, r, 0, base, offset);
+            break;
+        case MO_16:
+            tcg_out_vex_modrm_offset(s, OPC_VPINSRW, r, r, base, offset);
+            tcg_out8(s, 0); /* imm8 */
+            tcg_out_dup_vec(s, type, vece, r, r);
+            break;
+        case MO_8:
+            tcg_out_vex_modrm_offset(s, OPC_VPINSRB, r, r, base, offset);
+            tcg_out8(s, 0); /* imm8 */
+            tcg_out_dup_vec(s, type, vece, r, r);
+            break;
+        default:
+            g_assert_not_reached();
+        }
+    }
+    return true;
 }
 
-
 static void tcg_out_dupi_vec(TCGContext *s, TCGType type,
                              TCGReg ret, tcg_target_long arg)
 {
@@ -918,16 +947,16 @@ static void tcg_out_dupi_vec(TCGContext *s, TCGType type,
         } else if (have_avx2) {
             tcg_out_vex_modrm_pool(s, OPC_VPBROADCASTQ + vex_l, ret);
         } else {
-            tcg_out_vex_modrm_pool(s, OPC_MOVDDUP, ret);
+            tcg_out_vex_modrm_pool(s, OPC_VBROADCASTSD, ret);
         }
         new_pool_label(s, arg, R_386_PC32, s->code_ptr - 4, -4);
-    } else if (have_avx2) {
-        tcg_out_vex_modrm_pool(s, OPC_VPBROADCASTD + vex_l, ret);
-        new_pool_label(s, arg, R_386_32, s->code_ptr - 4, 0);
     } else {
-        tcg_out_vex_modrm_pool(s, OPC_MOVD_VyEy, ret);
+        if (have_avx2) {
+            tcg_out_vex_modrm_pool(s, OPC_VBROADCASTSD + vex_l, ret);
+        } else {
+            tcg_out_vex_modrm_pool(s, OPC_VBROADCASTSS, ret);
+        }
         new_pool_label(s, arg, R_386_32, s->code_ptr - 4, 0);
-        tcg_out_dup_vec(s, type, MO_32, ret, ret);
     }
 }
 
-- 
2.17.1


