Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CB793CA44
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Jun 2019 13:44:50 +0200 (CEST)
Received: from localhost ([::1]:56552 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hafCr-0006uw-MA
	for lists+qemu-devel@lfdr.de; Tue, 11 Jun 2019 07:44:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39676)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <peter.maydell@linaro.org>) id 1haeQR-0007eb-6y
 for qemu-devel@nongnu.org; Tue, 11 Jun 2019 06:54:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1haeQL-0007rS-4l
 for qemu-devel@nongnu.org; Tue, 11 Jun 2019 06:54:47 -0400
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344]:56301)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1haeQK-0007jq-Pp
 for qemu-devel@nongnu.org; Tue, 11 Jun 2019 06:54:40 -0400
Received: by mail-wm1-x344.google.com with SMTP id a15so2411574wmj.5
 for <qemu-devel@nongnu.org>; Tue, 11 Jun 2019 03:54:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1VkCR1NkBZGtfT3jf+6dPh/fqnTQfgXi5PHrX9FURiE=;
 b=MgsPkfZQKvQhBOPeBVAvACORyU1TpD7mPMy3sEb+KIvgGfRziImaAvZhntqqrf4WI8
 avf3cjf9eu26OKjib2d0vl979ST87jKdqL8I67Sq/N2J+u50Wl3V0lol7Hs0AhiMk4Al
 FSgIa+citxnvocXnjfeHwDixIyCc8GqF3uLyBmROtSEVzwzra2jlPenbypzl86ghNIxn
 keCe0j4MJDb5/PVVAMwsBziKtbLSrhpidr25yQOJKLc+e0XKDiOgBTS/SJfTk+hF3m8P
 QAbfxYgJ7uJADNZZ2de8Ffo4Unwj/wcB+l2Iyz5BWmBGze+am+fVlu2K1FWgA7by6eIq
 S9Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1VkCR1NkBZGtfT3jf+6dPh/fqnTQfgXi5PHrX9FURiE=;
 b=SekcEG5OI/AQk84X5z1khs/W0EJa81v8YZenbOLC0Brw/1m0C6NY87r2COu6ZdYkMk
 sor1ms/whsRhyqKZbE0sKQOU7uEdRc2EBxXD2hzG14slYLMpNpGJcYQLwd0q5sfrXX5M
 Aib2HjbIZKCQv251Ck0ow2mjj7a2yRU+cRO24qvZ/tFBXDg3cGYnM+eG0aEcao1z0f0y
 J9Samw3+pRzvXCLDQLhNqgD/4TfJFjFvKvT2a91Bpwm6jxH45uOrKOziTkTSgSTAQdTk
 W0a83mA5xXH1l6fwpfgueZ0AthqkGnj3zpQ8YjxxWY6u11EIbS3tmk1ZkRXntZkb4rhg
 M7CA==
X-Gm-Message-State: APjAAAUUXmNfmst6KHmQ+i7yMR/Ydx8AUe2LdxdqFnmk/HBRdnKi90d7
 I3jSUGgmIzgZMeChpWabJB+KcA==
X-Google-Smtp-Source: APXvYqxJmHiUWMAKpztg7yRi7YotvQiFMaEKFtLOdRAXIHZOUe0wdLsNMtVIPW2MnvCE7uOFAcHD3Q==
X-Received: by 2002:a1c:2d5:: with SMTP id 204mr18341286wmc.175.1560250472416; 
 Tue, 11 Jun 2019 03:54:32 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id e17sm10785945wrt.95.2019.06.11.03.54.31
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 11 Jun 2019 03:54:31 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue, 11 Jun 2019 11:53:45 +0100
Message-Id: <20190611105351.9871-37-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190611105351.9871-1-peter.maydell@linaro.org>
References: <20190611105351.9871-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::344
Subject: [Qemu-devel] [PATCH v2 36/42] target/arm: Convert VFP round insns
 to decodetree
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

Convert the VFP round-to-integer instructions VRINTR, VRINTZ and
VRINTX to decodetree.

These instructions were only introduced as part of the "VFP misc"
additions in v8A, so we check this. The old decoder's implementation
was incorrectly providing them even for v7A CPUs.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-vfp.inc.c | 163 +++++++++++++++++++++++++++++++++
 target/arm/translate.c         |  45 +--------
 target/arm/vfp.decode          |  15 +++
 3 files changed, 179 insertions(+), 44 deletions(-)

diff --git a/target/arm/translate-vfp.inc.c b/target/arm/translate-vfp.inc.c
index a19ede86719..e94a8f2f0c5 100644
--- a/target/arm/translate-vfp.inc.c
+++ b/target/arm/translate-vfp.inc.c
@@ -2157,3 +2157,166 @@ static bool trans_VCVT_f16_f64(DisasContext *s, arg_VCVT_f16_f64 *a)
     tcg_temp_free_i32(tmp);
     return true;
 }
