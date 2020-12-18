Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1767D2DDE7E
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Dec 2020 07:17:07 +0100 (CET)
Received: from localhost ([::1]:51134 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kq94c-0003QA-3b
	for lists+qemu-devel@lfdr.de; Fri, 18 Dec 2020 01:17:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52296)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=614e9c0eb=alistair.francis@wdc.com>)
 id 1kq8q3-0005cH-3R
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 01:02:03 -0500
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:9925)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=614e9c0eb=alistair.francis@wdc.com>)
 id 1kq8pz-0002GA-Od
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 01:02:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1608271646; x=1639807646;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=TeREDJJlAhx7bfKvAXQG+kz695n6jN9kYM6+F6TSDQI=;
 b=VhVEdM5+ppWQXjuWjO35rBhH6E4uejFnXS2OXuvcfswizP2tvF1qrAxX
 RHZ0IvTVmr8EnbeMMdHf3+3MyeF3jJSG5kuJhxqhOMAba2HUDpv0gO3GJ
 GvTM+cC5xcEBQk/2jWrWeddzQdAwrEn9mdN2s8ZUeVdWuLIlvRBsVLb8r
 VrTK5+c/ydcTjqUiBFyCb/OlKyb5icv8jd7ENRnXFlHpZMxXLpRo6Bywf
 3VGCeYS+999IQ79m5aHUwrLA0wOy40BL56qjFtFeBEqgjA8Mv7GJID/Xb
 uyweJmw/INHYJVA8QPnupX3lZqjKMVMOTvCcYaJ7cvy1w2FrFORH/wOEd g==;
IronPort-SDR: WhD6J8ZVrGJD9CiN35g7yOQu1JAo9J3BEtvsDwUI4W1kDSUzLVzggRPhNhQQbR5ZgURagKftpO
 fXtju5yaFNutwlqLyN74RLwJEJxqZ7Q+y1x1f3NuY446RVE5b4ewEimHCbRe3MWMFWjj6wc75A
 4HRpZvy5AqTc59oSWc8pDZMp0MxqVe6FkjUn/HVvFzyWXb1slZWo2Y8XBTIi5Y6OZ46AU0HG1/
 s2YK5ocvEuvYmm3WibBJo9msaxv0OzFJiOTOjElxnZmtH94mP/A0OZgC6aZx77kAjE+bOgcjpm
 RY0=
X-IronPort-AV: E=Sophos;i="5.78,429,1599494400"; d="scan'208";a="259237064"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 18 Dec 2020 14:06:31 +0800
IronPort-SDR: CprmsdUy6vENhY5THcs1XqNp8R0WPBl6F34BnyOC7gBIQu7tWKrHRHfiUqI3+ZMYH4MOS2lD9n
 Fb83ny3c5yf/vF7vESSEnbAg/yshD2REkXdBzyfM10aXNTJ9dH8fXsgPQWmdQlVJmHRZTHW/QH
 MxaFfNhYIlmBV3E2PLFSpnvsYcjRijxwCAPwQWTLUERzB/hm8xk4cspI0oNA0pPKURxYQ4x9T7
 YJar9afX3pCOBGzjXTC2UfOo5ZeV080XVA4ymq9G7XEB1jaaFwxh6WeKcOYH3BP042XPtpCoH8
 ziBJoydi/+/MhdufYlNs1zz0
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2020 21:46:39 -0800
IronPort-SDR: ZPEEhgE973kfEazKlvuWwodvSKbF7V3tuZcOjbcH+wQLljpN032dsYPt8g3y03h/RA6I5WuaE6
 N1ui/N2VnJkzh6wZ46E+OBsx2zGWaplIC+JyEP00dIZvhLe8oPEgw4Nw2LNvjmYe0gHY9Rgkdo
 GlrkpQYDVRE9G1Gagf+S9fFD/g1DSCQqIMu2A1unnzb7JGjaxm2waCVr4+Wrh4F0Dhr13LQdMo
 c2O3Q/KpkBPnk3b+wd48bWsqVi6EBSC7hdNMHqP4GffygPKnEzMO4zf4L4sl4s9uq21aZxK1Ir
 v78=
WDCIronportException: Internal
Received: from 6hj08h2.ad.shared (HELO risc6-mainframe.hgst.com)
 ([10.86.62.68])
 by uls-op-cesaip01.wdc.com with ESMTP; 17 Dec 2020 22:01:23 -0800
