Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 959623CA69
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Jun 2019 13:52:06 +0200 (CEST)
Received: from localhost ([::1]:56674 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hafJt-0007Bo-Ol
	for lists+qemu-devel@lfdr.de; Tue, 11 Jun 2019 07:52:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39644)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <peter.maydell@linaro.org>) id 1haeQQ-0007de-Al
 for qemu-devel@nongnu.org; Tue, 11 Jun 2019 06:54:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1haeQK-0007qU-L3
 for qemu-devel@nongnu.org; Tue, 11 Jun 2019 06:54:46 -0400
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:43071)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1haeQK-0007ot-2l
 for qemu-devel@nongnu.org; Tue, 11 Jun 2019 06:54:40 -0400
Received: by mail-wr1-x441.google.com with SMTP id p13so2389334wru.10
 for <qemu-devel@nongnu.org>; Tue, 11 Jun 2019 03:54:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gPYLikUR5ZuBlGRaNvlfd3hHYV0xbs6/Y2luBsY5Vwk=;
 b=cY2uIjwJlfKnxKC5LvBX2R1HHBm6XmPD5C5JRZiBG7PpDMpQ+ID1a3JR2qC9OezKYb
 xdL65tJIR84ZILz7hKKYNUVTM7g5g7ex+diwwX5wEYSnNze5WP1eGowKOX2u5NC7zf/O
 PFRKzrX8Rg/BqaAclpyrAetH8wsNT0wWo7FiYV/T40SKeDkOjA1JSRYhu6cPVdVQm5P5
 IagG0rJX7+UG1FGCMDnpkixlHJ2AWAm9YoFFR2z6oDyT0BUF30ycTsu60bdeMGOmxS5W
 UKdlNIYM+JzvOPyOyRUoI3AGcENMyhUuID25v7U0eUzzao6YsObZaWN3/RUHEO0A09q9
 4asA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gPYLikUR5ZuBlGRaNvlfd3hHYV0xbs6/Y2luBsY5Vwk=;
 b=JYbHYxwA8G876965l9Pi2S4O969DZ10gYlGZvY3dwtlHHMw+dx+zBKHSL4GP0QO1vI
 i3hb3gbCACnApMx2b249ycQXaTAaqz8fbN4z2yp8M/bbclueZzdpMt3ky88s689TK2/N
 5huKV1AvsEFPKg+E4lqkbKyaiB+Hz5lenwS+UeF6OmdsU6UJDtt0jWbaMH4PcBA6NJ+N
 96mtrBA+oEvaYcqpzVkxMt3UPTLyE86h2FSe6lYSR7D1rKq7rQyK8yx40foyi0tQ6vIl
 d2UcZbHyW+NPit60iKlKsYjgKbhmUEXxENxT+sG3IqLVplAEl5PqcZrESLie89BQUZUL
 gTaQ==
X-Gm-Message-State: APjAAAXaKvyJqlrEfE8UOKCgOgbAwiUrDyHV0kNUobCyFKkFU5gsI1XR
 +XI92jQmOxwHrwehVLHz95BnRQ==
X-Google-Smtp-Source: APXvYqwPNxkMr+rH/6upO97V6/B0VRUGTcRxfdRx3evHQ1BHC/zQpSRJCOW7ot7Z5KTmN9TdJIx0+w==
X-Received: by 2002:adf:9dcc:: with SMTP id q12mr24220861wre.93.1560250478626; 
 Tue, 11 Jun 2019 03:54:38 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id e17sm10785945wrt.95.2019.06.11.03.54.37
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 11 Jun 2019 03:54:38 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue, 11 Jun 2019 11:53:51 +0100
Message-Id: <20190611105351.9871-43-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190611105351.9871-1-peter.maydell@linaro.org>
References: <20190611105351.9871-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::441
Subject: [Qemu-devel] [PATCH v2 42/42] target/arm: Fix short-vector
 increment behaviour
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

For VFP short vectors, the VFP registers are divided into a
series of banks: for single-precision these are s0-s7, s8-s15,
s16-s23 and s24-s31; for double-precision they are d0-d3,
d4-d7, ... d28-d31. Some banks are "scalar" meaning that
use of a register within them triggers a pure-scalar or
mixed vector-scalar operation rather than a full vector
operation. The scalar banks are s0-s7, d0-d3 and d16-d19.
When using a bank as part of a vector operation, we
iterate through it, increasing the register number by
the specified stride each time, and wrapping around to
the beginning of the bank.

