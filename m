Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FBBA3C9BC
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Jun 2019 13:07:48 +0200 (CEST)
Received: from localhost ([::1]:56268 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1haed1-0002al-LQ
	for lists+qemu-devel@lfdr.de; Tue, 11 Jun 2019 07:07:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38988)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <peter.maydell@linaro.org>) id 1haePp-0007A5-BA
 for qemu-devel@nongnu.org; Tue, 11 Jun 2019 06:54:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1haePl-0007J0-BC
 for qemu-devel@nongnu.org; Tue, 11 Jun 2019 06:54:07 -0400
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343]:56295)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1haePj-0007Fq-1I
 for qemu-devel@nongnu.org; Tue, 11 Jun 2019 06:54:05 -0400
Received: by mail-wm1-x343.google.com with SMTP id a15so2409709wmj.5
 for <qemu-devel@nongnu.org>; Tue, 11 Jun 2019 03:54:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Hf8MpfHUo3UF7W88LcdNMkV2Y4vd60PhY1ZXXjpwkAc=;
 b=Fx5hVUm1eRw65ai0VMakp4UYD1xiLn6mW8m0KC3dub5tD75DRNetioFNRSPCAN1LRK
 eSUtrgWL/hOJhkzmXXQMh2+JHYeLp8oZYWhi1za8aawIC3N+6OQ+ih+1pJxeRH506Lu0
 6SLusmNvIfg3jcjnr51PcBocxZlwKlB8TrUxISyo4Q48O1cSLSEcSjR0EOrmv/jl/rS0
 j6d1g9ISeybLsK2FMkR+AEzqCjEYIvgXKAbtO7cJmXCJ61wAQQ7uZMuroxEWTzWM/VgH
 KUYLrvTxDNgNBbTNNaIPWc1GDLiy9ISetQqJ2eE+kSf6tkst7DaJitJtBFzKlVPEvK0f
 lkOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Hf8MpfHUo3UF7W88LcdNMkV2Y4vd60PhY1ZXXjpwkAc=;
 b=UtrJnBPJKOyWrEZLYyjHOPtmKWUkeD9AxlmPwUqiwf2P8eO6GQEPaMddyFVuc9wWgy
 QUev6hwzrAF2EwQqTrfaQWQCBeIoVA6Aa0GUGA/nGcvFr7DKYSXnDgqiDjZjuIwg03jt
 YpdY2SZXY5FjsgiA5Ib0/e/pZ+bCm1FZCvKRhleqIoQYM8X1EFMl3zQ/C0fG3R9ZQeCr
 tlH3aTKxpOEJTAK5496UbU8PSQOA/tKZ9Wh4AbKKklTklaSGqytO+cKHb7ejbXnP6RXo
 54g23afyTfoRFf8VYekPunUj5Zje5lbO8H4sgsvylBiaybINcsoRjkIvqqRyt61PXSZZ
 4ZNw==
X-Gm-Message-State: APjAAAWGw5fIkfBgd2wl+kITi/D41u7EFW0NvZzEfY8id+AuZqcjMw1r
 pH1bb9nnVCU7XNdvNvw6MWnTGQ==
X-Google-Smtp-Source: APXvYqyDKTbRPkOF65wNMt1w7Mq9Mnp6ILlQSauLNl98kr/shXtSs+bsmVZYN5NwzaHATleuII4f0g==
X-Received: by 2002:a7b:c018:: with SMTP id c24mr14398730wmb.37.1560250441571; 
 Tue, 11 Jun 2019 03:54:01 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id e17sm10785945wrt.95.2019.06.11.03.54.00
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 11 Jun 2019 03:54:01 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue, 11 Jun 2019 11:53:17 +0100
Message-Id: <20190611105351.9871-9-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190611105351.9871-1-peter.maydell@linaro.org>
References: <20190611105351.9871-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::343
Subject: [Qemu-devel] [PATCH v2 08/42] target/arm: Convert
 VRINTA/VRINTN/VRINTP/VRINTM to decodetree
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
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Convert the VRINTA/VRINTN/VRINTP/VRINTM instructions to decodetree.
Again, trans_VRINT() is temporarily left in translate.c.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c       | 60 +++++++++++++++++++++++-------------
 target/arm/vfp-uncond.decode |  5 +++
 2 files changed, 43 insertions(+), 22 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 53badde1f52..1f106645bca 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -3270,11 +3270,43 @@ static bool trans_VMINMAXNM(DisasContext *s, arg_VMINMAXNM *a)
     return true;
 }
 