From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Subject: [PULL 15/23] target/riscv: fpu_helper: Match function defs in HELPER
 macros
Date: Thu, 17 Dec 2020 22:01:06 -0800
Message-Id: <20201218060114.3591217-16-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201218060114.3591217-1-alistair.francis@wdc.com>
References: <20201218060114.3591217-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=68.232.143.124;
 envelope-from=prvs=614e9c0eb=alistair.francis@wdc.com;
 helo=esa2.hgst.iphmx.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_PASS=-0.001,
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
Cc: alistair23@gmail.com, Alistair Francis <alistair.francis@wdc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Update the function definitions generated in helper.h to match the
actual function implementations.

Also remove all compile time XLEN checks when building.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Message-id: 614c369cb0000d070873a647b8aac7e023cba145.1608142916.git.alistair.francis@wdc.com
---
 target/riscv/helper.h     | 24 ++++++++----------------
 target/riscv/fpu_helper.c |  8 --------
 2 files changed, 8 insertions(+), 24 deletions(-)

diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index 939731c345..e3f3f41e89 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -27,16 +27,12 @@ DEF_HELPER_FLAGS_3(flt_s, TCG_CALL_NO_RWG, tl, env, i64, i64)
 DEF_HELPER_FLAGS_3(feq_s, TCG_CALL_NO_RWG, tl, env, i64, i64)
 DEF_HELPER_FLAGS_2(fcvt_w_s, TCG_CALL_NO_RWG, tl, env, i64)
 DEF_HELPER_FLAGS_2(fcvt_wu_s, TCG_CALL_NO_RWG, tl, env, i64)
-#if defined(TARGET_RISCV64)
-DEF_HELPER_FLAGS_2(fcvt_l_s, TCG_CALL_NO_RWG, tl, env, i64)
-DEF_HELPER_FLAGS_2(fcvt_lu_s, TCG_CALL_NO_RWG, tl, env, i64)
-#endif
+DEF_HELPER_FLAGS_2(fcvt_l_s, TCG_CALL_NO_RWG, i64, env, i64)
+DEF_HELPER_FLAGS_2(fcvt_lu_s, TCG_CALL_NO_RWG, i64, env, i64)
 DEF_HELPER_FLAGS_2(fcvt_s_w, TCG_CALL_NO_RWG, i64, env, tl)
 DEF_HELPER_FLAGS_2(fcvt_s_wu, TCG_CALL_NO_RWG, i64, env, tl)
-#if defined(TARGET_RISCV64)
-DEF_HELPER_FLAGS_2(fcvt_s_l, TCG_CALL_NO_RWG, i64, env, tl)
-DEF_HELPER_FLAGS_2(fcvt_s_lu, TCG_CALL_NO_RWG, i64, env, tl)
-#endif
+DEF_HELPER_FLAGS_2(fcvt_s_l, TCG_CALL_NO_RWG, i64, env, i64)
+DEF_HELPER_FLAGS_2(fcvt_s_lu, TCG_CALL_NO_RWG, i64, env, i64)
 DEF_HELPER_FLAGS_1(fclass_s, TCG_CALL_NO_RWG_SE, tl, i64)
 
 /* Floating Point - Double Precision */
@@ -54,16 +50,12 @@ DEF_HELPER_FLAGS_3(flt_d, TCG_CALL_NO_RWG, tl, env, i64, i64)
 DEF_HELPER_FLAGS_3(feq_d, TCG_CALL_NO_RWG, tl, env, i64, i64)
 DEF_HELPER_FLAGS_2(fcvt_w_d, TCG_CALL_NO_RWG, tl, env, i64)
 DEF_HELPER_FLAGS_2(fcvt_wu_d, TCG_CALL_NO_RWG, tl, env, i64)
-#if defined(TARGET_RISCV64)
-DEF_HELPER_FLAGS_2(fcvt_l_d, TCG_CALL_NO_RWG, tl, env, i64)
-DEF_HELPER_FLAGS_2(fcvt_lu_d, TCG_CALL_NO_RWG, tl, env, i64)
-#endif
+DEF_HELPER_FLAGS_2(fcvt_l_d, TCG_CALL_NO_RWG, i64, env, i64)
+DEF_HELPER_FLAGS_2(fcvt_lu_d, TCG_CALL_NO_RWG, i64, env, i64)
 DEF_HELPER_FLAGS_2(fcvt_d_w, TCG_CALL_NO_RWG, i64, env, tl)
 DEF_HELPER_FLAGS_2(fcvt_d_wu, TCG_CALL_NO_RWG, i64, env, tl)