+
+static bool trans_VRINTR_sp(DisasContext *s, arg_VRINTR_sp *a)
+{
+    TCGv_ptr fpst;
+    TCGv_i32 tmp;
+
+    if (!dc_isar_feature(aa32_vrint, s)) {
+        return false;
+    }
+
+    if (!vfp_access_check(s)) {
+        return true;
+    }
+
+    tmp = tcg_temp_new_i32();
+    neon_load_reg32(tmp, a->vm);
+    fpst = get_fpstatus_ptr(false);
+    gen_helper_rints(tmp, tmp, fpst);
+    neon_store_reg32(tmp, a->vd);
+    tcg_temp_free_ptr(fpst);
+    tcg_temp_free_i32(tmp);
+    return true;
+}
+
+static bool trans_VRINTR_dp(DisasContext *s, arg_VRINTR_sp *a)
+{
+    TCGv_ptr fpst;
+    TCGv_i64 tmp;
+
+    if (!dc_isar_feature(aa32_vrint, s)) {
+        return false;
+    }
+
+    /* UNDEF accesses to D16-D31 if they don't exist. */
+    if (!dc_isar_feature(aa32_fp_d32, s) && ((a->vd | a->vm) & 0x10)) {
+        return false;
+    }
+
+    if (!vfp_access_check(s)) {
+        return true;
+    }
+
+    tmp = tcg_temp_new_i64();
+    neon_load_reg64(tmp, a->vm);
+    fpst = get_fpstatus_ptr(false);
+    gen_helper_rintd(tmp, tmp, fpst);
+    neon_store_reg64(tmp, a->vd);
+    tcg_temp_free_ptr(fpst);
+    tcg_temp_free_i64(tmp);
+    return true;
+}
+
+static bool trans_VRINTZ_sp(DisasContext *s, arg_VRINTZ_sp *a)
+{
+    TCGv_ptr fpst;
+    TCGv_i32 tmp;
+    TCGv_i32 tcg_rmode;
+
+    if (!dc_isar_feature(aa32_vrint, s)) {
+        return false;
+    }
+
+    if (!vfp_access_check(s)) {
+        return true;
+    }
+
+    tmp = tcg_temp_new_i32();
+    neon_load_reg32(tmp, a->vm);
+    fpst = get_fpstatus_ptr(false);
+    tcg_rmode = tcg_const_i32(float_round_to_zero);
+    gen_helper_set_rmode(tcg_rmode, tcg_rmode, fpst);
+    gen_helper_rints(tmp, tmp, fpst);
+    gen_helper_set_rmode(tcg_rmode, tcg_rmode, fpst);
+    neon_store_reg32(tmp, a->vd);
+    tcg_temp_free_ptr(fpst);
+    tcg_temp_free_i32(tcg_rmode);
+    tcg_temp_free_i32(tmp);
+    return true;
+}
+
+static bool trans_VRINTZ_dp(DisasContext *s, arg_VRINTZ_sp *a)
+{
+    TCGv_ptr fpst;
+    TCGv_i64 tmp;
+    TCGv_i32 tcg_rmode;
+
+    if (!dc_isar_feature(aa32_vrint, s)) {
+        return false;
+    }
+
+    /* UNDEF accesses to D16-D31 if they don't exist. */
+    if (!dc_isar_feature(aa32_fp_d32, s) && ((a->vd | a->vm) & 0x10)) {
+        return false;
+    }
+
+    if (!vfp_access_check(s)) {
+        return true;
+    }
+
+    tmp = tcg_temp_new_i64();
+    neon_load_reg64(tmp, a->vm);
+    fpst = get_fpstatus_ptr(false);
+    tcg_rmode = tcg_const_i32(float_round_to_zero);
+    gen_helper_set_rmode(tcg_rmode, tcg_rmode, fpst);
+    gen_helper_rintd(tmp, tmp, fpst);
+    gen_helper_set_rmode(tcg_rmode, tcg_rmode, fpst);
+    neon_store_reg64(tmp, a->vd);
+    tcg_temp_free_ptr(fpst);
+    tcg_temp_free_i64(tmp);
+    tcg_temp_free_i32(tcg_rmode);
+    return true;
+}
+
+static bool trans_VRINTX_sp(DisasContext *s, arg_VRINTX_sp *a)
+{
+    TCGv_ptr fpst;
+    TCGv_i32 tmp;
+
+    if (!dc_isar_feature(aa32_vrint, s)) {
+        return false;
+    }
+
+    if (!vfp_access_check(s)) {
+        return true;
+    }
+
+    tmp = tcg_temp_new_i32();
+    neon_load_reg32(tmp, a->vm);
+    fpst = get_fpstatus_ptr(false);
+    gen_helper_rints_exact(tmp, tmp, fpst);
+    neon_store_reg32(tmp, a->vd);
+    tcg_temp_free_ptr(fpst);
+    tcg_temp_free_i32(tmp);
+    return true;
+}
+
+static bool trans_VRINTX_dp(DisasContext *s, arg_VRINTX_dp *a)
+{
+    TCGv_ptr fpst;
+    TCGv_i64 tmp;
+
+    if (!dc_isar_feature(aa32_vrint, s)) {
+        return false;
+    }
+
+    /* UNDEF accesses to D16-D31 if they don't exist. */
+    if (!dc_isar_feature(aa32_fp_d32, s) && ((a->vd | a->vm) & 0x10)) {
+        return false;
+    }
+
+    if (!vfp_access_check(s)) {
+        return true;
+    }
+
+    tmp = tcg_temp_new_i64();
+    neon_load_reg64(tmp, a->vm);
+    fpst = get_fpstatus_ptr(false);
+    gen_helper_rintd_exact(tmp, tmp, fpst);
+    neon_store_reg64(tmp, a->vd);
+    tcg_temp_free_ptr(fpst);
+    tcg_temp_free_i64(tmp);
+    return true;
+}
diff --git a/target/arm/translate.c b/target/arm/translate.c
index 143b250a996..412d8aaedb2 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -3050,7 +3050,7 @@ static int disas_vfp_insn(DisasContext *s, uint32_t insn)
                 return 1;
             case 15:
                 switch (rn) {
-                case 0 ... 11:
+                case 0 ... 14:
                     /* Already handled by decodetree */
                     return 1;
                 default:
@@ -3063,11 +3063,6 @@ static int disas_vfp_insn(DisasContext *s, uint32_t insn)
             if (op == 15) {
                 /* rn is opcode, encoded as per VFP_SREG_N. */
                 switch (rn) {
-                case 0x0c: /* vrintr */
-                case 0x0d: /* vrintz */
-                case 0x0e: /* vrintx */
-                    break;
-
                 case 0x0f: /* vcvt double<->single */
                     rd_is_dp = !dp;
                     break;
@@ -3190,44 +3185,6 @@ static int disas_vfp_insn(DisasContext *s, uint32_t insn)
                 switch (op) {
                 case 15: /* extension space */
                     switch (rn) {
-                    case 12: /* vrintr */
-                    {
-                        TCGv_ptr fpst = get_fpstatus_ptr(0);
-                        if (dp) {
-                            gen_helper_rintd(cpu_F0d, cpu_F0d, fpst);
-                        } else {
-                            gen_helper_rints(cpu_F0s, cpu_F0s, fpst);
-                        }
-                        tcg_temp_free_ptr(fpst);
-                        break;
-                    }
-                    case 13: /* vrintz */
-                    {
-                        TCGv_ptr fpst = get_fpstatus_ptr(0);
-                        TCGv_i32 tcg_rmode;
-                        tcg_rmode = tcg_const_i32(float_round_to_zero);
-                        gen_helper_set_rmode(tcg_rmode, tcg_rmode, fpst);
-                        if (dp) {
-                            gen_helper_rintd(cpu_F0d, cpu_F0d, fpst);
-                        } else {
-                            gen_helper_rints(cpu_F0s, cpu_F0s, fpst);
-                        }
-                        gen_helper_set_rmode(tcg_rmode, tcg_rmode, fpst);
-                        tcg_temp_free_i32(tcg_rmode);
-                        tcg_temp_free_ptr(fpst);
-                        break;
-                    }
-                    case 14: /* vrintx */
-                    {
-                        TCGv_ptr fpst = get_fpstatus_ptr(0);
-                        if (dp) {
-                            gen_helper_rintd_exact(cpu_F0d, cpu_F0d, fpst);
-                        } else {
-                            gen_helper_rints_exact(cpu_F0s, cpu_F0s, fpst);
-                        }
-                        tcg_temp_free_ptr(fpst);
-                        break;
-                    }
                     case 15: /* single<->double conversion */
                         if (dp) {
                             gen_helper_vfp_fcvtsd(cpu_F0s, cpu_F0d, cpu_env);
diff --git a/target/arm/vfp.decode b/target/arm/vfp.decode
index b88d1d06f02..9942d2ae7ad 100644
--- a/target/arm/vfp.decode
+++ b/target/arm/vfp.decode
@@ -193,3 +193,18 @@ VCVT_f16_f32 ---- 1110 1.11 0011 .... 1010 t:1 1.0 .... \
              vd=%vd_sp vm=%vm_sp
 VCVT_f16_f64 ---- 1110 1.11 0011 .... 1011 t:1 1.0 .... \
              vd=%vd_sp vm=%vm_dp
+
+VRINTR_sp    ---- 1110 1.11 0110 .... 1010 01.0 .... \
+             vd=%vd_sp vm=%vm_sp
+VRINTR_dp    ---- 1110 1.11 0110 .... 1011 01.0 .... \
+             vd=%vd_dp vm=%vm_dp
+
+VRINTZ_sp    ---- 1110 1.11 0110 .... 1010 11.0 .... \
+             vd=%vd_sp vm=%vm_sp
+VRINTZ_dp    ---- 1110 1.11 0110 .... 1011 11.0 .... \
+             vd=%vd_dp vm=%vm_dp
+
+VRINTX_sp    ---- 1110 1.11 0111 .... 1010 01.0 .... \
+             vd=%vd_sp vm=%vm_sp
+VRINTX_dp    ---- 1110 1.11 0111 .... 1011 01.0 .... \
+             vd=%vd_dp vm=%vm_dp
-- 
2.20.1