-static int handle_vrint(uint32_t insn, uint32_t rd, uint32_t rm, uint32_t dp,
-                        int rounding)
+/*
+ * Table for converting the most common AArch32 encoding of
+ * rounding mode to arm_fprounding order (which matches the
+ * common AArch64 order); see ARM ARM pseudocode FPDecodeRM().
+ */
+static const uint8_t fp_decode_rm[] = {
+    FPROUNDING_TIEAWAY,
+    FPROUNDING_TIEEVEN,
+    FPROUNDING_POSINF,
+    FPROUNDING_NEGINF,
+};
+
+static bool trans_VRINT(DisasContext *s, arg_VRINT *a)
 {
-    TCGv_ptr fpst = get_fpstatus_ptr(0);
+    uint32_t rd, rm;
+    bool dp = a->dp;
+    TCGv_ptr fpst;
     TCGv_i32 tcg_rmode;
+    int rounding = fp_decode_rm[a->rm];
+
+    if (!dc_isar_feature(aa32_vrint, s)) {
+        return false;
+    }
+
+    /* UNDEF accesses to D16-D31 if they don't exist */
+    if (dp && !dc_isar_feature(aa32_fp_d32, s) &&
+        ((a->vm | a->vd) & 0x10)) {
+        return false;
+    }
+    rd = a->vd;
+    rm = a->vm;
+
+    if (!vfp_access_check(s)) {
+        return true;
+    }
+
+    fpst = get_fpstatus_ptr(0);
 
     tcg_rmode = tcg_const_i32(arm_rmode_to_sf(rounding));
     gen_helper_set_rmode(tcg_rmode, tcg_rmode, fpst);
@@ -3305,7 +3337,7 @@ static int handle_vrint(uint32_t insn, uint32_t rd, uint32_t rm, uint32_t dp,
     tcg_temp_free_i32(tcg_rmode);
 
     tcg_temp_free_ptr(fpst);
-    return 0;
+    return true;
 }
 
 static int handle_vcvt(uint32_t insn, uint32_t rd, uint32_t rm, uint32_t dp,
@@ -3366,17 +3398,6 @@ static int handle_vcvt(uint32_t insn, uint32_t rd, uint32_t rm, uint32_t dp,
     return 0;
 }
 
-/* Table for converting the most common AArch32 encoding of
- * rounding mode to arm_fprounding order (which matches the
- * common AArch64 order); see ARM ARM pseudocode FPDecodeRM().
- */
-static const uint8_t fp_decode_rm[] = {
-    FPROUNDING_TIEAWAY,
-    FPROUNDING_TIEEVEN,
-    FPROUNDING_POSINF,
-    FPROUNDING_NEGINF,
-};
-
 static int disas_vfp_misc_insn(DisasContext *s, uint32_t insn)
 {
     uint32_t rd, rm, dp = extract32(insn, 8, 1);
@@ -3389,13 +3410,8 @@ static int disas_vfp_misc_insn(DisasContext *s, uint32_t insn)
         rm = VFP_SREG_M(insn);
     }
 
-    if ((insn & 0x0fbc0ed0) == 0x0eb80a40 &&
-        dc_isar_feature(aa32_vrint, s)) {
-        /* VRINTA, VRINTN, VRINTP, VRINTM */
-        int rounding = fp_decode_rm[extract32(insn, 16, 2)];
-        return handle_vrint(insn, rd, rm, dp, rounding);
-    } else if ((insn & 0x0fbc0e50) == 0x0ebc0a40 &&
-               dc_isar_feature(aa32_vcvt_dr, s)) {
+    if ((insn & 0x0fbc0e50) == 0x0ebc0a40 &&
+        dc_isar_feature(aa32_vcvt_dr, s)) {
         /* VCVTA, VCVTN, VCVTP, VCVTM */
         int rounding = fp_decode_rm[extract32(insn, 16, 2)];
         return handle_vcvt(insn, rd, rm, dp, rounding);
diff --git a/target/arm/vfp-uncond.decode b/target/arm/vfp-uncond.decode
index 8ab201fa058..0aa83285de2 100644
--- a/target/arm/vfp-uncond.decode
+++ b/target/arm/vfp-uncond.decode
@@ -50,3 +50,8 @@ VMINMAXNM   1111 1110 1.00 .... .... 1010 . op:1 .0 .... \
             vm=%vm_sp vn=%vn_sp vd=%vd_sp dp=0
 VMINMAXNM   1111 1110 1.00 .... .... 1011 . op:1 .0 .... \
             vm=%vm_dp vn=%vn_dp vd=%vd_dp dp=1
+
+VRINT       1111 1110 1.11 10 rm:2 .... 1010 01.0 .... \
+            vm=%vm_sp vd=%vd_sp dp=0
+VRINT       1111 1110 1.11 10 rm:2 .... 1011 01.0 .... \
+            vm=%vm_dp vd=%vd_dp dp=1
-- 
2.20.1


