Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F140542ECAF
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Oct 2021 10:43:23 +0200 (CEST)
Received: from localhost ([::1]:42516 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbIoF-00079z-2N
	for lists+qemu-devel@lfdr.de; Fri, 15 Oct 2021 04:43:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47662)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mbHzR-00044F-Hq
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 03:50:53 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636]:39915)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mbHzP-0005MV-Jh
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 03:50:53 -0400
Received: by mail-pl1-x636.google.com with SMTP id c4so5884414pls.6
 for <qemu-devel@nongnu.org>; Fri, 15 Oct 2021 00:50:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SSJNP+vv9hkPnPQ7w6HIenzoyR0UPNkqfYlq/+WTsUE=;
 b=hcWQGwcFK1JIG02ohkrY8ZeL6wOr4WHziB1ku2Yy8e8t1pIBQtkkHHo207zUvRIVUA
 7vrGxqc1PnApfPAmMsIgFhJ3mbsHOZfvfDnVHnFrLnpRQbpX9E4OUNHM7DNpgkxpIWn8
 DPi/PY8feaxaqw7U37Xy5xXdYNiTY2fRT1oHgCzYR3dXK/N29+hlN5hfPj5E/WqszEra
 YvaNPf5mPVkJxWH23abm2Yb+eIqeztsidmDEmJ8tExPBPP24i0F2tTOV/42kn3ASeKlB
 Gf2F9brEVKAu86yAuYAjck1iGJdcIhjmcYjlrztMYqrp6Xi7Gv11vfv5siCG/EHZzhNP
 hR2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SSJNP+vv9hkPnPQ7w6HIenzoyR0UPNkqfYlq/+WTsUE=;
 b=aCdMRNVOwr8Mb/TCIMLDp6dO5eMnGK3DaOoDWc5MxHO980IZ+4d0zCG/zI91sS27eX
 TaAXv7aWQLBQdjMqbp5PyWN1A8WjRQLYyN0q6ahjj1VLTbBBEEEczocKLhA4y72qz2JV
 CCNzE2nIBx9G2OZHj5wEfSCvm0A6Tfy55DxpPOY9ElhYg165fMaVA8E5R2wEH/LbHjv6
 Ul+nU9BCcuL7DODSpr0jlFwJBjNTn2lNJoVUR/oP+EGUqU0WW9i9y5MlehtH2vgU8RDF
 HsgPJI/0e1c6JCQWx3W9lsJ25hvI+vQuZfHx/6fvS5YVa7n0O/s6EmDE1hXt7svHqgFV
 WOOA==
X-Gm-Message-State: AOAM533Mc7+QSc/bl5qR/cjGS39EIoYVukqW+/+TrfVOA0WZNbv0NULu
 MN4MRUp22VTtHNf/MFWEL09Kbmvs+WL+bduj
X-Google-Smtp-Source: ABdhPJwaMZ5gy8b5WHflTMeO2uCTeWiF84cDBt77nO7eVWHizO4WqqrWqRIRuJv6RKSwVoUkDkCtdw==
X-Received: by 2002:a17:902:d887:b0:13e:e77:7a21 with SMTP id
 b7-20020a170902d88700b0013e0e777a21mr9629987plz.66.1634284250187; 
 Fri, 15 Oct 2021 00:50:50 -0700 (PDT)
Received: from localhost.localdomain (123-193-74-252.dynamic.kbronet.com.tw.
 [123.193.74.252])
 by smtp.gmail.com with ESMTPSA id z13sm4271680pfq.130.2021.10.15.00.50.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Oct 2021 00:50:49 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [PATCH v8 67/78] target/riscv: rvv-1.0: trigger illegal instruction
 exception if frm is not valid
Date: Fri, 15 Oct 2021 15:46:15 +0800
Message-Id: <20211015074627.3957162-75-frank.chang@sifive.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211015074627.3957162-1-frank.chang@sifive.com>
References: <20211015074627.3957162-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=frank.chang@sifive.com; helo=mail-pl1-x636.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Frank Chang <frank.chang@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Frank Chang <frank.chang@sifive.com>