Unfortunately our calculation of the "increment" part of this
was incorrect:
 vd = ((vd + delta_d) & (bank_mask - 1)) | (vd & bank_mask)
will only do the intended thing if bank_mask has exactly
one set high bit. For instance for doubles (bank_mask = 0xc),
if we start with vd = 6 and delta_d = 2 then vd is updated
to 12 rather than the intended 4.

This only causes problems in the unlikely case that the
starting register is not the first in its bank: if the
register number doesn't have to wrap around then the
expression happens to give the right answer.

Fix this bug by abstracting out the "check whether register
is in a scalar bank" and "advance register within bank"
operations to utility functions which use the right
bit masking operations.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-vfp.inc.c | 100 ++++++++++++++++++++-------------
 1 file changed, 60 insertions(+), 40 deletions(-)

diff --git a/target/arm/translate-vfp.inc.c b/target/arm/translate-vfp.inc.c
index 8216dba796e..709fc65374d 100644
--- a/target/arm/translate-vfp.inc.c
+++ b/target/arm/translate-vfp.inc.c
@@ -1139,6 +1139,42 @@ typedef void VFPGen3OpDPFn(TCGv_i64 vd,
 typedef void VFPGen2OpSPFn(TCGv_i32 vd, TCGv_i32 vm);
 typedef void VFPGen2OpDPFn(TCGv_i64 vd, TCGv_i64 vm);
 
+/*
+ * Return true if the specified S reg is in a scalar bank
+ * (ie if it is s0..s7)
+ */
+static inline bool vfp_sreg_is_scalar(int reg)
+{
+    return (reg & 0x18) == 0;
+}
+
+/*
+ * Return true if the specified D reg is in a scalar bank
+ * (ie if it is d0..d3 or d16..d19)
+ */
+static inline bool vfp_dreg_is_scalar(int reg)
+{
+    return (reg & 0xc) == 0;
+}
+
+/*
+ * Advance the S reg number forwards by delta within its bank
+ * (ie increment the low 3 bits but leave the rest the same)
+ */
+static inline int vfp_advance_sreg(int reg, int delta)
+{
+    return ((reg + delta) & 0x7) | (reg & ~0x7);
+}
+
+/*
+ * Advance the D reg number forwards by delta within its bank
+ * (ie increment the low 2 bits but leave the rest the same)
+ */
+static inline int vfp_advance_dreg(int reg, int delta)
+{
+    return ((reg + delta) & 0x3) | (reg & ~0x3);
+}
+
 /*
  * Perform a 3-operand VFP data processing instruction. fn is the
  * callback to do the actual operation; this function deals with the
@@ -1149,7 +1185,6 @@ static bool do_vfp_3op_sp(DisasContext *s, VFPGen3OpSPFn *fn,
 {
     uint32_t delta_m = 0;
     uint32_t delta_d = 0;
-    uint32_t bank_mask = 0;
     int veclen = s->vec_len;
     TCGv_i32 f0, f1, fd;
     TCGv_ptr fpst;
@@ -1164,16 +1199,14 @@ static bool do_vfp_3op_sp(DisasContext *s, VFPGen3OpSPFn *fn,
     }
 
     if (veclen > 0) {
-        bank_mask = 0x18;
-
         /* Figure out what type of vector operation this is.  */
-        if ((vd & bank_mask) == 0) {
+        if (vfp_sreg_is_scalar(vd)) {
             /* scalar */
             veclen = 0;
         } else {
             delta_d = s->vec_stride + 1;
 
-            if ((vm & bank_mask) == 0) {
+            if (vfp_sreg_is_scalar(vm)) {
                 /* mixed scalar/vector */
                 delta_m = 0;
             } else {
@@ -1204,11 +1237,11 @@ static bool do_vfp_3op_sp(DisasContext *s, VFPGen3OpSPFn *fn,
 
         /* Set up the operands for the next iteration */
         veclen--;
-        vd = ((vd + delta_d) & (bank_mask - 1)) | (vd & bank_mask);
-        vn = ((vn + delta_d) & (bank_mask - 1)) | (vn & bank_mask);
+        vd = vfp_advance_sreg(vd, delta_d);
+        vn = vfp_advance_sreg(vn, delta_d);
         neon_load_reg32(f0, vn);
         if (delta_m) {
-            vm = ((vm + delta_m) & (bank_mask - 1)) | (vm & bank_mask);
+            vm = vfp_advance_sreg(vm, delta_m);
             neon_load_reg32(f1, vm);
         }
     }
@@ -1226,7 +1259,6 @@ static bool do_vfp_3op_dp(DisasContext *s, VFPGen3OpDPFn *fn,
 {
     uint32_t delta_m = 0;
     uint32_t delta_d = 0;
-    uint32_t bank_mask = 0;
     int veclen = s->vec_len;
     TCGv_i64 f0, f1, fd;
     TCGv_ptr fpst;
@@ -1246,16 +1278,14 @@ static bool do_vfp_3op_dp(DisasContext *s, VFPGen3OpDPFn *fn,
     }
 
     if (veclen > 0) {
-        bank_mask = 0xc;
-
         /* Figure out what type of vector operation this is.  */
-        if ((vd & bank_mask) == 0) {
+        if (vfp_dreg_is_scalar(vd)) {
             /* scalar */
             veclen = 0;
         } else {
             delta_d = (s->vec_stride >> 1) + 1;
 
-            if ((vm & bank_mask) == 0) {
+            if (vfp_dreg_is_scalar(vm)) {
                 /* mixed scalar/vector */
                 delta_m = 0;
             } else {
@@ -1285,11 +1315,11 @@ static bool do_vfp_3op_dp(DisasContext *s, VFPGen3OpDPFn *fn,
         }
         /* Set up the operands for the next iteration */
         veclen--;
-        vd = ((vd + delta_d) & (bank_mask - 1)) | (vd & bank_mask);
-        vn = ((vn + delta_d) & (bank_mask - 1)) | (vn & bank_mask);
+        vd = vfp_advance_dreg(vd, delta_d);
+        vn = vfp_advance_dreg(vn, delta_d);
         neon_load_reg64(f0, vn);
         if (delta_m) {
-            vm = ((vm + delta_m) & (bank_mask - 1)) | (vm & bank_mask);
+            vm = vfp_advance_dreg(vm, delta_m);
             neon_load_reg64(f1, vm);
         }
     }
@@ -1306,7 +1336,6 @@ static bool do_vfp_2op_sp(DisasContext *s, VFPGen2OpSPFn *fn, int vd, int vm)
 {
     uint32_t delta_m = 0;
     uint32_t delta_d = 0;
-    uint32_t bank_mask = 0;
     int veclen = s->vec_len;
     TCGv_i32 f0, fd;
 
@@ -1320,16 +1349,14 @@ static bool do_vfp_2op_sp(DisasContext *s, VFPGen2OpSPFn *fn, int vd, int vm)
     }
 
     if (veclen > 0) {
-        bank_mask = 0x18;
-
         /* Figure out what type of vector operation this is.  */
-        if ((vd & bank_mask) == 0) {
+        if (vfp_sreg_is_scalar(vd)) {
             /* scalar */
             veclen = 0;
         } else {
             delta_d = s->vec_stride + 1;
 
-            if ((vm & bank_mask) == 0) {
+            if (vfp_sreg_is_scalar(vm)) {
                 /* mixed scalar/vector */
                 delta_m = 0;
             } else {
@@ -1355,7 +1382,7 @@ static bool do_vfp_2op_sp(DisasContext *s, VFPGen2OpSPFn *fn, int vd, int vm)
         if (delta_m == 0) {
             /* single source one-many */
             while (veclen--) {
-                vd = ((vd + delta_d) & (bank_mask - 1)) | (vd & bank_mask);
+                vd = vfp_advance_sreg(vd, delta_d);
                 neon_store_reg32(fd, vd);
             }
             break;
@@ -1363,8 +1390,8 @@ static bool do_vfp_2op_sp(DisasContext *s, VFPGen2OpSPFn *fn, int vd, int vm)
 
         /* Set up the operands for the next iteration */
         veclen--;
-        vd = ((vd + delta_d) & (bank_mask - 1)) | (vd & bank_mask);
-        vm = ((vm + delta_m) & (bank_mask - 1)) | (vm & bank_mask);
+        vd = vfp_advance_sreg(vd, delta_d);
+        vm = vfp_advance_sreg(vm, delta_m);
         neon_load_reg32(f0, vm);
     }
 
@@ -1378,7 +1405,6 @@ static bool do_vfp_2op_dp(DisasContext *s, VFPGen2OpDPFn *fn, int vd, int vm)
 {
     uint32_t delta_m = 0;
     uint32_t delta_d = 0;
-    uint32_t bank_mask = 0;
     int veclen = s->vec_len;
     TCGv_i64 f0, fd;
 
@@ -1397,16 +1423,14 @@ static bool do_vfp_2op_dp(DisasContext *s, VFPGen2OpDPFn *fn, int vd, int vm)
     }
 
     if (veclen > 0) {
-        bank_mask = 0xc;
-
         /* Figure out what type of vector operation this is.  */
-        if ((vd & bank_mask) == 0) {
+        if (vfp_dreg_is_scalar(vd)) {
             /* scalar */
             veclen = 0;
         } else {
             delta_d = (s->vec_stride >> 1) + 1;
 
-            if ((vm & bank_mask) == 0) {
+            if (vfp_dreg_is_scalar(vm)) {
                 /* mixed scalar/vector */
                 delta_m = 0;
             } else {
@@ -1432,7 +1456,7 @@ static bool do_vfp_2op_dp(DisasContext *s, VFPGen2OpDPFn *fn, int vd, int vm)
         if (delta_m == 0) {
             /* single source one-many */
             while (veclen--) {
-                vd = ((vd + delta_d) & (bank_mask - 1)) | (vd & bank_mask);
+                vd = vfp_advance_dreg(vd, delta_d);
                 neon_store_reg64(fd, vd);
             }
             break;
@@ -1440,8 +1464,8 @@ static bool do_vfp_2op_dp(DisasContext *s, VFPGen2OpDPFn *fn, int vd, int vm)
 
         /* Set up the operands for the next iteration */
         veclen--;
-        vd = ((vd + delta_d) & (bank_mask - 1)) | (vd & bank_mask);
-        vm = ((vm + delta_m) & (bank_mask - 1)) | (vm & bank_mask);
+        vd = vfp_advance_dreg(vd, delta_d);
+        vd = vfp_advance_dreg(vm, delta_m);
         neon_load_reg64(f0, vm);
     }
 
@@ -1783,7 +1807,6 @@ static bool trans_VFM_dp(DisasContext *s, arg_VFM_sp *a)
 static bool trans_VMOV_imm_sp(DisasContext *s, arg_VMOV_imm_sp *a)
 {
     uint32_t delta_d = 0;
-    uint32_t bank_mask = 0;
     int veclen = s->vec_len;
     TCGv_i32 fd;
     uint32_t n, i, vd;
@@ -1804,9 +1827,8 @@ static bool trans_VMOV_imm_sp(DisasContext *s, arg_VMOV_imm_sp *a)
     }
 
     if (veclen > 0) {
-        bank_mask = 0x18;
         /* Figure out what type of vector operation this is.  */
-        if ((vd & bank_mask) == 0) {
+        if (vfp_sreg_is_scalar(vd)) {
             /* scalar */
             veclen = 0;
         } else {
@@ -1835,7 +1857,7 @@ static bool trans_VMOV_imm_sp(DisasContext *s, arg_VMOV_imm_sp *a)
 
         /* Set up the operands for the next iteration */
         veclen--;
-        vd = ((vd + delta_d) & (bank_mask - 1)) | (vd & bank_mask);
+        vd = vfp_advance_sreg(vd, delta_d);
     }
 
     tcg_temp_free_i32(fd);
@@ -1845,7 +1867,6 @@ static bool trans_VMOV_imm_sp(DisasContext *s, arg_VMOV_imm_sp *a)
 static bool trans_VMOV_imm_dp(DisasContext *s, arg_VMOV_imm_dp *a)
 {
     uint32_t delta_d = 0;
-    uint32_t bank_mask = 0;
     int veclen = s->vec_len;
     TCGv_i64 fd;
     uint32_t n, i, vd;
@@ -1871,9 +1892,8 @@ static bool trans_VMOV_imm_dp(DisasContext *s, arg_VMOV_imm_dp *a)
     }
 
     if (veclen > 0) {
-        bank_mask = 0xc;
         /* Figure out what type of vector operation this is.  */
-        if ((vd & bank_mask) == 0) {
+        if (vfp_dreg_is_scalar(vd)) {
             /* scalar */
             veclen = 0;
         } else {
@@ -1902,7 +1922,7 @@ static bool trans_VMOV_imm_dp(DisasContext *s, arg_VMOV_imm_dp *a)
 
         /* Set up the operands for the next iteration */
         veclen--;
-        vd = ((vd + delta_d) & (bank_mask - 1)) | (vd & bank_mask);
+        vfp_advance_dreg(vd, delta_d);
     }
 
     tcg_temp_free_i64(fd);
-- 
2.20.1