-#if defined(TARGET_RISCV64)
-DEF_HELPER_FLAGS_2(fcvt_d_l, TCG_CALL_NO_RWG, i64, env, tl)
-DEF_HELPER_FLAGS_2(fcvt_d_lu, TCG_CALL_NO_RWG, i64, env, tl)
-#endif
+DEF_HELPER_FLAGS_2(fcvt_d_l, TCG_CALL_NO_RWG, i64, env, i64)
+DEF_HELPER_FLAGS_2(fcvt_d_lu, TCG_CALL_NO_RWG, i64, env, i64)
 DEF_HELPER_FLAGS_1(fclass_d, TCG_CALL_NO_RWG_SE, tl, i64)
 
 /* Special functions */
diff --git a/target/riscv/fpu_helper.c b/target/riscv/fpu_helper.c
index bb346a8249..7c4ab92ecb 100644
--- a/target/riscv/fpu_helper.c
+++ b/target/riscv/fpu_helper.c
@@ -223,7 +223,6 @@ target_ulong helper_fcvt_wu_s(CPURISCVState *env, uint64_t rs1)
     return (int32_t)float32_to_uint32(frs1, &env->fp_status);
 }
 
-#if defined(TARGET_RISCV64)
 uint64_t helper_fcvt_l_s(CPURISCVState *env, uint64_t rs1)
 {
     float32 frs1 = check_nanbox_s(rs1);
@@ -235,7 +234,6 @@ uint64_t helper_fcvt_lu_s(CPURISCVState *env, uint64_t rs1)
     float32 frs1 = check_nanbox_s(rs1);
     return float32_to_uint64(frs1, &env->fp_status);
 }
-#endif
 
 uint64_t helper_fcvt_s_w(CPURISCVState *env, target_ulong rs1)
 {
@@ -247,7 +245,6 @@ uint64_t helper_fcvt_s_wu(CPURISCVState *env, target_ulong rs1)
     return nanbox_s(uint32_to_float32((uint32_t)rs1, &env->fp_status));
 }
 
-#if defined(TARGET_RISCV64)
 uint64_t helper_fcvt_s_l(CPURISCVState *env, uint64_t rs1)
 {
     return nanbox_s(int64_to_float32(rs1, &env->fp_status));
@@ -257,7 +254,6 @@ uint64_t helper_fcvt_s_lu(CPURISCVState *env, uint64_t rs1)
 {
     return nanbox_s(uint64_to_float32(rs1, &env->fp_status));
 }
-#endif
 
 target_ulong helper_fclass_s(uint64_t rs1)
 {
@@ -336,7 +332,6 @@ target_ulong helper_fcvt_wu_d(CPURISCVState *env, uint64_t frs1)
     return (int32_t)float64_to_uint32(frs1, &env->fp_status);
 }
 
-#if defined(TARGET_RISCV64)
 uint64_t helper_fcvt_l_d(CPURISCVState *env, uint64_t frs1)
 {
     return float64_to_int64(frs1, &env->fp_status);
@@ -346,7 +341,6 @@ uint64_t helper_fcvt_lu_d(CPURISCVState *env, uint64_t frs1)
 {
     return float64_to_uint64(frs1, &env->fp_status);
 }
-#endif
 
 uint64_t helper_fcvt_d_w(CPURISCVState *env, target_ulong rs1)
 {
@@ -358,7 +352,6 @@ uint64_t helper_fcvt_d_wu(CPURISCVState *env, target_ulong rs1)
     return uint32_to_float64((uint32_t)rs1, &env->fp_status);
 }
 
-#if defined(TARGET_RISCV64)
 uint64_t helper_fcvt_d_l(CPURISCVState *env, uint64_t rs1)
 {
     return int64_to_float64(rs1, &env->fp_status);
@@ -368,7 +361,6 @@ uint64_t helper_fcvt_d_lu(CPURISCVState *env, uint64_t rs1)
 {
     return uint64_to_float64(rs1, &env->fp_status);
 }
-#endif
 
 target_ulong helper_fclass_d(uint64_t frs1)
 {
-- 
2.29.2


