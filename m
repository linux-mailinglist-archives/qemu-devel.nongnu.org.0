Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E59B43CA23
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Jun 2019 13:38:08 +0200 (CEST)
Received: from localhost ([::1]:56530 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1haf6O-0003Y6-42
	for lists+qemu-devel@lfdr.de; Tue, 11 Jun 2019 07:38:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39374)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <peter.maydell@linaro.org>) id 1haeQ5-0007NP-Ln
 for qemu-devel@nongnu.org; Tue, 11 Jun 2019 06:54:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1haeQ0-0007Zb-20
 for qemu-devel@nongnu.org; Tue, 11 Jun 2019 06:54:23 -0400
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343]:36479)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1haePz-0007Yq-Ql
 for qemu-devel@nongnu.org; Tue, 11 Jun 2019 06:54:19 -0400
Received: by mail-wm1-x343.google.com with SMTP id u8so2399821wmm.1
 for <qemu-devel@nongnu.org>; Tue, 11 Jun 2019 03:54:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RESFSOfye+/QpUNOwYF+OWDweWBNnoP2IOQhWx0uTd0=;
 b=E43A2t2SDQeoLm2592JvpUMJQmpoXyummNYfKxxtlc4iZP78XXqb+3zBNOlV/LrP3e
 bn+DuUZb9soBvZ2NVgGZVHWe6Z7ieyjmbQydmuZmvSIg6CrOH//4bUCnEmht6JJoJPwh
 6R0CbyfnSfqTb5JlEj8hW0rpw/J/mR+sP3L+ezth/j3rVVY/d6qe1fxWeG0KF/hV75A0
 4tAGMdMv/Fo4GjnLTy0PPgr3xFUxA7tVdMraxRF1Gj46X9tLyzn2JOyWTZyNk6NNFMoG
 nBNkXluKSnE67IUgja/V21KVDEYSxy+6Bjy/85u9/4PfltUQ2212Ub1OY7Qnkw4rbLJ3
 96lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RESFSOfye+/QpUNOwYF+OWDweWBNnoP2IOQhWx0uTd0=;
 b=gIUuQxPw39NUYTNUMpjbkzPfVn9Z/F5BTnGKcGQbOfvcQXQFqdCu4FHuuVZv2T9/Ft
 hGXTiPceNzH43B2fb+B9YGAtHjkx6bsMT9oCUnh+mhLOgBdqRKYq396OTGY4fDX4K1oM
 Jv3ZI82K6jJWPqRsyR4GzAYpAJCVXwmj7MxKHpZrUrUfHEE5kS59V1dep+cPfRBrO3zY
 FQaRCBkEQWJgzJpYI+Wrjb81qPGfj+vzc8p1wFxKNCntlZ1BhzGT97hpJoJYi4gUVly1
 bmTObbT35xO02H1VUci20im7IYWkZXcaBeOH5hR9jAwC/NJTHVFmbvriXknVp5uJ7DeP
 xtPA==
X-Gm-Message-State: APjAAAVSuwoIe/6479t6Vs38grJsy9Y7V+SljCYN9uTpG54Vq1OIxsQl
 klyq/s0zUgfWG4fvHRzk3xl85A==
X-Google-Smtp-Source: APXvYqwnv64dFLa3U8fuqAu5Sskss4wjPq7RrSWZZCBaqx0dGDhzKLZOXS4nhhySlpGQvBlX/kmq8g==
X-Received: by 2002:a1c:a848:: with SMTP id r69mr16623331wme.12.1560250458861; 
 Tue, 11 Jun 2019 03:54:18 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id e17sm10785945wrt.95.2019.06.11.03.54.17
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 11 Jun 2019 03:54:18 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue, 11 Jun 2019 11:53:32 +0100
Message-Id: <20190611105351.9871-24-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190611105351.9871-1-peter.maydell@linaro.org>
References: <20190611105351.9871-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::343
Subject: [Qemu-devel] [PATCH v2 23/42] target/arm: Convert VNMUL to
 decodetree
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