If the frm field contains an invalid rounding mode (101-111),
attempting to execute any vector floating-point instruction, even
those that do not depend on the rounding mode, will raise an illegal
instruction exception.

Call gen_set_rm() with DYN rounding mode to check and trigger illegal
instruction exception if frm field contains invalid value at run-time
for vector floating-point instructions.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/insn_trans/trans_rvv.c.inc | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index ebdea84fef9..09ae8fad90a 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -2373,6 +2373,10 @@ static bool do_opfv(DisasContext *s, arg_rmr *a,
                     int rm)
 {
     if (checkfn(s, a)) {
+        if (rm != RISCV_FRM_DYN) {
+            gen_set_rm(s, RISCV_FRM_DYN);
+        }
+
         uint32_t data = 0;
         TCGLabel *over = gen_new_label();
         gen_set_rm(s, rm);
@@ -2458,6 +2462,8 @@ static bool trans_vfmv_v_f(DisasContext *s, arg_vfmv_v_f *a)
         require_rvf(s) &&
         vext_check_isa_ill(s) &&
         require_align(a->rd, s->lmul)) {
+        gen_set_rm(s, RISCV_FRM_DYN);
+
         TCGv_i64 t1;
 
         if (s->vl_eq_vlmax) {
@@ -2539,6 +2545,10 @@ static bool opfv_widen_check(DisasContext *s, arg_rmr *a)
 static bool trans_##NAME(DisasContext *s, arg_rmr *a)              \
 {                                                                  \
     if (opfv_widen_check(s, a)) {                                  \
+        if (FRM != RISCV_FRM_DYN) {                                \
+            gen_set_rm(s, RISCV_FRM_DYN);                          \
+        }                                                          \
+                                                                   \
         uint32_t data = 0;                                         \
         static gen_helper_gvec_3_ptr * const fns[2] = {            \
             gen_helper_##HELPER##_h,                               \
@@ -2626,6 +2636,10 @@ static bool opfv_narrow_check(DisasContext *s, arg_rmr *a)
 static bool trans_##NAME(DisasContext *s, arg_rmr *a)              \
 {                                                                  \
     if (opfv_narrow_check(s, a)) {                                 \
+        if (FRM != RISCV_FRM_DYN) {                                \
+            gen_set_rm(s, RISCV_FRM_DYN);                          \
+        }                                                          \
+                                                                   \
         uint32_t data = 0;                                         \
         static gen_helper_gvec_3_ptr * const fns[2] = {            \
             gen_helper_##HELPER##_h,                               \
@@ -2667,6 +2681,10 @@ static bool opxfv_narrow_check(DisasContext *s, arg_rmr *a)
 static bool trans_##NAME(DisasContext *s, arg_rmr *a)              \
 {                                                                  \
     if (opxfv_narrow_check(s, a)) {                                \
+        if (FRM != RISCV_FRM_DYN) {                                \
+            gen_set_rm(s, RISCV_FRM_DYN);                          \
+        }                                                          \
+                                                                   \
         uint32_t data = 0;                                         \
         static gen_helper_gvec_3_ptr * const fns[3] = {            \
             gen_helper_##HELPER##_b,                               \
@@ -3137,6 +3155,8 @@ static bool trans_vfmv_f_s(DisasContext *s, arg_vfmv_f_s *a)
     if (require_rvv(s) &&
         require_rvf(s) &&
         vext_check_isa_ill(s)) {
+        gen_set_rm(s, RISCV_FRM_DYN);
+
         unsigned int ofs = (8 << s->sew);
         unsigned int len = 64 - ofs;
         TCGv_i64 t_nan;
@@ -3161,6 +3181,8 @@ static bool trans_vfmv_s_f(DisasContext *s, arg_vfmv_s_f *a)
     if (require_rvv(s) &&
         require_rvf(s) &&
         vext_check_isa_ill(s)) {
+        gen_set_rm(s, RISCV_FRM_DYN);
+
         /* The instructions ignore LMUL and vector register group. */
         TCGv_i64 t1;
         TCGLabel *over = gen_new_label();
-- 
2.25.1