Convert the VNMUL instruction to decodetree.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-vfp.inc.c | 24 ++++++++++++++++++++++++
 target/arm/translate.c         |  7 +------
 target/arm/vfp.decode          |  5 +++++
 3 files changed, 30 insertions(+), 6 deletions(-)

diff --git a/target/arm/translate-vfp.inc.c b/target/arm/translate-vfp.inc.c
index a2afe82b349..4c684f033b6 100644
--- a/target/arm/translate-vfp.inc.c
+++ b/target/arm/translate-vfp.inc.c
@@ -1427,3 +1427,27 @@ static bool trans_VMUL_dp(DisasContext *s, arg_VMUL_sp *a)
 {
     return do_vfp_3op_dp(s, gen_helper_vfp_muld, a->vd, a->vn, a->vm, false);
 }
+
+static void gen_VNMUL_sp(TCGv_i32 vd, TCGv_i32 vn, TCGv_i32 vm, TCGv_ptr fpst)
+{
+    /* VNMUL: -(fn * fm) */
+    gen_helper_vfp_muls(vd, vn, vm, fpst);
+    gen_helper_vfp_negs(vd, vd);
+}
+
+static bool trans_VNMUL_sp(DisasContext *s, arg_VNMUL_sp *a)
+{
+    return do_vfp_3op_sp(s, gen_VNMUL_sp, a->vd, a->vn, a->vm, false);
+}
+
+static void gen_VNMUL_dp(TCGv_i64 vd, TCGv_i64 vn, TCGv_i64 vm, TCGv_ptr fpst)
+{
+    /* VNMUL: -(fn * fm) */
+    gen_helper_vfp_muld(vd, vn, vm, fpst);
+    gen_helper_vfp_negd(vd, vd);
+}
+
+static bool trans_VNMUL_dp(DisasContext *s, arg_VNMUL_sp *a)
+{
+    return do_vfp_3op_dp(s, gen_VNMUL_dp, a->vd, a->vn, a->vm, false);
+}
diff --git a/target/arm/translate.c b/target/arm/translate.c
index 96790e65c6f..1f9fa6b03a1 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -1388,7 +1388,6 @@ static inline void gen_vfp_##name(int dp)                             \
 
 VFP_OP2(add)
 VFP_OP2(sub)
-VFP_OP2(mul)
 VFP_OP2(div)
 
 #undef VFP_OP2
@@ -3112,7 +3111,7 @@ static int disas_vfp_insn(DisasContext *s, uint32_t insn)
             rn = VFP_SREG_N(insn);
 
             switch (op) {
-            case 0 ... 4:
+            case 0 ... 5:
                 /* Already handled by decodetree */
                 return 1;
             default:
@@ -3298,10 +3297,6 @@ static int disas_vfp_insn(DisasContext *s, uint32_t insn)
             for (;;) {
                 /* Perform the calculation.  */
                 switch (op) {
-                case 5: /* nmul: -(fn * fm) */
-                    gen_vfp_mul(dp);
-                    gen_vfp_neg(dp);
-                    break;
                 case 6: /* add: fn + fm */
                     gen_vfp_add(dp);
                     break;
diff --git a/target/arm/vfp.decode b/target/arm/vfp.decode
index d7fcb9709a9..3063fcac23f 100644
--- a/target/arm/vfp.decode
+++ b/target/arm/vfp.decode
@@ -122,3 +122,8 @@ VMUL_sp      ---- 1110 0.10 .... .... 1010 .0.0 .... \
              vm=%vm_sp vn=%vn_sp vd=%vd_sp
 VMUL_dp      ---- 1110 0.10 .... .... 1011 .0.0 .... \
              vm=%vm_dp vn=%vn_dp vd=%vd_dp
+
+VNMUL_sp     ---- 1110 0.10 .... .... 1010 .1.0 .... \
+             vm=%vm_sp vn=%vn_sp vd=%vd_sp
+VNMUL_dp     ---- 1110 0.10 .... .... 1011 .1.0 .... \
+             vm=%vm_dp vn=%vn_dp vd=%vd_dp
-- 
2.20.1


